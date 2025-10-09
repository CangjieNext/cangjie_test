// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// test ignore case
func test(): Unit {
    throw NoneValueException("Iv is iViv,iV and iv are sensitive keyword")
    return
}

main() {
    return 0
}
