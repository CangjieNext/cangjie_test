// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %f %cmp_opt

@JavaMirror
@JavaImpl
class Foo {}

@JavaMirror
@C
class Foo {}

@JavaMirror
@ObjCMirror
class Foo {}

@JavaMirror
@ObjCMirror
@C
class Foo {}

@JavaMirror
@JavaMirror
@ObjCMirror
class Foo {}

/* SCAN
error: 'JavaMirror' and 'JavaImpl' annotations conflict on class
  ==> conflict.cj:9:1:
   | 
9  |   @JavaMirror
   |  _^
10 | | @JavaImpl
   | |_________^ unexpected annotation
   | 

error: 'JavaMirror' and 'C' annotations conflict on class
  ==> conflict.cj:13:1:
   | 
13 |   @JavaMirror
   |  _^
14 | | @C
   | |__^ unexpected annotation
   | 

error: 'JavaMirror' and 'ObjCMirror' annotations conflict on class
  ==> conflict.cj:17:1:
   | 
17 |   @JavaMirror
   |  _^
18 | | @ObjCMirror
   | |___________^ unexpected annotation
   | 

error: 'JavaMirror' and 'ObjCMirror' annotations conflict on class
  ==> conflict.cj:21:1:
   | 
21 |   @JavaMirror
   |  _^
22 | | @ObjCMirror
   | |___________^ unexpected annotation
   | 

error: 'JavaMirror' and 'C' annotations conflict on class
  ==> conflict.cj:21:1:
   | 
21 |   @JavaMirror
   |  _^
22 | | @ObjCMirror
23 | | @C
   | |__^ unexpected annotation
   | 

error: 'JavaMirror' and 'ObjCMirror' annotations conflict on class
  ==> conflict.cj:26:1:
   | 
26 |   @JavaMirror
   |  _^
27 | | @JavaMirror
28 | | @ObjCMirror
   | |___________^ unexpected annotation
   | 

error: duplicated annotation: '@JavaMirror'
  ==> conflict.cj:27:1:
   | 
26 | @JavaMirror
   | ~~~~~~~~~~~ the previous one is here
27 | @JavaMirror
   | ^^^^^^^^^^^ duplicated annotation here
   | 

7 errors generated, 7 errors printed.
*/
