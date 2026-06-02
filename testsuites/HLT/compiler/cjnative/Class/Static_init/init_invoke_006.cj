/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output

// RUN-EXEC-1: %run %run_opt %output %run_args

var top: Int64 = 0

struct rec<T> {
    static var a: Int64 = 0
    static init() {
        top++
    }
}

class A {}

enum en {
    E
}

main(): Int64 {
    var exam1 = rec<Int64>.a
    var exam2 = rec<String>.a
    var exam3 = rec<Bool>.a
    var exam4 = rec<A>.a
    var exam5 = rec<Rune>.a
    var exam6 = rec<Float16>.a
    var exam7 = rec<Array<Int16>>.a
    var exam8 = rec<UInt32>.a
    var exam9 = rec<en>.a
    var exam10 = rec<Unit>.a
    var exam11 = rec<(Int8, UInt8)>.a

    if (top == 11) {
        return 0
    }
    return top
}
