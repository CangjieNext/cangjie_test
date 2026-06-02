main(): Int64 {
    let a = Array<Array<Int64>>(3) { i => Array<Int64>(10, {i => i + 1} ) }
    return a[2].size
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
