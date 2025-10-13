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

func bar<T>(x: T) where T <: I1 & I2 {
}

class A<T> where T <: I1 & I2 {}

main() {
}

/* SCAN
error: return type of the inherited function members 'foo' are not identical and not in subtype relation
  ==> interface_conflict_inheritance_07.cj:17:25:
   | 
17 | func bar<T>(x: T) where T <: I1 & I2 {
   |                         ^^^^^^^^^^^^ 
   | 
   # note: conflict types are 'Int64', 'Struct-String'

error: return type of the inherited function members 'foo' are not identical and not in subtype relation
  ==> interface_conflict_inheritance_07.cj:20:18:
   | 
20 | class A<T> where T <: I1 & I2 {}
   |                  ^^^^^^^^^^^^ 
   | 
   # note: conflict types are 'Int64', 'Struct-String'

2 errors generated, 2 errors printed.
*/
