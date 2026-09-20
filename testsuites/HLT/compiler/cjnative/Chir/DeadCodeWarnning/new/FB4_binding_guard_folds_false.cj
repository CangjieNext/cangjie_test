// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [FB4_binding_guard_folds_false] 边界对照: 绑定 pattern+guard 常量折叠正确
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: 假阳性猎捕边界对照 FB4; 探针: 新 SDK 仅 1 条(guard, x != 3 折叠假), 运行期打印 b; 绑定 pattern 的 guard 折叠方向正确且不假报后继, 钉 A
// EXEC-PIPE-0: %compiler --error-count-limit=all --diagnostic-format=noColor %ohos_opt --dy-std %f -o %output 2>&1 | compare %f


main() {
    match (3) {
        case x where x != 3 => println("g")
        case _ => println("b")
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> FB4_binding_guard_folds_false.cj:15:22:
   | 
15 |         case x where x != 3 => println("g")
   |                      ^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
1 warning generated, 1 warning printed.
*/
