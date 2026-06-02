/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// ASSERT: scan 1 error generated
package pkgA

internal import std.unittest.* //testfame
import std.unittest.testmacro.* //macro_Defintion

@Test
public class MyTestFuncCls {
    @Test // EXPECT: scan '@Test modified function is not top level'
    func myCase(): Unit {
        println("mycase n0.1");
    }
}
