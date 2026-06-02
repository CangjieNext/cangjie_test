/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_args

@C
struct teststruct {
    var i8: Int8 = 10
    var cf1: CFunc<(Int64, Int64) -> Int64> = {
        a, b => return a + b
    }
}

foreign {
    func testfunc1(): teststruct

    func testfunc2(ts: teststruct): teststruct
}

unsafe main(): Int64 {
    var count = 0

    var struct1 = testfunc1()
    if ((struct1.i8 == 20) && (struct1.cf1(10, 10) == 20)) {
        count += 1
    }

    struct1.i8 = 30
    struct1.cf1 = {
        a, b => return a + b + 10
    }

    var struct2 = testfunc2(struct1)
    if ((struct2.i8 == 40) && (struct2.cf1(20, 20) == 60)) {
        count += 1
    }

    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
