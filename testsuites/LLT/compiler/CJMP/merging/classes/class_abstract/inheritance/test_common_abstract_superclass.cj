// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common sealed abstract class A { init() {}}
common open class C<:A { public init() {}}

// SEPARATE-FILE: p.cj
// EXEC-0: %compiler %noColor --experimental p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// EXEC-PIPE:%run %output 
package cmp

specific sealed abstract class A {}
specific open class C<:A {}

main(): Unit {
    let a = C()
 0
}

