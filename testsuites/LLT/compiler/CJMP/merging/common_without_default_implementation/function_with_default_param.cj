// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
import std.collection.*

public func goo() {
    return ArrayList<Int64>([0])
}

public common func foo(a!: ArrayList<Int64> = goo()): Unit

public func boo() {
    foo()
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp
import std.collection.*

public platform func foo(a!: ArrayList<Int64>): Unit {
    println("platform a = ${a}")
}

public func koo() {
    foo()
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L./p -lcmp -o %output
// (LLVM and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*
import std.collection.*

main(): Unit {
     boo()
     foo(a: ArrayList<Int64>([1]))
}

/* SCAN
platform a = [0]
platform a = [1]
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L./p -lcmp -o %output
// (LLVM and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*
import std.collection.*

main(): Unit {
     koo()
     foo(a: ArrayList<Int64>([2]))
}

/* SCAN
platform a = [0]
platform a = [2]
*/