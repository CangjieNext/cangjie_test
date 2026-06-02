// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func NonExist(ptr: CPointer<Int64>): Unit

struct A {
    var a = 0
}

struct B {
    var a = A()
    
    init() {
        unsafe { NonExist(inout a.a) }      // OK
        unsafe { NonExist(inout this.a.a) } // OK
    }

    func foo1() {
        unsafe { NonExist(inout a.a) }      // ERROR
        unsafe { NonExist(inout this.a.a) } // ERROR
    }

    mut func foo2() {
        unsafe { NonExist(inout a.a) }      // OK
        unsafe { NonExist(inout this.a.a) } // OK
    }
}

class C {
    var b = B()

    func goo() {
        b.foo1()      // OK
        b.foo2()      // ERROR
        this.b.foo1() // OK
        this.b.foo2() // ERROR
    }
}

main() { 0 }

/* SCAN
error: instance member variable 'a' cannot be modified in immutable function
  ==> inout_e32.cj:18:33:
   | 
18 |         unsafe { NonExist(inout a.a) }      // ERROR
   |                                 ^ 
   | 

error: instance member variable 'a' cannot be modified in immutable function
  ==> inout_e32.cj:19:33:
   | 
19 |         unsafe { NonExist(inout this.a.a) } // ERROR
   |                                 ^ 
   | 

error: the variable qualified by 'inout' cannot be directly or indirectly derived from an instance of a 'class'
  ==> inout_e32.cj:33:9:
   | 
33 |         b.foo2()      // ERROR
   |         ^ 
   | 

error: the variable qualified by 'inout' cannot be directly or indirectly derived from an instance of a 'class'
  ==> inout_e32.cj:35:9:
   | 
35 |         this.b.foo2() // ERROR
   |         ^^^^ 
   | 

4 errors generated, 4 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
