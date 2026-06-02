/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f

import std.ast.*

main() {
    Int64(quote(1))
    UInt32(quote(1))
    Rune(quote(1))
    return 0
}
// ASSERT: scan sema_numeric_convert_must_be_numeric
