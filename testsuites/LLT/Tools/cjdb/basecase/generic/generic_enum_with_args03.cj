// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum TimeUnit1<T> {
    One(TimeUnit2<T>)
}

enum TimeUnit2<T> {
    Two
}

main(): Int64 {
    var time = TimeUnit1<Int32>.One(TimeUnit2.Two) //expr TimeUnit1<Int32>.One(TimeUnit2.Two)
    0
}
