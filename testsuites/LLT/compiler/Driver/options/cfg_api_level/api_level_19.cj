// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %f --cfg=APILevel_level=19 2>&1 | compare %f
// ASSERT: regex error.*: Compatible SDK version must be at least 20 \(got 19\)

main() {
    return 0
}
