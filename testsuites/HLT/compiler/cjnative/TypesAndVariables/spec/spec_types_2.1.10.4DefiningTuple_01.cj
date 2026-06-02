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

main() {
    let tuplePIE = (3.14, "PIE") // The type of tuplePIE is inferred to be Float64*String
    var pointOne = (2.4, 3.5) // The type of pointOne is inferred to be Float64*Float64
    var pointTwo = (2, 3, 4) // The type of pointTwo is inferred to be Int64*Int64*Int64
    var pointThree = ((2, 3), 4) // The type of pointThree is inferred to be (Int64*Int64)*Int64
    return 0
}
