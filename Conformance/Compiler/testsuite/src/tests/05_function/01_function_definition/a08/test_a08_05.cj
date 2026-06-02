/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a08_05

  @Level:         1

  @Assertion:     5.1(8) Multiple parameters are separated by comma.

  @Description:   Check that usage "." as separator will produce error.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
func myFunc(a:Int32. b:Float16 ):String {
  ""
}
main() {
}
