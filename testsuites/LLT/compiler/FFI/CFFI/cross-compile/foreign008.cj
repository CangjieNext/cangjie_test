// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %rmdir mockmodule

// (Linux and DEBUG_OPTION) EXEC: %mkdir mockmodule/modules/linux_aarch64_cjnative
// (Linux and DEBUG_OPTION) EXEC: %cpdir  $CANGJIE_HOME/modules/linux_x86_64_cjnative/* mockmodule/modules/linux_aarch64_cjnative
// (Linux and DEBUG_OPTION) EXEC-PIPE-0: CANGJIE_HOME=./mockmodule %frontendCompiler %dump-ir-to-screen --target=aarch64-linux-gnu %f -o %n.%middle 2>&1 | compare %f

// (Linux) ASSERT: regex-not byval
// (Linux and not WithApc) ASSERT: regex-not zext
// (Linux) ASSERT: regex-auto declare [3 x double] @a2([3 x double], [3 x double])

package test

@C
public struct R {
    public var x: Float64
    public var y: Float64
    public var z: Float64

    public init(a: Float64) {
        x = a
        y = a
        z = a
    }
}

foreign func a2(arg0: R, arg1: R): R

main(): Int64 {
    unsafe {
        a2(R(1.0), R(2.0))
    }
    return 0
}
