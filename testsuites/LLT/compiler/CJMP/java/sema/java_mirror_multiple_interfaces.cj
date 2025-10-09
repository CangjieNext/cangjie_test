// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop -L.

import interoplib.interop.*
import java.lang.JObject

@JavaMirror
public interface I1 {
}

@JavaMirror
public interface I2 {
}

@JavaMirror
class JForeignClass <: I1 & I2 {
}
