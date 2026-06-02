/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_04_a01_05

  @Level:         1

  @Assertion:     5.1.4(1) The return type of a function can be either 
                    • Any type described in Chapter 2 
                    • a tuple type, in which case multiple values can be returned at the same time in the form of a 
                    tuple.

  @Description:   Check that function can't use return value with type incompatible with function return type.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func funcInt8(): Int8 { 
  "DDD"
} 


main() {
}
