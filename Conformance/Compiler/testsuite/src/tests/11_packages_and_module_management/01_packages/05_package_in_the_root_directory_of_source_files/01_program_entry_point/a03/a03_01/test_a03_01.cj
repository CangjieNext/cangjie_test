/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_05_01_a03_01

  @Level:         1

  @Assertion:    11.1.5.1(3) main is not a function.
 
  @Description:  Check that main is not a function. 
                 
  @Mode:         compileonly 

  @Negative:     yes  
 
  @Comment:      This test uses custom driver `custom.py`. Compiler tries to build
                 static lib from a.cj which contains function called `main`. Test 
                 considered passed if compiler throws an error.
*/

main() {
    return 0
}