/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package std.error_test_util

import std.sync.AtomicUInt64

private var cnt = AtomicUInt64(0)
private let threadAmount = 4u64

public func infiniteRecursion(y: Int64): Int64 {
    var x: Option<Future<Int64>> = Option.None
    let cntOld = cnt.load()

    if (cnt.compareAndSwap(cntOld, cntOld + 1)) {
        if (cntOld < threadAmount && cnt.load() == cntOld) {
            x = spawn {infiniteRecursion(y)}
        }
    }

    let c = infiniteRecursion(3)

    match (x) {
        case Some(x1) => x1.get() + c
        case _ => c
    }
}
