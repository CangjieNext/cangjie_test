// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class CA<T> {
    static let a = "str"
}


class CB<T> {
    static let b = "str"
}

main() {
    var ca = CA<Int64>()
    var cb = CB<Int64>()
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
