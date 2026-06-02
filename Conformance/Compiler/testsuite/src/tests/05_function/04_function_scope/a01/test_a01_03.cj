/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_04_a01_03

  @Level:         1

  @Assertion:       5.4 (1) Functions can be declared at the top level or within other functions. 

  @Description:     Check that function can't be declared within other functions. 

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

  @Issue:           6281

*/

func parentFunc(a: Int32): Int32 {
    func nestedFunc(a: Int32): Int32
    return nestedFunc(a)
}

main() {
}
