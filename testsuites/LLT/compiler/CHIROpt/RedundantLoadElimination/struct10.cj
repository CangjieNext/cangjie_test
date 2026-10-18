// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Distinguish IsPathToReadOnlyMember from GetElementRef result READONLY (no mut Apply).
// After FunctionInline, mut getX becomes GetElementRef(%1, 0) on var x through
// readonly `this`. Result SSA is READONLY, but the member is mutable.
// Member-path check must kill so goo(sa) keeps Load(%1); GER.READONLY alone would
// forward to Field(%5). Same member-path guard as struct9 (nested mut through GER);
// here the mut site is an inlined getX GER rather than a remaining Apply.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantLoadElimination.chirtxt "Func @_CN7default3fooHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: regex GetElementRef\(%\d+, 0\) // loc: "struct10.cj"-37-13
// ASSERT: regex = Load\(%\d+\) // loc: "struct10.cj"-38-9
// ASSERT: regex-not Field\(%\d+, 0\) // loc: "struct10.cj"-36




struct SA {
    var x = 999
    mut func getX() {
        return this.x
    }
}

func goo(sa: SA) {
    println(sa.x)
}

func foo() {
    var sa = SA()
    let v = sa.getX()
    goo(sa)
    println(v)
}

main() {
    foo()
    0
}
