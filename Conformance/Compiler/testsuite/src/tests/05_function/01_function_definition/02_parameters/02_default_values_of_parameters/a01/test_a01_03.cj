/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a01_03

  @Level:         1

  @Assertion:     5.1.2.2(1) Function parameters may have default values. Default values are declared with = as shown 
                  in the example below.


  @Description:   Check that non-named parameter can't have default value.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func myFunc(x: Int32 = 0 ): Int32 {
  x * 2
}

main() {
}