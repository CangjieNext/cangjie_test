// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output 2>&1

main() {
    let p1 = 2

    let f1: CFunc<(CPointer<UInt64>) -> Int64> = { ptr =>
        let p1 = 0
        let f2 = {
            => p1
        }
        0
    }

    return 0
}
