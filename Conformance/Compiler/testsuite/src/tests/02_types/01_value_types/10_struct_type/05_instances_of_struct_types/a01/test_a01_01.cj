/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_05_a01_01

  @Level:         1

  @Assertion:       2.1.10.5(1) When a struct type is defined, the corresponding instance of the struct can be
                    instanced.

  @Description:     Check creating struct instances.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

struct S <: ToString {
    let v: Int64
    init() { this.v = 0 }
    init(v: Int64) { this.v = v }
    public func toString() { v.toString() }
}

main() {
    S()
    S(0)
    let s = S()
    var s1 = S(1)
    Assert.equals("0", S().toString())
    Assert.equals("1", S(1).toString())
    Assert.equals("0", s.toString())
    Assert.equals("1", s1.toString())
}
