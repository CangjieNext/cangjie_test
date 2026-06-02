/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_04_a05_02

  @Level:         1

  @Assertion:    11.1.4(5) The directory will be ignored during compilation if it is empty or there
                 is no valid code in the file.  There is no output ( .cjo, .o) as well. 
 
  @Description:  Check that if compiler gets empty directory during compilation no error will be thrown
                 and no file will be created.

  @Mode:         compileonly 

  @Negative:     no  

  @Structure:    single
 
  @Comment:      This test uses custom driver written in `custom.py`. Compiler tries to build static lib
                 from directory without any valid files. Test considered passed if compiler won't throw any
                 error and won't create any files.           
*/

main() {
    return 0
}