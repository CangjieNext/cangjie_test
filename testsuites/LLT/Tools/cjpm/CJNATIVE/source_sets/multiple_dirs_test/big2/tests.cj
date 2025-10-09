// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tests_in_source_sets 

import std.unittest.*
import std.unittest.testmacro.*

@Test
func test_2() {
	println("BIG_TEST_FUNC_2")
}

@Test
@Tag[LittleFail]
func failIfRun_2() {
	@Fail("Should not run")
}
