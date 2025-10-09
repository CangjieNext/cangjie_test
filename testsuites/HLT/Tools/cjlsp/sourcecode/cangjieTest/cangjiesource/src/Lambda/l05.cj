/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Lambda

open class L09 {
    init(a: Int64, fn: (Int64) -> Int64) {
        fn(a)
    }
    init() {
        this(1, {i => i * i})
    }
}
