// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

class C<U1, U2> {}

enum EA<UUU> {
    | Some(UUU) | None
}

interface III1<T0, T1, T2> {
    func test1(a: T2): T2

    func test2(a: T2, b: T2): T2 {
        b
    }

    func test3(a: T2): T2 {
        a
    }

    func test4(a: (T0, T1, T0)): T0

    func test5(a: (T0, T1, T0)): T0 {
        a[2]
    }

    func test6(a: (T0, T1, T0)): T0 {
        a[2]
    }

    func test7(x: C<T1, T2>, y: T1, z: T2): T2

    func test8(x: C<T1, T2>, y: T1, z: T2, z2: T2): T2 {
        z2
    }

    func test9(x: C<T1, T2>, y: T1, z: T2): T2 {
        z
    }
}

struct AAA<U0, U1> <: III1<Bool, EA<U0>, U1> {
    public func test1(a: U1): U1 {
        a
    }

    public func test2(a: U1, b: U1): U1 {
        a
    }

    public func test4(a: (Bool, EA<U0>, Bool)): Bool {
        a[0]
    }

    public func test5(a: (Bool, EA<U0>, Bool)): Bool {
        a[0]
    }

    public func test7(x: C<EA<U0>, U1>, y: EA<U0>, z: U1): U1 {
        z
    }

    public func test8(x: C<EA<U0>, U1>, y: EA<U0>, z: U1, z2: U1): U1 {
        z
    }
}

func set1() {
    var aaa = AAA<Unit, Int64>()
    if (aaa.test1(9) != 9) {
        return 1
    }
    if (aaa.test2(9, 10) != 9) {
        return 1
    }
    if (aaa.test3(9) != 9) {
        return 1
    }
    return 0
}

func set2() {
    var aaa = AAA<Unit, Bool>()
    if (aaa.test4((true, EA<Unit>.None, false)) != true) {
        return 1
    }
    if (aaa.test5((true, EA<Unit>.None, false)) != true) {
        return 1
    }
    if (aaa.test6((true, EA<Unit>.None, false)) != false) {
        return 1
    }
    return 0
}

func set3() {
    var aaa = AAA<Unit, Bool>()
    if (aaa.test7(C<EA<Unit>, Bool>(), EA<Unit>.None, true) != true) {
        return 1
    }
    if (aaa.test8(C<EA<Unit>, Bool>(), EA<Unit>.None, true, false) != true) {
        return 1
    }
    if (aaa.test9(C<EA<Unit>, Bool>(), EA<Unit>.None, true) != true) {
        return 1
    }
    return 0
}

main() {
    return set1() + set2() + set3()
}
