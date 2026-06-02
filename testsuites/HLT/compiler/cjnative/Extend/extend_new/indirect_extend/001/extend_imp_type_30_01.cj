/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type ch = Rune

type li = Array<ch>

interface I {
    static func a() {
        1
    }
}

extend<T> Array<T> <: I {
    public static func a() {
        1
    }
}

var b: Int64 = li.a()

main(): Int64 {
    if (b == 1) {
        return 0
    } else {
        return 1
    }
}
