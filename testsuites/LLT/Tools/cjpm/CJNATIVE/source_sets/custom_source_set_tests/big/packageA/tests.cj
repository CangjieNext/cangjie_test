// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

features { user.custom_source_set_tests.arch.big }
package custom_source_set_tests.packageA

import std.unittest.*
import std.unittest.testmacro.*

@Test
func bigPackageATest() {
	println("BIG_PACKAGE_A_TEST")
}

@Test
@Tag[LittleFail]
func littleShouldNotRun() {
	@Fail("Should not run")
}
