/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// ASSERT: scan 1 error generated, 1 error printed

package A

internal import std.unittest.* //testfame
import std.unittest.testmacro.* //macro_Defintion

@Test // EXPECT: scan '@Test modified foreign class'
foreign class MyClass {
    @TestCase
    func myCase1(): Unit {
        println("This is case no.1")
    }

    func getValue(): Int64 {
        println("getValue")
        256
    }
}
