// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp


public common interface I {
    common static prop foo1: String // common open abstract
    common static prop foo2: String { get() { "foo2 of I in common" } } // common open
    common static prop foo3: String { get() { "foo3 of I in common" } } // common open
    static prop foo4: String // open abstract
    static prop foo5: String { get() { "foo5 of I in common" } }  // open
}

public class A <: I {
    public static prop foo1: String { get() { "foo1 of A in common" } } 
    public static prop foo4: String { get() { "foo4 of A in common" } } 
}

public func runCommon() {
    println(A.foo1) // foo1 of A in common
    println(A.foo2) // foo2 of I in specific
    println(A.foo3) // foo3 of I in common
    println(A.foo4) // foo4 of A in common
    println(A.foo5) // foo5 of I in common
}
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

public specific interface I {
    specific static prop foo1: String { get() { "foo1 of I in specific" } } // ok: common open
    specific static prop foo2: String { get() { "foo2 of I in specific" } } // ok: common open

    static prop foo6: String { get() { "foo6 of I in specific" } } // ok: open new func must have body
}

class B <: I {
    public static prop foo1: String { get() { "foo1 of B in specific" } } 
    public static prop foo4: String { get() { "foo4 of B in specific" } } 
}

public func run() {
    println(A.foo1) // foo1 of A in common
    println(A.foo2) // foo2 of I in specific
    println(A.foo3) // foo3 of I in common
    println(A.foo4) // foo4 of A in common
    println(A.foo5) // foo5 of I in common
    println(A.foo6) // foo6 of I in specific

    println(B.foo1) // foo1 of B in specific
    println(B.foo2) // foo2 of I in specific
    println(B.foo3) // foo3 of I in common
    println(B.foo4) // foo4 of B in specific
    println(B.foo5) // foo5 of I in common
    println(B.foo6) // foo6 of I in specific
}

main() {
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