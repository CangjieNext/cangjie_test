/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main(): Int64 {
    let score: Int64 = 90
    var scoreResult: String = match (score) {
        case 0 => "zero"
        case 10 | 20 | 30 | 40 | 50 => "fail"
        case 60 => "pass"
        case 70 | 80 => "good"
        case 90 | 100 => "excellent"
        case _ => "not a valid score"
    }
    return 0
}
