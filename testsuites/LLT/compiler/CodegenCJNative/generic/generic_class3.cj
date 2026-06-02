// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

open class Node<K> {
    public var nodeKey: K
    public init(nk: K) {
        nodeKey = nk
    }
    public func key() {
        return this.nodeKey
    }
}

class TreeNode<K> <: Node<K> {
    public init(nk: K) {
        super(nk)
    }
    public func set(srcNode: TreeNode<K>) {
        this.nodeKey = srcNode.key()
        return this.nodeKey
    }
}

main(): Int64 {
    var ins = TreeNode<Int64>(0)
    ins.nodeKey = 1
    return ins.set(ins) + ins.key() - 2
}
