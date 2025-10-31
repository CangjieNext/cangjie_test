// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop  --output-javagen-dir=./ 2>& 1 | compare %f 

import java.lang.*
import interoplib.interop.*

@JavaMirror["com.MyJavaMirrorInterface"]
public interface MyJavaMirrorInterface {
    func sayHello(): Unit
}

public interface PureInterface <: MyJavaMirrorInterface {}

/* SCAN-IN
error: super declaration 'MyJavaMirrorInterface' is inheritable only for declaration annotated with @JavaMirror or @JavaImpl
  ==> interface_inherits_mirror_interface.cj:17:1:
   | 
17 | public interface PureInterface <: MyJavaMirrorInterface {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
*/
