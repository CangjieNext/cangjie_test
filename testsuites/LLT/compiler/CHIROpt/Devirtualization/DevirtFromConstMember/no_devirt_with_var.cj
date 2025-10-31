// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan-not [Devirtualization] The function call to EgZjaHJvbWUyBggAEEUYOdIBCD at [48,5] was optimized.

interface A {
    func EgZjaHJvbWUyBggAEEUYOdIBCD(): Unit
}

class B <: A {
    public func EgZjaHJvbWUyBggAEEUYOdIBCD(): Unit {
        print(1)
    }
}

class C <: A {
    public func EgZjaHJvbWUyBggAEEUYOdIBCD(): Unit {
        print(2)
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
    x.a.EgZjaHJvbWUyBggAEEUYOdIBCD()
    0
}