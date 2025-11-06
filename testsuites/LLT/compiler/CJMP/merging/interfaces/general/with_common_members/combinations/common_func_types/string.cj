// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp


public common interface I {
    common func foo1(arg: String): String // common open abstract
    common func foo2(arg: String): String {
        println("foo2 of I in common")
        return ""
    } // common open
    common func foo3(arg: String): String {
        println("foo3 of I in common")
        return ""
    } // common open
    func foo4(arg: String): String // open abstract
    func foo5(arg: String): String {
        println("foo5 of I in common")
        return ""
    } // open
}

public class A <: I {
    public func foo1(arg: String): String {
        println("foo1 of A in common")
        return ""
    }
    public func foo4(arg: String): String {
        println("foo4 of A in common")
        return ""
    }
}

public func runCommon() {
    let a = A()
    a.foo1("") // foo1 of A in common
    a.foo2("") // foo2 of I in platform
    a.foo3("") // foo3 of I in common
    a.foo4("") // foo4 of A in common
    a.foo5("") // foo5 of I in common
}
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

public platform interface I {
    platform func foo1(arg: String): String {
        println("foo1 of I in platform")
        return ""
    } // ok: common open
    // platform func foo2(): String // error: common open abstract
    platform func foo2(arg: String): String {
        println("foo2 of I in platform")
        return ""
    } // ok: common open

    func foo6(arg: String): String {
        println("foo6 of I in platform")
        return ""
    } // ok: open new func must have body
}

class B <: I {
    public func foo1(arg: String): String {
        println("foo1 of B in platform")
        return ""
    }
    public func foo4(arg: String): String {
        println("foo4 of B in platform")
        return ""
    }
}

public func run() {
    let a = A()
    a.foo1("") // foo1 of A in common
    a.foo2("") // foo2 of I in platform
    a.foo3("") // foo3 of I in common
    a.foo4("") // foo4 of A in common
    a.foo5("") // foo5 of I in common
    a.foo6("") // foo6 of I in platform

    let b = B()
    b.foo1("") // foo1 of B in platform
    b.foo2("") // foo2 of I in platform
    b.foo3("") // foo3 of I in common
    b.foo4("") // foo4 of B in platform
    b.foo5("") // foo5 of I in common
    b.foo6("") // foo6 of I in platform
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