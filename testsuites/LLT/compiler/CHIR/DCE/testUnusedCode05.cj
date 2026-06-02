// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_args

func foo<T>(a: T) {
    if (false) {
        var a = 1
    }
}

func foo1(a: Int64) {
    if (false) {
        var a = 1
    }
}

main() {
    foo<Int64>(1)
    foo<Int32>(1)
    foo1(1)
    return 0
}

/* SCAN
warning: unused variable:'a'
  ==> testUnusedCode05.cj:10:13:
   | 
10 | func foo<T>(a: T) {
   |             ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> testUnusedCode05.cj:11:16:
   | 
11 |       if (false) {
   |  ________________^
12 | |         var a = 1
13 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'a'
  ==> testUnusedCode05.cj:16:11:
   | 
16 | func foo1(a: Int64) {
   |           ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> testUnusedCode05.cj:17:16:
   | 
17 |       if (false) {
   |  ________________^
18 | |         var a = 1
19 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

4 warnings generated, 4 warnings printed.
*/
