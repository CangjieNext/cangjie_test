/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt 2>&1 | compare %f
// ASSERT: scan @BeforeAll function cannot be generic.
// ASSERT: scan Parameter of @BeforeEach function must be of type String.
// ASSERT: scan @AfterEach function can only have a single String parameter.
// ASSERT: scan @AfterAll function cannot have parameters.

@Test
class FooTest2 {
    @BeforeAll
    func f1<T>() {
    }

    @BeforeEach
    func f2(a: Int32) {
    }

    @AfterEach
    func f55(a: String, b: String) {
    }

    @AfterAll
    func f3(a!: Int32 = 0) {
    }
}
