/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func sum(arr: Array<Float16>) {
    var total : Float16 = 0.0
    for (x in arr) {
        total += x
    }
    return 1
}
main() {
    println(sum(1.1, 1.1, 1.1))
}

