/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_a17_01

  @Level:         1

  @Assertion:    11.1.3(17) Circular dependency imports between
                 packages is forbidden. 
 
  @Description:  Check that circilar dependencies imports between
                 packages are forbidden.

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    single
 
  @Comment:      This tests uses custom driver written in `custom.py`. Source dir 
                 contains two packages importing each other. Test considered passed
                 if compiler throws an error during compilation.
*/

main() {
    return 0
}