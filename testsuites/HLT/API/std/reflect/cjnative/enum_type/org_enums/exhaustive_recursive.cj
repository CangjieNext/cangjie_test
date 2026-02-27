/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package org::enums

import std.reflect.*

public enum ExhaustiveRecursive0 <: Equatable<ExhaustiveRecursive0> & ToString {
    B(ExhaustiveRecursive1)

    public func toString(): String {
        match (this) {
            case B(x) => "ExhaustiveRecursive0.B(${x})"
        }
    }
    public operator func ==(another: ExhaustiveRecursive0): Bool {
        match ((this, another)) {
            case (B(x0), B(x1)) => x0 == x1
            case _ => false
        }
    }
    public operator func !=(another: ExhaustiveRecursive0): Bool {
        !(this == another)
    }
}

@MyAnnotation["hello"]
public enum ExhaustiveRecursive1 <: Equatable<ExhaustiveRecursive1> & ToString {
    @MyAnnotation["world"]
    C(ExhaustiveRecursive0)
    | D(Int32)

    public func toString(): String {
        match (this) {
            case C(x) => "ExhaustiveRecursive1.C(${x})"
            case D(v) => "ExhaustiveRecursive1.D(${v})"
        }
    }
    public operator func ==(another: ExhaustiveRecursive1): Bool {
        match ((this, another)) {
            case (C(x0), C(x1)) => x0 == x1
            case (D(v0), D(v1)) => v0 == v1
            case _ => false
        }
    }
    public operator func !=(another: ExhaustiveRecursive1): Bool {
        !(this == another)
    }
}

public enum Tree<T> {
    | Leaf(T)
    | NonLeaf(Tree<T>, T, Tree<T>)

    public func nodeCount(): Int64 {
        this.nodeCount_(this)
    }
    private func nodeCount_(tree: Tree<T>): Int64 {
        match (tree) {
            case Leaf(_) => 1
            case NonLeaf(l, _, r) => this.nodeCount_(l) + 1 + this.nodeCount_(r)
        }
    }
}
