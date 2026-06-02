/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_04_a07_14

  @Level:         1

  @Assertion:       5.3.4(7) Other operator overloads, compose, and pipeline calls are not supported.

  @Description:     Check that >= operator overload doesn't support variable-length syntax sugar.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

class myClass {
    operator func >=(arr: Array<Int64>) {
        false
    }
}
main() {
    var myClassImpl = myClass()
    myClassImpl>=(1, 2)
    0
}
