/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package org::enums

// 未穷尽，且所有构造器均无关联值
@MyAnnotation["hello"]
public enum ExhaustiveUnassociated0 <: Equatable<ExhaustiveUnassociated0> & ToString {
    | @MyAnnotation
    A
    | @MyAnnotation
    B

    public operator func ==(another: ExhaustiveUnassociated0): Bool {
        match ((this, another)) {
            case (A, A) => true
            case (B, B) => true
            case _ => false
        }
    }
    public operator func !=(another: ExhaustiveUnassociated0): Bool {
        !(this == another)
    }
    public func toString(): String {
        match (this) {
            case A => "ExhaustiveUnassociated0.A"
            case B => "ExhaustiveUnassociated0.B"
        }
    }
}
