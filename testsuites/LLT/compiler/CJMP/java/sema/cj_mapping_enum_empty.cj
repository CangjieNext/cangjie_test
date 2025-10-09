// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop %enable_java_cjmapping  --output-javagen-dir=./ 2>& 1 | cat ./EmptyEnum.java 2>& 1 | compare %f 

import interoplib.interop.*

public enum EmptyEnum {}

/* SCAN-IN
cat: ./EmptyEnum.java: No such file or directory
*/
