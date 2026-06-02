/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.collection.*

@Test
class TreeMapTest {
    @TestCase
    func initWithoutParameter(): Unit {
        try {
            throw ConcurrentModificationException("123")
        } catch (e: Exception) {
            @Expect(e.message, "123")
            @Expect(e.toString(), "ConcurrentModificationException: 123")
        }

        try {
            throw ConcurrentModificationException()
        } catch (e: Exception) {
            @Expect(e.message, "")
            @Expect(e.toString(), "ConcurrentModificationException")
        }
    }
}
