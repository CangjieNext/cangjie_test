// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main() {
    return case3()
}

func case3() {
    var node: Node<Int64> = Node(1)
    node.left = Option<Node<Int64>>.Some(Node<Int64>(2))
    node.left = Option<Node<Int64>>.None
    match (node.left) {
        case Some(v) => return 1
        case None => return 0
    }
}

class Node<T> where T <: ToString {
    public var value: T
    public var right: Option<Node<T>> = None<Node<T>>
    public var left: Option<Node<T>> = None<Node<T>>
    public init(v: T) {
        this.value = v
    }
}
