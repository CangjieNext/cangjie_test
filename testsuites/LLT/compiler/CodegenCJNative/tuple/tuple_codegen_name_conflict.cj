// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

let a = (b, 9)
let d = (false, (b, 9), 'x')

enum c {
    b
    | e(Bool, (c, Int64), Rune)
}

main(): Int64 {
    return 0
}
