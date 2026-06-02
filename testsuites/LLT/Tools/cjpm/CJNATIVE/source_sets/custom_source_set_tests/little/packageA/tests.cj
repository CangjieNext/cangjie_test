// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

features { user.custom_source_set_tests.arch.little }
package custom_source_set_tests.packageA

import std.unittest.*
import std.unittest.testmacro.*

@Test
func littlePackageATest() {
	println("little-package-a-test")
}

@Test
@Tag[BigFail]
func bigShouldNotRun() {
	@Fail("Should not run")
}
