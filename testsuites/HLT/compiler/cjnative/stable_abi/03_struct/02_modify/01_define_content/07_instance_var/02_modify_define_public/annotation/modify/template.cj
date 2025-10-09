/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!

package test_stable_abi

@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

public struct S1 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}


public struct Rectangle {
    let width = 10
    public let a1 = 20

    @Version["1.1"]
    let a2 = 20

    @Version["1.2"]
    public let a3 = 20

    private let a4 = 20
    internal let a5 = 20
    let a6 = 20
    protected let a7 = 20
    public let a8 = 20
    let a9 = 20
    let a10 = 20

    public func getWidth(): Int64{
        return width
    }
}

public struct S2{
    var a1 = 20
    public let a2 = 0
    var a3 = 20
    public let a4 = 0

    @Frozen
    public func geta3() {
        return a3
    }

    @Frozen
    public func geta4() {
        return a4
    }
}

