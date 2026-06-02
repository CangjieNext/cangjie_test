/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args
import std.ast.*

main() {
    var p = Position(0, -1, -1)
    if (p.fileID != 0) {
        return 1
    }
    if (p.line != -1) {
        return 2
    }
    if (p.column != -1) {
        return 3
    }
    return 0
}
