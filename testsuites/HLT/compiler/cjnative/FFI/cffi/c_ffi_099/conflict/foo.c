/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>

static inline void println(char* msg)
{
    printf("%s\n", msg);
}

/**
 * conflict_5.cj
 */
void test_global_init()
{
    println("hello");
}

/**
 * conflict_6.cj
 */
void for_keeping_some_types()
{
    println("hello");
}

/**
 * conflict_7.cj
 */
void has_invoke_core_global_init()
{
    println("hello");
}

void has_invoke_test_global_init()
{
    println("world");
}

/**
 * conflict_8.cj
 */
void CCC_except_table0()
{
    println("alpha");
}

void CCC_except_table1()
{
    println("beta");
}

void CCC_except_table2()
{
    println("gamma");
}

void CCC_except_table3()
{
    println("delta");
}

/**
 * conflict_9.cj
 */
void MRT_NewSem()
{
    println("hello");
}

void MCC_ThrowException()
{
    println("wow");
}
