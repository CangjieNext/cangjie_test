// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cache

internal import std.time.*
internal import std.{collection.HashMap, collection.ArrayList}
internal import std.sync.ReentrantMutex

let NoExpiration = Duration.nanosecond * (-1)
let DefaultExpiration = Duration.Zero

public struct Item<T> {
    var Data: T
    var Expiration: Int64 = 0
    init(data: T) {
        this.Data = data
    }

    init(data: T, expiration: Int64) {
        this.Data = data
        this.Expiration = expiration
    }

    func Expired(): Bool {
        if (this.Expiration == 0) {
            return false
        }
        return DateTime.now().toUnixTimeStamp().toNanoseconds() > this.Expiration
    }
}

public class Cache<T> {
    private var defaultExpiration: Duration
    private var items: HashMap<String, Item<T>>
    private var mu: ReentrantMutex
    private var onEvicted: Option<(String, T) -> Unit>

    init(defaultExpiration: Duration, cleanupInterval: Duration, items: HashMap<String, Item<T>>) {
        this.defaultExpiration = defaultExpiration
        this.items = items
        this.mu = ReentrantMutex()
        this.onEvicted = None
    }
    public init(defaultExpiration: Duration, cleanupInterval: Duration) {
        this.defaultExpiration = defaultExpiration
        this.items = HashMap()
        this.mu = ReentrantMutex()
        this.onEvicted = None
    }

    public func Set(k: String, v: T, d!: Duration = DefaultExpiration) {
        var e: Int64 = d.toMicroseconds()
        if (d == DefaultExpiration) {
            e = this.defaultExpiration.toMicroseconds()
        }
        this.mu.lock()
        this.items.add(k, Item(v, e))
        this.mu.unlock()
    }

    private func set(k: String, v: T, d!: Duration = DefaultExpiration) {
        var e: Int64 = d.toNanoseconds()
        if (d == DefaultExpiration) {
            e = this.defaultExpiration.toMicroseconds()
        }
        this.items.add(k, Item(v, e))
    }

    func SetDefault(k: String, v: T) {
        this.Set(k, v)
    }

    private func get(k: String): Option<T> {
        let item = this.items.get(k)
        match (item) {
            case None => None
            case Some(v) =>
                if (v.Expiration > 0 && DateTime.now().toUnixTimeStamp().toNanoseconds() > v.Expiration) {
                    return None
                }
                v.Data
        }
    }

    func Add(k: String, v: T, d!: Duration = DefaultExpiration): Option<Bool> {
        this.mu.lock()
        let item = this.get(k)
        match (item) {
            case Some(_) =>
                this.mu.unlock()
                throw Exception("Item ${k} already exists")
            case None =>
                this.set(k, v, d: d)
                this.mu.unlock()
                true
        }
    }

    func Replace(k: String, v: T, d!: Duration = DefaultExpiration): Option<Bool> {
        this.mu.lock()
        let item = this.get(k)
        match (item) {
            case None =>
                this.mu.unlock()
                throw Exception("Item ${k} doesn't exist")
            case Some(_) =>
                this.set(k, v, d: d)
                this.mu.unlock()
                true
        }
    }

    public func Get(k: String): Option<T> {
        this.mu.lock()
        let item = this.items.get(k)
        match (item) {
            case None =>
                this.mu.unlock()
                return None
            case Some(v) =>
                if (v.Expiration > 0) {
                    if (DateTime.now().toUnixTimeStamp().toNanoseconds() > v.Expiration) {
                        return None
                    }
                }
                this.mu.unlock()
                return v.Data
        }
    }

    func GetWithExpiration(k: String): Option<(T, Int64)> {
        this.mu.lock()
        let item = this.items.get(k)
        match (item) {
            case None =>
                this.mu.unlock()
                return None
            case Some(v) =>
                if (v.Expiration > 0) {
                    if (DateTime.now().toUnixTimeStamp().toNanoseconds() > v.Expiration) {
                        this.mu.unlock()
                        return None
                    }
                    this.mu.unlock()
                    return (v.Data, v.Expiration)
                }
                return (v.Data, 0)
        }
    }

    private func delete(k: String): (Option<T>, Bool) {
        match (this.onEvicted) {
            case None =>
                this.items.remove(k)
                return (None, false)
            case Some(fn) =>
                let item = this.items.get(k)
                match (item) {
                    case None => return (None, false)
                    case Some(v) =>
                        this.items.remove(k)
                        return (v.Data, true)
                }
        }
    }

    func Delete(k: String) {
        this.mu.lock()
        let (value, evicted) = this.delete(k)
        this.mu.unlock()
        if (!evicted) {
            return
        }
        match (value) {
            case None => ()
            case Some(v) => this.onEvicted?(k, v)
        }
    }

    func DeleteExpired() {
        var evictedItems = ArrayList<KeyValue<T>>()
        let now = DateTime.now().toUnixTimeStamp().toNanoseconds()
        this.mu.lock()
        for ((k, item) in this.items) {
            if (item.Expiration > 0 && now > item.Expiration) {
                let (value, evicted) = this.delete(k)
                if (!evicted) {
                    continue
                }
                match (value) {
                    case None => ()
                    case Some(ov) => evictedItems.add(KeyValue(k, ov))
                }
            }
        }
        this.mu.unlock()
        for (item in evictedItems) {
            this.onEvicted?(item.key, item.value)
        }
    }

    func OnEvicted(fn: (String, T) -> Unit) {
        this.mu.lock()
        this.onEvicted = fn
        this.mu.unlock()
    }

    func Items(): HashMap<String, Item<T>> {
        this.mu.lock()
        let m = HashMap<String, Item<T>>(this.items.size)
        let now = DateTime.now().toUnixTimeStamp().toNanoseconds()
        for ((key, item) in this.items) {
            if (item.Expiration > 0 && now > item.Expiration) {
                continue
            }
            m.add(key, item)
        }
        return m
    }

    func ItemCount(): Int64 {
        this.mu.lock()
        let n = this.items.size
        this.mu.unlock()
        return n
    }

    func Flush() {
        this.mu.lock()
        this.items.clear()
        this.mu.unlock()
    }
}

public struct KeyValue<T> {
    var key: String
    var value: T
    init(key: String, value: T) {
        this.key = key
        this.value = value
    }
}
