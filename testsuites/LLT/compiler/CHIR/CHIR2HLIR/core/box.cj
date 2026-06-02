// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix %run_args
class A {}

struct B {}

main(): Int64 {
    var l: Box<Int64> = Box(1)
    var e: Box<Int64> = Box(1)
    var f: Box<Int64> = Box(2)
    var g1: Box<Int32> = Box(1)
    var g2: Box<Int16> = Box(1)
    var g3: Box<Int8> = Box(1)
    var g4: Box<UInt64> = Box(1)
    var g5: Box<UInt32> = Box(1)
    var g6: Box<UInt16> = Box(1)
    var g7: Box<UInt8> = Box(1)
    var g8: Box<Float64> = Box(1.0)
    var g9: Box<Float32> = Box(1.0)
    var g10: Box<Float16> = Box(1.0)
    var g11: Box<A> = Box(A())
    var g12: Box<B> = Box(B())
    var g13: Box<(A, B)> = Box((A(), B()))
    if (l != e) {
        return 1
    }
    if (l == f) {
        return 2
    }
    if (l > f) {
        return 3
    }
    if (l >= f) {
        return 4
    }
    if (f < l) {
        return 5
    }
    if (f <= l) {
        return 6
    }
    if (l.toString() != "1") {
        return 7
    }
    return 0
}
