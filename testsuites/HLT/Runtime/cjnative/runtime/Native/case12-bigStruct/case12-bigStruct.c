/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
typedef struct Tag {
    long long a0;
    long long a2;
    int a3;
    int a4;
    long long a5;
    int a6;
    int a7;
    long long a8;
    int a9;
    int a10;
} RcdTest;

RcdTest C_Func(RcdTest A1, RcdTest A2, RcdTest A3, RcdTest A4, RcdTest A5, RcdTest A6, RcdTest A7, RcdTest A8,
               RcdTest A9, RcdTest A10)
{
    printf("C_Func-A1: a0 = %lld, a2 = %lld, a3 = %d, a4 = %d, a5 = %lld, a6 = %d, a7 = %d, a8 = %lld, a9 = %d, a10 = "
           "%d\n",
           A1.a0, A1.a2, A1.a3, A1.a4, A1.a5, A1.a6, A1.a7, A1.a8, A1.a9, A1.a10);
    printf("C_Func-A2: a0 = %lld, a2 = %lld, a3 = %d, a4 = %d, a5 = %lld, a6 = %d, a7 = %d, a8 = %lld, a9 = %d, a10 = "
           "%d\n",
           A2.a0, A2.a2, A2.a3, A2.a4, A2.a5, A2.a6, A2.a7, A2.a8, A2.a9, A2.a10);
    printf("C_Func-A3: a0 = %lld, a2 = %lld, a3 = %d, a4 = %d, a5 = %lld, a6 = %d, a7 = %d, a8 = %lld, a9 = %d, a10 = "
           "%d\n",
           A3.a0, A3.a2, A3.a3, A3.a4, A3.a5, A3.a6, A3.a7, A3.a8, A3.a9, A3.a10);
    printf("C_Func-A4: a0 = %lld, a2 = %lld, a3 = %d, a4 = %d, a5 = %lld, a6 = %d, a7 = %d, a8 = %lld, a9 = %d, a10 = "
           "%d\n",
           A4.a0, A4.a2, A4.a3, A4.a4, A4.a5, A4.a6, A4.a7, A4.a8, A4.a9, A4.a10);
    printf("C_Func-A5: a0 = %lld, a2 = %lld, a3 = %d, a4 = %d, a5 = %lld, a6 = %d, a7 = %d, a8 = %lld, a9 = %d, a10 = "
           "%d\n",
           A5.a0, A5.a2, A5.a3, A5.a4, A5.a5, A5.a6, A5.a7, A5.a8, A5.a9, A5.a10);
    printf("C_Func-A6: a0 = %lld, a2 = %lld, a3 = %d, a4 = %d, a5 = %lld, a6 = %d, a7 = %d, a8 = %lld, a9 = %d, a10 = "
           "%d\n",
           A6.a0, A6.a2, A6.a3, A6.a4, A6.a5, A6.a6, A6.a7, A6.a8, A6.a9, A6.a10);
    printf("C_Func-A7: a0 = %lld, a2 = %lld, a3 = %d, a4 = %d, a5 = %lld, a6 = %d, a7 = %d, a8 = %lld, a9 = %d, a10 = "
           "%d\n",
           A7.a0, A7.a2, A7.a3, A7.a4, A7.a5, A7.a6, A7.a7, A7.a8, A7.a9, A7.a10);
    printf("C_Func-A8: a0 = %lld, a2 = %lld, a3 = %d, a4 = %d, a5 = %lld, a6 = %d, a7 = %d, a8 = %lld, a9 = %d, a10 = "
           "%d\n",
           A8.a0, A8.a2, A8.a3, A8.a4, A8.a5, A8.a6, A8.a7, A8.a8, A8.a9, A8.a10);
    printf("C_Func-A9: a0 = %lld, a2 = %lld, a3 = %d, a4 = %d, a5 = %lld, a6 = %d, a7 = %d, a8 = %lld, a9 = %d, a10 = "
           "%d\n",
           A9.a0, A9.a2, A9.a3, A9.a4, A9.a5, A9.a6, A9.a7, A9.a8, A9.a9, A9.a10);
    printf("C_Func-A10: a0 = %lld, a2 = %lld, a3 = %d, a4 = %d, a5 = %lld, a6 = %d, a7 = %d, a8 = %lld, a9 = %d, a10 = "
           "%d\n",
           A10.a0, A10.a2, A10.a3, A10.a4, A10.a5, A10.a6, A10.a7, A10.a8, A10.a9, A10.a10);

    return A10;
}
