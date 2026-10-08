// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgs

// 关联值枚举：无参 / 单参 / 双参构造器；match 收在库内（避免 main 端构造器歧义）
// 注意：E.A 为第 1 个构造器（tag() == 1 断言依赖此顺序），勿调序
public enum E {
    | A
    | B(Int64)
    | C(String, Bool)
}

// 注意：F.A 为第 3 个构造器（tag() == 3 断言依赖此顺序），勿调序
public enum F {
    | X
    | Y
    | A(Int32)
}

public let enumTagBase: Int64 = 100

public var enumUses: Int64 = 0

public func useEnum(e: E): Int64 {
    enumUses += 1
    return match (e) {
        case A => enumTagBase + 1
        case B(v) => enumTagBase + Int64(v)
        case C(_, b) => if (b) { enumTagBase + 3 } else { enumTagBase - 3 }
    }
}

public func makeB(v: Int64): E {
    return B(v)
}

public func makeC(s: String, b: Bool): E {
    return C(s, b)
}

public func tagE(e: E): Int64 {
    return match (e) {
        case A => 1
        case B(_) => 2
        case C(_, _) => 3
    }
}
public func tagF(f: F): Int64 {
    return match (f) {
        case X => 1
        case Y => 2
        case A(_) => 3
    }
}
