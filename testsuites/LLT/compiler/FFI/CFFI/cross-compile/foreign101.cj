// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %rmdir mockmodule

// (Linux and DEBUG_OPTION) EXEC: %mkdir mockmodule/modules/windows_x86_64_cjnative
// (Linux and DEBUG_OPTION) EXEC: %cpdir $CANGJIE_HOME/modules/linux_x86_64_cjnative/* mockmodule/modules/windows_x86_64_cjnative
// (Linux and DEBUG_OPTION) EXEC-PIPE-0: CANGJIE_HOME=./mockmodule %frontendCompiler %dump-ir-to-screen --target=x86_64-w64-mingw32 %f -o %n.%middle 2>&1 | compare %f

// (Linux) ASSERT: regex-auto declare void @a1(i1 zeroext)
// (Linux) ASSERT: regex-not byval
// (Linux) ASSERT: regex-not zext

package test

foreign func a1(arg0: Bool): Unit

main(): Int64 {
    unsafe {
        a1(true)
    }
    return 0
}
