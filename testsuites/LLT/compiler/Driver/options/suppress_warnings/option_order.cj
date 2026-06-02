// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %noColor --warn-on unused --warn-off all  %f 2>&1 | compare %f
// ASSERT: scan-not warning

func test() {
    return 0
}

main() {
    return 1
        + 1 - 2
    return test()
}
