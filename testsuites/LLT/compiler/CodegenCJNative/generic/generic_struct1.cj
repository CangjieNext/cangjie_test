// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct Node<T> where T <: ToString {
    public Node(var value: T,
        let left!: ?Node<T> = None,
        let right!: ?Node<T> = None) {}

    public func traverse(): Unit {
        left?.traverse()
        print(value)
        right?.traverse()
    }

    public mut func set(value: T) {
        this.value = value
    }
}

main() {
    var tree1 = Node('X',
        left: Node('B', left: Node('C', right: Node('D'))),
        right: Node('E', left: Node('F'), right: Node('G')))
    tree1.set('A')
    tree1.traverse()

    println()
    var tree2 = Node(0,
        left: Node(2, left: Node(3, right: Node(4))),
        right: Node(5, left: Node(6), right: Node(7)))
    tree2.set(1)
    tree2.traverse()
}