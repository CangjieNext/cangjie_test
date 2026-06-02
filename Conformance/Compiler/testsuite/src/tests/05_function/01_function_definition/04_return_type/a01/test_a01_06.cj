/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_04_a01_06

  @Level:         1

  @Assertion:     5.1.4(1) The return type of a function can be either 
                    • Any type described in Chapter 2 
                    • a tuple type, in which case multiple values can be returned at the same time in the form of a 
                    tuple.

  @Description:   Check that the return type of function cannot be calculated from the function body if return values 
                  do not have the common supertype

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func funcInt8(inVal: Bool) { 
  if(inVal) {
    return 9
  }
  return 'c'
} 


main() {
}
