/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

public interface MyInterface1 {
    mut func foo1(): Rune
    mut func foo2(a: Rune): String {
        a.toString() + foo1().toString()
    }
}

public interface MyInterface2 {
    mut func foo3(): Rune
    mut func foo4(a: Rune): String {
        a.toString() + a.toString() + foo3().toString()
    }
}

public interface MyInterface3 {
    mut func foo5(): Rune
    mut func foo6(a: Rune): String {
        a.toString() + foo5().toString() + foo5().toString()
    }
}

extend Float64 <: MyInterface1 & MyInterface2 & MyInterface3 {
    public func foo1(): Rune {
        foo3()
    }
    public func foo3(): Rune {
        foo5()
    }
    public func foo5(): Rune {
        r'1'
    }
}

main() {
    var f1: MyInterface1 = Float64(1.0)
    var f2: MyInterface2 = Float64(1.0)
    var f3: MyInterface3 = Float64(1.0)
    var f4: Float64 = 1.0

    if (f1.foo2(r'a') == "a1" && f2.foo4(r'b') == "bb1" && f3.foo6(r'c') == "c11") {
        if (f4.foo2(r'a') == "a1" && f4.foo4(r'b') == "bb1" && f4.foo6(r'c') == "c11") {
            return 0
        }
    }
    return 1
}
