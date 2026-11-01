// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Outer C.set_s_x is small and inlined; inner S.set_x is oversized and stays an Apply.
// After inline the mut receiver is GetElementRef(%1, 0) on var s (not the Allocate).
// HandleGetElemRefExpr already kills %1 on that GER; this case guards member-path
// (mutable member through GER), so the later Load(%1) is kept rather than forwarded
// to the pre-mutation Store / Field of the old value. See also struct10.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantLoadElimination.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Struct-_CN7default1SE&->@_CN7default1S5set_xHl
// ASSERT: regex = Load\(%\d+\) // loc: "struct9.cj"-69-9

struct S {
    public var x: Int64 = 1
    public mut func set_x(x: Int64) {
        var t = x
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        t = t + 0
        this.x = t
    }
}

struct C {
    public var s: S = S()
    public mut func set_s_x(x: Int64) {
        s.set_x(x)
    }
}

var c = C()

main(): Int64 {
    var tmp1: C = c
    tmp1.set_s_x(2)
    c = tmp1

    return c.s.x - 2
}
