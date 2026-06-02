// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux) EXEC-PIPE-0: %compiler %verbose_opt --pgo-instr-gen %f 2>&1 -o %output | compare %f
// (CJNATIVE and Linux) ASSERT: regex opt(.exe)?['"] .*-pgo-kind=pgo-instr-gen-pipeline
// (CJNATIVE and Linux) ASSERT: regex opt(.exe)?['"] .*-runtime-counter-relocation
// (CJNATIVE and Linux) ASSERT: regex ld(.exe)?['"] .*__llvm_profile_runtime
// (CJNATIVE and Linux) ASSERT: regex ld(.exe)?['"] .*libclang_rt-profile.a
// (CJNATIVE and Linux) EXEC: %run_opt %output

main() {
    return 0
}
