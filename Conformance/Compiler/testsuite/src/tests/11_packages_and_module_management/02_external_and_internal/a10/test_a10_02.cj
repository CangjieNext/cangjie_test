/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_02_a10_02

  @Level:         1

  @Assertion:    11.2(10) The type referenced in the generic declaration modified by public (the type argument
                 of the generic type, the upper bound in the where constraint) must be external. 
 
  @Description:  Check that type referenced in the generic declaration modified by public must be external

  @Mode:         run 

  @Negative:     no  

  @Structure:    single
 
*/

import utils.assert.Assert

public class TestA1002 {

}

public func foo<T>() where T <: TestA1002 {
    return "foo"
}

main() {
    Assert.equals("foo", foo<TestA1002>())
}