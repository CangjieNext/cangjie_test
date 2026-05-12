// Copyright (c) Huawei Technologies Co., Ltd. 2025-2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class Node {
    var data = "hello"
    var next = Option<Node>.None
}

var flag = true

main(){
    var node = Node()
    node.next = node
    while (flag) {}
    node.next = None
}