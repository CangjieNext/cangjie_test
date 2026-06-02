/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_01_a03_oil_u16

  @Level:         1

  @Assertion:    1.3.1(3) octal literals must start with 0o(or 0O)
                  
  @Description:  Compiler check that octal used only 0-7. Type UInt16 

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/
main():UInt16 {
   return 0O734861u16
}
