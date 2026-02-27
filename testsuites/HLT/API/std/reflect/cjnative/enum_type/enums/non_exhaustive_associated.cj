/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package enums

// 未穷尽，且存在拥有关联值的构造器，且关联值类型均为值类型
@MyAnnotation["hello"]
public enum NonExhaustiveAssociated0 <: Equatable<NonExhaustiveAssociated0> & ToString {
    | @MyAnnotation
    A
    | @MyAnnotation
    // 存在同名但不同关联值的构造器
    A(Bool)
    | @MyAnnotation
    B(Int64)
    | ...

    public operator func ==(another: NonExhaustiveAssociated0): Bool {
        match ((this, another)) {
            case (A, A) => true
            case (A(v0), A(v1)) => v0 == v1
            case (B(v0), B(v1)) => v0 == v1
            case _ => false
        }
    }
    public operator func !=(another: NonExhaustiveAssociated0): Bool {
        !(this == another)
    }
    public func toString(): String {
        match (this) {
            case A => "NonExhaustiveAssociated0.A"
            case A(v) => "NonExhaustiveAssociated0.A(${v})"
            case B(v) => "NonExhaustiveAssociated0.B(${v})"
            case _ => "?"
        }
    }
}
