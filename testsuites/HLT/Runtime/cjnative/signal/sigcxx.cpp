/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <csignal>
#include <cstdio>
#include <unistd.h>
#include <cstdlib>
#include "sigcxx.h"

#ifdef __cplusplus
extern "C" {
#endif

void cpp_signal_handler(int sig)
{
    printf("sigaction success %d\n", sig);
    exit(0);
}

int foocxx() 
{
    // // 使用 sigaction() 设置 SIGINT 信号的处理函数
    struct sigaction sa;
    sa.sa_handler = cpp_signal_handler;
    sigemptyset(&sa.sa_mask); // 清空信号掩码
    sa.sa_flags = 0;
    sigaction(SIGINT, &sa, nullptr);

    raise(SIGINT);

}

#ifdef __cplusplus
}
#endif