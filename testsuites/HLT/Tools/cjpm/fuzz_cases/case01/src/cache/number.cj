/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test.cache

internal import std.sync.*

extend Cache<Int64> {
    public func Increment(k: String, n: Int64): Option<Unit> {
        synchronized(this.mu) {
            if (this.items.contains(k)) {
                var v = this.items[k]
                if (v.Expired()) {
                    return None
                }
                println(v.Data)
                v.Data += n
                println(v.Data)
                this.items[k] = Item(v.Data, v.Expiration)
                return Some(())
            } else {
                return None
            }
        }
    }
}
