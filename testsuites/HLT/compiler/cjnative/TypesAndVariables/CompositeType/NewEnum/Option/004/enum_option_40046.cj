/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-1: %compiler %cmp_opt %f -o %output

struct E {
    public var a: Int64 = 1
}

main() {
    var i: ?E = E()
    i?.a = 0
    return (i?.a ?? -1) - 1
}

// ASSERT: regex :8:.* .*cannot assign to value which is an initialized 'let' constant
