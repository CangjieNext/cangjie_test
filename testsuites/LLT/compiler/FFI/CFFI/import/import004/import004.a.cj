// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
package A


@C
public struct Empty {}

@C
public struct Empty2 {
    public var a: Empty = Empty()
}

// f4 expects:
// 1. nested zero-sized struct return type should change to void
// 2. nested empty (zero-sized type) parameter type should be omitted
@C
public func f4(a: Empty2): Empty2 {
    return Empty2()
}
