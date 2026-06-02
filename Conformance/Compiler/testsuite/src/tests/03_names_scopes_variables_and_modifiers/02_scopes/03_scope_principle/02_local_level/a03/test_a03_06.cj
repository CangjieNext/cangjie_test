/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a03_06

  @Level:         1

  @Assertion:    3.2.3.2(3) The scope of local variables starts after the variable declaration 
                 and ends with the closing of the block.

  @Description:  Checks that variable defined within the try block is not accessible for the this block.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

main() {
    try { 
        let v1 = - 5 
        throw ArithmeticException()
    } catch (e: ArithmeticException) {
        let v2 = -10
    }

    let v3 = v1
    let v4 = v2
}
