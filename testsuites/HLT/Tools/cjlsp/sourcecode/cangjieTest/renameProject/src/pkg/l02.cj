/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

open class AC {
    init(a: Int64, fn: (Int64) -> Int64) {
        fn(a)
    }
    init(a: Int32) {}
    init() {}
}
open class BA <: AC {
    init(a: Int64, fn: (Int64) -> Int64) {
        fn(a)
    }
    init() {
        super(1, {i => i * i})
    }
    init(a: Int32) {
        this(1, {i => i * i})
    }
}
let c = AC(1) {i => i * i}
let d = BA(1) {i => i * i}
let a_ = 1
