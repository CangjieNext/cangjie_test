/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2 
// EXEC: %compiler %overflow_wrapping %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output

import std.collection.ArrayList
import std.collection.HashMap

public interface TreeNode<ID, T> where ID <: Hashable & Equatable<ID>, T <: TreeNode<ID, T> {
    prop children: ArrayList<T>
    func addChild(child: T): Unit {
        children.add(child)
    }

    func addChildren(children: Collection<T>) {
        this.children.add(all: children)
    }
    prop id: ID
    prop parentId: ID
    prop new: T
}

public func transferTree<ID, S, T>(collection: Collection<S>, emptyId: ID,
    transferFn!: (S) -> Option<T> = {
        s => if (s is T) {
            s as T
        } else {
            None<T>
        }
    }): Unit where ID <: Hashable & Equatable<ID>, T <: TreeNode<ID, T> {
    var map = HashMap<ID, T>()
    var list = ArrayList<T>()
    for (s in collection) {
        if (let Some(t) <- transferFn(s)) {
            map.addIfAbsent(t.id, t)
            list.add(t)
        }
    }
    for (t in list) {
        map[t.parentId].addChild(t)
    }
}

main() {
}
