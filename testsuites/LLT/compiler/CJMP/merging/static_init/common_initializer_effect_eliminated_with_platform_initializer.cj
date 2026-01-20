// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
 
common func foo(msg: String): Int

public common class A {
    public common static var x: Int
    public common static var y: Int = 22 // replaced by specific
    public common static var z: Int = foo("never") // THIS `foo` should not be called, because specific exists

    static init(){
        x = 21 // This value assignged AFTER p.cj initializer is called
    }
}
 
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

var _foo = 21
specific func foo(msg: String): Int {
    println("foo ${msg}")
    _foo += 1
    return _foo
}
 
public specific class A {
    public specific static var x: Int = 121 // initialize, but replaced with `x = 21`
    public specific static var y: Int = 122 // replace common
    public specific static var z: Int = foo("specific") // initialize with 22 (called before `static init` of A)
}

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(A.x)
    println(A.y)
    println(A.z)
}

/* SCAN
foo specific
21
122
22
*/
