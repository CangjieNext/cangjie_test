/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_04_a11_02

  @Level:         1

  @Assertion:       5.3.4(11) The function overloading resolution will always give preference to functions that can 
                    be matched without using variable-length arguments, and will only try to use variable-length 
                    argument resolution if all functions cannot be matched.
                    The compiler will report an error when it cannot resolve.

  @Description:     Check that the compiler will report an error when function cannot be resolved

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

  @Issue:           6295

*/
open class myOpenClass {
    func g(arg: Array<Int64>): Int64 {
        return arg[0]
    }
}
class myClass <: myOpenClass {
    func g(pos: Int64, arg: Array<Int64>): Int64 {
        return arg[pos]
    }
}

main() {
    var myClassImpl = myClass()
    myClassImpl.g(0, 5, 12, 6)
    0
}
