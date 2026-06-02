/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %cmp_opt %f %cmp_utest_opt
// ASSERT: scan-2 @TestBuilder macro can only be put on function.
// ASSERT: scan-1 @TestBuilder macro must be put on a function without parameters.

@TestBuilder
class f {}

@TestBuilder
let x = 10

@TestBuilder
func g(x!: Int64 = 55) {
}
