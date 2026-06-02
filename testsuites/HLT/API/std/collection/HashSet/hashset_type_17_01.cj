/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args|compare %f
// ASSERT: scan success1

import std.collection.*

var str: Array<Mut> = [Mut()]
var r1: HashSet<Mut> = HashSet<Mut>(str)
var r2: HashSet<Mut> = HashSet<Mut>([Mut()])

main(): Int64 {
    if (r1.size != 1) {
        return 1
    }
    if (r1.contains(str[0]) != true) {
        return 2
    }
    if (r2.size != 1) {
        return 3
    }
    if (r2.contains(str[0]) != true) {
        return 4
    }
    print("success1\n")
    return 0
}

class Mut <: Hashable & Equatable<Mut> {
    public operator func ==(that: Mut): Bool {
        return true;
    }
    public operator func !=(that: Mut): Bool {
        return false
    }
    public func hashCode(): Int64 {
        return 9
    }
}
