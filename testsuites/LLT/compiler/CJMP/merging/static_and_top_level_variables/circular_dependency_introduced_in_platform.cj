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
    public common static var x: Int = foo() // THIS `foo` should not be called, because platform exists
    // y -> x BUT x CAN BE INITIALIZED ONLY AFTER c.cj INITIALIZED,
    // SO, THERE IS CIRCULAR DEPENDENCY THAT CAN BE DETECTED ONLY WHEN COMPILING PLATFORM
    public static var y = x
}
 
// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib 2>&1 | compare %f
package cmp
 
public platform class A {
    // p.cj -> c.cj BECAUSE OF x -> foo -> _foo
    public platform static var x: Int = foo()
}

/* SCAN
error: c.cj and p.cj might have file circular dependency
1 error generated, 1 error printed.
*/
