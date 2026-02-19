// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
 
var _foo = 21
func foo() {
    println("foo")
    _foo += 1
    return _foo
}

public common class A {
    public common static var x: Int
    public common static var y: Int = 22
    public common static var z: Int = foo() // initialize with 22

    static init(){
        x = 21
        z = foo() // assign 23
    }
}

var _boo = 31
func boo() {
    println("boo")
    _boo += 1
    return _boo
}

public class B {
    public static var x: Int
    public static var y: Int = 32
    public static var z: Int = boo() // initialize with 32

    static init() {
        x = 31
        z = boo() // assign 33
    }
}
 
 
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp
 
public specific class A {
    public specific static var x: Int = 121
    public specific static var y: Int = 122
}
 

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(A.x)
    println(A.y)
    println(A.z)
    println("=")
    println(B.x)
    println(B.y)
    println(B.z)
}

/* SCAN
foo
foo
boo
boo
21
122
23
=
31
32
33
*/
