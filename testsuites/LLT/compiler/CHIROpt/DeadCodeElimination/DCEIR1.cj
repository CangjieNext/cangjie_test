// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py "default_CHIR/[0-9]*_EraseUselessDebugExpr.chirtxt" "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// Dead arithmetic folded/cleaned after debug erase; no Add remains in main.
// ASSERT: scan srcCodeIdentifier: main
// ASSERT: scan-not Add(

struct S {
    var x: Int64 = 1
    mut func foo() {
        x = 2
    }
    func goo() {
        x
    }
}

main() {
    var x: Int32 = 1
    println(x)
    var y = x + x
    var s = S()
    s.foo()
    println(x)
    var z: Float32 = 2.3
    var a = z + z
    var b: VArray<Int64, $3> = [1, 2, 3]
    var d: Bool = a > 0.0
}
