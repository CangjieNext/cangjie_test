// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output 2>&1

let p1 = 2

main() {

    let f1: CFunc<(CPointer<UInt64>) -> Int64> = { ptr =>
        p1
    }

    return 0
}
