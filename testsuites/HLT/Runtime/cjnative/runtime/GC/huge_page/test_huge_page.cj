/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (not Windows) DEPENDENCE: foreign_func.c
// (not Windows) EXEC: %clang -c %clang_opt foreign_func.c -o foreign_func.o
// (not Windows) EXEC: %compiler %cmp_opt %overflow_wrapping test_huge_page.cj foreign_func.o -o %output
// (not Windows) RUN-EXEC: %run %run_opt cjStackSize=4mb %output %run_args

import std.collection.*
import std.time.*
import std.sync.*

var globalNumber: Int64 = 0

foreign func ExtendSP(): Unit

main(): Int64 {
    var rightCount = 0
    let buf = ArrayList<Future<Int64>>(10)
    var threadCount: Int64 = 10
    var item = 0
    while (item < 2000) {
        let val: Future<Int64> = spawn {
            unsafe { ExtendSP() }
            sleep(Duration.second * 50)
            return globalNumber
        }
        item++
        buf.add(val)
    }
    sleep(Duration.second * 50)
    return 0
}
