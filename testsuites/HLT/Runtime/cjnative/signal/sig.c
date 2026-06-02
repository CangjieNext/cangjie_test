/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <signal.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include "sigcxx.h"

void signal_handler(int sig)
{
    printf("signal success %d\n", sig);
}

int foo()
{
    if (signal(SIGINT, signal_handler) == SIG_ERR) {
        perror("signal");
        exit(EXIT_FAILURE);
    }
    if (raise(SIGINT) != 0) {
        perror("raise");
        exit(EXIT_FAILURE);
    }
    foocxx();
}