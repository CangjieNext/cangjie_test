/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --no-color --parallel 2>&1 | compare %f
// ASSERT: scan-1 hello from abstract

@TestTemplate
abstract class Template {
    public func abstractOne(): Unit

    @TestCase
    func callingAbstract() {
        abstractOne()
    }
}

@Test
class Tests <: Template {
    public override func abstractOne() {
        println("hello from abstract")
    }
}
