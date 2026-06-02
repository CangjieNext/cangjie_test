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

open class father {
    static var a: Int64

    static init() {
        a = 1
    }
}

class son <: father {
    static var b: Int64

    static init() {
        b = a
    }

    static func f() {
        b++
        return b
    }
}

main(): Int64 {
    son.f()

    if (son.b == 2) {
        return 0
    }
    return 1
}
