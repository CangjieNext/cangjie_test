/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.compress.*
import stdx.compress.tar.*

@Test
class test_TarEntryFormat {
    let _types = [
        V7,
        Ustar,
        Pax,
        Gnu
    ]

    let _type_strs = [
        "TarEntryFormat.V7",
        "TarEntryFormat.Ustar",
        "TarEntryFormat.Pax",
        "TarEntryFormat.Gnu",
    ]

    @TestCase
    func test_TarEntryFormat_toString(): Unit {
        @Assert(_types.map{ ee => ee.toString()}, _type_strs)
    }

    @TestCase
    func test_TarEntryFormat_equal(): Unit {
        for (i in 0.._types.size) {
            @Assert(_types[i], _types[i])
        }
    }

    @TestCase
    func test_TarEntryFormat_unequal(): Unit {
        for (i in 0.._types.size - 1) {
            @Assert(_types[i] != _types[i + 1])
        }
    }
}