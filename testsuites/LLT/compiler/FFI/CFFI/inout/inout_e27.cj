// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func NonExist(ptr: CPointer<Int32>): Unit

struct Data {
    var a: Int32 = 0

    mut func modify() {
        unsafe { NonExist(inout a) }      // OK
        unsafe { NonExist(inout this.a) } // OK
    }
}

class A {
    var d = Data()
}

unsafe main() {
    A().d.modify() // ERROR
    var a = A()
    a.d.modify()   // ERROR
    var d = a.d
    d.modify()     // OK
    let d1 = a.d
    d1.modify()    // ERROR
}

/* SCAN
error: the variable qualified by 'inout' cannot be directly or indirectly derived from an instance of a 'class'
  ==> inout_e27.cj:19:5:
   | 
19 |     A().d.modify() // ERROR
   |     ^^^ 
   | 

error: the variable qualified by 'inout' cannot be directly or indirectly derived from an instance of a 'class'
  ==> inout_e27.cj:21:5:
   | 
21 |     a.d.modify()   // ERROR
   |     ^ 
   | 

error: cannot use mutable function on immutable value
  ==> inout_e27.cj:25:5:
   | 
25 |     d1.modify()    // ERROR
   |     ^^ ~~~~~~ is a mutable function
   |     |
   |     is immutable
   | 
note: 'd1' is a variable declared with 'let'
  ==> inout_e27.cj:24:9:
   | 
24 |     let d1 = a.d
   |         ^^ 
   | 

3 errors generated, 3 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
