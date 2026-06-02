// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

public enum MyOption<T> {
    | Some(T)
    | None

    public func getOr(defaultValue: T): T {
        match (this) {
            case Some(value) => value
            case None => defaultValue
        }
    }
}

interface I<T> {
    func get(): MyOption<T>
}

class OptionImpl <: I<Int64> {
    public override func get(): MyOption<Int64> {
        return MyOption<Int64>.Some(7)
    }
}

func useAsIface(): MyOption<Int64> {
    let i: I<Int64> = OptionImpl()
    return i.get()
}

func forward(i: I<Int64>): MyOption<Int64> {
    return i.get()
}

main(): Int64 {
    let direct = OptionImpl().get()
    let iface = useAsIface()
    let forwarded = forward(OptionImpl())
    if (direct.getOr(-1) != 7 || iface.getOr(-1) != 7 || forwarded.getOr(-1) != 7) {
        return 1
    }
    return 0
}
