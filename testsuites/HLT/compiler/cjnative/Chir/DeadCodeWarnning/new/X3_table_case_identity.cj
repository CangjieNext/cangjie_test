// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [X3_table_case_identity] enum table match 按 source case 合并
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: dt-design 模块间接口2 用例2（table match physical entries 按 MatchCaseId 合并, constructor group 间不重复; 常量 selector 场景两个不匹配 case 各 1 条）
// EXEC-PIPE-0: %compiler --error-count-limit=all --diagnostic-format=noColor %ohos_opt --dy-std %f -o %output 2>&1 | compare %f


enum Op {
    | Add
    | Sub
    | Mul
}

func calc(op: Op, x: Int64, y: Int64): Int64 {
    const known = Op.Add
    match (op) {
        case Add => x + y
        case Sub => x - y
        case Mul => x * y
    }
}

main() {
    println(calc(Op.Sub, 3, 1))
    const tag = Op.Mul
    match (tag) {
        case Add => println("add")
        case Sub => println("sub")
        case Mul => println("mul")
    }
}

/* SCAN-IN
warning: unused variable:'known'
  ==> X3_table_case_identity.cj:20:11:
   | 
20 |     const known = Op.Add
   |           ^^^^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> X3_table_case_identity.cj:32:14:
   | 
32 |         case Add => println("add")
   |              ^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> X3_table_case_identity.cj:33:14:
   | 
33 |         case Sub => println("sub")
   |              ^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
3 warnings generated, 3 warnings printed.
*/
