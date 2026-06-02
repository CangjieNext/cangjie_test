/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %cmp_opt %f -o %output %cmp_utest_opt

// ASSERT: scan @BeforeAll must be used on a member of class annotated with @Test or @TestTemplate.
@BeforeAll
func b() {
}

// ASSERT: scan @BeforeEach must be used on a member of class annotated with @Test or @TestTemplate.
@BeforeEach
func c() {
}

// ASSERT: scan @AfterEach must be used on a member of class annotated with @Test or @TestTemplate.
@AfterEach
func d() {
}
