// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

// NOTE: this test checks thart

public common interface I {
    func i1(): Unit { println("I::i1 common") }  
    common func i2(): Unit { println("I::i2 common") }  
    common func i3(): Unit { println("I::i3 common") }  
}

public open common class A <: I {
    public init() {}
    public open func a1(): Unit { println("A::a1 common") }
    public common func a2(): Unit { println("A::a2 common") }
    public common func a3(): Unit { println("A::a3 common") }
    public open func foo5(): Unit { println("A::foo5 common") }
    public open func foo6(): Unit { println("A::foo6 common") }
}

public common class B <: A {
    public init() {}
    public func b1(): Unit { println("B::b1 common") } 
    public common func b2(): Unit { println("B::b1 common") } 
    public common func b3(): Unit { println("B::b3 common") } 
    public func b4(): Unit { println("B::b4 common") } 
    public common func b5(): Unit { println("B::b5 common") } 
}

public func runCommon(a: B) {
    a.i1()
    a.i2()
    a.i3()
    a.a1()
    a.a2()
    a.a3()
    a.foo5()
    a.foo6()
    a.b1()
    a.b2()
    a.b3()
    a.b4()
    a.b5()
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public platform interface I {
    func i4(): Unit { println("I::i4 platform") }
    platform func i3(): Unit { println("I::i3 platform") }
    func foo5(): Unit { println("I::foo5 platform") }
    func i5(): Unit { println("I::i5 platform") }
}

public open platform class A <: I {
    public platform func a2(): Unit { println("A::a2 platform") }
}

public platform class B <: A {
    public platform func b3(): Unit { println("B::b3 platform") } 
    public func b6(): Unit { println("B::b6 platform") } 
    public platform func b5(): Unit { println("B::b5 platform") } 
    public func foo5(): Unit { println("B::f005 platform") }
    public platform func b2(): Unit { println("B::b2 platform") } 
}

public func runPlatform(a: B) {
    a.i1()
    a.i2()
    a.i3()
    a.i4()
    a.i5()
    a.a1()
    a.a2()
    a.a3()
    a.foo5()
    a.foo6()
    a.b1()
    a.b2()
    a.b3()
    a.b4()
    a.b5()
    a.b6()
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    runCommon(B())
}

/* SCAN
I::i1 common
I::i2 common
I::i3 platform
A::a1 common
A::a2 platform
A::a3 common
B::f005 platform
A::foo6 common
B::b1 common
B::b2 platform
B::b3 platform
B::b4 common
B::b5 platform
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    runCommon(B())
    println("=")
    runPlatform(B())
}


/* SCAN
I::i1 common
I::i2 common
I::i3 platform
A::a1 common
A::a2 platform
A::a3 common
B::f005 platform
A::foo6 common
B::b1 common
B::b2 platform
B::b3 platform
B::b4 common
B::b5 platform
=
I::i1 common
I::i2 common
I::i3 platform
I::i4 platform
I::i5 platform
A::a1 common
A::a2 platform
A::a3 common
B::f005 platform
A::foo6 common
B::b1 common
B::b2 platform
B::b3 platform
B::b4 common
B::b5 platform
B::b6 platform
*/
