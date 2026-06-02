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

class Aoo<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
}

class Boo<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
}

class Coo<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
}

class Doo<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
}

main() {
    var a1 = Aoo<(Int32)>(1)
    if (a1.a != 1) {
        return 1
    }
    var a2 = Boo<(Rune)>(r'a')
    if (a2.a != r'a') {
        return 2
    }
    var a3 = Coo<(Bool)>(false)
    if (a3.a) {
        return 3
    }
    var a4 = Doo<(Unit)>(())
    if (a4.a != ()) {
        return 4
    }
    return 0
}
