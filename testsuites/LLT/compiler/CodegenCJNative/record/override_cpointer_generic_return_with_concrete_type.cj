// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface I<T> where T <: CType {
    func get(): CPointer<T>
}

class C <: I<Float64> {
    public override func get(): CPointer<Float64> {
        return CPointer<Float64>()
    }
}

func makeI(): I<Float64> {
    return C()
}

func useAsIface(): CPointer<Float64> {
    return makeI().get()
}

main(): Int64 {
    useAsIface()
    return 0
}
