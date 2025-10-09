// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

import std.unittest.*
import std.unittest.testmacro.*

@UnittestOption[Int](qwe)

public func foo() {
    let c = Configuration()
    c.set(KeyQwe.qwe, 42)

    println(c)
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

import std.unittest.*
import std.unittest.testmacro.*

@UnittestOption[Int](zxc)

public func goo() {
    let c = Configuration()
    c.set(KeyZxc.zxc, 42)

    println(c)
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    foo()
}

/* SCAN
Configuration(qwe:42)
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    foo()
    goo()
}

/* SCAN
Configuration(qwe:42)
Configuration(zxc:42)
*/
