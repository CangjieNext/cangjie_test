/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_04_a04_01

  @Level:         1 EXCLUDE

  @Assertion:    11.1(5)A package consists of one or more source code files. The source code files of a package must be in the same directory, 
                and the source code files in the same directory must belong to the same package. 

  @Description:  Check that users can change root directory of the source file

  @Mode:         run 

  @Negative:     yes 

  @Structure:    single
 
  @Comment:      This test uses custom driver written in `custom.py`. Test considered passed if compiler 
                 succesfully build and run project from source files situated in modified root 
                 directory called 'modified_root_dir'.

*/

main() {
    return 0
}