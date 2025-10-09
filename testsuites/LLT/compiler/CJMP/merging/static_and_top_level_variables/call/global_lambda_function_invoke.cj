// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
public common let a:Int64=1

public let b = 10

public let f1 = { =>println(a+b+3)}

public common let f2: () -> Unit = { => println("hello f2")}
// SEPARATE-FILE: p/p.cj
// EXEC-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
package cmp
public platform let a:Int64=2

public let c = 100

public platform let f2: () -> Unit = { => println(a+b+c+3)}

// When merging platform there is effective circullar dependency:
// `f1` depends on `a` (c.cj -> p.cj)
// `f2` depends on `b` (p.cj -> c.cj)

/*SCAN
error: p.cj and c.cj might have file circular dependency
*/