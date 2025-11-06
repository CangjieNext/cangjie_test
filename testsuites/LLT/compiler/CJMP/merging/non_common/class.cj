// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

import std.random.*

public class A {
    public func memberFunc() {
        println("From member func")
    }
}

public common func foo(x: Int64, random: Random, array: Array<Int64>, a: A): Unit

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

import std.random.*

public platform func foo(x: Int64, random: Random, array: Array<Int64>, a: A): Unit {
    a.memberFunc()
    println("${x}_${random.nextInt64() % 1}_${array[0]}")
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor -j8 m_common.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)EXEC-PIPE: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)EXEC-PIPE: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

import std.random.*

main(): Unit {
     foo(
          42,
          Random(), 
          Array(1, repeat: 44),
          A()
     )
     A().memberFunc()
}

/* SCAN
From member func
42_0_44
From member func
*/
