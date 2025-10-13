// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE)RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output --plugin=%n.cj 2>&1 | compare %f
// (CJNATIVE and Linux)ASSERT: scan '--plugin' requires a dynamic library path with '.so' suffix.
// (CJNATIVE and Windows)ASSERT: scan '--plugin' requires a dynamic library path with '.dll' suffix.

main() {
    0
}
