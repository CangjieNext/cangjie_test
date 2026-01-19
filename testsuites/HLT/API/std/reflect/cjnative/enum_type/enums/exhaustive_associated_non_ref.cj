/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package enums

// 穷尽，且存在拥有关联值的构造器，且关联值类型均为值类型，无引用类型
@MyAnnotation["hello"]
public enum ExhaustiveAssociatedNonRef <: Equatable<ExhaustiveAssociatedNonRef> & ToString {
    | @MyAnnotation
    A(SSSS)
    | @MyAnnotation
    // 存在同名但不同关联值的构造器
    A(Int64, Bool)
    | @MyAnnotation
    B((Unit, Unit))

    public operator func ==(another: ExhaustiveAssociatedNonRef): Bool {
        match ((this, another)) {
            case (A(s0), A(s1)) => s0 == s1
            case (A(v00, v01), A(v10, v11)) => v00 == v10 && v01 == v11
            case (B(v0), B(v1)) => v0[0] == v1[0] && v0[1] == v1[1]
            case _ => false
        }
    }
    public operator func !=(another: ExhaustiveAssociatedNonRef): Bool {
        !(this == another)
    }
    public func toString(): String {
        match (this) {
            case A(s) => "ExhaustiveAssociatedNonRef.A(${s})"
            case A(v0, v1) => "ExhaustiveAssociatedNonRef.A(${v0}, ${v1})"
            case B(v) => "ExhaustiveAssociatedNonRef.B((${v[0]}, ${v[1]}))"
            case _ => "?"
        }
    }
}
