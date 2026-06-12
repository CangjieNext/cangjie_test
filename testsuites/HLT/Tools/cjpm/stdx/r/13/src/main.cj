// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

internal import p2.*
import stdx.string_intern.*

main(): Unit {
    // 配置字符串缓存池
    String.configInternPool(capacity: 10000, strMaxLength: 1000)
    println("hello world")
}