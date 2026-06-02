// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler --output-type=exe %f -o %output

// First of all, check whether the output is an executable.
// EXEC: %output

// Check if the output has DYN type (An executable with DYN type is a position independent executable)
// (not Darwin) EXEC: readelf -Wl %output | compare %f
// (not Darwin) ASSERT: scan Elf file type is DYN
// (Darwin) EXEC: otool -hv %output | compare %f
// (Darwin) ASSERT: scan PIE

main() {
    println("Hello")
    return 0
}
