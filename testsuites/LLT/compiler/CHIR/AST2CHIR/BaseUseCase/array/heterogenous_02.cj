// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// RUN-EXEC: %run %run_opt %output

main() {
    let a: (VArray<Int64, $3>, VArray<Int64, $3>) = ([1, 2, 3], [8, 9, 10])

    return a[1][1] - a[0][2] - 6
}
