// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package dep1

import ohos.labels.APILevel

@!APILevel[21]
public func foo(): Int64
@!APILevel[22]
public func foo(a: Array<Int64>): Int64
@!APILevel[23]
public func foo(a: Array<String>): Int64

@!APILevel[24]
class A {
    @!APILevel[25]
    init() {}
    @!APILevel[26]
    init(a: Int64) {}
    @!APILevel[27]
    init(a: String) {}
    @!APILevel[28]
    public func foo(): Int64
    @!APILevel[29]
    public func foo(@!APILevel[30]a: Array<Int64>): Int64
    @!APILevel[31]
    public func foo(@!APILevel[32]a: Array<String>): Int64

    @!APILevel[33]
    public var a = 0
    @!APILevel[34]
    public prop b: Int64
}

@!APILevel[35]
struct B {
    @!APILevel[36]
    init() {}
    @!APILevel[37]
    init(a: Int64) {}
    @!APILevel[38]
    init(a: String) {}
    @!APILevel[39]
    public func foo(): Int64
    @!APILevel[20]
    public func foo(@!APILevel[21]a: Array<Int64>): Int64
    @!APILevel[22]
    public func foo(@!APILevel[23]a: Array<String>): Int64

    @!APILevel[24]
    public var a = 0
    @!APILevel[25]
    public prop b: Int64
}

@!APILevel[26]
enum C {
    @!APILevel[27]A | @!APILevel[28]B(Int64)

    @!APILevel[29]
    public func foo(): Int64
    @!APILevel[30]
    public func foo(a: Array<Int64>): Int64
    @!APILevel[31]
    public func foo(a: Array<String>): Int64
}

interface D {
    @!APILevel[32]
    func foo(): Int64
    @!APILevel[33]
    func foo(@!APILevel[34]a: Array<Int64>): Int64
    @!APILevel[35]
    func foo(@!APILevel[36]a: Array<String>): Int64
}
