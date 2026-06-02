// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// RUN-EXEC: %run %run_opt %output

main() {
    let a: VArray<Int64, $4> = [1, 2, 3, 4]
    var b: VArray<Int64, $4> = [1, 2, 3, 4]

    return a[3] - b[2] - 1
}
