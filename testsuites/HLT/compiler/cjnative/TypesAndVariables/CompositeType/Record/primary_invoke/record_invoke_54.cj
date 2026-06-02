/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Foo {
    public var dt: Int32 = 2
}

struct Data<T> {
    public let classFoo: T
    public Data(x: T) {
        classFoo = x
    }
}

func run(): Int64 {
    let foo: Foo = Foo()
    let data: Data<Foo> = Data<Foo>(foo)
    var classFoo: Foo = data.classFoo
    var res: Int32 = classFoo.dt
    if (res == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
