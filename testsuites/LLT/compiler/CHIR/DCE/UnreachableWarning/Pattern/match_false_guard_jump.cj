// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A false guard is diagnosed even when its jump body merges into a reachable loop target.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func guardBreak(flag: Bool): Unit {
    do {
        match (3) {
            case 3 where false => break
            case _ => println("work")
        }
    } while (flag)
}

func guardContinue(flag: Bool): Unit {
    do {
        match (3) {
            case 3 where false => continue
            case _ => println("work")
        }
    } while (flag)
}

main() {
    guardBreak(false)
    guardContinue(false)
}

/* SCAN-IN
warning: unreachable pattern
  ==> match_false_guard_jump.cj:13:26:
   | 
13 |             case 3 where false => break
   |                          ^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> match_false_guard_jump.cj:22:26:
   | 
22 |             case 3 where false => continue
   |                          ^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
2 warnings generated, 2 warnings printed.
*/
