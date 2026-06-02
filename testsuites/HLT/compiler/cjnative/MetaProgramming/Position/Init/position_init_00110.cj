/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %use_ast %enable_macro %f -o %output

import std.ast.*

main() {
    let MIN_INT32: Int32 = -0x8000_0000
    var p = Position(0, MIN_INT32 - 1, MIN_INT32 - 1)
    if (p.fileID != 0) {
        return 1
    }
    if (p.line != MIN_INT32) {
        return 2
    }
    if (p.column != MIN_INT32) {
        return 3
    }
    return 0
}
// ASSERT: scan chir_arithmetic_operator_overflow
