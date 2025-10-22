/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.diff


struct Point {
    let a: Float64 = 1.0
    let b: Float64 = 2.0
    let negate: String = "abc"
}


struct Tensor1 {
    let data: Float32
    let size: Int32
    init(data: Float32, size: Int32) {
        this.data = data
        this.size = size
    }
}
