/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
enum TimeUnit4<T> {
    Year((T) -> T)
}

enum TimeUnit5<T> {
    Year((T, T))
}

main(): Int64 {
    var time4 = TimeUnit4<Int32>.Year({x: Int32 => 1})
    var time5 = TimeUnit5<Int64>.Year((1, 2))
    return 0
}
