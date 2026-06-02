// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan error: arithmetic operation '+' overflow

struct SA {
    var x: Int8 = 0
}

main() {
    var sa = SA()
    sa.x = 1
    var INT8_MAX: Int8 = 127
    sa.x + INT8_MAX
}
