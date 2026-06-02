// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main(): Int64 {
    let pattern = ExceptTypePattern(quote(e: Exception))
    if (pattern.colon.kind == ILLEGAL) {
        return 1
    }

    try {
        let pattern2 = ExceptTypePattern(quote(public func))
    } catch (e: ASTException) {
        return 0
    }

    return 2
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
