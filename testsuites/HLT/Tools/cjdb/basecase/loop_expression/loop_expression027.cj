/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main() {
    let a = Some(3)
    let c = while (let Some(b) <- a) {
        for (i in [1,2]) {
            var hundredo = 0
            do {
                hundredo++
            } while (hundredo < 2)
        }
        1
    }
    0
}
