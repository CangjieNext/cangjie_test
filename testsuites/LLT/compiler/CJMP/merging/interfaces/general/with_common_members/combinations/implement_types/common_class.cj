// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp


public common interface I {
    common func foo1(): Unit // common open abstract
    common func foo2(): Unit { println("foo2 of I in common") } // common open
    common func foo3(): Unit { println("foo3 of I in common") } // common open
    func foo4(): Unit // open abstract
    func foo5(): Unit { println("foo5 of I in common") } // open
    func foo7(): Unit { println("foo7 of I in common") }
}

public common class A <: I {
    public init() {}
    public common func foo1(): Unit { println("foo1 of A in common") }
    public common func foo4(): Unit { println("foo4 of A in common") }
    public common func foo7(): Unit { println("foo7 of A in common") }
}

common class B <: I {
    public common func foo1(): Unit { println("foo1 of B in common") }
    public common func foo4(): Unit { println("foo4 of B in common") }
}

public func runCommon() {
    let a = A()
    a.foo1() // foo1 of A in common
    a.foo2() // foo2 of I in platform
    a.foo3() // foo3 of I in common
    a.foo4() // foo4 of A in common
    a.foo5() // foo5 of I in common
    a.foo7() // foo7 of A in platform
}
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

public platform interface I {
    platform func foo1(): Unit { println("foo1 of I in platform") } // ok: common open
    // platform func foo2(): Unit // error: common open abstract
    platform func foo2(): Unit { println("foo2 of I in platform") } // ok: common open

    func foo6(): Unit { println("foo6 of I in platform") } // ok: open new func must have body
}

public platform class A <: I {
    public platform func foo7(): Unit { println("foo7 of A in platform") }
}

platform class B <: I {
    public init() {}
    public platform func foo1(): Unit { println("foo1 of B in platform") }
    public platform func foo4(): Unit { println("foo4 of B in platform") }
    public func foo7(): Unit { println("foo7 of B in platform") }
}

public func run() {
    let a = A()
    a.foo1() // foo1 of A in common
    a.foo2() // foo2 of I in platform
    a.foo3() // foo3 of I in common
    a.foo4() // foo4 of A in common
    a.foo5() // foo5 of I in common
    a.foo6() // foo6 of I in platform
    a.foo7() // foo7 of A in platform

    let b = B()
    b.foo1() // foo1 of B in platform
    b.foo2() // foo2 of I in platform
    b.foo3() // foo3 of I in common
    b.foo4() // foo4 of B in platform
    b.foo5() // foo5 of I in common
    b.foo6() // foo6 of I in platform
    b.foo7() // foo7 of B in platform
}

main() {
    runCommon()
    run()
}

/* SCAN
foo1 of A in common
foo2 of I in platform
foo3 of I in common
foo4 of A in common
foo5 of I in common
foo7 of A in platform
foo1 of A in common
foo2 of I in platform
foo3 of I in common
foo4 of A in common
foo5 of I in common
foo6 of I in platform
foo7 of A in platform
foo1 of B in platform
foo2 of I in platform
foo3 of I in common
foo4 of B in platform
foo5 of I in common
foo6 of I in platform
foo7 of B in platform
*/
