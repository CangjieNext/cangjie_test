/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_01_a04_01

  @Level:         1

  @Assertion: 9.1(4) When using an identifier to refer a type introduced by a declaration of type parameters, the 
              identifier is called type variable. The Syntax of type parameter is as follows.
              typeParameters
                  : '<' identifier (',' identifier)* '>'
                  ;

  @Description: Check correct typeParameters declaration.

  @Mode: compileonly

  @Negative: no
*/

class GenericClass1<T1> {
}

class GenericClass2<T1, T2> {
}

class GenericClass3<T1, T2, T3> {
}

interface GenericInterface1<T1> {
}

interface GenericInterface2<T1, T2> {
}

interface GenericInterface3<T1, T2, T3> {
}

struct GenericStruct1<T1> {
    GenericStruct1(var x1!: T1) {}
}

struct GenericStruct2<T1, T2> {
    GenericStruct2(var x1!: T1, var x2!: T2) {}
}

struct GenericStruct3<T1, T2, T3> {
    GenericStruct3(var x1!: T1, var x2!: T2, var x3!: T3) {}
}

enum GenericEnum1<T1> {
    | Data1(T1)
    | ECode(Int64)
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

type GenericTypeAlias1<T1> =
    GenericClass1<T1>

type GenericTypeAlias2<T1, T2> =
    GenericClass2<T1, T2>

type GenericTypeAlias3<T1, T2, T3> =
    GenericClass3<T1, T2, T3>

func genericFunction1<T1>(x1: T1): T1 {
    return x1
}

func genericFunction2<T1, T2>(x1: T1, x2: T2): T1 {
    return x1
}

func genericFunction3<T1, T2, T3>(x1: T1, x2: T2, x3: T3): T1 {
    return x1
}

main() {
}

