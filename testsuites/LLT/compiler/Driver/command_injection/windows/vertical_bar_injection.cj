// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Windows) EXEC-PIPE-0: %compiler %cmp_opt "%f" -o hel^|lo.exe 2>&1 | compare "%f"
// (CJNATIVE and Windows) ASSERT: scan hel|lo.exe: Invalid argument

main() {
    println("Hello")
    return 0
}
