main(): Int64 {
    var a = 1
    try {
        throw IndexOutOfBoundsException()
    } catch(e: Exception) {
        return 0
    }
    return a - 10
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
