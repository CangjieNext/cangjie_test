// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tags_01_argpass

import std.unittest.*
import std.unittest.testmacro.*

@Test
@Tag[TagA]
class SomeTestClassA {
    @TestCase
    func caseAA() {
        @Assert(1, 1)
    }

    @TestCase
    @Tag[TagC]
    func caseAC() {
        @Assert(1, 2)
    }
}

@Test
@Tag[TagA, TagB]
func topfuncA() {
    @Assert(1, 1)
}

@Test
@Tag[TagB, TagC]
func topfuncB() {
    @Assert(1, 2)
}

@Test
@Tag[TagB]
func topfuncC() {
    @Assert(1, 1)
}
