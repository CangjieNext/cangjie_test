/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_02_a01_04

  @Level:         1

  @Assertion:   4.17.2(1) e as T is an expression for type conversion, and the type of e as T is Option<T>. where e can
                be an expression of any type and T can be any concrete type.
  @Description: Checks that `as` is not permitted with a generic typealias. 
  @Mode: compileonly
  @Negative: yes
  @Structure: single

*/

type A<T> = (T, T) -> T

main() {
    1 as A

    0
}