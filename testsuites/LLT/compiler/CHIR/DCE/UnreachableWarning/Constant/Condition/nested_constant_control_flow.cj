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

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> nested_constant_control_flow.cj:15:20:
   | 
15 |               } else {
   |  ____________________^
16 | |                 println("unreachable nested third else")
17 | |             }
   | |_____________^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> nested_constant_control_flow.cj:18:16:
   | 
18 |           } else {
   |  ________________^
19 | |             println("unreachable nested second else")
20 | |         }
   | |_________^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> nested_constant_control_flow.cj:21:12:
   | 
21 |       } else {
   |  ____________^
22 | |         println("unreachable nested first else")
23 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> nested_constant_control_flow.cj:28:16:
   | 
28 |           } else {
   |  ________________^
29 | |             println("unreachable break else")
30 | |         }
   | |_________^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> nested_constant_control_flow.cj:36:16:
   | 
36 |           } else {
   |  ________________^
37 | |             println("unreachable continue else")
38 | |         }
   | |_________^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
