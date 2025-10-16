/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Pattern_matching

enum TimeUnit {
    | Year(UInt64)
    | Month(UInt64)
}

func test11() {
    let x = Year(2)
    let s = match (x) {
        case Year(n) => "x has ${12*n} moths"
        case Month(nnm) => " x has ${nnm} months"
    }
}
