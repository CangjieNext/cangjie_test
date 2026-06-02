/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_04_02_a01_06

  @Level:         1

  @Assertion: 9.4.2(1) If one or more type parameters are declared in the declaration of classes, interfaces, structs, 
              enum or typealias, they are called generic types. Syntax-wise, a type parameter is immediately followed 
              by the name (such as a class name or an interface name) and is enclosed in <>.

  @Description: Check that generic type alias type parameter being not enclosed in <> causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

interface GenericInterface<T> {}

type GenericTypeAlias T = GenericInterface<T>

main() {}

