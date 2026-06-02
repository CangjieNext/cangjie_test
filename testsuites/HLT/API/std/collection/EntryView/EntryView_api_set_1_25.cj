/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    var hashmap = HashMap<String, B>()
    var ele1 = B(32)
    var entry = hashmap.entryView("key")
    entry.value = ele1
    var ele2 = B(78)
    var setResult = entry.value.getOrThrow()
    entry.value = ele2
    if (setResult != ele1 || hashmap.get("key").getOrThrow() != ele2) {
        return 1
    }
    return 0
}

open class A <: Equatable<A> {
    public var id: Int64
    public init(id: Int64) {
        this.id = id
    }
    public operator func ==(that: A): Bool {
        return this.id == that.id
    }
    public operator func !=(that: A): Bool {
        return this.id != that.id
    }
}

class B <: A {
    public init(id: Int64) {
        super(id)
    }
}
