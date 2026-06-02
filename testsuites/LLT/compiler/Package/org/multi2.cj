// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// LEVEL 0
// EXEC: %compiler %f %diag_json 2>&1 | compare %f
import org1::{org2::a}
main() {}

// ASSERT: scan-1 parse_expected_right_delimiter
// ASSERT: scan-1 parse_expected_character