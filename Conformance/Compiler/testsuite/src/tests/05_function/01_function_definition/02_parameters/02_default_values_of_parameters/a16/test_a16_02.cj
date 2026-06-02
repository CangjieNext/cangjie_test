/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a16_02

  @Level:         1

  @Assertion:     5.1.2.2(16)
                  // Compile-time error. 
                  // func f(a: Int32, b!: Int32 = 2, c: Int32): Int32 { ... } 
                  // OK. 
                  func f1(a: Int32, b: Int32, c!: Int32 = 3, d!: Int32 = 4): Int32 { 
                    a + b + c + d 
                  } 
                  func test() { 
                    f1(1, 2)         // 10,   f1(1, 2, 3, 4) 
                    f1(1, 2, c: 5)            // 12,  f1(1, 2, 5, 4) 
                  } 

  @Description:   Negative example from the spec.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func f(a: Int32, b!: Int32 = 2, c: Int32): Int32 { 12 } 

main() {
}
