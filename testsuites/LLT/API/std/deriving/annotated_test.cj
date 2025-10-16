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
import std.unittest.prop_test.*
import std.unittest.testmacro.*

@Annotation
public class Please {
    const init() {}
}

@Annotation
public class Work {
    const init() {}
}

@Derive[ToString]
@Please
class Data {
    @Please
    let a = 1

    @DeriveExclude
    @Please
    let z = 100

    @Please
    Data(@Please let b!: Int = 2) {}

    @DeriveInclude
    @Please
    prop c: Int {
        get() {
            3
        }
    }

    @Please
    @Work
    let d = 1000

    @Please
    @DeriveExclude
    let x1 = 999

    @Please
    @Work
    @DeriveExclude
    let x2 = 999

    @Please
    @DeriveExclude
    @Work
    let x3 = 999

    @DeriveExclude
    @Please
    @Work
    let x4 = 999

    @Please
    @Work
    @DeriveInclude
    prop e: Int { get() { 1001 } }

    @Please
    @DeriveInclude
    @Work
    prop f: Int { get() { 1002 } }

    @DeriveInclude
    @Please
    @Work
    prop g: Int { get() { 1003 } }
}

@Derive[Arbitrary]
@Please
struct Z {
    @Please
    Z(
        @Please
        let a: Int
    ) {}
}

@Derive[Hashable]
@Please
@Work
struct M {
    @Please
    @Work
    M(
        @Please
        //@Work - this doesn't work in libast
        let a: Int
    ) {}
}

@Test
func smokeTest() {
    let data = Data().toString()

    @Expect(data, "Data(a: 1, b: 2, c: 3, d: 1000, e: 1001, f: 1002, g: 1003)")
}

@Test
func smokeTestForM() {
    @Expect(M(19).hashCode() != 0)
}

