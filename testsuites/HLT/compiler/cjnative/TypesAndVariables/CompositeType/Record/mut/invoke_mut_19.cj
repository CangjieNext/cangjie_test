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

interface I {
    prop a: Int64
    // func aaaa(): Int64
}

struct RR <: I {
    public var aa: Int64 = 3
    public prop a: Int64 {
        get() {
            return aa
        }
    }

    /* func aaaa(): Int64{
    }*/
    public init(aa!: Int64 = 3) {
        this.aa = aa
    }
}

struct R {
    public var a: I = RR()
    public mut func c(b: RR) {
        a = b
        return a
    }
    public init(a!: I = RR()) {
        this.a = a
    }
}

main() {
    var b = R()
    b.c(RR(aa: 98))
    return b.a.a - 98
}
