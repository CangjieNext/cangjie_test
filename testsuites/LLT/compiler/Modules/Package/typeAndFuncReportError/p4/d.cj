// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../p1 ../p2 ../p3
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o a.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p2/*.cj -o b.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p3/*.cj -o c.%middle
// EXEC: %compiler %cmp_opt a.%middle b.%middle c.%middle %f -o %output 2>&1 | compare %f

internal import p1.foo // Shadow
internal import p2.foo // Shadow
internal import p3.foo // Shadow

func foo(a: UInt64) {
    return 5
} // f5

main(): Int64 {
    var a1 = foo()
    if (a1.c != 1) {
        return 1
    }
    return 0
}

/* SCAN
warning: imported decl 'foo' is conflicted with other import
  ==> d.cj:14:20:
   | 
14 | internal import p2.foo // Shadow
   |                    ^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff package-import`
note: The previous was imported here
  ==> d.cj:13:20:
   | 
13 | internal import p1.foo // Shadow
   |                    ^^^ 
   | 

warning: imported decl 'foo' is conflicted with other import
  ==> d.cj:15:20:
   | 
15 | internal import p3.foo // Shadow
   |                    ^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff package-import`
note: The previous was imported here
  ==> d.cj:13:20:
   | 
13 | internal import p1.foo // Shadow
   |                    ^^^ 
   | 

error: ambiguous use of 'foo'
  ==> d.cj:22:14:
   | 
22 |     var a1 = foo()
   |              ^^^ 
   | 
note: found imported candidate
  ==> d.cj:13:1:
   | 
13 | internal import p1.foo // Shadow
   | ^^^^^^^^^^^^^^^^^^^^^^ 
   | 
note: found imported candidate
  ==> d.cj:14:1:
   | 
14 | internal import p2.foo // Shadow
   | ^^^^^^^^^^^^^^^^^^^^^^ 
   | 
note: found imported candidate
  ==> d.cj:15:1:
   | 
15 | internal import p3.foo // Shadow
   | ^^^^^^^^^^^^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
2 warnings generated, 2 warnings printed.
*/
