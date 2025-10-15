// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan declare void @free

// Test foreign cffi func

foreign func free(ptr: CPointer<Unit>): Unit

main() {
    unsafe {
        free(CPointer<Unit>())
    }
    return 0
}
