// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C16_guard_excluded] 前序 case 约束排除完整 guard case
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.2 C16（grade 确定值经 binding value 进入 guard → 完整 guarded case 与最终 _ 各 1 条 pattern 共 2 条; 2026-09-20 新 SDK 实测 2 条与本断言一致，升 A）
// EXEC-PIPE-0: %compiler --error-count-limit=all --diagnostic-format=noColor %ohos_opt --dy-std %f -o %output 2>&1 | compare %f


main() {
    let grade = 85
    match (grade) {
        case value where value >= 80 => println("B")
        case value where value >= 70 => println("C")
        case _ => println("D")
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> C16_guard_excluded.cj:17:14:
   | 
17 |         case value where value >= 70 => println("C")
   |              ^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> C16_guard_excluded.cj:18:14:
   | 
18 |         case _ => println("D")
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
2 warnings generated, 2 warnings printed.
*/
