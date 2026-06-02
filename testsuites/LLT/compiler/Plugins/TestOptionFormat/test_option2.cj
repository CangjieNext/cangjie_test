// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE)EXEC: %cpfile %n.cj %n.%dylib_suffix
// (CJNATIVE)RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output --plugin=%n.%dylib_suffix 2>&1 | compare %f
// (CJNATIVE)ASSERT: scan is not a valid compiler plugin to be loaded or executed

main() {
    0
}
