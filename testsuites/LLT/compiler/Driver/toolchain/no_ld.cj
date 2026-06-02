// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not Windows)EXEC: %touch ar && chmod +x ar
// (not Windows)EXEC: %touch objcopy && chmod +x objcopy
// (not Windows)EXEC: PATH=$(dirname $(which cjc)):. cjc %f 2>&1 | compare %f
// ASSERT: regex not found `ld` in search paths

main() {
    return 0
}
