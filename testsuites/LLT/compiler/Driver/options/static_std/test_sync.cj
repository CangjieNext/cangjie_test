// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: %compiler %f --static-std -o %output
//  EXEC-3: %output 2>&1
//  EXEC: %ldd %output | compare %f
// (Linux and CJNATIVE) ASSERT: scan-not cangjie-std-sync.so
// (Darwin and CJNATIVE) ASSERT: scan-not cangjie-std-sync.dylib
// (Windows and CJNATIVE) ASSERT: scan-not cangjie-std-sync.dll

internal import std.sync.*

main() {
    let future = spawn {
        =>
        println("OK")
        3
    }
    try {
        return future.get()
    } catch (_) {
        return 0
    }
}
