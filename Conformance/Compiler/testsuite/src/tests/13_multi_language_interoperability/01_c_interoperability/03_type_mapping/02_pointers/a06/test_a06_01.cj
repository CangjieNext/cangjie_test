/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_02_a06_01

  @Level:         1

  @Assertion:    13.1.3.2(6)  CPointer can construct an instance by its type
                 name, and the value is corresponding to C language’s NULL. 
                   func test() { 
                     let p = CPointer<Int64>() 
                     let r1 = p.isNull() // r1 == true 
                   } 
 
  @Description:  Example from the specification.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

 func test() {
    let p = CPointer<Int64>()
    let r1 = p.isNull() // r1 == true
    Assert.isTrue(r1)
}

main() {
    test()
}
