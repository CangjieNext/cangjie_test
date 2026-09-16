// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let cs = match (1) { 
        case 1 => "Green"  
        case _  => match (1) {
                    case 1 => "Black"
                    case _ => "Bule"
        }
    }
    return 0
}

/* SCAN
warning: unused variable:'cs'
  ==> testUnusedCode15.cj:10:9:
   | 
10 |     let cs = match (1) { 
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> testUnusedCode15.cj:12:14:
   | 
12 |         case _  => match (1) {
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
