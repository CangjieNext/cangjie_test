// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: a
//  EXEC: %compiler --output-type=dylib -p ./a --verbose
//  EXEC-PIPE: %compiler --output-type=exe --dy-std %f -L. -la --verbose | compare %f
// (CJNATIVE and Linux) ASSERT: regex (ld|lld)' .*-l:libcangjie-std-core.so
// (CJNATIVE and Linux) ASSERT: regex-not (ld|lld)' .*-l:libcangjie-std-core.a
// (CJNATIVE and Windows) ASSERT: regex ld\.exe" .*-l:libcangjie-std-core.dll
// (CJNATIVE and Windows) ASSERT: regex-not ld\.exe" .*-l:libcangjie-std-core.a
// (CJNATIVE and Darwin) ASSERT: regex ld64\.lld' .*/runtime/lib/darwin_aarch64_cjnative' .*/lib/darwin_aarch64_cjnative'
// (CJNATIVE and Darwin) ASSERT: regex-not ld64\.lld' .*/libcangjie-std-core.a'

import a.*

main() {
    f()
}
