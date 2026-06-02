/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*

class A {}

interface I <: Hashable & Equatable<I> {
    operator func ==(that: I): Bool {
        return true;
    }
    operator func !=(that: I): Bool {
        return false
    }
    func hashCode(): Int64 {
        return 9
    }
}

extend A <: I {
    public operator func ==(that: I): Bool {
        return true;
    }
    public operator func !=(that: I): Bool {
        return false
    }
    public func hashCode(): Int64 {
        return 9
    }
}

var a: HashSet<I> = HashSet<I>()

main(): Int64 {
    a.add(A())
    if (a.isEmpty()) {
        return 1
    }

    for (i in a) {
        if (i is A && i is I) {
        } else {
            return 2
        }
    }
    return 0
}
