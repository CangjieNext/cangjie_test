/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

int main()
{
    int domains[] = {AF_INET, AF_INET6, AF_UNIX, AF_NETLINK, AF_PACKET};
    int types[] = {SOCK_STREAM, SOCK_DGRAM, SOCK_RAW, SOCK_SEQPACKET};
    int protocols[] = {4, 41, IPPROTO_ICMP, IPPROTO_TCP, IPPROTO_UDP, 255};

    int i, j, k;
    int count = 0;
    for (i = 0; i < sizeof(domains) / sizeof(domains[0]); i++) {
        for (j = 0; j < sizeof(types) / sizeof(types[0]); j++) {
            for (k = 0; k < sizeof(protocols) / sizeof(protocols[0]); k++) {
                int sockfd = socket(domains[i], types[j] | SOCK_NONBLOCK | SOCK_CLOEXEC, protocols[k]);
                if (sockfd < 0) {
                    count++;
                }
            }
        }
    }
    printf("%d", count);
    return 0;
}