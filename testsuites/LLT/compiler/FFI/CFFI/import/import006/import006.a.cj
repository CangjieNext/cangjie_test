// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
package A


// f6 expects:
// 1. the parameter and return type should be changed to i8*
@C
public func f6(a: CString): CString {
    return a
}
