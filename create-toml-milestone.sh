#!/usr/bin/env bash

VERSION=1.0.0-M9

buildpacks="\
build-system-buildpack,https://repo.spring.io/libs-milestone-local/org/cloudfoundry/buildsystem/org.cloudfoundry.buildsystem/${VERSION}/org.cloudfoundry.buildsystem-${VERSION}.tgz \
jvm-application-buildpack,https://repo.spring.io/libs-milestone-local/org/cloudfoundry/jvmapplication/org.cloudfoundry.jvmapplication/${VERSION}/org.cloudfoundry.jvmapplication-${VERSION}.tgz \
openjdk-buildpack,https://repo.spring.io/libs-milestone-local/org/cloudfoundry/openjdk/org.cloudfoundry.openjdk/${VERSION}/org.cloudfoundry.openjdk-${VERSION}.tgz \
"

cp java-buildpack-group/builder.toml ./

for bp in ${buildpacks};do
  id=$(echo ${bp} | awk -F, '{print $1}')
  url=$(echo ${bp} | awk -F, '{print $2}')
  sed -i.bak "s|${id}|${url}|g" builder.toml
done


sed -i.bak "s/version = \"latest\"/version = \"${VERSION}\"/g" builder.toml

rm -f builder.toml.bak

