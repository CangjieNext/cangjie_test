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
}

public open common class A <: I {
    public init() {}
    public open common func foo1(): Unit { println("foo1 of A in common") }
    public open common func foo4(): Unit { println("foo4 of A in common") }
}

common class AA <: A {
    init() {}
    public common func foo1(): Unit { println("foo1 of AA in common") }
    public common func foo4(): Unit { println("foo4 of AA in common") }
}

open common class B <: I {
    init() {}
    public open common func foo1(): Unit { println("foo1 of B in specific") }
    public open common func foo4(): Unit { println("foo4 of B in specific") }
}

common class BB <: B {
    init() {}
    public common func foo1(): Unit { println("foo1 of BB in common") }
    public common func foo4(): Unit { println("foo4 of BB in common") }
}

public func runCommon() {
    let a = AA()
    a.foo1() // foo1 of A in common
    a.foo2() // foo2 of I in specific
    a.foo3() // foo3 of I in common
    a.foo4() // foo4 of A in common
    a.foo5() // foo5 of I in common
}
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

public specific interface I {
    specific func foo1(): Unit { println("foo1 of I in specific") } // ok: common open
    // specific func foo2(): Unit // error: common open abstract
    specific func foo2(): Unit { println("foo2 of I in specific") } // ok: common open

    func foo6(): Unit { println("foo6 of I in specific") } // ok: open new func must have body
}

public open specific class A <: I {
    public open specific func foo1(): Unit { println("foo1 of A in specific") }
    public open specific func foo4(): Unit { println("foo4 of A in specific") }
}

open specific class B <: I {
}

specific class AA <: A {
    public specific func foo1(): Unit { println("foo1 of AA in specific") }
    public specific func foo4(): Unit { println("foo4 of AA in specific") }
}
specific class BB <: B {
}

public func run() {
    let a = AA()
    a.foo1() // foo1 of A in common
    a.foo2() // foo2 of I in specific
    a.foo3() // foo3 of I in common
    a.foo4() // foo4 of A in common
    a.foo5() // foo5 of I in common
    a.foo6() // foo6 of I in specific

    let b = BB()
    b.foo1() // foo1 of B in specific
    b.foo2() // foo2 of I in specific
    b.foo3() // foo3 of I in common
    b.foo4() // foo4 of B in specific
    b.foo5() // foo5 of I in common
    b.foo6() // foo6 of I in specific
}

main() {
    runCommon()
    run()
}

/* SCAN
foo1 of AA in specific
foo2 of I in specific
foo3 of I in common
foo4 of AA in specific
foo5 of I in common
foo1 of AA in specific
foo2 of I in specific
foo3 of I in common
foo4 of AA in specific
foo5 of I in common
foo6 of I in specific
foo1 of BB in common
foo2 of I in specific
foo3 of I in common
foo4 of BB in common
foo5 of I in common
foo6 of I in specific
*/
