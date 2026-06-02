/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f

@Strategy
class Foo {}

/* SCAN-IN
Test framework: macro failed to expand.
@Strategy macro must be placed on a function
 */
@Test
class Foo {
    @Strategy
    @Bench
    func test() {}
}

/* SCAN-IN
Test framework: macro failed to expand.
@Strategy macro can't be used together with @Bench
 */
@Test
class Foo {
    @Strategy
    @Strategy
    func test(): Unit {}
}

/* SCAN-IN
Test framework: macro failed to expand.
@Strategy macro must be placed on a function
 */
@Test
class Foo {
    @Strategy
    unsafe func test(): Unit {}
}

/* SCAN-IN
Test framework: macro failed to expand.
Function modifier `unsafe` is not allowed on @Strategy annotated function
 */
