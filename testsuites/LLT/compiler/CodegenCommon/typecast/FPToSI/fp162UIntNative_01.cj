// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-ERRCHECK: %run %run_opt %output %run_args
// ASSERT: scan An exception has occurred:
// ASSERT: scan OverflowException: The result would be less than UIntNative.Min.

public func foo(param: Float16) {
    println(UIntNative(param))
}

main() {
    foo(-128.9_f16)
    return 0
}
