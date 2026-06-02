// EXEC-PIPE-0: %pwd_to_ld_path %compiler %cmp_opt -Woff unused %n.cj %macro_lib -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1

internal import std.ast.*

main() {
    var t = cangjieLex("func foo() { }")
    if (t.toString() != "func foo() { }") {
        return 1
    }
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
