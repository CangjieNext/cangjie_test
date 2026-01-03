// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp


public common class A {
  public init() {}
}

// SEPARATE-FILE: p/p.cj
// EXEC-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// ASSERT: scan not all the member variables are initialized in this constructo
package cmp

public platform class A {
    public A( public var a: Int64) {}
}


main() {
  let a = A(1)
  println("${a.a}")
}
