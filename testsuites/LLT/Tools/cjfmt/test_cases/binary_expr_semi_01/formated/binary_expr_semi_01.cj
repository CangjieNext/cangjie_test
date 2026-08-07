// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class Missing <: Exception {
    public init() {
        super("missing")
    }
}

func withTrailingSemicolons(first: ?Int64, second: ?Int64): Unit {
    let ordinary = first ?? 0;
    let addition = 1 + 2;
    let earlyReturn = first ?? return;
    let nestedReturn = first ?? second ?? return;
    let earlyThrow = first ?? throw Missing();
}

func withoutTrailingSemicolon(first: ?Int64): Unit {
    let value = first ?? return
}

func standaloneReturn(): Unit {
    return;
}
