// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %rmdir mockmodule

// (Linux and DEBUG_OPTION) EXEC: %mkdir mockmodule/modules/linux_aarch64_cjnative
// (Linux and DEBUG_OPTION) EXEC: %cpdir $CANGJIE_HOME/modules/linux_x86_64_cjnative/* mockmodule/modules/linux_aarch64_cjnative
// (Linux and DEBUG_OPTION) EXEC-PIPE-0: CANGJIE_HOME=./mockmodule %frontendCompiler %dump-ir-to-screen --target=aarch64-linux-gnu %f -o %n.%middle 2>&1 | compare %f

// (Windows and DEBUG_OPTION) EXEC: %mkdir .\mockmodule\modules\windows_aarch64_cjnative
// (Windows and DEBUG_OPTION) EXEC: %cpdir %CANGJIE_HOME%\modules\windows_x86_64_cjnative\* .\mockmodule\modules\windows_aarch64_cjnative
// (Windows and DEBUG_OPTION) EXEC-PIPE-0: set CANGJIE_HOME=.\mockmodule && %frontendCompiler %dump-ir-to-screen --target=aarch64-windows-gnu %f -o %n.%middle 2>&1 | compare %f

// ASSERT: regex-not byval
// (not WithApc) ASSERT: regex-not zext
// ASSERT: regex-auto declare i8* @a7(i8*)

package test

foreign func a7(a: CPointer<Int64>): CPointer<Int64>

main(): Int64 {
    unsafe {
        a7(CPointer<Int64>())
    }
    return 0
}
