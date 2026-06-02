/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_04_a09_01

  @Level:         1

  @Assertion:       5.4(9)
                    extend MyType { 
                        func foo(): Unit 
                    } 

  @Description:     Positive example from spec

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Issue:           6272

*/
import utils.assert.Assert

type MyType = Int64
extend MyType { 
    func foo(): Unit {}
} 

main() {
    var myVar: MyType = 12
    Assert.isTrue(myVar.foo is () -> Unit)
}
