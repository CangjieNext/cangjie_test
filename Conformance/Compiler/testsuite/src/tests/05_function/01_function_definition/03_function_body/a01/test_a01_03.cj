/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_03_a01_03

  @Level:         1

  @Assertion:     5.1.3(1) The body of a function consists of a block. 

  @Description:   Check that function body can't be defined as block without {.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func foo(): Unit  
  var a = 1 
  let b = 1 
}

main() {
}
