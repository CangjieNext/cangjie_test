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

class Aoo<T, V> where T <: A<V> {
    public var a: T
    public init(x: T) {
        a = x
    }
}

class A<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
}

main() {
    var a = Aoo<A<String>, String>(A<String>("a"))
    if (a.a.a != "a") {
        return 1
    }
    return 0
}
