// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Guard RDA killing whole-object reaching defs through nested GetElementRef chains:
//   %18 = GetElementRef(%1, 0)      // &tmp1.s
//   %20 = GetElementRef(%18, 0)     // &tmp1.s.t  (base is not the Allocate)
//   StoreElementRef(..., %20, 0)
//   Load(%1) must NOT be replaced by the pre-mutation Store value.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantLoadElimination.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: regex GetElementRef\(%\d+, 0\) // loc: "struct8.cj"-44-5
// ASSERT: regex = Load\(%\d+\) // loc: "struct8.cj"-45-9

struct T {
    public var x: Int64 = 1
    public mut func set_x(x: Int64) {
        this.x = x
    }
}

struct S {
    public var t: T = T()
    public mut func set_t_x(x: Int64) {
        t.set_x(x)
    }
}

struct C {
    public var s: S = S()
    public mut func set_s_t_x(x: Int64) {
        s.set_t_x(x)
    }
}

var c = C()

main(): Int64 {
    var tmp1: C = c
    tmp1.set_s_t_x(2)
    c = tmp1

    return c.s.t.x - 2
}
