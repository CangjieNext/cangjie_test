// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %f %cmp_opt

@Java
@Java
foreign class Foo {}

@Java
@C
foreign class Foo {}

@Java
@ObjC
foreign class Foo {}

@Java
@ObjC
@C
foreign class Foo {}

@Java
@Java
@ObjC
foreign class Foo {}

/* SCAN
error: duplicated annotation: '@Java'
  ==> conflict.cj:10:1:
   | 
9  | @Java
   | ~~~~~ the previous one is here
10 | @Java
   | ^^^^^ duplicated annotation here
   | 

error: 'Java' and 'C' annotations conflict on class
  ==> conflict.cj:13:1:
   | 
13 |   @Java
   |  _^
14 | | @C
   | |__^ unexpected annotation
   | 

error: 'Java' and 'ObjC' annotations conflict on class
  ==> conflict.cj:17:1:
   | 
17 |   @Java
   |  _^
18 | | @ObjC
   | |_____^ unexpected annotation
   | 

error: 'Java' and 'ObjC' annotations conflict on class
  ==> conflict.cj:21:1:
   | 
21 |   @Java
   |  _^
22 | | @ObjC
   | |_____^ unexpected annotation
   | 

error: 'Java' and 'C' annotations conflict on class
  ==> conflict.cj:21:1:
   | 
21 |   @Java
   |  _^
22 | | @ObjC
23 | | @C
   | |__^ unexpected annotation
   | 

error: 'Java' and 'ObjC' annotations conflict on class
  ==> conflict.cj:26:1:
   | 
26 |   @Java
   |  _^
27 | | @Java
28 | | @ObjC
   | |_____^ unexpected annotation
   | 

error: duplicated annotation: '@Java'
  ==> conflict.cj:27:1:
   | 
26 | @Java
   | ~~~~~ the previous one is here
27 | @Java
   | ^^^^^ duplicated annotation here
   | 

7 errors generated, 7 errors printed.
*/
