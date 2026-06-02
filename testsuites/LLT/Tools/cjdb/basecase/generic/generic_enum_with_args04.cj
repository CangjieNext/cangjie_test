// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test2.pkga

enum TimeUnit<T> {
    Year(T)
    | Month(T, T)
    | TwoUnit(TimeUnit<T>, TimeUnit<T>)
}

main(): Int64 {
    var time = TimeUnit<Int32>.TwoUnit(TimeUnit<Int32>.Year(2020), TimeUnit<Int32>.Month(9, 19)) //expr TimeUnit<Int32>.TwoUnit(TimeUnit<Int32>.Year(2020), TimeUnit<Int32>.Month(9, 19))
    return 0
}
