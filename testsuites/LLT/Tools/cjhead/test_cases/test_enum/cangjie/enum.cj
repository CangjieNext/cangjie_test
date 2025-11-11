// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

/**
 * enum
 */
public enum RGBColor {
    | Red | Green | Blue(Uint8)

    /**
     * enum::printType
     */
    public static func printType() {
        print("RGBColor")
    }
}

public enum RGBColor2 {
    | Red
    | Green
    | Blue
    | Red(UInt8)
    | Green(UInt8)
    | Blue(UInt8)
}
