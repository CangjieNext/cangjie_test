/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_args %run_utest_opt
import std.reflect.*

@Test
class Test {
    @TestCase
    func testInfoNotFoundException(): Unit {
        // 空字符串。
        try {
            TypeInfo.get("");
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "InfoNotFoundException: TypeInfo '' not found.")
        }

        // 绝对不存在的类型名称。
        try {
            TypeInfo.get("xxx");
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "InfoNotFoundException: TypeInfo 'xxx' not found.")
        }
    }
}
