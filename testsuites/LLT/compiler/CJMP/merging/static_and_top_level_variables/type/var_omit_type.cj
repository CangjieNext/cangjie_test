// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common var x  = 1
common var y = 33
common class A {
    common public var a = 1
    public init() {}
}
// SEPARATE-FILE: p.cj
// EXEC-0: %compiler %noColor --experimental p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// EXEC-PIPE:%run %output 2>&1 | compare %f

package cmp

specific var x = 2

specific class A {
}
main(){
    println(x)
    println(y)

}

/* SCAN
2
33
*/
