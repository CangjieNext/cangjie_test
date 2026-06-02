// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_parallel %f  -o %output

internal import test.*

@callTest
struct S0 {
    @callTest[123]
    S0(){}
}

@callTest
@callTest[123]
struct S1 {
    S1(){}
}

struct S2 {
    @callTest
    @callTest[123]
    S3(){}
}

@callTest
struct S3 {
    @callTest
    @callTest[123]
    S3(){}
}

@callTest
@callTest[123]
struct C1 {
    C2(){}
}

@callTest
class C2 {
    @callTest[123]
    C3(){}
}

@callTest
class C3 {
    @callTest
    @callTest[123]
    C4(){}
}

@callTest
@callTest[123]
class C4 {
    @callTest
    @callTest[123]
    C5(){}
}

main() {}

/* SCAN
error: expected declaration, found 'S3'
  ==> ctor2.cj:22:5:
   | 
22 |     S3(){}
   |     ^^ expected declaration here
   | 
   # help: probably you want a primary constructor name: 'S2'

error: expected declaration, found 'C2'
  ==> ctor2.cj:35:5:
   | 
35 |     C2(){}
   |     ^^ expected declaration here
   | 
   # help: probably you want a primary constructor name: 'C1'

error: expected declaration, found 'C3'
  ==> ctor2.cj:41:5:
   | 
41 |     C3(){}
   |     ^^ expected declaration here
   | 
   # help: probably you want a primary constructor name: 'C2'

error: expected declaration, found 'C4'
  ==> ctor2.cj:48:5:
   | 
48 |     C4(){}
   |     ^^ expected declaration here
   | 
   # help: probably you want a primary constructor name: 'C3'

error: expected declaration, found 'C5'
  ==> ctor2.cj:56:5:
   | 
56 |     C5(){}
   |     ^^ expected declaration here
   | 
   # help: probably you want a primary constructor name: 'C4'

5 errors generated, 5 errors printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

