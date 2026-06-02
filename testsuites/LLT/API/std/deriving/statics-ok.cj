/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.deriving.*

@Derive[ToString]
struct S {
    let a = 1
    static let b = 2
}

@Derive[ToString]
enum E {
    E1

    static prop p: Int {
        get() {
            2
        }
    }
}

@Test
func testStaticField() {
    @Expect(S().toString(), "S(a: 1)")
    @Expect(E.E1.toString(), "E.E1")
}
