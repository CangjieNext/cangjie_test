// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: testDCEApply08.info
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args %output 2>&1 | compare testDCEApply08.info

func test() {
    println("func")
    {a: Int64 => ()}
}

main() {
    test()(return 0)
    return 0
}

/* SCAN
warning: unused variable:'a'
  ==> testDCEApply08.cj:14:6:
   | 
14 |     {a: Int64 => ()}
   |      ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable 'call'
  ==> testDCEApply08.cj:18:5:
   | 
18 |     test()(return 0)
   |     ^^^^^^ ~~~~~~~~ any code following this expression is unreachable
   |     |
   |     unreachable 'call'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
