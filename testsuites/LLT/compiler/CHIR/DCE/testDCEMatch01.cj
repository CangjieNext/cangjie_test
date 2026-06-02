// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args

func foo() {
    var a = Option<Int64>.None
    match (a) {
        case Some(_) => true
        case _ => false
    }
}

func foo1() {
    var a = Option<Int64>.Some(11)
    match (a) {
        case Some(_) => true
        case _ => false
    }
}

func foo2() {
    var a = Option<Int64>.Some(11)
    match (a) {
        case Some(_) => true
        case None => false
    }
}

main() {
    foo()
    foo1()
    foo2()
    return 0
}

/* SCAN
warning: unreachable pattern
  ==> testDCEMatch01.cj:13:14:
   | 
13 |         case Some(_) => true
   |              ^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> testDCEMatch01.cj:22:14:
   | 
22 |         case _ => false
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> testDCEMatch01.cj:30:14:
   | 
30 |         case None => false
   |              ^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
