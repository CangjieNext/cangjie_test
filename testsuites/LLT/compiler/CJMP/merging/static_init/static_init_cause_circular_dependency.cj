// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
 
var _foo = 21
func foo() { // DEPENDENCY: foo -> _foo
    println("foo")
    return _foo
}

public common class A {
    public common static var x: Int = foo()
    public static var y: Int

    static init(){
        y = x
    }
}


// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib  2>&1 | compare %f
package cmp
 
public specific class A {
    // DEPENDENCY: x -> foo -> _foo
    // So, p.cj -> c.cj
    // BUT `static init` means that `x` initialized before `y` 
    public specific static var x: Int = foo()
}
/* SCAN
error: c.cj and p.cj might have file circular dependency
1 error generated, 1 error printed.
*/
