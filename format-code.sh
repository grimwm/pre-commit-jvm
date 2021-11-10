#!/usr/bin/env bash

VERSION=1.12.0
JAR_FILE="google-java-format-${VERSION}-all-deps.jar"
URL="https://github.com/google/google-java-format/releases/download/v${VERSION}/${JAR_FILE}"
JAVA_VERSION=$(java -version 2>&1 | head -1 | sed 's/.* version "//g; s/".*//g; s/\..*//g;')
CACHE_DIR="${HOME}/.cache/pre-commit-jvm/google-java-format"

mkdir -p "${CACHE_DIR}"
pushd "${CACHE_DIR}"
if [ ! -f "${JAR_FILE}" ]
then
  curl -s -LJO "${URL}"
  chmod 0755 ${JAR_FILE}
fi
popd

# Per https://github.com/google/google-java-format#jdk-16
if [[ "${JAVA_VERSION}" -ge 16 ]] ; then
  JAVA_FLAGS='--add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED'
  JAVA_FLAGS="${JAVA_FLAGS} --add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED"
  JAVA_FLAGS="${JAVA_FLAGS} --add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED"
  JAVA_FLAGS="${JAVA_FLAGS} --add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED"
  JAVA_FLAGS="${JAVA_FLAGS} --add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED"
fi
java ${JAVA_FLAGS} -jar "${CACHE_DIR}/${JAR_FILE}" --replace "$@"
