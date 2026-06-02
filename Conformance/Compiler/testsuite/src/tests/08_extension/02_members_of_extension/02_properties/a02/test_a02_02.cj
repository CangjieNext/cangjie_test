/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_a02_02

  @Level:         1

  @Assertion:       8.2.2(2) None of these properties can be abstract properties.

  @Description:     Check that class extension can't define abstract proprety.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

  @Issue:           6124

*/

class MyClass {}

extend MyClass {
    prop a: Int64
}

main(): Unit { } 
