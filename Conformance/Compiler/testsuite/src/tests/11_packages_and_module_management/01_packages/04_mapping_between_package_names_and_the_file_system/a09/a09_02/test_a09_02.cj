/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_04_a09_02

  @Level:         1

  @Assertion:    11.1.4(9) 
    src 
    `-- directory_0 
         |-- directory_1 
         |     |-- a.cj 
    `-- directory_0.directory 
         |-- b.cj 

    // a.cj 
    package directory_0.directory_1.pkgA           // OK 

    // b.cj 
    package directory_0.directory_1.pkgB           // Error, the directory name is illegal. 
 
  @Description:  Check that code sample.

  @Mode:         compileonly 

  @Negative:     no  
 
  @Comment:      This test uses custom driver written in `custom.py`. Test considered passed if compiler 
                 throws an error while building static lib from b.cj. 
*/

main() {
    return 0
}