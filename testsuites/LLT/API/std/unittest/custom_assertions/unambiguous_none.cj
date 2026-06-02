/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output

import std.unittest.*
import std.unittest.testmacro.*

public enum OwnOption<T> {
    Some(T)
    | None
}

@CustomAssertion
func customAssertion(ctx: AssertionCtx) {
    @Expect(true)
}

@Test
func testfunc() {
    @Expect(true)
    @Expect[customAssertion]()
}
