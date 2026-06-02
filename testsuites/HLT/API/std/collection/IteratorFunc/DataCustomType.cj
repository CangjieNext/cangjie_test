/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.random.*

public open class A <: Equatable<A> & Hashable {
    public var value: Int64 = 0
    public init(m: Int64) {
        this.value = m
    }
    public func hashCode(): Int64 {
        return this.value
    }
    public operator func ==(right: A): Bool {
        if (this.value == right.value) {
            return true
        }
        return false
    }
    public operator func !=(right: A): Bool {
        if (this.value != right.value) {
            return true
        }
        return false
    }
}

public class B <: A {
    public init(m: Int64) {
        super(m)
    }
}

extend B <: Equatable<B> {
    public operator func ==(right: B): Bool {
        if (this.value == right.value) {
            return true
        }
        return false
    }
    public operator func !=(right: B): Bool {
        if (this.value != right.value) {
            return true
        }
        return false
    }
}

struct C <: Equatable<C> & Hashable {
    var y: Int64
    public init(m: Int64) {
        this.y = m
    }
    public func hashCode(): Int64 {
        return Random().nextInt64()
    }
    public operator func ==(right: C): Bool {
        if (this.y == right.y) {
            return true
        }
        return false
    }
    public operator func !=(right: C): Bool {
        if (this.y != right.y) {
            return true
        }
        return false
    }
}
