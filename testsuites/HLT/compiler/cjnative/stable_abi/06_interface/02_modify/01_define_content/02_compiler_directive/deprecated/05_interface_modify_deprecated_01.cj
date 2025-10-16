/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 6.2.1.2.5
  @Scene: modify
  @Visibility: public
  @Object: interface
  @Behavior: modify @Deprecated: keep strict value
  @Expect: api compatible & abi compatible
*/

// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix


// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test interface: @Deprecated

public interface I1 {
    public static func typename(): String {
        "interface I1"
    }
}
public interface G1<T> {
    public static func typename(): String {
        "interface G1<T>"
    }
}

@Deprecated["This API will be deprecated soon!!!"]
public interface I2 {
    public static func typename(): String {
        "interface I2"
    }
}
@Deprecated["This API will be deprecated soon!!!"]
public interface G2<T> {
    public static func typename(): String {
        "interface G2<T>"
    }
}

@Deprecated["This API is deprecated.", strict: true]
public interface I3 {
    public static func typename(): String {
        "interface I3"
    }
}
@Deprecated["This API is deprecated.", strict: true]
public interface G3<T> {
    public static func typename(): String {
        "interface G3<T>"
    }
}

