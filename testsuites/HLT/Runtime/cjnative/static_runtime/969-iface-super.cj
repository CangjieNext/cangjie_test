/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows and not MAC) EXEC: %compiler %compilation_options %extra_options %lto_options %sanitizer_options %mock_options %optimization_options %debug_options --static %overflow_wrapping %f -o %output
// (not Windows and not MAC) RUN-EXEC-PIPE: unset LD_LIBRARY_PATH && %output %run_args | compare %f
// ASSERT:scan HelloHelloHelloHello and welcomeHelloHello and welcomeHello there!Hello there!!Hello there!?Hello there!!!Hello?Hello!Hello?!

interface Iface {
    func SayHi(): String {
        return "Hello"
    }
}

interface Iface2 <: Iface {
    func SayHi2(): String {
        return SayHi() + SayHi()
    }
}

interface Iface3 <: Iface {}

open class A <: Iface {}

class B <: Iface2 {}

class C <: Iface {
    public func SayHiC(): String {
        return SayHi() + " and welcome"
    }
}

class D <: Iface2 {
    public func SayHiD(): String {
        return SayHi2() + " and welcome"
    }
}

open class E <: Iface3 {
    public func SayHiE(): String {
        return SayHi() + " there!"
    }
}

open class F <: E {
    public func SaySurprisedHi() {
        return SayHiE() + "!"
    }
}

class G <: F {
    public func SayHiG(): String {
        return SayHiE() + "?"
    }
    public func SayVerySurprisedHi():String {
        return SaySurprisedHi() + "!"
    }
}

class H <: A {
    public func SayHiH(): String {
        return SayHi() + "?"
    }
    public func SaySurprisedHi():String {
        return SayHi() + "!"
    }
    public func SayConfusedHi():String {
        return SayHiH() + "!"
    }
}

main(): Int64 {
    let a: A = A()
    print(a.SayHi())
    let b: B = B()
    print(b.SayHi2())
    let c: C = C()
    print(c.SayHiC())
    let d: D = D()
    print(d.SayHiD())
    let e: E = E()
    print(e.SayHiE())
    let f: F = F()
    print(f.SaySurprisedHi())
    let g: G = G()
    print(g.SayHiG() + g.SayVerySurprisedHi())
    let h: H = H()
    print(h.SayHiH() + h.SaySurprisedHi() + h.SayConfusedHi())
    return 0
}
