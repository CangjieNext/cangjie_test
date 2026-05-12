// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f --output-type=obj --compile-target=dylib -o main.o --experimental
// EXEC-PIPE-1: %compiler %cmp_opt main.o -lcangjie-std-core --output-type=exe --experimental -o %output 2>&1 | compare %f
// (host_win and target_win)ASSERT: scan ld.lld: error: undefined symbol: WinMain
// (host_mac and target_mac)ASSERT: scan undefined symbol: _main
// (target_ios_simulator| target_android |target_ohos)ASSERT: scan undefined symbol: main
// (host_linux and target_linux)ASSERT: scan undefined reference to `main'

main() {
    println("Hello cangjie!")
}
