// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %output %run_args

class K {
    public static let z = { =>
        const func f():Int64 {
            return 2
        }
        f()
    }
}

main() {
    return K.z() - 2
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
