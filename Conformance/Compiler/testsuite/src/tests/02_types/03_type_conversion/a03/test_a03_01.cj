/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_03_a03_01

  @Level:         1

  @Assertion:   2.3(3) For value types, we say valueTypeA to valueTypeB is convertible, when rules for converting
                valueTypeA to valueTypeB is defined. Otherwise, valueTypeA to valueTypeB is non-convertible.

  @Description:  Check that if no conversion rules for types are defined then conversion is not possible

  @Mode:         compileonly

  @Negative:     yes

*/

main(): Unit {
    let a = Rune(57)
    let b = Int64(a)
}
