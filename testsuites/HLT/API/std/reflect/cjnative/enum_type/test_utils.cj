/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: utils enums
// (!(target_mac | target_ios)) EXEC: %compiler %cmp_opt %compile_lib_opt -p utils
// (!(target_mac | target_ios)) EXEC: %compiler %cmp_opt %compile_lib_opt -p enums
// (!(target_mac | target_ios)) EXEC: %compiler %cmp_opt %f -L . -lutils -lenums %cmp_utest_opt -o %output
// (!(target_mac | target_ios)) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package pkg

import enums.*
import utils.*
import std.reflect.*
import std.collection.*
import std.sort.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

public struct S {
    public S(public let v: Int64) {}
}

public enum E {
    | A(Int64)
    | B
    | C(S)
}

@Test
class TestUtils { 
	@TestCase
	func test0(): Unit {
		@Expect(toString(E.A(123)), "pkg.E.A(123)")
		@Expect(toString(E.C(S(123))), "pkg.E.C(pkg.S(v=123))")
	}
}
