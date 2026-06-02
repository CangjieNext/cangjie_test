// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
package A


@C
public struct Empty {}

// f3 expects:
// 1. empty struct return type should change to void
// 2. empty (zero-sized type) parameter type should be omitted
@C
public func f3(a: Empty): Empty {
    return Empty()
}