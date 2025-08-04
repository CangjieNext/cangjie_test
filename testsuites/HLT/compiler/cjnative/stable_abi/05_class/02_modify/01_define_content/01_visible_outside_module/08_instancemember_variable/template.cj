/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: instancemember variable
@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

public class CC {
    public let a1 = 1
    public var a2 = 2

    internal let b1 = 1
    internal var b2 = 2

    protected let c1 = 1
    protected var c2 = 2

    private let d1 = 1
    private var d2 = 2

    let e1 = 1
    var e2 = 2

    @Version["1.1"]
    public let f1 = 1
    @Version["1.1"]
    public var f2 = 2

    @Deprecated["This variable will be deprecated soon"]
    public let g1 = 1
    @Deprecated["This variable is deprecated", strict: true]
    public let g2 = 2

    let h1 = 1

    @Frozen
    public func h2() {
        h1
    }

    let x1 = 1
    private var x2 = 2
}
