// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件9-1: 多种逃逸姿势 → 触发 CJPartialEscapeAnalysis.cpp 各 visitor 分支
//   覆盖: GCNew(malloc), 不逃逸(可栈提升)/逃逸到返回值/逃逸到全局/逃逸到参数/PHI合并/select
//         visitExtractValueInst, handleLoad, handleMemcpyOrWriteAgg, countRefOffsets
//   含 GC 引用字段的 struct/array 被各种方式传递
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class Node {
    var v: Int64 = 0
    var next: ?Node = None
    public init(v: Int64) { this.v = v }
}

struct Holder {
    var n: ?Node = None
    var x: Int64 = 0
}

// 1. 不逃逸: 局部 new, 不返回不存全局 → 可栈提升
func noEscape(): Int64 {
    let n = Node(42)
    return n.v
}

// 2. 逃逸到返回值
func escapeReturn(): Node {
    let n = Node(7)
    return n
}

// 3. 逃逸到全局
var gNode: ?Node = None
func escapeGlobal() {
    let n = Node(99)
    gNode = n
}

// 4. 逃逸到参数(传给外部函数)
func escapeArg(n: Node) {
    gNode = n
}

// 5. PHI 合并: 条件选不同来源的 GC 指针
func pickPhi(cond: Bool): Node {
    let a = Node(1)
    let b = Node(2)
    var r: Node
    if (cond) { r = a } else { r = b }
    return r
}

// 6. select 风格: 三元表达式选 GC 对象
func pickSelect(cond: Bool): Node {
    let a = Node(10)
    let b = Node(20)
    let r = if (cond) { a } else { b }
    return r
}

// 7. 含 GC 字段的 struct 传递
func useHolder(): Int64 {
    var h = Holder()
    h.n = Node(5)
    h.x = 3
    match (h.n) {
        case Some(node) => return node.v + h.x
        case None => return -1
    }
}

// 8. 大对象(触发 CJMaxStackObject 上限判断)
class Big {
    var arr: Array<Int64>
    public init() {
        arr = Array<Int64>(1024, repeat: 0)
    }
}
func makeBig(): Int64 {
    let b = Big()
    var s = 0
    for (i in 0..1024) { s += b.arr[i] }
    return s
}

main(): Int64 {
    var s = 0
    s += noEscape()
    s += escapeReturn().v
    escapeGlobal()
    match (gNode) {
        case Some(n) => s += n.v
        case None => s += 0
    }
    s += pickPhi(true).v + pickPhi(false).v
    s += pickSelect(true).v
    s += useHolder()
    s += makeBig()
    if (s > 0) { return 0 }
    return 1
}
