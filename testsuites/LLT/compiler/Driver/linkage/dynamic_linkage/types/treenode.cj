// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package types

internal import stdx.encoding.json.*
internal import std.collection.*

public class TreeNode {
    public var val: Int64
    public var left: Option<TreeNode>
    public var right: Option<TreeNode>

    public init() {
        val = 0
        left = Option<TreeNode>.None
        right = Option<TreeNode>.None
    }
    public init(val: Int64) {
        this()
        this.val = val
    }
}

public func array_to_treenode(arr: ArrayList<JsonValue>): Option<TreeNode> {
    let n = arr.size
    if (n == 0) {
        return Option<TreeNode>.None
    }
    let list = ArrayList<Option<TreeNode>>()
    var node: Option<TreeNode>
    for (jv in arr) {
        try {
            node = TreeNode(jv.asInt().getValue())
        } catch (e: JsonException) {
            node = Option<TreeNode>.None
        }
        list.add(node)
    }
    let q = ArrayList<TreeNode>()
    q.add(list.get(0).getOrThrow().getOrThrow())
    for (i in 1..n) {
        let not_none = match (list.get(i)) {
            case Some(a) => true
            case None => false
        }
        if (not_none) {
            let node = list.get(i).getOrThrow()
            let parent = q.get((i - 1) / 2).getOrThrow()
            if ((i - 1) % 2 == 0) {
                parent.left = node.getOrThrow()
            } else {
                parent.right = node.getOrThrow()
            }
            q.add(node.getOrThrow())
        }
    }
    return list.get(0).getOrThrow()
}
