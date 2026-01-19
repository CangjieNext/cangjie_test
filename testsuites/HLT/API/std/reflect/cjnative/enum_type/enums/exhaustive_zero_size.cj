/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package enums

@MyAnnotation["hello"]
public enum ExhaustiveZeroSize0 <: Equatable<ExhaustiveZeroSize0> & ToString {
    | @MyAnnotation
    A

    public operator func ==(another: ExhaustiveZeroSize0): Bool {
        match ((this, another)) {
            case (A, A) => true
            case _ => false
        }
    }
    public operator func !=(another: ExhaustiveZeroSize0): Bool {
        !(this == another)
    }
    public func toString(): String {
        match (this) {
            case A => "ExhaustiveZeroSize0.A"
            case _ => "?"
        }
    }
}
