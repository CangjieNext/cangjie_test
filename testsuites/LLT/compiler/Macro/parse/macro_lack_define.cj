// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %run_macro %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan parse_expected_right_delimiter
// ASSERT: scan Argument syntax error.

import std.collection.ArrayList

@DataAssist[props field]
public class TodoSavingParam {
    private var todos: ArrayList<String> = ArrayList<String>()
}