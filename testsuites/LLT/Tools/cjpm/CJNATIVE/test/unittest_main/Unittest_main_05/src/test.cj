// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test

internal import std.unittest.*
import std.unittest.testmacro.*

func concat(s1: String, s2: String): String {
    return s1 + s2
}

@Test
public class TestZZZ {
    @TestCase
    func sayhi0(): Unit {
        @Assert(concat("1", "2"), "12")
        @Assert(concat("1", "3"), "13")
    }
}

@Test
public class TestCCC {

    //无 @TestCase 修饰非测试函数
    func sayhi1(): Unit {
        println("hi1")
    }

    //函数修饰宏功能无顺序
    @Bench[10]
    @TestCase
    //跳过
    @Skip
    func sayhi2(): Unit {
        println("hi2")
    }

    @Bench[10]
    @TestCase
    //不跳过
    @Skip[false]
    func sayhi3(): Unit {
        println("hi3")
    }
}
