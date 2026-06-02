// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
package A


// f5 expects:
// 1. Unit (zero-sized type) parameters should be reported error.
@C
public func f5(a: Unit, id: Int64): Int64 {
    return 0
}
