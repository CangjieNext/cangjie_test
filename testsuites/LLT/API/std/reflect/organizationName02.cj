/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler -Woff all %cmp_opt %f -g -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

package my_org::test0

import std.reflect.*

public class CA {}

public class CB<T> {}

@Test
class TestOrganizationName {
    @TestCase
    func testOrganizationName01() {
        try {
            ClassTypeInfo.get("my_org::test0.CA")
            ClassTypeInfo.get("my_org::test0.CB<Int64>")
            println("pass")
        } catch (e: Exception) {
            @Assert(false)
        }
    }

    @TestCase
    func testOrganizationName02() {
        @Expect(PackageInfo.get("my_org::test0").toString(), "my_org::test0")
        @Expect(ClassTypeInfo.get("my_org::test0.CA").toString(), "my_org::test0.CA")
        try {
            PackageInfo.get("my_org/test0")
            @Assert(false)
        } catch (e: InfoNotFoundException) {
            @Assert(true)
        }
        try {
            ClassTypeInfo.get("my_org/test0.CA")
            @Assert(false)
        } catch (e: InfoNotFoundException) {
            @Assert(true)
        }
    }
}
