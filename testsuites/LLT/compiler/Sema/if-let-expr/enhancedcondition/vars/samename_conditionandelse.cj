// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %f %cmp_opt 2>&1 | compare %f 

main() {
    let a = Some(1)
    if (let Some(b) <- a) {
        Some(0)
    } else {
        let b = a
        b
    }
    0
}

/* SCAN
warning: unused expression
  ==> samename_conditionandelse.cj:12:9:
   | 
12 |         Some(0)
   |         ^^^^^^^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> samename_conditionandelse.cj:13:12:
   | 
13 |       } else {
   |  ____________^
14 | |         let b = a
   | | ...
16 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
