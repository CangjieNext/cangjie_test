// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj

import define.*

@Annotation
public class LogWithLevel {
    public const init(level: Int64) {
        this.level = level
    }
    public let level: Int64
}

@GenerateAnnoMac
class A {
    let a: Int64 = 123
}

main() {}