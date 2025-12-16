/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not iOS) EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

main(): IntNative {
    var set: HashSet<IntNative> = HashSet<IntNative>([1, 2, 3])
    var set2: HashSet<UIntNative> = HashSet<UIntNative>([1, 2, 3])
    if (set.isEmpty()) {
        return 1
    }
    if (set2.isEmpty()) {
        return 1
    }
    return 0
}
