// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum Time<T> {
    Day(T)
}

main(): Int64 {
    var time = Time<Int32>.Day(2)
    var tup: (Int32, Time<Int32>) = (1, time)
    var getTime: Time<Int32> = tup[1]
    0
}
