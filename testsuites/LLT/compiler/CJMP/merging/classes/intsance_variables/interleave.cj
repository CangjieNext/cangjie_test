// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common class A {
    public common let b: Unit = { => println("common A.b") }()
    public let a: Unit = { => println("common A.a") }()
    public common let e: Unit = { => println("common A.e") }()
    private common let c: Unit = { _: Unit => println("common A.c(b)") }(this.b)
    public let f: Unit = { _: Unit, _: Unit => println("common A.f(c, e)") }(this.c, e)
    public common let g: Unit = { => println("common A.g") }()
    public init() { }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

public platform class A {
    public platform let b: Unit = { => println("platform A.b") }()
    private let d: Unit = { => println("platform A.d") }()
    public platform let e: Unit = { => println("platform A.e") }()
    public let h: Unit = { _: Unit => println("platform A.h(g)") }(g)
    public let i: Unit = { => println("platform A.i") }()
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor -j8 m_common.cj --import-path=./p -L./p -lcmp -o %output
// (LLVM and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
// (LLVM and Windows)EXEC-PIPE: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (LLVM and Darwin)EXEC-PIPE: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    A()
}

/* SCAN
common A.a
platform A.b
common A.c(b)
platform A.d
platform A.e
common A.f(c, e)
common A.g
platform A.h(g)
platform A.i
*/
