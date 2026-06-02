// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %noStackInfo %f -o %output
// RUN-EXEC: %run %run_opt %output

enum E {
    R | G | B
}

main() {
    var a = R
    return match (a) {
        case B => 10
        case G => 9
        case R => 8
    } - 8
}
