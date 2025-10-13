package pkg

public const a: Int32 = 1
@Frozen
public func foo1(): Int32 {
    a
}
@Frozen
public func foo2(): Int32 {
    foo1()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
