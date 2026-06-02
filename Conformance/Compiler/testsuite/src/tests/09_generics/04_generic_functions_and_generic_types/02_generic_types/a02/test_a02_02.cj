/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_04_02_a02_02

  @Level:         1

  @Assertion: 9.4.2(2) Multiple type parameters are separated by “,”.

  @Description: Check that multiple type parameters being not separated by "," causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

class GenericClass<T1 T2> {
    init(arg1: T1, arg2: T2) {
        x1 = arg1
        x2 = arg2
    }

    var x1: T1
    var x2: T2
}

main() {}

