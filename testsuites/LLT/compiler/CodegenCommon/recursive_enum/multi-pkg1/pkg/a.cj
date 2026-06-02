// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public struct Node1 {
    public var a = Option<Node2>.None
}

public class Node2 {
    public var ab = Node1()
    public var k = 19
}
