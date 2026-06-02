// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func foo1(): Int64 {
    print("foo1")
    0
}

func foo2(): Int64 {
    print("foo2")
    0
}

let (_, (_, _, _)) = (foo1(), (foo2(), foo2(), foo2()))
let ((_, _), (_, (_, _))) = ((foo1(), foo3()), (foo2(), (foo1(), foo2())))