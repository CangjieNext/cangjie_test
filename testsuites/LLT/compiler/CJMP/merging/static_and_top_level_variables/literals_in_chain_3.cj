// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c1.cj
package cmp

public let X = 1

public common let C1: Int = 3

public var Y = C1 + 1

// SEPARATE-FILE: c/c2.cj
package cmp

public common let C2: Int = C1 + 2

// SEPARATE-FILE: c/c3.cj
// EXEC-0: %compiler %noColor --experimental c/c1.cj c/c2.cj c/c3.cj --output-type=chir --output-dir ./c
package cmp

public let Z = C1 * (X + 9) 


// SEPARATE-FILE: p/p1.cj
package cmp

public platform let C1: Int = 4

// SEPARATE-FILE: p/p2.cj
// EXEC-0: %compiler %noColor --experimental p/p1.cj p/p2.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

public platform let C2: Int = C1 + 10


// So, the order when compiling 'common':
// C2 -> C1, C3 -> C1

// After adding platform:
//  C2 -> C1, C3 -> C1, C3 -> P1 ,C1 -> P1, P2 -> P1

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L./p -lcmp -o %output
// (LLVM and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(X)
    println(Y)
    println(Z)
    println(C1)
    println(C2)
}

/* SCAN
1
5
40
4
14
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L./p -lcmp -o %output
// (LLVM and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(X)
    println(Y)
    println(Z)
    println(C1)
    println(C2)
}

/* SCAN
1
5
40
4
14
*/