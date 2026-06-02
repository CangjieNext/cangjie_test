// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-1: %compiler %cmp_opt %enableO2 %f -o %output 2>&1 | compare %f

func foo() {
    let temp = 2
    return temp % match (temp) {
        case 2 => 0
        case _ => 1
    }
}

func foo1() {
    let temp = 2
    return temp % match (temp) {
        case 1 => 0
        case _ => 1
    }
}

main(): Int64 {
    return foo() + foo1()
}

/* SCAN
error: modulo by zero
  ==> testDCESwitch01.cj:11:12:
   | 
11 |       return temp % match (temp) {
   |  ____________^
12 | |         case 2 => 0
   | | ...
14 | |     }
   | |_____^ attempt to modulo by zero
   | 

warning: unreachable pattern
  ==> testDCESwitch01.cj:13:14:
   | 
13 |         case _ => 1
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> testDCESwitch01.cj:20:14:
   | 
20 |         case 1 => 0
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 error generated, 1 error printed.
2 warnings generated, 2 warnings printed.
*/
