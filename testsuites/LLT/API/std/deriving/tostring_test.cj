/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.deriving.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class ToStringTest {
    @TestCase
    func smokeTest() {
        @Expect(S().toString(), "S(a: 1, b: 2)")
    }

    @TestCase
    func excludeTest() {
        @Expect(SExcluded().toString(), "SExcluded(a: 1)")
    }

    @TestCase
    func emptyTest() {
        @Expect(SEmpty().toString(), "SEmpty()")
    }

    @TestCase
    func propertyTest() {
        @Expect(SProperty().toString(), "SProperty(a: 1, b: 2)")
    }

    @TestCase
    func orderedTest() {
        @Expect(OrderedS().toString(), "OrderedS(b: 2, a: 1)")
    }

    @TestCase
    func enumSomeTest() {
        @Expect(E11.EE1.toString(), "E11.EE1")
        @Expect(E11.EE2("a").toString(), "E11.EE2(a)")
    }

    @TestCase
    func enumWithPropertyTest() {
        @Expect(EnumWithProperty.EwP1.toString(), "EnumWithProperty.EwP1(name: name_prop)")
        @Expect(EnumWithProperty.EwP2("bbb").toString(), "EnumWithProperty.EwP2(bbb, name: name_prop)")
    }

    @TestCase
    func testUserFormat() {
        @Expect(User("user2", 73, ["root", "adm", "victim"]).toString(),
            "User(login: user2, id: 73, roles: [root, adm, victim])")
    }

    @TestCase
    func testEnumWithArray() {
        @Expect(EnumWithArray.EB.toString(), "EnumWithArray.EB")
        @Expect(EnumWithArray.EA([1, 8, -1]).toString(), "EnumWithArray.EA([1, 8, -1])")
    }
}

@Derive[ToString]
struct User {
    User(
        let login: String,
        let id: Int,
        let roles: Array<String>
    ) {}
}

@Derive[ToString]
enum EnumWithArray {
    | EA(Array<Int>)
    | EB
}

@Derive[ToString]
struct S {
    let a = 1
    let b = "2"
}

@Derive[ToString]
struct SExcluded {
    let a = 1

    @DeriveExclude
    let b = "2"
}

@Derive[ToString]
struct SEmpty {}

@Derive[ToString]
struct SProperty {
    let a = 1

    @DeriveInclude
    prop b: String {
        get() {
            "2"
        }
    }

    prop c: String {
        get() {
            "3"
        }
    }
}

@Derive[ToString]
enum E11 {
    | EE1
    | EE2(String)
}

@Derive[ToString]
enum EnumWithProperty {
    | EwP1
    | EwP2(String)

    @DeriveInclude
    prop name: String {
        get() {
            "name_prop"
        }
    }

    // not included
    prop x: Int {
        get() {
            77
        }
    }
}

@Derive[ToString]
@DeriveOrder[b, a]
struct OrderedS {
    let a = 1
    let b = "2"
}
