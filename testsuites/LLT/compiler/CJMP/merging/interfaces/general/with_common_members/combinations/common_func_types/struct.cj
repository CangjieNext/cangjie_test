// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp


public struct C {}

public common interface I {
    common func foo1(arg: C): C // common open abstract
    common func foo2(arg: C): C {
        println("foo2 of I in common")
        return C()
    } // common open
    common func foo3(arg: C): C {
        println("foo3 of I in common")
        return C()
    } // common open
    func foo4(arg: C): C // open abstract
    func foo5(arg: C): C {
        println("foo5 of I in common")
        return C()
    } // open
}

public class A <: I {
    public func foo1(arg: C): C {
        println("foo1 of A in common")
        return C()
    }
    public func foo4(arg: C): C {
        println("foo4 of A in common")
        return C()
    }
}

public func runCommon() {
    let a = A()
    a.foo1(C()) // foo1 of A in common
    a.foo2(C()) // foo2 of I in platform
    a.foo3(C()) // foo3 of I in common
    a.foo4(C()) // foo4 of A in common
    a.foo5(C()) // foo5 of I in common
}
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (LLVM and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (LLVM and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (LLVM and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

public platform interface I {
    platform func foo1(arg: C): C {
        println("foo1 of I in platform")
        return C()
    } // ok: common open
    // platform func foo2(): C // error: common open abstract
    platform func foo2(arg: C): C {
        println("foo2 of I in platform")
        return C()
    } // ok: common open

    func foo6(arg: C): C {
        println("foo6 of I in platform")
        return C()
    } // ok: open new func must have body
}

class B <: I {
    public func foo1(arg: C): C {
        println("foo1 of B in platform")
        return C()
    }
    public func foo4(arg: C): C {
        println("foo4 of B in platform")
        return C()
    }
}

public func run() {
    let a = A()
    a.foo1(C()) // foo1 of A in common
    a.foo2(C()) // foo2 of I in platform
    a.foo3(C()) // foo3 of I in common
    a.foo4(C()) // foo4 of A in common
    a.foo5(C()) // foo5 of I in common
    a.foo6(C()) // foo6 of I in platform

    let b = B()
    b.foo1(C()) // foo1 of B in platform
    b.foo2(C()) // foo2 of I in platform
    b.foo3(C()) // foo3 of I in common
    b.foo4(C()) // foo4 of B in platform
    b.foo5(C()) // foo5 of I in common
    b.foo6(C()) // foo6 of I in platform
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