/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func adjust(x: Int64): Int64 {
    for (i in 0..1) {
        let x = i
        if (x > 0) {
            return x
        }
    }
    return 0
}

main() {
    println(adjust(5))
}
