/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_01_a02_02

  @Level:         1

  @Assertion: 9.1(2) Multiple type parameters are separated using comma , in <>, e.g., <T1, T2, T3>, T1, T2, and T3 
              are all type parameters.

  @Description: Check several type parameters.

  @Mode: compileonly

  @Negative: no

*/

class GenericClass2<T1, T2> {
}

class GenericClass3<T1, T2, T3> {
}

interface GenericInterface2<T1, T2> {
}

interface GenericInterface3<T1, T2, T3> {
}

struct GenericStruct2<T1, T2> {
    GenericStruct2(var x1!: T1, var x2!: T2) {}
}

struct GenericStruct3<T1, T2, T3> {
    GenericStruct3(var x1!: T1, var x2!: T2, var x3!: T3) {}
}

enum GenericEnum2<T1, T2> {
    | Data1(T1)
    | Data2(T2)
    | ECode(Int64)
}

enum GenericEnum3<T1, T2, T3> {
    | Data1(T1)
    | Data2(T2)
    | Data3(T3)
    | ECode(Int64)
}

type GenericTypeAlias2<T1, T2> = GenericClass2<T1, T2>

type GenericTypeAlias3<T1, T2, T3> = GenericClass3<T1, T2, T3>

main() {
}

