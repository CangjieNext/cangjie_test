/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a12_04

  @Level:         1

  @Assertion:    3.3.1(12) When defining member variables in classes and structs, 
                 only the binding pattern can be used (see Binding Patterns).

  @Description:  Check that struct member variables can't be defined using tuple pattern.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

struct myStruct { 
    private let (x, y) = (26, "AAA")
} 

main() {
}