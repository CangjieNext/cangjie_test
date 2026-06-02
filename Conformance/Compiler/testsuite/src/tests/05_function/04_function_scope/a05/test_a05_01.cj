/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_04_a05_01

  @Level:         1

  @Assertion:       5.4(5) As shown in the following example, the function nestedFunction is a nested function and 
                    Its scope starts from the definition and ends at the end of the globalFunction function body. 
                    func globalFunction() { 
                        func nestedFunction() {} 
                    }

  @Description:     Positive example from spec

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

func globalFunction() { 
    func nestedFunction() {} 
    Assert.isTrue(nestedFunction is () -> Unit)
}

main() {
    Assert.isTrue(globalFunction is () -> Unit)
    globalFunction()
}
