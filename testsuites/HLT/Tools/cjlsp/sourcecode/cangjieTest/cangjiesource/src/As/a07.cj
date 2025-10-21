/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.As
//模式匹配表达式
let score:Int64 = 90
var scoreResult = match(score) {
    case 0 => "zeor"
    case _ => "not"
} as Unit
