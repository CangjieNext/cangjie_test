// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [FB6_later_lit_catches_correct] 边界对照: 后继字面量真接值时其后继 wildcard 死臂警告正确
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: 假阳性猎捕边界对照 FB6; 探针: 新 SDK 2 条(guard+case _), 运行期打印 b → case 3 接值, case _ 恒死=两条均正确; 证 FP1 假报特定于「被报臂即实际接值臂」, 编译器未复查被报臂是否真死, 钉 A
// EXEC-PIPE-0: %compiler --error-count-limit=all --diagnostic-format=noColor %ohos_opt --dy-std %f -o %output 2>&1 | compare %f


main() {
    match (3) {
        case x where x > 5 => println("a")
        case 3 => println("b")
        case _ => println("c")
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> FB6_later_lit_catches_correct.cj:15:22:
   | 
15 |         case x where x > 5 => println("a")
   |                      ^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> FB6_later_lit_catches_correct.cj:17:14:
   | 
17 |         case _ => println("c")
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
2 warnings generated, 2 warnings printed.
*/
