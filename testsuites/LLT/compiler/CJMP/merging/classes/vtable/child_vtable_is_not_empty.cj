// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common interface I {
}

public open common class A <: I {
    public init() {}
    public open func foo5(): Unit { println("A::foo5 common") }
}

public common class A2 <: A {
    public init() {}
}

public common class B <: I {
    public init() {}
}

public func runCommonA(a: A) {
    a.foo5()
}

public func runCommonA2(a: A2) {
    a.foo5()
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public platform interface I {
    func foo5(): Unit { println("I::foo5 platform") }
}

public open platform class A <: I {
}

public platform class A2 <: A {
    public func foo5(): Unit { println("A2::foo5 platform") }
}

public platform class B <: I {}

public class C <: I {}

public func runPlatformI(a: I) {
    a.foo5()
}

public func runPlatformA(a: A) {
    a.foo5()
}

public func runPlatformA2(a: A2) {
    a.foo5()
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    runCommonA(A())
    runCommonA(A2())
    runCommonA2(A2())
}

/* SCAN
A::foo5 common
A2::foo5 platform
A2::foo5 platform
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    runCommonA(A())
    runCommonA(A2())
    runCommonA2(A2())
    println("=")
    let i1: I = A()
    let i2: I = A2()
    let i3: I = B()
    let i4: I = C()
    runPlatformI(i1)
    runPlatformI(i2)
    runPlatformI(i3)
    runPlatformI(i4)
    println("=")
    runPlatformI(A())
    runPlatformI(A2())
    runPlatformA(A())
    runPlatformA(A2())
    runPlatformA2(A2())
}


/* SCAN
A::foo5 common
A2::foo5 platform
A2::foo5 platform
=
A::foo5 common
A2::foo5 platform
I::foo5 platform
I::foo5 platform
=
A::foo5 common
A2::foo5 platform
A::foo5 common
A2::foo5 platform
A2::foo5 platform
*/
