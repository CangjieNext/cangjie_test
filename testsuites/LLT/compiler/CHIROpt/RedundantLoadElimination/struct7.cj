// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableO2 -Woff all %n.cj -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args

struct C {
    public var s: S = S()
    public mut func set_s_x(x: Int64) {
        s.set_x(x)
    }
}

struct S {
    public var x: Int64 = 1
    public mut func set_x(x: Int64) {
        this.x = x
    }
}

var c = C()

main(): Int64 {
    var tmp1: C = c
    tmp1.set_s_x(2)
    c = tmp1

    return c.s.x - 2
}
