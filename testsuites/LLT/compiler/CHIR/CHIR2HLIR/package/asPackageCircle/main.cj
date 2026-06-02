// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: X
// EXEC: %compiler -p %compile_lib_opt X -o X.%middle
// ERRCHECK: %compiler %noColor X.%middle %f %diag_json -o %output

import X.* as T.*
import T.* as C.*
import C.* as X.*
import X.bar as foo
// ASSERT: scan parse_expected_character
