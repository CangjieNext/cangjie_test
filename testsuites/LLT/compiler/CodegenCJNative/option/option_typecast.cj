// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

class C<U1, U2> {}

interface III1<T0, T1, T2> {
    func test4(a: (T0, T1, T0)): T0
}

struct AAA<U0, U1> <: III1<Bool, Option<U0>, U1> {
    public func test4(a: (Bool, Option<U0>, Bool)): Bool {
        a[0]
    }
}

func set2() {
    var aaa = AAA<Unit, Bool>()
    if (aaa.test4((true, Option<Unit>.None, false)) != true) {
        return 1
    }
    return 0
}

main() {
    return set2()
}
