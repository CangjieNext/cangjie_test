// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
package A


// f7 expects:
// 1. the parameter and return type should be changed to i64*
@C
public func f7(a: CPointer<Int64>): CPointer<Int64> {
    return a
}