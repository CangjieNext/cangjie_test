// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package p2

internal import p2.p1.f as foo // foo is private in current file.
public import p2.p1.f as foo2 // foo2 is public
