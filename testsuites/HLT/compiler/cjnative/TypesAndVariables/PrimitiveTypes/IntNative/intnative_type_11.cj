/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not iOS) EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-EXEC: %run %run_opt %output %run_args

func a(): IntNative {
    0
}

func b() {
    {input: IntNative => input}
}

var A = [a()]
var B = [b()]

main(): IntNative {
    A[0] |> (B[0] ~> B[0])
    return 0
}
