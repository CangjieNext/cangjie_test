// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C16_guard_false] guard 确定为主范围为 guard
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: §4.2 C16（pattern 可进入且 guard 确定 false → 主范围=guard）; 2026-09-20 新 SDK 实测 2 条: 额外对 case _ 报 unreachable_pattern, 但运行期 case _ 实际执行(打印 1) → 假阳性 bug 证据(R3 族: const selector+or-pattern+guard false 交互过度推断), 官方 match_guard_diagnostic_range 同构仅报 guard 1 条; 保持规格口径 Tier-B 留证
// EXEC-PIPE-0: %compiler --error-count-limit=all --diagnostic-format=noColor %ohos_opt --dy-std %f -o %output 2>&1 | compare %f


main() {
    match (3) {
        case 2 | 3 where false => println("g")
        case _ => println("1")
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> C16_guard_false.cj:16:26:
   | 
16 |         case 2 | 3 where false => println("g")
   |                          ^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
1 warning generated, 1 warning printed.
*/
