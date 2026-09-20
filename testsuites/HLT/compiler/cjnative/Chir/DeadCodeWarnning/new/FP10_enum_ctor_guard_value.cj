// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [FP10_enum_ctor_guard_value] enum 关联值+值 guard: 实际接值的 A(_) 被假报
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: 假阳性猎捕 FP10; 探针: 新旧 SDK 均 2 条(Circle(_)+Square), 运行期打印 b → Circle(_) 实际执行=假阳性, Square 警告正确; 真口径 1 条 scan-1 → 红=bug 留证; 与 FP9 同根(enum 构造器广度)
// EXEC-PIPE-0: %compiler --error-count-limit=all --diagnostic-format=noColor %ohos_opt --dy-std %f -o %output 2>&1 | compare %f


enum Shape {
    | Circle(Int64)
    | Square
}

main() {
    match (Shape.Circle(3)) {
        case Circle(r) where r > 5 => println("a")
        case Circle(_) => println("b")
        case Square => println("c")
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> FP10_enum_ctor_guard_value.cj:23:14:
   | 
23 |         case Square => println("c")
   |              ^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
1 warning generated, 1 warning printed.
*/
