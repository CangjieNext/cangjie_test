// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [FP11_opt_guard_opaque_call] 非折叠 guard(含不透明调用)仍假定必真: 活后继假报
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: 假阳性猎捕 FP11(最强形态: guard 完全不可折叠); 探针: 新旧 SDK 均 2 条, 运行期打印 probe b → guard 被求值且实假, Some(_) 实际执行=假阳性; selector const 折叠只能解释 None 1 条, guard 假定必真是独立偏差; 真口径 1 条 scan-1 → 红=bug 留证
// EXEC-PIPE-0: %compiler --error-count-limit=all --diagnostic-format=noColor %ohos_opt --dy-std %f -o %output 2>&1 | compare %f


func probe(): Int64 {
    println("probe")
    return 5
}

main() {
    match (Option<Int64>.Some(3)) {
        case Some(x) where x > probe() => println("a")
        case Some(_) => println("b")
        case None => println("c")
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> FP11_opt_guard_opaque_call.cj:23:14:
   | 
23 |         case None => println("c")
   |              ^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
1 warning generated, 1 warning printed.
*/
