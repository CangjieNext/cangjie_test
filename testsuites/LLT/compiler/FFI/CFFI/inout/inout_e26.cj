// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func NonExist1(ptr: CPointer<Int32>): Unit
foreign func NonExist2(ptr: CPointer<CData>): Unit

extend Int64 {
    func set() {
        unsafe { NonExist1(inout this) } // ERROR
    }
}

@C
struct CData {
    var a: Int32 = 0

    func set() {
        unsafe { NonExist1(inout a) }      // ERROR
        unsafe { NonExist1(inout this.a) } // ERROR
        unsafe { NonExist2(inout this) }   // ERROR
    }

    mut func modify() {
        unsafe { NonExist2(inout this) }   // ERROR
    }
}

main() {
    1.set()
    CData().set()
    CData().modify()
}

/* SCAN
error: 'inout' can only qualify variable defined with 'var'
 ==> inout_e26.cj:8:34:
  | 
8 |         unsafe { NonExist1(inout this) } // ERROR
  |                                  ^^^^ not a variable
  | 

error: 'inout' can only qualify variable defined with 'var'
  ==> inout_e26.cj:19:34:
   | 
19 |         unsafe { NonExist2(inout this) }   // ERROR
   |                                  ^^^^ not a variable
   | 

error: 'inout' can only qualify variable defined with 'var'
  ==> inout_e26.cj:23:34:
   | 
23 |         unsafe { NonExist2(inout this) }   // ERROR
   |                                  ^^^^ not a variable
   | 

error: instance member variable 'a' cannot be modified in immutable function
  ==> inout_e26.cj:17:34:
   | 
17 |         unsafe { NonExist1(inout a) }      // ERROR
   |                                  ^ 
   | 

error: instance member variable 'a' cannot be modified in immutable function
  ==> inout_e26.cj:18:34:
   | 
18 |         unsafe { NonExist1(inout this.a) } // ERROR
   |                                  ^ 
   | 

error: 'this' cannot be used as an expression in the mutable function 'modify'
  ==> inout_e26.cj:23:34:
   | 
23 |         unsafe { NonExist2(inout this) }   // ERROR
   |                                  ^ 
   | 

error: cannot use mutable function on immutable value
  ==> inout_e26.cj:30:5:
   | 
30 |     CData().modify()
   |     ^^^^^^^ ~~~~~~ is a mutable function
   |     |
   |     is immutable
   | 

7 errors generated, 7 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
