
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_02_a03_13

  @Level:         1

  @Assertion:    11.2(3) The declaration or definition that are not modified by public 
                 can be accessed within the current package. And the internal is the default
                 accessibility. 
 
  @Description:  Check that internal is the default accessibility for Float64

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    complex-main

  @Dependencies: aux_test_a03_03.cj
 
*/

package pkg3
import pkga3.a12

main() {
    return 0
}
