// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
 
var _foo = 21
func foo(msg: String) {
    println("foo ${msg}")
    _foo += 1
    return _foo
}

public common class A {
    public common static var x: Int
    public common static var y: Int = 22
    public common static var z: Int = foo("never")

    // c.cj -> p.cj (BECAUSE `static init` after all direct initializers)
    static init(){
        x = 21
        z = foo("static init")
    }
}
 
// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib  2>&1 | compare %f
package cmp
 
public platform class A {
    public platform static var x: Int = 121
    public platform static var y: Int = 122
    public platform static var z: Int = foo("platform") // p.cj -> c.cj
}

/* SCAN
error: c.cj and p.cj might have file circular dependency
1 error generated, 1 error printed.
*/
