// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// RUN-6: %run %run_opt %output %run_args

interface I {
    static func foo(): Int64
    static func bar(): Int64 {
        foo()
    }
}

class C1 <: I {
    public static func foo(): Int64 {
        1
    }
}

class C2 <: I {
    public static func foo(): Int64 {
        2
    }
}

func f<T>() where T <: I {
    T.bar()
}

main() {
    C1.bar() + C2.bar() + f<C1>() + f<C2>()
}
