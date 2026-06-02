// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test

import std.env.*

@Test
public class TestM {
    @TestCase
    func assertEnv(): Unit {
        let v = getVariable("DYLD_LIBRARY_PATH") ?? @Fail("No library path provided")
        @Expect(v.contains("check_me_empty_01"))
    }
}
