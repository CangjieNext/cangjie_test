// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen %cmp_utest_opt %cmp_opt %coverage_opt %f 2>&1 | compare %f
// ASSERT: scan !DIFile(filename: "0-aaa.hhh.ccc$test.pkg", directory: ".")
package aaa.hhh.ccc

@Test
func foo() {
    var a = 100
    0
}
