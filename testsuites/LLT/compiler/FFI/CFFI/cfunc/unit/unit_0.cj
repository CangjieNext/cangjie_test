// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f

foreign func foo1(a: Unit, b: Unit): Unit

@C
func foo2(a: Unit, b: Unit): Unit {}

var foo3: CFunc<(Unit, Unit) -> Unit> = { a: Unit, b: Unit => }

main() {
    var foo4: CFunc<(Unit, Unit) -> Unit> = { a: Unit, b: Unit => }

    var foo5: CFunc<(Unit, Unit) -> Unit>
    0
}



/* SCAN
error: CFunc cannot have arguments of type Unit
 ==> unit_0.cj:3:19:
  | 
3 | foreign func foo1(a: Unit, b: Unit): Unit
  |                   ^^^^^^^ 
  | 

error: CFunc cannot have arguments of type Unit
 ==> unit_0.cj:3:28:
  | 
3 | foreign func foo1(a: Unit, b: Unit): Unit
  |                            ^^^^^^^ 
  | 

error: CFunc cannot have arguments of type Unit
 ==> unit_0.cj:6:11:
  | 
6 | func foo2(a: Unit, b: Unit): Unit {}
  |           ^^^^^^^ 
  | 

error: CFunc cannot have arguments of type Unit
 ==> unit_0.cj:6:20:
  | 
6 | func foo2(a: Unit, b: Unit): Unit {}
  |                    ^^^^^^^ 
  | 

error: CFunc cannot have arguments of type Unit
 ==> unit_0.cj:8:18:
  | 
8 | var foo3: CFunc<(Unit, Unit) -> Unit> = { a: Unit, b: Unit => }
  |                  ^^^^ 
  | 

error: CFunc cannot have arguments of type Unit
 ==> unit_0.cj:8:24:
  | 
8 | var foo3: CFunc<(Unit, Unit) -> Unit> = { a: Unit, b: Unit => }
  |                        ^^^^ 
  | 

error: CFunc cannot have arguments of type Unit
  ==> unit_0.cj:11:22:
   | 
11 |     var foo4: CFunc<(Unit, Unit) -> Unit> = { a: Unit, b: Unit => }
   |                      ^^^^ 
   | 

error: CFunc cannot have arguments of type Unit
  ==> unit_0.cj:11:28:
   | 
11 |     var foo4: CFunc<(Unit, Unit) -> Unit> = { a: Unit, b: Unit => }
   |                            ^^^^ 
   | 

error: CFunc cannot have arguments of type Unit
  ==> unit_0.cj:13:22:
   | 
13 |     var foo5: CFunc<(Unit, Unit) -> Unit>
   |                      ^^^^ 
   | 

error: CFunc cannot have arguments of type Unit
  ==> unit_0.cj:13:28:
   | 
13 |     var foo5: CFunc<(Unit, Unit) -> Unit>
   |                            ^^^^ 
   | 

10 errors generated, 10 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
