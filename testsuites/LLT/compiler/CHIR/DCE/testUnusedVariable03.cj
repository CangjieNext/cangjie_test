// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args

private const a = 1
private var b = 2

class C {
    private static var c = 3
}

main() {
    return 0
}

/* SCAN
warning: unused variable:'a'
  ==> testUnusedVariable03.cj:10:15:
   | 
10 | private const a = 1
   |               ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'b'
  ==> testUnusedVariable03.cj:11:13:
   | 
11 | private var b = 2
   |             ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'c'
  ==> testUnusedVariable03.cj:14:24:
   | 
14 |     private static var c = 3
   |                        ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
