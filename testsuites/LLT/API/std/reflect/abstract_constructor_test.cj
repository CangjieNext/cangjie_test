/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test func apply(args: Array<Any>): Any
 */

import std.reflect.*

@Test
class AbstractCtorTest {
    @TestCase
    func testClass(): Unit {
        let ti = (TypeInfo.of<A>() as ClassTypeInfo).getOrThrow()
        try {
            ti.construct()
            @Expect(false)
        } catch (e: InvocationTargetException) {}
    }
}

public abstract class A {
    public init() {}
}
