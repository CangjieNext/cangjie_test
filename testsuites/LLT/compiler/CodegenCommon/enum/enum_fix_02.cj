// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

struct Node {
    public Node(
        var value: String,
        var left!: Option<Node> = None,
        var right!: Option<Node> = None
    ) {}

    public func split(): (?Node, ?Node) {
        return (left, right)
    }

    public func s(): String {
        return "[Node ${value} left = ${left?.s() ?? "None"}, right = ${right?.s() ?? "None"}]"
    }
}

main(): Unit {
    let node = Node(
        "A",
        left: Node("B"),
        right: Node(
            "C",
            left: Node("D")
        )
    )

    println(node.s())

    let (l, r) = node.split()
    println(l.getOrThrow().s())
    println(r.getOrThrow().s())
}

/* SCAN-IN
[Node A left = [Node B left = None, right = None], right = [Node C left = [Node D left = None, right = None], right = None]]
[Node B left = None, right = None]
[Node C left = [Node D left = None, right = None], right = None]
 */
