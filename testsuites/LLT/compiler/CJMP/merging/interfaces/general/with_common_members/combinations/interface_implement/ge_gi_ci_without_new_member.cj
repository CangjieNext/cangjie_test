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

public interface I2 <: I {}

public enum A <: I2 {
    | TEST_ENUM
    public func foo1(): Unit { println("foo1 of A in common") }
    public func foo4(): Unit { println("foo4 of A in common") }
}

public func runCommon() {
    let a = TEST_ENUM
    a.foo1() // foo1 of A in common
    a.foo2() // foo2 of I in platform
    a.foo3() // foo3 of I in common
    a.foo4() // foo4 of A in common
    a.foo5() // foo5 of I in common
}
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (LLVM and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (LLVM and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (LLVM and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

public platform interface I {
    platform func foo1(): Unit { println("foo1 of I in platform") } // ok: common open
    // platform func foo2(): Unit // error: common open abstract
    platform func foo2(): Unit { println("foo2 of I in platform") } // ok: common open

    func foo6(): Unit { println("foo6 of I in platform") } // ok: open new func must have body
}

enum B <: I2 {
    | TEST_ENUM
    public func foo1(): Unit { println("foo1 of B in platform") }
    public func foo4(): Unit { println("foo4 of B in platform") }
}

public func run() {
    let a = A.TEST_ENUM
    a.foo1() // foo1 of A in common
    a.foo2() // foo2 of I in platform
    a.foo3() // foo3 of I in common
    a.foo4() // foo4 of A in common
    a.foo5() // foo5 of I in common
    a.foo6() // foo6 of I in platform

    let b = B.TEST_ENUM
    b.foo1() // foo1 of B in platform
    b.foo2() // foo2 of I in platform
    b.foo3() // foo3 of I in common
    b.foo4() // foo4 of B in platform
    b.foo5() // foo5 of I in common
    b.foo6() // foo6 of I in platform
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
