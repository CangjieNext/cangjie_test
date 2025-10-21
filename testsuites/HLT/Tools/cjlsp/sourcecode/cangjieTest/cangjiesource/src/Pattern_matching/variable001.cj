/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Pattern_matching

let score3: Int64 = 90
let PASS = 60
let FULL = 100
let good = 70
var scoreResult3: String = match (score) {
    case PASS => "pass"
    case FULL => "Full"
    case good => "good" //warning
}
