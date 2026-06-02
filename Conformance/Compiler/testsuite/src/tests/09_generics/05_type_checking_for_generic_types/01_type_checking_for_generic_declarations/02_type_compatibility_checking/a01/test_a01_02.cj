/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_02_a01_02

  @Level:         1

  @Assertion: 9.5.1.2(1) Type checking for generic declarations mainly checks whether the generic type is compatible 
              with the type context it locates, whether the value of the generic type can access a certain member 
              variable or function is legal. 

  @Description: Check the value of the generic type accesses a certain member variable.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class S {
    S(var name!: String) {}
}

func projectOnName<T>(x: T): String  where T <: S{
    // Access a certain member variable.
    return x.name
}

main() {
    Assert.isTrue(projectOnName<S>(S(name: "Lucky")) is String)
}

