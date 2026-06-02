// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func y() {
    throw e;
}

func x() {
    return y;
}

func z() {
    if (a) {
        return true; // comment
    }
    let x = 2;
    x = 5 /*comment*/; // comment
    x = 7 /*comment*/; // comment
} // comment