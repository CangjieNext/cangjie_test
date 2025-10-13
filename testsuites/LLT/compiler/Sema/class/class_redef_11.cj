// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%frontendCompiler %noColor %typecheck %f 2>&1 | compare %f

main(): Int64 {
    if (Coo.foo<Int32>(1, 2) != 2 || Boo<Int32>.foo<Int32>(3, 4) != 4) {
        return 1
    }
    return 0
}

open class Boo<T> {
    public static func foo<V>(x: T, y: V) where V <: Int32 {
        return y
    }
}

class Coo <: Boo<Int32> {
    public static redef func foo<V>(x: Int32, y: V) where V <: Int64 {
        return y
    }
}

/* SCAN
error: the upper bound 'Int32' of generic parameter 'Generics-V' must be class or interface
  ==> class_redef_11.cj:17:28:
   | 
17 |     public static func foo<V>(x: T, y: V) where V <: Int32 {
   |                            ^ 
   | 

error: the upper bound 'Int64' of generic parameter 'Generics-V' must be class or interface
  ==> class_redef_11.cj:23:34:
   | 
23 |     public static redef func foo<V>(x: Int32, y: V) where V <: Int64 {
   |                                  ^ 
   | 

error: generics type arguments do not match the constraint of '(Int32, Generics-V) -> Generics-V'
  ==> class_redef_11.cj:10:17:
   | 
10 |     if (Coo.foo<Int32>(1, 2) != 2 || Boo<Int32>.foo<Int32>(3, 4) != 4) {
   |                 ^ 
   | 
note: 'Int32' is not a subtype of 'Int64'
  ==> class_redef_11.cj:23:59:
   | 
23 |     public static redef func foo<V>(x: Int32, y: V) where V <: Int64 {
   |                                                           ^ 
   | 

error: the constraint of type parameter is not looser than parent's constraint
  ==> class_redef_11.cj:23:59:
   | 
23 |     public static redef func foo<V>(x: Int32, y: V) where V <: Int64 {
   |                                                           ^^^^^^^^^^ 
   | 
   # note: parent constraint is 'Int32'

4 errors generated, 4 errors printed.
*/
