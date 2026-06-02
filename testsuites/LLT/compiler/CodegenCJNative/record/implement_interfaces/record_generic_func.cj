// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

interface I {
    func f(): String
}

struct A {}

extend A <: I {
    public func f(): String {
        "A"
    }
}

class B {}

extend B <: I {
    public func f(): String {
        "B"
    }
}

func f<T>(a: T) where T <: I {
    let b: I = a
    b.f()
}

main(): Int64 {
    if (f<A>(A()) == "A" && f<B>(B()) == "B") {
        return 0
    }

    return 1
}
