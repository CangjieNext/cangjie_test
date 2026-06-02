// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#include <stdio.h>

int main() {
    int k[]{55, 111, 246, 246, 246, 246, 246, 246, 246, 246, 246, 246, 246, 246, 246, 246, 58, 111};
    for (auto c:k) {
        putchar(c);
    }
}