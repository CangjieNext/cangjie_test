package p1

public class A {
    public func core() {
        let a = Array<Int64>(10000) {i=>i}
        for (i in 0..a.size) {
            a[i] += i
        }
        for (i in 0..a.size) {
            a[i] += i
        }
        for (i in 0..a.size) {
            a[i] += i
        }
        for (i in 0..a.size) {
            a[i] -= i
        }
        println(a[3])
        a
    }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
