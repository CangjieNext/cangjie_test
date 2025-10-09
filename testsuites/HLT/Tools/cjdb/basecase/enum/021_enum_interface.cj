/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum TimeUnit2<T> {
    | Year(Int8)
    | Month(T, Int64)
}

interface I1 {
    func name() {
        return 1
    }
}

class C1 <: I1 {
    public func name() {
        return 2
    }
}

main() {
    var t1 = TimeUnit2<I1>.Month(C1(), 1)
    var t2 = TimeUnit2<I1>.Year(5)
    0
}
