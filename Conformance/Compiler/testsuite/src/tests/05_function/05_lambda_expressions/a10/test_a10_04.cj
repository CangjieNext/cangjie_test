/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a10_04

  @Level:         1

  @Assertion:       5.5(10) The type annotation of parameters in Lambda expressions can be defaulted, and the 
                    compiler will try to infer the type from the context, and will report an error when the 
                    compiler cannot infer the type.

  @Description:     Check that if annotation of parameters in Lambda expressions is omited and compiler can't infer 
                    types from context - an error will be raised: as local variable.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

main() {
    var lambda0 = {a, b: Bool => }
}
