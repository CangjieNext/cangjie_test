/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func sum<Y>(a: Y, arr: Array<Int64>) {
    var total = 0
    for (x in arr) {
        total += x
    }
    return total
}

main() {
    var a1 = sum(1)
    var a2 = sum(1, 2, 3)
    var a3 = sum(1, [4, 5])
    0
}
