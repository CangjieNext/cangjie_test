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

public interface I1<T> {
    func func_I1_0() {
        println("func_I1_0")
    }

    func func_I1_1() {
        println("func_I1_1")
    }

    func func_I1_2() {
        println("func_I1_2")
    }

    func func_I1_3() {
        println("func_I1_3")
    }

    func func_I1_4() {
        println("func_I1_4")
    }

    func func_I1_5() {
        println("func_I1_5")
    }

    func func_I1_6() {
        println("func_I1_6")
    }

    func func_I1_7() {
        println("func_I1_7")
    }

    func func_I1_8() {
        println("func_I1_8")
    }

    func func_I1_9() {
        println("func_I1_9")
    }
}

public interface I2<T> {
    func func_I2_0() {
        println("func_I2_0")
    }

    func func_I2_1() {
        println("func_I2_1")
    }

    func func_I2_2() {
        println("func_I2_2")
    }

    func func_I2_3() {
        println("func_I2_3")
    }

    func func_I2_4() {
        println("func_I2_4")
    }

    func func_I2_5() {
        println("func_I2_5")
    }

    func func_I2_6() {
        println("func_I2_6")
    }

    func func_I2_7() {
        println("func_I2_7")
    }

    func func_I2_8() {
        println("func_I2_8")
    }

    func func_I2_9() {
        println("func_I2_9")
    }
}

public interface I3<T> {
    func func_I3_0() {
        println("func_I3_0")
    }

    func func_I3_1() {
        println("func_I3_1")
    }

    func func_I3_2() {
        println("func_I3_2")
    }

    func func_I3_3() {
        println("func_I3_3")
    }

    func func_I3_4() {
        println("func_I3_4")
    }

    func func_I3_5() {
        println("func_I3_5")
    }

    func func_I3_6() {
        println("func_I3_6")
    }

    func func_I3_7() {
        println("func_I3_7")
    }

    func func_I3_8() {
        println("func_I3_8")
    }

    func func_I3_9() {
        println("func_I3_9")
    }
}

public interface I4<T> {
    func func_I4_0() {
        println("func_I4_0")
    }

    func func_I4_1() {
        println("func_I4_1")
    }

    func func_I4_2() {
        println("func_I4_2")
    }

    func func_I4_3() {
        println("func_I4_3")
    }

    func func_I4_4() {
        println("func_I4_4")
    }

    func func_I4_5() {
        println("func_I4_5")
    }

    func func_I4_6() {
        println("func_I4_6")
    }

    func func_I4_7() {
        println("func_I4_7")
    }

    func func_I4_8() {
        println("func_I4_8")
    }

    func func_I4_9() {
        println("func_I4_9")
    }
}

main(): Unit {
    println("hello world")
}

public func globalFunc0(v: I0<I1<I2<I3<I4<Int64>>>>>) {
    v.func_I0_5()
}

public func globalFunc1<T>(v: I0<I1<I2<I3<I4<T>>>>>) {
    v.func_I0_5()
}
