/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main() {
    let a = Some(3)
    let c = if (let Some(b) <- a) {
            1
        } else {
            2
        }
    let d = Some(1)

    while (let Some(e) <- a && let Some(f) <- d) {
        println("${e} ${f}")
    }

    while (let Some(_) <- a || let Some(_) <- d) {
        println("at least one of a and d is Some")
    }

    let g = 3
    while (let Some(_) <- a || g > 1) {
        println("this")
    }
}
