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

class cls<T> {
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
    var exam1 = cls<Int64>.a
    var exam2 = cls<String>.a
    var exam3 = cls<Bool>.a
    var exam4 = cls<A>.a
    var exam5 = cls<Rune>.a
    var exam6 = cls<Float16>.a
    var exam7 = cls<Array<Int16>>.a
    var exam8 = cls<UInt32>.a
    var exam9 = cls<en>.a
    var exam10 = cls<Unit>.a
    var exam11 = cls<(Int8, UInt8)>.a

    if (top == 11) {
        return 0
    }
    return top
}
