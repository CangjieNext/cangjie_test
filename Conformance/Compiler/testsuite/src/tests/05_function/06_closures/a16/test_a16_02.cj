/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 05_06_a16_02

  @Level:         1

  @Assertion: 5.6(16) The following rules must be met for captured variables: 

              * The variable must be initialized before being captured. Otherwise, an error will be reported during
                compilation. 

  @Description: Check that attempt to capture uninitialized variable by lambda closure causes a compilation error.

  @Mode: compileonly

  @Negative: yes
*/

main() {
    var x: Int64

    var y = { => x * 2 }()

    x = 3
}

