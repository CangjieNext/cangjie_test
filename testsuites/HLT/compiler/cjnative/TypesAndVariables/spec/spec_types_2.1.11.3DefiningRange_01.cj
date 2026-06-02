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
    let range16: Range<Int64> = 0..10 // Define an half-open range [0,10) with step = 1
    let range17: Range<Int64> = -10..10 : 2 // Define an half-open range [-10,10) with step = 2
    let range18 = 0..=10 // Define a closed range [0,10] with step = 1
    let range19 = -10..=10 : 2 // Define a closed range [-10,10] with step = 2
    return 0
}
