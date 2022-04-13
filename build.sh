#!/bin/bash
#echo hi 
TAG_NAME=$(git describe --abbrev=0 --tags)
UAT="uat"
result=$(echo $TAG_NAME | grep "${UAT}")
echo $result
npm install
npm run build
if [[ "" != $result ]]
then
    echo "uat环境部署"
	rm -rf admin-frontend-uat/
	echo "删除文件夹"
    cp -rf dist/ admin-frontend-uat/
	echo "复制文件夹"
    rsync -avz --password-file=/data/rsync_deploy.password admin-frontend-uat deploy@10.111.202.70::lpdmgr_deploy
	echo "传送文件夹"
else
    echo "sit环境部署"
	rm -rf admin-frontend/
	echo "删除文件夹"
    cp -rf dist/ admin-frontend/
	echo "复制文件夹"
    rsync -avz --password-file=/data/rsync_deploy.password admin-frontend deploy@10.111.202.70::lpdmgr_deploy
	echo "传送文件夹"
fi
