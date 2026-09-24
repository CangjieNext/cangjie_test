/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// 本文件没有任何 import 语句：println 等来自 std.core 的隐式导入，
// 不产生 import 声明，不应触发 G.SYN.01 的 Import 禁用（开发指南"包的导入"章节）

func hello(): Unit {
    println("implicit core import")
}
