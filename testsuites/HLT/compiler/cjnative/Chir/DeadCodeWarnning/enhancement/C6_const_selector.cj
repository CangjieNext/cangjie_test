// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C6_const_selector] 确定 const selector 排除后续 case
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.2 C6（已选 case 之后的非匹配 case 与 fallback 各 1 条）
// EXEC-PIPE-0: %compiler --error-count-limit=all --diagnostic-format=noColor %ohos_opt --dy-std %f -o %output 2>&1 | compare %f


main() {
    const value = 3
    match (value) {
        case 3 => println("selected")
        case 4 => println("nonmatching")
        case _ => println("fallback")
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> C6_const_selector.cj:17:14:
   | 
17 |         case 4 => println("nonmatching")
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> C6_const_selector.cj:18:14:
   | 
18 |         case _ => println("fallback")
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
2 warnings generated, 2 warnings printed.
*/
