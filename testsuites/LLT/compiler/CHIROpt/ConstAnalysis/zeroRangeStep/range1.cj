// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output -Woff unused %diag_json

main(): Int64 {
    let a = 11 * 22..33 : 1 - 1
    0
}
// ASSERT: scan chir_step_non_zero_range
