// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux) EXEC: %mkdir \'
// (Linux) EXEC-PIPE-0: %compiler %cmp_opt --verbose %f --save-temps=\' 2>&1 | compare %f
// (Linux and O2) ASSERT: regex bin/cjc-frontend(.exe)?['"].*?-o' '.*/'\\''/test_frontend_cmd_quote.bc'
// (Linux and not O2) ASSERT: regex bin/cjc-frontend(.exe)?['"].*?'

main() {
    return 0
}
