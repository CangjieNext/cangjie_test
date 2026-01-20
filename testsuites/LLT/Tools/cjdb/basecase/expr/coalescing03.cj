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

enum OptionNew<T> {
    Value(T) | Empty
}

main() {
    let c1 = Cla(0)
    let v1 = Option<Cla>.Some(c1)
    let s1 = Str(0)
    let v2 = Option<Str>.Some(s1)
    
    let t1 = TimeUnit1.Year
    let v3 = Option<TimeUnit1>.Some(t1)
    0    
}
