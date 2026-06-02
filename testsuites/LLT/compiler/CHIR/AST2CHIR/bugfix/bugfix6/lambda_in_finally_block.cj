// LEVEL: 0
// EXEC: %compiler %cmp_opt %overflowOpt %enableO2 %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

public var var_1716904667055_43: Byte = UInt8(UInt8(230))
public var var_1716904667055_165: Int64 = Int64(79)

public func func_1716904667055_21(optionalParam_1716904667055_22: Float32): Int64 { // block id: 32
    var var_1716904667055_47: UInt8 = UInt8(8);
    try { // block id: 34
        var loopTimeVar_1716904667055_50: Int64 = 0;
        while ((false) && loopTimeVar_1716904667055_50 < 100) {
            var_1716904667055_43 <<= ((var_1716904667055_47) & 7)
        };
    } finally { // block id: 56
        let var_1716904667055_145: Int16 = Int16(-32);
        {
            lambdaParameter_1716904667055_135: Int64 =>
            var var_1716904667055_170: UInt32 = UInt32(Int32(UInt16(171)));
            match (var_1716904667055_145) {
                case 10 =>
                    var_1716904667055_165 *= Int64(-114)
                    1u16
                case _ => 15u16
            }
        }(26);
    };
    1
}

main(): Int64 {
    func_1716904667055_21(Float32(56.0))
    return 0;
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
