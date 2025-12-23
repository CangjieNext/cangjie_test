// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
 
common func foo(): Int

public common class A {
    // y -> foo -> _foo
    // SO: c.cj -> p.cj
    public static var x: Int = foo()
    init(a: Int64) {}
}
 
// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib  2>&1 | compare %f
package cmp
 
let _foo = 1
platform func foo(): Int { _foo }

public platform class A {
    public static var y: Int

    // `static init` -> x,y
    // SO: p.cj -> c.cj
    // SO: CIRCULAR DEPENDENCY
    static init(){
        y = 2
    }
}

/* SCAN
error: p.cj and c.cj might have file circular dependency
1 error generated, 1 error printed.
*/
