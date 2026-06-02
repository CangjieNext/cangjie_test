/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 

let u1 = {=>}

func u2(): Unit {}

main() {
    var sample1 = f()
    var sample2 = b()
    var hashcode1 = u1().hashCode()
    var hashcode2 = u2().hashCode()
    var hashcode3 = sample1.f1().hashCode()
    var hashcode4 = sample1.f2().hashCode()
    var hashcode5 = sample2.a1().hashCode()
    var hashcode6 = sample2.a3().hashCode()
    var hashcode7 = sample2.a4().hashCode()

    if (hashcode1 == 0 && hashcode2 == 0 && hashcode3 == 0 && hashcode4 == 0 && hashcode5 == 0 && hashcode6 == 0 &&
        hashcode7 == 0) {
        return 0
    } else {
        return 1
    }
}

open class a {
    public func a1(): Unit {}

    private func a2(): Unit {}

    protected func a3(): Unit {}

    public func a4(): Unit {
        func aa1(): Unit {}

        return aa1()
    }
}

class b <: a {}

interface I1 {
    func f1(): Unit
}

interface I2 {
    func f2(): Unit
}

class f {}

extend f <: I1 & I2 {
    public func f1(): Unit {}
    public func f2(): Unit {}
}
