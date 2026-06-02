// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I2 {
    func f2(): Int64
}

class C <: I2 {
    public func f1(): Int64 {
        return 1
    }
    public func f2(): Int64 {
        return 2
    }
}

main() {
    let x: I2 = C()
    let f = x.f2
    if (f() == 2) {
        return 0
    }
    return 1
}
