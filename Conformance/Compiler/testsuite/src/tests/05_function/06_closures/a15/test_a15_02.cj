/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 05_06_a15_02

  @Level:         1

  @Assertion: 5.6(15) The following rules must be met for captured variables: 

              * The captured variable must be visible in the closure definition. Otherwise, an error is reported
                during compilation.

  @Description: Check that attempt to capture invisible variable by lambda closure causes a compilation error.

  @Mode: compileonly

  @Negative: yes
*/

main() {
    var y = { => x * 2 }()
    var x = 3
}

