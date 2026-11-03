// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Copying the local value into a ~local variable first makes the returned expr ~local, so it is allowed.

// EXEC: %compiler %local %f -o %output

func copied(): ToString {
    let n: Int64 @local! = 1
    let c: Int64 = n
    c
}

main() {}
