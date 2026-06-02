// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %noColor %f -o %output
// ASSERT: scan The build-in macro 'sourceLine' expected an empty parameter, but found non-empty one

package test

main() {
    var a = @sourceLine(1)
    return a
}


