// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main() {
    let li = [1, 2, 3, 4, 5]
    let x = count(li)
    if (x != 5) {
        return 1
    }
    return 0
}

interface Iter<T> {
    func foreach(action: (T) -> Unit): Unit
}

extend<T> Array<T> <: Iter<T> {
    public func foreach(action: (T) -> Unit): Unit {
        for (v in this) {
            action(v)
        }
    }
}

func count<T>(iter: Iter<T>): Int64 {
    return fold<T, Int64>(0) {a, b => a + 1}(iter)
}

func fold<T, R>(initial: R, operation: (R, T) -> R): (Iter<T>) -> R {
    return {
        it =>
        let value = Box(initial)
        it.foreach {
            v => value.value = operation(value.value, v)
        }
        return value.value
    }
}
