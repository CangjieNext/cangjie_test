// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common class A {
    public static common var X1: Int64 = 1
    public static common var X2: Int64 = X1 + 1

    static init() {
        X1 = 10 // assigning, not initializing
    }
}

public common var G1: Int64 = 1
public common var G2: Int64 = A.X1 + 1

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public platform var (G1, G2): (Int64, Int64) = (100, 200)

public platform class A {
    public static platform var X1: Int64 = G1
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(G1)
    println(G2)
    println(A.X1)
    println(A.X2)
}

/* SCAN
100
200
10
101
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(G1)
    println(G2)
    println(A.X1)
    println(A.X2)
}

/* SCAN
100
200
10
101
*/
