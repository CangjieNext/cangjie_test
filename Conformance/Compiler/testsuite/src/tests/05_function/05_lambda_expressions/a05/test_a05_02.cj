/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a05_02

  @Level:         1

  @Assertion:       5.5(5) Lambda expressions cannot be marked with a return type; the compiler will perform type 
                    inference on the Lambda to determine the return type.

  @Description:     Check that lambda expressions cannot be marked with a return type: class member lambda expression.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

class myClass {
    let f0: Int64 = {a: Int64, b: Int64 => a + b} 
}

main() {
}
