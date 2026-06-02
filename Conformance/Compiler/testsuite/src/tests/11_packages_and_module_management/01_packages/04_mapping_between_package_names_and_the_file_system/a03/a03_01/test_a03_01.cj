/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_04_a03_01

  @Level:         1

  @Assertion:    11.1.4(3)  By default, src is the root directory of source files of a project.
                 So that, without special instructions, we use src as the root directory of a 
                 module to contain the sub-directories and source files which should follow the
                 rules as described in this section.
 
  @Description:  Check that src could be the root directory of source files of a project.

  @Mode:         run 

  @Negative:     no  

  @Structure:    single
 
  @Comment:      This test uses custom driver 'custom.py'. Test considered passed if compiler will not
                 throw any errors and print "Hello, world!".

*/

main() {
    return 0
}