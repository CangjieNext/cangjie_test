/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_02_a06_04

  @Level:         1

  @Assertion: 4.2(6) The instance member variables of struct and class are
              always mutable in their constructors, regardless of whether they
              are declared with let or var.
  @Description: Checks that instance member variables declared by let are always 
                mutable in the struct constructor.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue:0006261

*/

import utils.assert.Assert

struct S {
    let Id = 12345
    let name: String

    init() {      
        name = "Nick"
        Assert.equals("Nick", name)
    }    

    S(iid: Int64, iname: String) {      
        name = "Tom"
        Assert.equals("Tom", name)
    }    
}

main() {
    S()
    S(Assert.getRuntimeZero(), "Nick")
    return
}
