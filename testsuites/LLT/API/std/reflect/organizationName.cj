/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (CJNATIVE) EXEC: %compiler -Woff all %cmp_opt %f -g -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

package my_org::pkg1

import std.reflect.*

public class C<T> {
    public func foo(): Unit {
        println("C<${TypeInfo.of<T>()}>.foo")
    }
}

public class F {
    public func bar(): Unit {
        println("F.bar")
    }
}



@Test
class TestOrganizationName {
    @Skip
    @TestCase
    func testQualifiedName() {
        @Assert(ClassTypeInfo.get("my_org::pkg1.C<Int64>").toString(), "my_org::pkg1.C<Int64>")
    }

}
