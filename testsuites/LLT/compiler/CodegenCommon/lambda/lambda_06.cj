// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

public enum EnumA {
    DV
    | EV((Range<UInt16>) -> Unit)
}

main(): Int64 {
    return 0 // No need to add any logic here since we're just going to check if the compilation fails.
}
