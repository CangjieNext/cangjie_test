// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux) EXEC-PIPE-0: %compiler %f -o %output
// (CJNATIVE and Linux) EXEC-PIPE-0: readelf -d %output | compare %f
// (CJNATIVE and Linux) ASSERT: scan-not RUNPATH
main() {
    return 0
}
