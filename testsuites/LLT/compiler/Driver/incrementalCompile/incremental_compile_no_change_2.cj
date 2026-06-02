// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %verbose_opt --experimental --incremental-compile %f -o %output
// (not Windows and DEBUG_OPTION) EXEC: rm .cached/*.o
// (Windows and DEBUG_OPTION) EXEC: powershell -c "rm .cached/*.o"
// (DEBUG_OPTION)EXEC: %compiler %verbose_opt --experimental --incremental-compile --incremental-debug %f -o %output 2>&1 | compare %f
// ASSERT: scan cached obj file not exist, roll back to full compilation

main() {
    return 0
}
