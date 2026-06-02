/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %cmp_opt %f %cmp_utest_opt
// ASSERT: scan @TestCase must be used on a member of class annotated with @Test or @TestTemplate.

@Configure[randomSeed: 1]
class Tests {
    @TestCase
    func foo() {
        @Expect(1, 2)
    }
}
