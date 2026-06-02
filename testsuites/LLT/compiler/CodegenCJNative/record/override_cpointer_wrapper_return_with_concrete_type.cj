// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct PointerWrapper<T> where T <: CType {
    var value: CPointer<T>

    public init(value: CPointer<T>) {
        this.value = value
    }
}

interface I<T> where T <: CType {
    func get(): PointerWrapper<T>
}

class C <: I<Float64> {
    public override func get(): PointerWrapper<Float64> {
        return PointerWrapper<Float64>(CPointer<Float64>())
    }
}

func makeI(): I<Float64> {
    return C()
}

func useAsIface(): PointerWrapper<Float64> {
    return makeI().get()
}

func forward(i: I<Float64>): PointerWrapper<Float64> {
    return i.get()
}

func useForwardedIface(): PointerWrapper<Float64> {
    return forward(makeI())
}

main(): Int64 {
    C().get()
    useAsIface()
    useForwardedIface()

    return 0
}
