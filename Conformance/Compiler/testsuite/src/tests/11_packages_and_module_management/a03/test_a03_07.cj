/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_a03_07

  @Level:         1

  @Assertion:    11(3) Top-level definitions or declarations of the same name are not 
                 allowed within a package (except function overloading).
 
  @Description:  Check that top-level enums with the same name are not allowed 
                 within a package.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_test_a03_02.cj
  
*/
package package113

enum E1 {
    | Car(Int8)
    | Plane(Int32, Int32)
    | SpaceShattle(Float64)
}

main() {
    return 0
}