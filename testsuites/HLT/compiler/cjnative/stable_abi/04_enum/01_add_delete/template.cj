/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!

package test_stable_abi

public enum RGBColor {
    | Red | Green | Blue(UInt8)

    public static func printType() {
        print("RGBColor")
    }
}

enum Testb {
    | Red | Green | Blue(UInt8)

    public static func printType() {
        print("RGBColor")
    }
}

public enum Testc {
    | Red | Green | Blue(UInt8)
    
    public static func printType() {
        print("RGBColor")
    }
}


