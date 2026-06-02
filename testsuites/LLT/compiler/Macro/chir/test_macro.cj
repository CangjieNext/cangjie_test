// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f
// ASSERT: scan-1 sema_unreachable_pattern
// ASSERT: scan the warning originates in the macro `echo` (consider using `--debug-macro` for more info)
// ASSERT: scan-1 chir_dce_unused_function

import define.*

public enum Enum_1 {
    defaultValue
}

@echo
private func func_1() {
    let var_1: Enum_1 = Enum_1.defaultValue;
    match (var_1) {
        case defaultValue => ()

        case _ =>
            var var_1686173962304_986: String = ###"X]m!!R.&HF"###;
            var_1686173962304_986 = """
    O${var_1686173962304_986}^${var_1686173962304_986}+[${var_1686173962304_986}XKhBkX"""
    };
    UInt8(163)
}

main(): Int64 {
    return 0;
}

