// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7default1AE&->@_CN7default1A26EgZjaHJvbWUyBggAEEUYOdIBCDHv

interface A {
    func EgZjaHJvbWUyBggAEEUYOdIBCD(): Int64
}

class B <: A {
    public func EgZjaHJvbWUyBggAEEUYOdIBCD(): Int64 {
        1
    }
}

class C <: A {
    public func EgZjaHJvbWUyBggAEEUYOdIBCD(): Int64 {
        2
    }
}

interface Base {
}

public open class X <: Base {
    var a: A = B()
}

public class XX <: X & Base {}

let x_global: X = XX()

var i = 1

main() {
    let x: X
    if (i == 1) {
        let f = (13, X())
        x = f[1]
    } else {
        x = x_global
    }
    x.a.EgZjaHJvbWUyBggAEEUYOdIBCD() - 1
}
