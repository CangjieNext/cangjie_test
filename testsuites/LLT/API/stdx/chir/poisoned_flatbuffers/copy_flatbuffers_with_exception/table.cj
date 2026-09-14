// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package flatbuffers
public let SIZE_OF_OFFSET: UInt32 = 4
public let SIZE_OF_UINT32: UInt32 = 4


/*
 * Table wraps a byte slice and provides read access to its data.
 */
public class Table {
    public var bytes: Array<UInt8>
    public var pos: UInt32

    public init(buf: Array<UInt8>, position: UInt32) {
        this.bytes = buf
        this.pos = position
    }

    /*
     * Return the field's offset from Pos stored in vtable slot.
     */
    public func offset(slot: UInt16): UInt16 {
        let vtableRoot: UInt32 = UInt32(Int64(this.pos) - Int64(this.getSOffset(this.pos)))
        // NOTE: the slot should be less than the size of vtable.
        if (slot < this.getUInt16(vtableRoot)) {
            return this.getUInt16(vtableRoot + UInt32(slot))
        }
        return 0
    }

    public func getIndirect(offsetVal: UInt32): UInt32 {
        return offsetVal + getUOffset(offsetVal)
    }

    public func getByteVector(offsetVal: UInt32): Array<UInt8> {
        let ref: UInt32 = this.getIndirect(offsetVal)
        let start: UInt32 = ref + SIZE_OF_OFFSET
        let length: UInt32 = this.getUInt32(ref)
        return this.bytes[Int64(start)..Int64(start + length)]
    }

    public func getVectorLenBySlot(slot: UInt16): Int64 {
        let offsetVal: UInt16 = this.offset(slot)
        if (offsetVal == 0) {
            return 0
        }
        let lenPos: UInt32 = this.getIndirect(UInt32(offsetVal) + this.pos)
        return Int64(getUInt32(this.bytes[Int64(lenPos)..Int64(lenPos + 4)]))
    }

    public func getVectorStartBySlot(slot: UInt16): UInt32 {
        let offsetVal: UInt16 = this.offset(slot)
        if (offsetVal == 0) {
            return 0
        }
        let lenPos: UInt32 = this.getIndirect(UInt32(offsetVal) + this.pos)
        return lenPos + SIZE_OF_UINT32
    }

    public func getString(offsetVal: UInt32): String {
        let byteArray: Array<UInt8> = this.getByteVector(offsetVal)
        return String.fromUtf8(byteArray)
    }

    public func getUInt8(offsetVal: UInt32): UInt8 {
        return getUInt8(this.bytes[Int64(offsetVal)..Int64(offsetVal + 1)])
    }

    @OverflowWrapping
    public func getInt8(offsetVal: UInt32): Int8 {
        return Int8(getUInt8(offsetVal))
    }

    public func getBool(offsetVal: UInt32): Bool {
        return getBool(this.bytes[Int64(offsetVal)..Int64(offsetVal + 1)])
    }

    public func getUInt16(offsetVal: UInt32): UInt16 {
        return getUInt16(this.bytes[Int64(offsetVal)..Int64(offsetVal + 2)])
    }

    @OverflowWrapping
    public func getInt16(offsetVal: UInt32): Int16 {
        return Int16(getUInt16(offsetVal))
    }

    public func getUInt32(offsetVal: UInt32): UInt32 {
        return getUInt32(this.bytes[Int64(offsetVal)..Int64(offsetVal + 4)])
    }  
    
    @OverflowWrapping
    public func getInt32(offsetVal: UInt32): Int32 {
        return Int32(getUInt32(offsetVal))
    }

    public func getUInt64(offsetVal: UInt32): UInt64 {
        return getUInt64(this.bytes[Int64(offsetVal)..Int64(offsetVal + 8)])
    }

    @OverflowWrapping
    public func getInt64(offsetVal: UInt32): Int64 {
        return Int64(getUInt64(offsetVal))
    }

    public func getFloat32(offsetVal: UInt32): Float32 {
        return getFloat32(this.bytes[Int64(offsetVal)..Int64(offsetVal + 4)])
    }

    public func getFloat64(offsetVal: UInt32): Float64 {
        return getFloat64(this.bytes[Int64(offsetVal)..Int64(offsetVal + 8)])
    }

    public func getUInt8Slot(slot: UInt16, default: UInt8): UInt8 {
        let offsetVal: UInt16 = this.offset(slot)
        if (offsetVal == 0) {
            return default
        }
        return this.getUInt8(this.pos + UInt32(offsetVal))
    }
    
    public func getInt8Slot(slot: UInt16, default: Int8): Int8 {
        let offsetVal: UInt16 = this.offset(slot)
        if (offsetVal == 0) {
            return default
        }
        return this.getInt8(this.pos + UInt32(offsetVal))
    }  
    
    public func getBoolSlot(slot: UInt16, default: Bool): Bool {
        let offsetVal: UInt16 = this.offset(slot)
        if (offsetVal == 0) {
            return default
        }
        return this.getBool(this.pos + UInt32(offsetVal))
    }

    public func getUInt16Slot(slot: UInt16, default: UInt16): UInt16 {
        let offsetVal: UInt16 = this.offset(slot)
        if (offsetVal == 0) {
            return default
        }
        return this.getUInt16(this.pos + UInt32(offsetVal))
    }
    
    public func getInt16Slot(slot: UInt16, default: Int16): Int16 {
        let offsetVal: UInt16 = this.offset(slot)
        if (offsetVal == 0) {
            return default
        }
        return this.getInt16(this.pos + UInt32(offsetVal))
    }

    public func getUInt32Slot(slot: UInt16, default: UInt32): UInt32 {
        let offsetVal: UInt16 = this.offset(slot)
        if (offsetVal == 0) {
            return default
        }
        return this.getUInt32(this.pos + UInt32(offsetVal))
    }

    public func getInt32Slot(slot: UInt16, default: Int32): Int32 {
        let offsetVal: UInt16 = this.offset(slot)
        if (offsetVal == 0) {
            return default
        }
        return this.getInt32(this.pos + UInt32(offsetVal))
    }

    public func getUInt64Slot(slot: UInt16, default: UInt64): UInt64 { 
        let offsetVal: UInt16 = this.offset(slot)
        if (offsetVal == 0) {
            return default
        }
        return getUInt64(this.pos + UInt32(offsetVal))
    }

    public func getInt64Slot(slot: UInt16, default: Int64): Int64 { 
        let offsetVal: UInt16 = this.offset(slot)
        if (offsetVal == 0) {
            return default
        }
        return getInt64(this.pos + UInt32(offsetVal))
    }  

    public func getFloat32Slot(slot: UInt16, default: Float32): Float32 { 
        let offsetVal: UInt16 = this.offset(slot)
        if (offsetVal == 0) {
            return default
        }
        return getFloat32(this.pos + UInt32(offsetVal))
    }  

    public func getFloat64Slot(slot: UInt16, default: Float64): Float64 { 
        let offsetVal: UInt16 = this.offset(slot)
        if (offsetVal == 0) {
            return default
        }
        return getFloat64(this.pos + UInt32(offsetVal))
    }  

    /*
     * Return the signed offset of table from offsetVal.
     */
    private func getSOffset(offsetVal: UInt32): Int32 {
        return getInt32(this.bytes[Int64(offsetVal)..Int64(offsetVal + 4)])
    }

    /* 
     * Return the unsigned offset of table from offsetVal.
     */
    private func getUOffset(offsetVal: UInt32): UInt32 {
        return getUInt32(this.bytes[Int64(offsetVal)..Int64(offsetVal + 4)])
    }

    public func getUnion(offsetVal: UInt32): FlatBufferObject {
        FlatBufferObject(bytes, getIndirect(offsetVal))
    }
}
