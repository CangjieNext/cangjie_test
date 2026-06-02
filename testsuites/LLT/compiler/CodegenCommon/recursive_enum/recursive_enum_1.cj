// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 
// ASSERT: scan 116
public enum Enum_1702393864588_255 {
    defaultValue
    | enumValue_1702393864588_553(Enum_1702393864588_416)
}

public enum Enum_1702393864588_416 {
    defaultValue
    | enumValue_1702393864588_421(
        Option<(Unit, (UInt32, Enum_1702393864588_255), Interface_1702393864588_104, Enum_1702393864588_255)>)
}

public interface Interface_1702393864588_104 {
    static func func_1702393864588_290(): Int8 { // block id: 291
        let var_1702393864588_419: Enum_1702393864588_416 = Enum_1702393864588_416.enumValue_1702393864588_421(
            (UInt32(115) as (Unit, (UInt32, Enum_1702393864588_255), Interface_1702393864588_104, Enum_1702393864588_255)));
        Int8(match (var_1702393864588_419) {
            case defaultValue => UInt8(226)

            case _ => UInt8(116)
        })
    }
}

main() {
    println(Interface_1702393864588_104.func_1702393864588_290())
    0
}
