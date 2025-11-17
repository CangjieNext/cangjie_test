/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func main1<T>() {
    var if001: Bool = true
    var if_a: Int64
    if (if001) {
        var vcarrc2: Array<Int64> = [2]
        if_a = 1
    } else {
        var var1: Int8 = -128
        if_a = 2
    }
    return if_a
}

main(): Int64 {
    main1<Int64>()
    return 0
}
