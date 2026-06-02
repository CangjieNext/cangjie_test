/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_05_a01_1

  @Level:         1

  @Assertion:    1.5(1) Single-line comments begin with //, whose syntax is:
                  
  @Description:  Check Single-line comments

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/
import utils.assert.Assert

// This is a single-line comment started with the first position

main() {
  print("This is a line with comment")  // Just a single-line comment here.

   Assert.equals(55i8,0b110111_i8)   // line 1   /* unclosed multi-line comment
   Assert.equals(0o37i8,0b11111_i8); // line 2      unopened multi-line comment*/
   Assert.equals(0x1Fi8,0b11111_i8)  // line 3   /* usual multi-line comment*/

}
