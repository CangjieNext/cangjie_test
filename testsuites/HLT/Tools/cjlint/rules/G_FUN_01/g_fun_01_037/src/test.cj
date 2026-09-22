/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Weight {
    let g: Int64
    init(a1: Int64, a2: Int64, a3: Int64, a4: Int64, a5: Int64, a6: Int64) {
        g = a1 + a2 + a3 + a4 + a5 + a6
    }
}

main() {
    let w = Weight(1, 2, 3, 4, 5, 6)
    println(w.g)
}
