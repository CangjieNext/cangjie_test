// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output

enum A {
    | Year(Int64)
    | Year
    | Year(String, (Int16, Float32))
}

let score: A = Year(10)
var result = match (score) {
    case Year(_: Int16) | Year(_: Int32) | Year(_: Int8) | Year(_: UInt32) | Year(_: UInt16) | Year(_: Float32)
        | Year(_: Bool) | Year(_: Rune) | Year(_: String) | Year(_: A) => 1
    case Year(0) | Year(20) | Year(30) | Year(40) | Year(50) | Year(60) | Year(70) | Year(80) | Year(90) | Year(100) => 2
    case Year(_) | Year(20) | Year(_: Int16) | Year(_) | Year | Year(_) | Year(_) | Year("", (1, 1.0)) | Year | Year => 3
    case _ | _ | _ | _ | _ | _ | _ | _ | _ | _ => 4
    case _ => 5
}

main(): Int64 {
    if (result == 3) {
        return 0
    }
    return 1
}
