// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/ca.cj
// EXEC-0: %compiler %noColor --experimental c/ca.cj --output-type=chir --output-dir ./c
package a

public open common class A {
    init() {}
}

public class B <: A {
    public init() { super() }
    public var b1 = "b1"
}

public func runCommon() {
    let b = B()
    println(b.b1)
}

// SEPARATE-FILE: p/pa.cj
// EXEC-0: %compiler %noColor --experimental p/pa.cj ./c/a.chir --common-part-cjo=./c/a.cjo --output-type=dylib
package a

public platform open class A {
  public var a1 = "a1"
}

public func run() {
    let b = B()
    println(b.b1)
}

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj -L. -la -o %output
// EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p:./c %run %output 2>&1 | compare %f
import a.*

main() {
    runCommon()
    run()
}

/* SCAN
b1
b1
*/

