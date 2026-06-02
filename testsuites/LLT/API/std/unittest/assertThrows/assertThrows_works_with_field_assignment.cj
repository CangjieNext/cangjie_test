/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC: %run %run_opt %output %run_utest_opt

class A {
    mut prop field: Int64 {
        get() {
            0
        }
        set(v) {
            throw Exception()
        }
    }
}

@Test
func assert_throws_empty_body() {
    let a = A()
    @AssertThrows(a.field = 0)
}
