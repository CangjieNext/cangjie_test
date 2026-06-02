// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output

func test(): Int64 {
    var result = match (80) {
        case 60 => "pass"
        case good => return 0
        case _ => "other"
    }
    return 1
}

main(): Int64 {
    return test()
}
