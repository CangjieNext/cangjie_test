/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a07_02

  @Level:         1

  @Assertion:     5.1(7) The parameters of a function are enclosed by ().

  @Description:   Check that function definition with parameters list not enclosed by () will produce error: 
                  more then one parameter.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
func myFunc a:Int32, b: Float32, c:Bool :String {
  ""
}
main() {
}
