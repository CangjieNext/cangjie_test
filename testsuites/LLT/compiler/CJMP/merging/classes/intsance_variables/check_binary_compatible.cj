// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// (LLVM and Linux)EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp.platform

public common class A {
    public common let a: Int64
    public common let b: Int64
    public init() {}
}

// SEPARATE-FILE: c/c1.cj
// (LLVM and Linux)EXEC-0: %compiler %noColor --experimental c/c1.cj --import-path=./c --output-type=dylib --output-dir ./p
package cmp.other

import cmp.platform.*

public func foo(a: A) {
    println("a = ${a.a}")
    println("b = ${a.b}")
}

// SEPARATE-FILE: p/p.cj
// (LLVM and Linux)EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.platform.chir --common-part-cjo=./c/cmp.platform.cjo --output-type=dylib --output-dir ./p
package cmp.platform

public platform class A {
    public let b1: Int64 = 1
    public platform let b: Int64 = b1 * 2
    public let a1: Int64 = b * 2
    public platform let a: Int64 = a1 * 2;
    public let c: Int64 = a * 2
}

// SEPARATE-FILE: m_common.cj
// (LLVM and Linux)EXEC-0: %compiler %noColor -j8 m_common.cj --import-path=./p -L./p -lcmp.platform -lcmp.other -o %output
// (LLVM and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.platform.*
import cmp.other.*

main(): Unit {
    let a = A()
    foo(a)

    println("==============")
    println("b1 = ${a.b1}")
    println("b = ${a.b}")
    println("a1 = ${a.a1}")
    println("a = ${a.a}")
    println("c = ${a.c}")
}

/* SCAN
a = 8
b = 2
==============
b1 = 1
b = 2
a1 = 4
a = 8
c = 16
*/
