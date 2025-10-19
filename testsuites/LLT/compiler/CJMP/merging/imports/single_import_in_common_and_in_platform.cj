//  Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: dep/dep.cj
// EXEC-0: %compiler %noColor --experimental dep/dep.cj --output-type=dylib 
package dep

public let a = "a"
public let b = "b"
public let c = "c"
public let d = "d"


// SEPARATE-FILE: c/c1.cj
package cmp

import dep.a

public func fa() {
    println(a)
}

// SEPARATE-FILE: c/c2.cj
// EXEC-0: %compiler %noColor --experimental c/c1.cj c/c2.cj -ldep --output-type=chir --output-dir ./c
package cmp

import dep.b

public func fb() {
    println(b)
}


// SEPARATE-FILE: p/p1.cj
package cmp

import dep.c

public func fc() {
    println(c)
}

// SEPARATE-FILE: p/p2.cj
// EXEC-0: %compiler %noColor --experimental p/p1.cj p/p2.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -L. -ldep --output-type=dylib
package cmp

import dep.d

public func fd() {
    println(d)
}

public func fabcd() {
    fa()
    fb()
    fc()
    fd()
}
 

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    fa()
    fb()
}

/* SCAN
a
b
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    fa()
    fb()
    fc()
    fd()
}

/* SCAN
a
b
c
d
*/ 
