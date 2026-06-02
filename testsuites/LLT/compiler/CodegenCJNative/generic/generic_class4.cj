// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

open class Node<V> {
    public var nodeValue: V
    public init(nv: V) {
        nodeValue = nv
    }
}

class ListNode<V> <: Node<V> {
    public init(nv: V) {
        super(nv)
    }
}

class ListEntry<V> {
    public var head: ListNode<V>
    public init(nv: V) {
        this.head = ListNode<V>(nv)
    }
    public func get(): V {
        var ret: V = head.nodeValue
        return ret
    }
}

main(): Int64 {
    var ins = ListEntry<Int64>(0)
    ins.head.nodeValue = 33
    return ins.get() - 33
}
