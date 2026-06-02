/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>

int main()
{
    gid_t list[100];
    int x;
    x = getgroups(0, list);
    getgroups(x, list);
    for(int i = 0; i < x; i++) {
        printf("%d:%d\n", i, list[i]);
    }
    return 0;
}
