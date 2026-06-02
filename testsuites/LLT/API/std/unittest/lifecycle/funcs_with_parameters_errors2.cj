/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt 2>&1 | compare %f

@Test
class FooTest {
    @BeforeAll
    @BeforeEach
    func f1(s: String) {
    }

    @AfterAll
    @AfterEach
    func f2(s: Int) {
    }
}

/* SCAN-IN
Test framework: macro failed to expand.
@BeforeAll function cannot have parameters.
Parameter of @AfterEach function must be of type String.
@AfterAll function cannot have parameters.
 */
