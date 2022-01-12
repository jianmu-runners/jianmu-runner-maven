# jianmu-runner-maven

#### 介绍
用于替换maven配置，增加nexus配置，便于java项目的ci流程

#### 输入参数
```
JIANMU_WORKSPACE: mvn执行目录
JIANMU_MVN_ACTION: mvn执行的生命周期
JIANMU_EXTRA_ARGE: 构建时附加的额外参数
JIANMU_VC_POM_DIR: 获取artifactId和版本信息的pom文件的所在模块的相对路径
```

##### maven nexus参数
```
JIANMU_MAVEN_PUBLIC_ID
JIANMU_MAVEN_PUBLIC_URL
JIANMU_NEXUS_USERNAME
JIANMU_NEXUS_PASSWORD
```

##### pom文件中可选参数
```
JIANMU_MAVEN_RELEASE_ID
JIANMU_MAVEN_RELEASE_URL
JIANMU_MAVEN_SNAPSHOT_ID
JIANMU_MAVEN_SNAPSHOT_URL

JIANMU_DOCKER_USERNAME
JIANMU_DOCKER_PASSWORD
JIANMU_IMAGE_NAME
JIANMU_IMAGE_TAG
```

#### 输出参数
```
artifactId: 项目artifactID
version: 项目版本
```

#### 构建docker镜像
```
# 创建docker镜像
docker build -f dockerfile/Dockerfile -t jianmurunner/maven_build:${version} .

# 上传docker镜像
docker push jianmurunner/maven_build:${version}
```

#### 用法
maven build
```
docker run --rm \
  -e JIANMU_WORKSPACE=xxx \
  -e JIANMU_MVN_ACTION=xxx \
  -e JIANMU_EXTRA_ARGE=xxx \
  -e JIANMU_VC_POM_DIR=xx/xx \
  -v /${workspace}/${project_dir}:/tmp/dist \
  -v /${workspace}/result_file:/tmp/result_file \
  jianmurunner/maven_build:${version} \
  mvn_start
```
