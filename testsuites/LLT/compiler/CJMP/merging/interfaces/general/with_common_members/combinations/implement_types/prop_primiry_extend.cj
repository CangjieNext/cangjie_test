// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp


public common interface I {
    common prop foo1: String // common open abstract
    common prop foo2: String { get() { "foo2 of I in common" } } // common open
    common prop foo3: String { get() { "foo3 of I in common" } } // common open
    prop foo4: String // open abstract
    prop foo5: String { get() { "foo5 of I in common" } }  // open
}

extend Int64 <: I {
    public prop foo1: String { get() { "foo1 of A in common" } } 
    public prop foo4: String { get() { "foo4 of A in common" } } 
}

public func runCommon() {
    let a: Int64 = 0
    println(a.foo1) // foo1 of A in common
    println(a.foo2) // foo2 of I in specific
    println(a.foo3) // foo3 of I in common
    println(a.foo4) // foo4 of A in common
    println(a.foo5) // foo5 of I in common
}
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

public specific interface I {
    specific prop foo1: String { get() { "foo1 of I in specific" } } // ok: common open
    specific prop foo2: String { get() { "foo2 of I in specific" } } // ok: common open

    prop foo6: String { get() { "foo6 of I in specific" } } // ok: open new func must have body
}

extend Bool <: I {
    public prop foo1: String { get() { "foo1 of B in specific" } } 
    public prop foo4: String { get() { "foo4 of B in specific" } } 
}

public func run() {
    let b = true
    println(b.foo1) // foo1 of B in specific
    println(b.foo2) // foo2 of I in specific
    println(b.foo3) // foo3 of I in common
    println(b.foo4) // foo4 of B in specific
    println(b.foo5) // foo5 of I in common
    println(b.foo6) // foo6 of I in specific
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
foo1 of B in specific
foo2 of I in specific
foo3 of I in common
foo4 of B in specific
foo5 of I in common
foo6 of I in specific
*/