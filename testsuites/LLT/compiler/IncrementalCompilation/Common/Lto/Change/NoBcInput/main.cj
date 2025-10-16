// (Linux and CJNATIVE) LEVEL: 0
// (Linux and CJNATIVE) DEPENDENCE: %n.txt
// (Linux and CJNATIVE) EXEC: %rmdir .cached
// (Linux and CJNATIVE) EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt %n.cj --lto=full -o %output
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// (Linux and CJNATIVE) EXEC: %cpfile %n.txt %n.cj
// (Linux and CJNATIVE) EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt %n.cj --lto=full -o %output 2>&1 | compare %f
// (Linux and CJNATIVE) RUN-EXEC-1: %run %run_opt %output %run_args

// ASSERT: scan-not no change

main() {
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
