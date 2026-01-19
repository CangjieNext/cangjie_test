/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!
package test_stable_abi

public struct S {
    public var a = 1
    public let width = 10

    public S(b: Int64, let height: Int64) {
        a = b
    }

    public func getWidth(): Int64 {
        return width
    }
}

public struct S2 {
    public var a = 1

    public S2(b: Int64, let height: Int64) {
        a = b
    }
}

public struct S3 {
    public var a = 1
    
    @Deprecated["this function is deprecated", strict: true]
    public S3(b: Int64, let height: Int64) {
        a = b
    }
}

public struct S4 {
    public var a = 1
    
    @Deprecated["this function is deprecated", strict: false]
    public S4(b: Int64, let height: Int64) {
        a = b
    }
}

public struct S5 {
    public var a = 1
    
    @Frozen
    public S5(b: Int64, let height: Int64) {
        a = b
    }
}

public func f(){
    return 0
}