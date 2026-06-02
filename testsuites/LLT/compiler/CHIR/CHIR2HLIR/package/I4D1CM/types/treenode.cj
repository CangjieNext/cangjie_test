// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package types

internal import stdx.encoding.json.*
internal import std.collection.*

public class TreeNodeSer {
    public var val: Int64
    public var left: Option<TreeNodeSer>
    public var right: Option<TreeNodeSer>

    public init() {
        val = 0
        left = Option<TreeNodeSer>.None
        right = Option<TreeNodeSer>.None
    }
    public init(val: Int64) {
        this()
        this.val = val
    }
}

public func array_to_TreeNodeSer(arr: ArrayList<JsonValue>): Option<TreeNodeSer> {
    let n = arr.size
    if (n == 0) {
        return Option<TreeNodeSer>.None
    }
    let list = ArrayList<Option<TreeNodeSer>>()
    for (jv in arr) {
        var node: Option<TreeNodeSer>
        try {
            node = TreeNodeSer(jv.asInt().getValue())
        } catch (e: JsonException) {
            node = Option<TreeNodeSer>.None
        }
        list.add(node)
    }
    let q = ArrayList<TreeNodeSer>()
    q.add(list.get(0).getOrThrow().getOrThrow())
    for (i in 1..n) {
        let not_none = match (list.get(i).getOrThrow()) {
            case Some(a) => true
            case None => false
        }
        if (not_none) {
            let node = list.get(i).getOrThrow().getOrThrow()
            let parent = q.get((i - 1) / 2).getOrThrow()
            if ((i - 1) % 2 == 0) {
                parent.left = node
            } else {
                parent.right = node
            }
            q.add(node)
        }
    }
    return list.get(0).getOrThrow()
}
