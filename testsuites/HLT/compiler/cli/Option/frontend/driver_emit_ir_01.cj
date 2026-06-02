/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not OHOS) EXEC: %compiler_frontend %cmp_opt_frontend %close_apc_compile %f
// (not OHOS) EXEC: %ls %n.bc

main(): Int64 {
    var a: Int32 = 1
    var b: Int32 = 2
    if (a < b) {
        print("hello,world\n")
        return 0
    }
    return 1
}
