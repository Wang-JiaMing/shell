#!/bin/bash
#
#作者:wjm
#作用：传入偏移时间量
#      从而根据偏移量查找编译后有改动过对的文件从而检出压缩
#      达到增量打包的功能

workSpacePath='/home/wjm/workspace/out/gdyc'
filePath="/home/wjm/workspace/out/`date +'%Y%m%d%H%M%S'`"

if [ ! -d "${filePath}" ]; then
    mkdir "${filePath}"
    echo "[`date +'%Y-%m-%d %H:%M:%S'`] 不存在${filePath}目录，进行创建" > ${filePath}".log"
fi
echo "##############################" >> ${filePath}".log"
for dirList in `find ${workSpacePath} -type d -mtime $1 -printf "%d %p\n"| sort` 
do
 if [ -d "${dirList}" ]; then
    echo "[`date +'%Y-%m-%d %H:%M:%S'`] 创建文件夹：${filePath}${dirList:28}" >> ${filePath}".log" 
    mkdir -p "${filePath}${dirList:28}"     
 fi
done
echo "##############################" >> ${filePath}".log"
for fileList in `find ${workSpacePath} -type f -mtime $1 -printf "%p\n"| sort`
do
   echo "[`date +'%Y-%m-%d %H:%M:%S'`] 复制${fileList}到${filePath}${fileList:28}" >> ${filePath}".log"
   cp ${fileList} ${filePath}${fileList:28}
done

echo "[`date +'%Y-%m-%d %H:%M:%S'`] 进行压缩" >> ${filePath}".log"
tar -czvf ${filePath}".tar.gz" ${filePath}
echo "[`date +'%Y-%m-%d %H:%M:%S'`] 删除${filePath}" >> ${filePath}".log"
rm -r ${filePath}
echo "[`date +'%Y-%m-%d %H:%M:%S'`] 完成" >> ${filePath}".log"
