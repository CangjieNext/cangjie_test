class A{
    static var a:Int64 = 0
}

interface I {
    func test() {
        for (i in 0..10) {
            spawn {
                A.a++
            }
        }
        return 0
    }
}

class B<T> {
}

extend<T> B<T> <: I {
}

main() {
    return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
