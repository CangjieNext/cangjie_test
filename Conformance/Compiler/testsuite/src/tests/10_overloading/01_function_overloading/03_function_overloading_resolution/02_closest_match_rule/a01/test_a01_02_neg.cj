/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_02_a01_02_neg

  @Level:         1

  @Assertion:    10.1.3.2(1) There are multiple functions with the highest priority 
                 in the candidate set: {f_1, ..., f_n}. These functions are called
                 match items. If there is a unique match item f_m, which is more 
                 matched than all other matches, f_m is the most matched function.

  @Description:  Compiler emits error, as it is impossible to inherit superclass

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/


open class Base {   

}
class Sub <: Base {
}

class SubSub <: Sub{
}


main(ina :Array<String>) {
    0
}

