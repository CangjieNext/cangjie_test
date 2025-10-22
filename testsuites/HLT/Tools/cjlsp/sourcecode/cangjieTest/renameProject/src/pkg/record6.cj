/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

//参数类型为lambdaaaa啊
struct RR6 {
    RR6(a: Int32, b: Int32, fn: (Int32, Int32) -> Int32) {
        fn(a, b)
    }
    init(a: Int64, fn: (Int64, Int64) -> Int64) {}
}

let tt3: RR6 = RR6(1, 3) {i, j => i * i}
let tt4 = RR6(2, 4, {i, j => i * j})
