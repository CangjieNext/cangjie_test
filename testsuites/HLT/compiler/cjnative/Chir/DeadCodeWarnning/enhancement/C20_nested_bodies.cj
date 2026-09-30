// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C20_nested_bodies] 可达嵌套体中的常量条件
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.2 C20（lambda body 与 case body 内部常量条件独立报; case _ 由穷举另报 pattern 1 条; 本 SDK 实测 block 3+pattern 1）
// EXEC-PIPE-0: %compiler --error-count-limit=all --diagnostic-format=noColor %ohos_opt --dy-std %f -o %output 2>&1 | compare %f


main() {
    let action = {
        =>
        if (false) {
            println("dead lambda branch")
        }
    }

    match (1) {
        case 1 => if (false) {
            println("dead case body branch")
        }
        case _ => println("dead case")
    }
    action()
}

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> C20_nested_bodies.cj:16:20:
   | 
16 |           if (false) {
   |  ____________________^
17 | |             println("dead lambda branch")
18 | |         }
   | |_________^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> C20_nested_bodies.cj:22:30:
   | 
22 |           case 1 => if (false) {
   |  ______________________________^
23 | |             println("dead case body branch")
24 | |         }
   | |_________^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> C20_nested_bodies.cj:25:14:
   | 
25 |         case _ => println("dead case")
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
3 warnings generated, 3 warnings printed.
*/
