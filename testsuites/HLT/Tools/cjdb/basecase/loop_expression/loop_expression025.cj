/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main() {
    let metaArray = [r'a', r'b', r'c', r'd', r'e', r'f']
    let noumenonArray = [r'1', r'2', r'3', r'4', r'5', r'6']
    let year = 2025
    let metaOfYear = ((year % 10) + 10 - 4) % 10
    var index = (2 * metaOfYear + 3) % 10 - 1
    for (noumenon in noumenonArray) {
        print("${metaArray[index]}${noumenon} ")
        var hundredo = 0
        do {
            hundredo++
        } while (hundredo < 2)
    }
    0
}
