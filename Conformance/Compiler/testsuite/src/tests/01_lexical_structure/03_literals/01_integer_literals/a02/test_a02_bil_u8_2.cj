/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_01_a02_bil_u8_2

  @Level:         1

  @Assertion:    1.3.1(2) Binary literals must start with 0b(or 0B)
                  
  @Description:  Compiler check that binary used correct prefix. Type UInt8  

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/
main():UInt8 {
   return 0bB010_1010u8
}
