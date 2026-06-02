// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %f -o %output
// EXEC: %run %run_opt %output %run_args

struct X {
    var a = 0
    var b = 1
}

func returnX(): X {
    return X()
}

type Y = CPointer<Unit>

func returnY(): Y {
    return Y()
}

interface I {
    func read(a: X): Unit
    func read2(a: Y): Unit
}

class A <: I {
    public func read(a: X): Unit {}
    public func read2(a: Y): Unit {}
}

class B {
    var a: I = A()

    func read() {
        var x: X = X()
        this.a.read(x)
        this.a.read(X())
        this.a.read(returnX())
    }

    func read2() {
        var y: Y = Y()
        this.a.read2(y)
        this.a.read2(Y())
        this.a.read2(returnY())
    }
}

func m(a: CPointer<UInt8>, b: CPointer<UInt8>): CPointer<UInt8> {
    return a
}

main() {
    var a = m
    a(CPointer<UInt8>(), CPointer<UInt8>())
    return 0
}
