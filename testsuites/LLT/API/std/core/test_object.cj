/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 
@Test
class ObjectTest {
    /*
     * Test description: Test Object ::core
     * Test API:
     * public open class Object <: Any
     */
    @TestCase
    func testObject(): Unit {
        var a = Object()
        var b = Object()
        var c = a
        @Expect(!refEq(a,b))
        @Expect(refEq(a,c))
    }
}
