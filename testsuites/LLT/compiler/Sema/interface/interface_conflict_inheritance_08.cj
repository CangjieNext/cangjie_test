// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%frontendCompiler %typecheck %cmp_opt %f 2>&1 | compare %f

interface I1 {
    func foo(): Int
}

interface I2 {
    func foo(): String
}

class A<T> where T <: I2 {
    func test<X>() where X <: I1 & T {}
}

func f<T1, T2, T3>() where T1 <: T2 & I1, T2 <: T3, T3 <: I2 {}

main() {
}

/* SCAN
error: the upper bound 'Generics-T' of generic parameter 'Generics-X' must be class or interface
  ==> interface_conflict_inheritance_08.cj:18:15:
   | 
18 |     func test<X>() where X <: I1 & T {}
   |               ^ 
   | 

error: the upper bound 'Generics-T2' of generic parameter 'Generics-T1' must be class or interface
  ==> interface_conflict_inheritance_08.cj:21:8:
   | 
21 | func f<T1, T2, T3>() where T1 <: T2 & I1, T2 <: T3, T3 <: I2 {}
   |        ^^ 
   | 

error: the upper bound 'Generics-T3' of generic parameter 'Generics-T2' must be class or interface
  ==> interface_conflict_inheritance_08.cj:21:12:
   | 
21 | func f<T1, T2, T3>() where T1 <: T2 & I1, T2 <: T3, T3 <: I2 {}
   |            ^^ 
   | 

error: return type of the inherited function members 'foo' are not identical and not in subtype relation
  ==> interface_conflict_inheritance_08.cj:18:26:
   | 
18 |     func test<X>() where X <: I1 & T {}
   |                          ^^^^^^^^^^^ 
   | 
   # note: conflict types are 'Int64', 'Struct-String'

error: return type of the inherited function members 'foo' are not identical and not in subtype relation
  ==> interface_conflict_inheritance_08.cj:21:28:
   | 
21 | func f<T1, T2, T3>() where T1 <: T2 & I1, T2 <: T3, T3 <: I2 {}
   |                            ^^^^^^^^^^^^^ 
   | 
   # note: conflict types are 'Int64', 'Struct-String'

5 errors generated, 5 errors printed.
*/
