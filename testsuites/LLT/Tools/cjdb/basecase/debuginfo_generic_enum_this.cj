// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


enum E1<T> {
    default
    func foo() {
        var a = 1
        match(this) {
            case default => a++
            case _ => a--
        }
        return 0
    }
}

enum E2<T> {
    default | EEE(T)
    func foo() {
        var a = 1
        match(this) {
            case default => a++
            case _ => a--
        }
        return 0
    }
}

main() {
    var a = E1<Int64>.default
    var b = a.foo()
    var c = E2<Int64>.EEE(111)
    var d = c.foo()
    0
}

