// LEVEL: 0
// EXEC-PIPE-1: %compiler %f -o %output 2>&1 | compare %f
// ASSERT: scan variable 'y' is used before initialization

class CA<T> {
    static var y : String
    static var x : String
    static init() {
        x = y
        y = x
    }
}

main() {
    CA<Int64>()
    0
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
