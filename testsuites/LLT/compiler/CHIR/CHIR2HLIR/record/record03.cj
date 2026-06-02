// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct rA {
    public var a: Int64 = 2
    public var b: Int64 = 3
    public var c: Int64 = 10
    public func get_sum() {
        return a + b + c
    }
}

struct Test {
    public var height: Int64 = 10
    public var weight: Int64 = 0
    public let sA = rA();
    public Test(
        x: Int64,
        y: Int64,
        public let top!: Int64, // member variable parameter
        public let bottom!: Int64 = 50,
        public let left!: Int64 = 10, // member variable parameter
        public let right!: Int64 = 40 // member variable parameter
    ) {
        this.height = x
        this.weight = y
    }
    public init(h: Int64, w: Int64, t: Int64, b: Int64, l: Int64, r: Int64, x: Int64) {
        this.height = h
        this.weight = w
        this.top = t
        this.bottom = b
        this.left = l
        this.right = r
    }
    public func f1() {
        return height + weight
    }
    public func f2() {
        return top + bottom + left + right;
    }
    public func f3() {
        return height + weight + top + bottom
    }
    public func f4() {
        return sA.get_sum() + sA.a + sA.b
    }
}

main(): Int64 {
    var ret: Int64 = 0;
    var RecordA = Test(200, 300, top: 400);
    return RecordA.f4() - 20
}
