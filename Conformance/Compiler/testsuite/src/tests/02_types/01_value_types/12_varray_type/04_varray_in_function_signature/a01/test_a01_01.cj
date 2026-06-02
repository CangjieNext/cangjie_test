/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_12_04_a01_01

  @Level:         1

  @Assertion:    2.1.12.4(1) When VArray is used as a parameter or return value of a function, 
                 the length of VArray needs to be annotated.
  
  @Description:  Must emit error due to varray arg has no size

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Issue:       0006077

  @Comment:     Compiler emit error on VArray<..., $..>

*/


func myFunc<T>(a: VArray<T,$2>, // correct argument
               b: VArray<T>) {  // arg w/o size, must emit error
} 


main() {
    0
}