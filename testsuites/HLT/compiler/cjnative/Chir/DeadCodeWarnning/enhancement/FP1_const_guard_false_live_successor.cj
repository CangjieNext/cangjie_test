// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [FP1_const_guard_false_live_successor] const selector+guard false: 实际接值的后继臂被假报
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: 假阳性猎捕 FP1; 探针双 SDK(2026-09-20): 新 2 条(guard 正确+case_ 假报)/旧 1 条(仅 case_), 运行期打印 b → case _ 实际执行, 后继臂警告=假阳性; 真口径=guard 主范围 1 条(官方 match_guard_diagnostic_range 同构); 钉运行期真值 scan-1 → 新 SDK 红=bug 留证; 裸字面量即触发, 与 or-pattern 无关(C16 族的根因收窄)
// EXEC-PIPE-0: %compiler --error-count-limit=all --diagnostic-format=noColor %ohos_opt --dy-std %f -o %output 2>&1 | compare %f


main() {
    match (3) {
        case 3 where false => println("g")
        case _ => println("b")
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> FP1_const_guard_false_live_successor.cj:16:22:
   | 
16 |         case 3 where false => println("g")
   |                      ^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
1 warning generated, 1 warning printed.
*/
