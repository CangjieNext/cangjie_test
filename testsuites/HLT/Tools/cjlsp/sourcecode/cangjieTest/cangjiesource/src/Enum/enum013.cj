/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Enum

enum Color {
    | Red
    | Green
    | Blue
    | Red(Int8)
    | Green(Int8)
    | Blue(Int8)
}

var a1 = Color.Blue(1)
var a2 = Color.Blue
