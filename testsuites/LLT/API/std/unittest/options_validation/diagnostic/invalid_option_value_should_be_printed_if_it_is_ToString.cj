/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// EXEC-PIPE-1: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color 2>&1 | compare %f
// ASSERT: scan UnittestOptionValidationException: Option 'myOpt' (myOpt.toString='Should_Be_In_Error_Message') is invalid.

class C <: ToString {
    public func toString() {
        "Should_Be_In_Error_Message"
    }
}

@UnittestOption[C](myOpt, { _:C => false })

@Test
@Configure[myOpt: C()]
func foo() {}
