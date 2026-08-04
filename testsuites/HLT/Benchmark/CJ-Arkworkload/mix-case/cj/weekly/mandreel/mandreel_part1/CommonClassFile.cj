/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*

public class CommonVariable {
    public var r_g0:Int64 = 0;
    public var f_g0:Float64 = 0.0;
    public var r_g1:Int64 = 0;
    public var heapNewPos:Int64 = 512;
    public var abort:Bool = false;
    public var mandreelDisableSpaceKey:Bool = true;
    public var mandreelFatData:String = "";
    public var g_mandreel_working_folder:String = "DataPC/";
    public var Mandreel_currentTime:Int64 = 0;
    public var mandreelPauseTimes: ArrayList<Float64> = ArrayList<Float64>()
    public var mandreelSampleTimeStart: Float64 = 0.0
    public var MandreelAudioDriver:String = "null";
    public var mandreelAppPlatform:String = "webgl";
    public var g_addr_emit:Int64 = 0;

}
extend<T> CPointer<T> {
    public operator func [](index: Int64): T {
        unsafe {
            this.read(index)
        }
    }
    public operator func [](index: Int64, value!: T): Unit {
        unsafe {
            this.write(index, value)
        }
    }

    public operator func [](index: Int32): T {
        unsafe {
            this.read(Int64(index))
        }
    }
    public operator func [](index: Int32, value!: T): Unit {
        unsafe {
            this.write(Int64(index), value)
        }
    }
}
public class HeapClass {
    public var heap:CPointer<Unit> = CPointer<Unit>()
    public var size: Int64 = 0
    public prop heap8: CPointer<Int8> {
        get() {
            CPointer<Int8>(this.heap)
        }
    }
    public prop heapU8: CPointer<UInt8> {
        get() {
            CPointer<UInt8>(this.heap)
        }
    }
    public prop heap16: CPointer<Int16> {
        get() {
            CPointer<Int16>(this.heap)
        }
    }
    public prop heapU16: CPointer<UInt16> {
        get() {
            CPointer<UInt16>(this.heap)
        }
    }
    public prop heap32: CPointer<Int32> {
        get() {
            CPointer<Int32>(this.heap)
        }
    }
    public prop heapU32: CPointer<UInt32> {
        get() {
            CPointer<UInt32>(this.heap)
        }
    }
    public prop heap64: CPointer<Int64> {
        get() {
            CPointer<Int64>(this.heap)
        }
    }
    public prop heapFloat: CPointer<Float32> {
        get() {
            CPointer<Float32>(this.heap)
        }
    }
    public prop heapFloat64: CPointer<Float64> {
        get() {
            CPointer<Float64>(this.heap)
        }
    }
    public var my_heap: CPointer<Unit> = CPointer<Unit>()
    public prop my_heap8: CPointer<Int8> {
        get() {
            CPointer<Int8>(this.my_heap)
        }
    }
    public prop my_heap32: CPointer<Int32> {
        get() {
            CPointer<Int32>(this.my_heap)
        }
    }
}

public let heapClassInst =  HeapClass()
public let commonVariable = CommonVariable()

func null_mandreel_audio(sp:Int64) : Unit
{
    commonVariable.r_g0 = 0;
}

func _mandreel_audio_useMusicFunctions(sp:Int64) : Unit
{
    commonVariable.r_g0 = 0;
}
