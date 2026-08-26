// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Guard the --exclude-libs fix: ast.so must not export C++ runtime symbols,
// else downstream .so's bind to it via DT_NEEDED. The Cangjie main() is just a
// host the framework requires; the actual check runs via the EXEC command.
// EXEC: %compiler %cmp_opt %f -o %output
// (Linux)EXEC-1: nm -D --defined-only %ast_so | grep -E "(__cxa_throw|__gxx_personality_v0|_Unwind_Resume|_Znam|_ZdlPv|_ZdaPv|_ZSt9terminatev|_ZTVN10__cxxabiv)"

main(): Int64 {
    return 0
}
