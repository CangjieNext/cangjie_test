/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

import std.ast.*

main() {
    var p = Position(-1, Int32.Max, Int32.Max)
    if (p.fileID != UInt32.Max) {
        return 1
    }
    if (p.line != Int32.Max) {
        return 2
    }
    if (p.column != Int32.Max) {
        return 3
    }
    return 0
}
// ASSERT: scan sema_exceed_num_value_range
