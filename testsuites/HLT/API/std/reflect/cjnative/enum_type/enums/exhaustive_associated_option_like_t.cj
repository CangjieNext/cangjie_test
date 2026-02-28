/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package enums

import std.reflect.*

@MyAnnotation["hello"]
public enum ExhaustiveAssociatedOptionLikeT<T> <: Equatable<ExhaustiveAssociatedOptionLikeT<T>> & ToString where T <: Equatable<T> & ToString {
    | @MyAnnotation
    A
    | B(T)

    public operator func ==(another: ExhaustiveAssociatedOptionLikeT<T>): Bool {
        match ((this, another)) {
            case (A, A) => true
            case (B(t0), B(t1)) => t0 == t1
            case _ => false
        }
    }
    public operator func !=(another: ExhaustiveAssociatedOptionLikeT<T>): Bool {
        !(this == another)
    }
    public func toString(): String {
        match (this) {
            case A => "ExhaustiveAssociatedOptionLikeT<${TypeInfo.of<T>().qualifiedName}>.A"
            case B(t) => "ExhaustiveAssociatedOptionLikeT<${TypeInfo.of<T>()}>.B(${t})"
            case _ => "?"
        }
    }
}
