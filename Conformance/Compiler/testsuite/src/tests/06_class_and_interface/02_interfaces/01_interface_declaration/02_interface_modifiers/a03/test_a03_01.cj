/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_02_a03_01

  @Level:         1

  @Assertion: 6.2.1.2(3)
              public interface I {} // can be accessed outside the package
              interface I2 {} // can only be accessed inside the package

  @Description: Check that both interfaces are accessible inside the package

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

public interface TestA0301 {} // can be accessed outside the package
interface I2 {} // can only be accessed inside the package

class TypeChecker<T> {}

main() {
    let i1 = TypeChecker<TestA0301>()
    Assert.isTrue(i1 is TypeChecker<TestA0301>)

    let i2 = TypeChecker<I2>()
    Assert.isTrue(i2 is TypeChecker<I2>)
}