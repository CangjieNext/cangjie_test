/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args

enum A {
    | Year(Int64)
    | Year
    | Year(String, (Int16, Float32))
}

class B {}

let score: A = Year(10)
var result: String = match (score) {
    case Year(_: Int16) | Year(_: Int32) | Year(_: Int8) | Year(_: UInt32) | Year(_: UInt16) | Year(_: Float32)
        | Year(_: Bool) | Year(_: Rune) | Year(_: String) | Year(_: A) => "10个类型模式匹配"
    case Year(0) | Year(20) | Year(30) | Year(40) | Year(50) | Year(60) | Year(70) | Year(80) | Year(90) | Year(100) => "10个常量模式匹配"
    case Year(_) | Year(20) | Year(_: Int16) | Year(_) | Year | Year(_) | Year(_) | Year("", (1, 1.0)) | Year | Year => "多种模式匹配"
    case _ | _ | _ | _ | _ | _ | _ | _ | _ | _ => "10个通配符模式匹配"
    case _ => "not a valid score"
}

main(): Int64 {
    if (result == "多种模式匹配") {
        return 0
    } else {
        return 1
    }
}
