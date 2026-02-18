// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

features { os.linux }
package ot_exe

public specific func withdefault(): String { "overriden" }
public specific func specificId(): String { "linux" }

main(): Unit { commonMain() }
