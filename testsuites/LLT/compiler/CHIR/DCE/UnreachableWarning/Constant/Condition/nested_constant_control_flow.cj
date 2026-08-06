// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Cover nested true conditions and statically selected loop jumps.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main() {
    if (true) {
        if (true) {
            if (true) {
                println("reachable nested condition")
            } else {
                println("unreachable nested third else")
            }
        } else {
            println("unreachable nested second else")
        }
    } else {
        println("unreachable nested first else")
    }

    while (true) {
        if (true) {
            break
        } else {
            println("unreachable break else")
        }
    }

    while (true) {
        if (true) {
            continue
        } else {
            println("unreachable continue else")
        }
    }
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> nested_constant_control_flow.cj:16:20:
   | 
16 |               } else {
   |  ____________________^
17 | |                 println("unreachable nested third else")
18 | |             }
   | |_____________^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> nested_constant_control_flow.cj:19:16:
   | 
19 |           } else {
   |  ________________^
20 | |             println("unreachable nested second else")
21 | |         }
   | |_________^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> nested_constant_control_flow.cj:22:12:
   | 
22 |       } else {
   |  ____________^
23 | |         println("unreachable nested first else")
24 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> nested_constant_control_flow.cj:29:16:
   | 
29 |           } else {
   |  ________________^
30 | |             println("unreachable break else")
31 | |         }
   | |_________^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> nested_constant_control_flow.cj:37:16:
   | 
37 |           } else {
   |  ________________^
38 | |             println("unreachable continue else")
39 | |         }
   | |_________^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

5 warnings generated, 5 warnings printed.
*/
