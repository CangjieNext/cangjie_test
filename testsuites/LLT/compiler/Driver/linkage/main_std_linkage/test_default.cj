// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: a
//  EXEC: %compiler --output-type=dylib -p ./a --verbose
// NOTE: The following default behavior is incorrect! std will be linked statically into main and cause duplicate std in the program.
//  EXEC-PIPE: %compiler --output-type=exe %f -L. -la --verbose | compare %f
// (CJNATIVE and Linux) ASSERT: regex-not (ld|lld)' .*-l:libcangjie-std-core.so
// (CJNATIVE and Linux) ASSERT: regex (ld|lld)' .*-l:libcangjie-std-core.a
// (CJNATIVE and Windows) ASSERT: regex-not ld\.exe" .*-l:libcangjie-std-core.dll
// (CJNATIVE and Windows) ASSERT: regex ld\.exe" .*-l:libcangjie-std-core.a
// (CJNATIVE and Darwin) ASSERT: regex ld64\.lld' .*/libcangjie-std-core.a'

import a.*

main() {
    f()
}
