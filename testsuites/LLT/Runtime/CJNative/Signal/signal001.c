// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include "Cangjie.h"

void handle_SIGUSR2(int sig) {
    printf("signal SIGUSR2\n");
}

bool handle_1(int sig) {
    printf("signal chain1\n");
    return false;
}

bool handle_2(int sig) {
    printf("signal chain2\n");
    return false;
}

void handle_abort(int sig) {
    abort();
}

void cfunc1() {
    CJ_MCC_SignalRegister(SIGUSR2, handle_SIGUSR2);
    CJ_MCC_SignalRaise(SIGUSR2);
    printf("reg succ\n");

    pid_t pid = getpid();
    CJ_MCC_SignalKill(pid, SIGUSR2);
    printf("kill succ\n");

    sigset_t mask;
    sigemptyset(&mask);
    sigaddset(&mask, SIGUSR2);
    CJ_MCC_SignalProcMask(SIG_BLOCK, &mask, NULL);
    CJ_MCC_SignalRegister(SIGUSR2, handle_abort);
    CJ_MCC_SignalRaise(SIGUSR2);
    printf("mask succ\n");

    CJ_MCC_SignalRegister(SIGUSR2, handle_SIGUSR2);
    CJ_MCC_SignalProcMask(SIG_UNBLOCK, &mask, NULL);
    CJ_MCC_SignalRaise(SIGUSR2);
    printf("reOk succ\n");

    sigset_t mask1;
    struct SignalAction sa1;
    sa1.saSignalAction= handle_1;
    sa1.scMask = mask1;
    sa1.scFlags = SA_SIGINFO | SA_ONSTACK;

    struct SignalAction sa2;
    sa2.saSignalAction= handle_2;
    sa2.scMask = mask1;
    sa2.scFlags = SA_SIGINFO | SA_ONSTACK;

    CJ_MCC_AddSignalHandler(SIGUSR2, &sa1);
    CJ_MCC_AddSignalHandler(SIGUSR2, &sa2);
    CJ_MCC_SignalRaise(SIGUSR2);
    printf("siganlChainAdd succ\n");

    sleep(10);

    CJ_MCC_RemoveSignalHandler(SIGUSR2, sa2.saSignalAction);
    CJ_MCC_SignalRaise(SIGUSR2);
    printf("siganlChainRemove succ\n");
}
