#!/bin/bash

cd $(dirname $0)
cd .. # 退出到根目录
echo $[$(date +%s%N)/1000000] 

PROTO_GEN_PATH="front/packages/proto/lib/proto"

function clearAll() {
    rm -rf $PROTO_GEN_PATH
}

function protocAll() {
    for file in $1/*
    do
        if test -d "$file"
        then
            protocAll ${file}
        else
            if test -f "$file" 
            then
                filename=$(basename -- "$file")
                extension="${filename##*.}"
                # category_start=${file#proto/}
                # category=${category_start%$filename}

                if [[ $extension == "proto" ]]
                then
                    # protoc 会自动创建层级目录，所以不用自己在out路径上处理了
                    # genPath=$PROTO_GEN_PATH/$category
                    genPath=$PROTO_GEN_PATH
                    if [ ! -d $genPath ]; then
                        mkdir -p $genPath
                    fi
                    protoc  -I=proto --dart_out=$genPath  ${file} --experimental_allow_proto3_optional
                fi
            fi
        fi
    done
}

clearAll
protocAll "proto"
