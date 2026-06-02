// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func foo(): (Int64) -> Int64 {
    let k: Int64 = 5
    var lam = {
        a: Int64 =>
        let b = 12
        var lamInner = {
            => k + a + b
        }
        lamInner()
    }
    return lam
}

func foo2(a: Unit): Unit {
    return a
}

main() {
    var f = foo()
    var res1 = f(1)
    f = {a: Int64 => 10 + a}
    var res2 = f(2)
    var f2: (Unit) -> Unit = foo2
    f2(())
    return res1 + res2 - 30
}
