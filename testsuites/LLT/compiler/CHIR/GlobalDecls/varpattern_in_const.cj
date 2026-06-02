// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f
// EXEC: %compiler %f -g

class C {
    public static const func f1(a: (String, Int64)): Int64 {
        let (_, b) = a
        return b
    }
}

main() {
    0
}
