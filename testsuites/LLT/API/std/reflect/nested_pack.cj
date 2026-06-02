/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test class TypeInfo of nested package
 */

package a.b.c

import std.reflect.*

@Test
func nestPackTest(): Unit {
    @Expect(TypeInfo.get("a.b.c.C").toString(), "a.b.c.C")
    @Expect(TypeInfo.of(D()).toString(), "a.b.c.D")
    @Expect(TypeInfo.of<E>().toString(), "a.b.c.E")
}

public class C {}

public class D {}

public class E {}
