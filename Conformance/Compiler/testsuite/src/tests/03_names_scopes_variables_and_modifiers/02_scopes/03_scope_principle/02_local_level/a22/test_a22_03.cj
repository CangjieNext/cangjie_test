/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a22_03

  @Level:         1

  @Assertion:    3.2.3.2(22) For all three types of loops, the loop condition has the same scope level 
                 as the loop block, i.e. the names introduced therein must not shadow each other.

  @Description:  Checks that the name introduced in the while expression doesn't shadow the loop condition.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Issue:        6374

*/

main() {
    let a = 0
    while (let b <- a) {
        let b : Int32 = -1
        break
    }
}
