// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC:%compiler -O0 -O2 --verbose %f | compare %f
//  ASSERT: regex opt[^\n]*-O2.*?
//  ASSERT: regex llc[^\n]*-O2.*?

main() {
    println("Hello")
}
