/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-0: %run %run_opt %output %run_utest_opt

@Test
class MySimpleTest {

    //无 @TestCase 修饰非测试函数
    func test1(): Unit {
        println("hi1")
    }

    // TestCase 跟 Bench 可以同时修饰一个函数。此时函数既可以为单个测试用例，也可以作为 Benchmark 被多次执行，通过 --bench 打开 Bench 执行模式
    @Bench
    @TestCase
    //跳过
    @Skip
    func test2(): Unit {
        println("hi2")
    }

    // 最简单的 Benchmark 用例函数，输出 Benchmark 测试结果数据。
    @Bench
    //不跳过
    @Skip[false]
    func test3(): Unit {
        println("hi3")
    }

    @TestCase
    func test4(): Unit {
        println("hi4")
    }
}
// case from unittest_lib.md, if it's updated, pls update unittest_lib.md as well.
