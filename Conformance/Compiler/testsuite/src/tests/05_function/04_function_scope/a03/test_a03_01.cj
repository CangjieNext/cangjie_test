/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_04_a03_01

  @Level:         1

  @Assertion:       5.4(3) In the following example, the function globalFunction is a global function. 
                    func globalFunction() {} 

  @Description:     Positive example from spec

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

func globalFunction() {} 

func testFunc() {
    Assert.isTrue(globalFunction is () -> Unit)
    globalFunction()
}
main() {
    Assert.isTrue(globalFunction is () -> Unit)
    globalFunction()
}
