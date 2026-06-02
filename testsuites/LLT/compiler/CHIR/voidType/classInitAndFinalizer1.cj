// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %dumpCHIRDebug
// EXEC: %cat default_CHIR/[0-9]*_ClosureConversion.chirtxt | compare %n.cj
// ASSERT: scan func @_CN7default1A6<init>Hv: (Class-_CN7default1AE&) -> Void
// ASSERT: scan func @_CN7default1A5~initHv: (Class-_CN7default1AE&) -> Void
// ASSERT: scan func @_CN7default1B6<init>Hv: (Struct-_CN7default1BE&) -> Void
// ASSERT: scan func @_CN7default1C6<init>Hv: (Class-_CN7default1CE&) -> Void
// ASSERT: scan func @_CN7default1D6<init>Hv: (Struct-_CN7default1DE&) -> Void

class A {
    public var a: Int64
    public init() {
        a = 1
    }
    ~init() {
        println("~init")
    }
}

struct B {
    public var b: Int64
    public init() {
        b = 2
    }
}

class C {}
struct D {}

main() {
    0
}