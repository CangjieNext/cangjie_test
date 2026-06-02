// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %frontendCompiler %cmp_opt %typecheck %diag_json %f 2>&1 | compare %f

// Not support this usage
main() {
    f() {}
}

func f(): (() -> Unit) -> Unit {
    return {a: () -> Unit =>}
}
// ASSERT: scan sema_wrong_number_of_arguments
