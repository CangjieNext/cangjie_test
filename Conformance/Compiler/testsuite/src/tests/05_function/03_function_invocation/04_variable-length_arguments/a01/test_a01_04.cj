/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_04_a01_04

  @Level:         1

  @Assertion:       5.3.4(1) Variable-length arguments are a special kind of function call syntactic sugar. When the 
                    last non-named parameter is of Arraytype, the corresponding position in the arguments can be 
                    passed directly using a sequence of arguments instead of an Arrayliteral.

  @Description:     Check that syntactic sugar can't be used for non-last non-named parameter of Arraytype: enum 
                    member function.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

enum myEnum {

    S

    func f1(arr: Array <Int64>, a: Int64): Int64 { return a + arr.size }
}

main() {
    myEnum.S.f1(1, 2, 3, 3)
}
