// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func NonExist(ptr: CPointer<Int64>): Unit

struct A {
    var a = 0
    init() {
        unsafe { NonExist(inout a) } // OK
    }

    func foo1() {
        unsafe { NonExist(inout a) } // ERROR
    }

    mut func foo2() {
        unsafe { NonExist(inout a) } // OK
    }
}

class B {
    var a = A()

    func goo() {
        a.foo1() // OK
        a.foo2() // ERROR
        this.a.foo1() // OK
        this.a.foo2() // ERROR
    }
}

main() { 0 }

/* SCAN
error: instance member variable 'a' cannot be modified in immutable function
  ==> inout_e31.cj:12:33:
   | 
12 |         unsafe { NonExist(inout a) } // ERROR
   |                                 ^ 
   | 

error: the variable qualified by 'inout' cannot be directly or indirectly derived from an instance of a 'class'
  ==> inout_e31.cj:25:9:
   | 
25 |         a.foo2() // ERROR
   |         ^ 
   | 

error: the variable qualified by 'inout' cannot be directly or indirectly derived from an instance of a 'class'
  ==> inout_e31.cj:27:9:
   | 
27 |         this.a.foo2() // ERROR
   |         ^^^^ 
   | 

3 errors generated, 3 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
