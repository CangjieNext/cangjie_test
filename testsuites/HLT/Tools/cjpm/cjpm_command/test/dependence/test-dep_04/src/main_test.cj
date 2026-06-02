/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

internal import std.unittest.*
internal import devDep0.*
internal import devDep1.*

@Test
public class TestM {
    @TestCase
    func addTest(): Unit {
        @Assert(add(12, 34), 46)
        @Assert(mul(2, 2), 4)
    }
}
