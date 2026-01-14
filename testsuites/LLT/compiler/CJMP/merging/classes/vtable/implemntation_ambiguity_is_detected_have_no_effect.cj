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

public common interface I3 {}

private class A <: I & I3 {}
private class B <: I & I3 {
    public func foo6(): Unit { println("B::foo6 common") }
}

public func runCommonA() {
    A().foo6()
    getAAsI().foo6()
}

public func getAAsI(): I {
    return A()
}

public func getAAsI3(): I3 {
    return A()
}

public func runCommonB() {
    B().foo6()
    getBAsI().foo6()
}

public func getBAsI(): I {
    return B()
}

public func getBAsI3(): I3 {
    return B()
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public specific interface I {
    specific func foo6(): Unit { println("I::foo6 specific") }
}

public specific interface I3 {
    func foo6(): Unit { println("I3::foo specific") }
} 

public func run() {
    getAAsI().foo6()
    getAAsI3().foo6()
    getBAsI().foo6()
    getBAsI3().foo6()
}
// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    runCommonA()
    runCommonB()
}

/* SCAN
I3::foo specific
I3::foo specific
B::foo6 common
B::foo6 common
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    runCommonA()
    runCommonB()
    run()
}


/* SCAN
I3::foo specific
I3::foo specific
B::foo6 common
B::foo6 common
I3::foo specific
I3::foo specific
B::foo6 common
B::foo6 common
*/
