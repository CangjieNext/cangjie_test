/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_06_a02_03

  @Level:         1

  @Assertion: 9.6(2) When using a generic declaration, such as calling a generic function, constructing a value 
              instance of a generic type, the values of all type parameters of the generic must be determined 
              and instantiated.

  @Description: During instantiation it's illegal to provide less arguments than is listed in the generic struct
                declaration.

  @Mode: compileonly

  @Negative: yes

*/

class GenericStruct<T1, T2> {
    GenericStruct(var x!: T1, var y!: T2) {}
}

main() {
    let s = GenericStruct<Int32>(x: 42, y: 42)
}

