/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_04_a01_02

  @Level:         1

  @Assertion:       5.4 (1) Functions can be declared at the top level or within other functions. 

  @Description:     Check that function can't be declared at the top level. 

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

  @Issue:           6281

*/
func globalFunction(): String

main() {
}
