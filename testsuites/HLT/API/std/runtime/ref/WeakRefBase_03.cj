/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: util.cj
// EXEC-1: %compiler %cmp_opt %f util.cj -o %output

import std.ref.*

main() {
    var a = Date()
    var cache = WeakRef<Date>(a, CleanupPolicy.EAG)
    return 0
}
