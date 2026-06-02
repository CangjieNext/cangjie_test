// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler --output-type=dylib %f --verbose | compare %f
// (CJNATIVE and Linux) ASSERT: regex (ld|lld)' .*-l:libcangjie-std-core.so
// (CJNATIVE and Linux) ASSERT: regex-not (ld|lld)' .*-l:libcangjie-std-core.a
// (CJNATIVE and Windows) ASSERT: regex ld\.exe" .*-l:libcangjie-std-core.dll
// (CJNATIVE and Windows) ASSERT: regex-not ld\.exe" .*-l:libcangjie-std-core.a
// (CJNATIVE and Darwin) ASSERT: regex ld64\.lld' .*/runtime/lib/darwin_aarch64_cjnative' .*/lib/darwin_aarch64_cjnative'
// (CJNATIVE and Darwin) ASSERT: regex-not ld64\.lld' .*/libcangjie-std-core.a'

package a

public func f() {
    println("f")
}
