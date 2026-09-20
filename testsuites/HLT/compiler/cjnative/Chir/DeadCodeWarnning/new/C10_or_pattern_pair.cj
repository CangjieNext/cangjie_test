// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C10_or_pattern_pair] 二选一 tuple or-pattern 双失败
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.2 C10（首 alternative 1 条 pattern@(1,2); 末 alternative 使条件确定失败, body 由末 alternative 范围吸收 → block 1 条——2026-09-20 新 SDK 与官方 complex_or_condition_source 完全一致: 1 pattern+1 block, 旧 SDK 2 pattern 为发散口径）
// EXEC-PIPE-0: %compiler --error-count-limit=all --diagnostic-format=noColor %ohos_opt --dy-std %f -o %output 2>&1 | compare %f


main() {
    let value = (3, 6)
    if (let (1, 2) | (3, 4) <- value) {
        println("dead if-let body")
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> C10_or_pattern_pair.cj:15:13:
   | 
15 |     if (let (1, 2) | (3, 4) <- value) {
   |             ^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> C10_or_pattern_pair.cj:15:22:
   | 
15 |     if (let (1, 2) | (3, 4) <- value) {
   |                      ^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
2 warnings generated, 2 warnings printed.
*/
