/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f

@UnittestOption[Int64](x)

@UnittestOption[Int64](y)

@Test
class Foo {
    @Configure[x: 10, y: 20]
    var c = 5

    @Configure[x: 10, y: 20]
    func z() {}

    @Types[T in<String>]
    func f<T>() {}
}

/* SCAN-IN
Test framework: macro failed to expand.
@Configure macro can only be put on class or function.
@Configure macro must be used together with one of: @Test, @TestBuilder, @TestTemplate, @TestCase, @Bench.
@Types macro must be used together with one of: @Test, @TestCase, @Bench.
 */
