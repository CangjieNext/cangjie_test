// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Some(B)\nSome(C)\n

struct Node<T> {
    public Node(
        var value: T,
        var left!: Option<Node<T>> = None,
        var right!: Option<Node<T>> = None
    ) {}

    public func split(): (?Node<T>, ?Node<T>) {
        (this.left, this.right)
    }
}

main(): Unit {
    let node = Node("A", left: Node("B"), right: Node("C"))

    let res = node.split()
    println(res[0]?.value) // prints "Some(B)"
    println(res[1]?.value) // prints "Some(C)"
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
