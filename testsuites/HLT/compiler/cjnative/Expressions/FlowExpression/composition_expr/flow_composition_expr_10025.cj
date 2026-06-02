/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

func a(): Int64 {
    0
}

func b() {
    {input: Int64 => input}
}

var A = [a()]
var B = [b()]

main(): Int64 {
    A[0] |> (B[0] ~> B[0])
    return 0
}
