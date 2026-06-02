/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a11_06

  @Level:         1

  @Assertion:     5.1(11) A function definition must have a block (excluding the parameters) as its function body, 
                  which cannot be omitted.

  @Description:   Check that function definition with function body block eclosed by () will produce error.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

  @Issue:         6143

*/

public func checkingFunc<T>(x: T)
(
  x
)

main() {
}
