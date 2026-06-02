/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    case60_5()
    return 0
}

func case60_5() {
    let a: Float32 = 90
    let b: Int32 = 90
    let scoreTuple = ("a", a)
    var result: String = match (scoreTuple) {
        case ("a", 90) => "No"
        case (_, _) => "None"
    }
}
// ASSERT: scan sema_cannot_convert_literal
