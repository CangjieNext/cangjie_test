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

class C {
    public static var b = R(a: 6)
}

main() {
    a()
    return Int64(C.b.a - 10)
}

struct R {
    public var a: Int32 = 8
    public mut func c(b: Int32): Int32 {
        a = a + b
        return 0
    }
    public init(a!: Int32 = 8) {
        this.a = a
    }
}

func a() {
    C.b.c(4)
}
