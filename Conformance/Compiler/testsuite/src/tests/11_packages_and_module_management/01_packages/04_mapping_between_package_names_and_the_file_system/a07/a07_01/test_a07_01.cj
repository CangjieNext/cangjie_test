/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_04_a07_01

  @Level:         1

  @Assertion:    11.1.4(7) 
    // The directory structure is as follows: 

    src 
    `-- directory_0 
         |-- directory_1 
         |     |-- a.cj 
         |     `-- b.cj 
         `-- c.cj 

    // in c.cj, we make a declaration. 

    // c.cj 
    package directory_0 

    // in the a.cj file, the package name needs to correspond to the path name. 

    // a.cj 
    package directory_0.directory_1 

    // b.cj 
    package directory_0.directory_1
 
  @Description:  Check code sample

  @Mode:         compileonly 

  @Negative:     no 

  @Structure:    single
 
*/

main() {
    return 0
}
