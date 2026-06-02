// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE and Linux) EXEC: %compiler %f -o %output --apc=2 --save-temps=. -Woff unused
// (CJNATIVE and Linux) EXEC: ls rootpkg.__symbols

package rootpkg

main(): Int64 {
    println("hello world")
    return 0
}
