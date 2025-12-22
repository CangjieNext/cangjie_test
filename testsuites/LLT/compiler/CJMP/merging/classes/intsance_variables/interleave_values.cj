// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common class A {
    public common let b: Int64 = 1
    public let a: Int64 = 10
    public common let e: Int64 = 100
    public common let c: Int64 = b * 2
    public let f: Int64 = c * 3 + e * 4
    public common let g: Int64 = 1000
    public init() { }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

public platform class A {
    public platform let b: Int64 = 10000
    public let d: Int64 = 100000
    public platform let e: Int64 = 1000000
    public let h: Int64 = g * 5
    public let i: Int64 = 10000000
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor -j8 m_common.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)EXEC-PIPE: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)EXEC-PIPE: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    let a = A()
    println("a = ${a.a}")
    println("b = ${a.b}")
    println("c = ${a.c}")
    println("d = ${a.d}")
    println("e = ${a.e}")
    println("f = ${a.f}")
    println("g = ${a.g}")
    println("h = ${a.h}")
    println("i = ${a.i}")
}

/* SCAN
a = 10
b = 10000
c = 20000
d = 100000
e = 1000000
f = 4060000
g = 1000
h = 5000
i = 10000000
*/
