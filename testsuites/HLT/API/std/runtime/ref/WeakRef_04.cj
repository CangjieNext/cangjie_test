/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-1: %compiler %cmp_opt %f -o %output

import std.ref.*

enum RGBColor {
    | Red | Green | Blue
}

main() {
    let r = RGBColor.Red
    var cache = WeakRef<RGBColor>(r, CleanupPolicy.DEFERRED)
    return 0
}
