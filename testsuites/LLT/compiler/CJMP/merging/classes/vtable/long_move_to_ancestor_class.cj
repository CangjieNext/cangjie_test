// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public open common class A1 {
    public init() {}
}
public open class A2 <: A1 {}
public open common class A3 <: A2 {
    public init() {}
}
public open class A4 <: A3 {
    public open func foo(): Unit { println("A4 common") } 
}

public open class A5 <: A4 {}

public open class A6 <: A5 {
    public open func foo(): Unit { println("A6 common") } 
}

public func runCommonA4(a: A4) {
    a.foo()
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public open platform class A1 {
    public open func foo(): Unit { println("A1 platform") }
}

public open platform class A3 <: A2 { }

public func runPlatformA1(a: A1) {
    a.foo()
}

public func runPlatformA4(a: A4) {
    a.foo()
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    runCommonA4(A4())
    runCommonA4(A5())
    runCommonA4(A6())
}

/* SCAN
A4 common
A4 common
A6 common
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    runCommonA4(A4())
    runCommonA4(A5())
    runCommonA4(A6())
    runPlatformA1(A1())
    runPlatformA1(A2())
    runPlatformA1(A3())
    runPlatformA1(A4())
    runPlatformA1(A5())
    runPlatformA1(A6())
    runPlatformA4(A4())
    runPlatformA4(A5())
    runPlatformA4(A6())
}


/* SCAN
A4 common
A4 common
A6 common
A1 platform
A1 platform
A1 platform
A4 common
A4 common
A6 common
A4 common
A4 common
A6 common
*/