// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %n.%suffix 2>&1 | compare %f

interface I {
    func foo(): Unit
}

class A<T> where T <: I {}

func goo<X>(a: X) where X <: A<X> {
    a.foo()
}

main() {}

/* SCAN
error: 'foo' is not found for generic type 'X' in its upper bounds
  ==> generic_member_func_06.cj:16:7:
   | 
16 |     a.foo()
   |       ^^^ 
   | 

1 error generated, 1 error printed.
*/
