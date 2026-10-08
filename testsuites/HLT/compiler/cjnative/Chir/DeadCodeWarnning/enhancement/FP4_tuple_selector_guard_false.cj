// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [FP4_tuple_selector_guard_false] tuple selector 同族假报
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: 假阳性猎捕 FP4(tuple selector); 探针: 新 2 条/运行期打印 b; 真口径 1 条 scan-1 → 红=bug 留证
// EXEC-PIPE-0: %compiler --error-count-limit=all --diagnostic-format=noColor %ohos_opt --dy-std %f -o %output 2>&1 | compare %f


main() {
    match ((3, 4)) {
        case (3, 4) where false => println("g")
        case _ => println("b")
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> FP4_tuple_selector_guard_false.cj:16:27:
   | 
16 |         case (3, 4) where false => println("g")
   |                           ^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
1 warning generated, 1 warning printed.
*/
