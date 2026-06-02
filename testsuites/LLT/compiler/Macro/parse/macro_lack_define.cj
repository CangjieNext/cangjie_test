// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output
// ASSERT: scan unclosed delimiter: '['
// ASSERT: scan note: Argument syntax error.

import std.collection.ArrayList

@DataAssist[props field]
public class TodoSavingParam {
    private var todos: ArrayList<String> = ArrayList<String>()
}