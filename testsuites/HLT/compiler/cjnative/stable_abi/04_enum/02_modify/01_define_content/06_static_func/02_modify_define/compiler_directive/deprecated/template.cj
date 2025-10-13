/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan Compatible!

package test_stable_abi

public enum Rectangle {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64 {
        return 11
    }
    static const func geta1() {
        return 0
    }

    public static func geta2() {
        return 1
    }

    @Deprecated["this function is deprecated", strict: false]
    static func geta3() {
        return 2
    }

    @Deprecated["this function is deprecated", strict: false]
    public static func geta4() {
        return 3
    }

    @Deprecated["this function is deprecated", strict: true]
    public static func geta5() {
        return 4
    }

    public static func geta6() {
        const a = geta1()
        return a
    }

    @Deprecated["this function is deprecated", strict: false]
    static const func geta7() {
        return 5
    }

    public func geta8() {
        const b = geta7()
        return b
    }
}
