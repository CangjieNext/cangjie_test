/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %cmp_opt %f %cmp_utest_opt
// ASSERT: scan-1 @TestBuilder macro can't be used together with foreign modifier.
// ASSERT: scan-1 @TestBuilder macro can't be used together with unsafe modifier.

@TestBuilder
foreign func g1(): TestSuite

@TestBuilder
unsafe func g2(): TestSuite {
    TestSuite.builder("name").build()
}
