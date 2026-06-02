// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test.koo_test

internal import std.unittest.*
import std.unittest.testmacro.*
import pro0.zoo.*
import test.koo.*

@Test
public class TestK {
    @TestCase
    func sayhi(): Unit {
        @Assert(concatk("1", "2"), "12")
        @Assert(concatk("1", "3"), "13")
    }
}
