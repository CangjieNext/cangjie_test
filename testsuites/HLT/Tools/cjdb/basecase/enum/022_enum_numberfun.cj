/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum TimeUnit2<T> {
    | Year(T)
    | Month

    func name(): Int64 {
        var x1 = TimeUnit2<Int64>.Month
        var x2 = TimeUnit2<Int64>.Year(1)
        6
    }
}

main() {
    var x1 = TimeUnit2<Int64>.Month.name()
    0
}
