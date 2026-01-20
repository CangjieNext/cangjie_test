// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp


public common interface I {
    common operator func ()(): I // common open abstract
    common operator func +(arg: I): I {
        println("foo2 of I in common")
        return A()
    } // common open
    common operator func -(arg: I): I {
        println("foo3 of I in common")
        return A()
    } // common open
    operator func *(arg: I): I // open abstract
    operator func /(arg: I): I {
        println("foo5 of I in common")
        return A()
    } // open
}

public class A <: I {
    public operator func ()(): I {
        println("foo1 of A in common")
        return A() 
    }
    public operator func *(arg: I): I {
        println("foo4 of A in common")
        return A()
    }
}

public func runCommon() {
    let a = A()
    a() // foo1 of A in common
    a + a // foo2 of I in specific
    a - a // foo3 of I in common
    a * a // foo4 of A in common
    a / a // foo5 of I in common
}
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

public specific interface I {
    specific operator func ()(): I {
        println("foo1 of I in specific")
        return A()
    } // ok: common open
    // specific operator func foo2(): Int64 // error: common open abstract
    specific operator func +(arg: I): I {
        println("foo2 of I in specific")
        return A()
    } // ok: common open

    operator func -(): I {
        println("foo6 of I in specific")
        return A()
    } // ok: open new operator func must have body
}

class B <: I {
    public operator func ()(): I {
        println("foo1 of B in specific")
        return A()
    }
    public operator func *(arg: I): I {
        println("foo4 of B in specific")
        return A()
    }
}

public func run() {
    let a = A()
    a() // foo1 of A in common
    a + a // foo2 of I in specific
    a - a // foo3 of I in common
    a * a // foo4 of A in common
    a / a // foo5 of I in common
    -a // foo6 of I in specific

    let b = B()
    b() // foo1 of B in specific
    b + b // foo2 of I in specific
    b - b // foo3 of I in common
    b * b // foo4 of B in specific
    b / b // foo5 of I in common
    -b // foo6 of I in specific
}

main(): Unit {
    runCommon()
    run()
}

/* SCAN
foo1 of A in common
foo2 of I in specific
foo3 of I in common
foo4 of A in common
foo5 of I in common
foo1 of A in common
foo2 of I in specific
foo3 of I in common
foo4 of A in common
foo5 of I in common
foo6 of I in specific
foo1 of B in specific
foo2 of I in specific
foo3 of I in common
foo4 of B in specific
foo5 of I in common
foo6 of I in specific
*/