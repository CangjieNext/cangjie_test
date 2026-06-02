/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a05_06

  @Level:         1

  @Assertion:    3.2.3.2(5) If the name of the local variable is the same as an entities defined in an upper-level
                 scope, the upper-level entity is shadowed whenever the local variable is accessible.

  @Description:  Checks that the upper-level entity is not shadowed when the local variable with 
                 same name is accessible for function class member.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

class Test {
    let test : Int32 = 0
    func foo() : Int32 {
        let test : Int32 = 1
        return test
    }    
}

main() {
    Assert.equals(1, Test().foo())
}
