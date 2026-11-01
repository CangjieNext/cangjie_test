// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkga

// 不直接 import std.reflect 或 middle，反射裁剪抑制通过链接时的 libmiddle.bc 传递依赖触发
// libmiddle.bc 作为链接输入，其 std.reflect 依赖会被编译器检测到 → 抑制 --cj-disable-lto-reflection
public func reflectName(): String {
    return "pkga-reflect"
}

public func reflectBoth(): Bool {
    return !reflectName().isEmpty()
}
