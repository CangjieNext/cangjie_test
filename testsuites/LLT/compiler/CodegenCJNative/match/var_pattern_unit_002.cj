// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan b[2]=2

main() {
    let a = (1, (), 2)
    var result = match (a) {
        case b => "b[2]=${b[2]}"
        case _ => ""
    }
    print(result)
    0
}
