/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main() {
    var sum = 0
    var hundred: Int64 = 0
    for (i in 1..=1) {
        for (j in [1,2,3]) {
            while (hundred < 2) {
                hundred++
            }
            sum += i
        }
    }
    println(sum)
}
