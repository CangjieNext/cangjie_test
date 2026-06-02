// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    let x = 100
    if (x > 1) {
        x
    }
    if (x > 100) {
        2
    } else {
        3
    }
    if (x > 100) {
        4
    } else if (x > 1) {
        5
    } else {
        6
    }
    0
}
