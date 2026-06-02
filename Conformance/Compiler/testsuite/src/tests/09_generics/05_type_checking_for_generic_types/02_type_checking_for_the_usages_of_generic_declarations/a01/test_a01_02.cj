/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_02_a01_02

  @Level:         1

  @Assertion: 9.5.2(1) For checking the usages of generic declaration, type parameters in generic declarations are 
              substituted with type arguments first, then check whether the type constraints are satisfied.

  @Description: Check prohibited type substitution due to constraints causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/


class C {}

func id<T>(x: T) where T <: C {
    return x
}

main() {
    id<Int64>(42)
}

