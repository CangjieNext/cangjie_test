// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC: LIBRARY_PATH='$(touch "OOPS_INJECTION!")':$LIBRARY_PATH %compiler %f
// (CJNATIVE and not Windows) EXEC: ls | compare %f
// (CJNATIVE and not Windows) ASSERT: scan-not OOPS_INJECTION!

main() {
    return 0
}
