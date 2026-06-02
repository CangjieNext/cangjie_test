// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package B

public enum Enum_1 {
    defaultValue
}

public var var_1: Bool = true

public class Class_1 {
    public init() {}

    public func func_inner<T0>(a: T0): T0 {
        a
    }
    public func func_outer(param1: UInt16): Int64 {
        match (Enum_1.defaultValue) {
            case _: Bool => 1
            case _ =>
                func func_inner<T0>(a: T0): T0 {
                    a
                }
                var_1 = func_inner(var_1)
                1
        }
        match (Enum_1.defaultValue) {
            case _: Bool => 1
            case _ =>
                func func_inner<T0>(a: T0): T0 {
                    a
                }
                var_1 = func_inner(var_1)
                1
        }
    }
}
