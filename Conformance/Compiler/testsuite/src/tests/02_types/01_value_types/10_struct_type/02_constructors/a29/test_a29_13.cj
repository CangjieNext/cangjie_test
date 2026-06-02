/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a29_13

  @Level:         1

  @Assertion: 2.1.10.2(29)
              In addition to the primary constructor,
              other constructors can be defined as usual,
              but the other constructors must form an overload
              with the corresponding constructor of the primary constructor.

  @Description: Check that a struct can not have a primary constructor
                and an init constructor with the same signature
                and with different modifiers:
                signatures become the same during instantion of a generic struct

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

struct A<T> {
    public A(x: Int64) {}
    private init(x: T) {}
}

main() {
    A<Int64>(1)
    0
}