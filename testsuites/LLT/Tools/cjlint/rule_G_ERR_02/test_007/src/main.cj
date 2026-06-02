// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// test 2 escape code
func test(): Unit {
    throw NoneValueException(#"\npwd\n\\IV\n"#)
    throw NoneValueException(##"\npwd\n\wIV\n"##)
    return
}

main() {
    return 0
}
