// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c1.cj
package cmp

public let A1 = 1

public let A11 = A1 + 10

// SEPARATE-FILE: c/c2.cj
// EXEC-0: %compiler %noColor --experimental c/c1.cj c/c2.cj --output-type=chir --output-dir ./c
package cmp

public let B21 = A1 + 20

public let B32 = B21 + A11

// SEPARATE-FILE: p/p1.cj
package cmp

public let C122 = A1 + B21 + 100

public let C1043 = A11 + B32 + 1000

public let C3 = 3

// SEPARATE-FILE: p/p2.cj
// EXEC-0: %compiler %noColor --experimental p/p1.cj p/p2.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

public let D10144 = A1 + B21 + C122 + 10000

public let D30 = 30

public let D10145 = D10144 + 1

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L./p -lcmp -o %output
// (LLVM and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(A1)
    println(A11)
    println(B21)
    println(B32)
}

/* SCAN
1
11
21
32
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L./p -lcmp -o %output
// (LLVM and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(A1)
    println(A11)
    println(B21)
    println(B32)
    println(C122)
    println(C1043)
    println(C3)
    println(D10144)
    println(D30)
    println(D10145)
}

/* SCAN
1
11
21
32
122
1043
3
10144
30
10145
*/