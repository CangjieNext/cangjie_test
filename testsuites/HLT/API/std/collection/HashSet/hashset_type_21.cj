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

main(): Int64 {
    var str: Array<Mut<Int64>> = [Mut<Int64>(), subMut<Int64>()]
    var r1: HashSet<Mut<Int64>> = HashSet<Mut<Int64>>(str)
    var r2: HashSet<Mut<Int64>> = HashSet<Mut<Int64>>([Mut<Int64>(), subMut<Int64>()])
    if (r1.size != 2) {
        return 1
    }
    if (r1.contains(str[0]) != true) {
        return 2
    }
    if (r1.contains(str[1]) != true) {
        return 3
    }
    if (r2.size != 2) {
        return 4
    }
    if (r2.contains(str[0]) != true) {
        return 5
    }
    if (r2.contains(str[1]) != true) {
        return 6
    }
    print("success1\n")
    return 0
}

open class Mut<T> <: Hashable {
    public func test(x: Int64): Int64 {
        return x
    }
    public open func hashCode(): Int64 {
        return 9
    }
}

class subMut<T> <: Mut<T> {
    public func test1(x: Int64): Int64 {
        return x
    }
    public override func hashCode(): Int64 {
        return 10
    }
}

extend<T> Mut<T> <: Equatable<Mut<T>> {
    public operator func ==(that: Mut<T>): Bool {
        return true;
    }
    public operator func !=(that: Mut<T>): Bool {
        return false
    }
}
