/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a11_03

  @Level:         1

  @Assertion:     5.1(11) A function definition must have a block (excluding the parameters) as its function body, 
                  which cannot be omitted.

  @Description:   Check that function definition with not closed function body block will produce error.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

public func checkingFunc<T>(x: T){
  x


main() {
}
