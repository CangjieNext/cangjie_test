// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    let result = Option<Int64>.Some(2023)
    if (let Some(value) <- result) {
        value
    } else {
        0
    }
    0
}
