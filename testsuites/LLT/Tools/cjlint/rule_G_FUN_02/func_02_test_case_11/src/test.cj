// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package func_02_test_case_11

import std.sync.AtomicBool

class Entry<T> {
    var value_: T
    init(v: T) {
        this.value_ = v
    }
    prop value: T {
        get() {
            this.value_
        }
    }
}

class Pool<T> {
    func acquire(): Option<Entry<T>> {
        Option.None
    }
}

open class Conn {}
class ProxyConn <: Conn {
    init(c: Conn, e: Entry<Conn>) {}
}

class Holder {
    let closed = AtomicBool(false)
    let pool = Pool<Conn>()

    public func connect(): Conn {
        if (closed.load()) {
            throw Exception("closed")
        }
        var item = pool.acquire()
        match (item) {
            case Some(entry) => return ProxyConn(entry.value, entry)
            case None => if (closed.load()) {
                throw Exception("closed")
            } else {
                throw Exception("cannot acquire")
            }
        }
    }
}
