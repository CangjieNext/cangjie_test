// EXEC-PIPE-1: %compiler %noColor %n.cj -o %output 2>&1 | compare %f

foreign func NonExist(c: Rune): Rune

@C
struct Data {
    var c1 = r'\0'
    var c2: Rune

    init(c: Rune) {
        c2 = c
    }
}

@C
func foo(c: Rune): Rune {
    c
}

var f: CFunc<(Rune) -> Rune> = { c => c }

unsafe main() {
    var d = Data(r'\n')
    NonExist(d.c1)
    foo(d.c2)
    f(d.c2)
    0
}

/* SCAN
error: arguments type of CFunc must be instantiated with CType
 ==> ctype_9.cj:3:23:
  | 
3 | foreign func NonExist(c: Rune): Rune
  |                       ^^^^^^^ 
  | 

error: return type of CFunc must be instantiated with CType
 ==> ctype_9.cj:3:33:
  | 
3 | foreign func NonExist(c: Rune): Rune
  |                                 ^^^^ 
  | 
  # note: return type is Rune

error: member variable 'c1' of struct 'Data' with @C must be instantiated with CType
 ==> ctype_9.cj:7:9:
  | 
7 |     var c1 = r'\0'
  |         ^^ 
  | 

error: member variable 'c2' of struct 'Data' with @C must be instantiated with CType
 ==> ctype_9.cj:8:9:
  | 
8 |     var c2: Rune
  |         ^^^^^^^^ 
  | 

error: arguments type of CFunc must be instantiated with CType
  ==> ctype_9.cj:16:10:
   | 
16 | func foo(c: Rune): Rune {
   |          ^^^^^^^ 
   | 

error: return type of CFunc must be instantiated with CType
  ==> ctype_9.cj:16:20:
   | 
16 | func foo(c: Rune): Rune {
   |                    ^^^^ 
   | 
   # note: return type is Rune

error: arguments type of CFunc must be instantiated with CType
  ==> ctype_9.cj:20:15:
   | 
20 | var f: CFunc<(Rune) -> Rune> = { c => c }
   |               ^^^^ 
   | 

error: return type of CFunc must be instantiated with CType
  ==> ctype_9.cj:20:24:
   | 
20 | var f: CFunc<(Rune) -> Rune> = { c => c }
   |                        ^^^^ 
   | 
   # note: return type is Rune

8 errors generated, 8 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
