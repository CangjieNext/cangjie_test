/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_05_01_a06_01

  @Level:         1

  @Assertion:    11.1.5.1(6) If the module is compiled using the compilation method
                 of generating executable files (specified by the users), the compiler
                 will only look for the main method at the top level of root directory
                 of source files. 
 
  @Description:  Check that when compiler tries to build module using the compilation method
                 of generating executable files it will only look for main method at the top level 
                 of root directory of source files.

  @Mode:         compileonly 

  @Negative:     no  
 
  @Comment:      This test uses custom driver written in `custom.py`. Compiler tries to
                 build executable module from root directory `pkg1`. Test considered passed
                 if compiler will not create any files in work directory since root directory
                 does not contain main method at top level.              
*/

main() {
    return 0
}