/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!

package test_stable_abi


public struct Rectangle {
    static let width = 10
    static let a1 = 20
    static public let a2 = 20
    @Deprecated["this value is deprecated", strict: false] static let a3 = 20
    @Deprecated["this value is deprecated", strict: false] static public let a4 = 20
    @Deprecated["this value is deprecated", strict: true] static public let a5 = 20

    public func getWidth(): Int64{
        return width
    }
}

public struct Rectangle1 {
    static let width = 10
    static public let a6 = 20

    public func getWidth(): Int64{
        return width
    }
}

public struct Rectangle2 {
    static let width = 10
    static const a7 = 20

    static const init() {
        let degree = 180
    }

    public const func getWidth(): Int64{
        return a7
    }
}

public struct Rectangle3 {
    static let width = 10
    @Deprecated["this value is deprecated", strict: false] static public let a8 = 20

    public func getWidth(): Int64{
        return width
    }
}

public struct Rectangle4 {
    static let width = 10
    @Deprecated["this value is deprecated", strict: false] static const a9 = 20

    static const init() {
        let degree = 180
    }

    public const func getWidth(): Int64{
        return a9
    }
}

public struct Rectangle5 {
    static let width = 10
    @Deprecated["this value is deprecated", strict: true] static const a9 = 20
    @Deprecated["this value is deprecated", strict: true] static const a10 = 202

    static const init() {
        let degree = 180
    }

    @Deprecated["this value is deprecated", strict: true]
    public const func getWidth(): Int64{
        return a9
    }
}

public func f(){
    var a = Rectangle.a2
    var b = Rectangle.a1
    var c = Rectangle2.a7
    var d = Rectangle.a3
    var e = Rectangle.a4
    var f = Rectangle4.a9
    if(a == 20 && b == 20 && c == 20 && d == 20 && e == 20 && f ==20){
        return 0
    }else{
        return 1
    }
}