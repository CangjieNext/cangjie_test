// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [FP9_opt_ctor_guard_value] Some(x)+值 guard: 实际接值的 Some(_) 被假报
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: 假阳性猎捕 FP9(构造器模式+值 guard); 探针: 新旧 SDK 均 2 条(Some(_)+None), 运行期打印 b → Some(_) 实际执行=假阳性, None 警告正确(const selector 折叠); 真口径 1 条 scan-1 → 红=bug 留证; 机理: 值 guard 被假定必真→后继臂全报, 运行期 guard 实假
// EXEC-PIPE-0: %compiler --error-count-limit=all --diagnostic-format=noColor %ohos_opt --dy-std %f -o %output 2>&1 | compare %f


main() {
    match (Option<Int64>.Some(3)) {
        case Some(x) where x > 5 => println("a")
        case Some(_) => println("b")
        case None => println("c")
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> FP9_opt_ctor_guard_value.cj:18:14:
   | 
18 |         case None => println("c")
   |              ^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
1 warning generated, 1 warning printed.
*/
