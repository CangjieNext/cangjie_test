// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args
internal import std.ast.*

main() {
    let t1 = TokenKind.IDENTIFIER
    let t2 = TokenKind.ADD
    let t3 = MUL
    let t4 = ILLEGAL

    let s1 = "${t1}"
    let s2 = "${t2}"
    let s3 = "${t3}"
    let s4 = "${t4}"

    if (s1 != "IDENTIFIER" || s2 != "ADD" || s3 != "MUL" || s4 != "ILLEGAL") {
        return 1
    }
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
