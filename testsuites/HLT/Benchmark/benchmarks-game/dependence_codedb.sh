#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

#全局变量
PATH_CUR=$(cd $(dirname $0);pwd)
FILE_LOG=${PATH_CUR}/codedb.log
FILE_SUMMARY=${PATH_CUR}/summary.log

#多线程变量,默认1 
NUM_THREAD=1
  
#错误码
CPL_OK=0               #状态正常
CPL_Error_Prepare=101  #预置状态异常，安装依赖包等
CPL_Error_Config=102   #Config异常
CPL_Error_Comp=103     #编译状态异常
CPL_Error_Check=104    #单元测试状态异常
CPL_Error_Run=105      #APP用例状态异常
CPL_Error_Other=110    #其他异常
 
#控制开关变量
IS_PREPARE="NO"        #prepare,默认NO
IS_CONFIG="NO"         #config,默认NO
IS_COMPILE="NO"        #Compile,默认NO
IS_RUN="NO"            #Run,默认NO
IS_PRINT="NO"          #打印日志到屏幕,,默认NO

#使用帮助
function usage(){
    echo "    Usage: bash build_codedh.sh -h
    Optionis:
    -h            help
    -a            prepare,config,compile and run
    -p            only prepare,installing dependent packages
    -g            only config
    -c            only compile 
    -r            only check  
    -j <num>      compile with multi thread
    -n            cleanup
    -v            print log	   
"
}

#日志处理
#INOF，DEBUG，WARNING，ERROR
function print_log(){
    echo "$1:$2"
}

#预置条件
#Step2：安装对应的依赖包和配置环境	
#Step3：异常处理，有异常退出（强制）
function process_prepare(){
    print_log "INFO" "Installing dependent packages: nothing to be done" 
    return ${CPL_OK}
}

#Step1：Config重新生成配置文件
#Step2：异常处理，有异常退出
function process_config(){
    #Step1:解压代码,
    print_log "INFO" "Config to generate new makefile"
    cd ${PATH_CUR}
    tar -xvf gmp-6.2.0.tar.xz
    cd gmp-6.2.0
    ./configure --prefix=${PATH_CUR}/gmp-6.2.0
    if [ $? -eq ${CPL_OK} ]; then
        print_log "INFO" "Config success"|tee -a ${SUMMARY_FILE}
    else
        print_log "ERROR" "Config fail"|tee -a ${SUMMARY_FILE}
        return ${CPL_Error_Prepare}
    fi
    return ${CPL_OK}
}

#Step1：编译
#Step2：异常处理，有异常退出
function process_compile(){
    #Step2 编译
    print_log "INFO" "Compile codedb"
    cd ${PATH_CUR}/gmp-6.2.0
    make -j ${NUM_THREAD}
    make install
    if [ $? -eq ${CPL_OK} ]; then
        print_log "INFO" "Compile codedb success"|tee -a ${FILE_SUMMARY}
    else
        print_log "ERROR" "Compile codedb fail"|tee -a ${FILE_SUMMARY}
        return ${CPL_Error_Comp}
    fi
    return ${CPL_OK}
}
#检查是否安装成功
function process_run(){
    #Step1：运行Unit Test
    print_log "INFO" "Run check: nothing to be done" 
    return ${CPL_OK}
}

#后置条件，清理测试环境
function cleanup(){
    if [ X"$IS_KEEP" = X"YES" ]; then
        return 
    fi    
    print_log "INFO" "cleanup" 
    cd ${PATH_CUR}
    rm -rf gmp-6.2.0
    rm -rf codedb.log summary.log
}
#main函数入口
function main(){
    #打印关键的路径	
    print_log "INFO" "Current path is ${PATH_CUR}" 
    print_log "INFO" "Detail log file is ${FILE_LOG}" |tee -a ${FILE_SUMMARY}
    print_log "INFO" "Summary file is ${FILE_SUMMARY}" 
    
    #预置环境
    if [ X"${IS_PREPARE}" = X"YES" ]; then
        process_prepare
        local stat_step=$?
        if [ ${stat_step} -ne ${CPL_OK} ]; then
            exit ${stat_step}   
        fi   
    fi

    #config
    if [ X"${IS_CONFIG}" = X"YES" ]; then
        process_config
        local stat_step=$?
        if [ ${stat_step} -ne ${CPL_OK} ]; then
            exit ${stat_step}   
        fi
    fi

    #编译代码
    if [ X"${IS_COMPILE}" = X"YES" ]; then	
        process_compile
        local stat_step=$?
        if [ ${stat_step} -ne ${CPL_OK} ]; then
            exit ${stat_step}   
        fi
    fi
    
    #运行检查	
    if [ X"${IS_RUN}" = X"YES" ]; then	
        process_run
        local stat_step=$?
        if [ ${stat_step} -ne ${CPL_OK} ]; then
            exit ${stat_step}   
        fi
    fi
}

#输入参数定义和梳理
INPUT_STRING=`getopt -o hapgcrj:nv -- $@`
if [ $# = 0 -o $? -ne 0 ]; then
    usage; exit 0;
fi
eval set -- "$INPUT_STRING"
while [ $# -gt 0 ]  #{
do
    case "$1" in
    -h) usage; exit 0;;
    -a) IS_PREPARE="YES"; IS_CONFIG="YES"; IS_COMPILE="YES"; IS_RUN="YES"; shift;;
    -p) IS_PREPARE="YES"; shift;;
    -g) IS_CONFIG="YES"; shift;;
    -c) IS_COMPILE="YES"; shift;;
    -r) IS_RUN="YES"; shift;;
    -j) NUM_THREAD=${2}; shift 2;;
    -n) cleanup; shift ;;
    -v) IS_PRINT="YES"; shift;;
    --) shift;;
    * )
        usage; exit 0;;
    esac
done
#}

print_log "INFO" "Begin to build codedb" > ${FILE_LOG}
print_log "INFO" "Begin to build codedb" > ${FILE_SUMMARY}

if [ X"$IS_PRINT" = X"YES" ]; then
    main 2>&1|tee -a ${FILE_LOG}
    stat_step=${PIPESTATUS[0]} 
else
    main >> ${FILE_LOG} 2>&1
    stat_step=$?
fi
exit ${stat_step}
