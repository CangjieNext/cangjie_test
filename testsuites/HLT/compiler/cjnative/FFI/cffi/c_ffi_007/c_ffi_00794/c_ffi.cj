/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

foreign func GetCFunc(): CFunc<(CPointer<Unit>) -> Unit>

var f: CFunc<(CPointer<Int8>) -> Unit> = {ptr =>}

unsafe main(): Int64 {
    f = GetCFunc()

    return 0
}
// ASSERT: scan sema_mismatched_types
