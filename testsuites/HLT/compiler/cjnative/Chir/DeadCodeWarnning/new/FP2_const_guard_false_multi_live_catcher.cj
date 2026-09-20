// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [FP2_const_guard_false_multi_live_catcher] const selector+guard false: 死臂正确报+接值 wildcard 假报
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: 假阳性猎捕 FP2; 探针: 新 SDK 4 条(guard/case1/case2/case_), 运行期打印 c → 仅 case _ 执行; case 1/case 2 对 selector 3 恒不匹配, 其警告正确(const 折叠), case _ 警告=假阳性; 真口径 3 条, 钉 scan-3 → 新 SDK 红=bug 留证
// EXEC-PIPE-0: %compiler --error-count-limit=all --diagnostic-format=noColor %ohos_opt --dy-std %f -o %output 2>&1 | compare %f


main() {
    match (3) {
        case 3 where false => println("g")
        case 1 => println("a")
        case 2 => println("b")
        case _ => println("c")
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> FP2_const_guard_false_multi_live_catcher.cj:16:22:
   | 
16 |         case 3 where false => println("g")
   |                      ^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> FP2_const_guard_false_multi_live_catcher.cj:17:14:
   | 
17 |         case 1 => println("a")
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> FP2_const_guard_false_multi_live_catcher.cj:18:14:
   | 
18 |         case 2 => println("b")
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
3 warnings generated, 3 warnings printed.
*/
