// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

import std.random.*

public common class A {
    public common init(a: Int64, b: Random, c: Array<Int64>) {
        println("[common] A.init(${a}, ${b.nextInt64() * 0 + 42}, ${c[0]})")
    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

import std.random.*

public platform class A {}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor -j8 m_common.cj --import-path=./c -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

import std.random.*

main(): Unit {
    let a = A(41, Random(), [42])
}

/* SCAN
[common] A.init(41, 42, 42)
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor -j8 m_platform.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

import std.random.*

main(): Unit {
    let a = A(42, Random(), [43])
}

/* SCAN
[common] A.init(42, 42, 43)
*/
