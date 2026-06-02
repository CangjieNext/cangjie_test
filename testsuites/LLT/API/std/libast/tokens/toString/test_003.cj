// DEPENDENCE: macro_define.cj
// EXEC-0: %compiler %cmp_opt macro_define.cj %cmp_macro
// EXEC-PIPE-0: %pwd_to_ld_path %compiler %cmp_opt -Woff unused %n.cj %macro_lib -o %output 2>&1 | compare %f
import std.ast.*
import macro_def.*

/* DOLLAR test */
@M
func f(): Float64 {
    var a = "${100}"
    var b = "$ {100}"
    var c = " ${100}"
    return 0.0
}

main(): Int64 {
    return 0
}

/* SCAN-IN
func f(): Float64 {
    var a = "${100}"
    var b = "$ {100}"
    var c = " ${100}"
    return 0.0
}

*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
