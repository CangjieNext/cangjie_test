// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-0: %compiler %cmp_opt %f -o %output
// RUN-EXEC-0: %run %run_opt %output %run_args

main(): Int64 {
    {input: Int64 => input} |> ({input: (Int64) -> Int64 => 0} ~> {input: Int64 => {a: Int64 => a}})
    return 0
}
