/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_02_a05_02

  @Level:         1

  @Assertion: 4.2(5) For variable names, it is specified that variables 
              declared by var are always mutable and that variables 
              declared by let may only be assigned once (at or after its 
              declaration), before the assignment it is mutable and after the
              assignment it is immutable.
  @Description: Checks that variables declared by let can be assigned once.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

let i = Assert.getRuntimeZero()
let str: String = ""

class C {
    let id = 12345
    let name: String
    static let address = "address"
    init() {
        name = "C"
    }    
}

struct S {
    let Id: Int64
    let address = "addr"
    static var name = "S"
    init() {
        Id = 1
        Assert.equals(1, Id)
        Assert.equals("addr", address)
    }
}

main() {
    let f = 3.1428
    let b: Bool 
    b = true

    Assert.equals(0, i)
    Assert.equals("", str)
    Assert.approxEquals(3.1428, f)
    Assert.isTrue(b)
    Assert.equals("address", C.address)
    Assert.equals("S", S.name)    

    let c = C()
    Assert.equals(12345, c.id)
    Assert.equals("C", c.name)

    let s = S()
}
