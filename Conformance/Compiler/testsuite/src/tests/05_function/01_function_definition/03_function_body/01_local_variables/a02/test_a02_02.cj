/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_03_01_a02_02

  @Level:         1

  @Assertion:     5.1.3.1(2) Local variables can be similarly declared with var or let. In the latter case, the 
                  variables are immutable. 

  @Description:   Check that local variable declared in function body with keyword 'let' is immutable.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func func0(): Unit { 
  let b = 1 
  b = 2
} 

main() {
  foo()
}
