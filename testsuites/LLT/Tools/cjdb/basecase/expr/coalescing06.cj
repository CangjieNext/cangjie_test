// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class Cla {
    var a = 1
    init(b:Int64) {
        a = b
    }
}

struct Str {
    var a = 1
    init(b:Int64) {
        a = b
    }
}

enum TimeUnit1 {
    Year | Month | Day| Hour
}

enum TimeUnit2 {
    Year(Int64) | Month(Int32) | Day
}

main() {
    let c1 = Option<Cla>.Some(Cla(0))
    let v1 = Option<Option<Cla>>.Some(c1)

    let s1 = Option<Str>.Some(Str(0))
    let v2 = Option<Option<Str>>.Some(s1)

    let t1 = Option<TimeUnit1>.Some(TimeUnit1.Year)
    let v3 = Option<Option<TimeUnit1>>.Some(t1)

    let t2 = Option<TimeUnit2>.Some(TimeUnit2.Year(12))
    let v4 = Option<Option<TimeUnit2>>.Some(t2)
    0    
}
