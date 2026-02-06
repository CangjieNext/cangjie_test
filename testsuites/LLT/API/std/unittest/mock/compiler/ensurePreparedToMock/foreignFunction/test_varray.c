/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

long long double_varray(long long *a) {
    long long res = 0;
    for (int i = 0; i < 3; ++i) {
        res += a[i];
        a[i] *= 2;
    }
    return res;
}
