/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./utils
// DEPENDENCE: ./line_number_utils
// EXEC: %compiler %cmp_opt -p utils --mock=on %compile_lib_opt --output p1.%middle
// EXEC: %compiler %cmp_opt -p line_number_utils --mock=on %compile_lib_opt --output p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import utils.*
import line_number_utils.*
import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

interface SampleIterface {
    func str(): String
}

@Test
public class InterfaceTest {
    private let e = mock<SampleIterface>()

    @TestCase
    func testStubInterface(): Unit {
        success {
            @On(e.str()).returns("a")
            @Assert(e.str(), "a")
        }
    }

    @TestCase
    func testVerifyInterface(): Unit {
        success {
            @On(e.str()).returns("a")
            @Assert(e.str(), "a")
            Verify.that(@Called(e.str()).once())
        }
    }
}
