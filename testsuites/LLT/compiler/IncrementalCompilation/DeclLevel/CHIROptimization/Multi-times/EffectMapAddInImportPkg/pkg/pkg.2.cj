package pkg

public const a: Int32 = 0
public const b: Int32 = 3
@Frozen
public func foo1(): Int32 {
    a
}
@Frozen
public func foo2(): Int32 {
    foo1()
}
@Frozen
public func foo3(): Int32 {
    b + foo4()
}
@Frozen
public func foo4(): Int32 {
    b
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
