---
title: 安装nodejs
date: 2019-10-03
tags:
 - nodejs 
 - npm
categories:
 - 笔记
---

## 安装nodejs & npm 
```sh
$ wget https://nodejs.org/dist/v10.9.0/node-v10.9.0-linux-x64.tar.xz    // 下载
$ tar xf  node-v10.9.0-linux-x64.tar.xz       // 解压
$ cd node-v10.9.0-linux-x64/                  // 进入解压目录
$ ./bin/node -v                               // 执行node命令 查看版本
v10.9.0
```

   解压文件的 bin 目录底下包含了 node、npm 等命令，我们可以使用 ln 命令来设置软连接：

```sh
$ ln -s /usr/software/nodejs/bin/npm   /usr/local/bin/ 
$ ln -s /usr/software/nodejs/bin/node   /usr/local/bin/
```

