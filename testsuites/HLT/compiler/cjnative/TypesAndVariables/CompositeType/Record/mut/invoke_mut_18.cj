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

struct RR {
    var a: Int64 = 3
    public init(a!: Int64 = 3) {
        this.a = a
    }
}

struct R {
    public var a: RR = RR()
    public mut func c(b: RR): RR {
        a = b
        return a
    }
    public init(a!: RR = RR()) {
        this.a = a
    }
}

main() {
    var b = R()
    b.c(RR(a: 98))
    return b.a.a - 98
}
