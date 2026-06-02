// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: vardecl3.cj
// EXEC: %compiler %cmp_opt %f vardecl3.cj -o %output
// EXEC-PIPE: %run %run_opt %output %run_args

public var var257: Range<Int64> = 10..12

main(): Int64 {
    var257
    var655
    return 0;
}
