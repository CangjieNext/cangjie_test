/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

@Annotation
public class A {
    let name: String
    public const init(name: String) {
        this.name = name
    }
}

public struct S {
    public var a: Int64 = 1
    public init() {
        a = 0
    }
    @A["init2"]
    public init(a1: Int64) {
        a = a1
    }
    @A["init3"]
    public init(a1: Int64, a2: Int64) {
        a = a1 + a2
    }
}
