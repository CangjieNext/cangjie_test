// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

sealed interface Injectable {}

sealed interface BeingInjected<T> where T <: BeingInjected<T> {
    mut prop status: String
    prop name: String
}

public interface Makable<T> {
    static func make(): T
}

public class Poison <: Makable<Poison> {
    private init() {
        println('Poison is made.')
    }
    public static func make(): Poison {
        Poison()
    }
}

extend Poison <: Injectable {
    public func into<T>(thing: T): Unit where T <: BeingInjected<T> {
        var t = thing
        t.status = 'Nocuous' // 这里的t是T&类型，需要先Load，再TypeCast到BeingInjected<T>类型
        println('Poison was injected into ${thing.name}.')
        println('${thing.name} is ${thing.status}.')
    }
}

main() {
    0
}
