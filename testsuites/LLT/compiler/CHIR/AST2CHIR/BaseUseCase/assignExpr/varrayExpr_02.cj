// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f %noStackInfo -o %output
// RUN-EXEC: %run %run_opt %output

main() {
    var a = VArray<Int64, $2>(repeat: 3);
    a[1] += 5
    return a[1] - a[0] - 5
}
