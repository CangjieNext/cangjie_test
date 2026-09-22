/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

var count: Int64 = 0

func add(x: Int64): Int64 {
    count += x
    return count
}

main(): Int64 {
    let isOk = true
    if (isOk || (add(5) != 0)) {
        return 0
    }
    return 1
}
