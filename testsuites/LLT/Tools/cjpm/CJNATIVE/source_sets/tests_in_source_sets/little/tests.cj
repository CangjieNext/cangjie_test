// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

features user.tests_in_source_sets.arch.little
package tests_in_source_sets 

import std.unittest.*
import std.unittest.testmacro.*

@Test
func test() {
	println("LITTLE_TEST_FUNC")
}

@Test
@Tag[BigFail]
func failIfRun() {
	@Fail("Should not run")
}
