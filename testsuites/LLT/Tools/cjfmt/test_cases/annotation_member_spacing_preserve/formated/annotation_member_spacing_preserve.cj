// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public struct Spacing {
    static let first = 1
    @Deprecated["old", strict: true]
    static const adjacent = 2

    @Deprecated["old", strict: true]
    static const separated = 3
    @Deprecated["multiline", strict: true]
    static const multiline = 4
    public static let modifier = 5

    static let ordinary = 6
    // Keep this comment before the annotation.
    @Deprecated["old", strict: true]
    static const commented = 7
}
