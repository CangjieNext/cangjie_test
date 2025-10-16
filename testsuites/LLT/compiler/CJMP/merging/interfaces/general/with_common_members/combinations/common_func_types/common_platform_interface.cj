// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp


public common interface I {
    common func foo1(i: I): I // common open abstract
    common func foo2(i: I): I {
        println("foo2 of I in common")
        R()
    } // common open
    common func foo3(i: I): I {
        println("foo3 of I in common")
        R()
    } // common open
    func foo4(i: I): I // open abstract
    func foo5(i: I): I {
        println("foo5 of I in common")
        R()
    } // open
}

public class A <: I {
    public func foo1(i: I): I {
        println("foo1 of A in common")
        R()
    }
    public func foo4(i: I): I {
        println("foo4 of A in common")
        R()
    }
}

public class R <: I {
    public func foo1(i: I): I { R() }
    public func foo4(i: I): I { R() }
}

public func runCommon() {
    let a: I = A()
    a.foo1(a) // foo1 of A in common
    a.foo2(a) // foo2 of I in platform
    a.foo3(a) // foo3 of I in common
    a.foo4(a) // foo4 of A in common
    a.foo5(a) // foo5 of I in common
}
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (LLVM and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (LLVM and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (LLVM and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

public platform interface I {
    platform func foo1(i: I): I {
        println("foo1 of I in platform")
        R()
    } // ok: common open
    // platform func foo2(): I // error: common open abstract
    platform func foo2(i: I): I {
        println("foo2 of I in platform")
        R()
    } // ok: common open

    func foo6(i: I): I {
        println("foo6 of I in platform")
        R()
    } // ok: open new func must have body
}

class B <: I {
    public func foo1(i: I): I {
        println("foo1 of B in platform")
        R()
    }
    public func foo4(i: I): I {
        println("foo4 of B in platform")
        R()
    }
}

public func run() {
    let a = A()
    a.foo1(a) // foo1 of A in common
    a.foo2(a) // foo2 of I in platform
    a.foo3(a) // foo3 of I in common
    a.foo4(a) // foo4 of A in common
    a.foo5(a) // foo5 of I in common
    a.foo6(a) // foo6 of I in platform

    let b = B()
    b.foo1(b) // foo1 of B in platform
    b.foo2(b) // foo2 of I in platform
    b.foo3(b) // foo3 of I in common
    b.foo4(b) // foo4 of B in platform
    b.foo5(b) // foo5 of I in common
    b.foo6(b) // foo6 of I in platform
}

main(): Unit {
    runCommon()
    run()
}

/* SCAN
foo1 of A in common
foo2 of I in platform
foo3 of I in common
foo4 of A in common
foo5 of I in common
foo1 of A in common
foo2 of I in platform
foo3 of I in common
foo4 of A in common
foo5 of I in common
foo6 of I in platform
foo1 of B in platform
foo2 of I in platform
foo3 of I in common
foo4 of B in platform
foo5 of I in common
foo6 of I in platform
*/