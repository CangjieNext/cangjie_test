/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

var count: Int64 = 0

func incr(): Int64 {
    count += 1
    return count
}

func lookup(key: Int64): ?Int64 {
    if (key > 0) {
        return key
    }
    return None<Int64>
}

main(): Int64 {
    let v = lookup(0) ?? incr()
    println(v)
    return 0
}
