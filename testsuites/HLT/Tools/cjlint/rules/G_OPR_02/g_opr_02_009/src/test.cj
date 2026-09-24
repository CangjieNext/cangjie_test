/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum E {
    Y | X | X(Int64)
    operator func ()(a: Int64): Int64 {
        return a
    }
}

main() {
    let e = E.Y
    println(e(1))
}
