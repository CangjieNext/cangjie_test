// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f --cfg "x=" 2>&1 | compare %f
// ASSERT: regex error.* user defined condition should be like: k1=v1,k2=v2 or <directory path of cfg.toml>
main() {
    return 0
}
