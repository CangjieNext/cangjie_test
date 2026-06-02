// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f

func foo(): Unit {}

@C
struct X {
    var a: Unit
    var b = foo()
}

main() {
    var u = foo()
    var x = X(a: u, b: u)
    ()
}

/* SCAN
error: member variables cannot be type Unit in struct with @C
 ==> unit.cj:7:9:
  | 
7 |     var a: Unit
  |         ^^^^^^^ 
  | 

error: member variables cannot be type Unit in struct with @C
 ==> unit.cj:8:9:
  | 
8 |     var b = foo()
  |         ^ 
  | 

error: extra arguments given for parameter list '()' in call
  ==> unit.cj:13:14:
   | 
13 |     var x = X(a: u, b: u)
   |              ^^^^^^^^^^^^ expected 0 arguments, found 2
   | 

error: the uninitialized member variable 'a' is not initialized in the constructor of class or struct
 ==> unit.cj:7:5:
  | 
7 |     var a: Unit
  |     ^ 
  | 

4 errors generated, 4 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
