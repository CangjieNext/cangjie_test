/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package packageA

public interface I0<T> {
    func func_I0_0() {
        println("func_I0_0")
    }

    func func_I0_1() {
        println("func_I0_1")
    }

    func func_I0_2() {
        println("func_I0_2")
    }

    func func_I0_3() {
        println("func_I0_3")
    }

    func func_I0_4() {
        println("func_I0_4")
    }

    func func_I0_5() {
        println("func_I0_5")
    }

    func func_I0_6() {
        println("func_I0_6")
    }

    func func_I0_7() {
        println("func_I0_7")
    }

    func func_I0_8() {
        println("func_I0_8")
    }

    func func_I0_9() {
        println("func_I0_9")
    }
}

main(): Unit {
    println("hello world")
}

public func globalFunc0(v: I0<Int64>) {
    v.func_I0_5()
}

public func globalFunc1<T>(v: I0<T>) {
    v.func_I0_5()
}
