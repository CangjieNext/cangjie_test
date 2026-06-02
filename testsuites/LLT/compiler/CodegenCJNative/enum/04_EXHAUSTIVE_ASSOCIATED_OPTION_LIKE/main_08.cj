// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

struct SSS<T> where T <: ToString {
    public var sss: T

    init(x: T) {
        sss = x
    }
}

enum OptionLike<M, N> where N <: ToString {
    None
    | Some(SSS<N>)
}

func foo<T>(t: T): OptionLike<Bool, T> where T <: ToString {
    return Some<Bool, T>(SSS<T>(t))
}

func goo<T>(t: T): SSS<T> where T <: ToString {
    return SSS(t)
}

main(): Int64 {
    foo(999)
    goo(100)
    return 0
}
