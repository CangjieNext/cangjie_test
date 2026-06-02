// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Darwin and EXEC-PIPE: %compiler --output-type=exe --strip-all --verbose %f -o %output 2>&1 | compare %f
// (Darwin and CJNATIVE) ASSERT: regex strip'.* '-u' '-r'

main() {
    println("Hello")
}
