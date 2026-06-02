/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a08_04

  @Level:         1

  @Assertion: 9.2(8) For a particular type variable, its multiple constraints must be combined with & which simplified
              situations where one type parameter constrained by multiple upper bounds.

  @Description: Check that multiple upper bounds combined with | in generic struct declaration causes a compilation
                error.

  @Mode: compileonly

  @Negative: yes

*/

interface Printable {}

open class Animal {}

struct GenericStruct<T> where T <: Animal | Printable {
    GenericStruct(var x!: T) {}
}

main() {}

