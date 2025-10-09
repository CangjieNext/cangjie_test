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

public common interface I2 <: I {}

public struct A <: I2 {}

public func runCommon() {
    let a = A()
    // NOTE: foo6 call must not be devirtualized
    // `Invoke` should be generated instead of `Apply`
    // Because of implementation can be moved to more close parent
    a.foo6()
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public platform interface I {
    platform func foo6(): Unit { println("I::foo6 platform") }
}

public platform interface I2 <: I {
    func foo6(): Unit { println("I2::foo6 platform") }
}

public func runPlatform() {
    let a = A()
    a.foo6()
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

func runCommonFromMain() {
    let a = A()
    a.foo6()
}

main() {
    runCommon()
    runCommonFromMain()
}

/* SCAN
I2::foo6 platform
I2::foo6 platform
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

func runCommonFromMain() {
    let a = A()
    a.foo6()
}

main() {
    runCommon()
    runPlatform()
    runCommonFromMain()
}


/* SCAN
I2::foo6 platform
I2::foo6 platform
I2::foo6 platform
*/
