// LEVEL: 0
// EXEC: %compiler %cmp_opt %f %enableO2 -o %output
// RUN-EXEC-5: %run %run_opt %output %run_args

enum TimeUnit{
Year(Int64)
}

main() {
    var a = Year(0)
    var b = match (a) {
        case TimeUnit.Year(2) => 4
        case TimeUnit.Year(_) => 5
    }
    return b
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
