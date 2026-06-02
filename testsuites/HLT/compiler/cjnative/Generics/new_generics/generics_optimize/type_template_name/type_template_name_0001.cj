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

class A<T> {
    var a = 0
}

func foo<T>() {
    var a = A<T>()
    var b = A<T>()
    var c = A<T>()
    var d = A<A<T>>()
    var e = A<A<T>>()
    var f = A<A<T>>()
    a.a + b.a + c.a + d.a + e.a + f.a
}

main() {
    foo<A<Bool>>()
}
