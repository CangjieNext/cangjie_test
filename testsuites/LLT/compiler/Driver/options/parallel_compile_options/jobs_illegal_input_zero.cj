// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE & Linux) EXEC-PIPE: %compiler --jobs 0  %f 2>&1 -o %output | compare %f
// (CJNATIVE & Linux) ASSERT: scan '--jobs' value must be greater than 0, the compiler will use 1 as the value.

main() {
    return 0
}
