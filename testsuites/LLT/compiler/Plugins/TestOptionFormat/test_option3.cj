// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE)RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output --plugin=. 2>&1 | compare %f
// (CJNATIVE)ASSERT: scan '--plugin' only accepts an existing dynamic library path.

main() {
    0
}
