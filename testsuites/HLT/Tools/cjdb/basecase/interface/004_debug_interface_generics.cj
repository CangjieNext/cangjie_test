/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface I1<T> {
    func foo1(): Int64 {
        return 1
    }
}

interface I2<U> <: I1<U> {
    func foo1(): Int64 {
        return 2
    }
}


class A<U> <: I2<U> {}


main() {
    let call_ca1 = A<Int64>().foo1()

    return 0
}



