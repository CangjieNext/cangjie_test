/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a16_01

  @Level:         1

  @Assertion:       5.5(16) Here are some examples. 
                    let r1 = {a: Int64, b: Int64 => a + b}(1, 2) // r1 = 3 
                    let r2 = { => 123 }()                               // r2 = 123 

  @Description:     Positive examples from spec

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

main() {
    let r1 = {a: Int64, b: Int64 => a + b}(1, 2) // r1 = 3 
    let r2 = { => 123 }()                               // r2 = 123 

    Assert.equals(3, r1)
    Assert.equals(123, r2)
}
