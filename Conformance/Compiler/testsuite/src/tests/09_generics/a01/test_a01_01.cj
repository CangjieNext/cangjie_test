/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_a01_01

  @Level:         1

  @Assertion: 9(1) A declaration which has type parameters declared within angle brackets can be called a generic
              declaration.

  @Description: Checks generic class and function declaration.

  @Mode: compileonly

  @Negative: no

*/

class GenericClassExample<T> {
}

func genericIdentityFunctionExample<T>(x: T): T {
    return x;
}

main() {
}

