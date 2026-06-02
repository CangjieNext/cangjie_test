// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC-0: %compiler %cmp_opt %n.cj -o %n.%suffix

@C
struct Data {}

enum TimeUnit<T1, T2> {
    | Year(T1)
    | Month(T1, T2)
    | Day(T1, T2, T2)
}

main() {
    var t1 = Year<Data, Int32>(Data())
    var t2 = TimeUnit<Data, Int32>.Year(Data())
    var t3 = Month(Data(), 0)
    var t4 = TimeUnit.Month(Data(), 0)
    0
}
