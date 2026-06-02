// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 19\n18\n17\n16\n15\n14\n13\n12\n11\n10\n9\n8\n7\n6\n5\n4\n3\n2\n1\n

struct Node {
    var next = Option<Node>.None
    var data: Int64 = 0
    var c = Mode()
    var d = Node1()
    init(x: Int64) {
        data = x
    }
    mut func goo() {
        var t = next
        next = t
    }
}

struct Node1 {
    var a = Option<Node2>.None
}

struct Node2 {
    var ab = Option<Node3>.None
}

struct Node3 {
    var a = Node(2)
}

struct Mode {
    var a = Option<Node3>.None
}

func foo() {
    var k = Node1()
    var h = Node(5).next
}

main() {
    var last = Node(1)
    var idx = 2
    while (idx < 20) {
        var node = Node(idx)
        node.next = Option<Node>.Some(last)
        last = node
        idx++
    }
    println(last.data)

    while (match (last.next) {
            case Some(node) =>
                println(node.data)
                last = node
                true
            case _ => false
        }) {}
    0
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
