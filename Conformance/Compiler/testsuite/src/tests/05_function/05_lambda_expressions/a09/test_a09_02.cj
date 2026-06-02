/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a09_02

  @Level:         1

  @Assertion:       5.5(9) • If no such context exists, the type of the expression on the right side of => is treated 
                    as the return type.

  @Description:     Check that if no context exist an lambda parameters types not defined - compiler error will be 
                    raised.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

class myClass {
    var lambda = {a, b => a + b} 
}

main() {
    var myClassImpl = myClass()
    var myVar = myClassImpl.lambda(13, 6)
}
