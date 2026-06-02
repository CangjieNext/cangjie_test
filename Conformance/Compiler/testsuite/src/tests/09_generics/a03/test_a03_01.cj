/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_a03_01

  @Level:         1

  @Assertion: 9(3) A function with generic parameter is a generic function.

  @Description: Checks generic function declaration.

  @Mode: compileonly

  @Negative: no

*/

func custom_d<T>(x: T): T {
    return x
}

main() {
}

