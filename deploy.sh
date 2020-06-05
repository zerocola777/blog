#!/usr/bin/env sh
# 确保脚本抛出遇到的错误
set -e
npm run build # 生成静态文件
cd docs/.vuepress/dist # 进入生成的文件夹

# deploy to github
echo 'blog.zerodegree.top' > CNAME
if [ -z "$GITHUB_TOKEN" ]; then
  msg='deploy'
  githubUrl=git@github.com:zerocola777/blog.git
else
  msg='来自github action的自动部署'
  githubUrl=https://zerocola777:${GITHUB_TOKEN}@github.com/zerocola777/blog.git
  git config --global user.name "zerodegree"
  git config --global user.email "77849093@qq.com"
fi
git init
git add -A
git commit -m "${msg}"
git push -f $githubUrl master:gh-pages # 推送到github

# deploy to coding
echo 'www.zerodegree.top\nzerodegree.top' > CNAME  # 自定义域名
if [ -z "$CODING_TOKEN" ]; then  # -z 字符串 长度为0则为true；$CODING_TOKEN来自于github仓库`Settings/Secrets`设置的私密环境变量
   codingUrl=git@e.coding.net:zerodegree/zerodegree.git
else
   codingUrl=https://VzpWUthwxq:${CODING_TOKEN}@e.coding.net/zerodegree/zerodegree.git #注意！！！这里需要使用coding提供的个人令牌的用户名和token
 fi
git add -A
git commit -m "${msg}"
git push -f $codingUrl master # 推送到coding

cd -
rm -rf docs/.vuepress/dist