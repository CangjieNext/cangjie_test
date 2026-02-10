// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common interface I {}

public interface I2 <: I {
    func foo6(): Unit { println("foo6 of I2 in common") }
    func foo7(): Unit { println("foo7 of I2 in common") }
}

public open common class A <: I2 {
    init() {}
}

public func runCommon() {
    let a = A()
    a.foo6()
    a.foo7()
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public specific interface I {
    func foo6(): Unit { println("foo6 of I in specific") }
    func foo7(): Unit { println("foo7 of I in specific") }
}

public open specific class A <: I2 {
    public func foo7(): Unit { println("foo7 of A in specific") }
    public func foo6(): Unit { println("foo6 of A in specific") }
}

public func runPlatform() {
    let a = A()
    a.foo6()
    a.foo7()
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    runCommon()
}

/* SCAN
foo6 of A in specific
foo7 of A in specific
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    runCommon()
    runPlatform()
}


/* SCAN
foo6 of A in specific
foo7 of A in specific
foo6 of A in specific
foo7 of A in specific
*/