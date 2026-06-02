// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Darwin) EXEC-PIPE-0: %compiler %f -o %output
// (CJNATIVE and Darwin) EXEC-PIPE-0: otool -l %output | compare %f
// (CJNATIVE and Darwin) ASSERT: scan-not RPATH
main() {
    return 0
}
