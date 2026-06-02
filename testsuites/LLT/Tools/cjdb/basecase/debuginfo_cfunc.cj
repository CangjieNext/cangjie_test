// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

type I8 = Int8

class C3<T> {
    var c3_a: T
    public init(a: T) {
        c3_a = a
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

struct S4 {
    var s3_a: CFunc<() -> Unit>
    public init(a: CFunc<() -> Unit>) {
        s3_a = a
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

main() {
    var f0 = CPointer<I8>()
    var f1 = C3(CFunc<() -> Unit>(f0))
    var f2 = C4(f1)
    var f3 = S3(CFunc<() -> Unit>(f0))
    var d = CFunc<() -> Unit>(f0)
    var f5 = S4(CFunc<() -> Unit>(f0))
    var f4 = C4(f3)
    return 0
}
