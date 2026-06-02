// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC-PIPE-0: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC-PIPE-0: %compiler %cmp_opt_chir2hlir %f %cffi-link -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args

@C
struct Data {
    public Data(public var c: UInt32,
        public var i8: Int8,
        public var ui8: UInt8,
        public var i16: Int16,
        public var ui16: UInt16) {
        this.c = UInt32(c)
        this.i8 = i8
        this.ui8 = ui8
        this.i16 = i16
        this.ui16 = ui16
    }
}

foreign {
    func Update(n: Int8, pst: CPointer<Data>): CPointer<Data>
    func MallocWithZero(size: UIntNative): CPointer<Int8>
    func free(cp: CPointer<Unit>): Unit
}

unsafe main():Int64 {
    var struct1 = Data(UInt32(r'a'), 127, 255, 32767, 65535)

    var pa = CPointer<Data>(MallocWithZero(16))
    pa.write(struct1)

    var pb = Update(11, pa)

    if ( (pb.read().c == UInt32(r'b')) && (pb.read().i8 == 116) && (pb.read().ui8 == 244) && (pb.read().i16 == 32756) && (pb.read().ui16 == 65524) ) {
        free(CPointer<Unit>(pa))
        return 0   
    } else {
        return 1
    }
}
