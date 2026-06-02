// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f

public const func pte_func_123456_03(a: Int64, b: (String, Rune)) {
    let (b0, b1) = b
    (a, b0, b1)
}

main() {}
