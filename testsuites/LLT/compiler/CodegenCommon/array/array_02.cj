// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
// EXEC-PIPE: %compiler %cmp_opt %f %enableO2 -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

func foo(): Int64 {
    var aaa: Array<Option<Int64>> = [([(UInt16(100) as Unit), (() as Unit)] as Int64)]
    return 0
}

main() {
    foo()
    return 0
}
