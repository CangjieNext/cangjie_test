// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test

internal import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TestCCC {
    //无 @TestCase 修饰非测试函数
    func sayhi1(): Unit {
        println("hi1")
    }

    @Bench[10]
    //跳过
    @Skip[true]
    func sayhi2(): Unit {
        return
    }
}
