/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_a05_02

  @Level:         1

  @Assertion:     5.1.2(5)
    func foo(a: Int64, b: Float64) { 
        a = 1        // Error: the parameter 'a' is immutable, and cannot be assigned. 
        b = 1.0      // Error: the parameter 'b' is immutable, and cannot be assigned. 
    } 

  @Description:   Negative test from spec (part 2).

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func foo(a: Int64, b: Float64) { 
  b = 1.0      // Error: the parameter 'b' is immutable, and cannot be assigned. 
}

main() {
}
