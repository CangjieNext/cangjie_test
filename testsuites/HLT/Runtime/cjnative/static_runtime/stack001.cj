/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows and not MAC and not O2) EXEC: %compiler %compilation_options %extra_options %lto_options %sanitizer_options %mock_options %optimization_options %debug_options --static %f -o %output
// (not Windows and not MAC and not O2) RUN-EXEC-PIPE: %export cjStackSize=64kb && %export CJ_SOF_SIZE=-5 && unset LD_LIBRARY_PATH && %output %run_args 2>&1 | compare %f

// ASSERT: scan-begin An exception has occurred
// (Windows) ASSERT: scan-next
// ASSERT: scan-next StackOverflowError
// ASSERT: scan-next ... Some frames are not displayed ...
// ASSERT: scan-next at default.my_test_func
// ASSERT: scan-next at default.my_test_func
// ASSERT: scan-next at default.my_test_func
// ASSERT: scan-next at default.my_test_func
// ASSERT: scan-next at default.main

func my_test_func(x: Int64): Unit {
    my_test_func(x + 1)
}

main() {
    try {
        my_test_func(0)
    } catch (e: StackOverflowError) {
        e.printStackTrace()
    }
    return
}
