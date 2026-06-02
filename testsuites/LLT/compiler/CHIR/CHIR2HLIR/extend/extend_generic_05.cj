// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0

// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct Rec<T> where T <: Add<T> {
    public var width: T
    public var length: T
    public var pa: T
    public init(side: T) {
        this(side, side)
        pa = width + length
    }
    public init(w: T, l: T) {
        this.width = w
        this.length = l
        this.pa = w
    }
}

interface Add<T> {
    operator func +(a: T): T
}

extend Int8 <: Add<Int8> {}

main() {
    let r: Rec<Int8> = Rec<Int8>(3)
    if (r.pa != 6) {
        return 1
    }
    0
}
