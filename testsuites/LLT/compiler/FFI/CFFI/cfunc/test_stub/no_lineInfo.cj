// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %f -o %output %noStackInfo
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args

@C
func foo(): Int64 {
    0
}

main() {
    unsafe { foo() }
}