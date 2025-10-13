// DEPENDENCE: %n.first.cj, %n.second.cj, %n.third.cj
// (Linux and CJNATIVE) EXEC: %cpfile %n.first.cj %n.inc.cj
// (Linux and CJNATIVE) EXEC: %compiler --lto=full %incrementalCompile %cmp_opt %n.inc.cj -o %output
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// (Linux and CJNATIVE) EXEC: %cpfile %n.second.cj %n.inc.cj
// (Linux and CJNATIVE) EXEC: %compiler --lto=full %incrementalCompile %cmp_opt %n.inc.cj -o %output
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// (Linux and CJNATIVE) ASSERT: scan incremental compilation triggered
// (Linux and CJNATIVE) ASSERT: scan-not rollback
// (Linux and CJNATIVE) ASSERT: scan-not no change
// (Linux and CJNATIVE) EXEC: %cpfile %n.third.cj %n.inc.cj
// (Linux and CJNATIVE) EXEC: %compiler --lto=full %incrementalCompile %cmp_opt %n.inc.cj -o %output
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// (Linux and CJNATIVE) ASSERT: scan incremental compilation triggered
// (Linux and CJNATIVE) ASSERT: scan-not rollback
// (Linux and CJNATIVE) ASSERT: scan-not no change

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
