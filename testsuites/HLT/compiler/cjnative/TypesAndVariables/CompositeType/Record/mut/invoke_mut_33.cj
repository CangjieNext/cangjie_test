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
    mut func f(): Int64
}

interface I1 <: I {
    mut func f(): Int64 {
        1
    }
}

interface I2 <: I1 {
    mut func f(): Int64 {
        2
    }
}

interface I3 <: I2 {
    mut func f(): Int64 {
        3
    }
}

struct Foo <: I3 & I {
    public var v = 0
    public mut func f(): Int64 {
        3
    }

    public mut func ff(): Unit {
        v += f()
    }
}

main() {
    var a = Foo()
    a.ff()
    return a.v - 3
}
