// EXEC-PIPE-1: %compiler %noColor %n.cj -o %output 2>&1 | compare %f

foreign func NonExist(c: Float16): Float16

@C
struct Data {
    var c1: Float16

    init(c: Float16) {
        c1 = c
    }
}

@C
func foo(c: Float16): Float16 {
    c
}

var f: CFunc<(Float16) -> Float16> = { c => c }

unsafe main() {
    var d = Data(r'\n')
    NonExist(d.c1)
    foo(d.c1)
    f(d.c1)
    0
}

/* SCAN
error: arguments type of CFunc must be instantiated with CType
 ==> ctype_10.cj:3:23:
  | 
3 | foreign func NonExist(c: Float16): Float16
  |                       ^^^^^^^^^^ 
  | 

error: return type of CFunc must be instantiated with CType
 ==> ctype_10.cj:3:36:
  | 
3 | foreign func NonExist(c: Float16): Float16
  |                                    ^^^^^^^ 
  | 
  # note: return type is Float16

error: member variable 'c1' of struct 'Data' with @C must be instantiated with CType
 ==> ctype_10.cj:7:9:
  | 
7 |     var c1: Float16
  |         ^^^^^^^^^^^ 
  | 

error: arguments type of CFunc must be instantiated with CType
  ==> ctype_10.cj:15:10:
   | 
15 | func foo(c: Float16): Float16 {
   |          ^^^^^^^^^^ 
   | 

error: return type of CFunc must be instantiated with CType
  ==> ctype_10.cj:15:23:
   | 
15 | func foo(c: Float16): Float16 {
   |                       ^^^^^^^ 
   | 
   # note: return type is Float16

error: arguments type of CFunc must be instantiated with CType
  ==> ctype_10.cj:19:15:
   | 
19 | var f: CFunc<(Float16) -> Float16> = { c => c }
   |               ^^^^^^^ 
   | 

error: return type of CFunc must be instantiated with CType
  ==> ctype_10.cj:19:27:
   | 
19 | var f: CFunc<(Float16) -> Float16> = { c => c }
   |                           ^^^^^^^ 
   | 
   # note: return type is Float16

error: cannot convert a character literal to type 'Float16'
  ==> ctype_10.cj:22:18:
   | 
22 |     var d = Data(r'\n')
   |                  ^ 
   | 

8 errors generated, 8 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
