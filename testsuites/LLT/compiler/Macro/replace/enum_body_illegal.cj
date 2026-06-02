// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

internal import test.*

enum A0 {
    a
    var b       
}

enum A1 {
    a
    public @callTest
    var d       
}

enum B0 {
    a
    enum b {}  
}

enum B1 {
    a
    public @callTest
    enum c {}  
}

enum C0 {
    a
    class b {}  
}

enum C1 {
    a
    public @callTest
    class c {}  
}

enum D0 {
    a
    struct c {}  
}

enum D1 {
    a
    public @callTest
    struct d {}  
}

main(): Int64 {
    return 0
}

/* SCAN
error: unexpected variable declaration in enum body
 ==> enum_body_illegal.cj:9:5:
  | 
7 | enum A0 {
  | ~~~~ in enum
8 |     a
9 |     var b       
  |     ^^^ unexpected variable declaration
  | 

error: expected no modifier before macro call, found 'public'
  ==> enum_body_illegal.cj:14:5:
   | 
14 |     public @callTest
   |     ^^^^^^ ~~~~~~~~~ before macro call
   |     |
   |     expected no modifier here
   | 

error: unexpected variable declaration in enum body
  ==> enum_body_illegal.cj:15:5:
   | 
12 | enum A1 {
   | ~~~~ in enum
13 |     a
   | ...
15 |     var d       
   |     ^^^ unexpected variable declaration
   | 

error: unexpected enum declaration in enum body
  ==> enum_body_illegal.cj:20:5:
   | 
18 | enum B0 {
   | ~~~~ in enum
19 |     a
20 |     enum b {}  
   |     ^^^^ unexpected enum declaration
   | 

error: expected no modifier before macro call, found 'public'
  ==> enum_body_illegal.cj:25:5:
   | 
25 |     public @callTest
   |     ^^^^^^ ~~~~~~~~~ before macro call
   |     |
   |     expected no modifier here
   | 

error: unexpected enum declaration in enum body
  ==> enum_body_illegal.cj:26:5:
   | 
23 | enum B1 {
   | ~~~~ in enum
24 |     a
   | ...
26 |     enum c {}  
   |     ^^^^ unexpected enum declaration
   | 

error: unexpected class declaration in enum body
  ==> enum_body_illegal.cj:31:5:
   | 
29 | enum C0 {
   | ~~~~ in enum
30 |     a
31 |     class b {}  
   |     ^^^^^ unexpected class declaration
   | 

error: expected no modifier before macro call, found 'public'
  ==> enum_body_illegal.cj:36:5:
   | 
36 |     public @callTest
   |     ^^^^^^ ~~~~~~~~~ before macro call
   |     |
   |     expected no modifier here
   | 

error: unexpected class declaration in enum body
  ==> enum_body_illegal.cj:37:5:
   | 
34 | enum C1 {
   | ~~~~ in enum
35 |     a
   | ...
37 |     class c {}  
   |     ^^^^^ unexpected class declaration
   | 

error: unexpected struct declaration in enum body
  ==> enum_body_illegal.cj:42:5:
   | 
40 | enum D0 {
   | ~~~~ in enum
41 |     a
42 |     struct c {}  
   |     ^^^^^^ unexpected struct declaration
   | 

error: expected no modifier before macro call, found 'public'
  ==> enum_body_illegal.cj:47:5:
   | 
47 |     public @callTest
   |     ^^^^^^ ~~~~~~~~~ before macro call
   |     |
   |     expected no modifier here
   | 

error: unexpected struct declaration in enum body
  ==> enum_body_illegal.cj:48:5:
   | 
45 | enum D1 {
   | ~~~~ in enum
46 |     a
   | ...
48 |     struct d {}  
   |     ^^^^^^ unexpected struct declaration
   | 

12 errors generated, 12 errors printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
