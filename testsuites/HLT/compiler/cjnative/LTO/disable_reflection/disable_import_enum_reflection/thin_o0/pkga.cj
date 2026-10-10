// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkga

// 注意：E.A 为第 3 个构造器（tag() == 3 断言依赖此顺序），勿调序
public enum E {
    | B(Int64)
    | C(String, Bool)
    | A(Int32)
}

// 注意：F.A 为第 1 个构造器（tag() == 1 断言依赖此顺序），勿调序
public enum F {
    | A(Int64)
    | Y
}

public let enumTagBase: Int64 = 200

public var enumUses: Int64 = 0

public func useEnum(e: E): Int64 {
    enumUses += 1
    return match (e) {
        case A(v) => enumTagBase + Int64(v)
        case B(v) => enumTagBase + Int64(v)
        case C(_, b) => if (b) { enumTagBase + 1 } else { enumTagBase - 1 }
    }
}

public func makeA(v: Int32): E {
    return A(v)
}

public func tagEa(e: E): Int64 {
    return match (e) {
        case B(_) => 1
        case C(_, _) => 2
        case A(_) => 3
    }
}
public func tagFa(f: F): Int64 {
    return match (f) {
        case A(_) => 1
        case Y => 2
    }
}
