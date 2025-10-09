/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class C1<T> {
    var c1_a: T
    public init(a: T) {
        c1_a = a
        var aa = 10
    }
}

class C2<T> {
    var c2_a: T
    public init(a: T) {
        c2_a = a
        var aa = 10
    }
}

class C3<T> {
    var c3_a: T
    public init(a: T) {
        c3_a = a
        var aa = 10
    }
}

class C4<T> {
    var c4_a: T
    public init(a: T) {
        c4_a = a
        var aa = 10
    }
}

struct S1<T> {
    var s1_a: T
    public init(a: T) {
        s1_a = a
        var aa = 10
    }
}

struct S2<T> {
    var s2_a: T
    public init(a: T) {
        s2_a = a
        var aa = 10
    }
}

struct S3<T> {
    var s3_a: T
    public init(a: T) {
        s3_a = a
        var aa = 10
    }
}

struct S4<T> {
    var s4_a: T
    public init(a: T) {
        s4_a = a
        var aa = 10
    }
}

main() {
    var ai8 = C1<S3<Int8>>(S3<Int8>(8))
    var ai16 = C1<S3<Int16>>(S3<Int16>(16))
    var ai32 = C1<S3<Int32>>(S3<Int32>(32))
    var bui8 = S1<UInt8>(8)
    var cf16 = C2<C3<Float16>>(C3<Float16>(16.16))
    var dBl = S2<S3<Bool>>(S3<Bool>(true))
    return 0
}
