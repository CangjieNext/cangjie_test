// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not CJNATIVE) EXEC: %compiler %cmp_opt --verbose %f | compare %f
// (not CJNATIVE) ASSERT: scan '+GenAOTReflectionInfo'

internal import std.reflect.*
internal import std.collection.*

public class C1<T> {}

main(): Unit {
    TypeInfo.of<C1<String>>() |> println
}
