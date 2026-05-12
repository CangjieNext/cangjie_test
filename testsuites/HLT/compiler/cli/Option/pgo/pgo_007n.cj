/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not MAC) EXEC: %cp %f default.profdata
// (not MAC) ERRCHECK: %compiler %cmp_opt --pgo-instr-use=default.profdata %f -o %output
// (not MAC) ASSERT: scan default.profdata: invalid instrumentation profile data (bad magic)
// (not MAC) ASSERT: scan command failed

main() {
    return 0
}
