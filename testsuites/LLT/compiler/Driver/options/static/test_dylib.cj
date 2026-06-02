// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux) EXEC-PIPE: %compiler %f --static --output-type=dylib -o %output --verbose 2>&1 | compare %f
// (CJNATIVE and Linux) ASSERT: regex warning.* '--static' option is only effective when compiling executables.
// (CJNATIVE and Linux) ASSERT: regex-not warning.* -l:libcangjie-runtime.a

main() {
    return 0
}
