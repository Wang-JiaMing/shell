# 差异文件抽取脚本
##### 前言
开发该脚本是由于linux下没有找到类似beyond compare文件对比工具，所以特意用bash写了一个根据时间偏移的方法找出差异文件并进行打包压缩。该脚本最终可以达到对服务器上的class文件和本地的class的时间差进行增量打包，并无缝部署(会自动生成对应class的路径文件夹)，不需要传统的把修改过的class一个一个复制粘贴。

##### 使用方法
- 在diffFile.sh文件，ß需要修改workSpacePath变量和filePath变量
>- workSpacePath是class文件输出目录，java中可以看着classes
>- filePath是差异打包输出路径
- 在终端中输入sh ./diffFile.sh -时间偏移量（填入本地和服务器最后部署时间的时间差天数）
>例如本地和服务器相差10天
>- sh ./diffFile.sh -10

##### 需要注意的地方
- 注意，windows下diffFile.sh的workSpacePath最后结尾需要用\结束
- windows下使用shell脚本可以使用Git Bash Here，具体使用方式可以自行百度、google