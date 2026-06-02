/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a.b

public enum E1<T> {
    A1 | A2(Int64) | A3(T) | ...
}

protected enum E2<T> {
    B1 | B2(Int64) | B3(T) | ...
}

enum E3<T> {
    C1 | C2(Int64) | C3(T) | ...
}

private enum E4<T> {
    D1 | D2(Int64) | D3(T) | ...
}
