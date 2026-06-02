// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface I<T> {
    func get(): T
}

class IntImpl <: I<Int64> {
    public override func get(): Int64 {
        return 41
    }
}

class BoolImpl <: I<Bool> {
    public override func get(): Bool {
        return true
    }
}

class FloatImpl <: I<Float64> {
    public override func get(): Float64 {
        return 1.25
    }
}

func useIntAsIface(): Int64 {
    let i: I<Int64> = IntImpl()
    return i.get()
}

func useBoolAsIface(): Bool {
    let i: I<Bool> = BoolImpl()
    return i.get()
}

func useFloatAsIface(): Float64 {
    let i: I<Float64> = FloatImpl()
    return i.get()
}

func forwardInt(i: I<Int64>): Int64 {
    return i.get()
}

func forwardBool(i: I<Bool>): Bool {
    return i.get()
}

func forwardFloat(i: I<Float64>): Float64 {
    return i.get()
}

main(): Int64 {
    if (IntImpl().get() != 41 || !useBoolAsIface() || useFloatAsIface() != 1.25) {
        return 1
    }
    if (useIntAsIface() != 41 || !forwardBool(BoolImpl()) || forwardFloat(FloatImpl()) != 1.25) {
        return 2
    }
    if (forwardInt(IntImpl()) != 41) {
        return 3
    }
    return 0
}
