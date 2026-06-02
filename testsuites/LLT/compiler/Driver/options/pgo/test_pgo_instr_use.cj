// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux) EXEC: %compiler --pgo-instr-gen %f 2>&1 -o %output
// (CJNATIVE and Linux) EXEC: LLVM_PROFILE_FILE="test.profraw" %run_opt %output
// (CJNATIVE and Linux) EXEC: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CANGJIE_HOME/third_party/llvm/lib $CANGJIE_HOME/third_party/llvm/bin/llvm-profdata merge *.profraw -o test.profdata
// (CJNATIVE and Linux) EXEC-PIPE-0: %compiler %verbose_opt --pgo-instr-use=test.profdata %f 2>&1 -o %output | compare %f
// (CJNATIVE and Linux) ASSERT: regex opt(.exe)?['"] .*-pgo-kind=pgo-instr-use-pipeline
// (CJNATIVE and Linux) ASSERT: regex opt(.exe)?['"] .*-profile-file=test.profdata
// (CJNATIVE and Linux) ASSERT: regex-not ld(.exe)?['"] .*-u__llvm_profile_runtime
// (CJNATIVE and Linux) ASSERT: regex-not ld(.exe)?['"] .*libclang_rt-profile.a
// (CJNATIVE and Linux) EXEC: %run_opt %output

main() {
    return 0
}
