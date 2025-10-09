/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package skl.skiplist

import std.collection.*
import std.sync.*
import std.util.*
import std.math.*
import std.time.*

let MAX_LEVEL: Int64 = 32
let DefaultProbability: Float64 = 1.0 / Float64.GetE()

public struct Level<K, V> where K <: Comparable<K> & Equatable<K> & ToString, V <: ToString {
    public Level(public var next!: Option<Node<K, V>> = None) {}
}

public struct Node<K, V> where K <: Comparable<K> & Equatable<K> & ToString, V <: ToString {
    public var key: K
    public var value: V
    public var level: Array<Level<K, V>>
    public var prev: Option<Node<K, V>> = None

    public Node(key: K, value: V, level: Int64) {
        this.key = key
        this.value = value
        this.level = Array<Level<K, V>>(level, Level<K, V>())
    }
    public func toString(): String {
        return "[ level ${level.size} | key ${key} | value ${value} ]"
    }
}

public class SkipList<K, V> where K <: Comparable<K> & Equatable<K> & ToString, V <: ToString {
    private var head: Node<K, V>
    private var tail: Option<Node<K, V>> = None
    private var level: Int64 = 1
    private var length: Int64 = 0

    private var random: Random = Random()
    private var mutex: ReentrantMutex = ReentrantMutex()

    var probabilities = Array<UInt32>(MAX_LEVEL, 0)

    init() {
        this(MAX_LEVEL)
    }
    init(maxLevel: Int64) {
        this.head = unsafe { Node<K, V>(zeroValue(), zeroValue(), maxLevel) }
        var seed = DateTime.now().nanosecond
        this.random.seed = UInt64(seed)

        var p: Float64 = 1.0
        for (i in 0..MAX_LEVEL) {
            probabilities[i] = UInt32(Float64(UInt32.Max) * p)
            p *= DefaultProbability
        }
    }
    public func insert(key: K, value: V): Node<K, V> {
        var update: Array<Node<K, V>> = Array<Node<K, V>>(MAX_LEVEL, unsafe { zeroValue() })
        var x = this.head
        for (i in this.level - 1..0) {
            while (true) {
                match (x.level[i].next) {
                    case Some(next) =>
                        if (next.key <= key) {
                            x = next
                        } else {
                            break
                        }
                    case None => break
                }
            }
            update[i] = x
        }
        var level = randomLevel()
        if (level > this.level) {
            for (i in this.level..level) {
                update[i] = this.head
            }
            this.level = level
        }
        var newNode = Node<K, V>(key, value, level)
        for (i in 0..level) {
            newNode.level[i] = update[i].level[i]
            update[i].level[i] = Level<K, V>(next: newNode)
        }
        if (update[0].key == this.head.key) {
            newNode.prev = None
        } else {
            newNode.prev = update[0]
        }
        match (newNode.level[0].next) {
            case Some(v) => newNode.level[0] = Level<K, V>(next: newNode)
            case None => this.tail = newNode
        }
        this.length++
        return x
    }
    public func search(key: K): Option<V> {
        var x = this.head
        for (i in this.level - 1..0) {
            while (true) {
                match (x.level[i].next) {
                    case Some(next) =>
                        if (next.key <= key) {
                            x = next
                        } else {
                            break
                        }
                    case None => break
                }
            }
            if (x.key == key) {
                return x.value
            }
        }
        return None
    }
    func delete(key: K): Bool {
        var result: Bool = false

        return result
    }
    func findGreaterOrEqual(): Option<Node<K, V>> {
        return None
    }
    func randomLevel(): Int64 {
        var rnd = random.nextUInt32()
        var h = 1
        while (h < MAX_LEVEL && rnd <= probabilities[h]) {
            h++
        }

        return h
    }

    func toString(): String {
        return ""
    }
}

func test() {
    // var list = SkipList<Int64, Int64>()
    // list.insert(1, 10)
    // var e = list.search(1)
    // list.delete(1)
    // var e2 = list.search(1)
    // print("${e}, ${e2}")
}
