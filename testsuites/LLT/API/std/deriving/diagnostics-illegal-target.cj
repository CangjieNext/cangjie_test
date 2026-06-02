/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f

import std.deriving.*

@Derive[ToString]
func f() {}

@Derive[ToString]
extend X {}

@Derive[ToString]
interface I {
    @Derive[ToString]
    func f(): Unit
}

class A {
    @Derive[ToString]
    A() {}

    @Derive[ToString]
    init() {}

    func f(
        @Derive[ToString]
        param: String
    ) {}
}

@Derive[ToString]
(class z())

/* SCAN
error: Deriving is only supported for classes, enums and structs
  ==> diagnostics-illegal-target.cj:13:1:
   | 
13 | func f() {}
   | ^^^^ 
   | 

error: Deriving is only supported for classes, enums and structs
  ==> diagnostics-illegal-target.cj:16:1:
   | 
16 | extend X {}
   | ^^^^^^ 
   | 

error: Deriving is only supported for classes, enums and structs
  ==> diagnostics-illegal-target.cj:19:1:
   | 
19 | interface I {
   | ^^^^^^^^^ 
   | 

error: Deriving is only supported for classes, enums and structs
  ==> diagnostics-illegal-target.cj:21:5:
   | 
21 |     func f(): Unit
   |     ^^^^ 
   | 

error: Deriving is only supported for classes, enums and structs: ParseASTException: 
[31merror[0m: expected declaration, found 'A'
  [36m| [0m
  [36m| [0mA() { }[0m
  [36m| [0m[31m^ expected declaration here[0m
  [36m| [0m

parsing decl error.
  ==> diagnostics-illegal-target.cj:26:5:
   | 
26 |     A() {}
   |     ^ 
   | 

error: Deriving is only supported for classes, enums and structs
  ==> diagnostics-illegal-target.cj:29:5:
   | 
29 |     init() {}
   |     ^^^^ 
   | 

error: Deriving is only supported for classes, enums and structs: ParseASTException: 
[31merror[0m: expected declaration, found 'param'
  [36m| [0m
  [36m| [0mparam: String[0m
  [36m| [0m[31m^^^^^ expected declaration here[0m
  [36m| [0m

parsing decl error.
  ==> diagnostics-illegal-target.cj:33:9:
   | 
33 |         param: String
   |         ^^^^^ 
   | 

error: Deriving is only supported for classes, enums and structs: ParseASTException: 
[31merror[0m: expected '{', found '('
  [36m| [0m
  [36m| [0mclass z()[0m
  [36m| [0m       [31m^ expected '{' here[0m
  [36m| [0m

parsing decl error.
  ==> diagnostics-illegal-target.cj:38:8:
   | 
38 | (class z())
   |        ^ 
   | 

error: expected '{', found '('
  ==> diagnostics-illegal-target.cj:38:9:
   | 
38 | (class z())
   |         ^ expected '{' here
   | 
note: the error originates in the macro `Derive` (consider using `--debug-macro` for more info)
  ==> diagnostics-illegal-target.cj:37:1:
   | 
37 |   @Derive[ToString]
   |  _^
38 | | (class z())
   | |___________^
   | 

9 errors generated, 9 errors printed.
*/
