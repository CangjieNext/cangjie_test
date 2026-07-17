// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件3-2: 含 GC 指针字段的 struct 栈分配 + 深递归 → 触发 CJStackPointerInserter (未覆盖29行)
//   栈指针插入: 函数局部有 GC 对象/含 GC 引用的 struct, 需插入栈扫描根
//   用 class 链表(堆 GC 对象)+ 递归遍历 → 多层栈帧触发栈指针链表建立各分支
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class GcNode {
    var v: Int64 = 0
    var next: ?GcNode = None
    public init(v: Int64) { this.v = v }
}

func buildList(n: Int64): ?GcNode {
    if (n <= 0) { return None }
    let head = GcNode(1)
    var cur: GcNode = head
    var i = 2
    while (i <= n) {
        let nd = GcNode(i)
        cur.next = nd
        cur = nd
        i += 1
    }
    return head
}

func sumRec(n: ?GcNode, acc: Int64): Int64 {
    match (n) {
        case Some(node) => return sumRec(node.next, acc + node.v)
        case None => return acc
    }
}

main(): Int64 {
    let head = buildList(100)
    let s = sumRec(head, 0)
    // 1+2+...+100 = 5050
    if (s == 5050) { return 0 }
    return 1
}
