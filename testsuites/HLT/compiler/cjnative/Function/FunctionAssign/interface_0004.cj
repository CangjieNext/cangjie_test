/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var c: Int32 = 0

interface R {
    /*static*/ func a(a: Int32) {
        c = 10 + a
    }
}

class C <: R {
    var b = {a: Int32 =>}
    C() {
        b = a
    }
}

main(): Int64 {
    var d = C().b
    d(3)
    return Int64(c - 13)
}
