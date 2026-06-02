// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %f %noStackInfo -o %output
// (DEBUG_OPTION)RUN-EXEC: %run %run_opt %output

main() {
    let a = VArray<Int64, $2>(repeat: 3);
    var b = VArray<Int64, $2>(repeat: 2);
    return a[1] - b[0] - 1
}
