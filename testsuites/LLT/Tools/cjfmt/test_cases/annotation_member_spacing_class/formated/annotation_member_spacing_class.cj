// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public class Rectangle5 {
    static let width = 10
    @Deprecated["this value is deprecated", strict: true]
    static const a9 = 20
    @Deprecated["this value is deprecated", strict: true]
    static const a10 = 202

    static const init() {
        let degree = 180
    }

    @Deprecated["this value is deprecated", strict: true]
    public const func getWidth(): Int64 {
        return a9
    }
}
