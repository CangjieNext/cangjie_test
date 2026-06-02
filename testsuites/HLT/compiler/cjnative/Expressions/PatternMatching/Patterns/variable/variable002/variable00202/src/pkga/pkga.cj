/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkga

var score: Int32 = 90
public var scoreResult: String = match (score) {
    case 60 => "pass"
    case 100 => "Full"
    case good => "score: ${good}, excellent "
}
