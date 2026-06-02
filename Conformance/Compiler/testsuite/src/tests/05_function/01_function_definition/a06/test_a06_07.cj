/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a06_07

  @Level:         1

  @Assertion:     5.1(6) The function name is followed by one or more parameters of the function. Each parameter is enclosed by (). For details, see Parameters

  @Description:   Check that function definition with parameters list enclosed by [] instead () will produce error: 
                  one parameter.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

  @Issue:         6131

*/
func myFunc[g:Float32]:String {
  ""
}
main() {
}
