/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package example

internal import std.collection.*

class CachedRepo<K, V> <: Repo<K, V> where K <: Equatable<K> & Hashable {
    private let values = HashMap<K, V>()

    CachedRepo(private let repo: Repo<K, V>) {}

    func get(key: K): V {
        if (let Some(value) <- getFromCache(key)) {
            return value
        }
        return retrieve(key)
    }

    func getFromCache(key: K): ?V {
        return values.get(key)
    }

    public func retrieve(key: K): V {
        let fromRepo = repo.retrieve(key)
        values[key] = fromRepo
        return fromRepo
    }
}
