/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_06_02_a09_01

  @Level:         1

  @Assertion:    2.1.6.2(9) 
    let d1 = "The $ sign."
    // The result of "d1" is: The $ sign.
    let d2 = "The \${v}."
    // The result of "d2" is: The ${v}.

  @Description:  Positive examples from spec.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert

main() {
  let d1 = "The $ sign."
  // The result of "d1" is: The $ sign.
  Assert.equals("The $ sign.", d1)
  let d2 = "The \${v}."
  // The result of "d2" is: The ${v}.
  Assert.equals("The \${v}.", d2)
}