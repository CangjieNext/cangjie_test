// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [FB5_guard_true_successor_dead] 边界对照: guard 恒真时后继警告正确
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: 假阳性猎捕边界对照 FB5; 探针: 新 SDK 1 条(case _), 运行期打印 a; guard 实真→首臂恒接值→后继死=警告正确; 与 FP9 同机理反例(guard 实假时同报=假阳性), 极性证据成对, 钉 A
// EXEC-PIPE-0: %compiler --error-count-limit=all --diagnostic-format=noColor %ohos_opt --dy-std %f -o %output 2>&1 | compare %f


main() {
    match (3) {
        case x where x == 3 => println("a")
        case _ => println("b")
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> FB5_guard_true_successor_dead.cj:16:14:
   | 
16 |         case _ => println("b")
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
1 warning generated, 1 warning printed.
*/
