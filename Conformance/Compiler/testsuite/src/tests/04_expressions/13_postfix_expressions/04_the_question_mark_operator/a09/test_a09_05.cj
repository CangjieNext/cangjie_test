/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a09_05

  @Level:         1

  @Assertion: 4.13.4(9) Using the expressions a?.b, c?(d) and e?[f] as examples.

              1. The type of expression a needs to be some Option<T1> and T1 contains an instance member b. The type
                 of expression c needs to be some Option<(T2)->U2> and d is of type T2. The type of expression e needs
                 to be some Option<T3> and T3 supports subscript operator.

  @Description: Check that usage of 'c?(d)' when 'c' is non-option type causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

func foo(arg: Int64) {
    return arg
}

main() {
    foo?(9)
}

