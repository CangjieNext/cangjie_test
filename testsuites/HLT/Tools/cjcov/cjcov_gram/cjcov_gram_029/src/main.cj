/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func func1(): Int64 {
    let score = 50
    var result: String = match {
        case score < 60 => "fail"
        case score < 70 => "pass"
        case score < 90 => "good"
        case _ => "excellent"
    }

    return 0
}

main(): Int64 {
    func1()

    return 0
}
