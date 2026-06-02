// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
package A


@C
public struct R {
    public var x: Int64
    public var y: Int64
    public var z: Int64

    public init(a: Int64) {
        x = a
        y = a
        z = a
    }
}

// f2 expects:
// 1. struct return type should change to void and be moved to the first argument with SRet & NoAlias attrs set
// 2. struct arguments should be set ByVal attr
@C
public func f2(arg0: R, arg1: R): R {
    return arg0
}