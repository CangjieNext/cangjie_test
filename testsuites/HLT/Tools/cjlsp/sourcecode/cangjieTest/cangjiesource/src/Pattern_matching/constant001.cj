/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Pattern_matching

func f() {
    let score1: Int64 = 90
    let PASS1 = 60
    let FULL = 100
    var scoreResult: String = match (score1) {
        case 0 => "zero"
        case 10 | 20 | 30 | 40 | 50 => "fail"
        case 70 | 80 => "good"
        case _ => "not a valid score"
    }
}
