// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

open class C {}

class B <: C {}

extend B {
    public func foo(): Int {
        1
    }
}

interface I {
    func foo(): String
}

func bar<T>(x: T) where T <: C & B & I {
    return x.foo()
}

main() {
    return 1
}

/* SCAN
error: return type of the inherited function members 'foo' are not identical and not in subtype relation
  ==> generic_upper_constraint_inheritance_10.cj:23:25:
   | 
23 | func bar<T>(x: T) where T <: C & B & I {
   |                         ^^^^^^^^^^^^^^ 
   | 
   # note: conflict types are 'Int64', 'Struct-String'

1 error generated, 1 error printed.
*/
