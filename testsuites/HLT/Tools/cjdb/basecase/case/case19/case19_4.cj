/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct S1{
    mut func name<T>(a:T) {
        func name2<T>(b:T) {
            b
        }
        func name() {
            return 0
        }
        return name2<Int64>(2)
    }
    mut func name() {
        func name2<T>(b:T) {
            b
        }
        func name() {
            return 0
        }
        return name2<Int64>(2)
    }
}

main() {
    var a = S1()
    a.name<Int64>(2)
    a.name()
    0
}
