// (Linux and CJNATIVE) DEPENDENCE: %n.old.cj %n.new.cj
// (Linux and CJNATIVE) EXEC: %rmdir .cached
// (Linux and CJNATIVE) EXEC: %cpfile %n.old.cj main.cj
// (Linux and CJNATIVE) EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj --lto=full -o %output -j1
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

// (Linux and CJNATIVE) EXEC: %rmfile .cached/*.bc
// (Linux and CJNATIVE) EXEC: %rmfile .cached\*.bc
// (Linux and CJNATIVE) EXEC: %cpfile %n.new.cj main.cj
// (Linux and CJNATIVE) EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj --lto=full -o %output -j1 2>&1 | compare %f
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

// ASSERT: scan load cached bitcode file failed, roll back to full compilation



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
