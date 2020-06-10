---
title: VMWARE笔记
date: 2020-06-10
tags:
 - vm
categories:
 - 笔记
---


## VMWARE 虚拟机共享文件夹

```shell
$ /usr/bin/vmhgfs-fuse .host:/foo /tmp/foo -o subtype=vmhgfs-fuse,allow_other
```	
将名为 foo 的共享装载到 /tmp/foo

::: danger 重启之后共享目录不见的问题?
 在/root/.bashrc 中添加上述命令即可
:::





