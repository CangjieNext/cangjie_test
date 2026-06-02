/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_05_01_a07_02

  @Level:         1

  @Assertion:    11.1.5.1(7) If no or multiple main methods are found, the compiler will
                 report an error.
 
  @Description:  Check that compiler building executable module will throw an error if
                 root directory of source files contains multiple main methods at top level.

  @Mode:         compileonly 

  @Negative:     yes  
 
  @Comment:      This test uses custom driver written in `custom.py`.      
*/

main() {
    return 0
}