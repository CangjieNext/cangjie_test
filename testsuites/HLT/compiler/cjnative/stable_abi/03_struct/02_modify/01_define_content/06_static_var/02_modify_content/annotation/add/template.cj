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


public struct Rectangle {
    static let width = 10

    @Version["1.1"]
    static let a1 = 20

    @Version["1.2"]
    static public let a2 = 20

    public func getWidth(): Int64{
        return width
    }
}


public struct Rectangle1 {
    static let width = 10

    @Version["1.3"]
    static const a7 = 20

    static const init() {
        let degree = 180
    }

    public const func getWidth(): Int64{
        return a7
    }
}

public struct Rectangle2 {
    static let width = 10
    static public let a8 = 20
    static let a9 = 200
    public func getWidth(): Int64{
        return width
    }
}

public struct Rectangle3 {
    static let width = 10
    static const a9 = 20

    static const init() {
        let degree = 180
    }

    public const func getWidth(): Int64{
        return a9
    }
}

public func f(){
    var a = Rectangle2.a9
    var b = Rectangle3.a9
    if(a == 200 && b == 20){
        return 0
    }else{
        return 1
    }
}