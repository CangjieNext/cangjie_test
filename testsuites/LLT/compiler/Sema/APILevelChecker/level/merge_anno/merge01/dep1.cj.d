// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package dep1

import ohos.labels.APILevel

@!APILevel[since: "21"]
public func foo(): Int64
@!APILevel[since: "22"]
public func foo(a: Array<Int64>): Int64
@!APILevel[since: "23"]
public func foo(a: Array<String>): Int64

@!APILevel[since: "24"]
class A {
    @!APILevel[since: "25"]
    init() {}
    @!APILevel[since: "26"]
    init(a: Int64) {}
    @!APILevel[since: "27"]
    init(a: String) {}
    @!APILevel[since: "28"]
    public func foo(): Int64
    @!APILevel[since: "29"]
    public func foo(@!APILevel[since: "30"]a: Array<Int64>): Int64
    @!APILevel[since: "31"]
    public func foo(@!APILevel[since: "32"]a: Array<String>): Int64

    @!APILevel[since: "33"]
    public var a = 0
    @!APILevel[since: "34"]
    public prop b: Int64
}

@!APILevel[since: "35"]
struct B {
    @!APILevel[since: "36"]
    init() {}
    @!APILevel[since: "37"]
    init(a: Int64) {}
    @!APILevel[since: "38"]
    init(a: String) {}
    @!APILevel[since: "39"]
    public func foo(): Int64
    @!APILevel[since: "20"]
    public func foo(@!APILevel[since: "21"]a: Array<Int64>): Int64
    @!APILevel[since: "22"]
    public func foo(@!APILevel[since: "23"]a: Array<String>): Int64

    @!APILevel[since: "24"]
    public var a = 0
    @!APILevel[since: "25"]
    public prop b: Int64
}

@!APILevel[since: "26"]
enum C {
    @!APILevel[since: "27"]A | @!APILevel[since: "28"]B(Int64)

    @!APILevel[since: "29"]
    public func foo(): Int64
    @!APILevel[since: "30"]
    public func foo(a: Array<Int64>): Int64
    @!APILevel[since: "31"]
    public func foo(a: Array<String>): Int64
}

interface D {
    @!APILevel[since: "32"]
    func foo(): Int64
    @!APILevel[since: "33"]
    func foo(@!APILevel[since: "34"]a: Array<Int64>): Int64
    @!APILevel[since: "35"]
    func foo(@!APILevel[since: "36"]a: Array<String>): Int64
}
