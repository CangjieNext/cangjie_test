// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public let array = Array<Int64>(3, repeat: 3)  

public let arrayList = array

public class Z {
    public static let arrayZ = Array<Int64>(3, repeat: 3)  

    public static let arrayListZ = array
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

public let array2 = Array<Int64>(3, repeat: 3)  

public let arrayList2 = array2.clone()

public struct Z2 {
    public static let arrayZ2 = Array<Int64>(3, repeat: 3)  

    public static let arrayListZ2 = arrayZ2.clone()
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(array)
    println(arrayList)
    println(Z.arrayZ)
    println(Z.arrayListZ)
}

/* SCAN
[3, 3, 3]
[3, 3, 3]
[3, 3, 3]
[3, 3, 3]
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(array)
    println(arrayList)
    println(Z.arrayZ)
    println(Z.arrayListZ)
    println(array2)
    println(arrayList2)
    println(Z2.arrayZ2)
    println(Z2.arrayListZ2)
}

/* SCAN
[3, 3, 3]
[3, 3, 3]
[3, 3, 3]
[3, 3, 3]
[3, 3, 3]
[3, 3, 3]
[3, 3, 3]
[3, 3, 3]
*/