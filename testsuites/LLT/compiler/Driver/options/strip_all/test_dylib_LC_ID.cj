// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Darwin and CJNATIVE) EXEC: %compiler --output-type=dylib --strip-all --verbose %f
// (Darwin and CJNATIVE) EXEC-PIPE: otool -l libtest_dylib_LC_ID.dylib | grep LC_ID_DYLIB -A2 | compare %f
// (Darwin and CJNATIVE) ASSERT: regex name .*/libtest_dylib_LC_ID.dylib

main() {
    println("Hello")
}
