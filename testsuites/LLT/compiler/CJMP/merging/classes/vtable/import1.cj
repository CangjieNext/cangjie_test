// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/ca.cj
// EXEC-0: %compiler %noColor --experimental c/ca.cj --output-type=chir --output-dir ./c
package a

public common interface I {
    common func foo1(): Unit // common open abstract
    common func foo2(): Unit { println("foo2 of I in common") } // common open
    common func foo3(): Unit { println("foo3 of I in common") } // common open
    func foo4(): Unit // open abstract
    func foo5(): Unit { println("foo5 of I in common") } // open
}

public interface I2 <: I {
    func foo1(): Unit { println("foo1 of I2 in common") }
    func foo2(): Unit { println("foo2 of I2 in common") }
    func foo3(): Unit { println("foo3 of I2 in common") }
    func foo4(): Unit { println("foo4 of I2 in common") }
    func foo6(): Unit { println("foo6 of I2 in common") }
    func foo7(): Unit { println("foo7 of I2 in common") }
}

public class A <: I2 {
    public func foo1(): Unit { println("foo1 of A in common") }
    public func foo4(): Unit { println("foo4 of A in common") }
}

public func runCommon() {
    let a = A()
    a.foo1() // foo1 of A in common
    a.foo2() // foo2 of I2 in common
    a.foo3() // foo3 of I2 in common
    a.foo4() // foo4 of A in common
    a.foo5() // foo5 of I in common
    a.foo6() // foo6 of I2 in common
    a.foo7() // foo7 of I2 in common
}

// SEPARATE-FILE: p/pa.cj
// EXEC-0: %compiler %noColor --experimental p/pa.cj ./c/a.chir --common-part-cjo=./c/a.cjo --output-type=dylib --output-dir=./p
package a

public platform interface I {
    platform func foo1(): Unit { println("foo1 of I in platform") } // ok: common open
    // platform func foo2(): Unit // error: common open abstract
    platform func foo2(): Unit { println("foo2 of I in platform") } // ok: common open

    func foo6(): Unit { println("foo6 of I in platform") } // ok: open new func must have body
}

public class B <: I2 {
    public func foo1(): Unit { println("foo1 of B in platform") }
    public func foo4(): Unit { println("foo4 of B in platform") }
}

public func run() {
    let a = A()
    a.foo1() // foo1 of A in common
    a.foo2() // foo2 of I2 in common
    a.foo3() // foo3 of I2 in common
    a.foo4() // foo4 of A in common
    a.foo5() // foo5 of I in common
    a.foo6() // foo6 of I2 in common
    a.foo7() // foo7 of I2 in common

    let b = B()
    b.foo1() // foo1 of B in platform
    b.foo2() // foo2 of I2 in common
    b.foo3() // foo3 of I2 in common
    b.foo4() // foo4 of B in platform
    b.foo5() // foo5 of I in common
    b.foo6() // foo6 of I2 in common
    b.foo7() // foo7 of I2 in common
}


// SEPARATE-FILE: c/cb.cj
// EXEC-0: %compiler %noColor --experimental c/cb.cj --import-path=./c --output-type=chir --output-dir ./c
package b

import a.*
public func runCommonFromB() {
    let a = A()
    a.foo1() // foo1 of A in common
    a.foo2() // foo2 of I2 in common
    a.foo3() // foo3 of I2 in common
    a.foo4() // foo4 of A in common
    a.foo5() // foo5 of I in common
    a.foo6() // foo6 of I2 in common
    a.foo7() // foo7 of I2 in common

}

// SEPARATE-FILE: p/pb.cj
// EXEC-0: %compiler %noColor --experimental p/pb.cj ./c/b.chir --common-part-cjo=./c/b.cjo --import-path=./p --output-type=dylib --output-dir=./p
package b

import a.*

public func runFromB() {
    let a = A()
    a.foo1() // foo1 of A in common
    a.foo2() // foo2 of I2 in common
    a.foo3() // foo3 of I2 in common
    a.foo4() // foo4 of A in common
    a.foo5() // foo5 of I in common
    a.foo6() // foo6 of I2 in common
    a.foo7() // foo7 of I2 in common
    let b = B()
    b.foo1() // foo1 of B in platform
    b.foo2() // foo2 of I2 in common
    b.foo3() // foo3 of I2 in common
    b.foo4() // foo4 of B in platform
    b.foo5() // foo5 of I in common
    b.foo6() // foo6 of I2 in common
    b.foo7() // foo7 of I2 in common
}

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L./p -la -lb -o %output
// EXEC-0: export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p:./c
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p:./c %run %output 2>&1 | compare %f
import a.*
import b.*

main() {
    runCommon()
    run()
    println("===")
    runCommonFromB()
    runFromB()
}

/* SCAN
foo1 of A in common
foo2 of I2 in common
foo3 of I2 in common
foo4 of A in common
foo5 of I in common
foo6 of I2 in common
foo7 of I2 in common
foo1 of A in common
foo2 of I2 in common
foo3 of I2 in common
foo4 of A in common
foo5 of I in common
foo6 of I2 in common
foo7 of I2 in common
foo1 of B in platform
foo2 of I2 in common
foo3 of I2 in common
foo4 of B in platform
foo5 of I in common
foo6 of I2 in common
foo7 of I2 in common
===
foo1 of A in common
foo2 of I2 in common
foo3 of I2 in common
foo4 of A in common
foo5 of I in common
foo6 of I2 in common
foo7 of I2 in common
foo1 of A in common
foo2 of I2 in common
foo3 of I2 in common
foo4 of A in common
foo5 of I in common
foo6 of I2 in common
foo7 of I2 in common
foo1 of B in platform
foo2 of I2 in common
foo3 of I2 in common
foo4 of B in platform
foo5 of I in common
foo6 of I2 in common
foo7 of I2 in common
*/
