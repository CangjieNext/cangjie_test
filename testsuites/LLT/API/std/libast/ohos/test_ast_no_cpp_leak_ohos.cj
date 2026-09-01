// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Guard the --exclude-libs fix on OHOS: ast.so links libc++_static.a, so C++
// runtime symbols would land in its body; the fix hides them via
// --exclude-libs. Verify no C++ runtime symbols are exported, else
// downstream .so's bind to ast.so via DT_NEEDED (the harmonyApp bug).
// OHOS uses llvm-nm (not GNU nm). EXEC-1 expects rc=1: grep finds nothing.
// EXEC: %compiler %cmp_opt %f -o %output
// (OHOS)EXEC-1: llvm-nm -D --defined-only %ast_so | grep -E "(__cxa_throw|__gxx_personality_v0|_Unwind_Resume|_Znam|_ZdlPv|_ZdaPv|_ZSt9terminatev|_ZTVN10__cxxabiv)"

main(): Int64 {
    return 0
}
