// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common func foo(): Unit
public common func foo(a: Array<Int>): Unit
public common func foo(a: Array<String>): Unit

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

public platform func foo(): Unit {
    println("platform foo")
}

public platform func foo(a: Array<Int>): Unit {
    for (x in a) {
        println("Int: ${x}")
    }
}

public platform func foo(a: Array<String>): Unit {
    for (x in a) {
        println("String: ${x}")
    }
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    foo()
    foo([1, 42])
    foo(["a", "b"])
}
/* SCAN
platform foo
Int: 1
Int: 42
String: a
String: b
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    foo()
    foo([3, 44])
    foo(["b", "c"])
}


/* SCAN
platform foo
Int: 3
Int: 44
String: b
String: c
*/
