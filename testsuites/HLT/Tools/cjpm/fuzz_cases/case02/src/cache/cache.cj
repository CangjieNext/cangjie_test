/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test.cache

internal import std.time.*
internal import std.collection.*
internal import std.sync.*

let NoExpiration = Duration.second * (-1)
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
    protected var defaultExpiration: Duration
    protected var items: HashMap<String, Item<T>>
    protected var mu: ReentrantMutex
    protected var onEvicted: Option<(String, T) -> Unit>
    private var janitor: ?Janitor<T> = None

    public init(defaultExpiration: Duration, cleanupInterval: Duration, items: HashMap<String, Item<T>>) {
        this.defaultExpiration = defaultExpiration
        this.items = items
        this.mu = ReentrantMutex()
        this.onEvicted = None
        if (cleanupInterval.toNanoseconds() > 0) {
            this.janitor = Janitor<T>(cleanupInterval)
            this.janitor?.run(this)
        }
    }
    public init(defaultExpiration: Duration, cleanupInterval: Duration) {
        this.defaultExpiration = defaultExpiration
        this.items = HashMap()
        this.mu = ReentrantMutex()
        this.onEvicted = None
        if (cleanupInterval.toNanoseconds() > 0) {
            this.janitor = Janitor<T>(cleanupInterval)
            this.janitor?.run(this)
        }
    }

    public func Set(k: String, v: T, d!: Duration = NoExpiration) {
        var e: Int64 = d.toMicroseconds()
        if (d == DefaultExpiration) {
            e = this.defaultExpiration.toMicroseconds()
        }
        synchronized(this.mu) {
            this.items.add(k, Item(v, e))
        }
    }

    private func set(k: String, v: T, d!: Duration = DefaultExpiration) {
        var e: Int64 = d.toMicroseconds()
        if (d == DefaultExpiration) {
            e = this.defaultExpiration.toMicroseconds()
        }
        this.items.add(k, Item(v, e))
    }

    public func SetDefault(k: String, v: T) {
        this.Set(k, v)
    }

    private func get(k: String): Option<T> {
        if (this.items.contains(k)) {
            let v = this.items[k]
            if (v.Expiration > 0) {
                if (DateTime.now().toUnixTimeStamp().toNanoseconds() > v.Expiration) {
                    return None
                }
            }
            return v.Data
        } else {
            return None
        }
    }

    public func Add(k: String, v: T, d!: Duration = DefaultExpiration): Option<Unit> {
        synchronized(this.mu) {
            if (this.items.contains(k)) {
                return None
            } else {
                this.set(k, v, d: d)
                return Some(())
            }
        }
    }

    public func Replace(k: String, v: T, d!: Duration = DefaultExpiration): Option<Unit> {
        synchronized(this.mu) {
            if (this.items.contains(k)) {
                this.set(k, v, d: d)
                return Some(())
            } else {
                return None
            }
        }
    }

    public func Get(k: String): Option<T> {
        this.mu.lock()
        if (this.items.contains(k)) {
            let v = this.items[k]
            if (v.Expiration > 0) {
                if (DateTime.now().toUnixTimeStamp().toNanoseconds() > v.Expiration) {
                    return None
                }
            }
            this.mu.unlock()
            return v.Data
        } else {
            this.mu.unlock()
            return None
        }
    }

    private func delete(k: String): Option<T> {
        this.mu.lock()
        if (this.items.contains(k)) {
            let v = this.items[k]
            this.items.remove(k)
            this.onEvicted?(k, v.Data)
            this.mu.unlock()
            return v.Data
        } else {
            this.mu.unlock()
            return None
        }
    }

    public func Delete(k: String) {
        this.mu.lock()
        let r = this.delete(k)
        this.mu.unlock()
        match (r) {
            case None => ()
            case Some(v) => this.onEvicted?(k, v)
        }
    }

    public func DeleteExpired() {
        var evictedItems = ArrayList<KeyValue<T>>()
        let now = DateTime.now().toUnixTimeStamp().toNanoseconds()
        this.mu.lock()
        for ((k, item) in this.items) {
            if (item.Expiration > 0 && now > item.Expiration) {
                let r = this.delete(k)
                match (r) {
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

    public func OnEvicted(fn: (String, T) -> Unit) {
        this.mu.lock()
        this.onEvicted = fn
        this.mu.unlock()
    }

    public func Items(): HashMap<String, Item<T>> {
        this.mu.lock()
        let m = HashMap<String, Item<T>>(this.items.size)
        let now = DateTime.now().toUnixTimeStamp().toNanoseconds()
        for ((key, item) in this.items) {
            if (item.Expiration > 0) {
                if (now > item.Expiration) {
                    continue
                }
            }
            m.add(key, item)
        }
        return m
    }

    public func ItemCount(): Int64 {
        this.mu.lock()
        let n = this.items.size
        this.mu.unlock()
        return n
    }

    public func Flush() {
        this.mu.lock()
        this.items.clear()
        this.mu.unlock()
    }
}

struct KeyValue<T> {
    var key: String
    var value: T
    init(key: String, value: T) {
        this.key = key
        this.value = value
    }
}

class Janitor<T> {
    let Interval: Duration
    init(interval: Duration) {
        this.Interval = interval
    }
    func run(c: Cache<T>) {
        var ticker = Timer.repeat(
            this.Interval,
            this.Interval,
            {
                =>
                    let count = c.ItemCount()
                    println("count: ${count}")
            }
        )
    }
}
