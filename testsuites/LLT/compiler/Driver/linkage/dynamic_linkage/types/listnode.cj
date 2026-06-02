// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package types

internal import stdx.encoding.json.*
internal import std.collection.*

public class LinkedListNode {
    public var val: Int64
    public var next: Option<LinkedListNode>

    public init() {
        val = 0
        next = Option<LinkedListNode>.None
    }

    public init(val: Int64) {
        this.val = val
        next = Option<LinkedListNode>.None
    }
}

public func array_to_listnode(arr: ArrayList<JsonValue>): Option<LinkedListNode> {
    let dummy = LinkedListNode()
    var head = dummy
    for (i in arr) {
        let tmp = LinkedListNode(i.asInt().getValue())
        head.next = tmp
        head = tmp
    }
    return dummy.next;
}
