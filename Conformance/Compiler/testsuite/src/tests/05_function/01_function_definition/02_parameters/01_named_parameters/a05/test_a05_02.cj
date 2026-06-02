/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_01_a05_02

  @Level:         1

  @Assertion:     5.1.2.1(5)
    func add(a: Int32, b!: Int32): Int32 { a + b } 
    add(1, b: 2) // ok 
    add(1, 2)     // error 

  @Description:   Negative example from spec.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func add(a: Int32, b!: Int32): Int32 { a + b } 

main() {
  add(1, 2)     // error 
}
