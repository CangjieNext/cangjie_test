// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common interface I {
    common func foo6(): Unit { println("I::foo6 common") }
}

public common interface I2 <: I {
}

class A <: I2 {}

public func runCommon() {
    let a = A()
    a.foo6()
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public specific interface I {
    specific func foo6(): Unit { println("I::foo6 specific") }
}

public specific interface I2 <: I {
    func foo6(): Unit { println("I2::foo6 specific") }
}

public func runPlatform() {
    let a = A()
    a.foo6()
}

// SEPARATE-FILE: m_platform.cj
// EXEC-PIPE-0: %compiler %noColor m_platform.cj --import-path=./p -L. -lcmp -o %output 2>&1 | compare %f

// NOTE: ast2chir checker do not report any messages about duplication in vtable.
// NOTE: If you need to modify this test just insert actuall output below.
/* SCAN
*/

// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    runCommon()
    runPlatform()
}

/* SCAN
I2::foo6 specific
I2::foo6 specific
*/
