// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class A {
    static var t0 = 1
    var t1: Int64 = 1
    let t2: Int64 = 2
    func f1() {
        this.t1 = 2
    }
    static func f2() {
        return 3
    }
}

main() {
    if (A.f2() != 3 || A.t0 != 1 || A().t1 != 1) {
        return 2
    }
    var a = A()
    var b = a.t2
    var c = a.f1
    c()
    if (a.t1 != 2 || b != 2) {
        return 3
    }
    return 0
}
