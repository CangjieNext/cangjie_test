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

main() {
    var b = R(a: 6)
    b.c(4)
    return Int64(b.a - 16)
}

struct R {
    public var a: Int32 = 8
    public mut func c(b: Int32): Int32 {
        if (b > 0) {
            a = a + b
            return c(b - 1)
        }
        return 0
    }

    public init(a!: Int32 = 8) {
        this.a = a
    }
}
