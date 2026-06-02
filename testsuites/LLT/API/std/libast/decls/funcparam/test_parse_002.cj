// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

import std.ast.*
import std.collection.*

main() {
    let param = FuncParam(quote(testParam!: Int64 = 1))
    if (param.identifier.value != "testParam") {
        return 1
    }

    if (param.not.kind == ILLEGAL) {
        return 2
    }

    if (param.assign.kind == ILLEGAL) {
        return 3
    }

    if (param.colon.kind == ILLEGAL) {
        return 4
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
