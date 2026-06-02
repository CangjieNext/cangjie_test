/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        11_01_01_01_a04_01

  @Level:         1

  @Assertion:   11.1.1.1(4) According to the scope rules,  if the package 
                declaration has the same name as the top-level declaration
                in the current package, an error will be reported. 

  @Description: Check that package declaration cannot has the same name as the top-level declaration

  @Mode:        compileonly

  @Negative:    no

  @Structure:  single

*/

package foo

func foo() {
    return "foo"
}

main() {
    return 0
}
