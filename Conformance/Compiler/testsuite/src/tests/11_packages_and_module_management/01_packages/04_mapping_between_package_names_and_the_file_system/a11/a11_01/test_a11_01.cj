/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_04_a11_01

  @Level:         1

  @Assertion:    11.1.4(11) 
    // a.cj 
    package A 
    public class B {}       // Error, top-level declaration "B" clashes with sub-directory of same name. 

    // b.cj 
    package A.B            // Error, package "A.B" clashes with the top-level declaration "B" in package "A". 
 
  @Description:  Check that code sample.
  
  @Mode:         compileonly 

  @Negative:     no  
 
  @Issue:        6354

  @Comment:      This test uses custom driver written in `custom.py`. Test considered passed if compiler 
                 throws an error during compilation since top-level declaration "B" clashes with sub-directory
                 with the same name.
*/

main() {
    return 0
}