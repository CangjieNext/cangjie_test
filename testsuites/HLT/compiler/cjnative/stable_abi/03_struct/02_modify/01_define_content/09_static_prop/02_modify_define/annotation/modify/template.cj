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
    let width = 10
    static var a = 20

    public func getWidth(): Int64{
        return width
    }

    static mut prop geta: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
}

public struct S1{
    static var a = 20

    @Version["1.1"]
    public static prop getb1: Int64 {
        get() {
            a
        }
    }
    @Version["2.1"]
    static mut prop geta: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    @Frozen
    @Version["2.1"]
    public func getgeta(){
        return geta
    }

    @Version["3.1"]
    static prop getb2: Int64 {
        get() {
            a
        }
    }
}


public struct S2{
    static var a = 20

    public static prop getb1: Int64 {
        get() {
            a
        }
    }

    static mut prop geta: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    @Frozen
    public func getgeta(){
        return geta
    }

    static prop getb2: Int64 {
        get() {
            a
        }
    }
}

