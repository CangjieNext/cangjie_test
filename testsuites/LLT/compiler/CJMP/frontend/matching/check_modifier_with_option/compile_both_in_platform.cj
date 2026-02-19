// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: common.cj platform.cj
// EXEC-PIPE-0: %compiler %noColor --experimental common.cj --output-type=chir
// EXEC-PIPE-1: %compiler %diag_json --experimental platform.cj common.cj cmp.chir --common-part-cjo=cmp.cjo --output-type=dylib 2>&1 | compare %f
// ASSERT: scan parse_common_in_non_common_file
