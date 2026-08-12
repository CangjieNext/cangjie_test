/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*

func _ZN14btQuantizedBvh16deSerializeFloatER23btQuantizedBvhFloatData(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
    var r4:Int64 = 0
    var r5:Int64 = 0
    var r6:Int64 = 0
    var r7:Int64 = 0
    var r8:Int64 = 0
    var r9:Int64 = 0
    var r10:Int64 = 0
    var r11:Int64 = 0
    var r12:Int64 = 0
    var r13:Int64 = 0
    var r14:Int64 = 0
    var r15:Int64 = 0
    var r16:Int64 = 0
    var r17:Int64 = 0
    var r18:Int64 = 0
var __label__ = 0;
    i7 = sp + (-16);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap32[(fp+1)]);
    r1 = r1 >> 2;
    r2 = r0 >> 2;
    heapClassInst.heap32[(r2+5)] = heapClassInst.heap32[(r1+4)];
    heapClassInst.heap32[(r2+6)] = heapClassInst.heap32[(r1+5)];
    heapClassInst.heap32[(r2+7)] = heapClassInst.heap32[(r1+6)];
    heapClassInst.heap32[(r2+8)] = heapClassInst.heap32[(r1+7)];
    heapClassInst.heap32[(r2+1)] = heapClassInst.heap32[(r1)];
    heapClassInst.heap32[(r2+2)] = heapClassInst.heap32[(r1+1)];
    heapClassInst.heap32[(r2+3)] = heapClassInst.heap32[(r1+2)];
    heapClassInst.heap32[(r2+4)] = heapClassInst.heap32[(r1+3)];
    heapClassInst.heap32[(r2+9)] = heapClassInst.heap32[(r1+8)];
    heapClassInst.heap32[(r2+10)] = heapClassInst.heap32[(r1+9)];
    heapClassInst.heap32[(r2+11)] = heapClassInst.heap32[(r1+10)];
    heapClassInst.heap32[(r2+12)] = heapClassInst.heap32[(r1+11)];
    r3 = Int64(heapClassInst.heap32[(r1+12)]);
    heapClassInst.heap32[(r2+14)] = Int32(r3);
    r3 = 0;
    r4 = Int64(heapClassInst.heap32[(r1+13)]);
    r4 = if (r4 != r3) {1} else {0};
    r4 = r4 & 1;
    heapClassInst.heap8[r0+60] = Int8(r4);
    r4 = Int64(heapClassInst.heap32[(r2+22)]);
    r5 = Int64(heapClassInst.heap32[(r1+14)]);
if(!(r4 >= r5)) 
{
    r6 = Int64(heapClassInst.heap32[(r2+23)]);
if(!(r6 >= r5)) 
{
    if(r5 != 0) 
{
    r6 = gNumAlignedAllocs;
    r6 = r6 >> 2;
    r7 = Int64(heapClassInst.heap32[(r6)]);
    r7 = (r7 + 1)|0;
    r8 = r5 << 6;
    heapClassInst.heap32[(r6)] = Int32(r7);
    r6 = r8 | 19;
    heapClassInst.heap32[(g0)] = Int32(r6);
    mallocNew(i7);
    r6 = commonVariable.r_g0;
    if(r6 != 0) 
{
    r7 = 0;
    r8 = (r6 + 4)|0;
    r7 = (r7 - r8)|0;
    r7 = r7 & 15;
    r7 = (r6 + r7)|0;
    r8 = (r7 + 4)|0;
    r7 = r7 >> 2;
    heapClassInst.heap32[(r7)] = Int32(r6);
    r6 = r8;
}
}
else{
    r6 = 0;
}
    r7 = (r0 + 96)|0;
    if(r4 < 1) 
{
    r4 = r7 >> 2;
    r9 = Int64(heapClassInst.heap32[(r4)]);
}
else{
    r8 = 0;
while(true){
    r9 = r7 >> 2;
    r9 = Int64(heapClassInst.heap32[(r9)]);
    r10 = (r6 + r8)|0;
    r11 = (r9 + r8)|0;
    heapClassInst.heap32[(g0)] = Int32(r10);
    heapClassInst.heap32[(g0+1)] = Int32(r11);
    heapClassInst.heap32[(g0+2)] = 64;
    r4 = (r4 + (-1))|0;
    r8 = (r8 + 64)|0;
    memcpy(i7);
if(!(r4 != 0)) 
{
break 
}
}
    r7 = (r0 + 96)|0;
}
if(!(r9 == 0)) 
{
    r4 = Int64(heapClassInst.heapU8[r0+100]);
if(!(r4 == 0)) 
{
    r4 = gNumAlignedFree;
    r4 = r4 >> 2;
    r8 = Int64(heapClassInst.heap32[(r4)]);
    r8 = (r8 + 1)|0;
    r9 = r9 >> 2;
    heapClassInst.heap32[(r4)] = Int32(r8);
    r4 = Int64(heapClassInst.heap32[(r9+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r4);
    free(i7);
}
    r4 = r7 >> 2;
    heapClassInst.heap32[(r4)] = 0;
}
    r4 = 1;
    r7 = r7 >> 2;
    heapClassInst.heap8[r0+100] = Int8(r4);
    heapClassInst.heap32[(r7)] = Int32(r6);
    heapClassInst.heap32[(r2+23)] = Int32(r5);
}
}
    heapClassInst.heap32[(r2+22)] = Int32(r5);
do {
if(!(r5 < 1)) 
{
    r4 = 0;
    r6 = Int64(heapClassInst.heap32[(r1+16)]);
    r5 = (r4 - r5)|0;
while(true){
    r7 = (r4 * ( -12))|0;
    r7 = r7 << 2;
    r8 = r4 << 6;
    r9 = Int64(heapClassInst.heap32[(r2+24)]);
    r7 = (r6 + r7)|0;
    r9 = (r9 - r8)|0;
    r7 = r7 >> 2;
    r9 = r9 >> 2;
    heapClassInst.heap32[(r9+4)] = heapClassInst.heap32[(r7+4)];
    heapClassInst.heap32[(r9+5)] = heapClassInst.heap32[(r7+5)];
    heapClassInst.heap32[(r9+6)] = heapClassInst.heap32[(r7+6)];
    heapClassInst.heap32[(r9+7)] = heapClassInst.heap32[(r7+7)];
    r9 = Int64(heapClassInst.heap32[(r2+24)]);
    r9 = (r9 - r8)|0;
    r9 = r9 >> 2;
    heapClassInst.heap32[(r9)] = heapClassInst.heap32[(r7)];
    heapClassInst.heap32[(r9+1)] = heapClassInst.heap32[(r7+1)];
    heapClassInst.heap32[(r9+2)] = heapClassInst.heap32[(r7+2)];
    heapClassInst.heap32[(r9+3)] = heapClassInst.heap32[(r7+3)];
    r9 = Int64(heapClassInst.heap32[(r2+24)]);
    r9 = (r9 - r8)|0;
    r10 = Int64(heapClassInst.heap32[(r7+8)]);
    r9 = r9 >> 2;
    heapClassInst.heap32[(r9+8)] = Int32(r10);
    r9 = Int64(heapClassInst.heap32[(r2+24)]);
    r9 = (r9 - r8)|0;
    r10 = Int64(heapClassInst.heap32[(r7+9)]);
    r9 = r9 >> 2;
    heapClassInst.heap32[(r9+9)] = Int32(r10);
    r9 = Int64(heapClassInst.heap32[(r2+24)]);
    r8 = (r9 - r8)|0;
    r7 = Int64(heapClassInst.heap32[(r7+10)]);
    r4 = (r4 + (-1))|0;
    r8 = r8 >> 2;
    heapClassInst.heap32[(r8+10)] = Int32(r7);
    if(r5 != r4) 
{
continue 
}
else{
break 
}
}
}
} while(false);
    r4 = Int64(heapClassInst.heap32[(r2+32)]);
    r5 = Int64(heapClassInst.heap32[(r1+15)]);
do {
if(!(r4 >= r5)) 
{
    r6 = (r0 + 124)|0;
    heapClassInst.heap32[(g0)] = Int32(r6);
    heapClassInst.heap32[(g0+1)] = Int32(r5);
    r6 = (r5 - r4)|0;
    r4 = r4 << 4;
    _ZN20btAlignedObjectArrayI18btQuantizedBvhNodeE7reserveEi(i7);
while(true){
    r7 = Int64(heapClassInst.heap32[(r2+34)]);
    r7 = (r7 + r4)|0;
    r7 = r7 >> 2;
    r6 = (r6 + (-1))|0;
    r4 = (r4 + 16)|0;
    heapClassInst.heap32[(r7)] = 0;
    heapClassInst.heap32[(r7+1)] = 0;
    heapClassInst.heap32[(r7+2)] = 0;
    heapClassInst.heap32[(r7+3)] = 0;
    if(r6 != 0) 
{
continue 
}
else{
break 
}
}
}
} while(false);
    heapClassInst.heap32[(r2+32)] = Int32(r5);
do {
if(!(r5 < 1)) 
{
    r4 = 0;
    r6 = Int64(heapClassInst.heap32[(r1+17)]);
    r5 = (r4 - r5)|0;
while(true){
    r7 = r4 << 4;
    r8 = (r6 - r7)|0;
    r9 = r8 >> 2;
    r10 = Int64(heapClassInst.heap32[(r2+34)]);
    r10 = (r10 - r7)|0;
    r9 = Int64(heapClassInst.heap32[(r9+3)]);
    r10 = r10 >> 2;
    heapClassInst.heap32[(r10+3)] = Int32(r9);
    r9 = Int64(heapClassInst.heap32[(r2+34)]);
    r10 = Int64(heapClassInst.heapU16[(r8+6)>>1]);
    r9 = (r9 - r7)|0;
    heapClassInst.heap16[(r9+6)>>1] = Int16(r10);
    r9 = Int64(heapClassInst.heap32[(r2+34)]);
    r10 = Int64(heapClassInst.heapU16[(r8+8)>>1]);
    r9 = (r9 - r7)|0;
    heapClassInst.heap16[(r9+8)>>1] = Int16(r10);
    r9 = Int64(heapClassInst.heap32[(r2+34)]);
    r10 = Int64(heapClassInst.heapU16[(r8+10)>>1]);
    r9 = (r9 - r7)|0;
    heapClassInst.heap16[(r9+10)>>1] = Int16(r10);
    r9 = Int64(heapClassInst.heap32[(r2+34)]);
    r10 = Int64(heapClassInst.heapU16[(r8)>>1]);
    r9 = (r9 - r7)|0;
    heapClassInst.heap16[(r9)>>1] = Int16(r10);
    r9 = Int64(heapClassInst.heap32[(r2+34)]);
    r10 = Int64(heapClassInst.heapU16[(r8+2)>>1]);
    r9 = (r9 - r7)|0;
    heapClassInst.heap16[(r9+2)>>1] = Int16(r10);
    r9 = Int64(heapClassInst.heap32[(r2+34)]);
    r8 = Int64(heapClassInst.heapU16[(r8+4)>>1]);
    r4 = (r4 + (-1))|0;
    r7 = (r9 - r7)|0;
    heapClassInst.heap16[(r7+4)>>1] = Int16(r8);
    if(r5 != r4) 
{
continue 
}
else{
break 
}
}
}
} while(false);
    r4 = Int64(heapClassInst.heap32[(r1+19)]);
    heapClassInst.heap32[(r2+36)] = Int32(r4);
    r4 = Int64(heapClassInst.heap32[(r2+38)]);
    r5 = Int64(heapClassInst.heap32[(r1+20)]);
if(!(r4 >= r5)) 
{
    r6 = Int64(heapClassInst.heap32[(r2+39)]);
if(!(r6 >= r5)) 
{
    if(r5 != 0) 
{
    r6 = gNumAlignedAllocs;
    r6 = r6 >> 2;
    r7 = Int64(heapClassInst.heap32[(r6)]);
    r7 = (r7 + 1)|0;
    r8 = r5 << 5;
    heapClassInst.heap32[(r6)] = Int32(r7);
    r6 = r8 | 19;
    heapClassInst.heap32[(g0)] = Int32(r6);
    mallocNew(i7);
    r6 = commonVariable.r_g0;
    if(r6 != 0) 
{
    r7 = 0;
    r8 = (r6 + 4)|0;
    r7 = (r7 - r8)|0;
    r7 = r7 & 15;
    r7 = (r6 + r7)|0;
    r8 = (r7 + 4)|0;
    r7 = r7 >> 2;
    heapClassInst.heap32[(r7)] = Int32(r6);
    r6 = r8;
}
}
else{
    r6 = 0;
}
    r7 = (r0 + 160)|0;
    if(r4 < 1) 
{
    r4 = r7 >> 2;
    r9 = Int64(heapClassInst.heap32[(r4)]);
}
else{
    r8 = 0;
while(true){
    r9 = r7 >> 2;
    r9 = Int64(heapClassInst.heap32[(r9)]);
    r10 = (r9 + r8)|0;
    r10 = r10 >> 2;
    r11 = (r6 + r8)|0;
    r4 = (r4 + (-1))|0;
    r8 = (r8 + 32)|0;
    r12 = Int64(heapClassInst.heap32[(r10)]);
    r11 = r11 >> 2;
    r13 = Int64(heapClassInst.heap32[(r10+1)]);
    r14 = Int64(heapClassInst.heap32[(r10+2)]);
    r15 = Int64(heapClassInst.heap32[(r10+3)]);
    r16 = Int64(heapClassInst.heap32[(r10+4)]);
    r17 = Int64(heapClassInst.heap32[(r10+5)]);
    r18 = Int64(heapClassInst.heap32[(r10+6)]);
    r10 = Int64(heapClassInst.heap32[(r10+7)]);
    heapClassInst.heap32[(r11)] = Int32(r12);
    heapClassInst.heap32[(r11+1)] = Int32(r13);
    heapClassInst.heap32[(r11+2)] = Int32(r14);
    heapClassInst.heap32[(r11+3)] = Int32(r15);
    heapClassInst.heap32[(r11+4)] = Int32(r16);
    heapClassInst.heap32[(r11+5)] = Int32(r17);
    heapClassInst.heap32[(r11+6)] = Int32(r18);
    heapClassInst.heap32[(r11+7)] = Int32(r10);
if(!(r4 != 0)) 
{
break 
}
}
    r7 = (r0 + 160)|0;
}
if(!(r9 == 0)) 
{
    r4 = Int64(heapClassInst.heapU8[r0+164]);
if(!(r4 == 0)) 
{
    r4 = gNumAlignedFree;
    r4 = r4 >> 2;
    r8 = Int64(heapClassInst.heap32[(r4)]);
    r8 = (r8 + 1)|0;
    r9 = r9 >> 2;
    heapClassInst.heap32[(r4)] = Int32(r8);
    r4 = Int64(heapClassInst.heap32[(r9+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r4);
    free(i7);
}
    r4 = r7 >> 2;
    heapClassInst.heap32[(r4)] = 0;
}
    r4 = 1;
    r7 = r7 >> 2;
    heapClassInst.heap8[r0+164] = Int8(r4);
    heapClassInst.heap32[(r7)] = Int32(r6);
    heapClassInst.heap32[(r2+39)] = Int32(r5);
}
}
    heapClassInst.heap32[(r2+38)] = Int32(r5);
do {
if(!(r5 < 1)) 
{
    r0 = Int64(heapClassInst.heap32[(r1+18)]);
    r1 = (r3 - r5)|0;
while(true){
    r4 = (r3 * ( -10))|0;
    r4 = r4 << 1;
    r4 = (r0 + r4)|0;
    r5 = r3 << 5;
    r6 = Int64(heapClassInst.heap32[(r2+40)]);
    r7 = Int64(heapClassInst.heapU16[(r4+14)>>1]);
    r6 = (r6 - r5)|0;
    heapClassInst.heap16[(r6+6)>>1] = Int16(r7);
    r6 = Int64(heapClassInst.heap32[(r2+40)]);
    r7 = Int64(heapClassInst.heapU16[(r4+16)>>1]);
    r6 = (r6 - r5)|0;
    heapClassInst.heap16[(r6+8)>>1] = Int16(r7);
    r6 = Int64(heapClassInst.heap32[(r2+40)]);
    r7 = Int64(heapClassInst.heapU16[(r4+18)>>1]);
    r6 = (r6 - r5)|0;
    heapClassInst.heap16[(r6+10)>>1] = Int16(r7);
    r6 = Int64(heapClassInst.heap32[(r2+40)]);
    r7 = Int64(heapClassInst.heapU16[(r4+8)>>1]);
    r6 = (r6 - r5)|0;
    heapClassInst.heap16[(r6)>>1] = Int16(r7);
    r6 = Int64(heapClassInst.heap32[(r2+40)]);
    r7 = Int64(heapClassInst.heapU16[(r4+10)>>1]);
    r6 = (r6 - r5)|0;
    heapClassInst.heap16[(r6+2)>>1] = Int16(r7);
    r6 = (r3 * ( -5))|0;
    r7 = Int64(heapClassInst.heap32[(r2+40)]);
    r4 = Int64(heapClassInst.heapU16[(r4+12)>>1]);
    r6 = r6 << 2;
    r7 = (r7 - r5)|0;
    r6 = (r0 + r6)|0;
    heapClassInst.heap16[(r7+4)>>1] = Int16(r4);
    r4 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r2+40)]);
    r6 = (r6 - r5)|0;
    r7 = Int64(heapClassInst.heap32[(r4)]);
    r6 = r6 >> 2;
    heapClassInst.heap32[(r6+3)] = Int32(r7);
    r6 = Int64(heapClassInst.heap32[(r2+40)]);
    r5 = (r6 - r5)|0;
    r4 = Int64(heapClassInst.heap32[(r4+1)]);
    r3 = (r3 + (-1))|0;
    r5 = r5 >> 2;
    heapClassInst.heap32[(r5+4)] = Int32(r4);
    if(r1 != r3) 
{
continue 
}
else{
break 
}
}
}
} while(false);
    return;
}

func _ZN14btQuantizedBvh17deSerializeDoubleER24btQuantizedBvhDoubleData(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
    var r4:Int64 = 0
    var r5:Int64 = 0
    var r6:Int64 = 0
    var r7:Int64 = 0
    var r8:Int64 = 0
    var r9:Int64 = 0
    var r10:Int64 = 0
    var r11:Int64 = 0
    var r12:Int64 = 0
    var r13:Int64 = 0
    var r14:Int64 = 0
    var r15:Int64 = 0
    var r16:Int64 = 0
    var r17:Int64 = 0
    var r18:Int64 = 0
    var f0:Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-16);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp+1)]);
    r1 = Int64(heapClassInst.heap32[(fp)]);
    f0 = llvm_readDouble((r0+32));
    r2 = r1 >> 2;
    f0 = Float64(f0.toBits()); 
    heapClassInst.heapFloat[(r2+5)] = Float32(f0);
    f0 = llvm_readDouble((r0+40));
    f0 = Float64(f0.toBits()); 
    heapClassInst.heapFloat[(r2+6)] = Float32(f0);
    f0 = llvm_readDouble((r0+48));
    f0 = Float64(f0.toBits()); 
    heapClassInst.heapFloat[(r2+7)] = Float32(f0);
    f0 = llvm_readDouble((r0+56));
    f0 = Float64(f0.toBits()); 
    heapClassInst.heapFloat[(r2+8)] = Float32(f0);
    f0 = llvm_readDouble((r0));
    f0 = Float64(f0.toBits()); 
    heapClassInst.heapFloat[(r2+1)] = Float32(f0);
    f0 = llvm_readDouble((r0+8));
    f0 = Float64(f0.toBits()); 
    heapClassInst.heapFloat[(r2+2)] = Float32(f0);
    f0 = llvm_readDouble((r0+16));
    f0 = Float64(f0.toBits()); 
    heapClassInst.heapFloat[(r2+3)] = Float32(f0);
    f0 = llvm_readDouble((r0+24));
    f0 = Float64(f0.toBits()); 
    heapClassInst.heapFloat[(r2+4)] = Float32(f0);
    f0 = llvm_readDouble((r0+64));
    f0 = Float64(f0.toBits()); 
    heapClassInst.heapFloat[(r2+9)] = Float32(f0);
    f0 = llvm_readDouble((r0+72));
    f0 = Float64(f0.toBits()); 
    heapClassInst.heapFloat[(r2+10)] = Float32(f0);
    f0 = llvm_readDouble((r0+80));
    f0 = Float64(f0.toBits()); 
    heapClassInst.heapFloat[(r2+11)] = Float32(f0);
    f0 = llvm_readDouble((r0+88));
    f0 = Float64(f0.toBits()); 
    r0 = r0 >> 2;
    heapClassInst.heapFloat[(r2+12)] = Float32(f0);
    r3 = Int64(heapClassInst.heap32[(r0+24)]);
    heapClassInst.heap32[(r2+14)] = Int32(r3);
    r3 = 0;
    r4 = Int64(heapClassInst.heap32[(r0+25)]);
    r4 = if (r4 != r3) {1} else {0};
    r4 = r4 & 1;
    heapClassInst.heap8[r1+60] = Int8(r4);
    r4 = Int64(heapClassInst.heap32[(r2+22)]);
    r5 = Int64(heapClassInst.heap32[(r0+26)]);
if(!(r4 >= r5)) 
{
    r6 = Int64(heapClassInst.heap32[(r2+23)]);
if(!(r6 >= r5)) 
{
    if(r5 != 0) 
{
    r6 = gNumAlignedAllocs;
    r6 = r6 >> 2;
    r7 = Int64(heapClassInst.heap32[(r6)]);
    r7 = (r7 + 1)|0;
    r8 = r5 << 6;
    heapClassInst.heap32[(r6)] = Int32(r7);
    r6 = r8 | 19;
    heapClassInst.heap32[(g0)] = Int32(r6);
    mallocNew(i7);
    r6 = commonVariable.r_g0;
    if(r6 != 0) 
{
    r7 = 0;
    r8 = (r6 + 4)|0;
    r7 = (r7 - r8)|0;
    r7 = r7 & 15;
    r7 = (r6 + r7)|0;
    r8 = (r7 + 4)|0;
    r7 = r7 >> 2;
    heapClassInst.heap32[(r7)] = Int32(r6);
    r6 = r8;
}
}
else{
    r6 = 0;
}
    r7 = (r1 + 96)|0;
    if(r4 < 1) 
{
    r4 = r7 >> 2;
    r9 = Int64(heapClassInst.heap32[(r4)]);
}
else{
    r8 = 0;
while(true){
    r9 = r7 >> 2;
    r9 = Int64(heapClassInst.heap32[(r9)]);
    r10 = (r6 + r8)|0;
    r11 = (r9 + r8)|0;
    heapClassInst.heap32[(g0)] = Int32(r10);
    heapClassInst.heap32[(g0+1)] = Int32(r11);
    heapClassInst.heap32[(g0+2)] = 64;
    r4 = (r4 + (-1))|0;
    r8 = (r8 + 64)|0;
    memcpy(i7);
if(!(r4 != 0)) 
{
break 
}
}
    r7 = (r1 + 96)|0;
}
if(!(r9 == 0)) 
{
    r4 = Int64(heapClassInst.heapU8[r1+100]);
if(!(r4 == 0)) 
{
    r4 = gNumAlignedFree;
    r4 = r4 >> 2;
    r8 = Int64(heapClassInst.heap32[(r4)]);
    r8 = (r8 + 1)|0;
    r9 = r9 >> 2;
    heapClassInst.heap32[(r4)] = Int32(r8);
    r4 = Int64(heapClassInst.heap32[(r9+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r4);
    free(i7);
}
    r4 = r7 >> 2;
    heapClassInst.heap32[(r4)] = 0;
}
    r4 = 1;
    r7 = r7 >> 2;
    heapClassInst.heap8[r1+100] = Int8(r4);
    heapClassInst.heap32[(r7)] = Int32(r6);
    heapClassInst.heap32[(r2+23)] = Int32(r5);
}
}
    heapClassInst.heap32[(r2+22)] = Int32(r5);
do  {
if(!(r5 < 1)) 
{
    r4 = 0;
    r6 = Int64(heapClassInst.heap32[(r0+28)]);
    r5 = (r4 - r5)|0;
while(true){
    r7 = (r4 * ( -10))|0;
    r7 = r7 << 3;
    r8 = (r6 + r7)|0;
    r9 = r4 << 6;
    r10 = Int64(heapClassInst.heap32[(r2+24)]);
    f0 = llvm_readDouble((r8+32));
    r10 = (r10 - r9)|0;
    r10 = r10 >> 2;
    f0 = Float64(f0.toBits()); 
    heapClassInst.heapFloat[(r10+4)] = Float32(f0);
    f0 = llvm_readDouble((r8+40));
    f0 = Float64(f0.toBits()); 
    heapClassInst.heapFloat[(r10+5)] = Float32(f0);
    f0 = llvm_readDouble((r8+48));
    f0 = Float64(f0.toBits()); 
    heapClassInst.heapFloat[(r10+6)] = Float32(f0);
    f0 = llvm_readDouble((r8+56));
    f0 = Float64(f0.toBits()); 
    heapClassInst.heapFloat[(r10+7)] = Float32(f0);
    r10 = Int64(heapClassInst.heap32[(r2+24)]);
    f0 = llvm_readDouble((r6+r7));
    r7 = (r10 - r9)|0;
    r7 = r7 >> 2;
    f0 = Float64(f0.toBits()); 
    heapClassInst.heapFloat[(r7)] = Float32(f0);
    f0 = llvm_readDouble((r8+8));
    f0 = Float64(f0.toBits()); 
    heapClassInst.heapFloat[(r7+1)] = Float32(f0);
    f0 = llvm_readDouble((r8+16));
    f0 = Float64(f0.toBits()); 
    heapClassInst.heapFloat[(r7+2)] = Float32(f0);
    r10 = (r4 * ( -20))|0;
    f0 = llvm_readDouble((r8+24));
    r8 = r10 << 2;
    f0 = Float64(f0.toBits()); 
    r8 = (r6 + r8)|0;
    heapClassInst.heapFloat[(r7+3)] = Float32(f0);
    r7 = r8 >> 2;
    r8 = Int64(heapClassInst.heap32[(r2+24)]);
    r8 = (r8 - r9)|0;
    r10 = Int64(heapClassInst.heap32[(r7+16)]);
    r8 = r8 >> 2;
    heapClassInst.heap32[(r8+8)] = Int32(r10);
    r8 = Int64(heapClassInst.heap32[(r2+24)]);
    r8 = (r8 - r9)|0;
    r10 = Int64(heapClassInst.heap32[(r7+17)]);
    r8 = r8 >> 2;
    heapClassInst.heap32[(r8+9)] = Int32(r10);
    r8 = Int64(heapClassInst.heap32[(r2+24)]);
    r8 = (r8 - r9)|0;
    r7 = Int64(heapClassInst.heap32[(r7+18)]);
    r4 = (r4 + (-1))|0;
    r8 = r8 >> 2;
    heapClassInst.heap32[(r8+10)] = Int32(r7);
    if(r5 != r4) 
{
continue 
}
else{
break 
}
}
}
} while(false);
    r4 = Int64(heapClassInst.heap32[(r2+32)]);
    r5 = Int64(heapClassInst.heap32[(r0+27)]);
do {
if(!(r4 >= r5)) 
{
    r6 = (r1 + 124)|0;
    heapClassInst.heap32[(g0)] = Int32(r6);
    heapClassInst.heap32[(g0+1)] = Int32(r5);
    r6 = (r5 - r4)|0;
    r4 = r4 << 4;
    _ZN20btAlignedObjectArrayI18btQuantizedBvhNodeE7reserveEi(i7);
while(true){
    r7 = Int64(heapClassInst.heap32[(r2+34)]);
    r7 = (r7 + r4)|0;
    r7 = r7 >> 2;
    r6 = (r6 + (-1))|0;
    r4 = (r4 + 16)|0;
    heapClassInst.heap32[(r7)] = 0;
    heapClassInst.heap32[(r7+1)] = 0;
    heapClassInst.heap32[(r7+2)] = 0;
    heapClassInst.heap32[(r7+3)] = 0;
    if(r6 != 0) 
{
continue 
}
else{
break 
}
}
}
} while(false);
    heapClassInst.heap32[(r2+32)] = Int32(r5);
do {
if(!(r5 < 1)) 
{
    r4 = 0;
    r6 = Int64(heapClassInst.heap32[(r0+29)]);
    r5 = (r4 - r5)|0;
while(true){
    r7 = r4 << 4;
    r8 = (r6 - r7)|0;
    r9 = r8 >> 2;
    r10 = Int64(heapClassInst.heap32[(r2+34)]);
    r10 = (r10 - r7)|0;
    r9 = Int64(heapClassInst.heap32[(r9+3)]);
    r10 = r10 >> 2;
    heapClassInst.heap32[(r10+3)] = Int32(r9);
    r9 = Int64(heapClassInst.heap32[(r2+34)]);
    r10 = Int64(heapClassInst.heapU16[(r8+6)>>1]);
    r9 = (r9 - r7)|0;
    heapClassInst.heap16[(r9+6)>>1] = Int16(r10);
    r9 = Int64(heapClassInst.heap32[(r2+34)]);
    r10 = Int64(heapClassInst.heapU16[(r8+8)>>1]);
    r9 = (r9 - r7)|0;
    heapClassInst.heap16[(r9+8)>>1] = Int16(r10);
    r9 = Int64(heapClassInst.heap32[(r2+34)]);
    r10 = Int64(heapClassInst.heapU16[(r8+10)>>1]);
    r9 = (r9 - r7)|0;
    heapClassInst.heap16[(r9+10)>>1] = Int16(r10);
    r9 = Int64(heapClassInst.heap32[(r2+34)]);
    r10 = Int64(heapClassInst.heapU16[(r8)>>1]);
    r9 = (r9 - r7)|0;
    heapClassInst.heap16[(r9)>>1] = Int16(r10);
    r9 = Int64(heapClassInst.heap32[(r2+34)]);
    r10 = Int64(heapClassInst.heapU16[(r8+2)>>1]);
    r9 = (r9 - r7)|0;
    heapClassInst.heap16[(r9+2)>>1] = Int16(r10);
    r9 = Int64(heapClassInst.heap32[(r2+34)]);
    r8 = Int64(heapClassInst.heapU16[(r8+4)>>1]);
    r4 = (r4 + (-1))|0;
    r7 = (r9 - r7)|0;
    heapClassInst.heap16[(r7+4)>>1] = Int16(r8);
    if(r5 != r4) 
{
continue 
}
else{
break 
}
}
}
} while(false);
    r4 = Int64(heapClassInst.heap32[(r0+30)]);
    heapClassInst.heap32[(r2+36)] = Int32(r4);
    r4 = Int64(heapClassInst.heap32[(r2+38)]);
    r5 = Int64(heapClassInst.heap32[(r0+31)]);
if(!(r4 >= r5)) 
{
    r6 = Int64(heapClassInst.heap32[(r2+39)]);
if(!(r6 >= r5)) 
{
    if(r5 != 0) 
{
    r6 = gNumAlignedAllocs;
    r6 = r6 >> 2;
    r7 = Int64(heapClassInst.heap32[(r6)]);
    r7 = (r7 + 1)|0;
    r8 = r5 << 5;
    heapClassInst.heap32[(r6)] = Int32(r7);
    r6 = r8 | 19;
    heapClassInst.heap32[(g0)] = Int32(r6);
    mallocNew(i7);
    r6 = commonVariable.r_g0;
    if(r6 != 0) 
{
    r7 = 0;
    r8 = (r6 + 4)|0;
    r7 = (r7 - r8)|0;
    r7 = r7 & 15;
    r7 = (r6 + r7)|0;
    r8 = (r7 + 4)|0;
    r7 = r7 >> 2;
    heapClassInst.heap32[(r7)] = Int32(r6);
    r6 = r8;
}
}
else{
    r6 = 0;
}
    r7 = (r1 + 160)|0;
    if(r4 < 1) 
{
    r4 = r7 >> 2;
    r9 = Int64(heapClassInst.heap32[(r4)]);
}
else{
    r8 = 0;
while(true){
    r9 = r7 >> 2;
    r9 = Int64(heapClassInst.heap32[(r9)]);
    r10 = (r9 + r8)|0;
    r10 = r10 >> 2;
    r11 = (r6 + r8)|0;
    r4 = (r4 + (-1))|0;
    r8 = (r8 + 32)|0;
    r12 = Int64(heapClassInst.heap32[(r10)]);
    r11 = r11 >> 2;
    r13 = Int64(heapClassInst.heap32[(r10+1)]);
    r14 = Int64(heapClassInst.heap32[(r10+2)]);
    r15 = Int64(heapClassInst.heap32[(r10+3)]);
    r16 = Int64(heapClassInst.heap32[(r10+4)]);
    r17 = Int64(heapClassInst.heap32[(r10+5)]);
    r18 = Int64(heapClassInst.heap32[(r10+6)]);
    r10 = Int64(heapClassInst.heap32[(r10+7)]);
    heapClassInst.heap32[(r11)] = Int32(r12);
    heapClassInst.heap32[(r11+1)] = Int32(r13);
    heapClassInst.heap32[(r11+2)] = Int32(r14);
    heapClassInst.heap32[(r11+3)] = Int32(r15);
    heapClassInst.heap32[(r11+4)] = Int32(r16);
    heapClassInst.heap32[(r11+5)] = Int32(r17);
    heapClassInst.heap32[(r11+6)] = Int32(r18);
    heapClassInst.heap32[(r11+7)] = Int32(r10);
if(!(r4 != 0)) 
{
break 
}
}
    r7 = (r1 + 160)|0;
}
if(!(r9 == 0)) 
{
    r4 = Int64(heapClassInst.heapU8[r1+164]);
if(!(r4 == 0)) 
{
    r4 = gNumAlignedFree;
    r4 = r4 >> 2;
    r8 = Int64(heapClassInst.heap32[(r4)]);
    r8 = (r8 + 1)|0;
    r9 = r9 >> 2;
    heapClassInst.heap32[(r4)] = Int32(r8);
    r4 = Int64(heapClassInst.heap32[(r9+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r4);
    free(i7);
}
    r4 = r7 >> 2;
    heapClassInst.heap32[(r4)] = 0;
}
    r4 = 1;
    r7 = r7 >> 2;
    heapClassInst.heap8[r1+164] = Int8(r4);
    heapClassInst.heap32[(r7)] = Int32(r6);
    heapClassInst.heap32[(r2+39)] = Int32(r5);
}
}
    heapClassInst.heap32[(r2+38)] = Int32(r5);
do {
if(!(r5 < 1)) 
{
    r0 = Int64(heapClassInst.heap32[(r0+32)]);
    r1 = (r3 - r5)|0;
while(true){
    r4 = (r3 * ( -10))|0;
    r4 = r4 << 1;
    r4 = (r0 + r4)|0;
    r5 = r3 << 5;
    r6 = Int64(heapClassInst.heap32[(r2+40)]);
    r7 = Int64(heapClassInst.heapU16[(r4+14)>>1]);
    r6 = (r6 - r5)|0;
    heapClassInst.heap16[(r6+6)>>1] = Int16(r7);
    r6 = Int64(heapClassInst.heap32[(r2+40)]);
    r7 = Int64(heapClassInst.heapU16[(r4+16)>>1]);
    r6 = (r6 - r5)|0;
    heapClassInst.heap16[(r6+8)>>1] = Int16(r7);
    r6 = Int64(heapClassInst.heap32[(r2+40)]);
    r7 = Int64(heapClassInst.heapU16[(r4+18)>>1]);
    r6 = (r6 - r5)|0;
    heapClassInst.heap16[(r6+10)>>1] = Int16(r7);
    r6 = Int64(heapClassInst.heap32[(r2+40)]);
    r7 = Int64(heapClassInst.heapU16[(r4+8)>>1]);
    r6 = (r6 - r5)|0;
    heapClassInst.heap16[(r6)>>1] = Int16(r7);
    r6 = Int64(heapClassInst.heap32[(r2+40)]);
    r7 = Int64(heapClassInst.heapU16[(r4+10)>>1]);
    r6 = (r6 - r5)|0;
    heapClassInst.heap16[(r6+2)>>1] = Int16(r7);
    r6 = (r3 * ( -5))|0;
    r7 = Int64(heapClassInst.heap32[(r2+40)]);
    r4 = Int64(heapClassInst.heapU16[(r4+12)>>1]);
    r6 = r6 << 2;
    r7 = (r7 - r5)|0;
    r6 = (r0 + r6)|0;
    heapClassInst.heap16[(r7+4)>>1] = Int16(r4);
    r4 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r2+40)]);
    r6 = (r6 - r5)|0;
    r7 = Int64(heapClassInst.heap32[(r4)]);
    r6 = r6 >> 2;
    heapClassInst.heap32[(r6+3)] = Int32(r7);
    r6 = Int64(heapClassInst.heap32[(r2+40)]);
    r5 = (r6 - r5)|0;
    r4 = Int64(heapClassInst.heap32[(r4+1)]);
    r3 = (r3 + (-1))|0;
    r5 = r5 >> 2;
    heapClassInst.heap32[(r5+4)] = Int32(r4);
    if(r1 != r3) 
{
continue 
}
else{
break 
}
}
}
} while(false);
    return;
}

func _ZNK14btQuantizedBvh36walkStacklessQuantizedTreeAgainstRayEP21btNodeOverlapCallbackRK9btVector3S4_S4_S4_ii(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
    var r4:Int64 = 0
    var r5:Int64 = 0
    var r6:Int64 = 0
    var r7:Int64 = 0
    var r8:Int64 = 0
    var r9:Int64 = 0
    var r10:Int64 = 0
    var r11:Int64 = 0
    var r12:Int64 = 0
    var r13:Int64 = 0
    var r14:Int64 = 0
    var r15:Int64 = 0
    var r16:Int64 = 0
    var r17:Int64 = 0
    var r18:Int64 = 0
    var r19:Int64 = 0
    var r20:Int64 = 0
    var r21:Int64 = 0
    var f0:Float64 = 0.0
    var f1:Float64 = 0.0
    var f2:Float64 = 0.0
    var f3:Float64 = 0.0
    var f4:Float64 = 0.0
    var f5:Float64 = 0.0
    var f6:Float64 = 0.0
    var f7:Float64 = 0.0
    var f8:Float64 = 0.0
    var f9:Float64 = 0.0
    var f10:Float64 = 0.0
    var f11:Float64 = 0.0
    var f12:Float64 = 0.0
    var f13:Float64 = 0.0
    var f14:Float64 = 0.0
    var f15:Float64 = 0.0
    var f16:Float64 = 0.0
    var f17:Float64 = 0.0
    var f18:Float64 = 0.0
    var f19:Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-96);
    var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heapU8[r0+60]);
    if(r1 != 0) 
    {
        r1 = Int64(heapClassInst.heap32[(fp+1)]);
        r2 = Int64(heapClassInst.heap32[(fp+2)]);
        r3 = Int64(heapClassInst.heap32[(fp+3)]);
        r4 = Int64(heapClassInst.heap32[(fp+4)]);
        r5 = Int64(heapClassInst.heap32[(fp+5)]);
        r6 = Int64(heapClassInst.heap32[(fp+6)]);
        r3 = r3 >> 2;
        r2 = r2 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r3)]);
        f1 = Float64(heapClassInst.heapFloat[(r2)]);
        f2 = Float64(heapClassInst.heapFloat[(r3+1)]);
        f3 = Float64(heapClassInst.heapFloat[(r2+1)]);
        f0 = f0-f1;
        r7 = r0 >> 2;
        f1 = f2-f3;
        f2 = Float64(heapClassInst.heapFloat[(r3+2)]);
        f3 = Float64(heapClassInst.heapFloat[(r2+2)]);
        r8 = Int64(heapClassInst.heap32[(r7+34)]);
        f2 = f2-f3;
        f3 = f0*f0;
        f4 = f1*f1;
        f3 = f3+f4;
        f4 = f2*f2;
        f3 = f3+f4;
        heapClassInst.heapFloat[(g0)] = Float32(f3);
        sqrtf(i7);
        f4 = 1.0;
        f3 = f4/commonVariable.f_g0;
        f5 = Float64(heapClassInst.heapFloat[(r3)])
        f6 = Float64(heapClassInst.heapFloat[(r2)])
        f7 = Float64(heapClassInst.heapFloat[(r3+1)])
        f8 = Float64(heapClassInst.heapFloat[(r2+1)])
        f0 = f0*f3
        f9 = f5-f6
        f1 = f1*f3
        f10 = f7-f8
        f11 = Float64(heapClassInst.heapFloat[(r3+2)])
        f12 = Float64(heapClassInst.heapFloat[(r2+2)])
        f2 = f2*f3
        f3 = f11-f12
        f9 = f0*f9
        f10 = f1*f10
        f9 = f9+f10
        f3 = f2*f3
        f3 = f9+f3
        f9 = 0.0
        if(f0 != f9) 
        {
            f0 = f4/f0
        }
        else{
            f0 = 999999984306749440.0
        }
        if(f1 != f9) 
        {
            f1 = f4/f1
        }
        else{
            f1 = 999999984306749440.0
        }
        if(f2 != f9) 
        {
            f2 = f4/f2
        }
        else{
            f2 =        999999984306749440.0;
        }
        r9 = Int64(heapClassInst.heapU8[r0+60]);
        if(r9 != 0) 
        {
            r4 = r4 >> 2;
            r5 = r5 >> 2;
            r9 = if (f0 < f9) {1} else {0};
            r10 = if (f1 < f9) {1} else {0};
            r11 = if (f2 < f9) {1} else {0};
            f4 = Float64(heapClassInst.heapFloat[(r2+3)]);
            f10 = Float64(heapClassInst.heapFloat[(r3+3)]);
            f13 = if(f5 < f6) {f5} else {f6};
            f14 = Float64(heapClassInst.heapFloat[(r4)]);
            f15 = if(f7 < f8) {f7} else {f8};
            f16 = Float64(heapClassInst.heapFloat[(r4+1)]);
            f17 = if(f11 < f12) {f11} else {f12};
            f18 = Float64(heapClassInst.heapFloat[(r4+2)]);
            f5 = if(f6 < f5) {f5} else {f6};
            f6 = Float64(heapClassInst.heapFloat[(r5)]);
            f7 = if(f8 < f7) {f7} else {f8};
            f8 = Float64(heapClassInst.heapFloat[(r5+1)]);
            f11 = if(f12 < f11) {f11} else {f12};
            f12 = Float64(heapClassInst.heapFloat[(r5+2)]);
            r3 = r9 & 1;
            r9 = r10 & 1;
            r10 = r11 & 1;
            f19 = if(f10 < f4) {f10} else {f4};
            f4 = if(f4 < f10) {f10} else {f4};
            f10 = f13+f14;
            f13 = f15+f16;
            f14 = f17+f18;
            f5 = f5+f6;
            f6 = f7+f8;
            f7 = f11+f12;
            r11 = sp + (-16);
            r12 = r11 >> 2;
            heapClassInst.heapFloat[(fp+(-4))] = Float32(f10);
            heapClassInst.heapFloat[(r12+1)] = Float32(f13);
            heapClassInst.heapFloat[(r12+2)] = Float32(f14);
            heapClassInst.heapFloat[(r12+3)] = Float32(f19);
            f8 = Float64(heapClassInst.heapFloat[(r7+1)]);
            if(f10 < f8) 
            {
                heapClassInst.heapFloat[(fp+(-4))] = Float32(f8);
                f10 = f8;
            }
            f8 = Float64(heapClassInst.heapFloat[(r7+2)]);
            if(f13 < f8) 
            {
                heapClassInst.heapFloat[(r12+1)] = Float32(f8);
                f13 = f8;
            }
            f8 = Float64(heapClassInst.heapFloat[(r7+3)]);
            if(f14 < f8) 
            {
                heapClassInst.heapFloat[(r12+2)] = Float32(f8);
                f14 = f8;
            }
            f8 = Float64(heapClassInst.heapFloat[(r7+4)]);
            if(f19 < f8) 
            {
                heapClassInst.heapFloat[(r12+3)] = Float32(f8);
                f19 = f8;
            }
            f8 = Float64(heapClassInst.heapFloat[(r7+5)]);
            if(!(f8 >= f10)) 
            {
                heapClassInst.heapFloat[(fp+(-4))] = Float32(f8);
            }
            f8 = Float64(heapClassInst.heapFloat[(r7+6)]);
            if(!(f8 >= f13)) 
            {
                heapClassInst.heapFloat[(r12+1)] = Float32(f8);
            }
            f8 = Float64(heapClassInst.heapFloat[(r7+7)]);
            if(!(f8 >= f14)) 
            {
                heapClassInst.heapFloat[(r12+2)] = Float32(f8);
            }
            f8 = Float64(heapClassInst.heapFloat[(r7+8)]);
            if(!(f8 >= f19)) 
            {
                heapClassInst.heapFloat[(r12+3)] = Float32(f8);
            }
            r12 = sp + (-38);
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0+1)] = Int32(r12);
            heapClassInst.heap32[(g0+2)] = Int32(r11);
            heapClassInst.heap32[(g0+3)] = 0;
            _ZNK14btQuantizedBvh8quantizeEPtRK9btVector3i(i7);
            r11 = Int64(heapClassInst.heapU8[r0+60]);
            if(r11 != 0) 
            {
                r11 = sp + (-32);
                r12 = r11 >> 2;
                heapClassInst.heapFloat[(fp+(-8))] = Float32(f5);
                heapClassInst.heapFloat[(r12+1)] = Float32(f6);
                heapClassInst.heapFloat[(r12+2)] = Float32(f7);
                heapClassInst.heapFloat[(r12+3)] = Float32(f4);
                f8 = Float64(heapClassInst.heapFloat[(r7+1)]);
                if(f5 < f8) 
                {
                    heapClassInst.heapFloat[(fp+(-8))] = Float32(f8);
                    f5 = f8;
                }
                f8 = Float64(heapClassInst.heapFloat[(r7+2)]);
                if(f6 < f8) 
                {
                    heapClassInst.heapFloat[(r12+1)] = Float32(f8);
                    f6 = f8;
                }
                f8 = Float64(heapClassInst.heapFloat[(r7+3)]);
                if(f7 < f8) 
                {
                    heapClassInst.heapFloat[(r12+2)] = Float32(f8);
                    f7 = f8;
                }
                f8 = Float64(heapClassInst.heapFloat[(r7+4)]);
                if(f4 < f8) 
                {
                    heapClassInst.heapFloat[(r12+3)] = Float32(f8);
                    f4 = f8;
                }
                f8 = Float64(heapClassInst.heapFloat[(r7+5)]);
                if(!(f8 >= f5)) 
                {
                    heapClassInst.heapFloat[(fp+(-8))] = Float32(f8);
                }
                f5 = Float64(heapClassInst.heapFloat[(r7+6)]);
                if(!(f5 >= f6)) 
                {
                    heapClassInst.heapFloat[(r12+1)] = Float32(f5);
                }
                f5 = Float64(heapClassInst.heapFloat[(r7+7)]);
                if(!(f5 >= f7)) 
                {
                    heapClassInst.heapFloat[(r12+2)] = Float32(f5);
                }
                f5 = Float64(heapClassInst.heapFloat[(r7+8)]);
                if(!(f5 >= f4)) 
                {
                    heapClassInst.heapFloat[(r12+3)] = Float32(f5);
                }
                r12 = sp + (-44);
                heapClassInst.heap32[(g0)] = Int32(r0);
                heapClassInst.heap32[(g0+1)] = Int32(r12);
                heapClassInst.heap32[(g0+2)] = Int32(r11);
                heapClassInst.heap32[(g0+3)] = 1;
                r0 = r3 ^ 1;
                r11 = r9 ^ 1;
                r12 = r10 ^ 1;
                r13 = 0;
                _ZNK14btQuantizedBvh8quantizeEPtRK9btVector3i(i7);
                r14 = r13;
                while(true){
                    if(r13 < r6) 
                    {
                        if(r14 < r6) 
                        {
                            r15 = r8 >> 2;
                            r16 = Int64(heapClassInst.heap32[(r15+3)]);
                            r14 = (r14 + 1)|0;
                            r16 = r16 >> 31;
                            r17 = Int64(heapClassInst.heapU16[(sp+(-38))>>1]);
                            r18 = Int64(heapClassInst.heapU16[(r8+6)>>1]);
                            if(`UIntNative`(r17) > `UIntNative`(r18)) 
                            {
                                __label__ = 55;
                            }
                            else{
                                r17 = Int64(heapClassInst.heapU16[(r8)>>1]);
                                r18 = Int64(heapClassInst.heapU16[(sp+(-44))>>1]);
                                r18 = r18 & 65535;
                                r17 = r17 & 65535;
                                if(`UIntNative`(r18) < `UIntNative`(r17)) 
                                {
                                    __label__ = 55;
                                }
                                else{
                                    r18 = Int64(heapClassInst.heapU16[(sp+(-34))>>1]);
                                    r19 = Int64(heapClassInst.heapU16[(r8+10)>>1]);
                                    r18 = r18 & 65535;
                                    r19 = r19 & 65535;
                                    if(`UIntNative`(r18) > `UIntNative`(r19)) 
                                    {
                                        __label__ = 55;
                                    }
                                    else{
                                        r18 = Int64(heapClassInst.heapU16[(r8+4)>>1]);
                                        r19 = Int64(heapClassInst.heapU16[(sp+(-40))>>1]);
                                        r19 = r19 & 65535;
                                        r18 = r18 & 65535;
                                        if(`UIntNative`(r19) < `UIntNative`(r18)) 
                                        {
                                            __label__ = 55;
                                        }
                                        else{
                                            r19 = Int64(heapClassInst.heapU16[(sp+(-36))>>1]);
                                            r20 = Int64(heapClassInst.heapU16[(r8+8)>>1]);
                                            r19 = r19 & 65535;
                                            r20 = r20 & 65535;
                                            if(`UIntNative`(r19) > `UIntNative`(r20)) 
                                            {
                                                __label__ = 55;
                                            }
                                            else{
                                                r19 = Int64(heapClassInst.heapU16[(r8+2)>>1]);
                                                r20 = Int64(heapClassInst.heapU16[(sp+(-42))>>1]);
                                                r20 = r20 & 65535;
                                                r19 = r19 & 65535;
                                                if(`UIntNative`(r20) >= `UIntNative`(r19)) 
                                                {
                                                    f4 = Float64(`UIntNative`(r17)); 
                                                    f5 = Float64(heapClassInst.heapFloat[(r7+9)]);
                                                    f6 = Float64(`UIntNative`(r19)); 
                                                    f7 = Float64(heapClassInst.heapFloat[(r7+10)]);
                                                    f4 = f4/f5;
                                                    f8 = Float64(heapClassInst.heapFloat[(r7+1)]);
                                                    f10 = Float64(heapClassInst.heapFloat[(r7+11)]);
                                                    f11 = Float64(heapClassInst.heapFloat[(r7+2)]);
                                                    f12 = Float64(heapClassInst.heapFloat[(r7+3)]);
                                                    r17 = sp + (-80);
                                                    f13 = Float64(`UIntNative`(r18)); 
                                                    f6 = f6/f7;
                                                    f4 = f4+f8;
                                                    f13 = f13/f10;
                                                    r18 = r17 >> 2;
                                                    f6 = f6+f11;
                                                    heapClassInst.heapFloat[(fp+(-20))] = Float32(f4);
                                                    f13 = f13+f12;
                                                    heapClassInst.heapFloat[(r18+1)] = Float32(f6);
                                                    heapClassInst.heapFloat[(r18+2)] = Float32(f13);
                                                    heapClassInst.heap32[(r18+3)] = 0;
                                                    r19 = Int64(heapClassInst.heapU16[(r8+10)>>1]);
                                                    r20 = Int64(heapClassInst.heapU16[(r8+8)>>1]);
                                                    r21 = Int64(heapClassInst.heapU16[(r8+6)>>1]);
                                                    heapClassInst.heap32[(r18+7)] = 0;
                                                    f14 = Float64(heapClassInst.heapFloat[(r5)]);
                                                    f4 = f4-f14;
                                                    heapClassInst.heapFloat[(fp+(-20))] = Float32(f4);
                                                    f4 = Float64(heapClassInst.heapFloat[(r5+1)]);
                                                    f4 = f6-f4;
                                                    heapClassInst.heapFloat[(r18+1)] = Float32(f4);
                                                    f4 = Float64(heapClassInst.heapFloat[(r5+2)]);
                                                    f6 = Float64(`UIntNative`(r21)); 
                                                    f4 = f13-f4;
                                                    f5 = f6/f5;
                                                    heapClassInst.heapFloat[(r18+2)] = Float32(f4);
                                                    f4 = f5+f8;
                                                    f5 = Float64(heapClassInst.heapFloat[(r4)]);
                                                    f6 = Float64(`UIntNative`(r20)); 
                                                    f4 = f4-f5;
                                                    f5 = f6/f7;
                                                    heapClassInst.heapFloat[(r18+4)] = Float32(f4);
                                                    f4 = f5+f11;
                                                    f5 = Float64(heapClassInst.heapFloat[(r4+1)]);
                                                    f6 = Float64(`UIntNative`(r19)); 
                                                    f4 = f4-f5;
                                                    f5 = f6/f10;
                                                    heapClassInst.heapFloat[(r18+5)] = Float32(f4);
                                                    r19 = r3 << 4;
                                                    r20 = r11 << 4;
                                                    f4 = f5+f12;
                                                    f5 = Float64(heapClassInst.heapFloat[(r4+2)]);
                                                    r19 = (r17 + r19)|0;
                                                    r20 = (r17 + r20)|0;
                                                    f4 = f4-f5;
                                                    r19 = r19 >> 2;
                                                    heapClassInst.heapFloat[(r18+6)] = Float32(f4);
                                                    r18 = r20 >> 2;
                                                    f4 = Float64(heapClassInst.heapFloat[(r19)]);
                                                    f5 = Float64(heapClassInst.heapFloat[(r2)]);
                                                    f6 = Float64(heapClassInst.heapFloat[(r18+1)]);
                                                    f7 = Float64(heapClassInst.heapFloat[(r2+1)]);
                                                    f4 = f4-f5;
                                                    f6 = f6-f7;
                                                    f4 = f4*f0;
                                                    f6 = f6*f1;
                                                    if(f4 > f6) 
                                                    {
                                                        __label__ = 55;
                                                    }
                                                    else{
                                                        r18 = r0 << 4;
                                                        r19 = r9 << 4;
                                                        r18 = (r17 + r18)|0;
                                                        r19 = (r17 + r19)|0;
                                                        r18 = r18 >> 2;
                                                        r19 = r19 >> 2;
                                                        f8 = Float64(heapClassInst.heapFloat[(r18)]);
                                                        f10 = Float64(heapClassInst.heapFloat[(r19+1)]);
                                                        f5 = f8-f5;
                                                        f7 = f10-f7;
                                                        f5 = f5*f0;
                                                        f7 = f7*f1;
                                                        if(f7 > f5) 
                                                        {
                                                            __label__ = 55;
                                                        }
                                                        else{
                                                            r18 = r12 << 4;
                                                            r18 = (r17 + r18)|0;
                                                            r18 = r18 >> 2;
                                                            f8 = Float64(heapClassInst.heapFloat[(r18+2)]);
                                                            f10 = Float64(heapClassInst.heapFloat[(r2+2)]);
                                                            f8 = f8-f10;
                                                            f4 = if(f4 < f7) {f7} else {f4};
                                                            f7 = f8*f2;
                                                            if(f4 > f7) 
                                                            {
                                                                __label__ = 55;
                                                            }
                                                            else{
                                                                r18 = r10 << 4;
                                                                r17 = (r17 + r18)|0;
                                                                r17 = r17 >> 2;
                                                                f8 = Float64(heapClassInst.heapFloat[(r17+2)]);
                                                                f8 = f8-f10;
                                                                f5 = if(f6 < f5) {f6} else {f5};
                                                                f6 = f8*f2;
                                                                if(f6 > f5) 
                                                                {
                                                                    __label__ = 55;
                                                                }
                                                                else{
                                                                    f4 = if (f4 < f6) {f6} else {f4};
                                                                    f5 = if (f7 < f5) {f7} else {f5};
                                                                    r17 = if (f4 >= f3) {1} else {0};
                                                                    r18 = if (f5 <= f9) {1} else {0};
                                                                    r17 = r17 | r18;
                                                                    r18 = r17 & 1;
                                                                    r17 = r18 ^ 1;
                                                                    if(r16 != 0) 
                                                                    {
                                                                        __label__ = 65;
                                                                    }
                                                                    else{
                                                                        if(r18 == 0) 
                                                                        {
                                                                            r18 = Int64(heapClassInst.heap32[(r15+3)]);
                                                                            if(r18 > ( -1)) 
                                                                            {
                                                                                r19 = r1 >> 2;
                                                                                r19 = Int64(heapClassInst.heap32[(r19)]);
                                                                                r19 = r19 >> 2;
                                                                                r19 = Int64(heapClassInst.heap32[(r19+2)]);
                                                                                r20 = r18 >> 21;
                                                                                r18 = r18 & 2097151;
                                                                                heapClassInst.heap32[(g0)] = Int32(r1);
                                                                                heapClassInst.heap32[(g0+1)] = Int32(r20);
                                                                                heapClassInst.heap32[(g0+2)] = Int32(r18);
                                                                                __FUNCTION_TABLE__[(r19)>>2](i7);
                                                                                __label__ = 65;
                                                                            }
                                                                            else{
                                                                                __label__ = 63;
                                                                                break 
                                                                            }
                                                                        }
                                                                        else{
                                                                            __label__ = 65;
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                                else{
                                                    __label__ = 55;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if (__label__ == 55){
                                r17 = 0;
                            }
                            if(!(r17 != 0)) 
                            {
                                if(r16 != 0) 
                                {
                                    r15 = Int64(heapClassInst.heap32[(r15+3)]);
                                    if(r15 < 0) 
                                    {
                                        r16 = r15 << 4;
                                        r8 = (r8 - r16)|0;
                                        r13 = (r13 - r15)|0;
                                        continue 
                                    }
                                    else{
                                        __label__ = 69;
                                        break 
                                    }
                                }
                            }
                            r8 = (r8 + 16)|0;
                            r13 = (r13 + 1)|0;
                        }
                        else{
                            __label__ = 48;
                            break 
                        }
                    }
                    else{
                        __label__ = 72;
                        break 
                    }
                }
                match(__label__ ){
                case 72 =>
                    r0 = maxIterations;
                    r0 = r0 >> 2;
                    r1 = Int64(heapClassInst.heap32[(r0)]);
                    if(!(r1 >= r14)) 
                    {
                        heapClassInst.heap32[(r0)] = Int32(r14);
                    }
                    return;

                case 69 =>
                    r0 = _E2_str941;
                    r1 = _E2_str313;
                    heapClassInst.heap32[(g0)] = Int32(r0);
                    heapClassInst.heap32[(g0+1)] = Int32(r1);
                    heapClassInst.heap32[(g0+2)] = 75;
                    _assert(i7);
                case 63 =>
                    r0 = _E2_str739;
                    r1 = _E2_str313;
                    heapClassInst.heap32[(g0)] = Int32(r0);
                    heapClassInst.heap32[(g0+1)] = Int32(r1);
                    heapClassInst.heap32[(g0+2)] = 80;
                    _assert(i7);
                case 48 =>
                    r0 = _E2_str1143;
                    r1 = _E2_str537;
                    heapClassInst.heap32[(g0)] = Int32(r0);
                    heapClassInst.heap32[(g0+1)] = Int32(r1);
                    heapClassInst.heap32[(g0+2)] = 606
                    _assert(i7);
                case _ =>
                    println("no match case in while and label is ${__label__}")
                }
            }
        }
        r0 = _E2_str212;
        r1 = _E2_str313;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0+1)] = Int32(r1);
        heapClassInst.heap32[(g0+2)] = 420;
        _assert(i7);
    }
    else{
        r0 = _E2_str212;
        r1 = _E2_str537;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0+1)] = Int32(r1);
        heapClassInst.heap32[(g0+2)] = 543;
        _assert(i7);
    }
}

func _ZNK14btQuantizedBvh27walkStacklessTreeAgainstRayEP21btNodeOverlapCallbackRK9btVector3S4_S4_S4_ii(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
    var r4:Int64 = 0
    var r5:Int64 = 0
    var r6:Int64 = 0
    var r7:Int64 = 0
    var r8:Int64 = 0
    var r9:Int64 = 0
    var r10:Int64 = 0
    var r11:Int64 = 0
    var r12:Int64 = 0
    var r13:Int64 = 0
    var r14:Int64 = 0
    var r15:Int64 = 0
    var r16:Int64 = 0
    var r17:Int64 = 0
    var r18:Int64 = 0
    var r19:Int64 = 0
    var f0:Float64 = 0.0
    var f1:Float64 = 0.0
    var f2:Float64 = 0.0
    var f3:Float64 = 0.0
    var f4:Float64 = 0.0
    var f5:Float64 = 0.0
    var f6:Float64 = 0.0
    var f7:Float64 = 0.0
    var f8:Float64 = 0.0
    var f9:Float64 = 0.0
    var f10:Float64 = 0.0
    var f11:Float64 = 0.0
    var f12:Float64 = 0.0
    var f13:Float64 = 0.0
    var f14:Float64 = 0.0
    var f15:Float64 = 0.0
    var f16:Float64 = 0.0
    var f17:Float64 = 0.0
    var f18:Float64 = 0.0
    var f19:Float64 = 0.0
    var f20:Float64 = 0.0
    var f21:Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-48);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heapU8[r0+60]);
    if(r1 == 0) 
{
    r1 = Int64(heapClassInst.heap32[(fp+1)]);
    r2 = Int64(heapClassInst.heap32[(fp+2)]);
    r3 = Int64(heapClassInst.heap32[(fp+3)]);
    r4 = Int64(heapClassInst.heap32[(fp+4)]);
    r5 = Int64(heapClassInst.heap32[(fp+5)]);
    r3 = r3 >> 2;
    r2 = r2 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r2)]);
    f1 = Float64(heapClassInst.heapFloat[(r3)]);
    f2 = Float64(heapClassInst.heapFloat[(r3+1)]);
    f3 = Float64(heapClassInst.heapFloat[(r2+1)]);
    r4 = r4 >> 2;
    r5 = r5 >> 2;
    f4 = f1-f0;
    r0 = r0 >> 2;
    f5 = f2-f3;
    f6 = Float64(heapClassInst.heapFloat[(r3+2)]);
    f7 = Float64(heapClassInst.heapFloat[(r2+2)]);
    r6 = Int64(heapClassInst.heap32[(r0+24)]);
    f8 = f6-f7;
    f9 = f4*f4;
    f10 = f5*f5;
    f11 = Float64(heapClassInst.heapFloat[(r4)]);
    f12 = Float64(heapClassInst.heapFloat[(r4+1)]);
    f13 = Float64(heapClassInst.heapFloat[(r4+2)]);
    f14 = Float64(heapClassInst.heapFloat[(r5)]);
    f15 = Float64(heapClassInst.heapFloat[(r5+1)]);
    f16 = Float64(heapClassInst.heapFloat[(r5+2)]);
    f9 = f9+f10;
    f10 = f8*f8;
    f9 = f9+f10;
    heapClassInst.heapFloat[(g0)] = Float32(f9);
    sqrtf(i7);
    f10 =                         1.0;
    f9 = f10/commonVariable.f_g0;
    f17 = Float64(heapClassInst.heapFloat[(r3)]);
    f18 = Float64(heapClassInst.heapFloat[(r2)]);
    f19 = Float64(heapClassInst.heapFloat[(r3+1)]);
    f20 = Float64(heapClassInst.heapFloat[(r2+1)]);
    f4 = f4*f9;
    f17 = f17-f18;
    f5 = f5*f9;
    f18 = f19-f20;
    f19 = Float64(heapClassInst.heapFloat[(r3+2)]);
    f20 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f8 = f8*f9;
    f9 = f19-f20;
    f17 = f4*f17;
    f18 = f5*f18;
    f19 = if (f1 < f0) {f1} else {f0};
    f20 = if (f2 < f3) {f2} else {f3};
    f21 = if (f6 < f7) {f6} else {f7};
    f0 = if (f0 < f1) {f1} else {f0};
    f1 = if (f3 < f2) {f2} else {f3};
    f2 = if (f7 < f6) {f6} else {f7};
    f3 = f17+f18;
    f6 = f8*f9;
    f7 = f19+f11;
    f9 = f20+f12;
    f11 = f21+f13;
    f0 = f0+f14;
    f1 = f1+f15;
    f2 = f2+f16;
    f3 = f3+f6;
    f6 =                         0.0;
    if(f4 != f6) 
{
    f4 = f10/f4;
}
else{
    f4 =        999999984306749440.0;
}
    if(f5 != f6) 
{
    f5 = f10/f5;
}
else{
    f5 =        999999984306749440.0;
}
    if(f8 != f6) 
{
    f8 = f10/f8;
}
else{
    f8 =        999999984306749440.0;
}
    r3 = if (f4 < f6) {1} else {0};
    r7 = if (f5 < f6) {1} else {0};
    r8 = if (f8 < f6) {1} else {0};
    r3 = r3 & 1;
    r7 = r7 & 1;
    r8 = r8 & 1;
    r9 = r3 ^ 1;
    r10 = r7 ^ 1;
    r11 = r8 ^ 1;
    r12 = 0;
    r13 = r12;
while(true){
    r14 = Int64(heapClassInst.heap32[(r0+14)]);
    if(r14 > r12) 
{
    if(r14 > r13) 
{
    r14 = r6 >> 2;
    f10 = Float64(heapClassInst.heapFloat[(r14)]);
    r15 = sp + (-32);
    heapClassInst.heapFloat[(fp+(-8))] = Float32(f10);
    r16 = r15 >> 2;
    f12 = Float64(heapClassInst.heapFloat[(r14+1)]);
    heapClassInst.heapFloat[(r16+1)] = Float32(f12);
    f13 = Float64(heapClassInst.heapFloat[(r14+2)]);
    heapClassInst.heapFloat[(r16+2)] = Float32(f13);
    heapClassInst.heap32[(r16+3)] = heapClassInst.heap32[(r14+3)];
    f14 = Float64(heapClassInst.heapFloat[(r14+4)]);
    heapClassInst.heapFloat[(r16+4)] = Float32(f14);
    f15 = Float64(heapClassInst.heapFloat[(r14+5)]);
    heapClassInst.heapFloat[(r16+5)] = Float32(f15);
    f16 = Float64(heapClassInst.heapFloat[(r14+6)]);
    heapClassInst.heapFloat[(r16+6)] = Float32(f16);
    heapClassInst.heap32[(r16+7)] = heapClassInst.heap32[(r14+7)];
    f17 = Float64(heapClassInst.heapFloat[(r5)]);
    f10 = f10-f17;
    heapClassInst.heapFloat[(fp+(-8))] = Float32(f10);
    f10 = Float64(heapClassInst.heapFloat[(r5+1)]);
    f10 = f12-f10;
    heapClassInst.heapFloat[(r16+1)] = Float32(f10);
    f10 = Float64(heapClassInst.heapFloat[(r5+2)]);
    f10 = f13-f10;
    heapClassInst.heapFloat[(r16+2)] = Float32(f10);
    f10 = Float64(heapClassInst.heapFloat[(r4)]);
    f10 = f14-f10;
    heapClassInst.heapFloat[(r16+4)] = Float32(f10);
    f10 = Float64(heapClassInst.heapFloat[(r4+1)]);
    f10 = f15-f10;
    heapClassInst.heapFloat[(r16+5)] = Float32(f10);
    f10 = Float64(heapClassInst.heapFloat[(r4+2)]);
    r13 = (r13 + 1)|0;
    f10 = f16-f10;
    heapClassInst.heapFloat[(r16+6)] = Float32(f10);
    f10 = Float64(heapClassInst.heapFloat[(r14+4)]);
    if(f7 > f10) 
{
__label__ = 17;
}
else{
    f10 = Float64(heapClassInst.heapFloat[(r14)]);
    if(f0 < f10) 
{
__label__ = 17;
}
else{
    r16 = 1;
__label__ = 18;
}
}
if (__label__ == 17){
    r16 = 0;
}
    f10 = Float64(heapClassInst.heapFloat[(r14+6)]);
    if(f11 > f10) 
{
__label__ = 20;
}
else{
    f10 = Float64(heapClassInst.heapFloat[(r14+2)]);
    if(f2 < f10) 
{
__label__ = 20;
}
else{
__label__ = 21;
}
}
if (__label__ == 20){
    r16 = 0;
}
    f10 = Float64(heapClassInst.heapFloat[(r14+5)]);
    if(f9 > f10) 
{
__label__ = 30;
}
else{
    f10 = Float64(heapClassInst.heapFloat[(r14+1)]);
    if(f1 < f10) 
{
__label__ = 30;
}
else{
    r16 = r16 & 255;
    if(r16 == 0) 
{
__label__ = 30;
}
else{
    r16 = r3 << 4;
    r17 = r10 << 4;
    r16 = (r15 + r16)|0;
    r17 = (r15 + r17)|0;
    r16 = r16 >> 2;
    r17 = r17 >> 2;
    f10 = Float64(heapClassInst.heapFloat[(r16)]);
    f12 = Float64(heapClassInst.heapFloat[(r2)]);
    f13 = Float64(heapClassInst.heapFloat[(r17+1)]);
    f14 = Float64(heapClassInst.heapFloat[(r2+1)]);
    f10 = f10-f12;
    f13 = f13-f14;
    f10 = f10*f4;
    f13 = f13*f5;
    if(f10 > f13) 
{
__label__ = 30;
}
else{
    r16 = r9 << 4;
    r17 = r7 << 4;
    r16 = (r15 + r16)|0;
    r17 = (r15 + r17)|0;
    r16 = r16 >> 2;
    r17 = r17 >> 2;
    f15 = Float64(heapClassInst.heapFloat[(r16)]);
    f16 = Float64(heapClassInst.heapFloat[(r17+1)]);
    f12 = f15-f12;
    f14 = f16-f14;
    f12 = f12*f4;
    f14 = f14*f5;
    if(f14 > f12) 
{
__label__ = 30;
}
else{
    r16 = r11 << 4;
    r16 = (r15 + r16)|0;
    r16 = r16 >> 2;
    f15 = Float64(heapClassInst.heapFloat[(r16+2)]);
    f16 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f15 = f15-f16;
    f10 = if (f10 < f14) {f14} else {f10};
    f14 = f15*f8;
    if(f10 > f14) 
{
__label__ = 30;
}
else{
    r16 = r8 << 4;
    r15 = (r15 + r16)|0;
    r15 = r15 >> 2;
    f15 = Float64(heapClassInst.heapFloat[(r15+2)]);
    f15 = f15-f16;
    f12 = if (f13 < f12) {f13} else {f12};
    f13 = f15*f8;
    if(f13 > f12) 
{
__label__ = 30;
}
else{
    f10 = if (f10 < f13) {f13} else {f10};
    f12 = if (f14 < f12) {f14} else {f12};
    r15 = if (f10 >= f3) {1} else {0};
    r16 = if (f12 <= f6) {1} else {0};
    r15 = r15 | r16;
    r16 = r15 & 1;
    r17 = Int64(heapClassInst.heap32[(r14+8)]);
    r18 = ( -1);
    r16 = r16 ^ 1;
    r19 = if (r17 == r18) {1} else {0};
    if(r15 != 0) 
{
__label__ = 32;
}
else{
    r15 = if (r17 != r18) {1} else {0};
    r15 = r15 & 1;
    if(r15 == 0) 
{
    r15 = r1 >> 2;
    r15 = Int64(heapClassInst.heap32[(r15)]);
    r15 = r15 >> 2;
    r15 = Int64(heapClassInst.heap32[(r15+2)]);
    r17 = Int64(heapClassInst.heap32[(r14+10)]);
    r18 = Int64(heapClassInst.heap32[(r14+9)]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0+1)] = Int32(r18);
    heapClassInst.heap32[(g0+2)] = Int32(r17);
    __FUNCTION_TABLE__[(r15)>>2](i7);
__label__ = 32;
}
else{
__label__ = 32;
}
}
}
}
}
}
}
}
}
if (__label__ == 30){
    r16 = Int64(heapClassInst.heap32[(r14+8)]);
    r19 = ( -1);
    r19 = if (r16 == r19) {1} else {0};
    r16 = 0;
}
if(!(r16 != 0)) 
{
    r15 = r19 & 1;
    if(r15 == 0) 
{
    r14 = Int64(heapClassInst.heap32[(r14+8)]);
    r15 = r14 << 6;
    r6 = (r6 + r15)|0;
    r12 = (r14 + r12)|0;
continue 
}
}
    r6 = (r6 + 64)|0;
    r12 = (r12 + 1)|0;
}
else{
__label__ = 13;
break 
}
}
else{
__label__ = 37;
break 
}
}
    match(__label__ ){
        case 37 =>
            r0 = maxIterations;
            r0 = r0 >> 2;
            r1 = Int64(heapClassInst.heap32[(r0)]);
        if(!(r1 >= r13)) 
        {
            heapClassInst.heap32[(r0)] = Int32(r13);
        }
            return;

        case 13 =>
            r0 = _E2_str1921;
            r1 = _E2_str537;
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0+1)] = Int32(r1);
            heapClassInst.heap32[(g0+2)] = 490;
            _assert(i7);
        case _ =>
            println("break 1915")
    }
}
else{
    r0 = _E2_str1844;
    r1 = _E2_str537;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = 451;
    _assert(i7);
}
}

func _ZN30btActivatingCollisionAlgorithmD0Ev(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV30btActivatingCollisionAlgorithm;
    r2 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
    return;
}

func _ZN30btActivatingCollisionAlgorithmD1Ev(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV30btActivatingCollisionAlgorithm;
    r0 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r0)] = Int32(r1);
    return;
}

func _ZN26btBoxBoxCollisionAlgorithm21calculateTimeOfImpactEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResult(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var f0:Float64 = 0.0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    f0 = 1.0;
    commonVariable.f_g0 = f0;
    return;
}

func _ZN26btBoxBoxCollisionAlgorithm22getAllContactManifoldsER20btAlignedObjectArrayIP20btPersistentManifoldE(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
    var r4:Int64 = 0
    var r5:Int64 = 0
    var r6:Int64 = 0
    var r7:Int64 = 0
    var r8:Int64 = 0
    var r9:Int64 = 0
    var r10:Int64 = 0
    var r11:Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1+3)]);
if(!(r2 == 0)) 
{
    r0 = Int64(heapClassInst.heapU8[r0+8]);
if(!(r0 == 0)) 
{
    r0 = Int64(heapClassInst.heap32[(fp+1)]);
    r3 = r0 >> 2;
    r4 = Int64(heapClassInst.heap32[(r3+2)]);
    r5 = Int64(heapClassInst.heap32[(r3+1)]);
    if(r4 == r5) 
{
    r6 = 1;
    r7 = r5 << 1;
    r7 = if (r5 == 0) {r6} else {r7};
if(!(r4 >= r7)) 
{
    if(r7 != 0) 
{
    r2 = gNumAlignedAllocs;
    r2 = r2 >> 2;
    r4 = Int64(heapClassInst.heap32[(r2)]);
    r8 = r7 << 2;
    r4 = (r4 + 1)|0;
    r8 = r8 | 3;
    heapClassInst.heap32[(r2)] = Int32(r4);
    r2 = (r8 + 16)|0;
    heapClassInst.heap32[(g0)] = Int32(r2);
    mallocNew(i7);
    r2 = commonVariable.r_g0;
    if(r2 != 0) 
{
    r4 = 0;
    r8 = (r2 + 4)|0;
    r4 = (r4 - r8)|0;
    r4 = r4 & 15;
    r4 = (r2 + r4)|0;
    r8 = (r4 + 4)|0;
    r4 = r4 >> 2;
    heapClassInst.heap32[(r4)] = Int32(r2);
    r2 = r8;
}
}
else{
    r2 = 0;
}
    r4 = (r0 + 12)|0;
    if(r5 < 1) 
{
    r8 = r4 >> 2;
    r9 = Int64(heapClassInst.heap32[(r8)]);
}
else{
    r8 = 0;
while(true){
    r9 = r4 >> 2;
    r9 = Int64(heapClassInst.heap32[(r9)]);
    r10 = r8 << 2;
    r11 = (r9 + r10)|0;
    r11 = r11 >> 2;
    r10 = (r2 + r10)|0;
    r11 = Int64(heapClassInst.heap32[(r11)]);
    r8 = (r8 + 1)|0;
    r10 = r10 >> 2;
    heapClassInst.heap32[(r10)] = Int32(r11);
if(!(r5 != r8)) 
{
break 
}
}
    r4 = (r0 + 12)|0;
}
    if(r9 != 0) 
{
    r8 = Int64(heapClassInst.heapU8[r0+16]);
    if(r8 != 0) 
{
    r5 = gNumAlignedFree;
    r5 = r5 >> 2;
    r8 = Int64(heapClassInst.heap32[(r5)]);
    r8 = (r8 + 1)|0;
    r9 = r9 >> 2;
    heapClassInst.heap32[(r5)] = Int32(r8);
    r5 = Int64(heapClassInst.heap32[(r9+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r5);
    free(i7);
    r5 = Int64(heapClassInst.heap32[(r3+1)]);
}
    r8 = r4 >> 2;
    heapClassInst.heap32[(r8)] = 0;
}
    r4 = r4 >> 2;
    heapClassInst.heap8[r0+16] = Int8(r6);
    heapClassInst.heap32[(r4)] = Int32(r2);
    heapClassInst.heap32[(r3+2)] = Int32(r7);
    r2 = Int64(heapClassInst.heap32[(r1+3)]);
}
}
    r0 = r5 << 2;
    r1 = Int64(heapClassInst.heap32[(r3+3)]);
    r0 = (r1 + r0)|0;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r0)] = Int32(r2);
    r0 = Int64(heapClassInst.heap32[(r3+1)]);
    r0 = (r0 + 1)|0;
    heapClassInst.heap32[(r3+1)] = Int32(r0);
}
}
    return;
}

func _ZN26btBoxBoxCollisionAlgorithm16processCollisionEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResult(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
    var r4:Int64 = 0
    var r5:Int64 = 0
    var r6:Int64 = 0
    var r7:Int64 = 0
    var r8:Int64 = 0
    var r9:Int64 = 0
    var r10:Int64 = 0
var __label__ = 0;
    i7 = sp + (-176);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+3)]);
if(!(r1 == 0)) 
{
    r2 = Int64(heapClassInst.heap32[(fp+1)]);
    r3 = Int64(heapClassInst.heap32[(fp+2)]);
    r4 = Int64(heapClassInst.heap32[(fp+3)]);
    r5 = Int64(heapClassInst.heap32[(fp+4)]);
    r3 = r3 >> 2;
    r2 = r2 >> 2;
    r6 = Int64(heapClassInst.heap32[(r3+48)]);
    r7 = Int64(heapClassInst.heap32[(r2+48)]);
    r8 = sp + (-136);
    r9 = r5 >> 2;
    r10 = r8 >> 2;
    heapClassInst.heap32[(r9+1)] = Int32(r1);
    heapClassInst.heap32[(r10+33)] = 0;
    heapClassInst.heap32[(r10+32)] = 1566444395;
    heapClassInst.heap32[(fp+(-34))] = heapClassInst.heap32[(r2+1)];
    heapClassInst.heap32[(r10+1)] = heapClassInst.heap32[(r2+2)];
    heapClassInst.heap32[(r10+2)] = heapClassInst.heap32[(r2+3)];
    heapClassInst.heap32[(r10+3)] = heapClassInst.heap32[(r2+4)];
    heapClassInst.heap32[(r10+4)] = heapClassInst.heap32[(r2+5)];
    heapClassInst.heap32[(r10+5)] = heapClassInst.heap32[(r2+6)];
    heapClassInst.heap32[(r10+6)] = heapClassInst.heap32[(r2+7)];
    heapClassInst.heap32[(r10+7)] = heapClassInst.heap32[(r2+8)];
    heapClassInst.heap32[(r10+8)] = heapClassInst.heap32[(r2+9)];
    heapClassInst.heap32[(r10+9)] = heapClassInst.heap32[(r2+10)];
    heapClassInst.heap32[(r10+10)] = heapClassInst.heap32[(r2+11)];
    heapClassInst.heap32[(r10+11)] = heapClassInst.heap32[(r2+12)];
    heapClassInst.heap32[(r10+12)] = heapClassInst.heap32[(r2+13)];
    heapClassInst.heap32[(r10+13)] = heapClassInst.heap32[(r2+14)];
    heapClassInst.heap32[(r10+14)] = heapClassInst.heap32[(r2+15)];
    heapClassInst.heap32[(r10+15)] = heapClassInst.heap32[(r2+16)];
    heapClassInst.heap32[(r10+16)] = heapClassInst.heap32[(r3+1)];
    heapClassInst.heap32[(r10+17)] = heapClassInst.heap32[(r3+2)];
    heapClassInst.heap32[(r10+18)] = heapClassInst.heap32[(r3+3)];
    heapClassInst.heap32[(r10+19)] = heapClassInst.heap32[(r3+4)];
    heapClassInst.heap32[(r10+20)] = heapClassInst.heap32[(r3+5)];
    heapClassInst.heap32[(r10+21)] = heapClassInst.heap32[(r3+6)];
    heapClassInst.heap32[(r10+22)] = heapClassInst.heap32[(r3+7)];
    heapClassInst.heap32[(r10+23)] = heapClassInst.heap32[(r3+8)];
    heapClassInst.heap32[(r10+24)] = heapClassInst.heap32[(r3+9)];
    heapClassInst.heap32[(r10+25)] = heapClassInst.heap32[(r3+10)];
    heapClassInst.heap32[(r10+26)] = heapClassInst.heap32[(r3+11)];
    heapClassInst.heap32[(r10+27)] = heapClassInst.heap32[(r3+12)];
    heapClassInst.heap32[(r10+28)] = heapClassInst.heap32[(r3+13)];
    heapClassInst.heap32[(r10+29)] = heapClassInst.heap32[(r3+14)];
    r1 = _ZTV16btBoxBoxDetector;
    heapClassInst.heap32[(r10+30)] = heapClassInst.heap32[(r3+15)];
    r2 = sp + (-152);
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r10+31)] = heapClassInst.heap32[(r3+16)];
    r3 = r2 >> 2;
    heapClassInst.heap32[(fp+(-38))] = Int32(r1);
    heapClassInst.heap32[(r3+1)] = Int32(r7);
    r1 = r4 >> 2;
    heapClassInst.heap32[(r3+2)] = Int32(r6);
    r1 = Int64(heapClassInst.heap32[(r1+5)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0+1)] = Int32(r8);
    heapClassInst.heap32[(g0+2)] = Int32(r5);
    heapClassInst.heap32[(g0+3)] = Int32(r1);
    heapClassInst.heap32[(g0+4)] = 0;
    _ZN16btBoxBoxDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb(i7);
    r0 = Int64(heapClassInst.heapU8[r0+8]);
if(!(r0 == 0)) 
{
    r0 = Int64(heapClassInst.heap32[(r9+1)]);
    if(r0 != 0) 
{
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1+279)]);
if(!(r2 == 0)) 
{
    r1 = Int64(heapClassInst.heap32[(r1+277)]);
    r2 = Int64(heapClassInst.heap32[(r9+34)]);
    if(r1 == r2) 
{
    r1 = (r5 + 8)|0;
    r2 = (r5 + 72)|0;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = Int32(r2);
    _ZN20btPersistentManifold20refreshContactPointsERK11btTransformS2_(i7);
}
else{
    r1 = (r5 + 72)|0;
    r5 = (r5 + 8)|0;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = Int32(r5);
    _ZN20btPersistentManifold20refreshContactPointsERK11btTransformS2_(i7);
    return;
}
}
}
else{
    r0 = _E2_str59;
    r5 = _E2_str160;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r5);
    heapClassInst.heap32[(g0+2)] = 101;
    _assert(i7);
}
}
}
    return;
}

func _ZN26btBoxBoxCollisionAlgorithmD0Ev(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
    var r4:Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV26btBoxBoxCollisionAlgorithm;
    r2 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    r1 = Int64(heapClassInst.heapU8[r0+8]);
if(!(r1 == 0)) 
{
    r1 = Int64(heapClassInst.heap32[(r2+3)]);
if(!(r1 == 0)) 
{
    r3 = Int64(heapClassInst.heap32[(r2+1)]);
    r4 = r3 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+4)]);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    __FUNCTION_TABLE__[(r4)>>2](i7);
}
}
    r1 = _ZTV30btActivatingCollisionAlgorithm;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
    return;
}

func _ZN26btBoxBoxCollisionAlgorithmD1Ev(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV26btBoxBoxCollisionAlgorithm;
    r2 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    r0 = Int64(heapClassInst.heapU8[r0+8]);
if(!(r0 == 0)) 
{
    r0 = Int64(heapClassInst.heap32[(r2+3)]);
if(!(r0 == 0)) 
{
    r1 = Int64(heapClassInst.heap32[(r2+1)]);
    r3 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+4)]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0+1)] = Int32(r0);
    __FUNCTION_TABLE__[(r3)>>2](i7);
}
}
    r0 = _ZTV30btActivatingCollisionAlgorithm;
    r0 = (r0 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r0);
    return;
}

func _ZN16btBoxBoxDetectorD1Ev(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV16btBoxBoxDetector;
    r0 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r0)] = Int32(r1);
    return;
}

func _ZN16btBoxBoxDetectorD0Ev(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV16btBoxBoxDetector;
    r2 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
    return;
}

func _ZN16btBoxBoxDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
    var r4:Int64 = 0
    var r5:Int64 = 0
    var r6:Int64 = 0
    var r7:Int64 = 0
    var r8:Int64 = 0
    var r9:Int64 = 0
    var r10:Int64 = 0
    var r11:Int64 = 0
    var r12:Int64 = 0
    var r13:Int64 = 0
    var r14:Int64 = 0
    var r15:Int64 = 0
    var r16:Int64 = 0
    var r17:Int64 = 0
    var r18:Int64 = 0
    var r19:Int64 = 0
    var r20:Int64 = 0
    var r21:Int64 = 0
    var r22:Int64 = 0
    var r23:Int64 = 0
    var r24:Int64 = 0
    var r25:Int64 = 0
    var f0:Float64 = 0.0
    var f1:Float64 = 0.0
    var f2:Float64 = 0.0
    var f3:Float64 = 0.0
    var f4:Float64 = 0.0
    var f5:Float64 = 0.0
    var f6:Float64 = 0.0
    var f7:Float64 = 0.0
    var f8:Float64 = 0.0
    var f9:Float64 = 0.0
    var f10:Float64 = 0.0
    var f11:Float64 = 0.0
    var f12:Float64 = 0.0
    var f13:Float64 = 0.0
    var f14:Float64 = 0.0
    var f15:Float64 = 0.0
    var f16:Float64 = 0.0
    var f17:Float64 = 0.0
    var f18:Float64 = 0.0
    var f19:Float64 = 0.0
    var f20:Float64 = 0.0
    var f21:Float64 = 0.0
    var f22:Float64 = 0.0
    var f23:Float64 = 0.0
    var f24:Float64 = 0.0
    var f25:Float64 = 0.0
    var f26:Float64 = 0.0
    var f27:Float64 = 0.0
    var f28:Float64 = 0.0
    var f29:Float64 = 0.0
    var f30:Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-808);
    var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp+1)]);
    r1 = r0 >> 2;
    r2 = sp + (-640);
    heapClassInst.heap32[(fp+(-160))] = heapClassInst.heap32[(r1)];
    r3 = sp + (-688);
    heapClassInst.heap32[(fp+(-172))] = heapClassInst.heap32[(r1+16)];
    r4 = r2 >> 2;
    r5 = r3 >> 2;
    heapClassInst.heap32[(r4+1)] = heapClassInst.heap32[(r1+1)];
    heapClassInst.heap32[(r5+1)] = heapClassInst.heap32[(r1+17)];
    heapClassInst.heap32[(r4+2)] = heapClassInst.heap32[(r1+2)];
    heapClassInst.heap32[(r5+2)] = heapClassInst.heap32[(r1+18)];
    heapClassInst.heap32[(r4+4)] = heapClassInst.heap32[(r1+4)];
    heapClassInst.heap32[(r5+4)] = heapClassInst.heap32[(r1+20)];
    heapClassInst.heap32[(r4+5)] = heapClassInst.heap32[(r1+5)];
    heapClassInst.heap32[(r5+5)] = heapClassInst.heap32[(r1+21)];
    heapClassInst.heap32[(r4+6)] = heapClassInst.heap32[(r1+6)];
    heapClassInst.heap32[(r5+6)] = heapClassInst.heap32[(r1+22)];
    heapClassInst.heap32[(r4+8)] = heapClassInst.heap32[(r1+8)];
    heapClassInst.heap32[(r5+8)] = heapClassInst.heap32[(r1+24)];
    heapClassInst.heap32[(r4+9)] = heapClassInst.heap32[(r1+9)];
    heapClassInst.heap32[(r5+9)] = heapClassInst.heap32[(r1+25)];
    r6 = Int64(heapClassInst.heap32[(fp)]);
    heapClassInst.heap32[(r4+10)] = heapClassInst.heap32[(r1+10)];
    r6 = r6 >> 2;
    heapClassInst.heap32[(r5+10)] = heapClassInst.heap32[(r1+26)];
    r7 = Int64(heapClassInst.heap32[(r6+2)]);
    r8 = r7 >> 2;
    r9 = Int64(heapClassInst.heap32[(r8)]);
    r9 = r9 >> 2;
    r9 = Int64(heapClassInst.heap32[(r9+11)]);
    f0 = Float64(heapClassInst.heapFloat[(r8+7)]);
    f1 = Float64(heapClassInst.heapFloat[(r8+8)]);
    f2 = Float64(heapClassInst.heapFloat[(r8+9)]);
    heapClassInst.heap32[(g0)] = Int32(r7);
    __FUNCTION_TABLE__[(r9)>>2](i7);
    f3 = commonVariable.f_g0;
    r9 = Int64(heapClassInst.heap32[(r8)]);
    r9 = r9 >> 2;
    r9 = Int64(heapClassInst.heap32[(r9+11)]);
    heapClassInst.heap32[(g0)] = Int32(r7);
    __FUNCTION_TABLE__[(r9)>>2](i7);
    f4 = commonVariable.f_g0;
    r8 = Int64(heapClassInst.heap32[(r8)]);
    r8 = r8 >> 2;
    r8 = Int64(heapClassInst.heap32[(r8+11)]);
    heapClassInst.heap32[(g0)] = Int32(r7);
    __FUNCTION_TABLE__[(r8)>>2](i7);
    f5 = commonVariable.f_g0;
    r6 = Int64(heapClassInst.heap32[(r6+1)]);
    r7 = r6 >> 2;
    r8 = Int64(heapClassInst.heap32[(r7)]);
    r8 = r8 >> 2;
    f6 = Float64(heapClassInst.heapFloat[(r7+8)]);
    r8 = Int64(heapClassInst.heap32[(r8+11)]);
    f7 = Float64(heapClassInst.heapFloat[(r7+9)]);
    f8 = Float64(heapClassInst.heapFloat[(r7+7)]);
    heapClassInst.heap32[(g0)] = Int32(r6);
    __FUNCTION_TABLE__[(r8)>>2](i7);
    f9 = commonVariable.f_g0;
    r8 = Int64(heapClassInst.heap32[(r7)]);
    r8 = r8 >> 2;
    r8 = Int64(heapClassInst.heap32[(r8+11)]);
    heapClassInst.heap32[(g0)] = Int32(r6);
    __FUNCTION_TABLE__[(r8)>>2](i7);
    f10 = commonVariable.f_g0;
    r7 = Int64(heapClassInst.heap32[(r7)]);
    r7 = r7 >> 2;
    r7 = Int64(heapClassInst.heap32[(r7+11)]);
    heapClassInst.heap32[(g0)] = Int32(r6);
    __FUNCTION_TABLE__[(r7)>>2](i7);
    f8 = f8+commonVariable.f_g0;
    f6 = f6+f10;
    f8 = f8+f8;
    f10 =                       0.5;
    heapClassInst.heapFloat[(fp+(-187))] = Float32(f10);
    f11 = Float64(heapClassInst.heapFloat[(r1+30)]);
    f12 = Float64(heapClassInst.heapFloat[(r1+14)]);
    f13 = Float64(heapClassInst.heapFloat[(r1+29)]);
    f14 = Float64(heapClassInst.heapFloat[(r1+13)]);
    f15 = Float64(heapClassInst.heapFloat[(r1+28)]);
    f16 = Float64(heapClassInst.heapFloat[(r1+12)]);
    f17 = Float64(heapClassInst.heapFloat[(fp+(-160))]);
    f18 = Float64(heapClassInst.heapFloat[(r4+4)]);
    f19 = Float64(heapClassInst.heapFloat[(r4+8)]);
    f20 = Float64(heapClassInst.heapFloat[(r4+1)]);
    f21 = Float64(heapClassInst.heapFloat[(r4+5)]);
    f22 = Float64(heapClassInst.heapFloat[(r4+9)]);
    f23 = Float64(heapClassInst.heapFloat[(r4+2)]);
    f24 = Float64(heapClassInst.heapFloat[(r4+6)]);
    f25 = Float64(heapClassInst.heapFloat[(r4+10)]);
    r4 = sp + (-236);
    f7 = f7+f9;
    f6 = f6+f6;
    f8 = f8*f10;
    heapClassInst.heapFloat[(fp+(-179))] = Float32(f8);
    f0 = f0+f5;
    f5 = f7+f7;
    f6 = f6*f10;
    heapClassInst.heapFloat[(fp+(-178))] = Float32(f6);
    r6 = r4 >> 2;
    heapClassInst.heapFloat[(fp+(-59))] = Float32(f8);
    f1 = f1+f4;
    f0 = f0+f0;
    f4 = f5*f10;
    heapClassInst.heapFloat[(fp+(-177))] = Float32(f4);
    heapClassInst.heapFloat[(r6+1)] = Float32(f6);
    r7 = sp + (-248);
    heapClassInst.heap32[(fp+(-186))] = Int32(r7);
    f2 = f2+f3;
    f1 = f1+f1;
    f0 = f0*f10;
    heapClassInst.heapFloat[(fp+(-181))] = Float32(f0);
    heapClassInst.heapFloat[(r6+2)] = Float32(f4);
    f2 = f2+f2;
    f1 = f1*f10;
    heapClassInst.heapFloat[(fp+(-182))] = Float32(f1);
    r6 = r7 >> 2;
    heapClassInst.heapFloat[(fp+(-62))] = Float32(f0);
    f0 = f2*f10;
    heapClassInst.heapFloat[(fp+(-180))] = Float32(f0);
    heapClassInst.heapFloat[(r6+1)] = Float32(f1);
    heapClassInst.heapFloat[(r6+2)] = Float32(f0);
    f0 = f15-f16;
    heapClassInst.heapFloat[(fp+(-183))] = Float32(f0);
    f1 = f13-f14;
    heapClassInst.heapFloat[(fp+(-184))] = Float32(f1);
    f2 = Float64(heapClassInst.heapFloat[(fp+(-172))]);
    heapClassInst.heapFloat[(fp+(-194))] = Float32(f2);
    f3 = Float64(heapClassInst.heapFloat[(r5+4)]);
    heapClassInst.heapFloat[(fp+(-195))] = Float32(f3);
    f4 = Float64(heapClassInst.heapFloat[(r5+1)]);
    heapClassInst.heapFloat[(fp+(-191))] = Float32(f4);
    f5 = Float64(heapClassInst.heapFloat[(r5+5)]);
    heapClassInst.heapFloat[(fp+(-192))] = Float32(f5);
    f6 = Float64(heapClassInst.heapFloat[(r5+2)]);
    heapClassInst.heapFloat[(fp+(-188))] = Float32(f6);
    f7 = Float64(heapClassInst.heapFloat[(r5+6)]);
    heapClassInst.heapFloat[(fp+(-189))] = Float32(f7);
    f8 = f11-f12;
    heapClassInst.heapFloat[(fp+(-185))] = Float32(f8);
    f9 = Float64(heapClassInst.heapFloat[(r5+8)]);
    heapClassInst.heapFloat[(fp+(-196))] = Float32(f9);
    f10 = Float64(heapClassInst.heapFloat[(r5+9)]);
    heapClassInst.heapFloat[(fp+(-193))] = Float32(f10);
    f11 = Float64(heapClassInst.heapFloat[(r5+10)]);
    heapClassInst.heapFloat[(fp+(-190))] = Float32(f11);
    f12 = f17*f2;
    f13 = f18*f3;
    f14 = f17*f0;
    f15 = f18*f1;
    f16 = f20*f0;
    f26 = f21*f1;
    f0 = f23*f0;
    heapClassInst.heapFloat[(fp+(-198))] = Float32(f0);
    f1 = f24*f1;
    f27 = f17*f4;
    f28 = f18*f5;
    f17 = f17*f6;
    f18 = f18*f7;
    f29 = f20*f2;
    f30 = f21*f3;
    f0 = f20*f4;
    heapClassInst.heapFloat[(fp+(-197))] = Float32(f0);
    f0 = f21*f5;
    f20 = f20*f6;
    f21 = f21*f7;
    f2 = f23*f2;
    f3 = f24*f3;
    f4 = f23*f4;
    f5 = f24*f5;
    f6 = f23*f6;
    f7 = f24*f7;
    f12 = f12+f13;
    f13 = f19*f9;
    f14 = f14+f15;
    f15 = f19*f8;
    f16 = f16+f26;
    f23 = f22*f8;
    f24 = Float64(heapClassInst.heapFloat[(fp+(-198))]);
    f1 = f24+f1;
    f8 = f25*f8;
    f24 = f27+f28;
    f26 = f19*f10;
    f17 = f17+f18;
    f18 = f19*f11;
    f19 = f29+f30;
    f27 = f22*f9;
    f28 = Float64(heapClassInst.heapFloat[(fp+(-197))]);
    f0 = f28+f0;
    f28 = f22*f10;
    f20 = f20+f21;
    f21 = f22*f11;
    f2 = f2+f3;
    f3 = f25*f9;
    f4 = f4+f5;
    f5 = f25*f10;
    f6 = f6+f7;
    f7 = f25*f11;
    f9 = f12+f13;
    r5 = Int64(heapClassInst.heap32[(fp+2)]);
    r6 = (r2 + 4)|0;
    r7 = (r3 + 4)|0;
    r8 = (r2 + 8)|0;
    r9 = (r3 + 8)|0;
    r10 = (r0 + 112)|0;
    r0 = (r0 + 48)|0;
    f10 = f14+f15;
    f11 = f16+f23;
    f1 = f1+f8;
    f8 = f24+f26;
    f12 = f17+f18;
    f13 = f19+f27;
    f0 = f0+f28;
    f14 = f20+f21;
    f2 = f2+f3;
    f3 = f4+f5;
    f4 = f6+f7;
    f5 = 0.0;
    if(f9 < f5) 
    {
        f6 = -f9;
    }
    else{
        f6 = f9;
    }
    if(f8 < f5) 
    {
        f7 = -f8;
    }
    else{
        f7 = f8;
    }
    if(f12 < f5) 
    {
        f15 = -f12;
    }
    else{
        f15 = f12;
    }
    if(f13 < f5) 
    {
        f16 = -f13;
    }
    else{
        f16 = f13;
    }
    if(f0 < f5) 
    {
        f17 = -f0;
    }
    else{
        f17 = f0;
    }
    if(f14 < f5) 
    {
        f18 = -f14;
    }
    else{
        f18 = f14;
    }
    if(f2 < f5) 
    {
        f19 = -f2;
    }
    else{
        f19 = f2;
    }
    if(f3 < f5) 
    {
        f20 = -f3;
    }
    else{
        f20 = f3;
    }
    if(f4 < f5) 
    {
        f21 = -f4;
    }
    else{
        f21 = f4;
    }
    if(f10 < f5) 
    {
        f22 = -f10;
    }
    else{
        f22 = f10;
    }
    f23 = Float64(heapClassInst.heapFloat[(fp+(-181))]);
    f23 = f23*f6;
    f24 = Float64(heapClassInst.heapFloat[(fp+(-179))]);
    f23 = f24+f23;
    f24 = Float64(heapClassInst.heapFloat[(fp+(-182))]);
    f24 = f24*f7;
    f23 = f23+f24;
    f24 = Float64(heapClassInst.heapFloat[(fp+(-180))]);
    f24 = f24*f15;
    f23 = f23+f24;
    f22 = f22-f23;
    do  {
    if(!(f22 > f5)) 
    {
        f23 =  -3.4028234663852886e38;
        if(f22 > f23) 
        {
            f23 =  0.0;
            r11 = if (f10 < f23) {1} else {0};
            r13 = sp + (-640);
            r11 = r11 & 1;
            r12 = 1;
            f23 = f22;
        }
        else{
            r11 = 0;
            r12 = r11;
            r13 = r11;
        }
        if(f11 < f5) 
        {
            f22 = -f11;
        }
        else{
            f22 = f11;
        }
        f24 = Float64(heapClassInst.heapFloat[(fp+(-181))]);
        f24 = f24*f16;
        f25 = Float64(heapClassInst.heapFloat[(fp+(-178))]);
        f24 = f25+f24;
        f25 = Float64(heapClassInst.heapFloat[(fp+(-182))]);
        f25 = f25*f17;
        f24 = f24+f25;
        f25 = Float64(heapClassInst.heapFloat[(fp+(-180))]);
        f25 = f25*f18;
        f24 = f24+f25;
        f22 = f22-f24;
        if(!(f22 > f5)) 
        {
            if(f22 > f23) 
            {
                f23 = 0.0;
                r11 = if (f11 < f23) {1} else {0};
                r11 = r11 & 1;
                r12 = 2;
                f23 = f22;
                r13 = r6;
            }
            if(f1 < f5) 
            {
                f22 = -f1;
            }
            else{
                f22 = f1;
            }
            f24 = Float64(heapClassInst.heapFloat[(fp+(-181))]);
            f24 = f24*f19;
            f25 = Float64(heapClassInst.heapFloat[(fp+(-177))]);
            f24 = f25+f24;
            f25 = Float64(heapClassInst.heapFloat[(fp+(-182))]);
            f25 = f25*f20;
            f24 = f24+f25;
            f25 = Float64(heapClassInst.heapFloat[(fp+(-180))]);
            f25 = f25*f21;
            f24 = f24+f25;
            f22 = f22-f24;
            if(!(f22 > f5)) 
            {
                if(f22 > f23) 
                {
                    f23 = 0.0;
                    r11 = if (f1 < f23) {1} else {0};
                    r11 = r11 & 1;
                    r12 = 3;
                    f23 = f22;
                    r13 = r8;
                }
                f24 = Float64(heapClassInst.heapFloat[(fp+(-183))]);
                f22 = Float64(heapClassInst.heapFloat[(fp+(-194))]);
                f22 = f22*f24;
                f25 = Float64(heapClassInst.heapFloat[(fp+(-184))]);
                f24 = Float64(heapClassInst.heapFloat[(fp+(-195))]);
                f24 = f24*f25;
                f22 = f22+f24;
                f25 = Float64(heapClassInst.heapFloat[(fp+(-185))]);
                f24 = Float64(heapClassInst.heapFloat[(fp+(-196))]);
                f24 = f24*f25;
                f22 = f22+f24;
                if(f22 < f5) 
                {
                    f24 = -f22;
                }
                else{
                    f24 = f22;
                }
                f25 = Float64(heapClassInst.heapFloat[(fp+(-179))]);
                f25 = f25*f6;
                f26 = Float64(heapClassInst.heapFloat[(fp+(-178))]);
                f26 = f26*f16;
                f25 = f25+f26;
                f26 = Float64(heapClassInst.heapFloat[(fp+(-177))]);
                f26 = f26*f19;
                f25 = f25+f26;
                f26 = Float64(heapClassInst.heapFloat[(fp+(-181))]);
                f25 = f25+f26;
                f24 = f24-f25;
                if(!(f24 > f5)) 
                {
                    if(f24 > f23) 
                    {
                        f23 =                         0.0;
                        r11 = if (f22 < f23) {1} else {0};
                        r13 = sp + (-688);
                        r11 = r11 & 1;
                        r12 = 4;
                        f23 = f24;
                    }
                    f24 = Float64(heapClassInst.heapFloat[(fp+(-183))]);
                    f22 = Float64(heapClassInst.heapFloat[(fp+(-191))]);
                    f22 = f22*f24;
                    f25 = Float64(heapClassInst.heapFloat[(fp+(-184))]);
                    f24 = Float64(heapClassInst.heapFloat[(fp+(-192))]);
                    f24 = f24*f25;
                    f22 = f22+f24;
                    f25 = Float64(heapClassInst.heapFloat[(fp+(-185))]);
                    f24 = Float64(heapClassInst.heapFloat[(fp+(-193))]);
                    f24 = f24*f25;
                    f22 = f22+f24;
                    if(f22 < f5) 
                    {
                        f24 = -f22;
                    }
                    else{
                        f24 = f22;
                    }
                    f25 = Float64(heapClassInst.heapFloat[(fp+(-179))]);
                    f25 = f25*f7;
                    f26 = Float64(heapClassInst.heapFloat[(fp+(-178))]);
                    f26 = f26*f17;
                    f25 = f25+f26;
                    f26 = Float64(heapClassInst.heapFloat[(fp+(-177))]);
                    f26 = f26*f20;
                    f25 = f25+f26;
                    f26 = Float64(heapClassInst.heapFloat[(fp+(-182))]);
                    f25 = f25+f26;
                    f24 = f24-f25;
                    if(!(f24 > f5)) 
                    {
                        if(f24 > f23) 
                        {
                            f23 =                         0.0;
                            r11 = if (f22 < f23) {1} else {0};
                            r11 = r11 & 1;
                            r12 = 5;
                            f23 = f24;
                            r13 = r7;
                        }
                        f24 = Float64(heapClassInst.heapFloat[(fp+(-183))]);
                        f22 = Float64(heapClassInst.heapFloat[(fp+(-188))]);
                        f22 = f22*f24;
                        f25 = Float64(heapClassInst.heapFloat[(fp+(-184))]);
                        f24 = Float64(heapClassInst.heapFloat[(fp+(-189))]);
                        f24 = f24*f25;
                        f22 = f22+f24;
                        f25 = Float64(heapClassInst.heapFloat[(fp+(-185))]);
                        f24 = Float64(heapClassInst.heapFloat[(fp+(-190))]);
                        f24 = f24*f25;
                        f22 = f22+f24;
                        if(f22 < f5) 
                        {
                            f24 = -f22;
                        }
                        else{
                            f24 = f22;
                        }
                        f25 = Float64(heapClassInst.heapFloat[(fp+(-179))]);
                        f25 = f25*f15;
                        f26 = Float64(heapClassInst.heapFloat[(fp+(-178))]);
                        f26 = f26*f18;
                        f25 = f25+f26;
                        f26 = Float64(heapClassInst.heapFloat[(fp+(-177))]);
                        f26 = f26*f21;
                        f25 = f25+f26;
                        f26 = Float64(heapClassInst.heapFloat[(fp+(-180))]);
                        f25 = f25+f26;
                        f24 = f24-f25;
                        if(!(f24 > f5)) 
                        {
                            if(f24 > f23) 
                            {
                                f23 =                         0.0;
                                r11 = if (f22 < f23) {1} else {0};
                                r11 = r11 & 1;
                                r12 = 6;
                                f23 = f24;
                                r13 = r9;
                            }
                            f22 = f1*f13;
                            f24 = f11*f2;
                            f25 =   9.9999997473787516e-006;
                            f22 = f22-f24;
                            f6 = f6+f25;
                            f7 = f7+f25;
                            f15 = f15+f25;
                            heapClassInst.heapFloat[(fp+(-183))] = Float32(f15);
                            f15 = f16+f25;
                            f16 = f17+f25;
                            f17 = f18+f25;
                            f18 = f19+f25;
                            heapClassInst.heapFloat[(fp+(-184))] = Float32(f18);
                            f18 = f20+f25;
                            heapClassInst.heapFloat[(fp+(-185))] = Float32(f18);
                            f18 = f21+f25;
                            if(f22 < f5) 
                            {
                                f19 = -f22;
                            }
                            else{
                                f19 = f22;
                            }
                            f21 = Float64(heapClassInst.heapFloat[(fp+(-184))]);
                            f20 = Float64(heapClassInst.heapFloat[(fp+(-178))]);
                            f20 = f20*f21;
                            f21 = Float64(heapClassInst.heapFloat[(fp+(-177))]);
                            f21 = f21*f15;
                            f20 = f20+f21;
                            f24 = Float64(heapClassInst.heapFloat[(fp+(-183))]);
                            f21 = Float64(heapClassInst.heapFloat[(fp+(-182))]);
                            f21 = f21*f24;
                            f20 = f20+f21;
                            f21 = Float64(heapClassInst.heapFloat[(fp+(-180))]);
                            f21 = f21*f7;
                            f20 = f20+f21;
                            f19 = f19-f20;
                            f20 =   1.1920928955078125e-007;
                            if(!(f19 > f20)) 
                            {
                                f21 = f2*f2;
                                f21 = f21+f5;
                                f24 = f13*f13;
                                heapClassInst.heapFloat[(fp+(-188))] = Float32(f24);
                                f24 = f21+f24;
                                heapClassInst.heapFloat[(g0)] = Float32(f24);
                                sqrtf(i7);
                                f24 = commonVariable.f_g0;
                                if(f24 > f20) 
                                {
                                    f25 = f19/f24;
                                    f19 =        1.0499999523162842;
                                    f19 = f25*f19;
                                    if(f19 <= f23) 
                                    {
                                        __label__ = 69;
                                    }
                                    else{
                                        f19 =                         0.0
                                        f23 = -f2;
                                        r11 = if (f22 < f19) {1} else {0};
                                        f19 = f19/f24;
                                        f22 = f23/f24;
                                        f24 = f13/f24;
                                        r11 = r11 & 1;
                                        r12 = 7;
                                        r13 = 0;
                                        f23 = f25;
                                        __label__ = 72;
                                    }
                                }
                                else{
                                    __label__ = 69;
                                }
                                if (__label__ == 69){
                                    f19 = f5;
                                    f22 = f5;
                                    f24 = f5;
                                }
                                f25 = f1*f0;
                                f26 = f11*f3;
                                f25 = f25-f26;
                                if(f25 < f5) 
                                {
                                    f5 = -f25;
                                }
                                else{
                                    f5 = f25;
                                }
                                f27 = Float64(heapClassInst.heapFloat[(fp+(-185))]);
                                f26 = Float64(heapClassInst.heapFloat[(fp+(-178))]);
                                f26 = f26*f27;
                                f27 = Float64(heapClassInst.heapFloat[(fp+(-177))]);
                                f27 = f27*f16;
                                f26 = f26+f27;
                                f28 = Float64(heapClassInst.heapFloat[(fp+(-183))]);
                                f27 = Float64(heapClassInst.heapFloat[(fp+(-181))]);
                                f27 = f27*f28;
                                f26 = f26+f27;
                                f27 = Float64(heapClassInst.heapFloat[(fp+(-180))]);
                                f27 = f27*f6;
                                f26 = f26+f27;
                                f5 = f5-f26;
                                if(!(f5 > f20)) 
                                {
                                    f26 = f3*f3;
                                    f27 =                         0.0;
                                    f26 = f26+f27;
                                    f28 = f0*f0;
                                    heapClassInst.heapFloat[(fp+(-189))] = Float32(f28);
                                    f28 = f26+f28;
                                    heapClassInst.heapFloat[(g0)] = Float32(f28);
                                    sqrtf(i7);
                                    f28 = commonVariable.f_g0;
                                    if(f28 > f20) 
                                    {
                                        f5 = f5/f28;
                                        f29 =        1.0499999523162842;
                                        f29 = f5*f29;
                                        if(!(f29 <= f23)) 
                                        {
                                            f19 =                         0.0;
                                            f22 = -f3;
                                            r11 = if (f25 < f19) {1} else {0};
                                            f19 = f19/f28;
                                            f22 = f22/f28;
                                            f24 = f0/f28;
                                            r11 = r11 & 1;
                                            r12 = 8;
                                            r13 = 0;
                                            f23 = f5;
                                        }
                                    }
                                    f5 = f1*f14;
                                    f25 = f11*f4;
                                    f5 = f5-f25;
                                    if(f5 < f27) 
                                    {
                                        f25 = -f5;
                                    }
                                    else{
                                        f25 = f5;
                                    }
                                    f28 = Float64(heapClassInst.heapFloat[(fp+(-178))]);
                                    f28 = f28*f18;
                                    f29 = Float64(heapClassInst.heapFloat[(fp+(-177))]);
                                    f29 = f29*f17;
                                    f28 = f28+f29;
                                    f29 = Float64(heapClassInst.heapFloat[(fp+(-181))]);
                                    f29 = f29*f7;
                                    f28 = f28+f29;
                                    f29 = Float64(heapClassInst.heapFloat[(fp+(-182))]);
                                    f29 = f29*f6;
                                    f28 = f28+f29;
                                    f25 = f25-f28;
                                    if(!(f25 > f20)) 
                                    {
                                        f28 = f4*f4;
                                        f28 = f28+f27;
                                        f29 = f14*f14;
                                        heapClassInst.heapFloat[(fp+(-190))] = Float32(f29);
                                        f29 = f28+f29;
                                        heapClassInst.heapFloat[(g0)] = Float32(f29);
                                        sqrtf(i7);
                                        f29 = commonVariable.f_g0;
                                        if(f29 > f20) 
                                        {
                                            f25 = f25/f29;
                                            f30 =        1.0499999523162842;
                                            f30 = f25*f30;
                                            if(!(f30 <= f23)) 
                                            {
                                                f19 =                         0.0
                                                f22 = -f4
                                                r11 = if (f5 < f19) {1} else {0}
                                                f19 = f19/f29;
                                                f22 = f22/f29;
                                                f24 = f14/f29;
                                                r11 = r11 & 1;
                                                r12 = 9;
                                                r13 = 0;
                                                f23 = f25;
                                            }
                                        }
                                        f5 = f10*f2;
                                        f25 = f1*f9;
                                        f5 = f5-f25;
                                        if(f5 < f27) 
                                        {
                                            f25 = -f5;
                                        }
                                        else{
                                            f25 = f5;
                                        }
                                        f30 = Float64(heapClassInst.heapFloat[(fp+(-184))]);
                                        f29 = Float64(heapClassInst.heapFloat[(fp+(-179))]);
                                        f29 = f29*f30;
                                        f30 = Float64(heapClassInst.heapFloat[(fp+(-177))]);
                                        f30 = f30*f6;
                                        f29 = f29+f30;
                                        f30 = Float64(heapClassInst.heapFloat[(fp+(-182))]);
                                        f30 = f30*f17;
                                        f29 = f29+f30;
                                        f30 = Float64(heapClassInst.heapFloat[(fp+(-180))]);
                                        f30 = f30*f16;
                                        f29 = f29+f30;
                                        f25 = f25-f29;
                                        if(!(f25 > f20)) 
                                        {
                                            f29 = f9*f9;
                                            f21 = f21+f29;
                                            heapClassInst.heapFloat[(g0)] = Float32(f21);
                                            sqrtf(i7);
                                            f21 = commonVariable.f_g0;
                                            if(f21 > f20) 
                                            {
                                                f25 = f25/f21;
                                                f30 =        1.0499999523162842;
                                                f30 = f25*f30;
                                                if(!(f30 <= f23)) 
                                                {
                                                    f22 =                         0.0;
                                                    f23 = -f9;
                                                    r11 = if (f5 < f22) {1} else {0};
                                                    f19 = f2/f21;
                                                    f22 = f22/f21;
                                                    f24 = f23/f21;
                                                    r11 = r11 & 1;
                                                    r12 = 10;
                                                    r13 = 0;
                                                    f23 = f25;
                                                }
                                            }
                                            f2 = f10*f3;
                                            f5 = f1*f8;
                                            f2 = f2-f5;
                                            if(f2 < f27) 
                                            {
                                                f5 = -f2;
                                            }
                                            else{
                                                f5 = f2;
                                            }
                                            f25 = Float64(heapClassInst.heapFloat[(fp+(-185))])
                                            f21 = Float64(heapClassInst.heapFloat[(fp+(-179))])
                                            f21 = f21*f25
                                            f25 = Float64(heapClassInst.heapFloat[(fp+(-177))])
                                            f25 = f25*f7
                                            f21 = f21+f25
                                            f25 = Float64(heapClassInst.heapFloat[(fp+(-181))])
                                            f25 = f25*f17
                                            f21 = f21+f25
                                            f25 = Float64(heapClassInst.heapFloat[(fp+(-180))])
                                            f25 = f25*f15
                                            f21 = f21+f25
                                            f5 = f5-f21
                                            if(!(f5 > f20)) 
                                            {
                                                f21 = f8*f8;
                                                f25 = f26+f21;
                                                heapClassInst.heapFloat[(g0)] = Float32(f25);
                                                sqrtf(i7);
                                                f25 = commonVariable.f_g0;
                                                if(f25 > f20) 
                                                {
                                                    f5 = f5/f25;
                                                    f26 =        1.0499999523162842;
                                                    f26 = f5*f26;
                                                    if(!(f26 <= f23)) 
                                                    {
                                                        f22 =                         0.0;
                                                        f23 = -f8;
                                                        r11 = if (f2 < f22) {1} else {0};
                                                        f19 = f3/f25;
                                                        f22 = f22/f25;
                                                        f24 = f23/f25;
                                                        r11 = r11 & 1;
                                                        r12 = 11;
                                                        r13 = 0;
                                                        f23 = f5;
                                                    }
                                                }
                                                f2 = f10*f4;
                                                f1 = f1*f12;
                                                f1 = f2-f1;
                                                if(f1 < f27) 
                                                {
                                                    f2 = -f1;
                                                }
                                                else{
                                                    f2 = f1;
                                                }
                                                f3 = Float64(heapClassInst.heapFloat[(fp+(-179))]);
                                                f3 = f3*f18;
                                                f25 = Float64(heapClassInst.heapFloat[(fp+(-183))]);
                                                f5 = Float64(heapClassInst.heapFloat[(fp+(-177))]);
                                                f5 = f5*f25;
                                                f3 = f3+f5;
                                                f5 = Float64(heapClassInst.heapFloat[(fp+(-181))]);
                                                f5 = f5*f16;
                                                f3 = f3+f5;
                                                f5 = Float64(heapClassInst.heapFloat[(fp+(-182))]);
                                                f5 = f5*f15;
                                                f3 = f3+f5;
                                                f2 = f2-f3;
                                                if(!(f2 > f20)) 
                                                {
                                                    f3 = f12*f12;
                                                    f5 = f28+f3;
                                                    heapClassInst.heapFloat[(g0)] = Float32(f5);
                                                    sqrtf(i7);
                                                    f5 = commonVariable.f_g0;
                                                    if(f5 > f20) 
                                                    {
                                                        f2 = f2/f5;
                                                        f25 =        1.0499999523162842;
                                                        f25 = f2*f25;
                                                        if(!(f25 <= f23)) 
                                                        {
                                                            f22 =                         0.0;
                                                            f23 = -f12;
                                                            r11 = if (f1 < f22) {1} else {0};
                                                            f19 = f4/f5;
                                                            f22 = f22/f5;
                                                            f24 = f23/f5;
                                                            r11 = r11 & 1;
                                                            r12 = 12;
                                                            r13 = 0;
                                                            f23 = f2;
                                                        }
                                                    }
                                                    f1 = f11*f9;
                                                    f2 = f10*f13;
                                                    f1 = f1-f2;
                                                    if(f1 < f27) 
                                                    {
                                                        f2 = -f1;
                                                    }
                                                    else{
                                                        f2 = f1;
                                                    }
                                                    f4 = Float64(heapClassInst.heapFloat[(fp+(-179))]);
                                                    f4 = f4*f15;
                                                    f5 = Float64(heapClassInst.heapFloat[(fp+(-178))]);
                                                    f5 = f5*f6;
                                                    f4 = f4+f5;
                                                    f5 = Float64(heapClassInst.heapFloat[(fp+(-182))]);
                                                    f5 = f5*f18;
                                                    f4 = f4+f5;
                                                    f6 = Float64(heapClassInst.heapFloat[(fp+(-185))]);
                                                    f5 = Float64(heapClassInst.heapFloat[(fp+(-180))]);
                                                    f5 = f5*f6;
                                                    f4 = f4+f5;
                                                    f2 = f2-f4;
                                                    if(!(f2 > f20)) 
                                                    {
                                                        f4 = Float64(heapClassInst.heapFloat[(fp+(-188))]);
                                                        f4 = f4+f29;
                                                        f4 = f4+f27;
                                                        heapClassInst.heapFloat[(g0)] = Float32(f4);
                                                        sqrtf(i7);
                                                        f4 = commonVariable.f_g0;
                                                        if(f4 > f20) 
                                                        {
                                                            f2 = f2/f4;
                                                            f5 =        1.0499999523162842;
                                                            f5 = f2*f5;
                                                            if(!(f5 <= f23)) 
                                                            {
                                                                f23 =                         0.0;
                                                                f19 = -f13;
                                                                r11 = if (f1 < f23) {1} else {0};
                                                                f19 = f19/f4;
                                                                f22 = f9/f4;
                                                                f24 = f23/f4;
                                                                r11 = r11 & 1;
                                                                r12 = 13;
                                                                r13 = 0;
                                                                f23 = f2;
                                                            }
                                                        }
                                                        f1 = f11*f8;
                                                        f2 = f10*f0;
                                                        f1 = f1-f2;
                                                        if(f1 < f27) 
                                                        {
                                                            f2 = -f1;
                                                        }
                                                        else{
                                                            f2 = f1;
                                                        }
                                                        f4 = Float64(heapClassInst.heapFloat[(fp+(-179))]);
                                                        f4 = f4*f16;
                                                        f5 = Float64(heapClassInst.heapFloat[(fp+(-178))]);
                                                        f5 = f5*f7;
                                                        f4 = f4+f5;
                                                        f5 = Float64(heapClassInst.heapFloat[(fp+(-181))]);
                                                        f5 = f5*f18;
                                                        f4 = f4+f5;
                                                        f6 = Float64(heapClassInst.heapFloat[(fp+(-184))]);
                                                        f5 = Float64(heapClassInst.heapFloat[(fp+(-180))]);
                                                        f5 = f5*f6;
                                                        f4 = f4+f5;
                                                        f2 = f2-f4;
                                                        if(!(f2 > f20)) 
                                                        {
                                                            f4 = Float64(heapClassInst.heapFloat[(fp+(-189))]);
                                                            f4 = f4+f21;
                                                            f4 = f4+f27;
                                                            heapClassInst.heapFloat[(g0)] = Float32(f4);
                                                            sqrtf(i7);
                                                            f4 = commonVariable.f_g0;
                                                            if(f4 > f20) 
                                                            {
                                                                f2 = f2/f4;
                                                                f5 =        1.0499999523162842;
                                                                f5 = f2*f5;
                                                                if(!(f5 <= f23)) 
                                                                {
                                                                    f23 =                         0.0
                                                                    f19 = -f0;
                                                                    r11 = if (f1 < f23) {1} else {0};
                                                                    f19 = f19/f4;
                                                                    f22 = f8/f4;
                                                                    f24 = f23/f4;
                                                                    r11 = r11 & 1;
                                                                    r12 = 14;
                                                                    r13 = 0;
                                                                    f23 = f2;
                                                                }
                                                            }
                                                            f0 = f11*f12;
                                                            f1 = f10*f14;
                                                            f0 = f0-f1;
                                                            if(f0 < f27) 
                                                            {
                                                                f1 = -f0;
                                                            }
                                                            else{
                                                                f1 = f0;
                                                            }
                                                            f2 = Float64(heapClassInst.heapFloat[(fp+(-179))]);
                                                            f2 = f2*f17;
                                                            f5 = Float64(heapClassInst.heapFloat[(fp+(-183))]);
                                                            f4 = Float64(heapClassInst.heapFloat[(fp+(-178))]);
                                                            f4 = f4*f5;
                                                            f2 = f2+f4;
                                                            f5 = Float64(heapClassInst.heapFloat[(fp+(-185))]);
                                                            f4 = Float64(heapClassInst.heapFloat[(fp+(-181))]);
                                                            f4 = f4*f5;
                                                            f2 = f2+f4;
                                                            f5 = Float64(heapClassInst.heapFloat[(fp+(-184))]);
                                                            f4 = Float64(heapClassInst.heapFloat[(fp+(-182))]);
                                                            f4 = f4*f5;
                                                            f2 = f2+f4;
                                                            f1 = f1-f2;
                                                            if(!(f1 > f20)) 
                                                            {
                                                                f2 = Float64(heapClassInst.heapFloat[(fp+(-190))]);
                                                                f2 = f2+f3;
                                                                f2 = f2+f27;
                                                                heapClassInst.heapFloat[(g0)] = Float32(f2);
                                                                sqrtf(i7);
                                                                f2 = commonVariable.f_g0;
                                                                if(f2 <= f20) 
                                                                {
                                                                    __label__ = 128;
                                                                }
                                                                else{
                                                                    f1 = f1/f2;
                                                                    heapClassInst.heapFloat[(fp+(-183))] = Float32(f1);
                                                                    f3 =        1.0499999523162842;
                                                                    f1 = f1*f3;
                                                                    if(f1 <= f23) 
                                                                    {
                                                                        __label__ = 128;
                                                                    }
                                                                    else{
                                                                        f23 =                         0.0;
                                                                        f19 = -f14;
                                                                        r11 = if (f0 < f23) {1} else {0};
                                                                        f19 = f19/f2;
                                                                        f22 = f12/f2;
                                                                        f24 = f23/f2;
                                                                        r11 = r11 & 1;
                                                                        r13 = sp + (-704);
                                                                        r12 = 15;
                                                                        __label__ = 132;
                                                                    }
                                                                }
                                                                if (__label__ == 128){
                                                                    if(r12 == 0) 
                                                                    {
                                                                        break 
                                                                    }
                                                                    else{
                                                                        if(r13 != 0) 
                                                                        {
                                                                            r13 = r13 >> 2;
                                                                            f0 = Float64(heapClassInst.heapFloat[(r13)]);
                                                                            r6 = sp + (-704);
                                                                            heapClassInst.heapFloat[(fp+(-176))] = Float32(f0);
                                                                            f1 = Float64(heapClassInst.heapFloat[(r13+4)]);
                                                                            r6 = r6 >> 2;
                                                                            heapClassInst.heapFloat[(r6+1)] = Float32(f1);
                                                                            f19 = Float64(heapClassInst.heapFloat[(r13+8)]);
                                                                            heapClassInst.heapFloat[(r6+2)] = Float32(f19);
                                                                            heapClassInst.heapFloat[(fp+(-183))] = Float32(f23);
                                                                            __label__ = 133;
                                                                        }
                                                                        else{
                                                                            r13 = sp + (-704);
                                                                            heapClassInst.heapFloat[(fp+(-183))] = Float32(f23);
                                                                            __label__ = 132;
                                                                        }
                                                                    }
                                                                }
                                                                if (__label__ == 132){
                                                                    r6 = sp + (-640);
                                                                    r6 = r6 >> 2;
                                                                    f0 = Float64(heapClassInst.heapFloat[(fp+(-160))]);
                                                                    f1 = Float64(heapClassInst.heapFloat[(r6+1)]);
                                                                    f2 = Float64(heapClassInst.heapFloat[(r6+2)]);
                                                                    f0 = f0*f19;
                                                                    f1 = f1*f22;
                                                                    f0 = f0+f1;
                                                                    f1 = f2*f24;
                                                                    f0 = f0+f1;
                                                                    r7 = r13 >> 2;
                                                                    heapClassInst.heapFloat[(r7)] = Float32(f0);
                                                                    f1 = Float64(heapClassInst.heapFloat[(r6+4)]);
                                                                    f2 = Float64(heapClassInst.heapFloat[(r6+5)]);
                                                                    f3 = Float64(heapClassInst.heapFloat[(r6+6)]);
                                                                    f1 = f1*f19;
                                                                    f2 = f2*f22;
                                                                    r7 = sp + (-704);
                                                                    f1 = f1+f2;
                                                                    f2 = f3*f24;
                                                                    f1 = f1+f2;
                                                                    r7 = r7 >> 2;
                                                                    heapClassInst.heapFloat[(r7+1)] = Float32(f1);
                                                                    f2 = Float64(heapClassInst.heapFloat[(r6+8)]);
                                                                    f3 = Float64(heapClassInst.heapFloat[(r6+9)]);
                                                                    f4 = Float64(heapClassInst.heapFloat[(r6+10)]);
                                                                    f19 = f2*f19;
                                                                    f2 = f3*f22;
                                                                    f19 = f19+f2;
                                                                    f2 = f4*f24;
                                                                    f19 = f19+f2;
                                                                    heapClassInst.heapFloat[(r7+2)] = Float32(f19);
                                                                }
                                                                if(r11 != 0) 
                                                                {
                                                                    f0 = -f0;
                                                                    r6 = sp + (-704);
                                                                    f1 = -f1;
                                                                    r6 = r6 >> 2;
                                                                    heapClassInst.heapFloat[(fp+(-176))] = Float32(f0);
                                                                    f19 = -f19;
                                                                    heapClassInst.heapFloat[(r6+1)] = Float32(f1);
                                                                    heapClassInst.heapFloat[(r6+2)] = Float32(f19);
                                                                   }
                                                                    if(r12 < 7) 
                                                                    {
                                                                        if(r12 > 3) 
                                                                        {
                                                                            f0 = -f0;
                                                                            f1 = -f1;
                                                                            f19 = -f19;
                                                                            r1 = r0;
                                                                            r0 = r10;
                                                                        }
                                                                        else{
                                                                            r3 = sp + (-640);
                                                                            r2 = sp + (-688);
                                                                            r4 = sp + (-236);
                                                                            heapClassInst.heap32[(fp+(-186))] = Int32(r4);
                                                                            r4 = sp + (-248);
                                                                            r1 = r10;
                                                                        }
                                                                        r6 = r2 >> 2;
                                                                        f2 = Float64(heapClassInst.heapFloat[(r6)]);
                                                                        f3 = Float64(heapClassInst.heapFloat[(r6+4)]);
                                                                        f4 = Float64(heapClassInst.heapFloat[(r6+8)]);
                                                                        f2 = f2*f0;
                                                                        f3 = f3*f1;
                                                                        f2 = f2+f3;
                                                                        f3 = f4*f19;
                                                                        f2 = f2+f3;
                                                                        heapClassInst.heapFloat[(fp+(-66))] = Float32(f2);
                                                                        f3 = Float64(heapClassInst.heapFloat[(r6+1)]);
                                                                        f4 = Float64(heapClassInst.heapFloat[(r6+5)]);
                                                                        f5 = Float64(heapClassInst.heapFloat[(r6+9)]);
                                                                        f3 = f3*f0;
                                                                        f4 = f4*f1;
                                                                        r7 = sp + (-264);
                                                                        f3 = f3+f4;
                                                                        f4 = f5*f19;
                                                                        f3 = f3+f4;
                                                                        r8 = r7 >> 2;
                                                                        heapClassInst.heapFloat[(r8+1)] = Float32(f3);
                                                                        f4 = Float64(heapClassInst.heapFloat[(r6+2)]);
                                                                        f5 = Float64(heapClassInst.heapFloat[(r6+6)]);
                                                                        f6 = Float64(heapClassInst.heapFloat[(r6+10)]);
                                                                        f4 = f4*f0;
                                                                        f5 = f5*f1;
                                                                        f4 = f4+f5;
                                                                        f5 = f6*f19;
                                                                        f4 = f4+f5;
                                                                        heapClassInst.heapFloat[(r8+2)] = Float32(f4);
                                                                        if(f2 < f27) 
                                                                        {
                                                                            f2 = -f2;
                                                                        }
                                                                        if(f3 < f27) 
                                                                        {
                                                                            f3 = -f3;
                                                                        }
                                                                        if(f4 < f27) 
                                                                        {
                                                                            f4 = -f4;
                                                                        }
                                                                        if(f3 <= f2) 
                                                                        {
                                                                            if(f2 <= f4) 
                                                                            {
                                                                                r6 = 2;
                                                                                r8 = 0;
                                                                                r9 = 1;
                                                                            }
                                                                            else{
                                                                                r6 = 0;
                                                                                r8 = 1;
                                                                                r9 = 2;
                                                                            }
                                                                        }
                                                                        else{
                                                                            if(f3 <= f4) 
                                                                            {
                                                                                r6 = 2;
                                                                                r8 = 0;
                                                                                r9 = 1;
                                                                            }
                                                                            else{
                                                                                r6 = 1;
                                                                                r8 = 0;
                                                                                r9 = 2;
                                                                            }
                                                                        }
                                                                        r10 = r6 << 2;
                                                                        r11 = (r4 + r10)|0;
                                                                        r13 = (r2 + r10)|0;
                                                                        r1 = r1 >> 2;
                                                                        r0 = r0 >> 2;
                                                                        r11 = r11 >> 2;
                                                                        r13 = r13 >> 2;
                                                                        f2 = Float64(heapClassInst.heapFloat[(r11)]);
                                                                        f3 = Float64(heapClassInst.heapFloat[(r13)]);
                                                                        f4 = Float64(heapClassInst.heapFloat[(r1)]);
                                                                        f5 = Float64(heapClassInst.heapFloat[(r0)]);
                                                                        r7 = (r7 + r10)|0;
                                                                        f4 = f4-f5;
                                                                        f3 = f2*f3;
                                                                        r7 = r7 >> 2;
                                                                        f5 = Float64(heapClassInst.heapFloat[(r7)]);
                                                                        if(f5 < f27) 
                                                                        {
                                                                            r7 = r6 | 4;
                                                                            r6 = r6 | 8;
                                                                            r7 = r7 << 2;
                                                                            r6 = r6 << 2;
                                                                            r7 = (r2 + r7)|0;
                                                                            r6 = (r2 + r6)|0;
                                                                            r7 = r7 >> 2;
                                                                            r6 = r6 >> 2;
                                                                            f5 = Float64(heapClassInst.heapFloat[(r1+1)]);
                                                                            f6 = Float64(heapClassInst.heapFloat[(r0+1)]);
                                                                            f7 = Float64(heapClassInst.heapFloat[(r7)]);
                                                                            f8 = Float64(heapClassInst.heapFloat[(r6)]);
                                                                            f9 = Float64(heapClassInst.heapFloat[(r1+2)]);
                                                                            f10 = Float64(heapClassInst.heapFloat[(r0+2)]);
                                                                            f5 = f5-f6;
                                                                            f6 = f2*f7;
                                                                            f7 = f9-f10;
                                                                            f2 = f2*f8;
                                                                            f3 = f4+f3;
                                                                            f4 = f5+f6;
                                                                            f2 = f7+f2;
                                                                        }
                                                                        else{
                                                                            r7 = r6 | 4;
                                                                            r6 = r6 | 8;
                                                                            r7 = r7 << 2;
                                                                            r6 = r6 << 2;
                                                                            r7 = (r2 + r7)|0;
                                                                            r6 = (r2 + r6)|0;
                                                                            r7 = r7 >> 2;
                                                                            r6 = r6 >> 2;
                                                                            f5 = Float64(heapClassInst.heapFloat[(r1+1)]);
                                                                            f6 = Float64(heapClassInst.heapFloat[(r0+1)]);
                                                                            f7 = Float64(heapClassInst.heapFloat[(r7)]);
                                                                            f8 = Float64(heapClassInst.heapFloat[(r6)]);
                                                                            f9 = Float64(heapClassInst.heapFloat[(r1+2)]);
                                                                            f10 = Float64(heapClassInst.heapFloat[(r0+2)]);
                                                                            f5 = f5-f6;
                                                                            f6 = f2*f7;
                                                                            f7 = f9-f10;
                                                                            f2 = f2*f8;
                                                                            f3 = f4-f3;
                                                                            f4 = f5-f6;
                                                                            f2 = f7-f2;
                                                                        }
                                                                        r1 = ( -1);
                                                                        r6 = ( -4);
                                                                        r6 = if(r12 < 4) {r1} else {r6};
                                                                        r6 = (r6 + r12)|0;
                                                                        if(r6 == 1) 
                                                                        {
                                                                            r7 = 0;
                                                                            r10 = 2;
                                                                        }
                                                                        else{
                                                                            if(r6 != 0) 
                                                                            {
                                                                                r7 = 0;
                                                                                r10 = 1;
                                                                            }
                                                                            else{
                                                                                r7 = 1;
                                                                                r10 = 2;
                                                                            }
                                                                        }
                                                                        r11 = r8 | 4;
                                                                        r13 = r7 | 4;
                                                                        r14 = r8 | 8;
                                                                        r15 = r9 | 4;
                                                                        r16 = r7 | 8;
                                                                        r17 = r10 | 4;
                                                                        r7 = r7 << 2;
                                                                        r13 = r13 << 2;
                                                                        r11 = r11 << 2;
                                                                        r8 = r8 << 2;
                                                                        r18 = r9 | 8;
                                                                        r19 = (r3 + r7)|0;
                                                                        r13 = (r3 + r13)|0;
                                                                        r16 = r16 << 2;
                                                                        r20 = r10 << 2;
                                                                        r17 = r17 << 2;
                                                                        r10 = r10 | 8;
                                                                        r21 = (r2 + r8)|0;
                                                                        r11 = (r2 + r11)|0;
                                                                        r14 = r14 << 2;
                                                                        r15 = r15 << 2;
                                                                        r9 = r9 << 2;
                                                                        r19 = r19 >> 2;
                                                                        r13 = r13 >> 2;
                                                                        r16 = (r3 + r16)|0;
                                                                        r22 = (r3 + r20)|0;
                                                                        r17 = (r3 + r17)|0;
                                                                        r10 = r10 << 2;
                                                                        r21 = r21 >> 2;
                                                                        heapClassInst.heap32[(fp+(-178))] = Int32(r21);
                                                                        r11 = r11 >> 2;
                                                                        heapClassInst.heap32[(fp+(-177))] = Int32(r11);
                                                                        r14 = (r2 + r14)|0;
                                                                        r23 = (r2 + r9)|0;
                                                                        r15 = (r2 + r15)|0;
                                                                        r18 = r18 << 2;
                                                                        r16 = r16 >> 2;
                                                                        r22 = r22 >> 2;
                                                                        r17 = r17 >> 2;
                                                                        r3 = (r3 + r10)|0;
                                                                        r10 = r14 >> 2;
                                                                        heapClassInst.heap32[(fp+(-179))] = Int32(r10);
                                                                        r14 = r23 >> 2;
                                                                        heapClassInst.heap32[(fp+(-180))] = Int32(r14);
                                                                        r15 = r15 >> 2;
                                                                        r2 = (r2 + r18)|0;
                                                                        f5 = Float64(heapClassInst.heapFloat[(r19)]);
                                                                        f6 = Float64(heapClassInst.heapFloat[(r21)]);
                                                                        f7 = Float64(heapClassInst.heapFloat[(r13)]);
                                                                        f8 = Float64(heapClassInst.heapFloat[(r11)]);
                                                                        f9 = Float64(heapClassInst.heapFloat[(r22)]);
                                                                        f10 = Float64(heapClassInst.heapFloat[(r14)]);
                                                                        f11 = Float64(heapClassInst.heapFloat[(r17)]);
                                                                        f12 = Float64(heapClassInst.heapFloat[(r15)]);
                                                                        r3 = r3 >> 2;
                                                                        r2 = r2 >> 2;
                                                                        r8 = (r4 + r8)|0;
                                                                        f13 = f5*f6;
                                                                        f14 = f7*f8;
                                                                        f15 = Float64(heapClassInst.heapFloat[(r16)]);
                                                                        f16 = Float64(heapClassInst.heapFloat[(r10)]);
                                                                        f17 = Float64(heapClassInst.heapFloat[(r3)]);
                                                                        f18 = Float64(heapClassInst.heapFloat[(r2)]);
                                                                        r3 = r8 >> 2;
                                                                        r4 = (r4 + r9)|0;
                                                                        f6 = f9*f6;
                                                                        f8 = f11*f8;
                                                                        f21 = f3*f5;
                                                                        f22 = f4*f7;
                                                                        f13 = f13+f14;
                                                                        f14 = f15*f16;
                                                                        f5 = f5*f10;
                                                                        f7 = f7*f12;
                                                                        f13 = f13+f14;
                                                                        f14 = Float64(heapClassInst.heapFloat[(r3)]);
                                                                        r3 = r4 >> 2;
                                                                        f23 = f3*f9;
                                                                        f24 = f4*f11;
                                                                        f6 = f6+f8;
                                                                        f8 = f17*f16;
                                                                        f9 = f9*f10;
                                                                        f10 = f11*f12;
                                                                        f11 = f21+f22;
                                                                        f12 = f2*f15;
                                                                        f5 = f5+f7;
                                                                        f7 = f15*f18;
                                                                        f6 = f6+f8;
                                                                        f8 = f11+f12;
                                                                        f11 = f14*f13;
                                                                        f5 = f5+f7;
                                                                        f7 = Float64(heapClassInst.heapFloat[(r3)]);
                                                                        f12 = f23+f24;
                                                                        f15 = f2*f17;
                                                                        f9 = f9+f10;
                                                                        f10 = f17*f18;
                                                                        f9 = f9+f10;
                                                                        f10 = f12+f15;
                                                                        f12 = f14*f6;
                                                                        f14 = f8-f11;
                                                                        f15 = f7*f5;
                                                                        r3 = sp + (-296);
                                                                        f16 = f10-f12;
                                                                        f7 = f7*f9;
                                                                        f17 = f14-f15;
                                                                        r4 = r3 >> 2;
                                                                        f18 = f16-f7;
                                                                        heapClassInst.heapFloat[(fp+(-74))] = Float32(f17);
                                                                        f14 = f14+f15;
                                                                        heapClassInst.heapFloat[(r4+1)] = Float32(f18);
                                                                        f11 = f8+f11;
                                                                        f16 = f16+f7;
                                                                        heapClassInst.heapFloat[(r4+2)] = Float32(f14);
                                                                        f12 = f10+f12;
                                                                        f14 = f11+f15;
                                                                        heapClassInst.heapFloat[(r4+3)] = Float32(f16);
                                                                        f16 = f12+f7;
                                                                        heapClassInst.heapFloat[(r4+4)] = Float32(f14);
                                                                        f11 = f11-f15;
                                                                        heapClassInst.heapFloat[(r4+5)] = Float32(f16);
                                                                        r8 = Int64(heapClassInst.heap32[(fp+(-186))]);
                                                                        r7 = (r8 + r7)|0;
                                                                        f7 = f12-f7;
                                                                        heapClassInst.heapFloat[(r4+6)] = Float32(f11);
                                                                        r9 = sp + (-304);
                                                                        r8 = (r8 + r20)|0;
                                                                        r7 = r7 >> 2;
                                                                        heapClassInst.heapFloat[(r4+7)] = Float32(f7);
                                                                        r4 = sp + (-368);
                                                                        r10 = 0;
                                                                        r11 = 4;
                                                                        r13 = r9 >> 2;
                                                                        r8 = r8 >> 2;
                                                                        heapClassInst.heap32[(fp+(-76))] = heapClassInst.heap32[(r7)];
                                                                        heapClassInst.heap32[(r13+1)] = heapClassInst.heap32[(r8)];
                                                                        r7 = r10;
                                                                        while(true){
                                                                            if(r7 < 2) 
                                                                            {
                                                                                r18 = 0;
                                                                                r17 = (r18 - r7)|0;
                                                                                r14 = r1;
                                                                                r8 = r4;
                                                                                while(true){
                                                                                    r4 = r8;
                                                                                    if(r14 > 1) 
                                                                                    {
                                                                                        break 
                                                                                    }
                                                                                    else{
                                                                                        f7 = Float64(r14); 
                                                                                        r16 = (r3 + 8)|0;
                                                                                        r8 = r18;
                                                                                        r10 = r18;
                                                                                        r13 = r4;
                                                                                        while(true){
                                                                                            if(r11 > 0) 
                                                                                            {
                                                                                                r19 = (r3 + r8)|0;
                                                                                                r20 = (r16 + r8)|0;
                                                                                                r21 = r7 << 2;
                                                                                                r22 = (r9 + r21)|0;
                                                                                                r23 = (r19 + r21)|0;
                                                                                                r22 = r22 >> 2;
                                                                                                r23 = r23 >> 2;
                                                                                                f11 = Float64(heapClassInst.heapFloat[(r22)]);
                                                                                                f12 = Float64(heapClassInst.heapFloat[(r23)]);
                                                                                                f14 = f7*f12;
                                                                                                if(f14 < f11) 
                                                                                                {
                                                                                                    r24 = r13 >> 2;
                                                                                                    r25 = r19 >> 2;
                                                                                                    r10 = (r10 + 1)|0;
                                                                                                    heapClassInst.heap32[(r24)] = heapClassInst.heap32[(r25)];
                                                                                                    heapClassInst.heap32[(r24+1)] = heapClassInst.heap32[(r25+1)];
                                                                                                    r24 = r10 & 8;
                                                                                                    if(r24 == 0) 
                                                                                                    {
                                                                                                        r13 = (r13 + 8)|0;
                                                                                                        f12 = Float64(heapClassInst.heapFloat[(r23)]);
                                                                                                        f11 = Float64(heapClassInst.heapFloat[(r22)]);
                                                                                                    }
                                                                                                    else{
                                                                                                        __label__ = 179;
                                                                                                        break 
                                                                                                    }
                                                                                                }
                                                                                                r20 = if (r11 > 1) { r20 } else {r3};
                                                                                                r23 = (r20 + r21)|0;
                                                                                                r23 = r23 >> 2;
                                                                                                f14 = Float64(heapClassInst.heapFloat[(r23)]);
                                                                                                f15 = f7*f12;
                                                                                                f16 = f7*f14;
                                                                                                r23 = if (f15 < f11) {1} else {0};
                                                                                                r24 = if (f16 < f11) {1} else {0};
                                                                                                r23 = r23 ^ r24;
                                                                                                if(r23 != 0) 
                                                                                                {
                                                                                                    r23 = r17 << 2;
                                                                                                    r19 = (r19 + r23)|0;
                                                                                                    r20 = (r20 + r23)|0;
                                                                                                    r19 = r19 >> 2;
                                                                                                    r20 = r20 >> 2;
                                                                                                    f15 = Float64(heapClassInst.heapFloat[(r19+1)]);
                                                                                                    f16 = Float64(heapClassInst.heapFloat[(r20+1)]);
                                                                                                    f11 = f7*f11;
                                                                                                    f16 = f16-f15;
                                                                                                    f14 = f14-f12;
                                                                                                    f14 = f16/f14;
                                                                                                    f11 = f11-f12;
                                                                                                    r19 = (r13 + r23)|0;
                                                                                                    f11 = f14*f11;
                                                                                                    r19 = r19 >> 2;
                                                                                                    f11 = f15+f11;
                                                                                                    heapClassInst.heapFloat[(r19+1)] = Float32(f11);
                                                                                                    r19 = (r13 + r21)|0;
                                                                                                    f11 = Float64(heapClassInst.heapFloat[(r22)]);
                                                                                                    r10 = (r10 + 1)|0;
                                                                                                    r19 = r19 >> 2;
                                                                                                    f11 = f7*f11;
                                                                                                    heapClassInst.heapFloat[(r19)] = Float32(f11);
                                                                                                    r19 = r10 & 8;
                                                                                                    if(r19 == 0) 
                                                                                                    {
                                                                                                        r13 = (r13 + 8)|0;
                                                                                                    }
                                                                                                    else{
                                                                                                        __label__ = 179;
                                                                                                        break 
                                                                                                    }
                                                                                                }
                                                                                                r11 = (r11 + (-1))|0;
                                                                                                r8 = (r8 + 8)|0;
                                                                                            }
                                                                                            else{
                                                                                                break 
                                                                                            }
                                                                                        }
                                                                                        r3 = sp + (-368);
                                                                                        r8 = sp + (-128);
                                                                                        r8 = if (r4 == r3) {r8} else {r3};
                                                                                        r14 = (r14 + 2)|0;
                                                                                        r3 = r4;
                                                                                        r11 = r10;
                                                                                    }
                                                                                }
                                                                                r7 = (r7 + 1)|0;
                                                                            }
                                                                            else{
                                                                                __label__ = 177;
                                                                                break 
                                                                            }
                                                                        }
                                                                        if (__label__ == 177){
                                                                            r4 = r3;
                                                                        }
                                                                        r1 = sp + (-368);
                                                                        if(!(r4 == r1)) 
                                                                        {
                                                                            r3 = r10 << 3;
                                                                            heapClassInst.heap32[(g0)] = Int32(r1);
                                                                            heapClassInst.heap32[(g0+1)] = Int32(r4);
                                                                            heapClassInst.heap32[(g0+2)] = Int32(r3);
                                                                            memcpy(i7);
                                                                        }
    if(r10 < 1) 
    {
        break 
    }
    else{
        f7 = f13*f9;
        f11 = f5*f6;
        f12 =                         1.0;
        f7 = f7-f11;
        r3 = r6 << 2;
        f7 = f12/f7;
        r4 = Int64(heapClassInst.heap32[(fp+(-186))]);
        r3 = (r4 + r3)|0;
        f6 = f6*f7;
        r3 = r3 >> 2;
        f11 = f13*f7;
        f5 = f5*f7;
        f7 = f9*f7;
        f6 = -f6;
        f9 = Float64(heapClassInst.heapFloat[(r3)]);
        r3 = Int64(heapClassInst.heap32[(fp+(-178))]);
        f13 = Float64(heapClassInst.heapFloat[(r3)]);
        r3 = Int64(heapClassInst.heap32[(fp+(-180))]);
        f14 = Float64(heapClassInst.heapFloat[(r3)]);
        r3 = Int64(heapClassInst.heap32[(fp+(-177))]);
        f15 = Float64(heapClassInst.heapFloat[(r3)]);
        f16 = Float64(heapClassInst.heapFloat[(r15)]);
        r3 = Int64(heapClassInst.heap32[(fp+(-179))]);
        f17 = Float64(heapClassInst.heapFloat[(r3)]);
        f18 = Float64(heapClassInst.heapFloat[(r2)]);
        r2 = (r1 + 4)|0;
        r3 = 0;
        while(true){
            r4 = r2 >> 2;
            f21 = Float64(heapClassInst.heapFloat[(r4+(-1))]);
            f22 = Float64(heapClassInst.heapFloat[(r4)]);
            f23 = f21-f8;
            f24 = f22-f10;
            f25 = f23*f7;
            f26 = f24*f5;
            f25 = f25-f26;
            f23 = f23*f6;
            f24 = f24*f11;
            r4 = (r3 * 3)|0;
            f26 = f15*f25;
            f23 = f23+f24;
            f24 = f13*f25;
            r6 = sp + (-464);
            r4 = r4 << 2;
            f25 = f17*f25;
            f26 = f4+f26;
            f28 = f16*f23;
            f24 = f3+f24;
            f29 = f14*f23;
            r4 = (r6 + r4)|0;
            f24 = f24+f29;
            f26 = f26+f28;
            f25 = f2+f25;
            f23 = f18*f23;
            f28 = f0*f24;
            f29 = f1*f26;
            f23 = f25+f23;
            r4 = r4 >> 2;
            heapClassInst.heapFloat[(r4)] = Float32(f24);
            f24 = f28+f29;
            f25 = f19*f23;
            r7 = sp + (-496);
            r8 = r3 << 2;
            r8 = (r7 + r8)|0;
            heapClassInst.heapFloat[(r4+1)] = Float32(f26);
            f24 = f24+f25;
            f24 = f9-f24;
            r8 = r8 >> 2;
            heapClassInst.heapFloat[(r4+2)] = Float32(f23);
            heapClassInst.heapFloat[(r8)] = Float32(f24);
            if(f24 >= f27) 
            {
                r4 = r3 << 3;
                r8 = r4 | 4;
                r4 = (r1 + r4)|0;
                r8 = (r1 + r8)|0;
                r4 = r4 >> 2;
                r3 = (r3 + 1)|0;
                r8 = r8 >> 2;
                heapClassInst.heapFloat[(r4)] = Float32(f21);
                heapClassInst.heapFloat[(r8)] = Float32(f22);
            }
            r10 = (r10 + (-1))|0;
            r2 = (r2 + 8)|0;
            if(!(r10 != 0)) 
            {
                break 
            }
        }
        if(r3 < 1) 
        {
            break 
        }
        else{
            r2 = 4;
            r2 = if (r3 < 4) {r3} else {r2};
            r4 = 1;
            r8 = if (r2 < 1) {r4} else {r2};
            if(r3 > r8) 
            {
do {
    if(r3 > 1) 
{
    f0 = Float64(heapClassInst.heapFloat[(fp+(-124))]);
    r9 = 1;
    r7 = 0;
while(true){
    r10 = sp + (-496);
    r11 = r9 << 2;
    r10 = (r10 + r11)|0;
    r10 = r10 >> 2;
    f1 = Float64(heapClassInst.heapFloat[(r10)]);
    r10 = (r9 + 1)|0;
    r7 = if (f1 > f0) {r9} else {r7};
    f0 = if (f1 > f0) {f1} else {f0};
    r9 = r10;
if(!(r3 != r10)) 
{
break 
}
}
}
else{
    r7 = 0;
}
} while(false);
do {
    if(r3 == 1) 
{
    r9 = r1 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(fp+(-92))]);
    f1 = Float64(heapClassInst.heapFloat[(r9+1)]);
__label__ = 214;
break 
}
else{
    if(r3 == 2) 
{
    r9 = r1 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(fp+(-92))]);
    f1 = Float64(heapClassInst.heapFloat[(r9+2)]);
    f2 = Float64(heapClassInst.heapFloat[(r9+1)]);
    f12 = Float64(heapClassInst.heapFloat[(r9+3)]);
    f0 = f0+f1;
    f1 = f2+f12;
    f2 = Float64(heapClassInst.heapFloat[(fp+(-187))]);
    f0 = f0*f2;
    f1 = f1*f2;
__label__ = 214;
break 
}
else{
    r9 = (r3 + (-1))|0;
do {
    if(r9 > 0) 
{
    r10 = (r1 + 8)|0;
    f0 =                         0.0;
    f1 = f0;
    f2 = f0;
while(true){
    r11 = r10 >> 2;
    f3 = Float64(heapClassInst.heapFloat[(r11+(-2))]);
    f4 = Float64(heapClassInst.heapFloat[(r11+1)]);
    f5 = Float64(heapClassInst.heapFloat[(r11)]);
    f6 = Float64(heapClassInst.heapFloat[(r11+(-1))]);
    f7 = f3*f4;
    f8 = f5*f6;
    f3 = f3+f5;
    f5 = f7-f8;
    f4 = f6+f4;
    f3 = f3*f5;
    f4 = f4*f5;
    r9 = (r9 + (-1))|0;
    f2 = f2+f5;
    f1 = f3+f1;
    f0 = f4+f0;
    r10 = (r10 + 8)|0;
if(!(r9 != 0)) 
{
break 
}
}
}
else{
    f0 = f27;
    f1 = f27;
    f2 = f27;
}
} while(false);
    r9 = r3 << 3;
    r9 = (r9 + r1)|0;
    r9 = r9 >> 2;
    r10 = r1 >> 2;
    f3 = Float64(heapClassInst.heapFloat[(r9+(-2))]);
    f4 = Float64(heapClassInst.heapFloat[(r10+1)]);
    f5 = Float64(heapClassInst.heapFloat[(fp+(-92))]);
    f6 = Float64(heapClassInst.heapFloat[(r9+(-1))]);
    f7 = f3*f4;
    f8 = f5*f6;
    f7 = f7-f8;
    f2 = f2+f7;
    if(f2 < f27) 
{
    f8 = -f2;
}
else{
    f8 = f2;
}
    if(f8 > f20) 
{
    f8 =                         3.0
    f2 = f2*f8;
    f2 = f12/f2;
}
else{
    f2 =        999999984306749440.0
}
    if(r3 > 0) 
{
    f3 = f3+f5;
    f4 = f6+f4;
    f3 = f3*f7;
    f4 = f4*f7;
    f1 = f3+f1;
    f3 = f4+f0;
    f0 = f1*f2;
    f1 = f3*f2;
__label__ = 214;
}
else{
    r1 = 0;
__label__ = 219;
}
}
}
} while(false);
if (__label__ == 214){
    r1 = (r1 + 4)|0;
    r9 = sp + (-32);
    r10 = r3;
while(true){
    r11 = r1 >> 2;
    f2 = Float64(heapClassInst.heapFloat[(r11+(-1))]);
    f3 = Float64(heapClassInst.heapFloat[(r11)]);
    f3 = f3-f1;
    f2 = f2-f0;
    heapClassInst.heapFloat[(g0)] = Float32(f3);
    heapClassInst.heapFloat[(g0+1)] = Float32(f2);
    r10 = (r10 + (-1))|0;
    r1 = (r1 + 8)|0;
    r11 = (r9 + 4)|0;
    r9 = r9 >> 2;
    atan2f(i7);
    heapClassInst.heapFloat[(r9)] = Float32(commonVariable.f_g0);
    r9 = r11;
if(!(r10 != 0)) 
{
break 
}
}
    r1 = sp + (-64);
    r9 = r3;
while(true){
    r9 = (r9 + (-1))|0;
    r10 = (r1 + 4)|0;
    r1 = r1 >> 2;
    heapClassInst.heap32[(r1)] = 1;
    r1 = r10;
if(!(r9 != 0)) 
{
break 
}
}
    r1 = 1;
}
    r9 = sp + (-64);
    r10 = r7 << 2;
    r11 = (r9 + r10)|0;
    r11 = r11 >> 2;
    f0 =        6.2831854820251465
    f1 = Float64(r8); 
    f1 = f0/f1;
    heapClassInst.heap32[(r11)] = 0;
    heapClassInst.heap32[(fp+(-144))] = Int32(r7);
    f6 =                         0.0
while(true){
    if(r4 < r8) 
{
    r11 = sp + (-32);
    r13 = (r11 + r10)|0;
    r13 = r13 >> 2;
    f2 = Float64(r4); 
    f2 = f2*f1;
    f3 = Float64(heapClassInst.heapFloat[(r13)]);
    f2 = f2+f3;
    f3 =        3.1415927410125732
    if(f2 > f3) 
{
    f4 =       -6.2831854820251465
    f2 = f2+f4;
}
    r13 = sp + (-576);
    r14 = r4 << 2;
    r13 = (r13 + r14)|0;
    r13 = r13 >> 2;
    r14 = r1 & 1;
    heapClassInst.heap32[(r13)] = Int32(r7);
    if(r14 == 0) 
{
__label__ = 233;
break 
}
else{
    f4 =                1000000000.0
    r14 = 0;
    r15 = r7;
while(true){
    r16 = r14 << 2;
    r17 = (r9 + r16)|0;
    r17 = r17 >> 2;
    r17 = Int64(heapClassInst.heap32[(r17)]);
    if(r17 != 0) 
{
    r16 = (r11 + r16)|0;
    r16 = r16 >> 2;
    f5 = Float64(heapClassInst.heapFloat[(r16)]);
    f5 = f5-f2;
    if(f5 < f6) 
{
    f5 = -f5;
}
    if(f5 > f3) 
{
    f5 = f0-f5;
}
if(!(f5 >= f4)) 
{
    heapClassInst.heap32[(r13)] = Int32(r14);
    r15 = r14;
    f4 = f5;
}
}
    r14 = (r14 + 1)|0;
if(!(r3 != r14)) 
{
break 
}
}
    if(r15 != r7) 
{
    r11 = r15 << 2;
    r11 = (r9 + r11)|0;
    r4 = (r4 + 1)|0;
    r11 = r11 >> 2;
    heapClassInst.heap32[(r11)] = 0;
}
else{
__label__ = 233;
break 
}
}
}
else{
__label__ = 236;
break 
}
}
match(__label__ ){
    case 233 =>
        r0 = _E2_str65;
        r1 = _E2_str166;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0+1)] = Int32(r1);
        heapClassInst.heap32[(g0+2)] = 248;
        _assert(i7);
    case 236 =>
        if(r8 > 0) {
        r1 = 0;
    while(true) {
        r3 = sp + (-576);
        r4 = r1 << 2;
        r3 = (r3 + r4)|0;
        r3 = r3 >> 2;
        r3 = Int64(heapClassInst.heap32[(r3)]);
        r4 = (r3 * 3)|0;
        r4 = r4 << 2;
        r4 = (r6 + r4)|0;
        r4 = r4 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r4)]);
        f1 = Float64(heapClassInst.heapFloat[(r0)]);
        f0 = f0+f1;
        heapClassInst.heapFloat[(fp+(-148))] = Float32(f0);
        r7 = sp + (-592);
        f1 = Float64(heapClassInst.heapFloat[(r4+1)]);
        f2 = Float64(heapClassInst.heapFloat[(r0+1)]);
        f1 = f1+f2;
        r8 = r7 >> 2;
        heapClassInst.heapFloat[(r8+1)] = Float32(f1);
        f2 = Float64(heapClassInst.heapFloat[(r4+2)]);
        f3 = Float64(heapClassInst.heapFloat[(r0+2)]);
        f2 = f2+f3;
        r4 = sp + (-496);
        r3 = r3 << 2;
        r3 = (r4 + r3)|0;
        r4 = r5 >> 2;
        heapClassInst.heapFloat[(r8+2)] = Float32(f2);
        r4 = Int64(heapClassInst.heap32[(r4)]);
        r3 = r3 >> 2;
        r8 = sp + (-704);
        f3 = Float64(heapClassInst.heapFloat[(r3)]);
        r3 = r4 >> 2;
        r4 = r8 >> 2;
        r3 = Int64(heapClassInst.heap32[(r3+4)]);
        f4 = -f3;
        f5 = Float64(heapClassInst.heapFloat[(r4+2)]);
        if(r12 > 3) {
            f6 = Float64(heapClassInst.heapFloat[(fp+(-176))]);
            f7 = Float64(heapClassInst.heapFloat[(r4+1)]);
            f8 = f6*f3;
            r4 = sp + (-160);
            f9 = f7*f3;
            f0 = f0-f8;
            r7 = r4 >> 2;
            f3 = f5*f3;
            f1 = f1-f9;
            heapClassInst.heapFloat[(fp+(-40))] = Float32(f0);
            f0 = f2-f3;
            heapClassInst.heapFloat[(r7+1)] = Float32(f1);
            heapClassInst.heapFloat[(r7+2)] = Float32(f0);
            r8 = sp + (-144);
            f0 = -f6;
            heapClassInst.heap32[(r7+3)] = 0;
            r7 = r8 >> 2;
            f1 = -f7;
            heapClassInst.heapFloat[(fp+(-36))] = Float32(f0);
            f0 = -f5;
            heapClassInst.heapFloat[(r7+1)] = Float32(f1);
            heapClassInst.heapFloat[(r7+2)] = Float32(f0);
            heapClassInst.heap32[(r7+3)] = 0;
            heapClassInst.heap32[(g0)] = Int32(r5);
            heapClassInst.heap32[(g0+1)] = Int32(r8);
            heapClassInst.heap32[(g0+2)] = Int32(r4);
            heapClassInst.heapFloat[(g0+3)] = Float32(f4);
            __FUNCTION_TABLE__[(r3)>>2](i7);
        }
        else {
            f0 = Float64(heapClassInst.heapFloat[(r4+1)]);
            f1 = Float64(heapClassInst.heapFloat[(fp+(-176))]);
            r4 = sp + (-176);
            f1 = -f1;
            r8 = r4 >> 2;
            f0 = -f0;
            heapClassInst.heapFloat[(fp+(-44))] = Float32(f1);
            f1 = -f5;
            heapClassInst.heapFloat[(r8+1)] = Float32(f0);
            heapClassInst.heapFloat[(r8+2)] = Float32(f1);
            heapClassInst.heap32[(r8+3)] = 0;
            heapClassInst.heap32[(g0)] = Int32(r5);
            heapClassInst.heap32[(g0+1)] = Int32(r4);
            heapClassInst.heap32[(g0+2)] = Int32(r7);
            heapClassInst.heapFloat[(g0+3)] = Float32(f4);
            __FUNCTION_TABLE__[(r3)>>2](i7);
        }
            r1 = (r1 + 1)|0;
            if(r1 >= r2) 
        {
        break 
        }
        else{
        continue 
        }
    }
    }
    else{
     println("break") 
    }
    case _ =>
        println("break 4397")
}
}
else{
    if(r12 < 4) 
{
    r1 = (r6 + 8)|0;
    r2 = sp + (-496);
while(true){
    r4 = r1 >> 2;
    f12 = Float64(heapClassInst.heapFloat[(r4+(-2))]);
    f20 = Float64(heapClassInst.heapFloat[(r0)]);
    f12 = f12+f20;
    heapClassInst.heapFloat[(fp+(-132))] = Float32(f12);
    r6 = sp + (-528);
    f12 = Float64(heapClassInst.heapFloat[(r4+(-1))]);
    f20 = Float64(heapClassInst.heapFloat[(r0+1)]);
    r7 = r6 >> 2;
    f12 = f12+f20;
    heapClassInst.heapFloat[(r7+1)] = Float32(f12);
    f12 = Float64(heapClassInst.heapFloat[(r4)]);
    f20 = Float64(heapClassInst.heapFloat[(r0+2)]);
    f12 = f12+f20;
    heapClassInst.heapFloat[(r7+2)] = Float32(f12);
    r4 = r5 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4)]);
    r7 = sp + (-704);
    r7 = r7 >> 2;
    r4 = r4 >> 2;
    r8 = r2 >> 2;
    f12 = Float64(heapClassInst.heapFloat[(r8)]);
    f20 = Float64(heapClassInst.heapFloat[(r7+2)]);
    f27 = Float64(heapClassInst.heapFloat[(r7+1)]);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-176))]);
    r4 = Int64(heapClassInst.heap32[(r4+4)]);
    r7 = sp + (-208);
    f0 = -f0;
    r8 = r7 >> 2;
    f27 = -f27;
    heapClassInst.heapFloat[(fp+(-52))] = Float32(f0);
    f20 = -f20;
    heapClassInst.heapFloat[(r8+1)] = Float32(f27);
    heapClassInst.heapFloat[(r8+2)] = Float32(f20);
    heapClassInst.heap32[(r8+3)] = 0;
    f12 = -f12;
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0+1)] = Int32(r7);
    heapClassInst.heap32[(g0+2)] = Int32(r6);
    heapClassInst.heapFloat[(g0+3)] = Float32(f12);
    r3 = (r3 + (-1))|0;
    r2 = (r2 + 4)|0;
    r1 = (r1 + 12)|0;
    __FUNCTION_TABLE__[(r4)>>2](i7);
    if(r3 == 0) 
{
break 
}
else{
continue 
}
}
}
else{
    r1 = (r6 + 8)|0;
while(true){
    r2 = r7 >> 2;
    r4 = r1 >> 2;
    f12 = Float64(heapClassInst.heapFloat[(r2)]);
    f20 = Float64(heapClassInst.heapFloat[(fp+(-176))]);
    f27 = Float64(heapClassInst.heapFloat[(r4+(-2))]);
    f0 = Float64(heapClassInst.heapFloat[(r0)]);
    f27 = f27+f0;
    f0 = f20*f12;
    r2 = sp + (-704);
    f27 = f27-f0;
    heapClassInst.heapFloat[(fp+(-136))] = Float32(f27);
    r2 = r2 >> 2;
    f27 = Float64(heapClassInst.heapFloat[(r2+1)]);
    f0 = Float64(heapClassInst.heapFloat[(r4+(-1))]);
    f1 = Float64(heapClassInst.heapFloat[(r0+1)]);
    r6 = sp + (-544);
    f0 = f0+f1;
    f1 = f27*f12;
    r8 = r6 >> 2;
    f0 = f0-f1;
    heapClassInst.heapFloat[(r8+1)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f1 = Float64(heapClassInst.heapFloat[(r4)]);
    f2 = Float64(heapClassInst.heapFloat[(r0+2)]);
    f1 = f1+f2;
    f2 = f0*f12;
    f1 = f1-f2;
    r2 = r5 >> 2;
    heapClassInst.heapFloat[(r8+2)] = Float32(f1);
    r2 = Int64(heapClassInst.heap32[(r2)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+4)]);
    r4 = sp + (-192);
    f20 = -f20;
    r8 = r4 >> 2;
    f27 = -f27;
    heapClassInst.heapFloat[(fp+(-48))] = Float32(f20);
    f20 = -f0;
    heapClassInst.heapFloat[(r8+1)] = Float32(f27);
    heapClassInst.heapFloat[(r8+2)] = Float32(f20);
    heapClassInst.heap32[(r8+3)] = 0;
    f12 = -f12;
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0+1)] = Int32(r4);
    heapClassInst.heap32[(g0+2)] = Int32(r6);
    heapClassInst.heapFloat[(g0+3)] = Float32(f12);
    r3 = (r3 + (-1))|0;
    r7 = (r7 + 4)|0;
    r1 = (r1 + 12)|0;
    __FUNCTION_TABLE__[(r2)>>2](i7);
    if(r3 == 0) 
{
break 
}
else{
continue 
}
}
}
}
}
}
}
else{
    r0 = sp + (-688);
    r2 = r0 >> 2;
    f20 = Float64(heapClassInst.heapFloat[(fp+(-172))]);
    f27 = Float64(heapClassInst.heapFloat[(r2+4)]);
    f2 = Float64(heapClassInst.heapFloat[(r2+5)]);
    f3 = Float64(heapClassInst.heapFloat[(r2+1)]);
    f4 = f0*f20;
    f5 = f1*f27;
    f6 = Float64(heapClassInst.heapFloat[(r2+8)]);
    f7 = Float64(heapClassInst.heapFloat[(r2+9)]);
    f8 = Float64(heapClassInst.heapFloat[(r2+6)]);
    f9 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f4 = f4+f5;
    f5 = f19*f6;
    f10 = f0*f3;
    f11 = f1*f2;
    f12 = Float64(heapClassInst.heapFloat[(r2+10)]);
    f4 = f4+f5;
    f5 = f10+f11;
    f10 = f19*f7;
    f11 = f0*f9;
    f13 = f1*f8;
    f14 =                         0.0;
    f15 =                         -1.0
    f16 =                         1.0
    f5 = f5+f10;
    f4 = if(f4 > f14) {f15} else {f16};
    f10 = f11+f13;
    f11 = f19*f12;
    f13 = Float64(heapClassInst.heapFloat[(fp+(-181))]);
    f4 = f13*f4;
    f10 = f10+f11;
    f5 = if (f5 > f14) {f15} else {f16};
    f11 = Float64(heapClassInst.heapFloat[(fp+(-182))]);
    f5 = f11*f5;
    r2 = sp + (-640);
    f20 = f4*f20;
    f11 = Float64(heapClassInst.heapFloat[(r1+28)]);
    f10 = if (f10 > f14) {f15} else {f16};
    r3 = r2 >> 2;
    f13 = Float64(heapClassInst.heapFloat[(fp+(-180))]);
    f10 = f13*f10;
    f27 = f4*f27;
    f13 = Float64(heapClassInst.heapFloat[(r1+29)]);
    f20 = f11+f20;
    f3 = f5*f3;
    r4 = (r12 + (-7))|0;
    f11 = Float64(heapClassInst.heapFloat[(r3+4)]);
    f17 = Float64(heapClassInst.heapFloat[(fp+(-160))]);
    f18 = Float64(heapClassInst.heapFloat[(r3+8)]);
    f21 = Float64(heapClassInst.heapFloat[(r3+5)]);
    f22 = Float64(heapClassInst.heapFloat[(r3+1)]);
    f23 = Float64(heapClassInst.heapFloat[(r3+9)]);
    f24 = Float64(heapClassInst.heapFloat[(r3+6)]);
    f25 = Float64(heapClassInst.heapFloat[(r3+2)]);
    f26 = Float64(heapClassInst.heapFloat[(r3+10)]);
    f4 = f4*f6;
    f6 = Float64(heapClassInst.heapFloat[(r1+30)]);
    f27 = f13+f27;
    f2 = f5*f2;
    f20 = f20+f3;
    f3 = f10*f9;
    f9 = Float64(heapClassInst.heapFloat[(r1+12)]);
    heapClassInst.heapFloat[(fp+(-182))] = Float32(f9);
    f9 = Float64(heapClassInst.heapFloat[(r1+13)]);
    heapClassInst.heapFloat[(fp+(-181))] = Float32(f9);
    f9 = Float64(heapClassInst.heapFloat[(r1+14)]);
    heapClassInst.heapFloat[(fp+(-180))] = Float32(f9);
    r3 = (r4 / 3)|0;
    r4 = (r4 % 3)|0;
    r10 = sp + (-512);
    f20 = f20+f3;
    f3 = f6+f4;
    f4 = f5*f7;
    f27 = f27+f2;
    f2 = f10*f8;
    r3 = r3 << 2;
    r4 = r4 << 2;
    f27 = f27+f2;
    r12 = r10 >> 2;
    heapClassInst.heapFloat[(fp+(-128))] = Float32(f20);
    f2 = f3+f4;
    f3 = f10*f12;
    r2 = (r2 + r3)|0;
    r0 = (r0 + r4)|0;
    f2 = f2+f3;
    heapClassInst.heapFloat[(r12+1)] = Float32(f27);
    r2 = r2 >> 2;
    heapClassInst.heapFloat[(r12+2)] = Float32(f2);
    r0 = r0 >> 2;
    f3 = Float64(heapClassInst.heapFloat[(r2)]);
    f4 = Float64(heapClassInst.heapFloat[(r0)]);
    f5 = Float64(heapClassInst.heapFloat[(r2+4)]);
    f6 = Float64(heapClassInst.heapFloat[(r0+4)]);
    f7 = Float64(heapClassInst.heapFloat[(r2+8)]);
    f8 = Float64(heapClassInst.heapFloat[(r0+8)]);
    f9 = f3*f4;
    f10 = f5*f6;
    f9 = f9+f10;
    f10 = f7*f8;
    f9 = f9+f10;
    f10 = f9*f9;
    f10 = f16-f10;
    f12 =   9.9999997473787516e-005;
    if(f10 > f12) 
{
    f12 = f0*f17;
    f13 = f1*f11;
    f12 = f12+f13;
    f13 = f19*f18;
    f28 = f0*f22;
    f29 = f1*f21;
    f12 = f12+f13;
    f13 = f28+f29;
    f28 = f19*f23;
    f29 = f0*f25;
    f30 = f1*f24;
    f13 = f13+f28;
    f12 = if (f12 > f14) {f16} else {f15};
    f28 = f29+f30;
    f29 = f19*f26;
    f30 = Float64(heapClassInst.heapFloat[(fp+(-179))]);
    f12 = f30*f12;
    f28 = f28+f29;
    f13 = if (f13 > f14) {f16} else {f15};
    f29 = Float64(heapClassInst.heapFloat[(fp+(-178))]);
    f13 = f29*f13;
    f17 = f12*f17;
    f11 = f12*f11;
    f12 = f12*f18;
    f14 = if (f28 > f14) {f16} else {f15};
    f15 = Float64(heapClassInst.heapFloat[(fp+(-177))]);
    f14 = f15*f14;
    f15 = Float64(heapClassInst.heapFloat[(fp+(-182))]);
    f15 = f15+f17;
    f17 = f13*f22;
    f18 = Float64(heapClassInst.heapFloat[(fp+(-181))]);
    f11 = f18+f11;
    f18 = f13*f21;
    f21 = Float64(heapClassInst.heapFloat[(fp+(-180))]);
    f12 = f21+f12;
    f13 = f13*f23;
    f15 = f15+f17;
    f17 = f14*f25;
    f11 = f11+f18;
    f18 = f14*f24;
    f12 = f12+f13;
    f14 = f14*f26;
    f13 = f15+f17;
    f11 = f11+f18;
    f14 = f12+f14;
    f12 = f20-f13;
    f11 = f27-f11;
    f14 = f2-f14;
    f3 = f3*f12;
    f5 = f5*f11;
    f3 = f3+f5;
    f5 = f7*f14;
    f7 = f4*f12;
    f11 = f6*f11;
    f3 = f3+f5;
    f5 = f7+f11;
    f14 = f8*f14;
    f3 = f9*f3;
    f14 = f5+f14;
    f14 = f3-f14;
    f3 = f16/f10;
    f14 = f14*f3;
}
    f3 = f4*f14;
    f20 = f20+f3;
    f3 = f6*f14;
    f4 = f8*f14;
    f27 = f27+f3;
    heapClassInst.heapFloat[(fp+(-128))] = Float32(f20);
    f20 = f2+f4;
    heapClassInst.heapFloat[(r12+1)] = Float32(f27);
    r0 = r5 >> 2;
    heapClassInst.heapFloat[(r12+2)] = Float32(f20);
    r0 = Int64(heapClassInst.heap32[(r0)]);
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0+4)]);
    r2 = sp + (-224);
    f0 = -f0;
    r3 = r2 >> 2;
    f1 = -f1;
    heapClassInst.heapFloat[(fp+(-56))] = Float32(f0);
    f0 = -f19;
    heapClassInst.heapFloat[(r3+1)] = Float32(f1);
    heapClassInst.heapFloat[(r3+2)] = Float32(f0);
    heapClassInst.heap32[(r3+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0+1)] = Int32(r2);
    heapClassInst.heap32[(g0+2)] = Int32(r10);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-183))]);
    heapClassInst.heapFloat[(g0+3)] = Float32(f0);
    __FUNCTION_TABLE__[(r0)>>2](i7);
    return;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
} while(false);
    return;
}

func _ZN21btCollisionDispatcher13findAlgorithmEP17btCollisionObjectS1_P20btPersistentManifold(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
    var r4:Int64 = 0
    var r5:Int64 = 0
    var r6:Int64 = 0
var __label__ = 0;
    i7 = sp + (-24);
var g0 = i7>>2; 
    r0 = sp + (-8);
    r1 = Int64(heapClassInst.heap32[(fp)]);
    r2 = Int64(heapClassInst.heap32[(fp+1)]);
    r3 = r0 >> 2;
    r4 = Int64(heapClassInst.heap32[(fp+3)]);
    heapClassInst.heap32[(fp+(-2))] = Int32(r1);
    r5 = Int64(heapClassInst.heap32[(fp+2)]);
    r6 = r2 >> 2;
    heapClassInst.heap32[(r3+1)] = Int32(r4);
    r3 = Int64(heapClassInst.heap32[(r6+48)]);
    r4 = r5 >> 2;
    r3 = r3 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+48)]);
    r3 = Int64(heapClassInst.heap32[(r3+1)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+1)]);
    r3 = (r3 * 144)|0;
    r1 = (r1 + r3)|0;
    r3 = r4 << 2;
    r1 = (r1 + r3)|0;
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+50)]);
    r3 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+2)]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0+1)] = Int32(r0);
    heapClassInst.heap32[(g0+2)] = Int32(r2);
    heapClassInst.heap32[(g0+3)] = Int32(r5);
    __FUNCTION_TABLE__[(r3)>>2](i7);
    return;
}

func _ZN21btCollisionDispatcher13needsResponseEP17btCollisionObjectS1_(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp+1)]);
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0+51)]);
    r1 = r0 & 4;
if(!(r1 != 0)) 
{
    r1 = Int64(heapClassInst.heap32[(fp+2)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+51)]);
    r2 = r1 & 4;
if(!(r2 != 0)) 
{
    r0 = r0 & 3;
    if(r0 == 0) 
{
    r0 = 1;
    commonVariable.r_g0 = r0;
    return;
}
else{
    r0 = r1 & 3;
    r1 = 0;
    r0 = if (r0 == r1) {1} else {0};
    r0 = r0 & 1;
    commonVariable.r_g0 = r0;
    return;
}
}
}
    r0 = 0;
    commonVariable.r_g0 = r0;
    return;
}

func _ZN23btCollisionPairCallbackD1Ev(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV23btCollisionPairCallback;
    r0 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r0)] = Int32(r1);
    return;
}

func _ZN23btCollisionPairCallbackD0Ev(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV23btCollisionPairCallback;
    r2 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
    return;
}

func _ZN23btCollisionPairCallback14processOverlapER16btBroadphasePair(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
var __label__ = 0;
    i7 = sp + (-16);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0+2)]);
    r2 = r1 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+47)]);
    r0 = Int64(heapClassInst.heap32[(r0+1)]);
    r3 = Int64(heapClassInst.heap32[(fp+1)]);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = Int32(r0);
    __FUNCTION_TABLE__[(r2)>>2](i7);
    r0 = 0;
    commonVariable.r_g0 = r0;
    return;
}

func _ZN21btCollisionDispatcher25dispatchAllCollisionPairsEP22btOverlappingPairCacheRK16btDispatcherInfoP12btDispatcher(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
    var r4:Int64 = 0
var __label__ = 0;
    i7 = sp + (-32);
var g0 = i7>>2; 
    r0 = _ZTV23btCollisionPairCallback;
    r1 = sp + (-16);
    r0 = (r0 + 8)|0;
    r2 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(fp+2)]);
    heapClassInst.heap32[(fp+(-4))] = Int32(r0);
    r0 = Int64(heapClassInst.heap32[(fp+1)]);
    r4 = Int64(heapClassInst.heap32[(fp)]);
    heapClassInst.heap32[(r2+1)] = Int32(r3);
    r3 = r0 >> 2;
    heapClassInst.heap32[(r2+2)] = Int32(r4);
    r2 = Int64(heapClassInst.heap32[(r3)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+12)]);
    r3 = Int64(heapClassInst.heap32[(fp+3)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = Int32(r3);
    __FUNCTION_TABLE__[(r2)>>2](i7);
    return;
}

func _ZNK21btCollisionDispatcher15getNumManifoldsEv(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0+3)]);
    commonVariable.r_g0 = r0;
    return;
}

func _ZN21btCollisionDispatcher26getInternalManifoldPointerEv(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0+5)]);
    commonVariable.r_g0 = r0;
    return;
}

func _ZN21btCollisionDispatcher26getManifoldByIndexInternalEi(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(fp+1)]);
    r0 = Int64(heapClassInst.heap32[(r0+5)]);
    r1 = r1 << 2;
    r0 = (r0 + r1)|0;
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0)]);
    commonVariable.r_g0 = r0;
    return;
}

func _ZN21btCollisionDispatcher22freeCollisionAlgorithmEPv(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
    var r4:Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp+1)]);
if(!(r0 == 0)) 
{
    r1 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+48)]);
    r1 = r1 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1+4)]);
if(!(`UIntNative`(r2) > `UIntNative`(r0))) 
{
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r4 = Int64(heapClassInst.heap32[(r1+1)]);
    r3 = (r3 * r4)|0;
    r2 = (r2 + r3)|0;
if(!(`UIntNative`(r2) <= `UIntNative`(r0))) 
{
    r2 = r0 >> 2;
    r3 = Int64(heapClassInst.heap32[(r1+3)]);
    heapClassInst.heap32[(r2)] = Int32(r3);
    heapClassInst.heap32[(r1+3)] = Int32(r0);
    r0 = Int64(heapClassInst.heap32[(r1+2)]);
    r0 = (r0 + 1)|0;
    heapClassInst.heap32[(r1+2)] = Int32(r0);
    return;
}
}
    r1 = gNumAlignedFree;
    r1 = r1 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1)]);
    r2 = (r2 + 1)|0;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r2);
    r0 = Int64(heapClassInst.heap32[(r0+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
}
    return;
}

func _ZN21btCollisionDispatcher15releaseManifoldEP20btPersistentManifold(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
    var r4:Int64 = 0
    var r5:Int64 = 0
    var r6:Int64 = 0
    var r7:Int64 = 0
    var r8:Int64 = 0
var __label__ = 0;
    i7 = sp + (-16);
var g0 = i7>>2; 
    r0 = gNumManifold;
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0)]);
    r2 = Int64(heapClassInst.heap32[(fp)]);
    r1 = (r1 + (-1))|0;
    r3 = r2 >> 2;
    heapClassInst.heap32[(r0)] = Int32(r1);
    r0 = Int64(heapClassInst.heap32[(r3)]);
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0+5)]);
    r1 = Int64(heapClassInst.heap32[(fp+1)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    __FUNCTION_TABLE__[(r0)>>2](i7);
    r0 = r1 >> 2;
    r2 = Int64(heapClassInst.heap32[(r3+3)]);
    r4 = Int64(heapClassInst.heap32[(r0+284)]);
    if(r2 > r4) 
{
    r2 = (r2 + (-1))|0;
    r5 = r4 << 2;
    r6 = Int64(heapClassInst.heap32[(r3+5)]);
    r2 = r2 << 2;
    r7 = (r6 + r5)|0;
    r6 = (r6 + r2)|0;
    r7 = r7 >> 2;
    r6 = r6 >> 2;
    r8 = Int64(heapClassInst.heap32[(r7)]);
    r6 = Int64(heapClassInst.heap32[(r6)]);
    heapClassInst.heap32[(r7)] = Int32(r6);
    r6 = Int64(heapClassInst.heap32[(r3+5)]);
    r2 = (r6 + r2)|0;
    r2 = r2 >> 2;
    heapClassInst.heap32[(r2)] = Int32(r8);
    r2 = Int64(heapClassInst.heap32[(r3+5)]);
    r2 = (r2 + r5)|0;
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2)]);
    r2 = r2 >> 2;
    heapClassInst.heap32[(r2+284)] = Int32(r4);
    r2 = Int64(heapClassInst.heap32[(r3+3)]);
    r2 = (r2 + (-1))|0;
    heapClassInst.heap32[(r3+3)] = Int32(r2);
if(!(r1 == 0)) 
{
    r2 = Int64(heapClassInst.heap32[(r3+49)]);
    r2 = r2 >> 2;
    r3 = Int64(heapClassInst.heap32[(r2+4)]);
if(!(`UIntNative`(r3) > `UIntNative`(r1))) 
{
    r4 = Int64(heapClassInst.heap32[(r2)]);
    r5 = Int64(heapClassInst.heap32[(r2+1)]);
    r4 = (r4 * r5)|0;
    r3 = (r3 + r4)|0;
if(!(`UIntNative`(r3) <= `UIntNative`(r1))) 
{
    r3 = Int64(heapClassInst.heap32[(r2+3)]);
    heapClassInst.heap32[(r0)] = Int32(r3);
    heapClassInst.heap32[(r2+3)] = Int32(r1);
    r0 = Int64(heapClassInst.heap32[(r2+2)]);
    r0 = (r0 + 1)|0;
    heapClassInst.heap32[(r2+2)] = Int32(r0);
    return;
}
}
    r1 = gNumAlignedFree;
    r1 = r1 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1)]);
    r2 = (r2 + 1)|0;
    heapClassInst.heap32[(r1)] = Int32(r2);
    r0 = Int64(heapClassInst.heap32[(r0+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
}
    return;
}
else{
    r0 = _E2_str472;
    r1 = _E2_str573;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = 120;
    _assert(i7);
}
}

func _ZN21btCollisionDispatcherD1Ev(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
    var r4:Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV21btCollisionDispatcher;
    r2 = _ZTV16btManifoldResult;
    r3 = r0 >> 2;
    r1 = (r1 + 8)|0;
    r2 = (r2 + 8)|0;
    heapClassInst.heap32[(r3)] = Int32(r1);
    heapClassInst.heap32[(r3+7)] = Int32(r2);
    r1 = Int64(heapClassInst.heap32[(r3+5)]);
if(!(r1 == 0)) 
{
    r2 = Int64(heapClassInst.heapU8[r0+24]);
if(!(r2 == 0)) 
{
    r2 = gNumAlignedFree;
    r2 = r2 >> 2;
    r4 = Int64(heapClassInst.heap32[(r2)]);
    r4 = (r4 + 1)|0;
    r1 = r1 >> 2;
    heapClassInst.heap32[(r2)] = Int32(r4);
    r1 = Int64(heapClassInst.heap32[(r1+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    free(i7);
}
    heapClassInst.heap32[(r3+5)] = 0;
}
    r1 = 1;
    heapClassInst.heap8[r0+24] = Int8(r1);
    heapClassInst.heap32[(r3+5)] = 0;
    r0 = _ZTV12btDispatcher;
    heapClassInst.heap32[(r3+3)] = 0;
    r0 = (r0 + 8)|0;
    heapClassInst.heap32[(r3+4)] = 0;
    heapClassInst.heap32[(r3)] = Int32(r0);
    return;
}

func _ZN21btCollisionDispatcherD0Ev(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
    var r4:Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV21btCollisionDispatcher;
    r2 = _ZTV16btManifoldResult;
    r3 = r0 >> 2;
    r1 = (r1 + 8)|0;
    r2 = (r2 + 8)|0;
    heapClassInst.heap32[(r3)] = Int32(r1);
    heapClassInst.heap32[(r3+7)] = Int32(r2);
    r1 = Int64(heapClassInst.heap32[(r3+5)]);
if(!(r1 == 0)) 
{
    r2 = Int64(heapClassInst.heapU8[r0+24]);
if(!(r2 == 0)) 
{
    r2 = gNumAlignedFree;
    r2 = r2 >> 2;
    r4 = Int64(heapClassInst.heap32[(r2)]);
    r4 = (r4 + 1)|0;
    r1 = r1 >> 2;
    heapClassInst.heap32[(r2)] = Int32(r4);
    r1 = Int64(heapClassInst.heap32[(r1+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    free(i7);
}
    heapClassInst.heap32[(r3+5)] = 0;
}
    r1 = 1;
    heapClassInst.heap8[r0+24] = Int8(r1);
    heapClassInst.heap32[(r3+5)] = 0;
    r1 = _ZTV12btDispatcher;
    heapClassInst.heap32[(r3+3)] = 0;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r3+4)] = 0;
    heapClassInst.heap32[(r3)] = Int32(r1);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
    return;
}

func _ZN21btCollisionDispatcher14getNewManifoldEPvS0_(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
    var r4:Int64 = 0
    var r5:Int64 = 0
    var r6:Int64 = 0
    var r7:Int64 = 0
    var r8:Int64 = 0
    var r9:Int64 = 0
    var r10:Int64 = 0
    var r11:Int64 = 0
    var f0:Float64 = 0.0
    var f1:Float64 = 0.0
    var f2:Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-24);
var g0 = i7>>2; 
    r0 = gNumManifold;
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0)]);
    r1 = (r1 + 1)|0;
    r2 = Int64(heapClassInst.heap32[(fp)]);
    r3 = Int64(heapClassInst.heap32[(fp+1)]);
    r4 = Int64(heapClassInst.heap32[(fp+2)]);
    heapClassInst.heap32[(r0)] = Int32(r1);
    r0 = Int64(heapClassInst.heapU8[r2+4]);
    r0 = r0 & 2;
    if(r0 != 0) 
{
    r0 = r4 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0+48)]);
    r1 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+5)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = 1017370378;
    __FUNCTION_TABLE__[(r1)>>2](i7);
    f0 = commonVariable.f_g0;
    r0 = r3 >> 2;
    heapClassInst.heapFloat[(fp+(-2))] = Float32(f0);
    r0 = Int64(heapClassInst.heap32[(r0+48)]);
    r1 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+5)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = 1017370378;
    __FUNCTION_TABLE__[(r1)>>2](i7);
    r0 = sp + (-4);
    r1 = sp + (-8);
    r0 = if (commonVariable.f_g0 < f0) {r0} else {r1};
    heapClassInst.heapFloat[(fp+(-1))] = Float32(commonVariable.f_g0);
}
else{
    r0 = gContactBreakingThreshold;
}
    r1 = r2 >> 2;
    r5 = Int64(heapClassInst.heap32[(r1+49)]);
    r6 = r3 >> 2;
    r7 = r4 >> 2;
    r5 = r5 >> 2;
    r0 = r0 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r6+46)]);
    f1 = Float64(heapClassInst.heapFloat[(r7+46)]);
    r6 = Int64(heapClassInst.heap32[(r5+2)]);
    f2 = Float64(heapClassInst.heapFloat[(r0)]);
    f0 = if (f0 < f1) {f0} else {f1};
do {
    if(r6 == 0) 
{
    r0 = gNumAlignedAllocs;
    r0 = r0 >> 2;
    r5 = Int64(heapClassInst.heap32[(r0)]);
    r5 = (r5 + 1)|0;
    heapClassInst.heap32[(r0)] = Int32(r5);
    heapClassInst.heap32[(g0)] = 1159;
    mallocNew(i7);
    r0 = commonVariable.r_g0;
    if(r0 != 0) 
{
    r5 = 0;
    r6 = (r0 + 4)|0;
    r5 = (r5 - r6)|0;
    r5 = r5 & 15;
    r5 = (r0 + r5)|0;
    r6 = (r5 + 4)|0;
    r5 = r5 >> 2;
    heapClassInst.heap32[(r5)] = Int32(r0);
    r0 = r6;
}
else{
break 
}
}
else{
    r0 = Int64(heapClassInst.heap32[(r5)]);
    if(r0 > 1139) 
{
    if(r6 > 0) 
{
    r0 = Int64(heapClassInst.heap32[(r5+3)]);
    r7 = r0 >> 2;
    r7 = Int64(heapClassInst.heap32[(r7)]);
    r6 = (r6 + (-1))|0;
    heapClassInst.heap32[(r5+3)] = Int32(r7);
    heapClassInst.heap32[(r5+2)] = Int32(r6);
}
else{
    r1 = _E2_str371;
    r2 = _E2_str169;
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0+1)] = Int32(r2);
    heapClassInst.heap32[(g0+2)] = 70;
    _assert(i7);
}
}
else{
    r1 = _E2_str270;
    r2 = _E2_str169;
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0+1)] = Int32(r2);
    heapClassInst.heap32[(g0+2)] = 69;
    _assert(i7);
}
}
} while(false);
    r5 = r0 >> 2;
    heapClassInst.heap32[(r5)] = 1;
    heapClassInst.heap32[(r5+28)] = 0;
    r6 = 0;
    heapClassInst.heap32[(r5+29)] = 0;
    heapClassInst.heap8[r0+120] = Int8(r6);
    heapClassInst.heap32[(r5+31)] = 0;
    heapClassInst.heap32[(r5+32)] = 0;
    heapClassInst.heap32[(r5+33)] = 0;
    heapClassInst.heap32[(r5+34)] = 0;
    heapClassInst.heap32[(r5+35)] = 0;
    heapClassInst.heap32[(r5+36)] = 0;
    heapClassInst.heap32[(r5+37)] = 0;
    heapClassInst.heap32[(r5+97)] = 0;
    heapClassInst.heap32[(r5+98)] = 0;
    heapClassInst.heap8[r0+396] = Int8(r6);
    heapClassInst.heap32[(r5+100)] = 0;
    heapClassInst.heap32[(r5+101)] = 0;
    heapClassInst.heap32[(r5+102)] = 0;
    heapClassInst.heap32[(r5+103)] = 0;
    heapClassInst.heap32[(r5+104)] = 0;
    heapClassInst.heap32[(r5+105)] = 0;
    heapClassInst.heap32[(r5+106)] = 0;
    heapClassInst.heap32[(r5+166)] = 0;
    heapClassInst.heap32[(r5+167)] = 0;
    heapClassInst.heap8[r0+672] = Int8(r6);
    heapClassInst.heap32[(r5+169)] = 0;
    heapClassInst.heap32[(r5+170)] = 0;
    heapClassInst.heap32[(r5+171)] = 0;
    heapClassInst.heap32[(r5+172)] = 0;
    heapClassInst.heap32[(r5+173)] = 0;
    heapClassInst.heap32[(r5+174)] = 0;
    heapClassInst.heap32[(r5+175)] = 0;
    heapClassInst.heap32[(r5+235)] = 0;
    heapClassInst.heap32[(r5+236)] = 0;
    heapClassInst.heap8[r0+948] = Int8(r6);
    heapClassInst.heap32[(r5+238)] = 0;
    heapClassInst.heap32[(r5+239)] = 0;
    heapClassInst.heap32[(r5+240)] = 0;
    heapClassInst.heap32[(r5+241)] = 0;
    heapClassInst.heap32[(r5+242)] = 0;
    heapClassInst.heap32[(r5+243)] = 0;
    heapClassInst.heap32[(r5+244)] = 0;
    heapClassInst.heap32[(r5+277)] = Int32(r3);
    heapClassInst.heap32[(r5+278)] = Int32(r4);
    heapClassInst.heap32[(r5+279)] = 0;
    heapClassInst.heapFloat[(r5+280)] = Float32(f2);
    heapClassInst.heapFloat[(r5+281)] = Float32(f0);
    r3 = Int64(heapClassInst.heap32[(r1+3)]);
    heapClassInst.heap32[(r5+284)] = Int32(r3);
    r3 = Int64(heapClassInst.heap32[(r1+4)]);
    r4 = Int64(heapClassInst.heap32[(r1+3)]);
    if(r3 == r4) 
{
    r5 = 1;
    r7 = r4 << 1;
    r7 = if (r4 == 0) {r5} else {r7};
if(!(r3 >= r7)) 
{
    if(r7 != 0) 
{
    r3 = gNumAlignedAllocs;
    r3 = r3 >> 2;
    r8 = Int64(heapClassInst.heap32[(r3)]);
    r9 = r7 << 2;
    r8 = (r8 + 1)|0;
    r9 = r9 | 3;
    heapClassInst.heap32[(r3)] = Int32(r8);
    r3 = (r9 + 16)|0;
    heapClassInst.heap32[(g0)] = Int32(r3);
    mallocNew(i7);
    r3 = commonVariable.r_g0;
    if(r3 != 0) 
{
    r8 = (r3 + 4)|0;
    r8 = (r6 - r8)|0;
    r8 = r8 & 15;
    r8 = (r3 + r8)|0;
    r9 = (r8 + 4)|0;
    r8 = r8 >> 2;
    heapClassInst.heap32[(r8)] = Int32(r3);
    r3 = r9;
}
}
else{
    r3 = 0;
}
    r8 = (r2 + 20)|0;
    if(r4 < 1) 
{
    r6 = r8 >> 2;
    r9 = Int64(heapClassInst.heap32[(r6)]);
}
else{
while(true){
    r9 = r8 >> 2;
    r9 = Int64(heapClassInst.heap32[(r9)]);
    r10 = r6 << 2;
    r11 = (r9 + r10)|0;
    r11 = r11 >> 2;
    r10 = (r3 + r10)|0;
    r11 = Int64(heapClassInst.heap32[(r11)]);
    r6 = (r6 + 1)|0;
    r10 = r10 >> 2;
    heapClassInst.heap32[(r10)] = Int32(r11);
if(!(r4 != r6)) 
{
break 
}
}
    r8 = (r2 + 20)|0;
}
    if(r9 != 0) 
{
    r6 = Int64(heapClassInst.heapU8[r2+24]);
    if(r6 != 0) 
{
    r4 = gNumAlignedFree;
    r4 = r4 >> 2;
    r6 = Int64(heapClassInst.heap32[(r4)]);
    r6 = (r6 + 1)|0;
    r9 = r9 >> 2;
    heapClassInst.heap32[(r4)] = Int32(r6);
    r4 = Int64(heapClassInst.heap32[(r9+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r4);
    free(i7);
    r4 = Int64(heapClassInst.heap32[(r1+3)]);
}
    r6 = r8 >> 2;
    heapClassInst.heap32[(r6)] = 0;
}
    r6 = r8 >> 2;
    heapClassInst.heap8[r2+24] = Int8(r5);
    heapClassInst.heap32[(r6)] = Int32(r3);
    heapClassInst.heap32[(r1+4)] = Int32(r7);
}
}
    r2 = r4 << 2;
    r3 = Int64(heapClassInst.heap32[(r1+5)]);
    r2 = (r3 + r2)|0;
    r2 = r2 >> 2;
    heapClassInst.heap32[(r2)] = Int32(r0);
    r2 = Int64(heapClassInst.heap32[(r1+3)]);
    r2 = (r2 + 1)|0;
    heapClassInst.heap32[(r1+3)] = Int32(r2);
    commonVariable.r_g0 = r0;
    return;
}

func _ZN21btCollisionDispatcher13clearManifoldEP20btPersistentManifold(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp+1)]);
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0+279)]);
if(!(r1 < 1)) 
{
    r2 = 0;
while(true){
    r2 = (r2 + 1)|0;
    if(r1 > r2) 
{
continue 
}
else{
break 
}
}
}
    heapClassInst.heap32[(r0+279)] = 0;
    return;
}

func _ZN21btCollisionDispatcher14needsCollisionEP17btCollisionObjectS1_(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
    var r4:Int64 = 0
var __label__ = 0;
    i7 = sp + (-16);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp+1)]);
    if(r0 != 0) 
{
    r1 = Int64(heapClassInst.heap32[(fp+2)]);
    if(r1 != 0) 
{
    r2 = Int64(heapClassInst.heap32[(fp)]);
    r2 = r2 >> 2;
    r3 = Int64(heapClassInst.heap32[(r2+1)]);
    r4 = r3 & 1;
if(!(r4 != 0)) 
{
    r4 = Int64(heapClassInst.heapU8[r0+204]);
    r4 = r4 & 3;
if(!(r4 == 0)) 
{
    r4 = Int64(heapClassInst.heapU8[r1+204]);
    r4 = r4 & 3;
if(!(r4 == 0)) 
{
    r3 = r3 | 1;
    heapClassInst.heap32[(r2+1)] = Int32(r3);
    r2 = _E2_str977;
    heapClassInst.heap32[(g0)] = Int32(r2);
    _assert(i7);
}
}
}
    r2 = r0 >> 2;
    r3 = Int64(heapClassInst.heap32[(r2+54)]);
    if(r3 == 2) 
{
__label__ = 10;
}
else{
    if(r3 != 5) 
{
__label__ = 12;
}
else{
__label__ = 10;
}
}
do {
if (__label__ == 10){
    r3 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+54)]);
if(!(r3 == 2)) 
{
if(!(r3 == 5)) 
{
break 
}
}
    r0 = 0;
    commonVariable.r_g0 = r0;
    return;
}
} while(false);
    r3 = Int64(heapClassInst.heap32[(r2+63)]);
    if(r3 != 0) 
{
    r2 = Int64(heapClassInst.heap32[(r2)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    r0 = 0;
    __FUNCTION_TABLE__[(r2)>>2](i7);
    r0 = if (commonVariable.r_g0 == r0) {1} else {0};
}
else{
    r0 = 0;
}
    r0 = r0 & 1;
    r0 = r0 ^ 1;
    commonVariable.r_g0 = r0;
    return;
}
else{
    r0 = _E2_str876;
    r1 = _E2_str573;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = 167;
    _assert(i7);
}
}
else{
    r0 = _E2_str775;
    r1 = _E2_str573;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = 166;
    _assert(i7);
}
}

func _ZN21btCollisionDispatcher26allocateCollisionAlgorithmEi(sp:Int64) : Unit
{
    var i7:Int64 = 0
    var fp = sp>>2;
    var r0:Int64 = 0
    var r1:Int64 = 0
    var r2:Int64 = 0
    var r3:Int64 = 0
var __label__ = 0;
    i7 = sp + (-16);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0+48)]);
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0+2)]);
    r2 = Int64(heapClassInst.heap32[(fp+1)]);
    if(r1 == 0) 
{
    r0 = gNumAlignedAllocs;
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0)]);
    r1 = (r1 + 1)|0;
    heapClassInst.heap32[(r0)] = Int32(r1);
    r0 = (r2 + 19)|0;
    heapClassInst.heap32[(g0)] = Int32(r0);
    mallocNew(i7);
    r0 = commonVariable.r_g0;
if(!(r0 == 0)) 
{
    r1 = 0;
    r2 = (r0 + 4)|0;
    r1 = (r1 - r2)|0;
    r1 = r1 & 15;
    r1 = (r0 + r1)|0;
    r2 = r1 >> 2;
    heapClassInst.heap32[(r2)] = Int32(r0);
    r0 = (r1 + 4)|0;
}
    commonVariable.r_g0 = r0;
    return;
}
else{
if(!(r2 == 0)) 
{
    r3 = Int64(heapClassInst.heap32[(r0)]);
if(!(r3 >= r2)) 
{
    r0 = _E2_str270;
    r1 = _E2_str169;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = 69;
    _assert(i7);
}
}
    if(r1 > 0) 
{
    r2 = Int64(heapClassInst.heap32[(r0+3)]);
    r3 = r2 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r1 = (r1 + (-1))|0;
    heapClassInst.heap32[(r0+3)] = Int32(r3);
    heapClassInst.heap32[(r0+2)] = Int32(r1);
    commonVariable.r_g0 = r2;
    return;
}
else{
    r0 = _E2_str371;
    r1 = _E2_str169;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = 70;
    _assert(i7);
}
}
}

func _ZN17btCollisionObject24checkCollideWithOverrideEPS_(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = 1;
    commonVariable.r_g0 = r0;
    return;
}

func _ZN17btCollisionObject17setCollisionShapeEP16btCollisionShape(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(fp+1)]);
    heapClassInst.heap32[(r0+48)] = Int32(r1);
    heapClassInst.heap32[(r0+50)] = Int32(r1);
    return;
}

func _ZNK17btCollisionObject28calculateSerializeBufferSizeEv(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = 248;
    commonVariable.r_g0 = r0;
    return;
}

func _ZN17btCollisionObjectD1Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV17btCollisionObject;
    r0 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r0)] = Int32(r1);
    return;
}

func _ZN17btCollisionObjectD0Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV17btCollisionObject;
    r2 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
if(!(r0 == 0)) 
{
    r0 = gNumAlignedFree;
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0)]);
    r1 = (r1 + 1)|0;
    heapClassInst.heap32[(r0)] = Int32(r1);
    r0 = Int64(heapClassInst.heap32[(r2+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
}
    return;
}

func _ZNK17btCollisionObject9serializeEPvP12btSerializer(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap32[(fp+1)]);
    r2 = r0 >> 2;
    r1 = r1 >> 2;
    heapClassInst.heap32[(r1+4)] = heapClassInst.heap32[(r2+1)];
    heapClassInst.heap32[(r1+5)] = heapClassInst.heap32[(r2+2)];
    heapClassInst.heap32[(r1+6)] = heapClassInst.heap32[(r2+3)];
    heapClassInst.heap32[(r1+7)] = heapClassInst.heap32[(r2+4)];
    heapClassInst.heap32[(r1+8)] = heapClassInst.heap32[(r2+5)];
    heapClassInst.heap32[(r1+9)] = heapClassInst.heap32[(r2+6)];
    heapClassInst.heap32[(r1+10)] = heapClassInst.heap32[(r2+7)];
    heapClassInst.heap32[(r1+11)] = heapClassInst.heap32[(r2+8)];
    heapClassInst.heap32[(r1+12)] = heapClassInst.heap32[(r2+9)];
    heapClassInst.heap32[(r1+13)] = heapClassInst.heap32[(r2+10)];
    heapClassInst.heap32[(r1+14)] = heapClassInst.heap32[(r2+11)];
    heapClassInst.heap32[(r1+15)] = heapClassInst.heap32[(r2+12)];
    heapClassInst.heap32[(r1+16)] = heapClassInst.heap32[(r2+13)];
    heapClassInst.heap32[(r1+17)] = heapClassInst.heap32[(r2+14)];
    heapClassInst.heap32[(r1+18)] = heapClassInst.heap32[(r2+15)];
    heapClassInst.heap32[(r1+19)] = heapClassInst.heap32[(r2+16)];
    heapClassInst.heap32[(r1+20)] = heapClassInst.heap32[(r2+17)];
    heapClassInst.heap32[(r1+21)] = heapClassInst.heap32[(r2+18)];
    heapClassInst.heap32[(r1+22)] = heapClassInst.heap32[(r2+19)];
    heapClassInst.heap32[(r1+23)] = heapClassInst.heap32[(r2+20)];
    heapClassInst.heap32[(r1+24)] = heapClassInst.heap32[(r2+21)];
    heapClassInst.heap32[(r1+25)] = heapClassInst.heap32[(r2+22)];
    heapClassInst.heap32[(r1+26)] = heapClassInst.heap32[(r2+23)];
    heapClassInst.heap32[(r1+27)] = heapClassInst.heap32[(r2+24)];
    heapClassInst.heap32[(r1+28)] = heapClassInst.heap32[(r2+25)];
    heapClassInst.heap32[(r1+29)] = heapClassInst.heap32[(r2+26)];
    heapClassInst.heap32[(r1+30)] = heapClassInst.heap32[(r2+27)];
    heapClassInst.heap32[(r1+31)] = heapClassInst.heap32[(r2+28)];
    heapClassInst.heap32[(r1+32)] = heapClassInst.heap32[(r2+29)];
    heapClassInst.heap32[(r1+33)] = heapClassInst.heap32[(r2+30)];
    heapClassInst.heap32[(r1+34)] = heapClassInst.heap32[(r2+31)];
    heapClassInst.heap32[(r1+35)] = heapClassInst.heap32[(r2+32)];
    heapClassInst.heap32[(r1+36)] = heapClassInst.heap32[(r2+33)];
    heapClassInst.heap32[(r1+37)] = heapClassInst.heap32[(r2+34)];
    heapClassInst.heap32[(r1+38)] = heapClassInst.heap32[(r2+35)];
    heapClassInst.heap32[(r1+39)] = heapClassInst.heap32[(r2+36)];
    heapClassInst.heap32[(r1+40)] = heapClassInst.heap32[(r2+37)];
    heapClassInst.heap32[(r1+41)] = heapClassInst.heap32[(r2+38)];
    heapClassInst.heap32[(r1+42)] = heapClassInst.heap32[(r2+39)];
    heapClassInst.heap32[(r1+43)] = heapClassInst.heap32[(r2+40)];
    heapClassInst.heap32[(r1+44)] = heapClassInst.heap32[(r2+41)];
    heapClassInst.heap32[(r1+45)] = heapClassInst.heap32[(r2+42)];
    heapClassInst.heap32[(r1+46)] = heapClassInst.heap32[(r2+43)];
    heapClassInst.heap32[(r1+47)] = heapClassInst.heap32[(r2+44)];
    r3 = Int64(heapClassInst.heap32[(r2+45)]);
    heapClassInst.heap32[(r1+55)] = Int32(r3);
    r3 = Int64(heapClassInst.heap32[(fp+2)]);
    heapClassInst.heap32[(r1+48)] = heapClassInst.heap32[(r2+46)];
    heapClassInst.heap32[(r1)] = 0;
    r4 = r3 >> 2;
    r5 = Int64(heapClassInst.heap32[(r4)]);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5+7)]);
    r6 = Int64(heapClassInst.heap32[(r2+48)]);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r6);
    __FUNCTION_TABLE__[(r5)>>2](i7);
    heapClassInst.heap32[(r1+1)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(r1+2)] = 0;
    r5 = Int64(heapClassInst.heap32[(r2+51)]);
    heapClassInst.heap32[(r1+56)] = Int32(r5);
    r5 = Int64(heapClassInst.heap32[(r2+52)]);
    heapClassInst.heap32[(r1+57)] = Int32(r5);
    r5 = Int64(heapClassInst.heap32[(r2+53)]);
    heapClassInst.heap32[(r1+58)] = Int32(r5);
    r5 = Int64(heapClassInst.heap32[(r2+54)]);
    heapClassInst.heap32[(r1+59)] = Int32(r5);
    r5 = Int64(heapClassInst.heap32[(r2+54)]);
    heapClassInst.heap32[(r1+59)] = Int32(r5);
    heapClassInst.heap32[(r1+49)] = heapClassInst.heap32[(r2+55)];
    heapClassInst.heap32[(r1+50)] = heapClassInst.heap32[(r2+56)];
    heapClassInst.heap32[(r1+51)] = heapClassInst.heap32[(r2+57)];
    r5 = Int64(heapClassInst.heap32[(r2+58)]);
    heapClassInst.heap32[(r1+60)] = Int32(r5);
    r5 = Int64(heapClassInst.heap32[(r4)]);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5+10)]);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r0);
    __FUNCTION_TABLE__[(r5)>>2](i7);
    r0 = commonVariable.r_g0;
    r5 = Int64(heapClassInst.heap32[(r4)]);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5+7)]);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r0);
    __FUNCTION_TABLE__[(r5)>>2](i7);
    r5 = commonVariable.r_g0;
    heapClassInst.heap32[(r1+3)] = Int32(r5);
if(!(r5 == 0)) 
{
    r4 = Int64(heapClassInst.heap32[(r4)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+12)]);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r0);
    __FUNCTION_TABLE__[(r4)>>2](i7);
}
    heapClassInst.heap32[(r1+52)] = heapClassInst.heap32[(r2+60)];
    heapClassInst.heap32[(r1+53)] = heapClassInst.heap32[(r2+61)];
    heapClassInst.heap32[(r1+54)] = heapClassInst.heap32[(r2+62)];
    heapClassInst.heap32[(r1+54)] = heapClassInst.heap32[(r2+62)];
    r0 = Int64(heapClassInst.heap32[(r2+63)]);
    heapClassInst.heap32[(r1+61)] = Int32(r0);
    r0 = _E2_str78;
    commonVariable.r_g0 = r0;
    return;
}

func _ZNK17btCollisionObject21serializeSingleObjectEP12btSerializer(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
var __label__ = 0;
    i7 = sp + (-24);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    r3 = Int64(heapClassInst.heap32[(fp+1)]);
    __FUNCTION_TABLE__[(r2)>>2](i7);
    r4 = r3 >> 2;
    r5 = Int64(heapClassInst.heap32[(r4)]);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5+4)]);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+2)] = 1;
    __FUNCTION_TABLE__[(r5)>>2](i7);
    r2 = commonVariable.r_g0;
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r5 = r2 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+5)]);
    r5 = Int64(heapClassInst.heap32[(r5+2)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r5);
    heapClassInst.heap32[(g0+2)] = Int32(r3);
    __FUNCTION_TABLE__[(r1)>>2](i7);
    r4 = Int64(heapClassInst.heap32[(r4)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+5)]);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r2);
    heapClassInst.heap32[(g0+2)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+3)] = 1245859651;
    heapClassInst.heap32[(g0+4)] = Int32(r0);
    __FUNCTION_TABLE__[(r4)>>2](i7);
    return;
}

func _ZN16btManifoldResult20setShapeIdentifiersAEii(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(fp+1)]);
    r2 = Int64(heapClassInst.heap32[(fp+2)]);
    heapClassInst.heap32[(r0+36)] = Int32(r1);
    heapClassInst.heap32[(r0+38)] = Int32(r2);
    return;
}

func _ZN16btManifoldResult20setShapeIdentifiersBEii(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(fp+1)]);
    r2 = Int64(heapClassInst.heap32[(fp+2)]);
    heapClassInst.heap32[(r0+37)] = Int32(r1);
    heapClassInst.heap32[(r0+39)] = Int32(r2);
    return;
}

func _ZN16btCollisionWorld14setDebugDrawerEP12btIDebugDraw(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(fp+1)]);
    heapClassInst.heap32[(r0+21)] = Int32(r1);
    return;
}

func _ZN16btCollisionWorld14getDebugDrawerEv(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0+21)]);
    commonVariable.r_g0 = r0;
    return;
}

func _ZNK16btCollisionWorld20ConvexResultCallback14needsCollisionEP17btBroadphaseProxy(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap32[(fp+1)]);
    r2 = Int64(heapClassInst.heapU16[(r0+10)>>1]);
    r3 = Int64(heapClassInst.heapU16[(r1+4)>>1]);
    r2 = r2 & r3;
    r2 = r2 & 65535;
    if(r2 == 0) 
{
    r0 = 0;
    commonVariable.r_g0 = r0;
    return;
}
else{
    r1 = Int64(heapClassInst.heapU16[(r1+6)>>1]);
    r0 = Int64(heapClassInst.heapU16[(r0+8)>>1]);
    r0 = r1 & r0;
    r0 = r0 & 65535;
    r1 = 0;
    r0 = if (r0 != r1) {1} else {0};
    r0 = r0 & 1;
    commonVariable.r_g0 = r0;
    return;
}
}

func _ZN12btConvexCast10CastResult9DebugDrawEf(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    return;
}

func _ZN12btConvexCast10CastResult15drawCoordSystemERK11btTransform(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    return;
}

func _ZN12btConvexCast10CastResultD1Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTVN12btConvexCast10CastResultE;
    r0 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r0)] = Int32(r1);
    return;
}

func _ZN12btConvexCast10CastResultD0Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTVN12btConvexCast10CastResultE;
    r2 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
    return;
}

func _ZZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEEN29BridgeTriangleRaycastCallback9reportHitERK9btVector3fii(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var f11: Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-56);
var g0 = i7>>2; 
    r0 = sp + (-8);
    r1 = Int64(heapClassInst.heap32[(fp+3)]);
    r2 = Int64(heapClassInst.heap32[(fp+1)]);
    r3 = Int64(heapClassInst.heap32[(fp)]);
    r4 = r0 >> 2;
    r5 = Int64(heapClassInst.heap32[(fp+4)]);
    heapClassInst.heap32[(fp+(-2))] = Int32(r1);
    r1 = r2 >> 2;
    heapClassInst.heap32[(r4+1)] = Int32(r5);
    r2 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r2+12)]);
    f0 = Float64(heapClassInst.heapFloat[(r2+22)]);
    f1 = Float64(heapClassInst.heapFloat[(r1)]);
    f2 = Float64(heapClassInst.heapFloat[(r2+18)]);
    f3 = Float64(heapClassInst.heapFloat[(r2+14)]);
    f4 = Float64(heapClassInst.heapFloat[(r2+23)]);
    f5 = Float64(heapClassInst.heapFloat[(r1+1)]);
    f6 = Float64(heapClassInst.heapFloat[(r2+19)]);
    f7 = Float64(heapClassInst.heapFloat[(r2+15)]);
    f8 = Float64(heapClassInst.heapFloat[(r2+24)]);
    f9 = Float64(heapClassInst.heapFloat[(r1+2)]);
    f10 = Float64(heapClassInst.heapFloat[(r2+20)]);
    f11 = Float64(heapClassInst.heapFloat[(r2+16)]);
    r1 = sp + (-40);
    f3 = f3*f1;
    f7 = f7*f5;
    r4 = r1 >> 2;
    heapClassInst.heap32[(fp+(-10))] = Int32(r3);
    f2 = f2*f1;
    f6 = f6*f5;
    f3 = f3+f7;
    f7 = f11*f9;
    f0 = f0*f1;
    f1 = f4*f5;
    f2 = f2+f6;
    f4 = f10*f9;
    f3 = f3+f7;
    heapClassInst.heap32[(r4+1)] = Int32(r0);
    f0 = f0+f1;
    f1 = f8*f9;
    f2 = f2+f4;
    heapClassInst.heapFloat[(r4+2)] = Float32(f3);
    f0 = f0+f1;
    heapClassInst.heapFloat[(r4+3)] = Float32(f2);
    heapClassInst.heapFloat[(r4+4)] = Float32(f0);
    heapClassInst.heap32[(r4+5)] = 0;
    heapClassInst.heap32[(r4+6)] = heapClassInst.heap32[(fp+2)];
    r0 = Int64(heapClassInst.heap32[(r2+11)]);
    r2 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+3)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = 1;
    __FUNCTION_TABLE__[(r2)>>2](i7);
    return;
}

func _ZZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEEN29BridgeTriangleRaycastCallback9reportHitE_0RK9btVector3fii(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var f11: Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-56);
var g0 = i7>>2; 
    r0 = sp + (-8);
    r1 = Int64(heapClassInst.heap32[(fp+3)]);
    r2 = Int64(heapClassInst.heap32[(fp+1)]);
    r3 = Int64(heapClassInst.heap32[(fp)]);
    r4 = r0 >> 2;
    r5 = Int64(heapClassInst.heap32[(fp+4)]);
    heapClassInst.heap32[(fp+(-2))] = Int32(r1);
    r1 = r2 >> 2;
    heapClassInst.heap32[(r4+1)] = Int32(r5);
    r2 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r2+12)]);
    f0 = Float64(heapClassInst.heapFloat[(r2+22)]);
    f1 = Float64(heapClassInst.heapFloat[(r1)]);
    f2 = Float64(heapClassInst.heapFloat[(r2+18)]);
    f3 = Float64(heapClassInst.heapFloat[(r2+14)]);
    f4 = Float64(heapClassInst.heapFloat[(r2+23)]);
    f5 = Float64(heapClassInst.heapFloat[(r1+1)]);
    f6 = Float64(heapClassInst.heapFloat[(r2+19)]);
    f7 = Float64(heapClassInst.heapFloat[(r2+15)]);
    f8 = Float64(heapClassInst.heapFloat[(r2+24)]);
    f9 = Float64(heapClassInst.heapFloat[(r1+2)]);
    f10 = Float64(heapClassInst.heapFloat[(r2+20)]);
    f11 = Float64(heapClassInst.heapFloat[(r2+16)]);
    r1 = sp + (-40);
    f3 = f3*f1;
    f7 = f7*f5;
    r4 = r1 >> 2;
    heapClassInst.heap32[(fp+(-10))] = Int32(r3);
    f2 = f2*f1;
    f6 = f6*f5;
    f3 = f3+f7;
    f7 = f11*f9;
    f0 = f0*f1;
    f1 = f4*f5;
    f2 = f2+f6;
    f4 = f10*f9;
    f3 = f3+f7;
    heapClassInst.heap32[(r4+1)] = Int32(r0);
    f0 = f0+f1;
    f1 = f8*f9;
    f2 = f2+f4;
    heapClassInst.heapFloat[(r4+2)] = Float32(f3);
    f0 = f0+f1;
    heapClassInst.heapFloat[(r4+3)] = Float32(f2);
    heapClassInst.heapFloat[(r4+4)] = Float32(f0);
    heapClassInst.heap32[(r4+5)] = 0;
    heapClassInst.heap32[(r4+6)] = heapClassInst.heap32[(fp+2)];
    r0 = Int64(heapClassInst.heap32[(r2+11)]);
    r2 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+3)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = 1;
    __FUNCTION_TABLE__[(r2)>>2](i7);
    return;
}

func _ZZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEEN15LocalInfoAdder2D1Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTVZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE15LocalInfoAdder2;
    r0 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r0)] = Int32(r1);
    return;
}

func _ZZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEEN15LocalInfoAdder2D0Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTVZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE15LocalInfoAdder2;
    r2 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
    return;
}

func _ZZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEEN15LocalInfoAdder215addSingleResultERNS_14LocalRayResultEb(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
var __label__ = 0;
    i7 = sp + (-24);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = sp + (-8);
    r0 = r0 >> 2;
    heapClassInst.heap32[(fp+(-2))] = ( -1);
    r2 = Int64(heapClassInst.heap32[(fp+1)]);
    r3 = r1 >> 2;
    r4 = Int64(heapClassInst.heap32[(r0+6)]);
    r5 = r2 >> 2;
    heapClassInst.heap32[(r3+1)] = Int32(r4);
    r3 = Int64(heapClassInst.heap32[(r5+1)]);
if(!(r3 != 0)) 
{
    heapClassInst.heap32[(r5+1)] = Int32(r1);
}
    r1 = Int64(heapClassInst.heap32[(fp+2)]);
    r3 = Int64(heapClassInst.heap32[(r0+5)]);
    r4 = r3 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+3)]);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r2);
    heapClassInst.heap32[(g0+2)] = Int32(r1);
    __FUNCTION_TABLE__[(r4)>>2](i7);
    r1 = Int64(heapClassInst.heap32[(r0+5)]);
    r1 = r1 >> 2;
    heapClassInst.heap32[(r0+1)] = heapClassInst.heap32[(r1+1)];
    return;
}

func _ZZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfEN32BridgeTriangleConvexcastCallback9reportHitERK9btVector3SG_fii(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-72);
var g0 = i7>>2; 
    r0 = sp + (-8);
    r1 = Int64(heapClassInst.heap32[(fp+4)]);
    r2 = Int64(heapClassInst.heap32[(fp)]);
    r3 = r0 >> 2;
    r4 = Int64(heapClassInst.heap32[(fp+5)]);
    heapClassInst.heap32[(fp+(-2))] = Int32(r1);
    r1 = r2 >> 2;
    heapClassInst.heap32[(r3+1)] = Int32(r4);
    r2 = Int64(heapClassInst.heap32[(r1+52)]);
    f0 = Float64(heapClassInst.heapFloat[(fp+3)]);
    r3 = r2 >> 2;
    f1 = Float64(heapClassInst.heapFloat[(r3+1)]);
    if(f1 < f0) 
{
    commonVariable.f_g0 = f0;
    return;
}
else{
    r4 = Int64(heapClassInst.heap32[(fp+1)]);
    r5 = Int64(heapClassInst.heap32[(fp+2)]);
    r1 = Int64(heapClassInst.heap32[(r1+53)]);
    r6 = sp + (-56);
    r7 = r6 >> 2;
    heapClassInst.heap32[(fp+(-14))] = Int32(r1);
    r1 = r4 >> 2;
    heapClassInst.heap32[(r7+1)] = Int32(r0);
    heapClassInst.heap32[(r7+2)] = heapClassInst.heap32[(r1)];
    heapClassInst.heap32[(r7+3)] = heapClassInst.heap32[(r1+1)];
    heapClassInst.heap32[(r7+4)] = heapClassInst.heap32[(r1+2)];
    r0 = r5 >> 2;
    heapClassInst.heap32[(r7+5)] = heapClassInst.heap32[(r1+3)];
    heapClassInst.heap32[(r7+6)] = heapClassInst.heap32[(r0)];
    heapClassInst.heap32[(r7+7)] = heapClassInst.heap32[(r0+1)];
    heapClassInst.heap32[(r7+8)] = heapClassInst.heap32[(r0+2)];
    heapClassInst.heap32[(r7+9)] = heapClassInst.heap32[(r0+3)];
    heapClassInst.heapFloat[(r7+10)] = Float32(f0);
    r0 = Int64(heapClassInst.heap32[(r3)]);
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0+3)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0+1)] = Int32(r6);
    heapClassInst.heap32[(g0+2)] = 1;
    __FUNCTION_TABLE__[(r0)>>2](i7);
    return;
}
}

func _ZZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfEN32BridgeTriangleConvexcastCallback9reportHitE_0RK9btVector3SG_fii(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-72);
var g0 = i7>>2; 
    r0 = sp + (-8);
    r1 = Int64(heapClassInst.heap32[(fp+4)]);
    r2 = Int64(heapClassInst.heap32[(fp)]);
    r3 = r0 >> 2;
    r4 = Int64(heapClassInst.heap32[(fp+5)]);
    heapClassInst.heap32[(fp+(-2))] = Int32(r1);
    r1 = r2 >> 2;
    heapClassInst.heap32[(r3+1)] = Int32(r4);
    r2 = Int64(heapClassInst.heap32[(r1+52)]);
    f0 = Float64(heapClassInst.heapFloat[(fp+3)]);
    r3 = r2 >> 2;
    f1 = Float64(heapClassInst.heapFloat[(r3+1)]);
    if(f1 < f0) 
{
    commonVariable.f_g0 = f0;
    return;
}
else{
    r4 = Int64(heapClassInst.heap32[(fp+1)]);
    r5 = Int64(heapClassInst.heap32[(fp+2)]);
    r1 = Int64(heapClassInst.heap32[(r1+53)]);
    r6 = sp + (-56);
    r7 = r6 >> 2;
    heapClassInst.heap32[(fp+(-14))] = Int32(r1);
    r1 = r4 >> 2;
    heapClassInst.heap32[(r7+1)] = Int32(r0);
    heapClassInst.heap32[(r7+2)] = heapClassInst.heap32[(r1)];
    heapClassInst.heap32[(r7+3)] = heapClassInst.heap32[(r1+1)];
    heapClassInst.heap32[(r7+4)] = heapClassInst.heap32[(r1+2)];
    r0 = r5 >> 2;
    heapClassInst.heap32[(r7+5)] = heapClassInst.heap32[(r1+3)];
    heapClassInst.heap32[(r7+6)] = heapClassInst.heap32[(r0)];
    heapClassInst.heap32[(r7+7)] = heapClassInst.heap32[(r0+1)];
    heapClassInst.heap32[(r7+8)] = heapClassInst.heap32[(r0+2)];
    heapClassInst.heap32[(r7+9)] = heapClassInst.heap32[(r0+3)];
    heapClassInst.heapFloat[(r7+10)] = Float32(f0);
    r0 = Int64(heapClassInst.heap32[(r3)]);
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0+3)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0+1)] = Int32(r6);
    heapClassInst.heap32[(g0+2)] = 0;
    __FUNCTION_TABLE__[(r0)>>2](i7);
    return;
}
}

func _ZZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfEN14LocalInfoAdderD1Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTVZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE14LocalInfoAdder;
    r0 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r0)] = Int32(r1);
    return;
}

func _ZZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfEN14LocalInfoAdderD0Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTVZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE14LocalInfoAdder;
    r2 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
    return;
}

func _ZZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfEN14LocalInfoAdder15addSingleResultERNS_17LocalConvexResultEb(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
var __label__ = 0;
    i7 = sp + (-24);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = sp + (-8);
    r0 = r0 >> 2;
    heapClassInst.heap32[(fp+(-2))] = ( -1);
    r2 = Int64(heapClassInst.heap32[(fp+1)]);
    r3 = r1 >> 2;
    r4 = Int64(heapClassInst.heap32[(r0+4)]);
    r5 = r2 >> 2;
    heapClassInst.heap32[(r3+1)] = Int32(r4);
    r3 = Int64(heapClassInst.heap32[(r5+1)]);
if(!(r3 != 0)) 
{
    heapClassInst.heap32[(r5+1)] = Int32(r1);
}
    r1 = Int64(heapClassInst.heap32[(fp+2)]);
    r3 = Int64(heapClassInst.heap32[(r0+3)]);
    r4 = r3 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+3)]);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r2);
    heapClassInst.heap32[(g0+2)] = Int32(r1);
    __FUNCTION_TABLE__[(r4)>>2](i7);
    r1 = Int64(heapClassInst.heap32[(r0+3)]);
    r1 = r1 >> 2;
    heapClassInst.heap32[(r0+1)] = heapClassInst.heap32[(r1+1)];
    return;
}

func _ZN17DebugDrawcallbackD1Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = _ZTV17DebugDrawcallback;
    r1 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r1 >> 2;
    r2 = (r0 + 8)|0;
    r3 = _ZTV31btInternalTriangleIndexCallback;
    r0 = (r0 + 32)|0;
    heapClassInst.heap32[(r1)] = Int32(r2);
    r2 = _ZTV18btTriangleCallback;
    r3 = (r3 + 8)|0;
    heapClassInst.heap32[(r1+1)] = Int32(r0);
    r0 = (r2 + 8)|0;
    heapClassInst.heap32[(r1+1)] = Int32(r3);
    heapClassInst.heap32[(r1)] = Int32(r0);
    return;
}

func _ZN17DebugDrawcallbackD0Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = _ZTV17DebugDrawcallback;
    r1 = Int64(heapClassInst.heap32[(fp)]);
    r2 = r1 >> 2;
    r3 = (r0 + 8)|0;
    r4 = _ZTV31btInternalTriangleIndexCallback;
    r0 = (r0 + 32)|0;
    heapClassInst.heap32[(r2)] = Int32(r3);
    r3 = _ZTV18btTriangleCallback;
    r4 = (r4 + 8)|0;
    heapClassInst.heap32[(r2+1)] = Int32(r0);
    r0 = (r3 + 8)|0;
    heapClassInst.heap32[(r2+1)] = Int32(r4);
    heapClassInst.heap32[(r2)] = Int32(r0);
    heapClassInst.heap32[(g0)] = Int32(r1);
    _ZdlPv(i7);
    return;
}

func _ZN17DebugDrawcallback15processTriangleEP9btVector3ii(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var f11: Float64 = 0.0
    var f12: Float64 = 0.0
    var f13: Float64 = 0.0
    var f14: Float64 = 0.0
    var f15: Float64 = 0.0
    var f16: Float64 = 0.0
    var f17: Float64 = 0.0
    var f18: Float64 = 0.0
    var f19: Float64 = 0.0
    var f20: Float64 = 0.0
    var f21: Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-112);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap32[(fp+1)]);
    r2 = r0 >> 2;
    r1 = r1 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r1)]);
    f1 = Float64(heapClassInst.heapFloat[(r2+7)]);
    f2 = Float64(heapClassInst.heapFloat[(r1+1)]);
    f3 = Float64(heapClassInst.heapFloat[(r2+8)]);
    f4 = Float64(heapClassInst.heapFloat[(r2+11)]);
    f5 = Float64(heapClassInst.heapFloat[(r2+12)]);
    f6 = f1*f0;
    f7 = f3*f2;
    f8 = Float64(heapClassInst.heapFloat[(r1+2)]);
    f9 = Float64(heapClassInst.heapFloat[(r2+9)]);
    f10 = Float64(heapClassInst.heapFloat[(r2+15)]);
    f11 = Float64(heapClassInst.heapFloat[(r2+16)]);
    f12 = Float64(heapClassInst.heapFloat[(r2+13)]);
    f13 = f4*f0;
    f14 = f5*f2;
    f6 = f6+f7;
    f7 = f9*f8;
    f15 = Float64(heapClassInst.heapFloat[(r2+17)]);
    f0 = f10*f0;
    f2 = f11*f2;
    f13 = f13+f14;
    f14 = f12*f8;
    f6 = f6+f7;
    f7 = Float64(heapClassInst.heapFloat[(r2+19)]);
    f16 = Float64(heapClassInst.heapFloat[(r2+21)]);
    f17 = Float64(heapClassInst.heapFloat[(r2+20)]);
    r3 = sp + (-32);
    f13 = f13+f14;
    f0 = f0+f2;
    f2 = f15*f8;
    f6 = f6+f7;
    f0 = f0+f2;
    r4 = r3 >> 2;
    f2 = f13+f17;
    heapClassInst.heapFloat[(fp+(-8))] = Float32(f6);
    f0 = f0+f16;
    heapClassInst.heapFloat[(r4+1)] = Float32(f2);
    heapClassInst.heapFloat[(r4+2)] = Float32(f0);
    heapClassInst.heap32[(r4+3)] = 0;
    f8 = Float64(heapClassInst.heapFloat[(r1+4)]);
    f13 = Float64(heapClassInst.heapFloat[(r1+5)]);
    f14 = Float64(heapClassInst.heapFloat[(r1+6)]);
    f18 = f1*f8;
    f19 = f3*f13;
    f20 = f4*f8;
    f21 = f5*f13;
    f18 = f18+f19;
    f19 = f9*f14;
    f18 = f18+f19;
    f8 = f10*f8;
    f13 = f11*f13;
    f19 = f20+f21;
    f20 = f12*f14;
    f18 = f18+f7;
    r4 = sp + (-48);
    f19 = f19+f20;
    f8 = f8+f13;
    f13 = f15*f14;
    f14 = f19+f17;
    f8 = f8+f13;
    r5 = r4 >> 2;
    heapClassInst.heapFloat[(fp+(-12))] = Float32(f18);
    f8 = f8+f16;
    heapClassInst.heapFloat[(r5+1)] = Float32(f14);
    heapClassInst.heapFloat[(r5+2)] = Float32(f8);
    heapClassInst.heap32[(r5+3)] = 0;
    f13 = Float64(heapClassInst.heapFloat[(r1+8)]);
    f19 = Float64(heapClassInst.heapFloat[(r1+9)]);
    f20 = Float64(heapClassInst.heapFloat[(r1+10)]);
    f1 = f1*f13;
    f3 = f3*f19;
    f4 = f4*f13;
    f5 = f5*f19;
    f1 = f1+f3;
    f3 = f9*f20;
    f1 = f1+f3;
    f3 = f10*f13;
    f9 = f11*f19;
    f4 = f4+f5;
    f5 = f12*f20;
    r1 = sp + (-64);
    f4 = f4+f5;
    f1 = f1+f7;
    f3 = f3+f9;
    f5 = f15*f20;
    f3 = f3+f5;
    f4 = f4+f17;
    r5 = r1 >> 2;
    heapClassInst.heapFloat[(fp+(-16))] = Float32(f1);
    f5 = f6+f18;
    f3 = f3+f16;
    heapClassInst.heapFloat[(r5+1)] = Float32(f4);
    f7 = f2+f14;
    heapClassInst.heapFloat[(r5+2)] = Float32(f3);
    f5 = f5+f1;
    f9 =        0.3333333432674408;
    r6 = sp + (-80);
    f10 = f0+f8;
    f7 = f7+f4;
    f8 = f8-f0;
    f4 = f4-f2;
    f11 = f18-f6;
    f0 = f3-f0;
    f2 = f14-f2;
    f1 = f1-f6;
    f5 = f5*f9;
    heapClassInst.heap32[(r5+3)] = 0;
    f3 = f10+f3;
    f6 = f2*f0;
    f10 = f8*f4;
    f8 = f8*f1;
    f0 = f11*f0;
    r5 = r6 >> 2;
    f7 = f7*f9;
    heapClassInst.heapFloat[(fp+(-20))] = Float32(f5);
    f5 = f6-f10;
    f0 = f8-f0;
    f4 = f11*f4;
    f1 = f2*f1;
    f2 = f3*f9;
    heapClassInst.heapFloat[(r5+1)] = Float32(f7);
    f1 = f4-f1;
    heapClassInst.heapFloat[(r5+2)] = Float32(f2);
    f2 = f5*f5;
    f3 = f0*f0;
    heapClassInst.heap32[(r5+3)] = 0;
    f2 = f2+f3;
    f3 = f1*f1;
    f2 = f2+f3;
    heapClassInst.heapFloat[(g0)] = Float32(f2);
    r7 = sp + (-96);
    sqrtf(i7);
    r8 = r7 >> 2;
    heapClassInst.heap32[(fp+(-24))] = 1065353216;
    heapClassInst.heap32[(r8+1)] = 1065353216;
    heapClassInst.heap32[(r8+2)] = 0;
    heapClassInst.heap32[(r8+3)] = 0;
    r8 = Int64(heapClassInst.heap32[(r2+2)]);
    r9 = r8 >> 2;
    f3 =                         1.0;
    r9 = Int64(heapClassInst.heap32[(r9)]);
    f2 = f3/commonVariable.f_g0;
    r9 = r9 >> 2;
    r9 = Int64(heapClassInst.heap32[(r9+2)]);
    f3 = f5*f2;
    f4 = Float64(heapClassInst.heapFloat[(fp+(-20))]);
    f5 = Float64(heapClassInst.heapFloat[(r5+2)]);
    f6 = Float64(heapClassInst.heapFloat[(r5+1)]);
    r5 = sp + (-16);
    f0 = f0*f2;
    f3 = f4+f3;
    f1 = f1*f2;
    r10 = r5 >> 2;
    f0 = f6+f0;
    heapClassInst.heapFloat[(fp+(-4))] = Float32(f3);
    f1 = f5+f1;
    heapClassInst.heapFloat[(r10+1)] = Float32(f0);
    heapClassInst.heapFloat[(r10+2)] = Float32(f1);
    heapClassInst.heap32[(r10+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(r8);
    heapClassInst.heap32[(g0+1)] = Int32(r6);
    heapClassInst.heap32[(g0+2)] = Int32(r5);
    heapClassInst.heap32[(g0+3)] = Int32(r7);
    __FUNCTION_TABLE__[(r9)>>2](i7);
    r5 = Int64(heapClassInst.heap32[(r2+2)]);
    r6 = r5 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6)]);
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6+2)]);
    r0 = (r0 + 12)|0;
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0+1)] = Int32(r3);
    heapClassInst.heap32[(g0+2)] = Int32(r4);
    heapClassInst.heap32[(g0+3)] = Int32(r0);
    __FUNCTION_TABLE__[(r6)>>2](i7);
    r5 = Int64(heapClassInst.heap32[(r2+2)]);
    r6 = r5 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6)]);
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6+2)]);
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0+1)] = Int32(r4);
    heapClassInst.heap32[(g0+2)] = Int32(r1);
    heapClassInst.heap32[(g0+3)] = Int32(r0);
    __FUNCTION_TABLE__[(r6)>>2](i7);
    r2 = Int64(heapClassInst.heap32[(r2+2)]);
    r4 = r2 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+2)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = Int32(r3);
    heapClassInst.heap32[(g0+3)] = Int32(r0);
    __FUNCTION_TABLE__[(r4)>>2](i7);
    return;
}

func _ZN17DebugDrawcallback28internalProcessTriangleIndexEP9btVector3ii(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
var __label__ = 0;
    i7 = sp + (-16);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+2)]);
    r2 = Int64(heapClassInst.heap32[(fp+1)]);
    r3 = Int64(heapClassInst.heap32[(fp+2)]);
    r4 = Int64(heapClassInst.heap32[(fp+3)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r2);
    heapClassInst.heap32[(g0+2)] = Int32(r3);
    heapClassInst.heap32[(g0+3)] = Int32(r4);
    __FUNCTION_TABLE__[(r1)>>2](i7);
    return;
}

func _ZThn4_N17DebugDrawcallbackD1Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = _ZTV17DebugDrawcallback;
    r1 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r1 >> 2;
    r2 = (r0 + 8)|0;
    r3 = _ZTV31btInternalTriangleIndexCallback;
    r0 = (r0 + 32)|0;
    heapClassInst.heap32[(r1+(-1))] = Int32(r2);
    r2 = _ZTV18btTriangleCallback;
    r3 = (r3 + 8)|0;
    heapClassInst.heap32[(r1)] = Int32(r0);
    r0 = (r2 + 8)|0;
    heapClassInst.heap32[(r1)] = Int32(r3);
    heapClassInst.heap32[(r1+(-1))] = Int32(r0);
    return;
}

func _ZThn4_N17DebugDrawcallbackD0Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV17DebugDrawcallback;
    r2 = r0 >> 2;
    r3 = (r1 + 8)|0;
    r4 = _ZTV31btInternalTriangleIndexCallback;
    r1 = (r1 + 32)|0;
    heapClassInst.heap32[(r2+(-1))] = Int32(r3);
    r3 = _ZTV18btTriangleCallback;
    r4 = (r4 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    r1 = (r3 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r4);
    heapClassInst.heap32[(r2+(-1))] = Int32(r1);
    r0 = (r0 + (-4))|0;
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
    return;
}

func _ZThn4_N17DebugDrawcallback28internalProcessTriangleIndexEP9btVector3ii(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
var __label__ = 0;
    i7 = sp + (-16);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+(-1))]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+2)]);
    r0 = (r0 + (-4))|0;
    r2 = Int64(heapClassInst.heap32[(fp+1)]);
    r3 = Int64(heapClassInst.heap32[(fp+2)]);
    r4 = Int64(heapClassInst.heap32[(fp+3)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r2);
    heapClassInst.heap32[(g0+2)] = Int32(r3);
    heapClassInst.heap32[(g0+3)] = Int32(r4);
    __FUNCTION_TABLE__[(r1)>>2](i7);
    return;
}

func _ZN16btCollisionWorldD1Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZN16btCollisionWorldD2Ev(i7);
    return;
}

func _ZN16btCollisionWorldD0Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
var __label__ = 0;
    i7 = sp + (-16);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV16btCollisionWorld;
    r2 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    r1 = Int64(heapClassInst.heap32[(r2+4)]);
    r3 = Int64(heapClassInst.heap32[(r2+2)]);
    if(r3 > 0) 
{
    r3 = 0;
while(true){
    r4 = r3 << 2;
    r1 = (r1 + r4)|0;
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r4 = Int64(heapClassInst.heap32[(r1+47)]);
if(!(r4 == 0)) 
{
    r5 = Int64(heapClassInst.heap32[(r2+20)]);
    r6 = r5 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6)]);
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6+9)]);
    heapClassInst.heap32[(g0)] = Int32(r5);
    __FUNCTION_TABLE__[(r6)>>2](i7);
    r6 = commonVariable.r_g0 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6)]);
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6+10)]);
    r7 = Int64(heapClassInst.heap32[(r2+6)]);
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r4);
    heapClassInst.heap32[(g0+2)] = Int32(r7);
    __FUNCTION_TABLE__[(r6)>>2](i7);
    r5 = Int64(heapClassInst.heap32[(r2+20)]);
    r6 = r5 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6)]);
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6+3)]);
    r7 = Int64(heapClassInst.heap32[(r2+6)]);
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0+1)] = Int32(r4);
    heapClassInst.heap32[(g0+2)] = Int32(r7);
    __FUNCTION_TABLE__[(r6)>>2](i7);
    heapClassInst.heap32[(r1+47)] = 0;
}
    r3 = (r3 + 1)|0;
    r1 = Int64(heapClassInst.heap32[(r2+4)]);
    r4 = Int64(heapClassInst.heap32[(r2+2)]);
    if(r4 > r3) 
{
continue 
}
else{
break 
}
}
}
if(!(r1 == 0)) 
{
    r3 = Int64(heapClassInst.heapU8[r0+20]);
if(!(r3 == 0)) 
{
    r3 = gNumAlignedFree;
    r3 = r3 >> 2;
    r4 = Int64(heapClassInst.heap32[(r3)]);
    r4 = (r4 + 1)|0;
    r1 = r1 >> 2;
    heapClassInst.heap32[(r3)] = Int32(r4);
    r1 = Int64(heapClassInst.heap32[(r1+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    free(i7);
}
    heapClassInst.heap32[(r2+4)] = 0;
}
    r1 = 1;
    heapClassInst.heap8[r0+20] = Int8(r1);
    heapClassInst.heap32[(r2+4)] = 0;
    heapClassInst.heap32[(r2+2)] = 0;
    heapClassInst.heap32[(r2+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
    return;
}

func _ZN16btCollisionWorld11updateAabbsEv(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-64);
var g0 = i7>>2; 
    r0 = _E2_str1998;
    r1 = Int64(heapClassInst.heap32[(fp)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    r0 = r1 >> 2;
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    r2 = Int64(heapClassInst.heap32[(r0+2)]);
if(!(r2 < 1)) 
{
    r2 = 0;
while(true){
    r3 = Int64(heapClassInst.heap32[(r0+4)]);
    r4 = r2 << 2;
    r3 = (r3 + r4)|0;
    r3 = r3 >> 2;
    r2 = (r2 + 1)|0;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r4 = Int64(heapClassInst.heapU8[r1+88]);
    if(r4 != 0) 
{
__label__ = 5;
}
else{
    r4 = r3 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+54)]);
    if(r4 == 2) 
{
__label__ = 13;
}
else{
    if(r4 == 5) 
{
__label__ = 13;
}
else{
__label__ = 5;
}
}
}
do {
if (__label__ == 5){
    r4 = r3 >> 2;
    r5 = Int64(heapClassInst.heap32[(r4+48)]);
    r6 = r5 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6)]);
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6+2)]);
    r7 = sp + (-40);
    r8 = sp + (-24);
    r9 = (r3 + 4)|0;
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0+1)] = Int32(r9);
    heapClassInst.heap32[(g0+2)] = Int32(r8);
    heapClassInst.heap32[(g0+3)] = Int32(r7);
    __FUNCTION_TABLE__[(r6)>>2](i7);
    f0 =     -0.019999999552965164;
    f1 = Float64(heapClassInst.heapFloat[(fp+(-6))]);
    f1 = f1+f0;
    r5 = r8 >> 2;
    heapClassInst.heapFloat[(fp+(-6))] = Float32(f1);
    f2 = Float64(heapClassInst.heapFloat[(r5+1)]);
    f2 = f2+f0;
    heapClassInst.heapFloat[(r5+1)] = Float32(f2);
    f3 = Float64(heapClassInst.heapFloat[(r5+2)]);
    f0 = f3+f0;
    heapClassInst.heapFloat[(r5+2)] = Float32(f0);
    f3 =      0.019999999552965164;
    f4 = Float64(heapClassInst.heapFloat[(fp+(-10))]);
    f4 = f4+f3;
    r5 = r7 >> 2;
    heapClassInst.heapFloat[(fp+(-10))] = Float32(f4);
    f5 = Float64(heapClassInst.heapFloat[(r5+1)]);
    f5 = f5+f3;
    heapClassInst.heapFloat[(r5+1)] = Float32(f5);
    f6 = Float64(heapClassInst.heapFloat[(r5+2)]);
    f3 = f6+f3;
    heapClassInst.heapFloat[(r5+2)] = Float32(f3);
    r5 = Int64(heapClassInst.heap32[(r0+20)]);
    r3 = Int64(heapClassInst.heapU8[r3+204]);
    r3 = r3 & 1;
if(!(r3 != 0)) 
{
    f1 = f4-f1;
    f2 = f5-f2;
    f0 = f3-f0;
    f1 = f1*f1;
    f2 = f2*f2;
    f1 = f1+f2;
    f0 = f0*f0;
    f0 = f1+f0;
    f1 = 999999995904.0;
if(!(f0 < f1)) 
{
    r5 = Int64(heapClassInst.heap32[(r4+54)]);
    r5 = (r5 + (-4))|0;
if(!(`UIntNative`(r5) < `UIntNative`(2))) 
{
    heapClassInst.heap32[(r4+54)] = 5;
}
    r4 = _ZZN16btCollisionWorld16updateSingleAabbEP17btCollisionObjectE8reportMe_2E_b;
    r5 = Int64(heapClassInst.heapU8[r4]);
    if(r5 != 0) 
{
break 
}
else{
    r3 = Int64(heapClassInst.heap32[(r0+21)]);
    if(r3 == 0) 
{
break 
}
else{
    r5 = 1;
    r6 = r3 >> 2;
    heapClassInst.heap8[r4] = Int8(r5);
    r4 = Int64(heapClassInst.heap32[(r6)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+9)]);
    r5 = _E2_str1594;
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r5);
    __FUNCTION_TABLE__[(r4)>>2](i7);
    r3 = Int64(heapClassInst.heap32[(r0+21)]);
    r4 = r3 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+9)]);
    r5 = _E2_str1695;
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r5);
    __FUNCTION_TABLE__[(r4)>>2](i7);
    r3 = Int64(heapClassInst.heap32[(r0+21)]);
    r4 = r3 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+9)]);
    r5 = _E2_str1796;
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r5);
    __FUNCTION_TABLE__[(r4)>>2](i7);
    r3 = Int64(heapClassInst.heap32[(r0+21)]);
    r4 = r3 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+9)]);
    r5 = _E2_str1897;
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r5);
    __FUNCTION_TABLE__[(r4)>>2](i7);
break 
}
}
}
}
    r3 = r5 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+4)]);
    r6 = Int64(heapClassInst.heap32[(r0+6)]);
    r4 = Int64(heapClassInst.heap32[(r4+47)]);
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0+1)] = Int32(r4);
    heapClassInst.heap32[(g0+2)] = Int32(r8);
    heapClassInst.heap32[(g0+3)] = Int32(r7);
    heapClassInst.heap32[(g0+4)] = Int32(r6);
    __FUNCTION_TABLE__[(r3)>>2](i7);
}
} while(false);
    r3 = Int64(heapClassInst.heap32[(r0+2)]);
    if(r3 > r2) 
{
continue 
}
else{
break 
}
}
}
    r0 = _ZN15CProfileManager11CurrentNodeE;
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0)]);
    r2 = r1 >> 2;

    r3 = Int64(heapClassInst.heap32[(r2+4)]);
    r3 = (r3 + (-1))|0;
    heapClassInst.heap32[(r2+4)] = Int32(r3);
do {
if(!(r3 != 0)) 
{
    r3 = Int64(heapClassInst.heap32[(r2+1)]);
    if(r3 != 0) 
{
    r1 = sp + (-8);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0+1)] = 0;
    r3 = _ZL13gProfileClock_2E_0;
    gettimeofday(i7);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r1 = r1 >> 2;
    r4 = Int64(heapClassInst.heap32[(fp+(-2))]);
    r5 = Int64(heapClassInst.heap32[(r3)]);
    r4 = (r4 - r5)|0;
    r1 = Int64(heapClassInst.heap32[(r1+1)]);
    r3 = Int64(heapClassInst.heap32[(r3+1)]);
    r1 = (r1 - r3)|0;
    r3 = (r4 * 1000000)|0;
    r1 = (r1 + r3)|0;
    r3 = Int64(heapClassInst.heap32[(r2+3)]);
    r1 = (r1 - r3)|0;
    f0 = Float64(`UIntNative`(r1)); 
    f1 =                      1000.0;
    f2 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f0 = f0/f1;
    f0 = f2+f0;
    heapClassInst.heapFloat[(r2+2)] = Float32(f0);
    r1 = Int64(heapClassInst.heap32[(r2+4)]);
    if(r1 != 0) 
{
break 
}
else{
    r1 = Int64(heapClassInst.heap32[(r0)]);
}
}
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+5)]);
    heapClassInst.heap32[(r0)] = Int32(r1);
}
} while(false);
    return;
}

func _ZN16btCollisionWorld14debugDrawWorldEv(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var f0: Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-104);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r2)>>2](i7);
    r2 = commonVariable.r_g0;
do {
if(!(r2 == 0)) 
{
    r2 = Int64(heapClassInst.heap32[(r1)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r2)>>2](i7);
    r3 = commonVariable.r_g0 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+12)]);
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    __FUNCTION_TABLE__[(r3)>>2](i7);
    r2 = commonVariable.r_g0 & 8;
if(!(r2 == 0)) 
{
    r2 = Int64(heapClassInst.heap32[(r1+6)]);
    r3 = r2 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+9)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    __FUNCTION_TABLE__[(r3)>>2](i7);
    r2 = commonVariable.r_g0;
    r3 = sp + (-16);
    r4 = r3 >> 2;
    heapClassInst.heap32[(fp+(-4))] = 0;
    heapClassInst.heap32[(r4+1)] = 0;
    r5 = 0;
    heapClassInst.heap32[(r4+2)] = 0;
    heapClassInst.heap32[(r4+3)] = 0;
while(true){
    if(r5 < r2) 
{
    r4 = Int64(heapClassInst.heap32[(r1+6)]);
    r6 = r4 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6)]);
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6+10)]);
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0+1)] = Int32(r5);
    __FUNCTION_TABLE__[(r6)>>2](i7);
    r4 = commonVariable.r_g0;
    r6 = r4 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6+279)]);
    r7 = 36;
    r8 = 68;
    r9 = 0;
while(true){
    if(r9 < r6) 
{
    r10 = r4 >> 2;
    r10 = Int64(heapClassInst.heap32[(r10+279)]);
    if(r10 > r9) 
{
    r10 = (r9 * 69)|0;
    r11 = (r4 + r7)|0;
    r12 = (r4 + r8)|0;
    r13 = Int64(heapClassInst.heap32[(r1)]);
    r13 = r13 >> 2;
    r13 = Int64(heapClassInst.heap32[(r13+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r13)>>2](i7);
    r14 = commonVariable.r_g0 >> 2;
    r15 = r10 << 2;
    r10 = r10 << 2;
    r14 = Int64(heapClassInst.heap32[(r14)]);
    r15 = (r4 + r15)|0;
    r10 = (r4 + r10)|0;
    r14 = r14 >> 2;
    r15 = r15 >> 2;
    r10 = r10 >> 2;
    r14 = Int64(heapClassInst.heap32[(r14+8)]);
    r15 = Int64(heapClassInst.heap32[(r15+37)]);
    f0 = Float64(heapClassInst.heapFloat[(r10+21)]);
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r11);
    heapClassInst.heap32[(g0+2)] = Int32(r12);
    heapClassInst.heapFloat[(g0+3)] = Float32(f0);
    heapClassInst.heap32[(g0+4)] = Int32(r15);
    heapClassInst.heap32[(g0+5)] = Int32(r3);
    r9 = (r9 + 1)|0;
    r8 = (r8 + 276)|0;
    r7 = (r7 + 276)|0;
    __FUNCTION_TABLE__[(r14)>>2](i7);
}
else{
break 
}
}
else{
break 
}
}
    r5 = (r5 + 1)|0;
}
else{
break 
}
}
    r0 = _E2_str382;
    r1 = _E2_str483;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = 122;
    _assert(i7);
}
}
} while(false);
    r2 = Int64(heapClassInst.heap32[(r1)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r2)>>2](i7);
    r2 = commonVariable.r_g0;
do {
if(!(r2 == 0)) 
{
    r2 = Int64(heapClassInst.heap32[(r1)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r2)>>2](i7);
    r3 = commonVariable.r_g0 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+12)]);
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    __FUNCTION_TABLE__[(r3)>>2](i7);
    r2 = commonVariable.r_g0 & 3;
if(!(r2 == 0)) 
{
    r2 = Int64(heapClassInst.heap32[(r1+2)]);
    if(r2 > 0) 
{
    r2 = 0;
while(true){
    r3 = Int64(heapClassInst.heap32[(r1+4)]);
    r4 = r2 << 2;
    r3 = (r3 + r4)|0;
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r4 = Int64(heapClassInst.heapU8[r3+204]);
    r4 = r4 & 32;
if(!(r4 != 0)) 
{
    r4 = Int64(heapClassInst.heap32[(r1)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r4)>>2](i7);
    r4 = commonVariable.r_g0;
if(!(r4 == 0)) 
{
    r4 = Int64(heapClassInst.heap32[(r1)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r4)>>2](i7);
    r5 = commonVariable.r_g0 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5)]);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5+12)]);
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    __FUNCTION_TABLE__[(r5)>>2](i7);
    r4 = commonVariable.r_g0 & 1;
if(!(r4 == 0)) 
{
    r4 = sp + (-32);
    r5 = r4 >> 2;
    heapClassInst.heap32[(fp+(-8))] = 1065353216;
    heapClassInst.heap32[(r5+1)] = 1065353216;
    heapClassInst.heap32[(r5+2)] = 1065353216;
    r6 = r3 >> 2;
    heapClassInst.heap32[(r5+3)] = 0;
    r7 = Int64(heapClassInst.heap32[(r6+54)]);
do {
    if(r7 > 2) 
{
    if(r7 == 3) 
{
    heapClassInst.heap32[(fp+(-8))] = 0;
    heapClassInst.heap32[(r5+1)] = 1065353216;
    heapClassInst.heap32[(r5+2)] = 1065353216;
    heapClassInst.heap32[(r5+3)] = 0;
__label__ = 30;
break 
}
else{
    if(r7 == 4) 
{
    heapClassInst.heap32[(fp+(-8))] = 1065353216;
    heapClassInst.heap32[(r5+1)] = 0;
    heapClassInst.heap32[(r5+2)] = 0;
    heapClassInst.heap32[(r5+3)] = 0;
__label__ = 30;
break 
}
else{
    if(r7 == 5) 
{
    heapClassInst.heap32[(fp+(-8))] = 1065353216;
    heapClassInst.heap32[(r5+1)] = 1065353216;
    heapClassInst.heap32[(r5+2)] = 0;
    heapClassInst.heap32[(r5+3)] = 0;
__label__ = 30;
break 
}
else{
__label__ = 29;
break 
}
}
}
}
else{
    if(r7 == 1) 
{
    heapClassInst.heap32[(fp+(-8))] = 1065353216;
    heapClassInst.heap32[(r5+1)] = 1065353216;
    heapClassInst.heap32[(r5+2)] = 1065353216;
    heapClassInst.heap32[(r5+3)] = 0;
__label__ = 30;
}
else{
    if(r7 == 2) 
{
    heapClassInst.heap32[(fp+(-8))] = 0;
    heapClassInst.heap32[(r5+1)] = 1065353216;
    heapClassInst.heap32[(r5+2)] = 0;
    heapClassInst.heap32[(r5+3)] = 0;
__label__ = 30;
}
else{
__label__ = 29;
}
}
}
} while(false);
if (__label__ == 29){
    heapClassInst.heap32[(fp+(-8))] = 1065353216;
    heapClassInst.heap32[(r5+1)] = 0;
    heapClassInst.heap32[(r5+2)] = 0;
    heapClassInst.heap32[(r5+3)] = 0;
}
    r5 = Int64(heapClassInst.heap32[(r1)]);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5+6)]);
    r6 = Int64(heapClassInst.heap32[(r6+48)]);
    r7 = (r3 + 4)|0;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r7);
    heapClassInst.heap32[(g0+2)] = Int32(r6);
    heapClassInst.heap32[(g0+3)] = Int32(r4);
    __FUNCTION_TABLE__[(r5)>>2](i7);
}
}
    r4 = Int64(heapClassInst.heap32[(r1+21)]);
if(!(r4 == 0)) 
{
    r5 = r4 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5)]);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5+12)]);
    heapClassInst.heap32[(g0)] = Int32(r4);
    __FUNCTION_TABLE__[(r5)>>2](i7);
    r4 = commonVariable.r_g0 & 2;
if(!(r4 == 0)) 
{
    r4 = sp + (-80);
    r5 = r4 >> 2;
    heapClassInst.heap32[(fp+(-20))] = 1065353216;
    heapClassInst.heap32[(r5+1)] = 0;
    heapClassInst.heap32[(r5+2)] = 0;
    r6 = r3 >> 2;
    heapClassInst.heap32[(r5+3)] = 0;
    r5 = Int64(heapClassInst.heap32[(r6+48)]);
    r6 = r5 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6)]);
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6+2)]);
    r3 = (r3 + 4)|0;
    r7 = sp + (-48);
    r8 = sp + (-64);
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0+1)] = Int32(r3);
    heapClassInst.heap32[(g0+2)] = Int32(r7);
    heapClassInst.heap32[(g0+3)] = Int32(r8);
    __FUNCTION_TABLE__[(r6)>>2](i7);
    r3 = Int64(heapClassInst.heap32[(r1+21)]);
    r5 = r3 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5)]);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5+13)]);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r7);
    heapClassInst.heap32[(g0+2)] = Int32(r8);
    heapClassInst.heap32[(g0+3)] = Int32(r4);
    __FUNCTION_TABLE__[(r5)>>2](i7);
}
}
}
    r2 = (r2 + 1)|0;
    r3 = Int64(heapClassInst.heap32[(r1+2)]);
    if(r3 > r2) 
{
continue 
}
else{
break 
}
}
}
}
}
} while(false);
    return;
}

func _ZN16btCollisionWorld15debugDrawObjectERK11btTransformPK16btCollisionShapeRK9btVector3(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var f11: Float64 = 0.0
    var f12: Float64 = 0.0
    var f13: Float64 = 0.0
    var f14: Float64 = 0.0
    var f15: Float64 = 0.0
    var f16: Float64 = 0.0
    var f17: Float64 = 0.0
    var f18: Float64 = 0.0
    var f19: Float64 = 0.0
    var f20: Float64 = 0.0
    var f21: Float64 = 0.0
    var f22: Float64 = 0.0
    var f23: Float64 = 0.0
    var f24: Float64 = 0.0
    var f25: Float64 = 0.0
    var f26: Float64 = 0.0
    var f27: Float64 = 0.0
    var f28: Float64 = 0.0
    var f29: Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-1376);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r2)>>2](i7);
    r3 = commonVariable.r_g0 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+14)]);
    r4 = Int64(heapClassInst.heap32[(fp+1)]);
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r4);
    heapClassInst.heap32[(g0+2)] = 1065353216;
    r2 = Int64(heapClassInst.heap32[(fp+2)]);
    r5 = r2 >> 2;
    __FUNCTION_TABLE__[(r3)>>2](i7);
    r3 = Int64(heapClassInst.heap32[(r5+1)]);
    r6 = Int64(heapClassInst.heap32[(fp+3)]);
do {
    if(r3 > 10) 
{
    if(r3 > 27) 
{
    if(r3 == 28) 
{
    f0 = Float64(heapClassInst.heapFloat[(r5+14)]);
    f1 = Float64(heapClassInst.heapFloat[(r5+13)]);
    f2 = Float64(heapClassInst.heapFloat[(r5+16)]);
    f3 = Float64(heapClassInst.heapFloat[(r5+12)]);
    f4 = f0*f2;
    f5 = f1*f2;
    f2 = f3*f2;
    f6 =                         0.0;
    if(f0 < f6) 
{
    f7 = -f0;
}
else{
    f7 = f0;
}
    f8 =       0.70710676908493042;
    if(f7 <= f8) 
{
    f0 = f3*f3;
    f1 = f1*f1;
    f0 = f0+f1;
    heapClassInst.heapFloat[(g0)] = Float32(f0);
    sqrtf(i7);
    f3 =                         1.0;
    f7 = Float64(heapClassInst.heapFloat[(r5+13)]);
    f9 = Float64(heapClassInst.heapFloat[(r5+14)]);
    f10 = f3/commonVariable.f_g0;
    f1 = Float64(heapClassInst.heapFloat[(r5+12)]);
    f3 = -f7;
    f8 = f1*f10;
    f1 = -f9;
    f11 = f10*f3;
    f12 =                       100.0;
    f1 = f8*f1;
    f3 = f9*f11;
    f7 = f0*f10;
    f0 = f11*f12;
}
else{
    f1 = f1*f1;
    f3 = f0*f0;
    f1 = f1+f3;
    heapClassInst.heapFloat[(g0)] = Float32(f1);
    sqrtf(i7);
    f6 = Float64(heapClassInst.heapFloat[(r5+14)]);
    f0 =                         1.0;
    f7 = Float64(heapClassInst.heapFloat[(r5+12)]);
    f3 = f0/commonVariable.f_g0;
    f6 = -f6;
    f0 = Float64(heapClassInst.heapFloat[(r5+13)]);
    f8 = f3*f6;
    f6 = -f7;
    f0 = f0*f3;
    f9 =                       100.0;
    f1 = f1*f3;
    f3 = f0*f6;
    f7 = f7*f8;
    f6 = f0*f9;
    f0 =                         0.0;
}
    r2 = Int64(heapClassInst.heap32[(r1)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    f9 =                       100.0;
    __FUNCTION_TABLE__[(r2)>>2](i7);
    r3 = r4 >> 2;
    f8 = f8*f9;
    r4 = commonVariable.r_g0 >> 2;
    f10 = f2-f0;
    f11 = Float64(heapClassInst.heapFloat[(r3)]);
    f12 = f5-f8;
    f13 = Float64(heapClassInst.heapFloat[(r3+1)]);
    r4 = Int64(heapClassInst.heap32[(r4)]);
    f14 = Float64(heapClassInst.heapFloat[(r3+4)]);
    f15 = Float64(heapClassInst.heapFloat[(r3+5)]);
    f16 = f11*f10;
    f17 = f13*f12;
    f18 = f4-f6;
    f19 = Float64(heapClassInst.heapFloat[(r3+2)]);
    r4 = r4 >> 2;
    f20 = Float64(heapClassInst.heapFloat[(r3+8)]);
    f21 = Float64(heapClassInst.heapFloat[(r3+9)]);
    f22 = Float64(heapClassInst.heapFloat[(r3+6)]);
    f23 = f14*f10;
    f24 = f15*f12;
    f16 = f16+f17;
    f17 = f19*f18;
    f25 = Float64(heapClassInst.heapFloat[(r3+10)]);
    r4 = Int64(heapClassInst.heap32[(r4+2)]);
    f10 = f20*f10;
    f12 = f21*f12;
    f23 = f23+f24;
    f24 = f22*f18;
    f16 = f16+f17;
    f17 = Float64(heapClassInst.heapFloat[(r3+12)]);
    f26 = Float64(heapClassInst.heapFloat[(r3+14)]);
    f27 = Float64(heapClassInst.heapFloat[(r3+13)]);
    f0 = f2+f0;
    f8 = f5+f8;
    r5 = sp + (-64);
    f23 = f23+f24;
    f10 = f10+f12;
    f12 = f25*f18;
    f16 = f16+f17;
    f6 = f4+f6;
    f10 = f10+f12;
    f11 = f11*f0;
    f12 = f13*f8;
    r7 = r5 >> 2;
    f13 = f23+f27;
    heapClassInst.heapFloat[(fp+(-16))] = Float32(f16);
    f14 = f14*f0;
    f15 = f15*f8;
    f11 = f11+f12;
    f12 = f19*f6;
    f10 = f10+f26;
    heapClassInst.heapFloat[(r7+1)] = Float32(f13);
    f11 = f11+f12;
    heapClassInst.heapFloat[(r7+2)] = Float32(f10);
    f0 = f20*f0;
    f8 = f21*f8;
    f10 = f14+f15;
    f12 = f22*f6;
    r8 = sp + (-48);
    f10 = f10+f12;
    f0 = f0+f8;
    f6 = f25*f6;
    f8 = f11+f17;
    heapClassInst.heap32[(r7+3)] = 0;
    f0 = f0+f6;
    r7 = r8 >> 2;
    f6 = f10+f27;
    heapClassInst.heapFloat[(fp+(-12))] = Float32(f8);
    f0 = f0+f26;
    heapClassInst.heapFloat[(r7+1)] = Float32(f6);
    heapClassInst.heapFloat[(r7+2)] = Float32(f0);
    heapClassInst.heap32[(r7+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r8);
    heapClassInst.heap32[(g0+2)] = Int32(r5);
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    __FUNCTION_TABLE__[(r4)>>2](i7);
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r1)>>2](i7);
    f0 = f1*f9;
    f1 = f3*f9;
    f3 = f7*f9;
    r1 = commonVariable.r_g0 >> 2;
    f6 = f2-f0;
    f7 = Float64(heapClassInst.heapFloat[(r3)]);
    f8 = f5-f1;
    f9 = Float64(heapClassInst.heapFloat[(r3+1)]);
    r1 = Int64(heapClassInst.heap32[(r1)]);
    f10 = Float64(heapClassInst.heapFloat[(r3+4)]);
    f11 = Float64(heapClassInst.heapFloat[(r3+5)]);
    f12 = f7*f6;
    f13 = f9*f8;
    f14 = f4-f3;
    f15 = Float64(heapClassInst.heapFloat[(r3+2)]);
    r1 = r1 >> 2;
    f16 = Float64(heapClassInst.heapFloat[(r3+8)]);
    f17 = Float64(heapClassInst.heapFloat[(r3+9)]);
    f18 = Float64(heapClassInst.heapFloat[(r3+6)]);
    f19 = f10*f6;
    f20 = f11*f8;
    f12 = f12+f13;
    f13 = f15*f14;
    f21 = Float64(heapClassInst.heapFloat[(r3+10)]);
    r1 = Int64(heapClassInst.heap32[(r1+2)]);
    f6 = f16*f6;
    f8 = f17*f8;
    f19 = f19+f20;
    f20 = f18*f14;
    f12 = f12+f13;
    f13 = Float64(heapClassInst.heapFloat[(r3+12)]);
    f22 = Float64(heapClassInst.heapFloat[(r3+14)]);
    f23 = Float64(heapClassInst.heapFloat[(r3+13)]);
    f0 = f2+f0;
    f1 = f5+f1;
    r2 = sp + (-32);
    f2 = f19+f20;
    f5 = f6+f8;
    f6 = f21*f14;
    f8 = f12+f13;
    f3 = f4+f3;
    f4 = f5+f6;
    f5 = f7*f0;
    f6 = f9*f1;
    r3 = r2 >> 2;
    f2 = f2+f23;
    heapClassInst.heapFloat[(fp+(-8))] = Float32(f8);
    f7 = f10*f0;
    f8 = f11*f1;
    f5 = f5+f6;
    f6 = f15*f3;
    f4 = f4+f22;
    heapClassInst.heapFloat[(r3+1)] = Float32(f2);
    f2 = f5+f6;
    heapClassInst.heapFloat[(r3+2)] = Float32(f4);
    f0 = f16*f0;
    f1 = f17*f1;
    f4 = f7+f8;
    f5 = f18*f3;
    r4 = sp + (-16);
    f4 = f4+f5;
    f0 = f0+f1;
    f1 = f21*f3;
    f2 = f2+f13;
    heapClassInst.heap32[(r3+3)] = 0;
    f0 = f0+f1;
    r3 = r4 >> 2;
    f1 = f4+f23;
    heapClassInst.heapFloat[(fp+(-4))] = Float32(f2);
    f0 = f0+f22;
    heapClassInst.heapFloat[(r3+1)] = Float32(f1);
    heapClassInst.heapFloat[(r3+2)] = Float32(f0);
    heapClassInst.heap32[(r3+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r4);
__label__ = 30;
break 
}
else{
    if(r3 != 31) 
{
__label__ = 32;
break 
}
else{
    r2 = Int64(heapClassInst.heap32[(r5+4)]);
    r3 = (r2 + (-1))|0;
    if(r3 < 0) 
{
__label__ = 40;
break 
}
else{
    r3 = 1;
    r2 = (r3 - r2)|0;
while(true){
    r3 = r2;
    r2 = (r3 * ( -20))|0;
    r7 = Int64(heapClassInst.heap32[(r5+6)]);
    r2 = r2 << 2;
    r2 = (r7 + r2)|0;
    r2 = r2 >> 2;
    r7 = r4 >> 2;
    r8 = Int64(heapClassInst.heap32[(r1)]);
    f0 = Float64(heapClassInst.heapFloat[(r2)]);
    f1 = Float64(heapClassInst.heapFloat[(r7)]);
    f2 = Float64(heapClassInst.heapFloat[(r2+4)]);
    f3 = Float64(heapClassInst.heapFloat[(r7+1)]);
    r8 = r8 >> 2;
    f4 = Float64(heapClassInst.heapFloat[(r2+1)]);
    f5 = Float64(heapClassInst.heapFloat[(r2+5)]);
    f6 = f0*f1;
    f7 = f2*f3;
    f8 = Float64(heapClassInst.heapFloat[(r2+8)]);
    f9 = Float64(heapClassInst.heapFloat[(r7+2)]);
    f10 = Float64(heapClassInst.heapFloat[(r7+8)]);
    f11 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f12 = Float64(heapClassInst.heapFloat[(r7+4)]);
    f13 = Float64(heapClassInst.heapFloat[(r2+12)]);
    f14 = Float64(heapClassInst.heapFloat[(r7+9)]);
    f15 = Float64(heapClassInst.heapFloat[(r2+6)]);
    f16 = Float64(heapClassInst.heapFloat[(r7+5)]);
    f17 = Float64(heapClassInst.heapFloat[(r2+13)]);
    f18 = Float64(heapClassInst.heapFloat[(r2+9)]);
    f19 = Float64(heapClassInst.heapFloat[(r7+10)]);
    f20 = Float64(heapClassInst.heapFloat[(r2+10)]);
    f21 = Float64(heapClassInst.heapFloat[(r7+6)]);
    f22 = Float64(heapClassInst.heapFloat[(r2+14)]);
    r8 = Int64(heapClassInst.heap32[(r8+6)]);
    f23 = f4*f1;
    f24 = f5*f3;
    f6 = f6+f7;
    f7 = f8*f9;
    r2 = Int64(heapClassInst.heap32[(r2+16)]);
    f25 = Float64(heapClassInst.heapFloat[(r7+14)]);
    f26 = Float64(heapClassInst.heapFloat[(r7+13)]);
    f27 = Float64(heapClassInst.heapFloat[(r7+12)]);
    r7 = sp + (-688);
    f28 = f11*f1;
    f29 = f15*f3;
    f23 = f23+f24;
    f24 = f18*f9;
    f6 = f6+f7;
    r9 = r7 >> 2;
    f7 = f28+f29;
    f28 = f20*f9;
    f23 = f23+f24;
    heapClassInst.heapFloat[(fp+(-172))] = Float32(f6);
    f6 = f0*f12;
    f24 = f2*f16;
    f7 = f7+f28;
    heapClassInst.heapFloat[(r9+1)] = Float32(f23);
    heapClassInst.heapFloat[(r9+2)] = Float32(f7);
    f7 = f4*f12;
    f23 = f5*f16;
    f6 = f6+f24;
    f24 = f8*f21;
    f28 = f11*f12;
    f29 = f15*f16;
    f7 = f7+f23;
    f23 = f18*f21;
    f6 = f6+f24;
    heapClassInst.heap32[(r9+3)] = 0;
    f24 = f28+f29;
    f28 = f20*f21;
    f7 = f7+f23;
    heapClassInst.heapFloat[(r9+4)] = Float32(f6);
    f0 = f0*f10;
    f2 = f2*f14;
    f6 = f24+f28;
    heapClassInst.heapFloat[(r9+5)] = Float32(f7);
    heapClassInst.heapFloat[(r9+6)] = Float32(f6);
    f4 = f4*f10;
    f5 = f5*f14;
    f0 = f0+f2;
    f2 = f8*f19;
    f6 = f11*f10;
    f7 = f15*f14;
    f4 = f4+f5;
    f5 = f18*f19;
    f0 = f0+f2;
    heapClassInst.heap32[(r9+7)] = 0;
    f1 = f1*f13;
    f2 = f3*f17;
    f3 = f6+f7;
    f6 = f20*f19;
    f4 = f4+f5;
    heapClassInst.heapFloat[(r9+8)] = Float32(f0);
    f0 = f12*f13;
    f5 = f16*f17;
    f1 = f1+f2;
    f2 = f9*f22;
    f3 = f3+f6;
    heapClassInst.heapFloat[(r9+9)] = Float32(f4);
    f1 = f1+f2;
    heapClassInst.heapFloat[(r9+10)] = Float32(f3);
    f2 = f10*f13;
    f3 = f14*f17;
    f0 = f0+f5;
    f4 = f21*f22;
    f0 = f0+f4;
    f2 = f2+f3;
    f3 = f19*f22;
    f1 = f1+f27;
    heapClassInst.heap32[(r9+11)] = 0;
    f2 = f2+f3;
    f0 = f0+f26;
    heapClassInst.heapFloat[(r9+12)] = Float32(f1);
    f1 = f2+f25;
    heapClassInst.heapFloat[(r9+13)] = Float32(f0);
    heapClassInst.heapFloat[(r9+14)] = Float32(f1);
    heapClassInst.heap32[(r9+15)] = 0;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r7);
    heapClassInst.heap32[(g0+2)] = Int32(r2);
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    r2 = (r3 + 1)|0;
    __FUNCTION_TABLE__[(r8)>>2](i7);
    if(r3 == 0) 
{
__label__ = 40;
break 
}
else{
continue 
}
}
}
}
}
}
else{
    if(r3 == 11) 
{
    r2 = r4 >> 2;
    r3 = Int64(heapClassInst.heap32[(r5+17)]);
    f0 = Float64(heapClassInst.heapFloat[(r5+14)]);
    f1 = Float64(heapClassInst.heapFloat[(r5+15)]);
    f2 = Float64(heapClassInst.heapFloat[(r2+12)]);
    f3 = Float64(heapClassInst.heapFloat[(r2+13)]);
    f4 = Float64(heapClassInst.heapFloat[(r2+14)]);
    r4 = sp + (-880);
    r5 = r4 >> 2;
    heapClassInst.heap32[(fp+(-220))] = 0;
    heapClassInst.heap32[(r5+1)] = 0;
    r7 = r3 << 2;
    r4 = (r4 + r7)|0;
    f5 =                       0.5;
    heapClassInst.heap32[(r5+2)] = 0;
    r4 = r4 >> 2;
    f1 = f1*f5;
    heapClassInst.heap32[(r5+3)] = 0;
    r8 = sp + (-896);
    heapClassInst.heapFloat[(r4)] = Float32(f1);
    r4 = (r3 + 1)|0;
    r4 = (r4 % 3)|0;
    r9 = r8 >> 2;
    heapClassInst.heap32[(fp+(-224))] = 0;
    heapClassInst.heap32[(r9+1)] = 0;
    r4 = r4 << 2;
    r8 = (r8 + r4)|0;
    heapClassInst.heap32[(r9+2)] = 0;
    r8 = r8 >> 2;
    heapClassInst.heap32[(r9+3)] = 0;
    r3 = (r3 + 2)|0;
    r10 = sp + (-912);
    heapClassInst.heapFloat[(r8)] = Float32(f0);
    r3 = (r3 % 3)|0;
    r8 = r10 >> 2;
    heapClassInst.heap32[(fp+(-228))] = 0;
    r3 = r3 << 2;
    heapClassInst.heap32[(r8+1)] = 0;
    r3 = (r10 + r3)|0;
    heapClassInst.heap32[(r8+2)] = 0;
    r3 = r3 >> 2;
    heapClassInst.heap32[(r8+3)] = 0;
    heapClassInst.heapFloat[(r3)] = Float32(f0);
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r3)>>2](i7);
    f1 = Float64(heapClassInst.heapFloat[(r5+1)]);
    f5 = Float64(heapClassInst.heapFloat[(fp+(-220))]);
    f6 = Float64(heapClassInst.heapFloat[(r9+1)]);
    f7 = Float64(heapClassInst.heapFloat[(fp+(-224))]);
    r10 = commonVariable.r_g0 >> 2;
    f8 = Float64(heapClassInst.heapFloat[(r5+2)]);
    f9 = Float64(heapClassInst.heapFloat[(r9+2)]);
    f10 = Float64(heapClassInst.heapFloat[(r2)]);
    f11 = f7-f5;
    f12 = Float64(heapClassInst.heapFloat[(r2+1)]);
    f13 = f6-f1;
    f14 = Float64(heapClassInst.heapFloat[(r2+4)]);
    f15 = Float64(heapClassInst.heapFloat[(r2+5)]);
    r5 = Int64(heapClassInst.heap32[(r10)]);
    f16 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f17 = f9-f8;
    f18 = f10*f11;
    f19 = f12*f13;
    f20 = Float64(heapClassInst.heapFloat[(r2+8)]);
    f21 = Float64(heapClassInst.heapFloat[(r2+9)]);
    f22 = Float64(heapClassInst.heapFloat[(r2+6)]);
    r5 = r5 >> 2;
    f23 = f14*f11;
    f24 = f15*f13;
    f18 = f18+f19;
    f19 = f16*f17;
    f25 = Float64(heapClassInst.heapFloat[(r2+10)]);
    r5 = Int64(heapClassInst.heap32[(r5+2)]);
    f18 = f18+f19;
    f11 = f20*f11;
    f13 = f21*f13;
    f19 = f23+f24;
    f23 = f22*f17;
    r9 = sp + (-416);
    f19 = f19+f23;
    f11 = f11+f13;
    f13 = f25*f17;
    f17 = f2+f18;
    f11 = f11+f13;
    f10 = f10*f5;
    f12 = f12*f1;
    r10 = r9 >> 2;
    f13 = f3+f19;
    heapClassInst.heapFloat[(fp+(-104))] = Float32(f17);
    f14 = f14*f5;
    f15 = f15*f1;
    f10 = f10+f12;
    f12 = f16*f8;
    f11 = f4+f11;
    heapClassInst.heapFloat[(r10+1)] = Float32(f13);
    f10 = f10+f12;
    heapClassInst.heapFloat[(r10+2)] = Float32(f11);
    f11 = f20*f5;
    f12 = f21*f1;
    f13 = f14+f15;
    f14 = f22*f8;
    r11 = sp + (-400);
    f13 = f13+f14;
    f11 = f11+f12;
    f12 = f25*f8;
    f10 = f2+f10;
    heapClassInst.heap32[(r10+3)] = 0;
    f11 = f11+f12;
    r10 = r11 >> 2;
    f12 = f3+f13;
    heapClassInst.heapFloat[(fp+(-100))] = Float32(f10);
    f10 = f4+f11;
    heapClassInst.heapFloat[(r10+1)] = Float32(f12);
    heapClassInst.heapFloat[(r10+2)] = Float32(f10);
    heapClassInst.heap32[(r10+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r11);
    heapClassInst.heap32[(g0+2)] = Int32(r9);
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    __FUNCTION_TABLE__[(r5)>>2](i7);
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r3)>>2](i7);
    f10 = -f5;
    f11 = -f1;
    f12 = -f8;
    r5 = commonVariable.r_g0 >> 2;
    f13 = Float64(heapClassInst.heapFloat[(r2)]);
    f7 = f10-f7;
    f14 = Float64(heapClassInst.heapFloat[(r2+1)]);
    f6 = f11-f6;
    f15 = Float64(heapClassInst.heapFloat[(r2+4)]);
    f16 = Float64(heapClassInst.heapFloat[(r2+5)]);
    r5 = Int64(heapClassInst.heap32[(r5)]);
    f17 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f9 = f12-f9;
    f18 = f13*f7;
    f19 = f14*f6;
    f20 = Float64(heapClassInst.heapFloat[(r2+8)]);
    f21 = Float64(heapClassInst.heapFloat[(r2+9)]);
    f22 = Float64(heapClassInst.heapFloat[(r2+6)]);
    r5 = r5 >> 2;
    f23 = f15*f7;
    f24 = f16*f6;
    f18 = f18+f19;
    f19 = f17*f9;
    f25 = Float64(heapClassInst.heapFloat[(r2+10)]);
    r5 = Int64(heapClassInst.heap32[(r5+2)]);
    f18 = f18+f19;
    f7 = f20*f7;
    f6 = f21*f6;
    f19 = f23+f24;
    f23 = f22*f9;
    r9 = sp + (-384);
    f19 = f19+f23;
    f6 = f7+f6;
    f7 = f25*f9;
    f9 = f2+f18;
    f6 = f6+f7;
    f7 = f13*f5;
    f13 = f14*f1;
    r10 = r9 >> 2;
    f14 = f3+f19;
    heapClassInst.heapFloat[(fp+(-96))] = Float32(f9);
    f9 = f15*f5;
    f15 = f16*f1;
    f7 = f7+f13;
    f13 = f17*f8;
    f6 = f4+f6;
    heapClassInst.heapFloat[(r10+1)] = Float32(f14);
    f7 = f7+f13;
    heapClassInst.heapFloat[(r10+2)] = Float32(f6);
    f6 = f20*f5;
    f13 = f21*f1;
    f9 = f9+f15;
    f14 = f22*f8;
    r11 = sp + (-368);
    f9 = f9+f14;
    f6 = f6+f13;
    f13 = f25*f8;
    f7 = f2+f7;
    heapClassInst.heap32[(r10+3)] = 0;
    f6 = f6+f13;
    r10 = r11 >> 2;
    f9 = f3+f9;
    heapClassInst.heapFloat[(fp+(-92))] = Float32(f7);
    f6 = f4+f6;
    heapClassInst.heapFloat[(r10+1)] = Float32(f9);
    heapClassInst.heapFloat[(r10+2)] = Float32(f6);
    heapClassInst.heap32[(r10+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r11);
    heapClassInst.heap32[(g0+2)] = Int32(r9);
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    __FUNCTION_TABLE__[(r5)>>2](i7);
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r3)>>2](i7);
    f6 = Float64(heapClassInst.heapFloat[(r8+1)]);
    f7 = Float64(heapClassInst.heapFloat[(fp+(-228))]);
    f9 = Float64(heapClassInst.heapFloat[(r8+2)]);
    r5 = commonVariable.r_g0 >> 2;
    f13 = Float64(heapClassInst.heapFloat[(r2)]);
    f14 = f7-f5;
    f15 = Float64(heapClassInst.heapFloat[(r2+1)]);
    f16 = f6-f1;
    f17 = Float64(heapClassInst.heapFloat[(r2+4)]);
    f18 = Float64(heapClassInst.heapFloat[(r2+5)]);
    r5 = Int64(heapClassInst.heap32[(r5)]);
    f19 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f20 = f9-f8;
    f21 = f13*f14;
    f22 = f15*f16;
    f23 = Float64(heapClassInst.heapFloat[(r2+8)]);
    f24 = Float64(heapClassInst.heapFloat[(r2+9)]);
    f25 = Float64(heapClassInst.heapFloat[(r2+6)]);
    r5 = r5 >> 2;
    f26 = f17*f14;
    f27 = f18*f16;
    f21 = f21+f22;
    f22 = f19*f20;
    f28 = Float64(heapClassInst.heapFloat[(r2+10)]);
    r5 = Int64(heapClassInst.heap32[(r5+2)]);
    f21 = f21+f22;
    f14 = f23*f14;
    f16 = f24*f16;
    f22 = f26+f27;
    f26 = f25*f20;
    r8 = sp + (-352);
    f22 = f22+f26;
    f14 = f14+f16;
    f16 = f28*f20;
    f20 = f2+f21;
    f14 = f14+f16;
    f13 = f13*f5;
    f15 = f15*f1;
    r9 = r8 >> 2;
    f16 = f3+f22;
    heapClassInst.heapFloat[(fp+(-88))] = Float32(f20);
    f17 = f17*f5;
    f18 = f18*f1;
    f13 = f13+f15;
    f15 = f19*f8;
    f14 = f4+f14;
    heapClassInst.heapFloat[(r9+1)] = Float32(f16);
    f13 = f13+f15;
    heapClassInst.heapFloat[(r9+2)] = Float32(f14);
    f14 = f23*f5;
    f15 = f24*f1;
    f16 = f17+f18;
    f17 = f25*f8;
    r10 = sp + (-336);
    f16 = f16+f17;
    f14 = f14+f15;
    f15 = f28*f8;
    f13 = f2+f13;
    heapClassInst.heap32[(r9+3)] = 0;
    f14 = f14+f15;
    r9 = r10 >> 2;
    f15 = f3+f16;
    heapClassInst.heapFloat[(fp+(-84))] = Float32(f13);
    f13 = f4+f14;
    heapClassInst.heapFloat[(r9+1)] = Float32(f15);
    heapClassInst.heapFloat[(r9+2)] = Float32(f13);
    heapClassInst.heap32[(r9+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r10);
    heapClassInst.heap32[(g0+2)] = Int32(r8);
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    __FUNCTION_TABLE__[(r5)>>2](i7);
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r3)>>2](i7);
    r5 = commonVariable.r_g0 >> 2;
    f13 = Float64(heapClassInst.heapFloat[(r2)]);
    f7 = f10-f7;
    f10 = Float64(heapClassInst.heapFloat[(r2+1)]);
    f6 = f11-f6;
    f11 = Float64(heapClassInst.heapFloat[(r2+4)]);
    f14 = Float64(heapClassInst.heapFloat[(r2+5)]);
    r5 = Int64(heapClassInst.heap32[(r5)]);
    f15 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f9 = f12-f9;
    f12 = f13*f7;
    f16 = f10*f6;
    f17 = Float64(heapClassInst.heapFloat[(r2+8)]);
    f18 = Float64(heapClassInst.heapFloat[(r2+9)]);
    f19 = Float64(heapClassInst.heapFloat[(r2+6)]);
    r5 = r5 >> 2;
    f20 = f11*f7;
    f21 = f14*f6;
    f12 = f12+f16;
    f16 = f15*f9;
    f22 = Float64(heapClassInst.heapFloat[(r2+10)]);
    r5 = Int64(heapClassInst.heap32[(r5+2)]);
    f12 = f12+f16;
    f7 = f17*f7;
    f6 = f18*f6;
    f16 = f20+f21;
    f20 = f19*f9;
    r8 = sp + (-320);
    f16 = f16+f20;
    f6 = f7+f6;
    f7 = f22*f9;
    f9 = f2+f12;
    f6 = f6+f7;
    f7 = f13*f5;
    f10 = f10*f1;
    r9 = r8 >> 2;
    f12 = f3+f16;
    heapClassInst.heapFloat[(fp+(-80))] = Float32(f9);
    f9 = f11*f5;
    f11 = f14*f1;
    f7 = f7+f10;
    f10 = f15*f8;
    f6 = f4+f6;
    heapClassInst.heapFloat[(r9+1)] = Float32(f12);
    f7 = f7+f10;
    heapClassInst.heapFloat[(r9+2)] = Float32(f6);
    f6 = f17*f5;
    f10 = f18*f1;
    f9 = f9+f11;
    f11 = f19*f8;
    r10 = sp + (-304);
    f9 = f9+f11;
    f6 = f6+f10;
    f10 = f22*f8;
    f7 = f2+f7;
    heapClassInst.heap32[(r9+3)] = 0;
    f6 = f6+f10;
    r9 = r10 >> 2;
    f9 = f3+f9;
    heapClassInst.heapFloat[(fp+(-76))] = Float32(f7);
    f6 = f4+f6;
    heapClassInst.heapFloat[(r9+1)] = Float32(f9);
    heapClassInst.heapFloat[(r9+2)] = Float32(f6);
    heapClassInst.heap32[(r9+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r10);
    heapClassInst.heap32[(g0+2)] = Int32(r8);
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    r3 = sp + (-928);
    __FUNCTION_TABLE__[(r5)>>2](i7);
    r5 = r3 >> 2;
    heapClassInst.heap32[(fp+(-232))] = 0;
    heapClassInst.heap32[(r5+1)] = 0;
    r3 = (r3 + r7)|0;
    heapClassInst.heap32[(r5+2)] = 0;
    r3 = r3 >> 2;
    heapClassInst.heap32[(r5+3)] = 0;
    r7 = sp + (-944);
    heapClassInst.heap32[(r3)] = 1065353216;
    r3 = r7 >> 2;
    heapClassInst.heap32[(fp+(-236))] = 0;
    heapClassInst.heap32[(r3+1)] = 0;
    r4 = (r7 + r4)|0;
    heapClassInst.heap32[(r3+2)] = 0;
    r4 = r4 >> 2;
    heapClassInst.heap32[(r3+3)] = 0;
    heapClassInst.heap32[(r4)] = 1065353216;
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r1)>>2](i7);
    r1 = commonVariable.r_g0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1)]);
    f6 = Float64(heapClassInst.heapFloat[(r2)]);
    f7 = Float64(heapClassInst.heapFloat[(fp+(-236))]);
    f9 = Float64(heapClassInst.heapFloat[(r2+1)]);
    f10 = Float64(heapClassInst.heapFloat[(r3+1)]);
    f11 = Float64(heapClassInst.heapFloat[(r2+4)]);
    f12 = Float64(heapClassInst.heapFloat[(r2+5)]);
    r1 = r1 >> 2;
    f13 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f14 = Float64(heapClassInst.heapFloat[(r3+2)]);
    f15 = f6*f7;
    f16 = f9*f10;
    f17 = Float64(heapClassInst.heapFloat[(r2+8)]);
    f18 = Float64(heapClassInst.heapFloat[(r2+9)]);
    f19 = Float64(heapClassInst.heapFloat[(r2+10)]);
    f20 = Float64(heapClassInst.heapFloat[(r2+6)]);
    r1 = Int64(heapClassInst.heap32[(r1+15)]);
    f21 = f11*f7;
    f22 = f12*f10;
    f15 = f15+f16;
    f16 = f13*f14;
    r2 = sp + (-288);
    f7 = f17*f7;
    f10 = f18*f10;
    f21 = f21+f22;
    f22 = f20*f14;
    f15 = f15+f16;
    r3 = r2 >> 2;
    f7 = f7+f10;
    f10 = f19*f14;
    f14 = f21+f22;
    heapClassInst.heapFloat[(fp+(-72))] = Float32(f15);
    f7 = f7+f10;
    heapClassInst.heapFloat[(r3+1)] = Float32(f14);
    heapClassInst.heapFloat[(r3+2)] = Float32(f7);
    heapClassInst.heap32[(r3+3)] = 0;
    f7 = Float64(heapClassInst.heapFloat[(fp+(-232))]);
    f10 = Float64(heapClassInst.heapFloat[(r5+1)]);
    f14 = Float64(heapClassInst.heapFloat[(r5+2)]);
    f15 = f6*f7;
    f16 = f9*f10;
    f21 = f11*f7;
    f22 = f12*f10;
    f15 = f15+f16;
    f16 = f13*f14;
    r3 = sp + (-272);
    f7 = f17*f7;
    f10 = f18*f10;
    f21 = f21+f22;
    f22 = f20*f14;
    f15 = f15+f16;
    f6 = f6*f5;
    f9 = f9*f1;
    r4 = r3 >> 2;
    f7 = f7+f10;
    f10 = f19*f14;
    f14 = f21+f22;
    heapClassInst.heapFloat[(fp+(-68))] = Float32(f15);
    f11 = f11*f5;
    f12 = f12*f1;
    f6 = f6+f9;
    f9 = f13*f8;
    f7 = f7+f10;
    heapClassInst.heapFloat[(r4+1)] = Float32(f14);
    f6 = f6+f9;
    heapClassInst.heapFloat[(r4+2)] = Float32(f7);
    f5 = f17*f5;
    f1 = f18*f1;
    f7 = f11+f12;
    f9 = f20*f8;
    r5 = sp + (-256);
    f7 = f7+f9;
    f1 = f5+f1;
    f5 = f19*f8;
    f2 = f2-f6;
    heapClassInst.heap32[(r4+3)] = 0;
    f1 = f1+f5;
    r4 = r5 >> 2;
    f3 = f3-f7;
    heapClassInst.heapFloat[(fp+(-64))] = Float32(f2);
    f1 = f4-f1;
    heapClassInst.heapFloat[(r4+1)] = Float32(f3);
    heapClassInst.heapFloat[(r4+2)] = Float32(f1);
    heapClassInst.heap32[(r4+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r5);
    heapClassInst.heap32[(g0+2)] = Int32(r3);
}
else{
    if(r3 == 13) 
{
    r3 = Int64(heapClassInst.heap32[(r5)]);
    r3 = r3 >> 2;
    r7 = Int64(heapClassInst.heap32[(r5+13)]);
    r3 = Int64(heapClassInst.heap32[(r3+21)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    __FUNCTION_TABLE__[(r3)>>2](i7);
    f0 = commonVariable.f_g0;
    r3 = sp + (-240);
    f1 = Float64(heapClassInst.heapFloat[(r5+8)]);
    f2 = Float64(heapClassInst.heapFloat[(r5+9)]);
    f3 = Float64(heapClassInst.heapFloat[(r5+7)]);
    r8 = r3 >> 2;
    heapClassInst.heap32[(r8+3)] = heapClassInst.heap32[(r5+10)];
    r9 = Int64(heapClassInst.heap32[(r5)]);
    r9 = r9 >> 2;
    r9 = Int64(heapClassInst.heap32[(r9+11)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    __FUNCTION_TABLE__[(r9)>>2](i7);
    f4 = commonVariable.f_g0;
    r9 = Int64(heapClassInst.heap32[(r5)]);
    r9 = r9 >> 2;
    r9 = Int64(heapClassInst.heap32[(r9+11)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    __FUNCTION_TABLE__[(r9)>>2](i7);
    f5 = commonVariable.f_g0;
    r5 = Int64(heapClassInst.heap32[(r5)]);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5+11)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    __FUNCTION_TABLE__[(r5)>>2](i7);
    f3 = f3+commonVariable.f_g0;
    r2 = r7 << 2;
    f1 = f1+f5;
    heapClassInst.heapFloat[(fp+(-60))] = Float32(f3);
    r3 = (r3 + r2)|0;
    f2 = f2+f4;
    heapClassInst.heapFloat[(r8+1)] = Float32(f1);
    r3 = r3 >> 2;
    heapClassInst.heapFloat[(r8+2)] = Float32(f2);
    r4 = r4 >> 2;
    f1 = Float64(heapClassInst.heapFloat[(r3)]);
    f2 = Float64(heapClassInst.heapFloat[(r4+12)]);
    f3 = Float64(heapClassInst.heapFloat[(r4+13)]);
    f4 = Float64(heapClassInst.heapFloat[(r4+14)]);
    r3 = sp + (-960);
    r5 = r3 >> 2;
    heapClassInst.heap32[(fp+(-240))] = 0;
    heapClassInst.heap32[(r5+1)] = 0;
    r3 = (r3 + r2)|0;
    heapClassInst.heap32[(r5+2)] = 0;
    r3 = r3 >> 2;
    heapClassInst.heap32[(r5+3)] = 0;
    r8 = sp + (-976);
    heapClassInst.heapFloat[(r3)] = Float32(f1);
    r3 = (r7 + 1)|0;
    r3 = (r3 % 3)|0;
    r7 = r8 >> 2;
    heapClassInst.heap32[(fp+(-244))] = 0;
    heapClassInst.heap32[(r7+1)] = 0;
    r3 = r3 << 2;
    r8 = (r8 + r3)|0;
    heapClassInst.heap32[(r7+2)] = 0;
    r8 = r8 >> 2;
    heapClassInst.heap32[(r7+3)] = 0;
    heapClassInst.heapFloat[(r8)] = Float32(f0);
    r8 = Int64(heapClassInst.heap32[(r1)]);
    r8 = r8 >> 2;
    r8 = Int64(heapClassInst.heap32[(r8+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r8)>>2](i7);
    f1 = Float64(heapClassInst.heapFloat[(r5+1)]);
    f5 = Float64(heapClassInst.heapFloat[(r7+1)]);
    f6 = Float64(heapClassInst.heapFloat[(fp+(-240))]);
    f7 = Float64(heapClassInst.heapFloat[(fp+(-244))]);
    r9 = commonVariable.r_g0 >> 2;
    f8 = Float64(heapClassInst.heapFloat[(r5+2)]);
    f9 = Float64(heapClassInst.heapFloat[(r7+2)]);
    f10 = f7-f6;
    f11 = Float64(heapClassInst.heapFloat[(r4)]);
    f12 = f5-f1;
    f13 = Float64(heapClassInst.heapFloat[(r4+1)]);
    r5 = Int64(heapClassInst.heap32[(r9)]);
    f14 = Float64(heapClassInst.heapFloat[(r4+4)]);
    f15 = Float64(heapClassInst.heapFloat[(r4+5)]);
    f16 = f11*f10;
    f17 = f13*f12;
    f18 = f9-f8;
    f19 = Float64(heapClassInst.heapFloat[(r4+2)]);
    r5 = r5 >> 2;
    f20 = Float64(heapClassInst.heapFloat[(r4+8)]);
    f21 = Float64(heapClassInst.heapFloat[(r4+9)]);
    f22 = Float64(heapClassInst.heapFloat[(r4+6)]);
    f23 = f14*f10;
    f24 = f15*f12;
    f16 = f16+f17;
    f17 = f19*f18;
    f16 = f16+f17;
    f17 = Float64(heapClassInst.heapFloat[(r4+10)]);
    r5 = Int64(heapClassInst.heap32[(r5+2)]);
    f10 = f20*f10;
    f12 = f21*f12;
    f23 = f23+f24;
    f24 = f22*f18;
    f25 = f6+f7;
    f26 = f1+f5;
    r7 = sp + (-224);
    f23 = f23+f24;
    f10 = f10+f12;
    f12 = f17*f18;
    f16 = f2+f16;
    f18 = f8+f9;
    f10 = f10+f12;
    f11 = f11*f25;
    f12 = f13*f26;
    r9 = r7 >> 2;
    f13 = f3+f23;
    heapClassInst.heapFloat[(fp+(-56))] = Float32(f16);
    f14 = f14*f25;
    f15 = f15*f26;
    f11 = f11+f12;
    f12 = f19*f18;
    f10 = f4+f10;
    heapClassInst.heapFloat[(r9+1)] = Float32(f13);
    f11 = f11+f12;
    heapClassInst.heapFloat[(r9+2)] = Float32(f10);
    f10 = f20*f25;
    f12 = f21*f26;
    f13 = f14+f15;
    f14 = f22*f18;
    r10 = sp + (-208);
    f13 = f13+f14;
    f10 = f10+f12;
    f12 = f17*f18;
    f11 = f2+f11;
    heapClassInst.heap32[(r9+3)] = 0;
    f10 = f10+f12;
    r9 = r10 >> 2;
    f12 = f3+f13;
    heapClassInst.heapFloat[(fp+(-52))] = Float32(f11);
    f10 = f4+f10;
    heapClassInst.heapFloat[(r9+1)] = Float32(f12);
    heapClassInst.heapFloat[(r9+2)] = Float32(f10);
    heapClassInst.heap32[(r9+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r10);
    heapClassInst.heap32[(g0+2)] = Int32(r7);
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    __FUNCTION_TABLE__[(r5)>>2](i7);
    r5 = Int64(heapClassInst.heap32[(r1)]);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r5)>>2](i7);
    f10 = -f6;
    f11 = -f1;
    f12 = -f8;
    r7 = commonVariable.r_g0 >> 2;
    f10 = f10-f7;
    f13 = Float64(heapClassInst.heapFloat[(r4)]);
    f11 = f11-f5;
    f14 = Float64(heapClassInst.heapFloat[(r4+1)]);
    r7 = Int64(heapClassInst.heap32[(r7)]);
    f15 = Float64(heapClassInst.heapFloat[(r4+4)]);
    f16 = Float64(heapClassInst.heapFloat[(r4+5)]);
    f17 = f13*f10;
    f18 = f14*f11;
    f12 = f12-f9;
    f19 = Float64(heapClassInst.heapFloat[(r4+2)]);
    r7 = r7 >> 2;
    f20 = Float64(heapClassInst.heapFloat[(r4+8)]);
    f21 = Float64(heapClassInst.heapFloat[(r4+9)]);
    f22 = Float64(heapClassInst.heapFloat[(r4+6)]);
    f23 = f15*f10;
    f24 = f16*f11;
    f17 = f17+f18;
    f18 = f19*f12;
    f17 = f17+f18;
    f18 = Float64(heapClassInst.heapFloat[(r4+10)]);
    r7 = Int64(heapClassInst.heap32[(r7+2)]);
    f10 = f20*f10;
    f11 = f21*f11;
    f23 = f23+f24;
    f24 = f22*f12;
    f7 = f6-f7;
    f5 = f1-f5;
    r8 = sp + (-192);
    f23 = f23+f24;
    f10 = f10+f11;
    f11 = f18*f12;
    f12 = f2+f17;
    f9 = f8-f9;
    f10 = f10+f11;
    f11 = f13*f7;
    f13 = f14*f5;
    r9 = r8 >> 2;
    f14 = f3+f23;
    heapClassInst.heapFloat[(fp+(-48))] = Float32(f12);
    f12 = f15*f7;
    f15 = f16*f5;
    f11 = f11+f13;
    f13 = f19*f9;
    f10 = f4+f10;
    heapClassInst.heapFloat[(r9+1)] = Float32(f14);
    f11 = f11+f13;
    heapClassInst.heapFloat[(r9+2)] = Float32(f10);
    f7 = f20*f7;
    f5 = f21*f5;
    f10 = f12+f15;
    f12 = f22*f9;
    r10 = sp + (-176);
    f10 = f10+f12;
    f5 = f7+f5;
    f7 = f18*f9;
    f9 = f2+f11;
    heapClassInst.heap32[(r9+3)] = 0;
    f5 = f5+f7;
    r9 = r10 >> 2;
    f7 = f3+f10;
    heapClassInst.heapFloat[(fp+(-44))] = Float32(f9);
    f5 = f4+f5;
    heapClassInst.heapFloat[(r9+1)] = Float32(f7);
    heapClassInst.heapFloat[(r9+2)] = Float32(f5);
    heapClassInst.heap32[(r9+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r10);
    heapClassInst.heap32[(g0+2)] = Int32(r8);
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    r5 = sp + (-992);
    __FUNCTION_TABLE__[(r7)>>2](i7);
    r7 = r5 >> 2;
    heapClassInst.heap32[(fp+(-248))] = 0;
    heapClassInst.heap32[(r7+1)] = 0;
    r2 = (r5 + r2)|0;
    heapClassInst.heap32[(r7+2)] = 0;
    r2 = r2 >> 2;
    heapClassInst.heap32[(r7+3)] = 0;
    r5 = sp + (-1008);
    heapClassInst.heap32[(r2)] = 1065353216;
    r2 = r5 >> 2;
    heapClassInst.heap32[(fp+(-252))] = 0;
    heapClassInst.heap32[(r2+1)] = 0;
    r3 = (r5 + r3)|0;
    heapClassInst.heap32[(r2+2)] = 0;
    r3 = r3 >> 2;
    heapClassInst.heap32[(r2+3)] = 0;
    heapClassInst.heap32[(r3)] = 1065353216;
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r3)>>2](i7);
    r5 = commonVariable.r_g0 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5)]);
    f5 = Float64(heapClassInst.heapFloat[(r4)]);
    f7 = Float64(heapClassInst.heapFloat[(fp+(-252))]);
    f9 = Float64(heapClassInst.heapFloat[(r4+1)]);
    f10 = Float64(heapClassInst.heapFloat[(r2+1)]);
    f11 = Float64(heapClassInst.heapFloat[(r4+4)]);
    f12 = Float64(heapClassInst.heapFloat[(r4+5)]);
    r5 = r5 >> 2;
    f13 = Float64(heapClassInst.heapFloat[(r4+2)]);
    f14 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f15 = f5*f7;
    f16 = f9*f10;
    f17 = Float64(heapClassInst.heapFloat[(r4+8)]);
    f18 = Float64(heapClassInst.heapFloat[(r4+9)]);
    f19 = Float64(heapClassInst.heapFloat[(r4+10)]);
    f20 = Float64(heapClassInst.heapFloat[(r4+6)]);
    r2 = Int64(heapClassInst.heap32[(r5+15)]);
    f21 = f11*f7;
    f22 = f12*f10;
    f15 = f15+f16;
    f16 = f13*f14;
    r5 = sp + (-160);
    f23 = f17*f7;
    f24 = f18*f10;
    f21 = f21+f22;
    f22 = f20*f14;
    f15 = f15+f16;
    r8 = r5 >> 2;
    f16 = f23+f24;
    f23 = f19*f14;
    f21 = f21+f22;
    heapClassInst.heapFloat[(fp+(-40))] = Float32(f15);
    f15 = f16+f23;
    heapClassInst.heapFloat[(r8+1)] = Float32(f21);
    heapClassInst.heapFloat[(r8+2)] = Float32(f15);
    heapClassInst.heap32[(r8+3)] = 0;
    f15 = Float64(heapClassInst.heapFloat[(fp+(-248))]);
    f16 = Float64(heapClassInst.heapFloat[(r7+1)]);
    f21 = Float64(heapClassInst.heapFloat[(r7+2)]);
    f22 = f5*f15;
    f23 = f9*f16;
    f24 = f11*f15;
    f25 = f12*f16;
    f22 = f22+f23;
    f23 = f13*f21;
    r7 = sp + (-144);
    f26 = f17*f15;
    f27 = f18*f16;
    f24 = f24+f25;
    f25 = f20*f21;
    f22 = f22+f23;
    f5 = f5*f6;
    f9 = f9*f1;
    r8 = r7 >> 2;
    f23 = f26+f27;
    f26 = f19*f21;
    f24 = f24+f25;
    heapClassInst.heapFloat[(fp+(-36))] = Float32(f22);
    f11 = f11*f6;
    f12 = f12*f1;
    f5 = f5+f9;
    f9 = f13*f8;
    f13 = f23+f26;
    heapClassInst.heapFloat[(r8+1)] = Float32(f24);
    f5 = f5+f9;
    heapClassInst.heapFloat[(r8+2)] = Float32(f13);
    f9 = f17*f6;
    f13 = f18*f1;
    f11 = f11+f12;
    f12 = f20*f8;
    r9 = sp + (-128);
    f11 = f11+f12;
    f9 = f9+f13;
    f12 = f19*f8;
    f5 = f2-f5;
    heapClassInst.heap32[(r8+3)] = 0;
    f9 = f9+f12;
    r8 = r9 >> 2;
    f11 = f3-f11;
    heapClassInst.heapFloat[(fp+(-32))] = Float32(f5);
    f5 = f4-f9;
    heapClassInst.heapFloat[(r8+1)] = Float32(f11);
    heapClassInst.heapFloat[(r8+2)] = Float32(f5);
    heapClassInst.heap32[(r8+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r9);
    heapClassInst.heap32[(g0+2)] = Int32(r7);
    heapClassInst.heap32[(g0+3)] = Int32(r5);
    heapClassInst.heapFloat[(g0+4)] = Float32(f0);
    heapClassInst.heapFloat[(g0+5)] = Float32(f0);
    heapClassInst.heap32[(g0+6)] = 0;
    heapClassInst.heap32[(g0+7)] = 1086918619;
    heapClassInst.heap32[(g0+8)] = Int32(r6);
    heapClassInst.heap32[(g0+9)] = 0;
    heapClassInst.heap32[(g0+10)] = 1092616192;
    __FUNCTION_TABLE__[(r2)>>2](i7);
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r1)>>2](i7);
    r1 = commonVariable.r_g0 >> 2;
    f5 = Float64(heapClassInst.heapFloat[(r4)]);
    f9 = Float64(heapClassInst.heapFloat[(r4+1)]);
    r1 = Int64(heapClassInst.heap32[(r1)]);
    f11 = Float64(heapClassInst.heapFloat[(r4+4)]);
    f12 = Float64(heapClassInst.heapFloat[(r4+5)]);
    f13 = Float64(heapClassInst.heapFloat[(r4+2)]);
    r1 = r1 >> 2;
    f17 = f5*f7;
    f18 = f9*f10;
    f19 = Float64(heapClassInst.heapFloat[(r4+8)]);
    f20 = Float64(heapClassInst.heapFloat[(r4+9)]);
    f22 = Float64(heapClassInst.heapFloat[(r4+10)]);
    f23 = Float64(heapClassInst.heapFloat[(r4+6)]);
    r1 = Int64(heapClassInst.heap32[(r1+15)]);
    f24 = f11*f7;
    f25 = f12*f10;
    f17 = f17+f18;
    f18 = f13*f14;
    r2 = sp + (-112);
    f7 = f19*f7;
    f10 = f20*f10;
    f24 = f24+f25;
    f25 = f23*f14;
    f17 = f17+f18;
    r3 = r2 >> 2;
    f7 = f7+f10;
    f10 = f22*f14;
    f14 = f24+f25;
    heapClassInst.heapFloat[(fp+(-28))] = Float32(f17);
    f17 = f5*f15;
    f18 = f9*f16;
    f7 = f7+f10;
    heapClassInst.heapFloat[(r3+1)] = Float32(f14);
    heapClassInst.heapFloat[(r3+2)] = Float32(f7);
    f7 = f11*f15;
    f10 = f12*f16;
    f14 = f17+f18;
    f17 = f13*f21;
    r4 = sp + (-96);
    f15 = f19*f15;
    f16 = f20*f16;
    f7 = f7+f10;
    f10 = f23*f21;
    f14 = f14+f17;
    heapClassInst.heap32[(r3+3)] = 0;
    f5 = f5*f6;
    f9 = f9*f1;
    r3 = r4 >> 2;
    f15 = f15+f16;
    f16 = f22*f21;
    f7 = f7+f10;
    heapClassInst.heapFloat[(fp+(-24))] = Float32(f14);
    f10 = f11*f6;
    f11 = f12*f1;
    f5 = f5+f9;
    f9 = f13*f8;
    f12 = f15+f16;
    heapClassInst.heapFloat[(r3+1)] = Float32(f7);
    f5 = f5+f9;
    heapClassInst.heapFloat[(r3+2)] = Float32(f12);
    f6 = f19*f6;
    f1 = f20*f1;
    f7 = f10+f11;
    f9 = f23*f8;
    r5 = sp + (-80);
    f7 = f7+f9;
    f1 = f6+f1;
    f6 = f22*f8;
    f2 = f2+f5;
    heapClassInst.heap32[(r3+3)] = 0;
    f1 = f1+f6;
    r3 = r5 >> 2;
    f3 = f3+f7;
    heapClassInst.heapFloat[(fp+(-20))] = Float32(f2);
    f1 = f4+f1;
    heapClassInst.heapFloat[(r3+1)] = Float32(f3);
    heapClassInst.heapFloat[(r3+2)] = Float32(f1);
    heapClassInst.heap32[(r3+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r5);
    heapClassInst.heap32[(g0+2)] = Int32(r4);
}
else{
__label__ = 32;
break 
}
}
    heapClassInst.heap32[(g0+3)] = Int32(r2);
    heapClassInst.heapFloat[(g0+4)] = Float32(f0);
    heapClassInst.heapFloat[(g0+5)] = Float32(f0);
    heapClassInst.heap32[(g0+6)] = 0;
    heapClassInst.heap32[(g0+7)] = 1086918619;
    heapClassInst.heap32[(g0+8)] = Int32(r6);
    heapClassInst.heap32[(g0+9)] = 0;
    heapClassInst.heap32[(g0+10)] = 1092616192;
    __FUNCTION_TABLE__[(r1)>>2](i7);
    return;
}
}
else{
    if(r3 > 8) 
{
    if(r3 == 9) 
{
    r2 = Int64(heapClassInst.heap32[(r5+23)]);
    r3 = (r2 + (-1))|0;
    if(r3 < 0) 
{
__label__ = 40;
break 
}
else{
    r3 = 1;
    r2 = (r3 - r2)|0;
while(true){
    r3 = r2;
    r2 = Int64(heapClassInst.heap32[(r5+25)]);
    r7 = r3 << 4;
    r8 = Int64(heapClassInst.heap32[(r1)]);
    r2 = (r2 - r7)|0;
    r2 = r2 >> 2;
    r7 = r8 >> 2;
    r7 = Int64(heapClassInst.heap32[(r7+4)]);
    f0 = Float64(heapClassInst.heapFloat[(r2)]);
    f1 = Float64(heapClassInst.heapFloat[(r2+1)]);
    f2 = Float64(heapClassInst.heapFloat[(r2+2)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r7)>>2](i7);
    r7 = r4 >> 2;
    r8 = commonVariable.r_g0 >> 2;
    r8 = Int64(heapClassInst.heap32[(r8)]);
    f3 = Float64(heapClassInst.heapFloat[(r7+1)]);
    f4 =                         0.0;
    f5 = Float64(heapClassInst.heapFloat[(r7)]);
    f6 = Float64(heapClassInst.heapFloat[(r7+2)]);
    r8 = r8 >> 2;
    f7 = f3*f4;
    f8 = f5*f4;
    f9 = Float64(heapClassInst.heapFloat[(r7+8)]);
    f10 = Float64(heapClassInst.heapFloat[(r7+9)]);
    f11 = Float64(heapClassInst.heapFloat[(r7+10)]);
    f12 = Float64(heapClassInst.heapFloat[(r7+4)]);
    f13 = Float64(heapClassInst.heapFloat[(r7+5)]);
    f14 = Float64(heapClassInst.heapFloat[(r7+6)]);
    r8 = Int64(heapClassInst.heap32[(r8+4)]);
    f15 = f5+f7;
    f16 = f6*f4;
    f17 = Float64(heapClassInst.heapFloat[(r7+14)]);
    f18 = Float64(heapClassInst.heapFloat[(r7+13)]);
    f19 = Float64(heapClassInst.heapFloat[(r7+12)]);
    r7 = sp + (-608);
    f20 = f8+f3;
    f15 = f15+f16;
    f7 = f8+f7;
    r9 = r7 >> 2;
    f8 = f20+f16;
    heapClassInst.heapFloat[(fp+(-152))] = Float32(f15);
    f15 = f13*f4;
    f7 = f7+f6;
    heapClassInst.heapFloat[(r9+1)] = Float32(f8);
    f8 = f12*f4;
    heapClassInst.heapFloat[(r9+2)] = Float32(f7);
    f7 = f12+f15;
    f16 = f14*f4;
    f20 = f8+f13;
    f7 = f7+f16;
    heapClassInst.heap32[(r9+3)] = 0;
    f8 = f8+f15;
    f15 = f20+f16;
    heapClassInst.heapFloat[(r9+4)] = Float32(f7);
    f7 = f10*f4;
    f8 = f8+f14;
    heapClassInst.heapFloat[(r9+5)] = Float32(f15);
    f15 = f9*f4;
    heapClassInst.heapFloat[(r9+6)] = Float32(f8);
    f8 = f9+f7;
    f4 = f11*f4;
    f16 = f15+f10;
    f8 = f8+f4;
    heapClassInst.heap32[(r9+7)] = 0;
    f7 = f15+f7;
    f5 = f5*f0;
    f3 = f3*f1;
    f4 = f16+f4;
    heapClassInst.heapFloat[(r9+8)] = Float32(f8);
    f8 = f12*f0;
    f12 = f13*f1;
    f3 = f5+f3;
    f5 = f6*f2;
    f6 = f7+f11;
    heapClassInst.heapFloat[(r9+9)] = Float32(f4);
    f3 = f3+f5;
    heapClassInst.heapFloat[(r9+10)] = Float32(f6);
    f0 = f9*f0;
    f1 = f10*f1;
    f4 = f8+f12;
    f5 = f14*f2;
    f4 = f4+f5;
    f0 = f0+f1;
    f1 = f11*f2;
    f2 = f3+f19;
    heapClassInst.heap32[(r9+11)] = 0;
    f0 = f0+f1;
    f1 = f4+f18;
    heapClassInst.heapFloat[(r9+12)] = Float32(f2);
    f0 = f0+f17;
    heapClassInst.heapFloat[(r9+13)] = Float32(f1);
    heapClassInst.heapFloat[(r9+14)] = Float32(f0);
    heapClassInst.heap32[(r9+15)] = 0;
    r9 = Int64(heapClassInst.heap32[(r5+30)]);
    r10 = r3 << 2;
    r9 = (r9 - r10)|0;
    r9 = r9 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r9)]);
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heapFloat[(g0+1)] = Float32(f0);
    heapClassInst.heap32[(g0+2)] = Int32(r7);
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    r2 = (r3 + 1)|0;
    __FUNCTION_TABLE__[(r8)>>2](i7);
    if(r3 == 0) 
{
__label__ = 40;
break 
}
else{
continue 
}
}
}
}
else{
    if(r3 == 10) 
{
    r3 = Int64(heapClassInst.heap32[(r5+13)]);
    r5 = (r3 + 2)|0;
    r5 = (r5 % 3)|0;
    r7 = r3 << 2;
    r2 = (r2 + 28)|0;
    r5 = r5 << 2;
    r8 = (r2 + r7)|0;
    r2 = (r2 + r5)|0;
    r8 = r8 >> 2;
    r2 = r2 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r8)]);
    f1 = Float64(heapClassInst.heapFloat[(r2)]);
    r2 = sp + (-720);
    r8 = r2 >> 2;
    heapClassInst.heap32[(fp+(-180))] = 0;
    heapClassInst.heap32[(r8+1)] = 0;
    r9 = (r2 + r7)|0;
    heapClassInst.heap32[(r8+2)] = 0;
    r9 = r9 >> 2;
    f2 = -f0;
    heapClassInst.heap32[(r8+3)] = 0;
    r10 = sp + (-736);
    heapClassInst.heapFloat[(r9)] = Float32(f2);
    heapClassInst.heap32[(fp+(-184))] = 0;
    r9 = r10 >> 2;
    heapClassInst.heap32[(r9+1)] = 0;
    r7 = (r10 + r7)|0;
    heapClassInst.heap32[(r9+2)] = 0;
    r7 = r7 >> 2;
    heapClassInst.heap32[(r9+3)] = 0;
    heapClassInst.heapFloat[(r7)] = Float32(f0);
    r4 = r4 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r4)]);
    r7 = sp + (-800);
    heapClassInst.heapFloat[(fp+(-200))] = Float32(f0);
    r11 = r7 >> 2;
    f2 = Float64(heapClassInst.heapFloat[(r4+1)]);
    heapClassInst.heapFloat[(r11+1)] = Float32(f2);
    f3 = Float64(heapClassInst.heapFloat[(r4+2)]);
    heapClassInst.heapFloat[(r11+2)] = Float32(f3);
    heapClassInst.heap32[(r11+3)] = heapClassInst.heap32[(r4+3)];
    f4 = Float64(heapClassInst.heapFloat[(r4+4)]);
    heapClassInst.heapFloat[(r11+4)] = Float32(f4);
    f5 = Float64(heapClassInst.heapFloat[(r4+5)]);
    heapClassInst.heapFloat[(r11+5)] = Float32(f5);
    f6 = Float64(heapClassInst.heapFloat[(r4+6)]);
    heapClassInst.heapFloat[(r11+6)] = Float32(f6);
    heapClassInst.heap32[(r11+7)] = heapClassInst.heap32[(r4+7)];
    f7 = Float64(heapClassInst.heapFloat[(r4+8)]);
    heapClassInst.heapFloat[(r11+8)] = Float32(f7);
    f8 = Float64(heapClassInst.heapFloat[(r4+9)]);
    heapClassInst.heapFloat[(r11+9)] = Float32(f8);
    f9 = Float64(heapClassInst.heapFloat[(r4+10)]);
    heapClassInst.heapFloat[(r11+10)] = Float32(f9);
    heapClassInst.heap32[(r11+11)] = heapClassInst.heap32[(r4+11)];
    f10 = Float64(heapClassInst.heapFloat[(fp+(-180))]);
    f11 = Float64(heapClassInst.heapFloat[(r8+1)]);
    f12 = Float64(heapClassInst.heapFloat[(r8+2)]);
    f0 = f0*f10;
    f2 = f2*f11;
    f4 = f4*f10;
    f5 = f5*f11;
    f0 = f0+f2;
    f2 = f3*f12;
    f3 = f7*f10;
    f7 = f8*f11;
    f4 = f4+f5;
    f5 = f6*f12;
    f0 = f0+f2;
    f2 = Float64(heapClassInst.heapFloat[(r4+12)]);
    f6 = Float64(heapClassInst.heapFloat[(r4+13)]);
    f8 = Float64(heapClassInst.heapFloat[(r4+14)]);
    f4 = f4+f5;
    f3 = f3+f7;
    f5 = f9*f12;
    f0 = f0+f2;
    f2 = f3+f5;
    f3 = f4+f6;
    heapClassInst.heapFloat[(r11+12)] = Float32(f0);
    f0 = f2+f8;
    heapClassInst.heapFloat[(r11+13)] = Float32(f3);
    heapClassInst.heapFloat[(r11+14)] = Float32(f0);
    heapClassInst.heap32[(r11+15)] = 0;
    r11 = Int64(heapClassInst.heap32[(r1)]);
    r11 = r11 >> 2;
    r11 = Int64(heapClassInst.heap32[(r11+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r11)>>2](i7);
    r12 = commonVariable.r_g0 >> 2;
    r12 = Int64(heapClassInst.heap32[(r12)]);
    r12 = r12 >> 2;
    r12 = Int64(heapClassInst.heap32[(r12+4)]);
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heapFloat[(g0+1)] = Float32(f1);
    heapClassInst.heap32[(g0+2)] = Int32(r7);
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    __FUNCTION_TABLE__[(r12)>>2](i7);
    f0 = Float64(heapClassInst.heapFloat[(r4)]);
    r7 = sp + (-864);
    heapClassInst.heapFloat[(fp+(-216))] = Float32(f0);
    r11 = r7 >> 2;
    f2 = Float64(heapClassInst.heapFloat[(r4+1)]);
    heapClassInst.heapFloat[(r11+1)] = Float32(f2);
    f3 = Float64(heapClassInst.heapFloat[(r4+2)]);
    heapClassInst.heapFloat[(r11+2)] = Float32(f3);
    heapClassInst.heap32[(r11+3)] = heapClassInst.heap32[(r4+3)];
    f4 = Float64(heapClassInst.heapFloat[(r4+4)]);
    heapClassInst.heapFloat[(r11+4)] = Float32(f4);
    f5 = Float64(heapClassInst.heapFloat[(r4+5)]);
    heapClassInst.heapFloat[(r11+5)] = Float32(f5);
    f6 = Float64(heapClassInst.heapFloat[(r4+6)]);
    heapClassInst.heapFloat[(r11+6)] = Float32(f6);
    heapClassInst.heap32[(r11+7)] = heapClassInst.heap32[(r4+7)];
    f7 = Float64(heapClassInst.heapFloat[(r4+8)]);
    heapClassInst.heapFloat[(r11+8)] = Float32(f7);
    f8 = Float64(heapClassInst.heapFloat[(r4+9)]);
    heapClassInst.heapFloat[(r11+9)] = Float32(f8);
    f9 = Float64(heapClassInst.heapFloat[(r4+10)]);
    heapClassInst.heapFloat[(r11+10)] = Float32(f9);
    heapClassInst.heap32[(r11+11)] = heapClassInst.heap32[(r4+11)];
    f10 = Float64(heapClassInst.heapFloat[(fp+(-184))]);
    f11 = Float64(heapClassInst.heapFloat[(r9+1)]);
    f12 = Float64(heapClassInst.heapFloat[(r9+2)]);
    f0 = f0*f10;
    f2 = f2*f11;
    f4 = f4*f10;
    f5 = f5*f11;
    f0 = f0+f2;
    f2 = f3*f12;
    f3 = f7*f10;
    f7 = f8*f11;
    f4 = f4+f5;
    f5 = f6*f12;
    f0 = f0+f2;
    f2 = Float64(heapClassInst.heapFloat[(r4+12)]);
    f6 = Float64(heapClassInst.heapFloat[(r4+13)]);
    f8 = Float64(heapClassInst.heapFloat[(r4+14)]);
    f4 = f4+f5;
    f3 = f3+f7;
    f5 = f9*f12;
    f0 = f0+f2;
    f2 = f3+f5;
    f3 = f4+f6;
    heapClassInst.heapFloat[(r11+12)] = Float32(f0);
    f0 = f2+f8;
    heapClassInst.heapFloat[(r11+13)] = Float32(f3);
    heapClassInst.heapFloat[(r11+14)] = Float32(f0);
    heapClassInst.heap32[(r11+15)] = 0;
    r11 = Int64(heapClassInst.heap32[(r1)]);
    r11 = r11 >> 2;
    r11 = Int64(heapClassInst.heap32[(r11+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r11)>>2](i7);
    r12 = commonVariable.r_g0 >> 2;
    r12 = Int64(heapClassInst.heap32[(r12)]);
    r12 = r12 >> 2;
    r12 = Int64(heapClassInst.heap32[(r12+4)]);
    r3 = (r3 + 1)|0;
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heapFloat[(g0+1)] = Float32(f1);
    heapClassInst.heap32[(g0+2)] = Int32(r7);
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    r3 = (r3 % 3)|0;
    __FUNCTION_TABLE__[(r12)>>2](i7);
    r3 = r3 << 2;
    r7 = (r2 + r3)|0;
    f0 = Float64(heapClassInst.heapFloat[(r4+12)]);
    f2 = Float64(heapClassInst.heapFloat[(r4+13)]);
    f3 = Float64(heapClassInst.heapFloat[(r4+14)]);
    r3 = (r10 + r3)|0;
    r7 = r7 >> 2;
    heapClassInst.heapFloat[(r7)] = Float32(f1);
    r3 = r3 >> 2;
    heapClassInst.heapFloat[(r3)] = Float32(f1);
    r11 = Int64(heapClassInst.heap32[(r1)]);
    r11 = r11 >> 2;
    r11 = Int64(heapClassInst.heap32[(r11+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r11)>>2](i7);
    r12 = commonVariable.r_g0 >> 2;
    f4 = Float64(heapClassInst.heapFloat[(fp+(-184))]);
    f5 = Float64(heapClassInst.heapFloat[(r4)]);
    f6 = Float64(heapClassInst.heapFloat[(r9+1)]);
    f7 = Float64(heapClassInst.heapFloat[(r4+1)]);
    r12 = Int64(heapClassInst.heap32[(r12)]);
    f8 = Float64(heapClassInst.heapFloat[(r4+4)]);
    f9 = Float64(heapClassInst.heapFloat[(r4+5)]);
    f10 = f5*f4;
    f11 = f7*f6;
    f12 = Float64(heapClassInst.heapFloat[(r9+2)]);
    f13 = Float64(heapClassInst.heapFloat[(r4+2)]);
    r12 = r12 >> 2;
    f14 = Float64(heapClassInst.heapFloat[(r4+8)]);
    f15 = Float64(heapClassInst.heapFloat[(r4+9)]);
    f16 = Float64(heapClassInst.heapFloat[(r4+6)]);
    f17 = f8*f4;
    f18 = f9*f6;
    f10 = f10+f11;
    f11 = f13*f12;
    f10 = f10+f11;
    f11 = Float64(heapClassInst.heapFloat[(r4+10)]);
    r12 = Int64(heapClassInst.heap32[(r12+2)]);
    f4 = f14*f4;
    f6 = f15*f6;
    f17 = f17+f18;
    f18 = f16*f12;
    r13 = sp + (-544);
    f17 = f17+f18;
    f4 = f4+f6;
    f6 = f11*f12;
    f10 = f0+f10;
    f4 = f4+f6;
    r14 = r13 >> 2;
    f6 = f2+f17;
    heapClassInst.heapFloat[(fp+(-136))] = Float32(f10);
    f4 = f3+f4;
    heapClassInst.heapFloat[(r14+1)] = Float32(f6);
    heapClassInst.heapFloat[(r14+2)] = Float32(f4);
    heapClassInst.heap32[(r14+3)] = 0;
    f4 = Float64(heapClassInst.heapFloat[(fp+(-180))]);
    f6 = Float64(heapClassInst.heapFloat[(r8+1)]);
    f10 = Float64(heapClassInst.heapFloat[(r8+2)]);
    f5 = f5*f4;
    f7 = f7*f6;
    f8 = f8*f4;
    f9 = f9*f6;
    f5 = f5+f7;
    f7 = f13*f10;
    f5 = f5+f7;
    f4 = f14*f4;
    f6 = f15*f6;
    f7 = f8+f9;
    f8 = f16*f10;
    r14 = sp + (-528);
    f7 = f7+f8;
    f4 = f4+f6;
    f6 = f11*f10;
    f5 = f0+f5;
    f4 = f4+f6;
    r15 = r14 >> 2;
    f6 = f2+f7;
    heapClassInst.heapFloat[(fp+(-132))] = Float32(f5);
    f4 = f3+f4;
    heapClassInst.heapFloat[(r15+1)] = Float32(f6);
    heapClassInst.heapFloat[(r15+2)] = Float32(f4);
    heapClassInst.heap32[(r15+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r14);
    heapClassInst.heap32[(g0+2)] = Int32(r13);
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    __FUNCTION_TABLE__[(r12)>>2](i7);
    f4 = -f1;
    heapClassInst.heapFloat[(r7)] = Float32(f4);
    heapClassInst.heapFloat[(r3)] = Float32(f4);
    r11 = Int64(heapClassInst.heap32[(r1)]);
    r11 = r11 >> 2;
    r11 = Int64(heapClassInst.heap32[(r11+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r11)>>2](i7);
    r12 = commonVariable.r_g0 >> 2;
    f5 = Float64(heapClassInst.heapFloat[(fp+(-184))]);
    f6 = Float64(heapClassInst.heapFloat[(r4)]);
    f7 = Float64(heapClassInst.heapFloat[(r9+1)]);
    f8 = Float64(heapClassInst.heapFloat[(r4+1)]);
    r12 = Int64(heapClassInst.heap32[(r12)]);
    f9 = Float64(heapClassInst.heapFloat[(r4+4)]);
    f10 = Float64(heapClassInst.heapFloat[(r4+5)]);
    f11 = f6*f5;
    f12 = f8*f7;
    f13 = Float64(heapClassInst.heapFloat[(r9+2)]);
    f14 = Float64(heapClassInst.heapFloat[(r4+2)]);
    r12 = r12 >> 2;
    f15 = Float64(heapClassInst.heapFloat[(r4+8)]);
    f16 = Float64(heapClassInst.heapFloat[(r4+9)]);
    f17 = Float64(heapClassInst.heapFloat[(r4+6)]);
    f18 = f9*f5;
    f19 = f10*f7;
    f11 = f11+f12;
    f12 = f14*f13;
    f11 = f11+f12;
    f12 = Float64(heapClassInst.heapFloat[(r4+10)]);
    r12 = Int64(heapClassInst.heap32[(r12+2)]);
    f5 = f15*f5;
    f7 = f16*f7;
    f18 = f18+f19;
    f19 = f17*f13;
    r13 = sp + (-512);
    f18 = f18+f19;
    f5 = f5+f7;
    f7 = f12*f13;
    f11 = f0+f11;
    f5 = f5+f7;
    r14 = r13 >> 2;
    f7 = f2+f18;
    heapClassInst.heapFloat[(fp+(-128))] = Float32(f11);
    f5 = f3+f5;
    heapClassInst.heapFloat[(r14+1)] = Float32(f7);
    heapClassInst.heapFloat[(r14+2)] = Float32(f5);
    heapClassInst.heap32[(r14+3)] = 0;
    f5 = Float64(heapClassInst.heapFloat[(fp+(-180))]);
    f7 = Float64(heapClassInst.heapFloat[(r8+1)]);
    f11 = Float64(heapClassInst.heapFloat[(r8+2)]);
    f6 = f6*f5;
    f8 = f8*f7;
    f9 = f9*f5;
    f10 = f10*f7;
    f6 = f6+f8;
    f8 = f14*f11;
    f6 = f6+f8;
    f5 = f15*f5;
    f7 = f16*f7;
    f8 = f9+f10;
    f9 = f17*f11;
    r14 = sp + (-496);
    f8 = f8+f9;
    f5 = f5+f7;
    f7 = f12*f11;
    f6 = f0+f6;
    f5 = f5+f7;
    r15 = r14 >> 2;
    f7 = f2+f8;
    heapClassInst.heapFloat[(fp+(-124))] = Float32(f6);
    f5 = f3+f5;
    heapClassInst.heapFloat[(r15+1)] = Float32(f7);
    heapClassInst.heapFloat[(r15+2)] = Float32(f5);
    heapClassInst.heap32[(r15+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r14);
    heapClassInst.heap32[(g0+2)] = Int32(r13);
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    __FUNCTION_TABLE__[(r12)>>2](i7);
    heapClassInst.heap32[(r7)] = 0;
    r2 = (r2 + r5)|0;
    r5 = (r10 + r5)|0;
    heapClassInst.heap32[(r3)] = 0;
    r2 = r2 >> 2;
    heapClassInst.heapFloat[(r2)] = Float32(f1);
    r3 = r5 >> 2;
    heapClassInst.heapFloat[(r3)] = Float32(f1);
    r5 = Int64(heapClassInst.heap32[(r1)]);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r5)>>2](i7);
    r7 = commonVariable.r_g0 >> 2;
    f1 = Float64(heapClassInst.heapFloat[(fp+(-184))]);
    f5 = Float64(heapClassInst.heapFloat[(r4)]);
    f6 = Float64(heapClassInst.heapFloat[(r9+1)]);
    f7 = Float64(heapClassInst.heapFloat[(r4+1)]);
    r7 = Int64(heapClassInst.heap32[(r7)]);
    f8 = Float64(heapClassInst.heapFloat[(r4+4)]);
    f9 = Float64(heapClassInst.heapFloat[(r4+5)]);
    f10 = f5*f1;
    f11 = f7*f6;
    f12 = Float64(heapClassInst.heapFloat[(r9+2)]);
    f13 = Float64(heapClassInst.heapFloat[(r4+2)]);
    r7 = r7 >> 2;
    f14 = Float64(heapClassInst.heapFloat[(r4+8)]);
    f15 = Float64(heapClassInst.heapFloat[(r4+9)]);
    f16 = Float64(heapClassInst.heapFloat[(r4+6)]);
    f17 = f8*f1;
    f18 = f9*f6;
    f10 = f10+f11;
    f11 = f13*f12;
    f10 = f10+f11;
    f11 = Float64(heapClassInst.heapFloat[(r4+10)]);
    r7 = Int64(heapClassInst.heap32[(r7+2)]);
    f1 = f14*f1;
    f6 = f15*f6;
    f17 = f17+f18;
    f18 = f16*f12;
    r10 = sp + (-480);
    f17 = f17+f18;
    f1 = f1+f6;
    f6 = f11*f12;
    f10 = f0+f10;
    f1 = f1+f6;
    r11 = r10 >> 2;
    f6 = f2+f17;
    heapClassInst.heapFloat[(fp+(-120))] = Float32(f10);
    f1 = f3+f1;
    heapClassInst.heapFloat[(r11+1)] = Float32(f6);
    heapClassInst.heapFloat[(r11+2)] = Float32(f1);
    heapClassInst.heap32[(r11+3)] = 0;
    f1 = Float64(heapClassInst.heapFloat[(fp+(-180))]);
    f6 = Float64(heapClassInst.heapFloat[(r8+1)]);
    f10 = Float64(heapClassInst.heapFloat[(r8+2)]);
    f5 = f5*f1;
    f7 = f7*f6;
    f8 = f8*f1;
    f9 = f9*f6;
    f5 = f5+f7;
    f7 = f13*f10;
    f5 = f5+f7;
    f1 = f14*f1;
    f6 = f15*f6;
    f7 = f8+f9;
    f8 = f16*f10;
    r11 = sp + (-464);
    f7 = f7+f8;
    f1 = f1+f6;
    f6 = f11*f10;
    f5 = f0+f5;
    f1 = f1+f6;
    r12 = r11 >> 2;
    f6 = f2+f7;
    heapClassInst.heapFloat[(fp+(-116))] = Float32(f5);
    f1 = f3+f1;
    heapClassInst.heapFloat[(r12+1)] = Float32(f6);
    heapClassInst.heapFloat[(r12+2)] = Float32(f1);
    heapClassInst.heap32[(r12+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r11);
    heapClassInst.heap32[(g0+2)] = Int32(r10);
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    __FUNCTION_TABLE__[(r7)>>2](i7);
    heapClassInst.heapFloat[(r2)] = Float32(f4);
    heapClassInst.heapFloat[(r3)] = Float32(f4);
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r1)>>2](i7);
    r1 = commonVariable.r_g0 >> 2;
    f1 = Float64(heapClassInst.heapFloat[(fp+(-184))]);
    f4 = Float64(heapClassInst.heapFloat[(r4)]);
    f5 = Float64(heapClassInst.heapFloat[(r9+1)]);
    f6 = Float64(heapClassInst.heapFloat[(r4+1)]);
    r1 = Int64(heapClassInst.heap32[(r1)]);
    f7 = Float64(heapClassInst.heapFloat[(r4+4)]);
    f8 = Float64(heapClassInst.heapFloat[(r4+5)]);
    f9 = f4*f1;
    f10 = f6*f5;
    f11 = Float64(heapClassInst.heapFloat[(r9+2)]);
    f12 = Float64(heapClassInst.heapFloat[(r4+2)]);
    r1 = r1 >> 2;
    f13 = Float64(heapClassInst.heapFloat[(r4+8)]);
    f14 = Float64(heapClassInst.heapFloat[(r4+9)]);
    f15 = Float64(heapClassInst.heapFloat[(r4+6)]);
    f16 = f7*f1;
    f17 = f8*f5;
    f9 = f9+f10;
    f10 = f12*f11;
    f9 = f9+f10;
    f10 = Float64(heapClassInst.heapFloat[(r4+10)]);
    r1 = Int64(heapClassInst.heap32[(r1+2)]);
    f1 = f13*f1;
    f5 = f14*f5;
    f16 = f16+f17;
    f17 = f15*f11;
    r2 = sp + (-448);
    f16 = f16+f17;
    f1 = f1+f5;
    f5 = f10*f11;
    f9 = f0+f9;
    f1 = f1+f5;
    r3 = r2 >> 2;
    f5 = f2+f16;
    heapClassInst.heapFloat[(fp+(-112))] = Float32(f9);
    f1 = f3+f1;
    heapClassInst.heapFloat[(r3+1)] = Float32(f5);
    heapClassInst.heapFloat[(r3+2)] = Float32(f1);
    heapClassInst.heap32[(r3+3)] = 0;
    f1 = Float64(heapClassInst.heapFloat[(fp+(-180))]);
    f5 = Float64(heapClassInst.heapFloat[(r8+1)]);
    f9 = Float64(heapClassInst.heapFloat[(r8+2)]);
    f4 = f4*f1;
    f6 = f6*f5;
    f7 = f7*f1;
    f8 = f8*f5;
    f4 = f4+f6;
    f6 = f12*f9;
    f4 = f4+f6;
    f1 = f13*f1;
    f5 = f14*f5;
    f6 = f7+f8;
    f7 = f15*f9;
    r3 = sp + (-432);
    f6 = f6+f7;
    f1 = f1+f5;
    f5 = f10*f9;
    f0 = f0+f4;
    f1 = f1+f5;
    r4 = r3 >> 2;
    f2 = f2+f6;
    heapClassInst.heapFloat[(fp+(-108))] = Float32(f0);
    f0 = f3+f1;
    heapClassInst.heapFloat[(r4+1)] = Float32(f2);
    heapClassInst.heapFloat[(r4+2)] = Float32(f0);
    heapClassInst.heap32[(r4+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r3);
__label__ = 30;
break 
}
else{
__label__ = 32;
break 
}
}
}
else{
    if(r3 == 0) 
{
    r3 = sp + (-704);
    f0 = Float64(heapClassInst.heapFloat[(r5+8)]);
    f1 = Float64(heapClassInst.heapFloat[(r5+9)]);
    f2 = Float64(heapClassInst.heapFloat[(r5+7)]);
    r7 = r3 >> 2;
    heapClassInst.heap32[(r7+3)] = heapClassInst.heap32[(r5+10)];
    r8 = Int64(heapClassInst.heap32[(r5)]);
    r8 = r8 >> 2;
    r8 = Int64(heapClassInst.heap32[(r8+11)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    __FUNCTION_TABLE__[(r8)>>2](i7);
    f3 = commonVariable.f_g0;
    r8 = Int64(heapClassInst.heap32[(r5)]);
    r8 = r8 >> 2;
    r8 = Int64(heapClassInst.heap32[(r8+11)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    __FUNCTION_TABLE__[(r8)>>2](i7);
    f4 = commonVariable.f_g0;
    r5 = Int64(heapClassInst.heap32[(r5)]);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5+11)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    __FUNCTION_TABLE__[(r5)>>2](i7);
    f2 = f2+commonVariable.f_g0;
    f0 = f0+f4;
    heapClassInst.heapFloat[(fp+(-176))] = Float32(f2);
    f1 = f1+f3;
    heapClassInst.heapFloat[(r7+1)] = Float32(f0);
    heapClassInst.heapFloat[(r7+2)] = Float32(f1);
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r1)>>2](i7);
    r1 = commonVariable.r_g0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r7+2)]);
    f1 = Float64(heapClassInst.heapFloat[(r7+1)]);
    f2 = Float64(heapClassInst.heapFloat[(fp+(-176))]);
    r1 = Int64(heapClassInst.heap32[(r1+18)]);
    r2 = sp + (-624);
    f2 = -f2;
    r5 = r2 >> 2;
    f1 = -f1;
    heapClassInst.heapFloat[(fp+(-156))] = Float32(f2);
    f0 = -f0;
    heapClassInst.heapFloat[(r5+1)] = Float32(f1);
    heapClassInst.heapFloat[(r5+2)] = Float32(f0);
    heapClassInst.heap32[(r5+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r2);
    heapClassInst.heap32[(g0+2)] = Int32(r3);
    heapClassInst.heap32[(g0+3)] = Int32(r4);
    heapClassInst.heap32[(g0+4)] = Int32(r6);
    __FUNCTION_TABLE__[(r1)>>2](i7);
    return;
}
else{
    if(r3 == 8) 
{
    r3 = Int64(heapClassInst.heap32[(r5)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+11)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    __FUNCTION_TABLE__[(r3)>>2](i7);
    f0 = commonVariable.f_g0;
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r1)>>2](i7);
    r1 = commonVariable.r_g0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+4)]);
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heapFloat[(g0+1)] = Float32(f0);
    heapClassInst.heap32[(g0+2)] = Int32(r4);
__label__ = 31;
}
else{
__label__ = 32;
}
}
}
}
} while(false);
do {
match(__label__ ){
case 30  =>
    heapClassInst.heap32[(g0+2)] = Int32(r2);
    __label__ = 31;
case 32  =>
    r7 = (r3 + (-21))|0;
    if(`UIntNative`(r7) < `UIntNative`(9)) {
        r3 = sp + (-1024);
        r7 = r3 >> 2;
        heapClassInst.heap32[(fp+(-256))] = 1566444395;
        heapClassInst.heap32[(r7+1)] = 1566444395;
        heapClassInst.heap32[(r7+2)] = 1566444395;
        r8 = sp + (-1040);
        heapClassInst.heap32[(r7+3)] = 0;
        r7 = r8 >> 2;
        heapClassInst.heap32[(fp+(-260))] = ( -581039253);
        heapClassInst.heap32[(r7+1)] = ( -581039253);
        heapClassInst.heap32[(r7+2)] = ( -581039253);
        heapClassInst.heap32[(r7+3)] = 0;
        r7 = Int64(heapClassInst.heap32[(r1)]);
        r7 = r7 >> 2;
        r7 = Int64(heapClassInst.heap32[(r7+4)]);
        r9 = _ZTV17DebugDrawcallback;
        heapClassInst.heap32[(g0)] = Int32(r0);
        r10 = sp + (-1136);
        r11 = (r9 + 8)|0;
        __FUNCTION_TABLE__[(r7)>>2](i7);
        r12 = r10 >> 2;
        r9 = (r9 + 32)|0;
        heapClassInst.heap32[(fp+(-284))] = Int32(r11);
        heapClassInst.heap32[(r12+1)] = Int32(r9);
        r13 = r6 >> 2;
        heapClassInst.heap32[(r12+2)] = Int32(commonVariable.r_g0);
        heapClassInst.heap32[(r12+3)] = heapClassInst.heap32[(r13)];
        heapClassInst.heap32[(r12+4)] = heapClassInst.heap32[(r13+1)];
        heapClassInst.heap32[(r12+5)] = heapClassInst.heap32[(r13+2)];
        r7 = r4 >> 2;
        heapClassInst.heap32[(r12+6)] = heapClassInst.heap32[(r13+3)];
        heapClassInst.heap32[(r12+7)] = heapClassInst.heap32[(r7)];
        heapClassInst.heap32[(r12+8)] = heapClassInst.heap32[(r7+1)];
        heapClassInst.heap32[(r12+9)] = heapClassInst.heap32[(r7+2)];
        heapClassInst.heap32[(r12+10)] = heapClassInst.heap32[(r7+3)];
        heapClassInst.heap32[(r12+11)] = heapClassInst.heap32[(r7+4)];
        heapClassInst.heap32[(r12+12)] = heapClassInst.heap32[(r7+5)];
        heapClassInst.heap32[(r12+13)] = heapClassInst.heap32[(r7+6)];
        heapClassInst.heap32[(r12+14)] = heapClassInst.heap32[(r7+7)];
        heapClassInst.heap32[(r12+15)] = heapClassInst.heap32[(r7+8)];
        heapClassInst.heap32[(r12+16)] = heapClassInst.heap32[(r7+9)];
        heapClassInst.heap32[(r12+17)] = heapClassInst.heap32[(r7+10)];
        heapClassInst.heap32[(r12+18)] = heapClassInst.heap32[(r7+11)];
        heapClassInst.heap32[(r12+19)] = heapClassInst.heap32[(r7+12)];
        heapClassInst.heap32[(r12+20)] = heapClassInst.heap32[(r7+13)];
        heapClassInst.heap32[(r12+21)] = heapClassInst.heap32[(r7+14)];
        heapClassInst.heap32[(r12+22)] = heapClassInst.heap32[(r7+15)];
        r7 = Int64(heapClassInst.heap32[(r5)]);
        r7 = r7 >> 2;
        r7 = Int64(heapClassInst.heap32[(r7+15)]);
        heapClassInst.heap32[(g0)] = Int32(r2);
        heapClassInst.heap32[(g0+1)] = Int32(r10);
        heapClassInst.heap32[(g0+2)] = Int32(r8);
        heapClassInst.heap32[(g0+3)] = Int32(r3);
        __FUNCTION_TABLE__[(r7)>>2](i7);
        r3 = r10 | 4;
        r7 = _ZTV31btInternalTriangleIndexCallback;
        heapClassInst.heap32[(fp+(-284))] = Int32(r11);
        r8 = _ZTV18btTriangleCallback;
        r3 = r3 >> 2;
        r7 = (r7 + 8)|0;
        heapClassInst.heap32[(r12+1)] = Int32(r9);
        r8 = (r8 + 8)|0;
        heapClassInst.heap32[(r3)] = Int32(r7);
        heapClassInst.heap32[(fp+(-284))] = Int32(r8);
        r3 = Int64(heapClassInst.heap32[(r5+1)]);
    }
    if(r3 == 3) {
        r3 = sp + (-1152);
        r7 = r3 >> 2;
        heapClassInst.heap32[(fp+(-288))] = 1566444395;
        heapClassInst.heap32[(r7+1)] = 1566444395;
        heapClassInst.heap32[(r7+2)] = 1566444395;
        r8 = sp + (-1168);
        heapClassInst.heap32[(r7+3)] = 0;
        r7 = r8 >> 2;
        heapClassInst.heap32[(fp+(-292))] = ( -581039253);
        heapClassInst.heap32[(r7+1)] = ( -581039253);
        heapClassInst.heap32[(r7+2)] = ( -581039253);
        heapClassInst.heap32[(r7+3)] = 0;
        r7 = Int64(heapClassInst.heap32[(r1)]);
        r7 = r7 >> 2;
        r7 = Int64(heapClassInst.heap32[(r7+4)]);
        r9 = _ZTV17DebugDrawcallback;
        heapClassInst.heap32[(g0)] = Int32(r0);
        r10 = sp + (-1264);
        r11 = (r9 + 8)|0;
        __FUNCTION_TABLE__[(r7)>>2](i7);
        r12 = r10 >> 2;
        r9 = (r9 + 32)|0;
        heapClassInst.heap32[(fp+(-316))] = Int32(r11);
        heapClassInst.heap32[(r12+1)] = Int32(r9);
        r13 = r6 >> 2;
        heapClassInst.heap32[(r12+2)] = Int32(commonVariable.r_g0);
        heapClassInst.heap32[(r12+3)] = heapClassInst.heap32[(r13)];
        heapClassInst.heap32[(r12+4)] = heapClassInst.heap32[(r13+1)];
        heapClassInst.heap32[(r12+5)] = heapClassInst.heap32[(r13+2)];
        r7 = r4 >> 2;
        heapClassInst.heap32[(r12+6)] = heapClassInst.heap32[(r13+3)];
        heapClassInst.heap32[(r12+7)] = heapClassInst.heap32[(r7)];
        heapClassInst.heap32[(r12+8)] = heapClassInst.heap32[(r7+1)];
        heapClassInst.heap32[(r12+9)] = heapClassInst.heap32[(r7+2)];
        heapClassInst.heap32[(r12+10)] = heapClassInst.heap32[(r7+3)];
        heapClassInst.heap32[(r12+11)] = heapClassInst.heap32[(r7+4)];
        heapClassInst.heap32[(r12+12)] = heapClassInst.heap32[(r7+5)];
        heapClassInst.heap32[(r12+13)] = heapClassInst.heap32[(r7+6)];
        heapClassInst.heap32[(r12+14)] = heapClassInst.heap32[(r7+7)];
        heapClassInst.heap32[(r12+15)] = heapClassInst.heap32[(r7+8)];
        heapClassInst.heap32[(r12+16)] = heapClassInst.heap32[(r7+9)];
        heapClassInst.heap32[(r12+17)] = heapClassInst.heap32[(r7+10)];
        heapClassInst.heap32[(r12+18)] = heapClassInst.heap32[(r7+11)];
        heapClassInst.heap32[(r12+19)] = heapClassInst.heap32[(r7+12)];
        heapClassInst.heap32[(r12+20)] = heapClassInst.heap32[(r7+13)];
        heapClassInst.heap32[(r12+21)] = heapClassInst.heap32[(r7+14)];
        heapClassInst.heap32[(r12+22)] = heapClassInst.heap32[(r7+15)];
        r7 = Int64(heapClassInst.heap32[(r5+22)]);
        r13 = r7 >> 2;
        r13 = Int64(heapClassInst.heap32[(r13)]);
        r13 = r13 >> 2;
        r13 = Int64(heapClassInst.heap32[(r13+2)]);
        r14 = (r10 + 4)|0;
        heapClassInst.heap32[(g0)] = Int32(r7);
        heapClassInst.heap32[(g0+1)] = Int32(r14);
        heapClassInst.heap32[(g0+2)] = Int32(r8);
        heapClassInst.heap32[(g0+3)] = Int32(r3);
        __FUNCTION_TABLE__[(r13)>>2](i7);
        r3 = r10 | 4;
        r7 = _ZTV31btInternalTriangleIndexCallback;
        heapClassInst.heap32[(fp+(-316))] = Int32(r11);
        r8 = _ZTV18btTriangleCallback;
        r3 = r3 >> 2;
        r7 = (r7 + 8)|0;
        heapClassInst.heap32[(r12+1)] = Int32(r9);
        r8 = (r8 + 8)|0;
        heapClassInst.heap32[(r3)] = Int32(r7);
        heapClassInst.heap32[(fp+(-316))] = Int32(r8);
        r3 = Int64(heapClassInst.heap32[(r5+1)]);
    }
    if(r3 > 6) {
        __label__ = 40;
    }
    else {
        r3 = Int64(heapClassInst.heap32[(r5)]);
        r3 = r3 >> 2;
        r3 = Int64(heapClassInst.heap32[(r3+22)]);
        heapClassInst.heap32[(g0)] = Int32(r2);
        __FUNCTION_TABLE__[(r3)>>2](i7);
        r3 = commonVariable.r_g0;
        if(r3 < 1) {
            __label__ = 40;
            }
        else{
            r3 = 0;
            while(true){
                r7 = Int64(heapClassInst.heap32[(r5)]);
                r7 = r7 >> 2;
                r7 = Int64(heapClassInst.heap32[(r7+23)]);
                r8 = sp + (-1296);
                r9 = sp + (-1280);
                heapClassInst.heap32[(g0)] = Int32(r2);
                heapClassInst.heap32[(g0+1)] = Int32(r3);
                heapClassInst.heap32[(g0+2)] = Int32(r9);
                heapClassInst.heap32[(g0+3)] = Int32(r8);
                __FUNCTION_TABLE__[(r7)>>2](i7);
                r7 = r4 >> 2;
                r9 = r9 >> 2;
                f0 = Float64(heapClassInst.heapFloat[(fp+(-320))]);
                f1 = Float64(heapClassInst.heapFloat[(r7)]);
                f2 = Float64(heapClassInst.heapFloat[(r9+1)]);
                f3 = Float64(heapClassInst.heapFloat[(r7+1)]);
                f4 = Float64(heapClassInst.heapFloat[(r7+4)]);
                f5 = Float64(heapClassInst.heapFloat[(r7+5)]);
                f6 = f1*f0;
                f7 = f3*f2;
                f8 = Float64(heapClassInst.heapFloat[(r9+2)]);
                f9 = Float64(heapClassInst.heapFloat[(r7+2)]);
                f10 = Float64(heapClassInst.heapFloat[(r7+8)]);
                f11 = Float64(heapClassInst.heapFloat[(r7+9)]);
                f12 = Float64(heapClassInst.heapFloat[(r7+6)]);
                f13 = f4*f0;
                f14 = f5*f2;
                f6 = f6+f7;
                f7 = f9*f8;
                f15 = Float64(heapClassInst.heapFloat[(r7+10)]);
                f0 = f10*f0;
                f2 = f11*f2;
                f13 = f13+f14;
                f14 = f12*f8;
                f6 = f6+f7;
                f7 = Float64(heapClassInst.heapFloat[(r7+12)]);
                f16 = Float64(heapClassInst.heapFloat[(r7+14)]);
                f17 = Float64(heapClassInst.heapFloat[(r7+13)]);
                r7 = sp + (-1312);
                f13 = f13+f14;
                f0 = f0+f2;
                f2 = f15*f8;
                f6 = f6+f7;
                f0 = f0+f2;
                r9 = r7 >> 2;
                f2 = f13+f17;
                heapClassInst.heapFloat[(fp+(-328))] = Float32(f6);
                f0 = f0+f16;
                heapClassInst.heapFloat[(r9+1)] = Float32(f2);
                heapClassInst.heapFloat[(r9+2)] = Float32(f0);
                heapClassInst.heap32[(r9+3)] = 0;
                r8 = r8 >> 2;
                f0 = Float64(heapClassInst.heapFloat[(fp+(-324))]);
                f2 = Float64(heapClassInst.heapFloat[(r8+1)]);
                f6 = Float64(heapClassInst.heapFloat[(r8+2)]);
                f1 = f1*f0;
                f3 = f3*f2;
                f4 = f4*f0;
                f5 = f5*f2;
                f1 = f1+f3;
                f3 = f9*f6;
                f1 = f1+f3;
                f0 = f10*f0;
                f2 = f11*f2;
                f3 = f4+f5;
                f4 = f12*f6;
                r8 = sp + (-1328);
                f3 = f3+f4;
                f0 = f0+f2;
                f2 = f15*f6;
                f1 = f1+f7;
                f0 = f0+f2;
                r9 = r8 >> 2;
                f2 = f3+f17;
                heapClassInst.heapFloat[(fp+(-332))] = Float32(f1);
                f0 = f0+f16;
                heapClassInst.heapFloat[(r9+1)] = Float32(f2);
                heapClassInst.heapFloat[(r9+2)] = Float32(f0);
                heapClassInst.heap32[(r9+3)] = 0;
                r9 = Int64(heapClassInst.heap32[(r1)]);
                r9 = r9 >> 2;
                r9 = Int64(heapClassInst.heap32[(r9+4)]);
                heapClassInst.heap32[(g0)] = Int32(r0);
                __FUNCTION_TABLE__[(r9)>>2](i7);
                r10 = commonVariable.r_g0 >> 2;
                r10 = Int64(heapClassInst.heap32[(r10)]);
                r10 = r10 >> 2;
                r10 = Int64(heapClassInst.heap32[(r10+2)]);
                heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
                heapClassInst.heap32[(g0+1)] = Int32(r7);
                heapClassInst.heap32[(g0+2)] = Int32(r8);
                heapClassInst.heap32[(g0+3)] = Int32(r6);
                __FUNCTION_TABLE__[(r10)>>2](i7);
                r7 = Int64(heapClassInst.heap32[(r5)]);
                r7 = r7 >> 2;
                r7 = Int64(heapClassInst.heap32[(r7+22)]);
                r3 = (r3 + 1)|0;
                heapClassInst.heap32[(g0)] = Int32(r2);
                __FUNCTION_TABLE__[(r7)>>2](i7);
                r7 = commonVariable.r_g0;
                if(r7 > r3) {
                    continue 
                }
                else {
                    __label__ = 40;
                    break 
                }
            }
        }
    }
case _ => 
    println("break 10139")
}
} while(false);
match(__label__ ){
case 31 =>
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    __FUNCTION_TABLE__[(r1)>>2](i7);
    return;
case 40 =>
    return;
case _ => 
    println("break 10150")
}
}

func _ZNK16btCollisionWorld7rayTestERK9btVector3S2_RNS_17RayResultCallbackE(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-280);
var g0 = i7>>2; 
    r0 = _ZTV19btSingleRayCallback;
    r1 = Int64(heapClassInst.heap32[(fp+1)]);
    r0 = (r0 + 8)|0;
    r2 = sp + (-256);
    r3 = r1 >> 2;
    heapClassInst.heap32[(fp+(-64))] = Int32(r0);
    r0 = r2 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r3)]);
    heapClassInst.heapFloat[(r0+9)] = Float32(f0);
    f1 = Float64(heapClassInst.heapFloat[(r3+1)]);
    heapClassInst.heapFloat[(r0+10)] = Float32(f1);
    f2 = Float64(heapClassInst.heapFloat[(r3+2)]);
    heapClassInst.heapFloat[(r0+11)] = Float32(f2);
    r4 = Int64(heapClassInst.heap32[(fp+2)]);
    f3 = Float64(heapClassInst.heapFloat[(r3+3)]);
    r3 = r4 >> 2;
    heapClassInst.heapFloat[(r0+12)] = Float32(f3);
    f4 = Float64(heapClassInst.heapFloat[(r3)]);
    heapClassInst.heapFloat[(r0+13)] = Float32(f4);
    f5 = Float64(heapClassInst.heapFloat[(r3+1)]);
    heapClassInst.heapFloat[(r0+14)] = Float32(f5);
    f6 = Float64(heapClassInst.heapFloat[(r3+2)]);
    heapClassInst.heapFloat[(r0+15)] = Float32(f6);
    f7 = Float64(heapClassInst.heapFloat[(r3+3)]);
    r3 = Int64(heapClassInst.heap32[(fp)]);
    heapClassInst.heapFloat[(r0+16)] = Float32(f7);
    r5 = Int64(heapClassInst.heap32[(fp+3)]);
    heapClassInst.heap32[(r0+53)] = Int32(r3);
    heapClassInst.heap32[(r0+54)] = Int32(r5);
    heapClassInst.heap32[(r0+17)] = 1065353216;
    heapClassInst.heap32[(r0+18)] = 0;
    heapClassInst.heap32[(r0+19)] = 0;
    heapClassInst.heap32[(r0+20)] = 0;
    heapClassInst.heap32[(r0+21)] = 0;
    heapClassInst.heap32[(r0+22)] = 1065353216;
    heapClassInst.heap32[(r0+23)] = 0;
    heapClassInst.heap32[(r0+24)] = 0;
    heapClassInst.heap32[(r0+25)] = 0;
    heapClassInst.heap32[(r0+26)] = 0;
    heapClassInst.heap32[(r0+27)] = 1065353216;
    heapClassInst.heap32[(r0+28)] = 0;
    heapClassInst.heapFloat[(r0+29)] = Float32(f0);
    heapClassInst.heapFloat[(r0+30)] = Float32(f1);
    heapClassInst.heapFloat[(r0+31)] = Float32(f2);
    heapClassInst.heapFloat[(r0+32)] = Float32(f3);
    heapClassInst.heap32[(r0+33)] = 1065353216;
    heapClassInst.heap32[(r0+34)] = 0;
    heapClassInst.heap32[(r0+35)] = 0;
    heapClassInst.heap32[(r0+36)] = 0;
    heapClassInst.heap32[(r0+37)] = 0;
    heapClassInst.heap32[(r0+38)] = 1065353216;
    heapClassInst.heap32[(r0+39)] = 0;
    heapClassInst.heap32[(r0+40)] = 0;
    heapClassInst.heap32[(r0+41)] = 0;
    heapClassInst.heap32[(r0+42)] = 0;
    heapClassInst.heap32[(r0+43)] = 1065353216;
    heapClassInst.heap32[(r0+44)] = 0;
    heapClassInst.heapFloat[(r0+45)] = Float32(f4);
    f0 = f4-f0;
    heapClassInst.heapFloat[(r0+46)] = Float32(f5);
    f1 = f5-f1;
    heapClassInst.heapFloat[(r0+47)] = Float32(f6);
    f2 = f6-f2;
    f3 = f0*f0;
    f4 = f1*f1;
    heapClassInst.heapFloat[(r0+48)] = Float32(f7);
    f3 = f3+f4;
    f4 = f2*f2;
    f3 = f3+f4;
    heapClassInst.heapFloat[(g0)] = Float32(f3);
    f3 =                         1.0;
    sqrtf(i7);
    f4 = f3/commonVariable.f_g0;
    f0 = f0*f4;
    f1 = f1*f4;
    f2 = f2*f4;
    f4 =                         0.0;
    if(f0 != f4) 
{
    f5 = f3/f0;
}
else{
    f5 =        999999984306749440.0;
}
    heapClassInst.heapFloat[(r0+1)] = Float32(f5);
    if(f1 != f4) 
{
    f6 = f3/f1;
}
else{
    f6 =        999999984306749440.0;
}
    heapClassInst.heapFloat[(r0+2)] = Float32(f6);
    if(f2 != f4) 
{
    f3 = f3/f2;
}
else{
    f3 =        999999984306749440.0;
}
    r5 = if (f5 < f4) {1} else {0};
    r6 = if (f6 < f4) {1} else {0};
    r5 = r5 & 1;
    heapClassInst.heapFloat[(r0+3)] = Float32(f3);
    r7 = if (f3 < f4) {1} else {0};
    r6 = r6 & 1;
    heapClassInst.heap32[(r0+5)] = Int32(r5);
    r5 = r7 & 1;
    heapClassInst.heap32[(r0+6)] = Int32(r6);
    heapClassInst.heap32[(r0+7)] = Int32(r5);
    f3 = Float64(heapClassInst.heapFloat[(r0+14)]);
    f4 = Float64(heapClassInst.heapFloat[(r0+10)]);
    f5 = Float64(heapClassInst.heapFloat[(r0+13)]);
    f6 = Float64(heapClassInst.heapFloat[(r0+9)]);
    f5 = f5-f6;
    f3 = f3-f4;
    f4 = Float64(heapClassInst.heapFloat[(r0+15)]);
    f6 = Float64(heapClassInst.heapFloat[(r0+11)]);
    f0 = f0*f5;
    f1 = f1*f3;
    f3 = f4-f6;
    f0 = f0+f1;
    f1 = f2*f3;
    f0 = f0+f1;
    r3 = r3 >> 2;
    heapClassInst.heapFloat[(r0+8)] = Float32(f0);
    r0 = Int64(heapClassInst.heap32[(r3+20)]);
    r3 = r0 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+6)]);
    r5 = sp + (-32);
    r6 = r5 >> 2;
    heapClassInst.heap32[(fp+(-8))] = 0;
    heapClassInst.heap32[(r6+1)] = 0;
    heapClassInst.heap32[(r6+2)] = 0;
    r7 = sp + (-16);
    heapClassInst.heap32[(r6+3)] = 0;
    r6 = r7 >> 2;
    heapClassInst.heap32[(fp+(-4))] = 0;
    heapClassInst.heap32[(r6+1)] = 0;
    heapClassInst.heap32[(r6+2)] = 0;
    heapClassInst.heap32[(r6+3)] = 0;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = Int32(r4);
    heapClassInst.heap32[(g0+3)] = Int32(r2);
    heapClassInst.heap32[(g0+4)] = Int32(r7);
    heapClassInst.heap32[(g0+5)] = Int32(r5);
    __FUNCTION_TABLE__[(r3)>>2](i7);
    return;
}

func _ZN16btCollisionWorld18addCollisionObjectEP17btCollisionObjectss(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
var __label__ = 0;
    i7 = sp + (-136);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp+1)]);
    if(r0 != 0) 
{
    r1 = Int64(heapClassInst.heap32[(fp)]);
    r2 = Int64(heapClassInst.heap32[(fp+2)]);
    r3 = Int64(heapClassInst.heap32[(fp+3)]);
    r4 = r1 >> 2;
    r5 = Int64(heapClassInst.heap32[(r4+2)]);
    r6 = 0;
while(true){
    if(r5 > r6) 
{
    r7 = Int64(heapClassInst.heap32[(r4+4)]);
    r8 = r6 << 2;
    r7 = (r7 + r8)|0;
    r7 = r7 >> 2;
    r7 = Int64(heapClassInst.heap32[(r7)]);
    if(r7 == r0) 
{
__label__ = 6;
break 
}
else{
    r6 = (r6 + 1)|0;
}
}
else{
__label__ = 8;
break 
}
}
if (__label__ == 6){
if(!(r5 == r6)) 
{
    r0 = _E2_str988;
    r1 = _E2_str887;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = 114;
    _assert(i7);
}
}
    r6 = Int64(heapClassInst.heap32[(r4+3)]);
    if(r6 == r5) 
{
    r7 = 1;
    r8 = r5 << 1;
    r8 = if (r5 == 0) {r7} else {r8};
if(!(r6 >= r8)) 
{
    if(r8 != 0) 
{
    r6 = gNumAlignedAllocs;
    r6 = r6 >> 2;
    r9 = Int64(heapClassInst.heap32[(r6)]);
    r10 = r8 << 2;
    r9 = (r9 + 1)|0;
    r10 = r10 | 3;
    heapClassInst.heap32[(r6)] = Int32(r9);
    r6 = (r10 + 16)|0;
    heapClassInst.heap32[(g0)] = Int32(r6);
    mallocNew(i7);
    r6 = commonVariable.r_g0;
    if(r6 != 0) 
{
    r9 = 0;
    r10 = (r6 + 4)|0;
    r9 = (r9 - r10)|0;
    r9 = r9 & 15;
    r9 = (r6 + r9)|0;
    r10 = (r9 + 4)|0;
    r9 = r9 >> 2;
    heapClassInst.heap32[(r9)] = Int32(r6);
    r6 = r10;
}
}
else{
    r6 = 0;
}

do {
    if(r5 < 1) 
{
    r10 = Int64(heapClassInst.heap32[(r4+4)]);
}
else{
    r9 = 0;
while(true){
    r10 = Int64(heapClassInst.heap32[(r4+4)]);
    r11 = r9 << 2;
    r12 = (r10 + r11)|0;
    r12 = r12 >> 2;
    r11 = (r6 + r11)|0;
    r12 = Int64(heapClassInst.heap32[(r12)]);
    r9 = (r9 + 1)|0;
    r11 = r11 >> 2;
    heapClassInst.heap32[(r11)] = Int32(r12);
if(!(r5 != r9)) 
{
break 
}
}
}
} while(false);
    if(r10 != 0) 
{
    r9 = Int64(heapClassInst.heapU8[r1+20]);
    if(r9 != 0) 
{
    r5 = gNumAlignedFree;
    r5 = r5 >> 2;
    r9 = Int64(heapClassInst.heap32[(r5)]);
    r9 = (r9 + 1)|0;
    r10 = r10 >> 2;
    heapClassInst.heap32[(r5)] = Int32(r9);
    r5 = Int64(heapClassInst.heap32[(r10+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r5);
    free(i7);
    r5 = Int64(heapClassInst.heap32[(r4+2)]);
}
    heapClassInst.heap32[(r4+4)] = 0;
}
    heapClassInst.heap8[r1+20] = Int8(r7);
    heapClassInst.heap32[(r4+4)] = Int32(r6);
    heapClassInst.heap32[(r4+3)] = Int32(r8);
}
}
    r1 = r5 << 2;
    r5 = Int64(heapClassInst.heap32[(r4+4)]);
    r1 = (r5 + r1)|0;
    r1 = r1 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r0);
    r1 = Int64(heapClassInst.heap32[(r4+2)]);
    r1 = (r1 + 1)|0;
    r5 = sp + (-64);
    r6 = r0 >> 2;
    heapClassInst.heap32[(r4+2)] = Int32(r1);
    r1 = r5 >> 2;
    heapClassInst.heap32[(fp+(-16))] = heapClassInst.heap32[(r6+1)];
    heapClassInst.heap32[(r1+1)] = heapClassInst.heap32[(r6+2)];
    heapClassInst.heap32[(r1+2)] = heapClassInst.heap32[(r6+3)];
    heapClassInst.heap32[(r1+3)] = heapClassInst.heap32[(r6+4)];
    heapClassInst.heap32[(r1+4)] = heapClassInst.heap32[(r6+5)];
    heapClassInst.heap32[(r1+5)] = heapClassInst.heap32[(r6+6)];
    heapClassInst.heap32[(r1+6)] = heapClassInst.heap32[(r6+7)];
    heapClassInst.heap32[(r1+7)] = heapClassInst.heap32[(r6+8)];
    heapClassInst.heap32[(r1+8)] = heapClassInst.heap32[(r6+9)];
    heapClassInst.heap32[(r1+9)] = heapClassInst.heap32[(r6+10)];
    heapClassInst.heap32[(r1+10)] = heapClassInst.heap32[(r6+11)];
    heapClassInst.heap32[(r1+11)] = heapClassInst.heap32[(r6+12)];
    heapClassInst.heap32[(r1+12)] = heapClassInst.heap32[(r6+13)];
    heapClassInst.heap32[(r1+13)] = heapClassInst.heap32[(r6+14)];
    heapClassInst.heap32[(r1+14)] = heapClassInst.heap32[(r6+15)];
    heapClassInst.heap32[(r1+15)] = heapClassInst.heap32[(r6+16)];
    r1 = Int64(heapClassInst.heap32[(r6+48)]);
    r7 = r1 >> 2;
    r7 = Int64(heapClassInst.heap32[(r7)]);
    r7 = r7 >> 2;
    r7 = Int64(heapClassInst.heap32[(r7+2)]);
    r8 = sp + (-80);
    r9 = sp + (-96);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0+1)] = Int32(r5);
    heapClassInst.heap32[(g0+2)] = Int32(r8);
    heapClassInst.heap32[(g0+3)] = Int32(r9);
    __FUNCTION_TABLE__[(r7)>>2](i7);
    r1 = Int64(heapClassInst.heap32[(r4+20)]);
    r5 = r1 >> 2;
    r7 = Int64(heapClassInst.heap32[(r6+48)]);
    r5 = Int64(heapClassInst.heap32[(r5)]);
    r5 = r5 >> 2;
    r7 = r7 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5+2)]);
    r7 = Int64(heapClassInst.heap32[(r7+1)]);
    r4 = Int64(heapClassInst.heap32[(r4+6)]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0+1)] = Int32(r8);
    heapClassInst.heap32[(g0+2)] = Int32(r9);
    heapClassInst.heap32[(g0+3)] = Int32(r7);
    heapClassInst.heap32[(g0+4)] = Int32(r0);
    heapClassInst.heap32[(g0+5)] = Int32(r2);
    heapClassInst.heap32[(g0+6)] = Int32(r3);
    heapClassInst.heap32[(g0+7)] = Int32(r4);
    heapClassInst.heap32[(g0+8)] = 0;
    __FUNCTION_TABLE__[(r5)>>2](i7);
    heapClassInst.heap32[(r6+47)] = Int32(commonVariable.r_g0);
    return;
}
else{
    r0 = _E2_str786;
    r1 = _E2_str887;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = 111;
    _assert(i7);
}
}

func _ZN16btCollisionWorld21removeCollisionObjectEP17btCollisionObject(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
var __label__ = 0;
    i7 = sp + (-16);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp+1)]);
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1+47)]);
    r3 = Int64(heapClassInst.heap32[(fp)]);
if(!(r2 == 0)) 
{
    r4 = r3 >> 2;
    r5 = Int64(heapClassInst.heap32[(r4+20)]);
    r6 = r5 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6)]);
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6+9)]);
    heapClassInst.heap32[(g0)] = Int32(r5);
    __FUNCTION_TABLE__[(r6)>>2](i7);
    r6 = commonVariable.r_g0 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6)]);
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6+10)]);
    r7 = Int64(heapClassInst.heap32[(r4+6)]);
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r2);
    heapClassInst.heap32[(g0+2)] = Int32(r7);
    __FUNCTION_TABLE__[(r6)>>2](i7);
    r5 = Int64(heapClassInst.heap32[(r4+20)]);
    r6 = r5 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6)]);
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6+3)]);
    r4 = Int64(heapClassInst.heap32[(r4+6)]);
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0+1)] = Int32(r2);
    heapClassInst.heap32[(g0+2)] = Int32(r4);
    __FUNCTION_TABLE__[(r6)>>2](i7);
    heapClassInst.heap32[(r1+47)] = 0;
}
    r1 = r3 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1+2)]);
    r3 = 0;
while(true){
    if(r2 > r3) 
{
    r4 = Int64(heapClassInst.heap32[(r1+4)]);
    r5 = r3 << 2;
    r4 = (r4 + r5)|0;
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4)]);
    if(r4 != r0) 
{
    r3 = (r3 + 1)|0;
continue 
}
else{
__label__ = 7;
break 
}
}
else{
__label__ = 6;
break 
}
}
if (__label__ == 6){
    r3 = r2;
}
if(!(r2 <= r3)) 
{
    r0 = (r2 + (-1))|0;
    r2 = r3 << 2;
    r3 = Int64(heapClassInst.heap32[(r1+4)]);
    r0 = r0 << 2;
    r2 = (r3 + r2)|0;
    r3 = (r3 + r0)|0;
    r2 = r2 >> 2;
    r3 = r3 >> 2;
    r4 = Int64(heapClassInst.heap32[(r2)]);
    r3 = Int64(heapClassInst.heap32[(r3)]);
    heapClassInst.heap32[(r2)] = Int32(r3);
    r2 = Int64(heapClassInst.heap32[(r1+4)]);
    r0 = (r2 + r0)|0;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r0)] = Int32(r4);
    r0 = Int64(heapClassInst.heap32[(r1+2)]);
    r0 = (r0 + (-1))|0;
    heapClassInst.heap32[(r1+2)] = Int32(r0);
}
    return;
}

func _ZN16btCollisionWorld33performDiscreteCollisionDetectionEv(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-40);
var g0 = i7>>2; 
    r0 = _E2_str1190;
    r1 = Int64(heapClassInst.heap32[(fp)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    r0 = r1 >> 2;
    r2 = Int64(heapClassInst.heap32[(r0)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+2)]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    __FUNCTION_TABLE__[(r2)>>2](i7);
    r2 = _E2_str1291;
    heapClassInst.heap32[(g0)] = Int32(r2);
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    r2 = Int64(heapClassInst.heap32[(r0+20)]);
    r3 = r2 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+8)]);
    r4 = Int64(heapClassInst.heap32[(r0+6)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0+1)] = Int32(r4);
    r2 = _ZN15CProfileManager11CurrentNodeE;
    __FUNCTION_TABLE__[(r3)>>2](i7);
    r2 = r2 >> 2;
    r3 = Int64(heapClassInst.heap32[(r2)]);
    r4 = r3 >> 2;
    r5 = Int64(heapClassInst.heap32[(r4+4)]);
    r5 = (r5 + (-1))|0;
    heapClassInst.heap32[(r4+4)] = Int32(r5);
do {
if(!(r5 != 0)) 
{
    r5 = Int64(heapClassInst.heap32[(r4+1)]);
    if(r5 != 0) 
{
    r3 = sp + (-24);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = 0;
    r5 = _ZL13gProfileClock_2E_0;
    gettimeofday(i7);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5)]);
    r5 = r5 >> 2;
    r3 = r3 >> 2;
    r6 = Int64(heapClassInst.heap32[(fp+(-6))]);
    r7 = Int64(heapClassInst.heap32[(r5)]);
    r6 = (r6 - r7)|0;
    r3 = Int64(heapClassInst.heap32[(r3+1)]);
    r5 = Int64(heapClassInst.heap32[(r5+1)]);
    r3 = (r3 - r5)|0;
    r5 = (r6 * 1000000)|0;
    r3 = (r3 + r5)|0;
    r5 = Int64(heapClassInst.heap32[(r4+3)]);
    r3 = (r3 - r5)|0;
    f0 = Float64(`UIntNative`(r3)); 
    f1 =                      1000.0;
    f2 = Float64(heapClassInst.heapFloat[(r4+2)]);
    f0 = f0/f1;
    f0 = f2+f0;
    heapClassInst.heapFloat[(r4+2)] = Float32(f0);
    r3 = Int64(heapClassInst.heap32[(r4+4)]);
    if(r3 != 0) 
{
break 
}
else{
    r3 = Int64(heapClassInst.heap32[(r2)]);
}
}
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+5)]);
    heapClassInst.heap32[(r2)] = Int32(r3);
}
} while(false);
    r3 = Int64(heapClassInst.heap32[(r0+6)]);
    r4 = _E2_str1392;
    heapClassInst.heap32[(g0)] = Int32(r4);
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
if(!(r3 == 0)) 
{
    r4 = Int64(heapClassInst.heap32[(r0+20)]);
    r5 = r3 >> 2;
    r6 = r4 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5)]);
    r6 = Int64(heapClassInst.heap32[(r6)]);
    r5 = r5 >> 2;
    r6 = r6 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5+8)]);
    r0 = Int64(heapClassInst.heap32[(r0+6)]);
    r6 = Int64(heapClassInst.heap32[(r6+9)]);
    heapClassInst.heap32[(g0)] = Int32(r4);
    __FUNCTION_TABLE__[(r6)>>2](i7);
    r1 = (r1 + 28)|0;
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+2)] = Int32(r1);
    heapClassInst.heap32[(g0+3)] = Int32(r0);
    __FUNCTION_TABLE__[(r5)>>2](i7);
}
    r0 = Int64(heapClassInst.heap32[(r2)]);
    r1 = r0 >> 2;
    r3 = Int64(heapClassInst.heap32[(r1+4)]);
    r3 = (r3 + (-1))|0;
    heapClassInst.heap32[(r1+4)] = Int32(r3);
do {
    if(r3 == 0) 
{
    r3 = Int64(heapClassInst.heap32[(r1+1)]);
    if(r3 != 0) 
{
    r0 = sp + (-16);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = 0;
    r3 = _ZL13gProfileClock_2E_0;
    gettimeofday(i7);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r0 = r0 >> 2;
    r4 = Int64(heapClassInst.heap32[(fp+(-4))]);
    r5 = Int64(heapClassInst.heap32[(r3)]);
    r4 = (r4 - r5)|0;
    r0 = Int64(heapClassInst.heap32[(r0+1)]);
    r3 = Int64(heapClassInst.heap32[(r3+1)]);
    r0 = (r0 - r3)|0;
    r3 = (r4 * 1000000)|0;
    r0 = (r0 + r3)|0;
    r3 = Int64(heapClassInst.heap32[(r1+3)]);
    r0 = (r0 - r3)|0;
    f0 = Float64(`UIntNative`(r0)); 
    f1 =                      1000.0;
    f2 = Float64(heapClassInst.heapFloat[(r1+2)]);
    f0 = f0/f1;
    f0 = f2+f0;
    heapClassInst.heapFloat[(r1+2)] = Float32(f0);
    r0 = Int64(heapClassInst.heap32[(r2)]);
    r1 = Int64(heapClassInst.heap32[(r1+4)]);
if(!(r1 == 0)) 
{
break 
}
}
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0+5)]);
    heapClassInst.heap32[(r2)] = Int32(r0);
}
} while(false);
    r1 = r0 >> 2;
    r3 = Int64(heapClassInst.heap32[(r1+4)]);
    r3 = (r3 + (-1))|0;
    heapClassInst.heap32[(r1+4)] = Int32(r3);
do {
if(!(r3 != 0)) 
{
    r3 = Int64(heapClassInst.heap32[(r1+1)]);
    if(r3 != 0) 
{
    r0 = sp + (-8);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = 0;
    r3 = _ZL13gProfileClock_2E_0;
    gettimeofday(i7);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r0 = r0 >> 2;
    r4 = Int64(heapClassInst.heap32[(fp+(-2))]);
    r5 = Int64(heapClassInst.heap32[(r3)]);
    r4 = (r4 - r5)|0;
    r0 = Int64(heapClassInst.heap32[(r0+1)]);
    r3 = Int64(heapClassInst.heap32[(r3+1)]);
    r0 = (r0 - r3)|0;
    r3 = (r4 * 1000000)|0;
    r0 = (r0 + r3)|0;
    r3 = Int64(heapClassInst.heap32[(r1+3)]);
    r0 = (r0 - r3)|0;
    f0 = Float64(`UIntNative`(r0)); 
    f1 =                      1000.0;
    f2 = Float64(heapClassInst.heapFloat[(r1+2)]);
    f0 = f0/f1;
    f0 = f2+f0;
    heapClassInst.heapFloat[(r1+2)] = Float32(f0);
    r0 = Int64(heapClassInst.heap32[(r1+4)]);
    if(r0 != 0) 
{
break 
}
else{
    r0 = Int64(heapClassInst.heap32[(r2)]);
}
}
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0+5)]);
    heapClassInst.heap32[(r2)] = Int32(r0);
}
} while(false);
    return;
}

func _ZN16btCollisionWorld9serializeEP12btSerializer(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp+1)]);
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+8)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r2)>>2](i7);
    r2 = Int64(heapClassInst.heap32[(fp)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0+1)] = Int32(r0);
    _ZN16btCollisionWorld25serializeCollisionObjectsEP12btSerializer(i7);
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+9)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r1)>>2](i7);
    return;
}

func _ZN21btSingleSweepCallbackD0Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV21btSingleSweepCallback;
    r2 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
    return;
}

func _ZN21btSingleSweepCallbackD1Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV21btSingleSweepCallback;
    r0 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r0)] = Int32(r1);
    return;
}

func _ZN21btSingleSweepCallback7processEPK17btBroadphaseProxy(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-32);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1+46)]);
    r3 = r2 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r3+1)]);
    f1 =                         0.0;
    if(f0 != f1) 
{
    r4 = Int64(heapClassInst.heap32[(fp+1)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4)]);
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r5 = r4 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+2)]);
    r6 = Int64(heapClassInst.heap32[(r5+47)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0+1)] = Int32(r6);
    __FUNCTION_TABLE__[(r3)>>2](i7);
    r2 = commonVariable.r_g0;
    if(r2 != 0) 
{
    f0 = Float64(heapClassInst.heapFloat[(r1+47)]);
    r2 = Int64(heapClassInst.heap32[(r1+46)]);
    r3 = Int64(heapClassInst.heap32[(r5+48)]);
    r1 = Int64(heapClassInst.heap32[(r1+48)]);
    r5 = (r0 + 36)|0;
    r0 = (r0 + 100)|0;
    r6 = (r4 + 4)|0;
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0+1)] = Int32(r5);
    heapClassInst.heap32[(g0+2)] = Int32(r0);
    heapClassInst.heap32[(g0+3)] = Int32(r4);
    heapClassInst.heap32[(g0+4)] = Int32(r3);
    heapClassInst.heap32[(g0+5)] = Int32(r6);
    heapClassInst.heap32[(g0+6)] = Int32(r2);
    heapClassInst.heapFloat[(g0+7)] = Float32(f0);
    _ZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEf(i7);
    r0 = 1;
    commonVariable.r_g0 = r0;
    return;
}
else{
    r0 = 1;
}
}
else{
    r0 = 0;
}
    r0 = r0 & 255;
    commonVariable.r_g0 = r0;
    return;
}

func _ZN19btSingleRayCallbackD0Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV19btSingleRayCallback;
    r2 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
    return;
}

func _ZN19btSingleRayCallbackD1Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV19btSingleRayCallback;
    r0 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r0)] = Int32(r1);
    return;
}

func _ZN19btSingleRayCallback7processEPK17btBroadphaseProxy(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-24);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1+54)]);
    r3 = r2 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r3+1)]);
    f1 =                         0.0;
    if(f0 != f1) 
{
    r4 = Int64(heapClassInst.heap32[(fp+1)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4)]);
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r5 = r4 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+2)]);
    r6 = Int64(heapClassInst.heap32[(r5+47)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0+1)] = Int32(r6);
    __FUNCTION_TABLE__[(r3)>>2](i7);
    r2 = commonVariable.r_g0;
    if(r2 != 0) 
{
    r1 = Int64(heapClassInst.heap32[(r1+54)]);
    r2 = Int64(heapClassInst.heap32[(r5+48)]);
    r3 = (r0 + 68)|0;
    r0 = (r0 + 132)|0;
    r5 = (r4 + 4)|0;
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r0);
    heapClassInst.heap32[(g0+2)] = Int32(r4);
    heapClassInst.heap32[(g0+3)] = Int32(r2);
    heapClassInst.heap32[(g0+4)] = Int32(r5);
    heapClassInst.heap32[(g0+5)] = Int32(r1);
    _ZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackE(i7);
    r0 = 1;
    commonVariable.r_g0 = r0;
    return;
}
else{
    r0 = 1;
}
}
else{
    r0 = 0;
}
    r0 = r0 & 255;
    commonVariable.r_g0 = r0;
    return;
}

func _ZN16btCollisionWorldD2Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
var __label__ = 0;
    i7 = sp + (-16);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV16btCollisionWorld;
    r2 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    r1 = Int64(heapClassInst.heap32[(r2+4)]);
    r3 = Int64(heapClassInst.heap32[(r2+2)]);
    if(r3 > 0) 
{
    r3 = 0;
while(true){
    r4 = r3 << 2;
    r1 = (r1 + r4)|0;
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r4 = Int64(heapClassInst.heap32[(r1+47)]);
if(!(r4 == 0)) 
{
    r5 = Int64(heapClassInst.heap32[(r2+20)]);
    r6 = r5 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6)]);
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6+9)]);
    heapClassInst.heap32[(g0)] = Int32(r5);
    __FUNCTION_TABLE__[(r6)>>2](i7);
    r6 = commonVariable.r_g0 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6)]);
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6+10)]);
    r7 = Int64(heapClassInst.heap32[(r2+6)]);
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0+1)] = Int32(r4);
    heapClassInst.heap32[(g0+2)] = Int32(r7);
    __FUNCTION_TABLE__[(r6)>>2](i7);
    r5 = Int64(heapClassInst.heap32[(r2+20)]);
    r6 = r5 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6)]);
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6+3)]);
    r7 = Int64(heapClassInst.heap32[(r2+6)]);
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0+1)] = Int32(r4);
    heapClassInst.heap32[(g0+2)] = Int32(r7);
    __FUNCTION_TABLE__[(r6)>>2](i7);
    heapClassInst.heap32[(r1+47)] = 0;
}
    r3 = (r3 + 1)|0;
    r1 = Int64(heapClassInst.heap32[(r2+4)]);
    r4 = Int64(heapClassInst.heap32[(r2+2)]);
    if(r4 > r3) 
{
continue 
}
else{
break 
}
}
}
if(!(r1 == 0)) 
{
    r3 = Int64(heapClassInst.heapU8[r0+20]);
if(!(r3 == 0)) 
{
    r3 = gNumAlignedFree;
    r3 = r3 >> 2;
    r4 = Int64(heapClassInst.heap32[(r3)]);
    r4 = (r4 + 1)|0;
    r1 = r1 >> 2;
    heapClassInst.heap32[(r3)] = Int32(r4);
    r1 = Int64(heapClassInst.heap32[(r1+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    free(i7);
}
    heapClassInst.heap32[(r2+4)] = 0;
}
    r1 = 1;
    heapClassInst.heap8[r0+20] = Int8(r1);
    heapClassInst.heap32[(r2+4)] = 0;
    heapClassInst.heap32[(r2+2)] = 0;
    heapClassInst.heap32[(r2+3)] = 0;
    return;
}

func _ZN16btCollisionWorld25serializeCollisionObjectsEP12btSerializer(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var r16: Int64 = 0
    var r17: Int64 = 0
    var r18: Int64 = 0
    var r19: Int64 = 0
    var r20: Int64 = 0
    var r21: Int64 = 0
    var r22: Int64 = 0
    var r23: Int64 = 0
    var r24: Int64 = 0
    var r25: Int64 = 0
var __label__ = 0;
    i7 = sp + (-16);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0+2)]);
if(!(r1 < 1)) 
{
    r1 = Int64(heapClassInst.heap32[(fp+1)]);
    heapClassInst.heap32[(fp+(-2))] = Int32(r1);
    r1 = 0;
while(true){
    r2 = Int64(heapClassInst.heap32[(r0+4)]);
    r3 = r1 << 2;
    r2 = (r2 + r3)|0;
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2)]);
    r3 = r2 >> 2;
    r4 = Int64(heapClassInst.heap32[(r3+58)]);
if(!(r4 != 1)) 
{
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+6)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    r2 = Int64(heapClassInst.heap32[(fp+(-2))]);
    heapClassInst.heap32[(g0+1)] = Int32(r2);
    __FUNCTION_TABLE__[(r3)>>2](i7);
}
    r1 = (r1 + 1)|0;
    r2 = Int64(heapClassInst.heap32[(r0+2)]);
if(!(r2 > r1)) 
{
break 
}
}
if(!(r2 < 1)) 
{
    r1 = 0;
    r2 = r1;
    r3 = r1;
    r4 = r1;
    r5 = r1;
    r6 = r1;
    heapClassInst.heap32[(fp+(-1))] = Int32(r1);
    r7 = r1;
    r8 = r1;
    r9 = r1;
    r10 = r1;
    r11 = r1;
    r12 = r1;
while(true){
    r13 = Int64(heapClassInst.heap32[(r0+4)]);
    r14 = r12 << 2;
    r13 = (r13 + r14)|0;
    r13 = r13 >> 2;
    r13 = Int64(heapClassInst.heap32[(r13)]);
    r13 = r13 >> 2;
    r13 = Int64(heapClassInst.heap32[(r13+48)]);
    r14 = r13 << 15;
    r14 = r14 ^ ( -1);
    r14 = (r13 + r14)|0;
    r15 = r14 >> 10;
    r14 = r15 ^ r14;
    r14 = (r14 * 9)|0;
    r15 = r14 >> 6;
    r14 = r15 ^ r14;
    r15 = r14 << 11;
    r15 = r15 ^ ( -1);
    r14 = (r14 + r15)|0;
    r15 = r14 >> 16;
    r14 = r15 ^ r14;
    r15 = (r4 + (-1))|0;
    r15 = r14 & r15;
    r12 = (r12 + 1)|0;
do {
    if(`UIntNative`(r10) <= `UIntNative`(r15)) 
{
__label__ = 19;
}
else{
    r16 = r15 << 2;
    r17 = (r8 + r16)|0;
while(true){
    r17 = r17 >> 2;
    r17 = Int64(heapClassInst.heap32[(r17)]);
    if(r17 == ( -1)) 
{
__label__ = 13;
break 
}
else{
    r18 = r17 << 3;
    r18 = (r11 + r18)|0;
    r18 = r18 >> 2;
    r18 = Int64(heapClassInst.heap32[(r18)]);
    if(r13 != r18) 
{
    r17 = r17 << 2;
    r17 = (r6 + r17)|0;
}
else{
__label__ = 12;
break 
}
}
}
if (__label__ == 12){
    r17 = r17 << 2;
    r17 = (r3 + r17)|0;
if(!(r17 == 0)) 
{
__label__ = 89;
break 
}
}
    if(`UIntNative`(r10) <= `UIntNative`(r15)) 
{
__label__ = 19;
}
else{
    r16 = (r8 + r16)|0;
while(true){
    r16 = r16 >> 2;
    r16 = Int64(heapClassInst.heap32[(r16)]);
    if(r16 == ( -1)) 
{
__label__ = 19;
break 
}
else{
    r17 = r16 << 3;
    r17 = (r11 + r17)|0;
    r17 = r17 >> 2;
    r17 = Int64(heapClassInst.heap32[(r17)]);
    if(r13 != r17) 
{
    r16 = r16 << 2;
    r16 = (r6 + r16)|0;
}
else{
break 
}
}
}
    r14 = r16 << 2;
    r14 = (r3 + r14)|0;
    r14 = r14 >> 2;
    heapClassInst.heap32[(r14)] = Int32(r13);
    r16 = r4;
    r17 = r5;
__label__ = 88;
}
}
} while(false);
if (__label__ == 19){
    if(r4 == r5) 
{
    r16 = 1;
    r17 = r5 << 1;
    r16 = if (r5 == 0) {r16} else {r17};
    if(r4 >= r16) 
{
__label__ = 20;
}
else{
    if(r16 != 0) 
{
    r17 = gNumAlignedAllocs;
    r17 = r17 >> 2;
    r18 = Int64(heapClassInst.heap32[(r17)]);
    r19 = r16 << 2;
    r18 = (r18 + 1)|0;
    r19 = r19 | 3;
    heapClassInst.heap32[(r17)] = Int32(r18);
    r17 = (r19 + 16)|0;
    heapClassInst.heap32[(g0)] = Int32(r17);
    mallocNew(i7);
    r17 = commonVariable.r_g0;
    if(r17 != 0) 
{
    r18 = 0;
    r19 = (r17 + 4)|0;
    r18 = (r18 - r19)|0;
    r18 = r18 & 15;
    r18 = (r17 + r18)|0;
    r19 = (r18 + 4)|0;
    r18 = r18 >> 2;
    heapClassInst.heap32[(r18)] = Int32(r17);
    r17 = r19;
}
}
else{
    r17 = 0;
}
do {
if(!(r5 < 1)) 
{
    r18 = r17;
    r19 = r3;
    r20 = r5;
while(true){
    r21 = r19 >> 2;
    r20 = (r20 + (-1))|0;
    r19 = (r19 + 4)|0;
    r22 = (r18 + 4)|0;
    r18 = r18 >> 2;
    r21 = Int64(heapClassInst.heap32[(r21)]);
    heapClassInst.heap32[(r18)] = Int32(r21);
    r18 = r22;
if(!(r20 != 0)) 
{
break 
}
}
}
} while(false);
    if(r3 != 0) 
{
    r18 = gNumAlignedFree;
    r18 = r18 >> 2;
    r19 = Int64(heapClassInst.heap32[(r18)]);
    r19 = (r19 + 1)|0;
    r3 = r3 >> 2;
    heapClassInst.heap32[(r18)] = Int32(r19);
    r3 = Int64(heapClassInst.heap32[(r3+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r3);
    free(i7);
    r3 = r17;
__label__ = 32;
}
else{
    r3 = r17;
__label__ = 32;
}
}
}
else{
__label__ = 20;
}
if (__label__ == 20){
    r16 = r4;
}
    r18 = r5 << 2;
    r19 = (r3 + r18)|0;
    r17 = (r5 + 1)|0;
    r19 = r19 >> 2;
    heapClassInst.heap32[(r19)] = Int32(r13);
    if(r1 == r2) 
{
    r19 = 1;
    r20 = r2 << 1;
    r19 = if (r2 == 0) {r19} else {r20};
if(!(r1 >= r19)) 
{
    if(r19 != 0) 
{
    r1 = gNumAlignedAllocs;
    r1 = r1 >> 2;
    r20 = Int64(heapClassInst.heap32[(r1)]);
    r21 = r19 << 3;
    r20 = (r20 + 1)|0;
    r21 = r21 | 3;
    heapClassInst.heap32[(r1)] = Int32(r20);
    r1 = (r21 + 16)|0;
    heapClassInst.heap32[(g0)] = Int32(r1);
    mallocNew(i7);
    r20 = commonVariable.r_g0;
    if(r20 != 0) 
{
    r1 = 0;
    r21 = (r20 + 4)|0;
    r1 = (r1 - r21)|0;
    r1 = r1 & 15;
    r1 = (r20 + r1)|0;
    r21 = (r1 + 4)|0;
    r1 = r1 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r20);
    r20 = r21;
}
}
else{
    r20 = 0;
}

do {
if(!(r2 < 1)) 
{
    r1 = (r11 + 4)|0;
    r21 = (r20 + 4)|0;
    r22 = r2;
while(true){
    r23 = r1 >> 2;
    r24 = Int64(heapClassInst.heap32[(r23)]);
    r23 = Int64(heapClassInst.heap32[(r23+(-1))]);
    r25 = r21 >> 2;
    r22 = (r22 + (-1))|0;
    r1 = (r1 + 8)|0;
    r21 = (r21 + 8)|0;
    heapClassInst.heap32[(r25+(-1))] = Int32(r23);
    heapClassInst.heap32[(r25)] = Int32(r24);
if(!(r22 != 0)) 
{
break 
}
}
}
} while(false);
    if(r11 != 0) 
{
    r1 = gNumAlignedFree;
    r1 = r1 >> 2;
    r21 = Int64(heapClassInst.heap32[(r1)]);
    r21 = (r21 + 1)|0;
    r11 = r11 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r21);
    r1 = Int64(heapClassInst.heap32[(r11+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    free(i7);
    r1 = r19;
    r11 = r20;
}
else{
    r1 = r19;
    r11 = r20;
}
}
}
    r19 = r2 << 3;
    r19 = (r11 + r19)|0;
    r2 = (r2 + 1)|0;
    r19 = r19 >> 2;
    heapClassInst.heap32[(r19)] = Int32(r13);
    if(r4 < r16) 
{
    if(r10 < r16) 
{
do {
    if(r10 <= r16) 
{
    if(r9 < r16) 
{
    if(r16 != 0) 
{
    r4 = gNumAlignedAllocs;
    r4 = r4 >> 2;
    r9 = Int64(heapClassInst.heap32[(r4)]);
    r15 = r16 << 2;
    r9 = (r9 + 1)|0;
    r15 = r15 | 3;
    heapClassInst.heap32[(r4)] = Int32(r9);
    r4 = (r15 + 16)|0;
    heapClassInst.heap32[(g0)] = Int32(r4);
    mallocNew(i7);
    r4 = commonVariable.r_g0;
    if(r4 != 0) 
{
    r9 = 0;
    r15 = (r4 + 4)|0;
    r9 = (r9 - r15)|0;
    r9 = r9 & 15;
    r9 = (r4 + r9)|0;
    r15 = (r9 + 4)|0;
    r9 = r9 >> 2;
    heapClassInst.heap32[(r9)] = Int32(r4);
    r4 = r15;
}
}
else{
    r4 = 0;
}
do {
if(!(r10 < 1)) 
{
    r9 = r4;
    r15 = r8;
    r19 = r10;
while(true){
    r20 = r15 >> 2;
    r19 = (r19 + (-1))|0;
    r15 = (r15 + 4)|0;
    r21 = (r9 + 4)|0;
    r9 = r9 >> 2;
    r20 = Int64(heapClassInst.heap32[(r20)]);
    heapClassInst.heap32[(r9)] = Int32(r20);
    r9 = r21;
if(!(r19 != 0)) 
{
break 
}
}
}
} while(false);
    if(r8 != 0) 
{
    r9 = gNumAlignedFree;
    r9 = r9 >> 2;
    r15 = Int64(heapClassInst.heap32[(r9)]);
    r15 = (r15 + 1)|0;
    r8 = r8 >> 2;
    heapClassInst.heap32[(r9)] = Int32(r15);
    r8 = Int64(heapClassInst.heap32[(r8+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r8);
    free(i7);
    r8 = r4;
    r9 = r16;
}
else{
    r8 = r4;
    r9 = r16;
}
}
    r4 = r10;
while(true){
    r15 = r4 << 2;
    r15 = (r8 + r15)|0;
    r4 = (r4 + 1)|0;
    r15 = r15 >> 2;
    heapClassInst.heap32[(r15)] = 0;
if(!(r16 != r4)) 
{
break 
}
}
}
} while(false);
do {
    if(r7 <= r16) 
{
if(!(r7 >= r16)) 
{
    r4 = Int64(heapClassInst.heap32[(fp+(-1))]);
    if(r4 < r16) 
{
    if(r16 != 0) 
{
    r4 = gNumAlignedAllocs;
    r4 = r4 >> 2;
    r15 = Int64(heapClassInst.heap32[(r4)]);
    r19 = r16 << 2;
    r15 = (r15 + 1)|0;
    r19 = r19 | 3;
    heapClassInst.heap32[(r4)] = Int32(r15);
    r4 = (r19 + 16)|0;
    heapClassInst.heap32[(g0)] = Int32(r4);
    mallocNew(i7);
    r4 = commonVariable.r_g0;
    if(r4 != 0) 
{
    r15 = 0;
    r19 = (r4 + 4)|0;
    r15 = (r15 - r19)|0;
    r15 = r15 & 15;
    r15 = (r4 + r15)|0;
    r19 = (r15 + 4)|0;
    r15 = r15 >> 2;
    heapClassInst.heap32[(r15)] = Int32(r4);
    r4 = r19;
}
}
else{
    r4 = 0;
}
do {
if(!(r7 < 1)) 
{
    r15 = r4;
    r19 = r6;
    r20 = r7;
while(true){
    r21 = r19 >> 2;
    r20 = (r20 + (-1))|0;
    r19 = (r19 + 4)|0;
    r22 = (r15 + 4)|0;
    r15 = r15 >> 2;
    r21 = Int64(heapClassInst.heap32[(r21)]);
    heapClassInst.heap32[(r15)] = Int32(r21);
    r15 = r22;
if(!(r20 != 0)) 
{
break 
}
}
}
} while(false);
if(!(r6 == 0)) 
{
    r15 = gNumAlignedFree;
    r15 = r15 >> 2;
    r19 = Int64(heapClassInst.heap32[(r15)]);
    r19 = (r19 + 1)|0;
    r6 = r6 >> 2;
    heapClassInst.heap32[(r15)] = Int32(r19);
    r6 = Int64(heapClassInst.heap32[(r6+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r6);
    free(i7);
}
    if(r7 < r16) 
{
    r6 = r4;
    heapClassInst.heap32[(fp+(-1))] = Int32(r16);
}
else{
    r6 = r4;
    heapClassInst.heap32[(fp+(-1))] = Int32(r16);
break 
}
}
while(true){
    r4 = r7 << 2;
    r4 = (r6 + r4)|0;
    r7 = (r7 + 1)|0;
    r4 = r4 >> 2;
    heapClassInst.heap32[(r4)] = 0;
if(!(r16 != r7)) 
{
break 
}
}
}
}
} while(false);
do {
if(!(r16 < 1)) 
{
    r4 = r8;
    r7 = r16;
while(true){
    r7 = (r7 + (-1))|0;
    r15 = (r4 + 4)|0;
    r4 = r4 >> 2;
    heapClassInst.heap32[(r4)] = ( -1);
    r4 = r15;
if(!(r7 != 0)) 
{
break 
}
}
if(!(r16 < 1)) 
{
    r4 = r6;
    r7 = r16;
while(true){
    r7 = (r7 + (-1))|0;
    r15 = (r4 + 4)|0;
    r4 = r4 >> 2;
    heapClassInst.heap32[(r4)] = ( -1);
    r4 = r15;
if(!(r7 != 0)) 
{
break 
}
}
}
}
} while(false);
do {
    if(r10 > 0) 
{
    r4 = (r16 + (-1))|0;
    r7 = 0;
while(true){
    r15 = r7 << 3;
    r15 = (r11 + r15)|0;
    r15 = r15 >> 2;
    r15 = Int64(heapClassInst.heap32[(r15)]);
    r19 = r15 << 15;
    r19 = r19 ^ ( -1);
    r15 = (r15 + r19)|0;
    r19 = r15 >> 10;
    r15 = r19 ^ r15;
    r15 = (r15 * 9)|0;
    r19 = r15 >> 6;
    r15 = r19 ^ r15;
    r19 = r15 << 11;
    r19 = r19 ^ ( -1);
    r15 = (r15 + r19)|0;
    r19 = r15 >> 16;
    r15 = r19 ^ r15;
    r15 = r15 & r4;
    r15 = r15 << 2;
    r15 = (r8 + r15)|0;
    r15 = r15 >> 2;
    r19 = r7 << 2;
    r19 = (r6 + r19)|0;
    r20 = Int64(heapClassInst.heap32[(r15)]);
    r19 = r19 >> 2;
    r21 = (r7 + 1)|0;
    heapClassInst.heap32[(r19)] = Int32(r20);
    heapClassInst.heap32[(r15)] = Int32(r7);
    r7 = r21;
    if(r10 == r21) 
{
break 
}
}
}
} while(false);
    r7 = r16;
    r10 = r16;
}
    r4 = (r16 + (-1))|0;
    r15 = r14 & r4;
}
    r4 = r15 << 2;
    r4 = (r8 + r4)|0;
    r4 = r4 >> 2;
    r14 = (r6 + r18)|0;
    r14 = r14 >> 2;
    r15 = Int64(heapClassInst.heap32[(r4)]);
    heapClassInst.heap32[(r14)] = Int32(r15);
    heapClassInst.heap32[(r4)] = Int32(r5);
__label__ = 88;
}
if (__label__ == 88){
    r4 = r13 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+14)]);
    heapClassInst.heap32[(g0)] = Int32(r13);
    r5 = Int64(heapClassInst.heap32[(fp+(-2))]);
    heapClassInst.heap32[(g0+1)] = Int32(r5);
    __FUNCTION_TABLE__[(r4)>>2](i7);
    r4 = r16;
    r5 = r17;
}
    r13 = Int64(heapClassInst.heap32[(r0+2)]);
if(!(r13 > r12)) 
{
break 
}
}
if(!(r11 == 0)) 
{
    r0 = gNumAlignedFree;
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0)]);
    r1 = (r1 + 1)|0;
    r2 = r11 >> 2;
    heapClassInst.heap32[(r0)] = Int32(r1);
    r0 = Int64(heapClassInst.heap32[(r2+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
}
if(!(r3 == 0)) 
{
    r0 = gNumAlignedFree;
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0)]);
    r1 = (r1 + 1)|0;
    r2 = r3 >> 2;
    heapClassInst.heap32[(r0)] = Int32(r1);
    r0 = Int64(heapClassInst.heap32[(r2+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
}
if(!(r6 == 0)) 
{
    r0 = gNumAlignedFree;
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0)]);
    r1 = (r1 + 1)|0;
    r2 = r6 >> 2;
    heapClassInst.heap32[(r0)] = Int32(r1);
    r0 = Int64(heapClassInst.heap32[(r2+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
}
if(!(r8 == 0)) 
{
    r0 = gNumAlignedFree;
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0)]);
    r1 = (r1 + 1)|0;
    r2 = r8 >> 2;
    heapClassInst.heap32[(r0)] = Int32(r1);
    r0 = Int64(heapClassInst.heap32[(r2+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
}
}
}
    return;
}

func _ZZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfEN32BridgeTriangleConvexcastCallbackD0E_0v(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV18btTriangleCallback;
    r2 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
    return;
}

func _ZZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfEN32BridgeTriangleConvexcastCallbackD1E_0v(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV18btTriangleCallback;
    r0 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r0)] = Int32(r1);
    return;
}

func _ZZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfEN32BridgeTriangleConvexcastCallbackD0Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV18btTriangleCallback;
    r2 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
    return;
}

func _ZZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfEN32BridgeTriangleConvexcastCallbackD1Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV18btTriangleCallback;
    r0 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r0)] = Int32(r1);
    return;
}

func _ZZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEEN29BridgeTriangleRaycastCallbackD0E_0v(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV18btTriangleCallback;
    r2 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
    return;
}

func _ZZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEEN29BridgeTriangleRaycastCallbackD1E_0v(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV18btTriangleCallback;
    r0 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r0)] = Int32(r1);
    return;
}

func _ZZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEEN29BridgeTriangleRaycastCallbackD0Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV18btTriangleCallback;
    r2 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
    return;
}

func _ZZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEEN29BridgeTriangleRaycastCallbackD1Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV18btTriangleCallback;
    r0 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r0)] = Int32(r1);
    return;
}


func _ZNK16btCollisionWorld15convexSweepTestEPK13btConvexShapeRK11btTransformS5_RNS_20ConvexResultCallbackEf(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var f11: Float64 = 0.0
    var f12: Float64 = 0.0
    var f13: Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-528);
var g0 = i7>>2; 
    r0 = _E2_str1089;
    r1 = Int64(heapClassInst.heap32[(fp+2)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    r0 = sp + (-112);
    r1 = r1 >> 2;
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    r2 = r0 >> 2;
    heapClassInst.heap32[(fp+(-28))] = heapClassInst.heap32[(r1)];
    heapClassInst.heap32[(r2+1)] = heapClassInst.heap32[(r1+1)];
    heapClassInst.heap32[(r2+2)] = heapClassInst.heap32[(r1+2)];
    heapClassInst.heap32[(r2+3)] = heapClassInst.heap32[(r1+3)];
    heapClassInst.heap32[(r2+4)] = heapClassInst.heap32[(r1+4)];
    heapClassInst.heap32[(r2+5)] = heapClassInst.heap32[(r1+5)];
    heapClassInst.heap32[(r2+6)] = heapClassInst.heap32[(r1+6)];
    heapClassInst.heap32[(r2+7)] = heapClassInst.heap32[(r1+7)];
    heapClassInst.heap32[(r2+8)] = heapClassInst.heap32[(r1+8)];
    heapClassInst.heap32[(r2+9)] = heapClassInst.heap32[(r1+9)];
    heapClassInst.heap32[(r2+10)] = heapClassInst.heap32[(r1+10)];
    heapClassInst.heap32[(r2+11)] = heapClassInst.heap32[(r1+11)];
    heapClassInst.heap32[(r2+12)] = heapClassInst.heap32[(r1+12)];
    heapClassInst.heap32[(r2+13)] = heapClassInst.heap32[(r1+13)];
    r3 = Int64(heapClassInst.heap32[(fp+3)]);
    heapClassInst.heap32[(r2+14)] = heapClassInst.heap32[(r1+14)];
    r4 = sp + (-176);
    r3 = r3 >> 2;
    heapClassInst.heap32[(r2+15)] = heapClassInst.heap32[(r1+15)];
    r2 = r4 >> 2;
    heapClassInst.heap32[(fp+(-44))] = heapClassInst.heap32[(r3)];
    heapClassInst.heap32[(r2+1)] = heapClassInst.heap32[(r3+1)];
    heapClassInst.heap32[(r2+2)] = heapClassInst.heap32[(r3+2)];
    heapClassInst.heap32[(r2+3)] = heapClassInst.heap32[(r3+3)];
    heapClassInst.heap32[(r2+4)] = heapClassInst.heap32[(r3+4)];
    heapClassInst.heap32[(r2+5)] = heapClassInst.heap32[(r3+5)];
    heapClassInst.heap32[(r2+6)] = heapClassInst.heap32[(r3+6)];
    heapClassInst.heap32[(r2+7)] = heapClassInst.heap32[(r3+7)];
    heapClassInst.heap32[(r2+8)] = heapClassInst.heap32[(r3+8)];
    heapClassInst.heap32[(r2+9)] = heapClassInst.heap32[(r3+9)];
    heapClassInst.heap32[(r2+10)] = heapClassInst.heap32[(r3+10)];
    heapClassInst.heap32[(r2+11)] = heapClassInst.heap32[(r3+11)];
    heapClassInst.heap32[(r2+12)] = heapClassInst.heap32[(r3+12)];
    heapClassInst.heap32[(r2+13)] = heapClassInst.heap32[(r3+13)];
    heapClassInst.heap32[(r2+14)] = heapClassInst.heap32[(r3+14)];
    heapClassInst.heap32[(r2+15)] = heapClassInst.heap32[(r3+15)];
    r2 = sp + (-24);
    r5 = sp + (-28);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r4);
    heapClassInst.heap32[(g0+2)] = Int32(r2);
    heapClassInst.heap32[(g0+3)] = Int32(r5);
    _ZN15btTransformUtil22calculateDiffAxisAngleERK11btTransformS2_R9btVector3Rf(i7);
    r2 = r2 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f1 = Float64(heapClassInst.heapFloat[(fp+(-7))]);
    f2 = Float64(heapClassInst.heapFloat[(r2+1)]);
    f3 = Float64(heapClassInst.heapFloat[(fp+(-6))]);
    r2 = sp + (-424);
    f3 = f3*f1;
    r5 = r2 >> 2;
    f2 = f2*f1;
    heapClassInst.heapFloat[(fp+(-106))] = Float32(f3);
    f0 = f0*f1;
    heapClassInst.heapFloat[(r5+1)] = Float32(f2);
    heapClassInst.heapFloat[(r5+2)] = Float32(f0);
    r6 = sp + (-440);
    heapClassInst.heap32[(r5+3)] = 0;
    r5 = r6 >> 2;
    heapClassInst.heap32[(fp+(-110))] = 0;
    heapClassInst.heap32[(r5+1)] = 0;
    heapClassInst.heap32[(r5+2)] = 0;
    r7 = sp + (-504);
    heapClassInst.heap32[(r5+3)] = 0;
    r5 = r7 >> 2;
    heapClassInst.heap32[(fp+(-126))] = 1065353216;
    heapClassInst.heap32[(r5+1)] = 0;
    heapClassInst.heap32[(r5+2)] = 0;
    heapClassInst.heap32[(r5+3)] = 0;
    heapClassInst.heap32[(r5+4)] = 0;
    heapClassInst.heap32[(r5+5)] = 1065353216;
    heapClassInst.heap32[(r5+6)] = 0;
    heapClassInst.heap32[(r5+7)] = 0;
    heapClassInst.heap32[(r5+8)] = 0;
    heapClassInst.heap32[(r5+9)] = 0;
    heapClassInst.heap32[(r5+10)] = 1065353216;
    heapClassInst.heap32[(r5+11)] = 0;
    heapClassInst.heap32[(r5+12)] = 0;
    heapClassInst.heap32[(r5+13)] = 0;
    heapClassInst.heap32[(r5+14)] = 0;
    heapClassInst.heap32[(r5+15)] = 0;
    r8 = sp + (-48);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r8);
    _ZNK11btMatrix3x311getRotationER12btQuaternion(i7);
    r8 = r8 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(fp+(-12))]);
    f1 = Float64(heapClassInst.heapFloat[(r8+1)]);
    f2 = Float64(heapClassInst.heapFloat[(r8+2)]);
    f3 = f0*f0;
    f4 = f1*f1;
    f5 = Float64(heapClassInst.heapFloat[(r8+3)]);
    f3 = f3+f4;
    f4 = f2*f2;
    f3 = f3+f4;
    f4 = f5*f5;
    f6 =                         2.0;
    f3 = f3+f4;
    f3 = f6/f3;
    f4 = f2*f3;
    f6 = f1*f3;
    f7 = f1*f6;
    f2 = f2*f4;
    f8 = f7+f2;
    f9 =                         1.0;
    f10 = f0*f6;
    f11 = f5*f4;
    f8 = f9-f8;
    f12 = f0*f4;
    f6 = f5*f6;
    f13 = f10-f11;
    heapClassInst.heapFloat[(fp+(-126))] = Float32(f8);
    f3 = f0*f3;
    f8 = f12+f6;
    heapClassInst.heapFloat[(r5+1)] = Float32(f13);
    f0 = f0*f3;
    heapClassInst.heapFloat[(r5+2)] = Float32(f8);
    f2 = f0+f2;
    f8 = f10+f11;
    heapClassInst.heap32[(r5+3)] = 0;
    f1 = f1*f4;
    f3 = f5*f3;
    f2 = f9-f2;
    heapClassInst.heapFloat[(r5+4)] = Float32(f8);
    f4 = f1-f3;
    heapClassInst.heapFloat[(r5+5)] = Float32(f2);
    heapClassInst.heapFloat[(r5+6)] = Float32(f4);
    f2 = f12-f6;
    heapClassInst.heap32[(r5+7)] = 0;
    f0 = f0+f7;
    f1 = f1+f3;
    heapClassInst.heapFloat[(r5+8)] = Float32(f2);
    f0 = f9-f0;
    heapClassInst.heapFloat[(r5+9)] = Float32(f1);
    heapClassInst.heapFloat[(r5+10)] = Float32(f0);
    heapClassInst.heap32[(r5+11)] = 0;
    r5 = Int64(heapClassInst.heap32[(fp+1)]);
    r8 = sp + (-192);
    r9 = sp + (-208);
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0+1)] = Int32(r7);
    heapClassInst.heap32[(g0+2)] = Int32(r6);
    heapClassInst.heap32[(g0+3)] = Int32(r2);
    heapClassInst.heap32[(g0+4)] = Int32(r8);
    heapClassInst.heap32[(g0+5)] = Int32(r9);
    r2 = _ZTV21btSingleSweepCallback;
    r6 = sp + (-408);
    r2 = (r2 + 8)|0;
    _ZNK16btCollisionShape21calculateTemporalAabbERK11btTransformRK9btVector3S5_fRS3_S6_(i7);
    r7 = r6 >> 2;
    heapClassInst.heap32[(fp+(-102))] = Int32(r2);
    heapClassInst.heap32[(r7+9)] = heapClassInst.heap32[(r1)];
    heapClassInst.heap32[(r7+10)] = heapClassInst.heap32[(r1+1)];
    heapClassInst.heap32[(r7+11)] = heapClassInst.heap32[(r1+2)];
    heapClassInst.heap32[(r7+12)] = heapClassInst.heap32[(r1+3)];
    heapClassInst.heap32[(r7+13)] = heapClassInst.heap32[(r1+4)];
    heapClassInst.heap32[(r7+14)] = heapClassInst.heap32[(r1+5)];
    heapClassInst.heap32[(r7+15)] = heapClassInst.heap32[(r1+6)];
    heapClassInst.heap32[(r7+16)] = heapClassInst.heap32[(r1+7)];
    heapClassInst.heap32[(r7+17)] = heapClassInst.heap32[(r1+8)];
    heapClassInst.heap32[(r7+18)] = heapClassInst.heap32[(r1+9)];
    heapClassInst.heap32[(r7+19)] = heapClassInst.heap32[(r1+10)];
    heapClassInst.heap32[(r7+20)] = heapClassInst.heap32[(r1+11)];
    f0 = Float64(heapClassInst.heapFloat[(r1+12)]);
    heapClassInst.heapFloat[(r7+21)] = Float32(f0);
    f1 = Float64(heapClassInst.heapFloat[(r1+13)]);
    heapClassInst.heapFloat[(r7+22)] = Float32(f1);
    f2 = Float64(heapClassInst.heapFloat[(r1+14)]);
    heapClassInst.heapFloat[(r7+23)] = Float32(f2);
    heapClassInst.heap32[(r7+24)] = heapClassInst.heap32[(r1+15)];
    heapClassInst.heap32[(r7+25)] = heapClassInst.heap32[(r3)];
    heapClassInst.heap32[(r7+26)] = heapClassInst.heap32[(r3+1)];
    heapClassInst.heap32[(r7+27)] = heapClassInst.heap32[(r3+2)];
    heapClassInst.heap32[(r7+28)] = heapClassInst.heap32[(r3+3)];
    heapClassInst.heap32[(r7+29)] = heapClassInst.heap32[(r3+4)];
    heapClassInst.heap32[(r7+30)] = heapClassInst.heap32[(r3+5)];
    heapClassInst.heap32[(r7+31)] = heapClassInst.heap32[(r3+6)];
    heapClassInst.heap32[(r7+32)] = heapClassInst.heap32[(r3+7)];
    heapClassInst.heap32[(r7+33)] = heapClassInst.heap32[(r3+8)];
    heapClassInst.heap32[(r7+34)] = heapClassInst.heap32[(r3+9)];
    heapClassInst.heap32[(r7+35)] = heapClassInst.heap32[(r3+10)];
    heapClassInst.heap32[(r7+36)] = heapClassInst.heap32[(r3+11)];
    f3 = Float64(heapClassInst.heapFloat[(r3+12)]);
    heapClassInst.heapFloat[(r7+37)] = Float32(f3);
    f4 = Float64(heapClassInst.heapFloat[(r3+13)]);
    heapClassInst.heapFloat[(r7+38)] = Float32(f4);
    f5 = Float64(heapClassInst.heapFloat[(r3+14)]);
    heapClassInst.heapFloat[(r7+39)] = Float32(f5);
    r1 = Int64(heapClassInst.heap32[(fp)]);
    heapClassInst.heap32[(r7+40)] = heapClassInst.heap32[(r3+15)];
    r3 = Int64(heapClassInst.heap32[(fp+4)]);
    heapClassInst.heap32[(r7+45)] = Int32(r1);
    heapClassInst.heap32[(r7+46)] = Int32(r3);
    f0 = f3-f0;
    f1 = f4-f1;
    heapClassInst.heap32[(r7+47)] = heapClassInst.heap32[(fp+5)];
    f2 = f5-f2;
    heapClassInst.heap32[(r7+48)] = Int32(r5);
    f3 = f0*f0;
    f4 = f1*f1;
    f3 = f3+f4;
    f4 = f2*f2;
    f3 = f3+f4;
    heapClassInst.heapFloat[(g0)] = Float32(f3);
    sqrtf(i7);
    f3 = f9/commonVariable.f_g0;
    f4 = f0*f3;
    f5 = f2*f3;
    f3 = f1*f3;
    f6 =                         0.0;
    if(f4 != f6) 
{
    f7 = f9/f4;
}
else{
    f7 =        999999984306749440.0;
}
    heapClassInst.heapFloat[(r7+1)] = Float32(f7);
    if(f3 != f6) 
{
    f8 = f9/f3;
}
else{
    f8 =        999999984306749440.0;
}
    heapClassInst.heapFloat[(r7+2)] = Float32(f8);
    if(f5 != f6) 
{
    f9 = f9/f5;
}
else{
    f9 =        999999984306749440.0;
}
    r3 = if (f7 < f6) {1} else {0};
    r5 = if (f8 < f6) {1} else {0};
    r3 = r3 & 1;
    heapClassInst.heapFloat[(r7+3)] = Float32(f9);
    r10 = if (f9 < f6) {1} else {0};
    f0 = f4*f0;
    f1 = f3*f1;
    r5 = r5 & 1;
    heapClassInst.heap32[(r7+5)] = Int32(r3);
    f0 = f0+f1;
    f1 = f5*f2;
    r3 = r10 & 1;
    heapClassInst.heap32[(r7+6)] = Int32(r5);
    f0 = f0+f1;
    heapClassInst.heap32[(r7+7)] = Int32(r3);
    r1 = r1 >> 2;
    heapClassInst.heapFloat[(r7+8)] = Float32(f0);
    r1 = Int64(heapClassInst.heap32[(r1+20)]);
    r3 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+6)]);
    r0 = (r0 + 48)|0;
    r4 = (r4 + 48)|0;
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0+1)] = Int32(r0);
    heapClassInst.heap32[(g0+2)] = Int32(r4);
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    heapClassInst.heap32[(g0+4)] = Int32(r8);
    heapClassInst.heap32[(g0+5)] = Int32(r9);
    r0 = _ZN15CProfileManager11CurrentNodeE;
    __FUNCTION_TABLE__[(r3)>>2](i7);
    r0 = r0 >> 2;
    heapClassInst.heap32[(fp+(-102))] = Int32(r2);
    r1 = Int64(heapClassInst.heap32[(r0)]);
    r2 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r2+4)]);
    r3 = (r3 + (-1))|0;
    heapClassInst.heap32[(r2+4)] = Int32(r3);
do {
if(!(r3 != 0)) 
{
    r3 = Int64(heapClassInst.heap32[(r2+1)]);
    if(r3 != 0) 
{
    r1 = sp + (-8);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0+1)] = 0;
    r3 = _ZL13gProfileClock_2E_0;
    gettimeofday(i7);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r1 = r1 >> 2;
    r4 = Int64(heapClassInst.heap32[(fp+(-2))]);
    r5 = Int64(heapClassInst.heap32[(r3)]);
    r4 = (r4 - r5)|0;
    r1 = Int64(heapClassInst.heap32[(r1+1)]);
    r3 = Int64(heapClassInst.heap32[(r3+1)]);
    r1 = (r1 - r3)|0;
    r3 = (r4 * 1000000)|0;
    r1 = (r1 + r3)|0;
    r3 = Int64(heapClassInst.heap32[(r2+3)]);
    r1 = (r1 - r3)|0;
    f0 = Float64(`UIntNative`(r1)); 
    f1 =                      1000.0;
    f2 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f0 = f0/f1;
    f0 = f2+f0;
    heapClassInst.heapFloat[(r2+2)] = Float32(f0);
    r1 = Int64(heapClassInst.heap32[(r2+4)]);
    if(r1 != 0) 
{
break 
}
else{
    r1 = Int64(heapClassInst.heap32[(r0)]);
}
}
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+5)]);
    heapClassInst.heap32[(r0)] = Int32(r1);
}
} while(false);
    return;
}

func _ZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEf(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var f11: Float64 = 0.0
    var f12: Float64 = 0.0
    var f13: Float64 = 0.0
    var f14: Float64 = 0.0
    var f15: Float64 = 0.0
    var f16: Float64 = 0.0
    var f17: Float64 = 0.0
    var f18: Float64 = 0.0
    var f19: Float64 = 0.0
    var f20: Float64 = 0.0
    var f21: Float64 = 0.0
    var f22: Float64 = 0.0
    var f23: Float64 = 0.0
    var f24: Float64 = 0.0
    var f25: Float64 = 0.0
    var f26: Float64 = 0.0
    var f27: Float64 = 0.0
    var f28: Float64 = 0.0
    var f29: Float64 = 0.0
    var f30: Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-1472);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp+4)]);
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1+1)]);
    r3 = Int64(heapClassInst.heap32[(fp)]);
    r4 = Int64(heapClassInst.heap32[(fp+1)]);
    r5 = Int64(heapClassInst.heap32[(fp+2)]);
    r6 = Int64(heapClassInst.heap32[(fp+3)]);
    r7 = Int64(heapClassInst.heap32[(fp+5)]);
    r8 = Int64(heapClassInst.heap32[(fp+6)]);
    f0 = Float64(heapClassInst.heapFloat[(fp+7)]);
do {
    if(r2 > 19) 
{
    r9 = (r2 + (-21))|0;
    if(`UIntNative`(r9) > `UIntNative`(8)) 
{
    if(r2 != 31) 
{
break 
}
else{
    r0 = _E2_str1493;
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    r0 = Int64(heapClassInst.heap32[(r1+4)]);
if(!(r0 < 1)) 
{
    r0 = 0;
while(true){
    r2 = (r0 * 20)|0;
    r9 = Int64(heapClassInst.heap32[(r1+6)]);
    r2 = r2 << 2;
    r2 = (r9 + r2)|0;
    r2 = r2 >> 2;
    r9 = r7 >> 2;
    f1 = Float64(heapClassInst.heapFloat[(r2)]);
    f2 = Float64(heapClassInst.heapFloat[(r9)]);
    f3 = Float64(heapClassInst.heapFloat[(r2+4)]);
    f4 = Float64(heapClassInst.heapFloat[(r9+1)]);
    f5 = Float64(heapClassInst.heapFloat[(r2+1)]);
    f6 = Float64(heapClassInst.heapFloat[(r2+5)]);
    f7 = f1*f2;
    f8 = f3*f4;
    f9 = Float64(heapClassInst.heapFloat[(r2+8)]);
    f10 = Float64(heapClassInst.heapFloat[(r9+2)]);
    f11 = Float64(heapClassInst.heapFloat[(r9+8)]);
    f12 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f13 = Float64(heapClassInst.heapFloat[(r9+4)]);
    f14 = Float64(heapClassInst.heapFloat[(r2+12)]);
    f15 = Float64(heapClassInst.heapFloat[(r9+9)]);
    f16 = Float64(heapClassInst.heapFloat[(r2+6)]);
    f17 = Float64(heapClassInst.heapFloat[(r9+5)]);
    f18 = Float64(heapClassInst.heapFloat[(r2+13)]);
    f19 = Float64(heapClassInst.heapFloat[(r2+9)]);
    f20 = Float64(heapClassInst.heapFloat[(r9+10)]);
    f21 = Float64(heapClassInst.heapFloat[(r2+10)]);
    f22 = Float64(heapClassInst.heapFloat[(r9+6)]);
    f23 = Float64(heapClassInst.heapFloat[(r2+14)]);
    f24 = f5*f2;
    f25 = f6*f4;
    f7 = f7+f8;
    f8 = f9*f10;
    r2 = Int64(heapClassInst.heap32[(r2+16)]);
    f26 = Float64(heapClassInst.heapFloat[(r9+14)]);
    f27 = Float64(heapClassInst.heapFloat[(r9+13)]);
    f28 = Float64(heapClassInst.heapFloat[(r9+12)]);
    r9 = sp + (-1408);
    f29 = f12*f2;
    f30 = f16*f4;
    f24 = f24+f25;
    f25 = f19*f10;
    f7 = f7+f8;
    r10 = r9 >> 2;
    f8 = f29+f30;
    f29 = f21*f10;
    f24 = f24+f25;
    heapClassInst.heapFloat[(fp+(-352))] = Float32(f7);
    f7 = f1*f13;
    f25 = f3*f17;
    f8 = f8+f29;
    heapClassInst.heapFloat[(r10+1)] = Float32(f24);
    heapClassInst.heapFloat[(r10+2)] = Float32(f8);
    f8 = f5*f13;
    f24 = f6*f17;
    f7 = f7+f25;
    f25 = f9*f22;
    f29 = f12*f13;
    f30 = f16*f17;
    f8 = f8+f24;
    f24 = f19*f22;
    f7 = f7+f25;
    heapClassInst.heap32[(r10+3)] = 0;
    f25 = f29+f30;
    f29 = f21*f22;
    f8 = f8+f24;
    heapClassInst.heapFloat[(r10+4)] = Float32(f7);
    f1 = f1*f11;
    f3 = f3*f15;
    f7 = f25+f29;
    heapClassInst.heapFloat[(r10+5)] = Float32(f8);
    heapClassInst.heapFloat[(r10+6)] = Float32(f7);
    f5 = f5*f11;
    f6 = f6*f15;
    f1 = f1+f3;
    f3 = f9*f20;
    f7 = f12*f11;
    f8 = f16*f15;
    f5 = f5+f6;
    f6 = f19*f20;
    f1 = f1+f3;
    heapClassInst.heap32[(r10+7)] = 0;
    f2 = f2*f14;
    f3 = f4*f18;
    f4 = f7+f8;
    f7 = f21*f20;
    f5 = f5+f6;
    heapClassInst.heapFloat[(r10+8)] = Float32(f1);
    f1 = f13*f14;
    f6 = f17*f18;
    f2 = f2+f3;
    f3 = f10*f23;
    f4 = f4+f7;
    heapClassInst.heapFloat[(r10+9)] = Float32(f5);
    f2 = f2+f3;
    heapClassInst.heapFloat[(r10+10)] = Float32(f4);
    f3 = f11*f14;
    f4 = f15*f18;
    f1 = f1+f6;
    f5 = f22*f23;
    f1 = f1+f5;
    f3 = f3+f4;
    f4 = f20*f23;
    f2 = f2+f28;
    heapClassInst.heap32[(r10+11)] = 0;
    f3 = f3+f4;
    f1 = f1+f27;
    heapClassInst.heapFloat[(r10+12)] = Float32(f2);
    f2 = f3+f26;
    heapClassInst.heapFloat[(r10+13)] = Float32(f1);
    heapClassInst.heapFloat[(r10+14)] = Float32(f2);
    r11 = r6 >> 2;
    heapClassInst.heap32[(r10+15)] = 0;
    r10 = Int64(heapClassInst.heap32[(r11+48)]);
    r12 = 1;
    heapClassInst.heap32[(r11+48)] = Int32(r2);
    r13 = _ZTVZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE14LocalInfoAdder;
    r14 = ( -1);
    heapClassInst.heap16[(sp+(-1424))>>1] = Int16(r12);
    r12 = sp + (-1432);
    heapClassInst.heap16[(sp+(-1422))>>1] = Int16(r14);
    r13 = (r13 + 8)|0;
    r14 = r12 >> 2;
    heapClassInst.heap32[(fp+(-358))] = Int32(r13);
    heapClassInst.heap32[(r14+3)] = Int32(r8);
    r15 = r8 >> 2;
    heapClassInst.heap32[(r14+4)] = Int32(r0);
    heapClassInst.heap32[(r14+1)] = heapClassInst.heap32[(r15+1)];
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r4);
    heapClassInst.heap32[(g0+2)] = Int32(r5);
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    heapClassInst.heap32[(g0+4)] = Int32(r2);
    heapClassInst.heap32[(g0+5)] = Int32(r9);
    heapClassInst.heap32[(g0+6)] = Int32(r12);
    heapClassInst.heapFloat[(g0+7)] = Float32(f0);
    _ZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEf(i7);
    r0 = (r0 + 1)|0;
    heapClassInst.heap32[(r11+48)] = Int32(r10);
    heapClassInst.heap32[(fp+(-358))] = Int32(r13);
    r2 = Int64(heapClassInst.heap32[(r1+4)]);
if(!(r2 > r0)) 
{
break 
}
}
}
    r0 = _ZN15CProfileManager11CurrentNodeE;
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0)]);
    r2 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r2+4)]);
    r3 = (r3 + (-1))|0;
    heapClassInst.heap32[(r2+4)] = Int32(r3);
    if(r3 != 0) 
{
break 
}
else{
    r3 = Int64(heapClassInst.heap32[(r2+1)]);
    if(r3 != 0) 
{
    r1 = sp + (-24);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0+1)] = 0;
    r3 = _ZL13gProfileClock_2E_0;
    gettimeofday(i7);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r1 = r1 >> 2;
    r4 = Int64(heapClassInst.heap32[(fp+(-6))]);
    r5 = Int64(heapClassInst.heap32[(r3)]);
    r4 = (r4 - r5)|0;
    r1 = Int64(heapClassInst.heap32[(r1+1)]);
    r3 = Int64(heapClassInst.heap32[(r3+1)]);
    r1 = (r1 - r3)|0;
    r3 = (r4 * 1000000)|0;
    r1 = (r1 + r3)|0;
    r3 = Int64(heapClassInst.heap32[(r2+3)]);
    r1 = (r1 - r3)|0;
    f0 = Float64(`UIntNative`(r1)); 
    f1 =                      1000.0;
    f2 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f0 = f0/f1;
    f0 = f2+f0;
    heapClassInst.heapFloat[(r2+2)] = Float32(f0);
    r1 = Int64(heapClassInst.heap32[(r2+4)]);
    if(r1 != 0) 
{
break 
}
else{
    r1 = Int64(heapClassInst.heap32[(r0)]);
}
}
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+5)]);
    heapClassInst.heap32[(r0)] = Int32(r1);
    return;
}
}
}
else{
    if(r2 != 21) 
{
    r2 = r5 >> 2;
    r9 = r7 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r9)]);
    f1 = Float64(heapClassInst.heapFloat[(r2)]);
    f2 = Float64(heapClassInst.heapFloat[(r9+4)]);
    f3 = Float64(heapClassInst.heapFloat[(r2+4)]);
    r10 = r4 >> 2;
    f4 = Float64(heapClassInst.heapFloat[(r2+1)]);
    f5 = Float64(heapClassInst.heapFloat[(r2+5)]);
    f6 = f1*f0;
    f7 = f3*f2;
    f8 = Float64(heapClassInst.heapFloat[(r9+8)]);
    f9 = Float64(heapClassInst.heapFloat[(r2+8)]);
    f10 = Float64(heapClassInst.heapFloat[(r9+2)]);
    f11 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f12 = Float64(heapClassInst.heapFloat[(r9+1)]);
    f13 = Float64(heapClassInst.heapFloat[(r2+12)]);
    f14 = Float64(heapClassInst.heapFloat[(r10+12)]);
    f15 = Float64(heapClassInst.heapFloat[(r9+6)]);
    f16 = Float64(heapClassInst.heapFloat[(r2+6)]);
    f17 = Float64(heapClassInst.heapFloat[(r9+5)]);
    f18 = Float64(heapClassInst.heapFloat[(r2+13)]);
    f19 = Float64(heapClassInst.heapFloat[(r10+13)]);
    f20 = Float64(heapClassInst.heapFloat[(r9+13)]);
    f21 = Float64(heapClassInst.heapFloat[(r2+10)]);
    f22 = Float64(heapClassInst.heapFloat[(r9+10)]);
    f23 = Float64(heapClassInst.heapFloat[(r2+9)]);
    f24 = Float64(heapClassInst.heapFloat[(r9+9)]);
    f25 = Float64(heapClassInst.heapFloat[(r2+14)]);
    heapClassInst.heapFloat[(fp+(-360))] = Float32(f25);
    f26 = Float64(heapClassInst.heapFloat[(r10+14)]);
    f27 = Float64(heapClassInst.heapFloat[(r9+14)]);
    f28 = Float64(heapClassInst.heapFloat[(r9+12)]);
    heapClassInst.heapFloat[(fp+(-359))] = Float32(f28);
    f29 = f4*f0;
    f30 = f5*f2;
    f6 = f6+f7;
    f7 = f9*f8;
    r2 = sp + (-1056);
    f25 = f11*f0;
    f28 = f16*f2;
    f29 = f29+f30;
    f30 = f23*f8;
    f6 = f6+f7;
    r9 = r2 >> 2;
    f7 = f25+f28;
    f25 = f21*f8;
    f28 = f29+f30;
    heapClassInst.heapFloat[(fp+(-264))] = Float32(f6);
    f6 = f1*f12;
    f29 = f3*f17;
    f7 = f7+f25;
    heapClassInst.heapFloat[(r9+1)] = Float32(f28);
    heapClassInst.heapFloat[(r9+2)] = Float32(f7);
    f7 = f4*f12;
    f25 = f5*f17;
    f6 = f6+f29;
    f28 = f9*f24;
    f29 = f11*f12;
    f30 = f16*f17;
    f7 = f7+f25;
    f25 = f23*f24;
    f6 = f6+f28;
    heapClassInst.heap32[(r9+3)] = 0;
    f28 = f29+f30;
    f29 = f21*f24;
    f7 = f7+f25;
    heapClassInst.heapFloat[(r9+4)] = Float32(f6);
    f1 = f1*f10;
    f3 = f3*f15;
    f6 = f28+f29;
    heapClassInst.heapFloat[(r9+5)] = Float32(f7);
    heapClassInst.heapFloat[(r9+6)] = Float32(f6);
    f4 = f4*f10;
    f5 = f5*f15;
    f1 = f1+f3;
    f3 = f9*f22;
    f6 = f11*f10;
    f7 = f16*f15;
    f4 = f4+f5;
    f5 = f23*f22;
    f1 = f1+f3;
    heapClassInst.heap32[(r9+7)] = 0;
    f3 = f6+f7;
    f6 = f21*f22;
    f4 = f4+f5;
    heapClassInst.heapFloat[(r9+8)] = Float32(f1);
    f1 = f3+f6;
    heapClassInst.heapFloat[(r9+9)] = Float32(f4);
    heapClassInst.heapFloat[(r9+10)] = Float32(f1);
    heapClassInst.heap32[(r9+11)] = 0;
    heapClassInst.heap32[(r9+12)] = 0;
    heapClassInst.heap32[(r9+13)] = 0;
    heapClassInst.heap32[(r9+14)] = 0;
    heapClassInst.heap32[(r9+15)] = 0;
    r9 = Int64(heapClassInst.heap32[(r1)]);
    r9 = r9 >> 2;
    r9 = Int64(heapClassInst.heap32[(r9+11)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r9)>>2](i7);
    r9 = sp + (-1280);
    heapClassInst.heap32[(g0)] = Int32(r9);
    heapClassInst.heap32[(g0+1)] = Int32(r3);
    heapClassInst.heap32[(g0+2)] = Int32(r4);
    heapClassInst.heap32[(g0+3)] = Int32(r5);
    heapClassInst.heap32[(g0+4)] = Int32(r7);
    heapClassInst.heapFloat[(g0+5)] = Float32(commonVariable.f_g0);
    r4 = _ZTVZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE32BridgeTriangleConvexcastCallback_0;
    _ZN28btTriangleConvexcastCallbackC2EPK13btConvexShapeRK11btTransformS5_S5_f(i7);
    r4 = (r4 + 8)|0;
    r5 = r9 >> 2;
    heapClassInst.heap32[(fp+(-320))] = Int32(r4);
    heapClassInst.heap32[(r5+52)] = Int32(r8);
    heapClassInst.heap32[(r5+53)] = Int32(r6);
    r4 = r8 >> 2;
    heapClassInst.heap32[(r5+54)] = Int32(r0);
    r6 = r3 >> 2;
    heapClassInst.heap32[(r5+50)] = heapClassInst.heap32[(r4+1)];
    r4 = Int64(heapClassInst.heap32[(r6)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+2)]);
    f28 = Float64(heapClassInst.heapFloat[(fp+(-359))]);
    f1 = -f28;
    r5 = sp + (-1296);
    r6 = sp + (-1312);
    f3 = f0*f14;
    f4 = f2*f19;
    f5 = f0*f1;
    f6 = f2*f20;
    f3 = f3+f4;
    f4 = f8*f26;
    f5 = f5-f6;
    f6 = f8*f27;
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r2);
    heapClassInst.heap32[(g0+2)] = Int32(r5);
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    f7 = f12*f14;
    f9 = f17*f19;
    f11 = f12*f1;
    f16 = f17*f20;
    f3 = f3+f4;
    f4 = f5-f6;
    f5 = f10*f14;
    f6 = f15*f19;
    f1 = f10*f1;
    f14 = f15*f20;
    f7 = f7+f9;
    f9 = f24*f26;
    f11 = f11-f16;
    f16 = f24*f27;
    f3 = f3+f4;
    __FUNCTION_TABLE__[(r4)>>2](i7);
    r2 = sp + (-1328);
    f0 = f0*f13;
    f2 = f2*f18;
    f10 = f10*f13;
    f15 = f15*f18;
    f12 = f12*f13;
    f13 = f17*f18;
    f5 = f5+f6;
    f6 = f22*f26;
    f1 = f1-f14;
    f14 = f22*f27;
    f7 = f7+f9;
    f9 = f11-f16;
    f7 = f7+f9;
    f0 = f0+f2;
    f25 = Float64(heapClassInst.heapFloat[(fp+(-360))]);
    f2 = f8*f25;
    f8 = f10+f15;
    f10 = f22*f25;
    f11 = f12+f13;
    f12 = f24*f25;
    r3 = r2 >> 2;
    heapClassInst.heapFloat[(fp+(-332))] = Float32(f3);
    f5 = f5+f6;
    f1 = f1-f14;
    f0 = f0+f2;
    f2 = f8+f10;
    f6 = f11+f12;
    f5 = f5+f1;
    heapClassInst.heapFloat[(r3+1)] = Float32(f7);
    f0 = f0+f4;
    f1 = f2+f1;
    f2 = f6+f9;
    heapClassInst.heapFloat[(r3+2)] = Float32(f5);
    heapClassInst.heap32[(r3+3)] = 0;
    if(f0 < f3) 
{
    heapClassInst.heapFloat[(fp+(-332))] = Float32(f0);
    f4 = f0;
}
else{
    f4 = f3;
}
    if(f2 < f7) 
{
    heapClassInst.heapFloat[(r3+1)] = Float32(f2);
    f6 = f2;
}
else{
    f6 = f7;
}
    if(f1 < f5) 
{
    heapClassInst.heapFloat[(r3+2)] = Float32(f1);
    f8 = f1;
}
else{
    f8 = f5;
}
    r4 = sp + (-1344);
    r7 = r4 >> 2;
    heapClassInst.heapFloat[(fp+(-336))] = Float32(f3);
    heapClassInst.heapFloat[(r7+1)] = Float32(f7);
    heapClassInst.heapFloat[(r7+2)] = Float32(f5);
    heapClassInst.heap32[(r7+3)] = 0;
    if(f3 < f0) 
{
    heapClassInst.heapFloat[(fp+(-336))] = Float32(f0);
    f3 = f0;
}
    if(f7 < f2) 
{
    heapClassInst.heapFloat[(r7+1)] = Float32(f2);
    f7 = f2;
}
    if(f5 < f1) 
{
    heapClassInst.heapFloat[(r7+2)] = Float32(f1);
    f5 = f1;
}
    f0 = Float64(heapClassInst.heapFloat[(fp+(-324))]);
    f0 = f4+f0;
    r5 = r5 >> 2;
    heapClassInst.heapFloat[(fp+(-332))] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(r5+1)]);
    f0 = f6+f0;
    heapClassInst.heapFloat[(r3+1)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(r5+2)]);
    f0 = f8+f0;
    heapClassInst.heapFloat[(r3+2)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-328))]);
    f0 = f3+f0;
    r3 = r6 >> 2;
    heapClassInst.heapFloat[(fp+(-336))] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(r3+1)]);
    f0 = f7+f0;
    heapClassInst.heapFloat[(r7+1)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(r3+2)]);
    f0 = f5+f0;
    heapClassInst.heapFloat[(r7+2)] = Float32(f0);
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+15)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r9);
    heapClassInst.heap32[(g0+2)] = Int32(r2);
    heapClassInst.heap32[(g0+3)] = Int32(r4);
    __FUNCTION_TABLE__[(r1)>>2](i7);
    return;
}
else{
    r2 = r7 >> 2;
    r9 = r4 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r2+12)]);
    f0 = -f0;
    f1 = Float64(heapClassInst.heapFloat[(r2)]);
    f2 = Float64(heapClassInst.heapFloat[(r9+12)]);
    f3 = Float64(heapClassInst.heapFloat[(r2+4)]);
    f4 = Float64(heapClassInst.heapFloat[(r2+13)]);
    f5 = Float64(heapClassInst.heapFloat[(r9+13)]);
    f6 = Float64(heapClassInst.heapFloat[(r2+1)]);
    f7 = Float64(heapClassInst.heapFloat[(r2+5)]);
    f8 = f1*f2;
    f9 = f3*f5;
    f10 = f1*f0;
    f11 = f3*f4;
    f12 = Float64(heapClassInst.heapFloat[(r2+8)]);
    f13 = Float64(heapClassInst.heapFloat[(r2+14)]);
    f14 = Float64(heapClassInst.heapFloat[(r9+14)]);
    f15 = Float64(heapClassInst.heapFloat[(r2+9)]);
    f16 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f17 = Float64(heapClassInst.heapFloat[(r2+6)]);
    f18 = f6*f2;
    f19 = f7*f5;
    f20 = f6*f0;
    f21 = f7*f4;
    f8 = f8+f9;
    f9 = f12*f14;
    f10 = f10-f11;
    f11 = f12*f13;
    f22 = Float64(heapClassInst.heapFloat[(r2+10)]);
    f2 = f16*f2;
    f5 = f17*f5;
    f0 = f16*f0;
    f4 = f17*f4;
    f18 = f18+f19;
    f19 = f15*f14;
    f20 = f20-f21;
    f21 = f15*f13;
    f8 = f8+f9;
    f9 = f10-f11;
    r2 = sp + (-656);
    f2 = f2+f5;
    f5 = f22*f14;
    f0 = f0-f4;
    f4 = f22*f13;
    f10 = f18+f19;
    f11 = f20-f21;
    f8 = f8+f9;
    r9 = r2 >> 2;
    f2 = f2+f5;
    f0 = f0-f4;
    f4 = f10+f11;
    heapClassInst.heapFloat[(fp+(-164))] = Float32(f8);
    f2 = f2+f0;
    heapClassInst.heapFloat[(r9+1)] = Float32(f4);
    heapClassInst.heapFloat[(r9+2)] = Float32(f2);
    r10 = r5 >> 2;
    heapClassInst.heap32[(r9+3)] = 0;
    f2 = Float64(heapClassInst.heapFloat[(r10+12)]);
    f4 = Float64(heapClassInst.heapFloat[(r10+13)]);
    f5 = Float64(heapClassInst.heapFloat[(r10+14)]);
    f8 = f1*f2;
    f10 = f3*f4;
    f13 = f6*f2;
    f14 = f7*f4;
    f8 = f8+f10;
    f10 = f12*f5;
    f8 = f8+f10;
    f2 = f16*f2;
    f4 = f17*f4;
    f10 = f13+f14;
    f13 = f15*f5;
    r9 = sp + (-672);
    f10 = f10+f13;
    f2 = f2+f4;
    f4 = f22*f5;
    f5 = f8+f9;
    f2 = f2+f4;
    r11 = r9 >> 2;
    f4 = f10+f11;
    heapClassInst.heapFloat[(fp+(-168))] = Float32(f5);
    f0 = f2+f0;
    heapClassInst.heapFloat[(r11+1)] = Float32(f4);
    heapClassInst.heapFloat[(r11+2)] = Float32(f0);
    heapClassInst.heap32[(r11+3)] = 0;
    f0 = Float64(heapClassInst.heapFloat[(r10)]);
    f2 = Float64(heapClassInst.heapFloat[(r10+4)]);
    f4 = Float64(heapClassInst.heapFloat[(r10+1)]);
    f5 = Float64(heapClassInst.heapFloat[(r10+5)]);
    f8 = Float64(heapClassInst.heapFloat[(r10+8)]);
    f9 = f0*f1;
    f10 = f2*f3;
    f11 = Float64(heapClassInst.heapFloat[(r10+2)]);
    f13 = Float64(heapClassInst.heapFloat[(r10+6)]);
    f14 = Float64(heapClassInst.heapFloat[(r10+10)]);
    f18 = Float64(heapClassInst.heapFloat[(r10+9)]);
    f19 = f4*f1;
    f20 = f5*f3;
    f9 = f9+f10;
    f10 = f8*f12;
    r10 = sp + (-736);
    f1 = f11*f1;
    f3 = f13*f3;
    f19 = f19+f20;
    f20 = f18*f12;
    f9 = f9+f10;
    r11 = r10 >> 2;
    f1 = f1+f3;
    f3 = f14*f12;
    f10 = f19+f20;
    heapClassInst.heapFloat[(fp+(-184))] = Float32(f9);
    f9 = f0*f6;
    f12 = f2*f7;
    f1 = f1+f3;
    heapClassInst.heapFloat[(r11+1)] = Float32(f10);
    heapClassInst.heapFloat[(r11+2)] = Float32(f1);
    f1 = f4*f6;
    f3 = f5*f7;
    f9 = f9+f12;
    f10 = f8*f15;
    f6 = f11*f6;
    f7 = f13*f7;
    f1 = f1+f3;
    f3 = f18*f15;
    f9 = f9+f10;
    heapClassInst.heap32[(r11+3)] = 0;
    f6 = f6+f7;
    f7 = f14*f15;
    f1 = f1+f3;
    heapClassInst.heapFloat[(r11+4)] = Float32(f9);
    f0 = f0*f16;
    f2 = f2*f17;
    f3 = f6+f7;
    heapClassInst.heapFloat[(r11+5)] = Float32(f1);
    heapClassInst.heapFloat[(r11+6)] = Float32(f3);
    f1 = f4*f16;
    f3 = f5*f17;
    f0 = f0+f2;
    f2 = f8*f22;
    f4 = f11*f16;
    f5 = f13*f17;
    f1 = f1+f3;
    f3 = f18*f22;
    f0 = f0+f2;
    heapClassInst.heap32[(r11+7)] = 0;
    f2 = f4+f5;
    f4 = f14*f22;
    f1 = f1+f3;
    heapClassInst.heapFloat[(r11+8)] = Float32(f0);
    f0 = f2+f4;
    heapClassInst.heapFloat[(r11+9)] = Float32(f1);
    heapClassInst.heapFloat[(r11+10)] = Float32(f0);
    heapClassInst.heap32[(r11+11)] = 0;
    heapClassInst.heap32[(r11+12)] = 0;
    heapClassInst.heap32[(r11+13)] = 0;
    heapClassInst.heap32[(r11+14)] = 0;
    heapClassInst.heap32[(r11+15)] = 0;
    r11 = Int64(heapClassInst.heap32[(r1)]);
    r11 = r11 >> 2;
    r11 = Int64(heapClassInst.heap32[(r11+11)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r11)>>2](i7);
    r11 = sp + (-960);
    heapClassInst.heap32[(g0)] = Int32(r11);
    heapClassInst.heap32[(g0+1)] = Int32(r3);
    heapClassInst.heap32[(g0+2)] = Int32(r4);
    heapClassInst.heap32[(g0+3)] = Int32(r5);
    heapClassInst.heap32[(g0+4)] = Int32(r7);
    heapClassInst.heapFloat[(g0+5)] = Float32(commonVariable.f_g0);
    r4 = _ZTVZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE32BridgeTriangleConvexcastCallback;
    _ZN28btTriangleConvexcastCallbackC2EPK13btConvexShapeRK11btTransformS5_S5_f(i7);
    r4 = (r4 + 8)|0;
    r5 = r11 >> 2;
    heapClassInst.heap32[(fp+(-240))] = Int32(r4);
    heapClassInst.heap32[(r5+52)] = Int32(r8);
    heapClassInst.heap32[(r5+53)] = Int32(r6);
    r4 = r8 >> 2;
    heapClassInst.heap32[(r5+54)] = Int32(r0);
    r0 = r3 >> 2;
    heapClassInst.heap32[(r5+50)] = heapClassInst.heap32[(r4+1)];
    r0 = Int64(heapClassInst.heap32[(r0)]);
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0+2)]);
    r4 = sp + (-976);
    r5 = sp + (-992);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r10);
    heapClassInst.heap32[(g0+2)] = Int32(r4);
    heapClassInst.heap32[(g0+3)] = Int32(r5);
    __FUNCTION_TABLE__[(r0)>>2](i7);
    r0 = _ZTVZN22btBvhTriangleMeshShape17performConvexcastEP18btTriangleCallbackRK9btVector3S4_S4_S4_E21MyNodeOverlapCallback;
    r3 = sp + (-16);
    r6 = Int64(heapClassInst.heap32[(r1+12)]);
    r0 = (r0 + 8)|0;
    r7 = r3 >> 2;
    heapClassInst.heap32[(fp+(-4))] = Int32(r0);
    heapClassInst.heap32[(r7+1)] = Int32(r6);
    heapClassInst.heap32[(r7+2)] = Int32(r11);
    r0 = Int64(heapClassInst.heap32[(r1+13)]);
    r1 = Int64(heapClassInst.heapU8[r0+60]);
    if(r1 == 0) 
{
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r3);
    heapClassInst.heap32[(g0+2)] = Int32(r2);
    heapClassInst.heap32[(g0+3)] = Int32(r9);
    heapClassInst.heap32[(g0+4)] = Int32(r4);
    heapClassInst.heap32[(g0+5)] = Int32(r5);
    _ZNK14btQuantizedBvh27walkStacklessTreeAgainstRayEP21btNodeOverlapCallbackRK9btVector3S4_S4_S4_ii(i7);
    return;
}
else{
    r1 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+14)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r3);
    heapClassInst.heap32[(g0+2)] = Int32(r2);
    heapClassInst.heap32[(g0+3)] = Int32(r9);
    heapClassInst.heap32[(g0+4)] = Int32(r4);
    heapClassInst.heap32[(g0+5)] = Int32(r5);
    heapClassInst.heap32[(g0+6)] = Int32(r1);
    _ZNK14btQuantizedBvh36walkStacklessQuantizedTreeAgainstRayEP21btNodeOverlapCallbackRK9btVector3S4_S4_S4_ii(i7);
    return;
}
}
}
}
else{
    r1 = _ZTVN12btConvexCast10CastResultE;
    r2 = sp + (-200);
    r1 = (r1 + 8)|0;
    r9 = r2 >> 2;
    heapClassInst.heap32[(fp+(-50))] = Int32(r1);
    heapClassInst.heap32[(r9+42)] = 0;
    r1 = sp + (-560);
    r10 = r8 >> 2;
    heapClassInst.heapFloat[(r9+43)] = Float32(f0);
    r11 = r1 >> 2;
    heapClassInst.heap32[(r9+41)] = heapClassInst.heap32[(r10+1)];
    r12 = _ZTV30btGjkEpaPenetrationDepthSolver;
    r13 = 0;
    heapClassInst.heap32[(r11+77)] = 953267991;
    r11 = _ZTV27btContinuousConvexCollision;
    r12 = (r12 + 8)|0;
    heapClassInst.heap8[sp+(-228)] = Int8(r13);
    r13 = sp + (-592);
    r11 = (r11 + 8)|0;
    heapClassInst.heap32[(fp+(-142))] = Int32(r12);
    r12 = r13 >> 2;
    heapClassInst.heap32[(fp+(-148))] = Int32(r11);
    r11 = sp + (-568);
    heapClassInst.heap32[(r12+1)] = Int32(r1);
    heapClassInst.heap32[(r12+2)] = Int32(r11);
    heapClassInst.heap32[(r12+3)] = Int32(r3);
    heapClassInst.heap32[(r12+4)] = Int32(r0);
    heapClassInst.heap32[(g0)] = Int32(r13);
    heapClassInst.heap32[(g0+1)] = Int32(r4);
    heapClassInst.heap32[(g0+2)] = Int32(r5);
    heapClassInst.heap32[(g0+3)] = Int32(r7);
    heapClassInst.heap32[(g0+4)] = Int32(r7);
    heapClassInst.heap32[(g0+5)] = Int32(r2);
    _ZN27btContinuousConvexCollision16calcTimeOfImpactERK11btTransformS2_S2_S2_RN12btConvexCast10CastResultE(i7);
    r0 = commonVariable.r_g0;
if(!(r0 == 0)) 
{
    f0 = Float64(heapClassInst.heapFloat[(r9+33)]);
    f1 = Float64(heapClassInst.heapFloat[(r9+34)]);
    f2 = Float64(heapClassInst.heapFloat[(r9+35)]);
    f0 = f0*f0;
    f1 = f1*f1;
    f0 = f0+f1;
    f1 = f2*f2;
    f0 = f0+f1;
    f1 =   9.9999997473787516e-005;
if(!(f0 <= f1)) 
{
    f1 = Float64(heapClassInst.heapFloat[(r9+41)]);
    f2 = Float64(heapClassInst.heapFloat[(r10+1)]);
if(!(f1 >= f2)) 
{
    heapClassInst.heapFloat[(g0)] = Float32(f0);
    sqrtf(i7);
    f1 =                         1.0;
    f2 = Float64(heapClassInst.heapFloat[(r9+33)]);
    f0 = f1/commonVariable.f_g0;
    f1 = f2*f0;
    heapClassInst.heapFloat[(r9+33)] = Float32(f1);
    f2 = Float64(heapClassInst.heapFloat[(r9+34)]);
    f2 = f2*f0;
    heapClassInst.heapFloat[(r9+34)] = Float32(f2);
    f3 = Float64(heapClassInst.heapFloat[(r9+35)]);
    f0 = f3*f0;
    heapClassInst.heapFloat[(r9+35)] = Float32(f0);
    r0 = sp + (-640);
    f3 = Float64(heapClassInst.heapFloat[(r9+41)]);
    r1 = r0 >> 2;
    heapClassInst.heap32[(fp+(-160))] = Int32(r6);
    heapClassInst.heap32[(r1+1)] = 0;
    heapClassInst.heapFloat[(r1+2)] = Float32(f1);
    heapClassInst.heapFloat[(r1+3)] = Float32(f2);
    heapClassInst.heapFloat[(r1+4)] = Float32(f0);
    heapClassInst.heap32[(r1+5)] = heapClassInst.heap32[(r9+36)];
    heapClassInst.heap32[(r1+6)] = heapClassInst.heap32[(r9+37)];
    heapClassInst.heap32[(r1+7)] = heapClassInst.heap32[(r9+38)];
    heapClassInst.heap32[(r1+8)] = heapClassInst.heap32[(r9+39)];
    heapClassInst.heap32[(r1+9)] = heapClassInst.heap32[(r9+40)];
    heapClassInst.heapFloat[(r1+10)] = Float32(f3);
    r1 = Int64(heapClassInst.heap32[(r10)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1+3)]);
    heapClassInst.heap32[(g0)] = Int32(r8);
    heapClassInst.heap32[(g0+1)] = Int32(r0);
    heapClassInst.heap32[(g0+2)] = 1;
    __FUNCTION_TABLE__[(r1)>>2](i7);
}
}
}
}
} while(false);
    return;
}

func _ZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackE(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var f11: Float64 = 0.0
    var f12: Float64 = 0.0
    var f13: Float64 = 0.0
    var f14: Float64 = 0.0
    var f15: Float64 = 0.0
    var f16: Float64 = 0.0
    var f17: Float64 = 0.0
    var f18: Float64 = 0.0
    var f19: Float64 = 0.0
    var f20: Float64 = 0.0
    var f21: Float64 = 0.0
    var f22: Float64 = 0.0
    var f23: Float64 = 0.0
    var f24: Float64 = 0.0
    var f25: Float64 = 0.0
    var f26: Float64 = 0.0
    var f27: Float64 = 0.0
    var f28: Float64 = 0.0
    var f29: Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-1120);
var g0 = i7>>2; 
    r0 = sp + (-104);
    r1 = r0 >> 2;
    heapClassInst.heap32[(r1+2)] = 0;
    heapClassInst.heap32[(r1+3)] = 1065353216;
    heapClassInst.heap32[(r1+4)] = 1065353216;
    r2 = _ZTV13btSphereShape;
    heapClassInst.heap32[(r1+5)] = 1065353216;
    r2 = (r2 + 8)|0;
    heapClassInst.heap32[(r1+6)] = 0;
    heapClassInst.heap32[(fp+(-26))] = Int32(r2);
    heapClassInst.heap32[(r1+1)] = 8;
    r2 = Int64(heapClassInst.heap32[(fp+3)]);
    heapClassInst.heap32[(r1+7)] = 0;
    r3 = r2 >> 2;
    heapClassInst.heap32[(r1+11)] = 0;
    r1 = Int64(heapClassInst.heap32[(r3+1)]);
    r4 = Int64(heapClassInst.heap32[(fp)]);
    r5 = Int64(heapClassInst.heap32[(fp+1)]);
    r6 = Int64(heapClassInst.heap32[(fp+2)]);
    r7 = Int64(heapClassInst.heap32[(fp+4)]);
    r8 = Int64(heapClassInst.heap32[(fp+5)]);
    if(r1 > 19) 
{
    r0 = (r1 + (-21))|0;
    if(`UIntNative`(r0) > `UIntNative`(8)) 
{
if(!(r1 != 31)) 
{
    r0 = Int64(heapClassInst.heap32[(r3+4)]);
if(!(r0 < 1)) 
{
    r0 = 0;
while(true){
    r1 = (r0 * 20)|0;
    r2 = Int64(heapClassInst.heap32[(r3+6)]);
    r1 = r1 << 2;
    r1 = (r2 + r1)|0;
    r1 = r1 >> 2;
    r2 = r7 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r1)]);
    f1 = Float64(heapClassInst.heapFloat[(r2)]);
    f2 = Float64(heapClassInst.heapFloat[(r1+4)]);
    f3 = Float64(heapClassInst.heapFloat[(r2+1)]);
    f4 = Float64(heapClassInst.heapFloat[(r1+1)]);
    f5 = Float64(heapClassInst.heapFloat[(r1+5)]);
    f6 = f0*f1;
    f7 = f2*f3;
    f8 = Float64(heapClassInst.heapFloat[(r1+8)]);
    f9 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f10 = Float64(heapClassInst.heapFloat[(r2+8)]);
    f11 = Float64(heapClassInst.heapFloat[(r1+2)]);
    f12 = Float64(heapClassInst.heapFloat[(r2+4)]);
    f13 = Float64(heapClassInst.heapFloat[(r1+12)]);
    f14 = Float64(heapClassInst.heapFloat[(r2+9)]);
    f15 = Float64(heapClassInst.heapFloat[(r1+6)]);
    f16 = Float64(heapClassInst.heapFloat[(r2+5)]);
    f17 = Float64(heapClassInst.heapFloat[(r1+13)]);
    f18 = Float64(heapClassInst.heapFloat[(r1+9)]);
    f19 = Float64(heapClassInst.heapFloat[(r2+10)]);
    f20 = Float64(heapClassInst.heapFloat[(r1+10)]);
    f21 = Float64(heapClassInst.heapFloat[(r2+6)]);
    f22 = Float64(heapClassInst.heapFloat[(r1+14)]);
    f23 = f4*f1;
    f24 = f5*f3;
    f6 = f6+f7;
    f7 = f8*f9;
    r1 = Int64(heapClassInst.heap32[(r1+16)]);
    f25 = Float64(heapClassInst.heapFloat[(r2+14)]);
    f26 = Float64(heapClassInst.heapFloat[(r2+13)]);
    f27 = Float64(heapClassInst.heapFloat[(r2+12)]);
    r2 = sp + (-1056);
    f28 = f11*f1;
    f29 = f15*f3;
    f23 = f23+f24;
    f24 = f18*f9;
    f6 = f6+f7;
    r9 = r2 >> 2;
    f7 = f28+f29;
    f28 = f20*f9;
    f23 = f23+f24;
    heapClassInst.heapFloat[(fp+(-264))] = Float32(f6);
    f6 = f0*f12;
    f24 = f2*f16;
    f7 = f7+f28;
    heapClassInst.heapFloat[(r9+1)] = Float32(f23);
    heapClassInst.heapFloat[(r9+2)] = Float32(f7);
    f7 = f4*f12;
    f23 = f5*f16;
    f6 = f6+f24;
    f24 = f8*f21;
    f28 = f11*f12;
    f29 = f15*f16;
    f7 = f7+f23;
    f23 = f18*f21;
    f6 = f6+f24;
    heapClassInst.heap32[(r9+3)] = 0;
    f24 = f28+f29;
    f28 = f20*f21;
    f7 = f7+f23;
    heapClassInst.heapFloat[(r9+4)] = Float32(f6);
    f0 = f0*f10;
    f2 = f2*f14;
    f6 = f24+f28;
    heapClassInst.heapFloat[(r9+5)] = Float32(f7);
    heapClassInst.heapFloat[(r9+6)] = Float32(f6);
    f4 = f4*f10;
    f5 = f5*f14;
    f0 = f0+f2;
    f2 = f8*f19;
    f6 = f11*f10;
    f7 = f15*f14;
    f4 = f4+f5;
    f5 = f18*f19;
    f0 = f0+f2;
    heapClassInst.heap32[(r9+7)] = 0;
    f1 = f1*f13;
    f2 = f3*f17;
    f3 = f6+f7;
    f6 = f20*f19;
    f4 = f4+f5;
    heapClassInst.heapFloat[(r9+8)] = Float32(f0);
    f0 = f12*f13;
    f5 = f16*f17;
    f1 = f1+f2;
    f2 = f9*f22;
    f3 = f3+f6;
    heapClassInst.heapFloat[(r9+9)] = Float32(f4);
    f1 = f1+f2;
    heapClassInst.heapFloat[(r9+10)] = Float32(f3);
    f2 = f10*f13;
    f3 = f14*f17;
    f0 = f0+f5;
    f4 = f21*f22;
    f0 = f0+f4;
    f2 = f2+f3;
    f3 = f19*f22;
    f1 = f1+f27;
    heapClassInst.heap32[(r9+11)] = 0;
    f2 = f2+f3;
    f0 = f0+f26;
    heapClassInst.heapFloat[(r9+12)] = Float32(f1);
    f1 = f2+f25;
    heapClassInst.heapFloat[(r9+13)] = Float32(f0);
    heapClassInst.heapFloat[(r9+14)] = Float32(f1);
    r10 = r6 >> 2;
    heapClassInst.heap32[(r9+15)] = 0;
    r9 = sp + (-1088);
    r11 = Int64(heapClassInst.heap32[(r10+48)]);
    r12 = r9 >> 2;
    heapClassInst.heap32[(r10+48)] = Int32(r1);
    r13 = 1;
    heapClassInst.heap32[(r12+2)] = 0;
    r14 = ( -1);
    heapClassInst.heap16[(sp+(-1076))>>1] = Int16(r13);
    heapClassInst.heap16[(sp+(-1074))>>1] = Int16(r14);
    r13 = _ZTVZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE15LocalInfoAdder2;
    heapClassInst.heap32[(r12+4)] = 0;
    r13 = (r13 + 8)|0;
    heapClassInst.heap32[(fp+(-272))] = Int32(r13);
    heapClassInst.heap32[(r12+5)] = Int32(r8);
    r14 = r8 >> 2;
    heapClassInst.heap32[(r12+6)] = Int32(r0);
    heapClassInst.heap32[(r12+1)] = heapClassInst.heap32[(r14+1)];
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0+1)] = Int32(r5);
    heapClassInst.heap32[(g0+2)] = Int32(r6);
    heapClassInst.heap32[(g0+3)] = Int32(r1);
    heapClassInst.heap32[(g0+4)] = Int32(r2);
    heapClassInst.heap32[(g0+5)] = Int32(r9);
    _ZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackE(i7);
    r0 = (r0 + 1)|0;
    heapClassInst.heap32[(r10+48)] = Int32(r11);
    heapClassInst.heap32[(fp+(-272))] = Int32(r13);
    r1 = Int64(heapClassInst.heap32[(r3+4)]);
if(!(r1 > r0)) 
{
break 
}
}
}
}
    return;
}
else{
    if(r1 != 21) 
{
    r1 = r7 >> 2;
    r4 = r4 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r1+12)]);
    f1 = Float64(heapClassInst.heapFloat[(r1+13)]);
    f2 = Float64(heapClassInst.heapFloat[(r1+4)]);
    f3 = Float64(heapClassInst.heapFloat[(r4+13)]);
    f4 = Float64(heapClassInst.heapFloat[(r1)]);
    f5 = -f0;
    f6 = Float64(heapClassInst.heapFloat[(r4+12)]);
    f7 = Float64(heapClassInst.heapFloat[(r1+5)]);
    f8 = Float64(heapClassInst.heapFloat[(r1+1)]);
    f9 = f4*f6;
    f10 = f2*f3;
    f11 = f4*f5;
    f12 = f2*f1;
    f13 = Float64(heapClassInst.heapFloat[(r1+14)]);
    f14 = Float64(heapClassInst.heapFloat[(r1+8)]);
    f15 = Float64(heapClassInst.heapFloat[(r4+14)]);
    r4 = r5 >> 2;
    f16 = Float64(heapClassInst.heapFloat[(r1+9)]);
    f17 = Float64(heapClassInst.heapFloat[(r1+6)]);
    f18 = Float64(heapClassInst.heapFloat[(r1+2)]);
    r5 = r8 >> 2;
    f9 = f9+f10;
    f10 = f14*f15;
    f11 = f11-f12;
    f12 = f14*f13;
    f19 = f8*f6;
    f20 = f7*f3;
    f21 = f8*f5;
    f22 = f7*f1;
    f23 = Float64(heapClassInst.heapFloat[(r4+12)]);
    f24 = Float64(heapClassInst.heapFloat[(r4+13)]);
    f25 = Float64(heapClassInst.heapFloat[(r1+10)]);
    f26 = Float64(heapClassInst.heapFloat[(r4+14)]);
    r4 = sp + (-960);
    r7 = Int64(heapClassInst.heap32[(r5+4)]);
    f9 = f9+f10;
    f10 = f11-f12;
    f6 = f18*f6;
    f3 = f17*f3;
    f11 = f19+f20;
    f12 = f16*f15;
    f5 = f18*f5;
    f19 = f17*f1;
    f20 = f21-f22;
    f21 = f16*f13;
    f9 = f9+f10;
    f3 = f6+f3;
    f6 = f25*f15;
    f11 = f11+f12;
    f12 = f20-f21;
    r0 = r4 >> 2;
    f5 = f5-f19;
    f15 = f25*f13;
    f11 = f11+f12;
    heapClassInst.heapFloat[(r0+1)] = Float32(f9);
    f19 = f4*f23;
    f20 = f2*f24;
    f3 = f3+f6;
    f5 = f5-f15;
    f3 = f3+f5;
    heapClassInst.heapFloat[(r0+2)] = Float32(f11);
    f6 = f19+f20;
    f15 = f14*f26;
    f19 = f8*f23;
    f20 = f7*f24;
    f6 = f6+f15;
    heapClassInst.heapFloat[(r0+3)] = Float32(f3);
    f15 = f18*f23;
    f21 = f17*f24;
    f19 = f19+f20;
    f20 = f16*f26;
    f6 = f6+f10;
    f10 = f19+f20;
    heapClassInst.heap32[(r0+4)] = 0;
    f15 = f15+f21;
    f19 = f25*f26;
    f15 = f15+f19;
    f10 = f10+f12;
    heapClassInst.heapFloat[(r0+5)] = Float32(f6);
    f5 = f15+f5;
    heapClassInst.heapFloat[(r0+6)] = Float32(f10);
    heapClassInst.heapFloat[(r0+7)] = Float32(f5);
    r9 = _ZTVZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE29BridgeTriangleRaycastCallback_0;
    heapClassInst.heap32[(r0+8)] = 0;
    r9 = (r9 + 8)|0;
    heapClassInst.heap32[(r0+9)] = Int32(r7);
    heapClassInst.heap32[(fp+(-240))] = Int32(r9);
    heapClassInst.heap32[(r0+11)] = Int32(r8);
    heapClassInst.heap32[(r0+12)] = Int32(r6);
    heapClassInst.heap32[(r0+13)] = Int32(r2);
    heapClassInst.heapFloat[(r0+14)] = Float32(f4);
    heapClassInst.heapFloat[(r0+15)] = Float32(f8);
    heapClassInst.heapFloat[(r0+16)] = Float32(f18);
    heapClassInst.heap32[(r0+17)] = heapClassInst.heap32[(r1+3)];
    heapClassInst.heapFloat[(r0+18)] = Float32(f2);
    heapClassInst.heapFloat[(r0+19)] = Float32(f7);
    heapClassInst.heapFloat[(r0+20)] = Float32(f17);
    heapClassInst.heap32[(r0+21)] = heapClassInst.heap32[(r1+7)];
    heapClassInst.heapFloat[(r0+22)] = Float32(f14);
    heapClassInst.heapFloat[(r0+23)] = Float32(f16);
    heapClassInst.heapFloat[(r0+24)] = Float32(f25);
    heapClassInst.heap32[(r0+25)] = heapClassInst.heap32[(r1+11)];
    heapClassInst.heapFloat[(r0+26)] = Float32(f0);
    heapClassInst.heapFloat[(r0+27)] = Float32(f1);
    heapClassInst.heapFloat[(r0+28)] = Float32(f13);
    heapClassInst.heap32[(r0+29)] = heapClassInst.heap32[(r1+15)];
    r1 = sp + (-976);
    heapClassInst.heap32[(r0+10)] = heapClassInst.heap32[(r5+1)];
    r5 = r1 >> 2;
    heapClassInst.heapFloat[(fp+(-244))] = Float32(f9);
    heapClassInst.heapFloat[(r5+1)] = Float32(f11);
    heapClassInst.heapFloat[(r5+2)] = Float32(f3);
    heapClassInst.heap32[(r5+3)] = 0;
if(!(f6 >= f9)) 
{
    heapClassInst.heapFloat[(fp+(-244))] = Float32(f6);
}
if(!(f10 >= f11)) 
{
    heapClassInst.heapFloat[(r5+1)] = Float32(f10);
}
if(!(f5 >= f3)) 
{
    heapClassInst.heapFloat[(r5+2)] = Float32(f5);
}
    r5 = sp + (-992);
    r6 = r5 >> 2;
    heapClassInst.heapFloat[(fp+(-248))] = Float32(f9);
    heapClassInst.heapFloat[(r6+1)] = Float32(f11);
    heapClassInst.heapFloat[(r6+2)] = Float32(f3);
    heapClassInst.heap32[(r6+3)] = 0;
if(!(f9 >= f6)) 
{
    heapClassInst.heapFloat[(fp+(-248))] = Float32(f6);
}
if(!(f11 >= f10)) 
{
    heapClassInst.heapFloat[(r6+1)] = Float32(f10);
}
if(!(f3 >= f5)) 
{
    heapClassInst.heapFloat[(r6+2)] = Float32(f5);
}
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+15)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0+1)] = Int32(r4);
    heapClassInst.heap32[(g0+2)] = Int32(r1);
    heapClassInst.heap32[(g0+3)] = Int32(r5);
    r1 = _ZTV18btTriangleCallback;
    r1 = (r1 + 8)|0;
    __FUNCTION_TABLE__[(r3)>>2](i7);
    heapClassInst.heap32[(fp+(-240))] = Int32(r1);
    return;
}
else{
    r1 = r7 >> 2;
    r4 = r4 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r1+12)]);
    f1 = Float64(heapClassInst.heapFloat[(r1+13)]);
    f2 = Float64(heapClassInst.heapFloat[(r1+4)]);
    f3 = Float64(heapClassInst.heapFloat[(r4+13)]);
    f4 = Float64(heapClassInst.heapFloat[(r1)]);
    f5 = Float64(heapClassInst.heapFloat[(r4+12)]);
    f6 = -f0;
    f7 = Float64(heapClassInst.heapFloat[(r1+5)]);
    f8 = Float64(heapClassInst.heapFloat[(r1+1)]);
    f9 = Float64(heapClassInst.heapFloat[(r1+14)]);
    f10 = Float64(heapClassInst.heapFloat[(r1+8)]);
    f11 = Float64(heapClassInst.heapFloat[(r4+14)]);
    f12 = f4*f5;
    f13 = f2*f3;
    f14 = f4*f6;
    f15 = f2*f1;
    f16 = Float64(heapClassInst.heapFloat[(r1+9)]);
    f17 = Float64(heapClassInst.heapFloat[(r1+6)]);
    f18 = Float64(heapClassInst.heapFloat[(r1+2)]);
    f19 = f8*f5;
    f20 = f7*f3;
    f21 = f8*f6;
    f22 = f7*f1;
    f12 = f12+f13;
    f13 = f10*f11;
    f14 = f14-f15;
    f15 = f10*f9;
    f23 = Float64(heapClassInst.heapFloat[(r1+10)]);
    f5 = f18*f5;
    f3 = f17*f3;
    f6 = f18*f6;
    f24 = f17*f1;
    f19 = f19+f20;
    f20 = f16*f11;
    f21 = f21-f22;
    f22 = f16*f9;
    f12 = f12+f13;
    f13 = f14-f15;
    r4 = sp + (-704);
    f12 = f12+f13;
    f3 = f5+f3;
    f5 = f23*f11;
    f6 = f6-f24;
    f11 = f23*f9;
    f14 = f19+f20;
    f15 = f21-f22;
    r7 = r4 >> 2;
    heapClassInst.heapFloat[(fp+(-176))] = Float32(f12);
    f14 = f14+f15;
    f3 = f3+f5;
    f5 = f6-f11;
    heapClassInst.heapFloat[(r7+1)] = Float32(f14);
    f3 = f3+f5;
    heapClassInst.heapFloat[(r7+2)] = Float32(f3);
    r5 = r5 >> 2;
    heapClassInst.heap32[(r7+3)] = 0;
    f6 = Float64(heapClassInst.heapFloat[(r5+12)]);
    f11 = Float64(heapClassInst.heapFloat[(r5+13)]);
    f19 = Float64(heapClassInst.heapFloat[(r5+14)]);
    f20 = f4*f6;
    f21 = f2*f11;
    f22 = f8*f6;
    f24 = f7*f11;
    f20 = f20+f21;
    f21 = f10*f19;
    f20 = f20+f21;
    f6 = f18*f6;
    f11 = f17*f11;
    f21 = f22+f24;
    f22 = f16*f19;
    r5 = sp + (-720);
    f21 = f21+f22;
    f13 = f20+f13;
    f6 = f6+f11;
    f11 = f23*f19;
    f6 = f6+f11;
    r7 = r5 >> 2;
    heapClassInst.heapFloat[(fp+(-180))] = Float32(f13);
    f11 = f21+f15;
    heapClassInst.heapFloat[(r7+1)] = Float32(f11);
    f5 = f6+f5;
    heapClassInst.heapFloat[(r7+2)] = Float32(f5);
    r0 = sp + (-840);
    r9 = r8 >> 2;
    heapClassInst.heap32[(r7+3)] = 0;
    r7 = r0 >> 2;
    r10 = Int64(heapClassInst.heap32[(r9+4)]);
    heapClassInst.heapFloat[(r7+1)] = Float32(f12);
    heapClassInst.heapFloat[(r7+2)] = Float32(f14);
    heapClassInst.heapFloat[(r7+3)] = Float32(f3);
    heapClassInst.heap32[(r7+4)] = 0;
    heapClassInst.heapFloat[(r7+5)] = Float32(f13);
    heapClassInst.heapFloat[(r7+6)] = Float32(f11);
    heapClassInst.heapFloat[(r7+7)] = Float32(f5);
    r11 = _ZTVZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE29BridgeTriangleRaycastCallback;
    heapClassInst.heap32[(r7+8)] = 0;
    r11 = (r11 + 8)|0;
    heapClassInst.heap32[(r7+9)] = Int32(r10);
    heapClassInst.heap32[(fp+(-210))] = Int32(r11);
    heapClassInst.heap32[(r7+11)] = Int32(r8);
    heapClassInst.heap32[(r7+12)] = Int32(r6);
    heapClassInst.heap32[(r7+13)] = Int32(r2);
    heapClassInst.heapFloat[(r7+14)] = Float32(f4);
    heapClassInst.heapFloat[(r7+15)] = Float32(f8);
    heapClassInst.heapFloat[(r7+16)] = Float32(f18);
    heapClassInst.heap32[(r7+17)] = heapClassInst.heap32[(r1+3)];
    heapClassInst.heapFloat[(r7+18)] = Float32(f2);
    heapClassInst.heapFloat[(r7+19)] = Float32(f7);
    heapClassInst.heapFloat[(r7+20)] = Float32(f17);
    heapClassInst.heap32[(r7+21)] = heapClassInst.heap32[(r1+7)];
    heapClassInst.heapFloat[(r7+22)] = Float32(f10);
    heapClassInst.heapFloat[(r7+23)] = Float32(f16);
    heapClassInst.heapFloat[(r7+24)] = Float32(f23);
    heapClassInst.heap32[(r7+25)] = heapClassInst.heap32[(r1+11)];
    heapClassInst.heapFloat[(r7+26)] = Float32(f0);
    heapClassInst.heapFloat[(r7+27)] = Float32(f1);
    heapClassInst.heapFloat[(r7+28)] = Float32(f9);
    heapClassInst.heap32[(r7+29)] = heapClassInst.heap32[(r1+15)];
    r1 = _ZTVZN22btBvhTriangleMeshShape14performRaycastEP18btTriangleCallbackRK9btVector3S4_E21MyNodeOverlapCallback;
    heapClassInst.heap32[(r7+10)] = heapClassInst.heap32[(r9+1)];
    r2 = sp + (-48);
    r6 = Int64(heapClassInst.heap32[(r3+12)]);
    r1 = (r1 + 8)|0;
    r7 = r2 >> 2;
    heapClassInst.heap32[(fp+(-12))] = Int32(r1);
    heapClassInst.heap32[(r7+1)] = Int32(r6);
    heapClassInst.heap32[(r7+2)] = Int32(r0);
    r1 = Int64(heapClassInst.heap32[(r3+13)]);
    r3 = sp + (-32);
    r6 = r3 >> 2;
    heapClassInst.heap32[(fp+(-8))] = 0;
    heapClassInst.heap32[(r6+1)] = 0;
    heapClassInst.heap32[(r6+2)] = 0;
    r7 = sp + (-16);
    heapClassInst.heap32[(r6+3)] = 0;
    r6 = r7 >> 2;
    heapClassInst.heap32[(fp+(-4))] = 0;
    heapClassInst.heap32[(r6+1)] = 0;
    heapClassInst.heap32[(r6+2)] = 0;
    heapClassInst.heap32[(r6+3)] = 0;
    r6 = Int64(heapClassInst.heapU8[r1+60]);
    if(r6 == 0) 
{
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0+1)] = Int32(r2);
    heapClassInst.heap32[(g0+2)] = Int32(r4);
    heapClassInst.heap32[(g0+3)] = Int32(r5);
    heapClassInst.heap32[(g0+4)] = Int32(r7);
    heapClassInst.heap32[(g0+5)] = Int32(r3);
    _ZNK14btQuantizedBvh27walkStacklessTreeAgainstRayEP21btNodeOverlapCallbackRK9btVector3S4_S4_S4_ii(i7);
}
else{
    r6 = r1 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6+14)]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0+1)] = Int32(r2);
    heapClassInst.heap32[(g0+2)] = Int32(r4);
    heapClassInst.heap32[(g0+3)] = Int32(r5);
    heapClassInst.heap32[(g0+4)] = Int32(r7);
    heapClassInst.heap32[(g0+5)] = Int32(r3);
    heapClassInst.heap32[(g0+6)] = Int32(r6);
    _ZNK14btQuantizedBvh36walkStacklessQuantizedTreeAgainstRayEP21btNodeOverlapCallbackRK9btVector3S4_S4_S4_ii(i7);
}
    r1 = _ZTV18btTriangleCallback;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(fp+(-210))] = Int32(r1);
    return;
}
}
}
else{
    r1 = _ZTVN12btConvexCast10CastResultE;
    r3 = sp + (-280);
    r1 = (r1 + 8)|0;
    r9 = r3 >> 2;
    heapClassInst.heap32[(fp+(-70))] = Int32(r1);
    heapClassInst.heap32[(r9+42)] = 0;
    r1 = sp + (-640);
    r10 = r8 >> 2;
    heapClassInst.heap32[(r9+43)] = 0;
    r11 = r1 >> 2;
    heapClassInst.heap32[(r9+41)] = heapClassInst.heap32[(r10+1)];
    r12 = _ZTV22btSubsimplexConvexCast;
    r13 = 0;
    heapClassInst.heap32[(r11+77)] = 953267991;
    r11 = sp + (-656);
    r12 = (r12 + 8)|0;
    heapClassInst.heap8[sp+(-308)] = Int8(r13);
    r13 = r11 >> 2;
    heapClassInst.heap32[(fp+(-164))] = Int32(r12);
    heapClassInst.heap32[(r13+1)] = Int32(r1);
    heapClassInst.heap32[(r13+2)] = Int32(r0);
    heapClassInst.heap32[(r13+3)] = Int32(r2);
    heapClassInst.heap32[(g0)] = Int32(r11);
    heapClassInst.heap32[(g0+1)] = Int32(r4);
    heapClassInst.heap32[(g0+2)] = Int32(r5);
    heapClassInst.heap32[(g0+3)] = Int32(r7);
    heapClassInst.heap32[(g0+4)] = Int32(r7);
    heapClassInst.heap32[(g0+5)] = Int32(r3);
    _ZN22btSubsimplexConvexCast16calcTimeOfImpactERK11btTransformS2_S2_S2_RN12btConvexCast10CastResultE(i7);
    r1 = commonVariable.r_g0;
if(!(r1 == 0)) 
{
    f0 = Float64(heapClassInst.heapFloat[(r9+33)]);
    f1 = Float64(heapClassInst.heapFloat[(r9+34)]);
    f2 = Float64(heapClassInst.heapFloat[(r9+35)]);
    f3 = f0*f0;
    f4 = f1*f1;
    f3 = f3+f4;
    f4 = f2*f2;
    f3 = f3+f4;
    f4 =   9.9999997473787516e-005;
if(!(f3 <= f4)) 
{
    f3 = Float64(heapClassInst.heapFloat[(r9+41)]);
    f4 = Float64(heapClassInst.heapFloat[(r10+1)]);
if(!(f3 >= f4)) 
{
    r1 = r4 >> 2;
    f4 = Float64(heapClassInst.heapFloat[(r1+4)]);
    f5 = Float64(heapClassInst.heapFloat[(r1)]);
    f6 = Float64(heapClassInst.heapFloat[(r1+5)]);
    f7 = Float64(heapClassInst.heapFloat[(r1+1)]);
    f8 = Float64(heapClassInst.heapFloat[(r1+8)]);
    f9 = Float64(heapClassInst.heapFloat[(r1+9)]);
    f4 = f4*f0;
    f6 = f6*f1;
    f10 = Float64(heapClassInst.heapFloat[(r1+6)]);
    f11 = Float64(heapClassInst.heapFloat[(r1+2)]);
    f5 = f5*f0;
    f7 = f7*f1;
    f12 = Float64(heapClassInst.heapFloat[(r1+10)]);
    f0 = f8*f0;
    f1 = f9*f1;
    f4 = f4+f6;
    f6 = f10*f2;
    f5 = f5+f7;
    f7 = f11*f2;
    f4 = f4+f6;
    f5 = f5+f7;
    f0 = f0+f1;
    f1 = f12*f2;
    f0 = f0+f1;
    f1 = f5*f5;
    f2 = f4*f4;
    heapClassInst.heap32[(r9+36)] = 0;
    f1 = f1+f2;
    f2 = f0*f0;
    f1 = f1+f2;
    heapClassInst.heapFloat[(g0)] = Float32(f1);
    f1 =                         1.0;
    sqrtf(i7);
    f1 = f1/commonVariable.f_g0;
    f2 = f5*f1;
    f4 = f4*f1;
    heapClassInst.heapFloat[(r9+33)] = Float32(f2);
    f0 = f0*f1;
    heapClassInst.heapFloat[(r9+34)] = Float32(f4);
    r1 = sp + (-688);
    heapClassInst.heapFloat[(r9+35)] = Float32(f0);
    r2 = r1 >> 2;
    heapClassInst.heap32[(fp+(-172))] = Int32(r6);
    heapClassInst.heap32[(r2+1)] = 0;
    heapClassInst.heapFloat[(r2+2)] = Float32(f2);
    heapClassInst.heapFloat[(r2+3)] = Float32(f4);
    heapClassInst.heapFloat[(r2+4)] = Float32(f0);
    heapClassInst.heap32[(r2+5)] = 0;
    heapClassInst.heapFloat[(r2+6)] = Float32(f3);
    r2 = Int64(heapClassInst.heap32[(r10)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+3)]);
    heapClassInst.heap32[(g0)] = Int32(r8);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = 1;
    __FUNCTION_TABLE__[(r2)>>2](i7);
}
}
}
    r1 = _ZTV12btConvexCast;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(fp+(-164))] = Int32(r1);
    return;
}
}

func _ZN22btCompoundLeafCallbackD1Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
var __label__ = 0;
    i7 = sp + 0;
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV22btCompoundLeafCallback;
    r0 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r0)] = Int32(r1);
    return;
}

func _ZN22btCompoundLeafCallbackD0Ev(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV22btCompoundLeafCallback;
    r2 = r0 >> 2;
    r1 = (r1 + 8)|0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
    return;
}

func _ZN22btCompoundLeafCallback7ProcessEPK10btDbvtNode(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
var __label__ = 0;
    i7 = sp + (-136);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1+1)]);
    r3 = Int64(heapClassInst.heap32[(fp+1)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+48)]);
    r4 = r3 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+9)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+6)]);
    r5 = (r4 * 80)|0;
    r6 = Int64(heapClassInst.heap32[(r1+4)]);
    r2 = (r2 + r5)|0;
    r5 = r6 >> 2;
    r2 = r2 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5+5)]);
    r2 = Int64(heapClassInst.heap32[(r2+16)]);
if(!(r5 == 0)) 
{
    r6 = r5 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6)]);
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6+12)]);
    heapClassInst.heap32[(g0)] = Int32(r5);
    __FUNCTION_TABLE__[(r6)>>2](i7);
    r5 = commonVariable.r_g0 & 2;
if(!(r5 == 0)) 
{
    r5 = Int64(heapClassInst.heap32[(r1+1)]);
    r6 = sp + (-112);
    r5 = r5 >> 2;
    r7 = r6 >> 2;
    heapClassInst.heap32[(fp+(-28))] = heapClassInst.heap32[(r5+1)];
    heapClassInst.heap32[(r7+1)] = heapClassInst.heap32[(r5+2)];
    heapClassInst.heap32[(r7+2)] = heapClassInst.heap32[(r5+3)];
    heapClassInst.heap32[(r7+3)] = heapClassInst.heap32[(r5+4)];
    heapClassInst.heap32[(r7+4)] = heapClassInst.heap32[(r5+5)];
    heapClassInst.heap32[(r7+5)] = heapClassInst.heap32[(r5+6)];
    heapClassInst.heap32[(r7+6)] = heapClassInst.heap32[(r5+7)];
    heapClassInst.heap32[(r7+7)] = heapClassInst.heap32[(r5+8)];
    heapClassInst.heap32[(r7+8)] = heapClassInst.heap32[(r5+9)];
    heapClassInst.heap32[(r7+9)] = heapClassInst.heap32[(r5+10)];
    heapClassInst.heap32[(r7+10)] = heapClassInst.heap32[(r5+11)];
    heapClassInst.heap32[(r7+11)] = heapClassInst.heap32[(r5+12)];
    heapClassInst.heap32[(r7+12)] = heapClassInst.heap32[(r5+13)];
    heapClassInst.heap32[(r7+13)] = heapClassInst.heap32[(r5+14)];
    heapClassInst.heap32[(r7+14)] = heapClassInst.heap32[(r5+15)];
    heapClassInst.heap32[(r7+15)] = heapClassInst.heap32[(r5+16)];
    r5 = (r3 + 16)|0;
    r7 = sp + (-32);
    r8 = sp + (-48);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r5);
    heapClassInst.heap32[(g0+2)] = 0;
    heapClassInst.heap32[(g0+3)] = Int32(r6);
    heapClassInst.heap32[(g0+4)] = Int32(r7);
    heapClassInst.heap32[(g0+5)] = Int32(r8);
    _Z15btTransformAabbRK9btVector3S1_fRK11btTransformRS_S5_(i7);
    r1 = Int64(heapClassInst.heap32[(r1+4)]);
    r1 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r1+5)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3+13)]);
    r5 = sp + (-16);
    r6 = r5 >> 2;
    heapClassInst.heap32[(fp+(-4))] = 1065353216;
    heapClassInst.heap32[(r6+1)] = 0;
    heapClassInst.heap32[(r6+2)] = 0;
    heapClassInst.heap32[(r6+3)] = 0;
    r1 = Int64(heapClassInst.heap32[(r1+5)]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0+1)] = Int32(r7);
    heapClassInst.heap32[(g0+2)] = Int32(r8);
    heapClassInst.heap32[(g0+3)] = Int32(r5);
    __FUNCTION_TABLE__[(r3)>>2](i7);
}
}
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r2);
    heapClassInst.heap32[(g0+2)] = Int32(r4);
    _ZN22btCompoundLeafCallback17ProcessChildShapeEP16btCollisionShapei(i7);
    return;
}

func _ZN28btCompoundCollisionAlgorithm22getAllContactManifoldsER20btAlignedObjectArrayIP20btPersistentManifoldE(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
var __label__ = 0;
    i7 = sp + (-8);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0+3)]);
if(!(r1 < 1)) 
{
    r1 = Int64(heapClassInst.heap32[(fp+1)]);
    r2 = 0;
while(true){
    r3 = Int64(heapClassInst.heap32[(r0+5)]);
    r4 = r2 << 2;
    r3 = (r3 + r4)|0;
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
if(!(r3 == 0)) 
{
    r4 = r3 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4+4)]);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    __FUNCTION_TABLE__[(r4)>>2](i7);
}
    r2 = (r2 + 1)|0;
    r3 = Int64(heapClassInst.heap32[(r0+3)]);
    if(r3 > r2) 
{
continue 
}
else{
break 
}
}
}
    return;
}

func _ZN28btCompoundCollisionAlgorithm21calculateTimeOfImpactEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResult(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var f11: Float64 = 0.0
    var f12: Float64 = 0.0
    var f13: Float64 = 0.0
    var f14: Float64 = 0.0
    var f15: Float64 = 0.0
    var f16: Float64 = 0.0
    var f17: Float64 = 0.0
    var f18: Float64 = 0.0
    var f19: Float64 = 0.0
    var f20: Float64 = 0.0
    var f21: Float64 = 0.0
    var f22: Float64 = 0.0
    var f23: Float64 = 0.0
    var f24: Float64 = 0.0
    var f25: Float64 = 0.0
    var f26: Float64 = 0.0
    var f27: Float64 = 0.0
    var f28: Float64 = 0.0
    var f29: Float64 = 0.0
    var f30: Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-40);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heapU8[r0+28]);
    r2 = Int64(heapClassInst.heap32[(fp+1)]);
    r3 = Int64(heapClassInst.heap32[(fp+2)]);
    r4 = if (r1 == 0) {r2} else {r3};
    r5 = r4 >> 2;
    r6 = Int64(heapClassInst.heap32[(r5+48)]);
    r7 = r6 >> 2;
    r8 = Int64(heapClassInst.heap32[(r7+1)]);
    if(r8 == 31) 
{
    r0 = r0 >> 2;
    r8 = Int64(heapClassInst.heap32[(r0+3)]);
do {
    if(r8 > 0) 
{
    r9 = Int64(heapClassInst.heap32[(fp+3)]);
    r10 = Int64(heapClassInst.heap32[(fp+4)]);
    r1 = if (r1 == 0) {r3} else {r2};
    r2 = 0;
    f0 =                         1.0;
while(true){
    r3 = (r2 * 20)|0;
    r11 = Int64(heapClassInst.heap32[(r7+6)]);
    r3 = r3 << 2;
    r3 = (r11 + r3)|0;
    r3 = r3 >> 2;
    f1 = Float64(heapClassInst.heapFloat[(r3)]);
    f2 = Float64(heapClassInst.heapFloat[(r5+1)]);
    f3 = Float64(heapClassInst.heapFloat[(r3+4)]);
    f4 = Float64(heapClassInst.heapFloat[(r5+2)]);
    f5 = Float64(heapClassInst.heapFloat[(r3+1)]);
    f6 = Float64(heapClassInst.heapFloat[(r3+5)]);
    f7 = f1*f2;
    f8 = f3*f4;
    f9 = Float64(heapClassInst.heapFloat[(r3+8)]);
    f10 = Float64(heapClassInst.heapFloat[(r5+3)]);
    f11 = Float64(heapClassInst.heapFloat[(r5+10)]);
    f12 = Float64(heapClassInst.heapFloat[(r3+13)]);
    f13 = Float64(heapClassInst.heapFloat[(r5+6)]);
    f14 = Float64(heapClassInst.heapFloat[(r3+6)]);
    f15 = Float64(heapClassInst.heapFloat[(r5+9)]);
    f16 = Float64(heapClassInst.heapFloat[(r3+12)]);
    f17 = Float64(heapClassInst.heapFloat[(r5+5)]);
    f18 = Float64(heapClassInst.heapFloat[(r3+2)]);
    f19 = Float64(heapClassInst.heapFloat[(r3+14)]);
    f20 = Float64(heapClassInst.heapFloat[(r5+11)]);
    f21 = Float64(heapClassInst.heapFloat[(r3+10)]);
    f22 = Float64(heapClassInst.heapFloat[(r5+7)]);
    f23 = Float64(heapClassInst.heapFloat[(r3+9)]);
    r3 = Int64(heapClassInst.heap32[(r3+16)]);
    f24 = f5*f2;
    f25 = f6*f4;
    f7 = f7+f8;
    f8 = f9*f10;
    f26 = Float64(heapClassInst.heapFloat[(r5+16)]);
    heapClassInst.heapFloat[(fp+(-1))] = Float32(f26);
    f27 = Float64(heapClassInst.heapFloat[(r5+15)]);
    f28 = Float64(heapClassInst.heapFloat[(r5+14)]);
    f29 = Float64(heapClassInst.heapFloat[(r5+13)]);
    f26 = Float64(heapClassInst.heapFloat[(r5+12)]);
    heapClassInst.heapFloat[(fp+(-2))] = Float32(f26);
    f26 = Float64(heapClassInst.heapFloat[(r5+8)]);
    heapClassInst.heapFloat[(fp+(-3))] = Float32(f26);
    f26 = Float64(heapClassInst.heapFloat[(r5+4)]);
    heapClassInst.heapFloat[(fp+(-4))] = Float32(f26);
    f30 = f18*f2;
    f26 = f14*f4;
    f24 = f24+f25;
    f25 = f23*f10;
    f7 = f7+f8;
    f8 = f30+f26;
    f26 = f21*f10;
    f24 = f24+f25;
    heapClassInst.heapFloat[(r5+1)] = Float32(f7);
    f7 = f1*f17;
    f25 = f3*f13;
    f8 = f8+f26;
    heapClassInst.heapFloat[(r5+2)] = Float32(f24);
    heapClassInst.heapFloat[(r5+3)] = Float32(f8);
    f8 = f5*f17;
    f24 = f6*f13;
    f7 = f7+f25;
    f25 = f9*f22;
    f26 = f18*f17;
    f30 = f14*f13;
    f8 = f8+f24;
    f24 = f23*f22;
    f7 = f7+f25;
    heapClassInst.heap32[(r5+4)] = 0;
    f25 = f26+f30;
    f26 = f21*f22;
    f8 = f8+f24;
    heapClassInst.heapFloat[(r5+5)] = Float32(f7);
    f1 = f1*f15;
    f3 = f3*f11;
    f7 = f25+f26;
    heapClassInst.heapFloat[(r5+6)] = Float32(f8);
    heapClassInst.heapFloat[(r5+7)] = Float32(f7);
    f5 = f5*f15;
    f6 = f6*f11;
    f1 = f1+f3;
    f3 = f9*f20;
    f7 = f18*f15;
    f8 = f14*f11;
    f5 = f5+f6;
    f6 = f23*f20;
    f1 = f1+f3;
    heapClassInst.heap32[(r5+8)] = 0;
    f3 = f2*f16;
    f9 = f4*f12;
    f7 = f7+f8;
    f8 = f21*f20;
    f5 = f5+f6;
    heapClassInst.heapFloat[(r5+9)] = Float32(f1);
    f1 = f17*f16;
    f6 = f13*f12;
    f3 = f3+f9;
    f9 = f10*f19;
    f7 = f7+f8;
    heapClassInst.heapFloat[(r5+10)] = Float32(f5);
    f3 = f3+f9;
    heapClassInst.heapFloat[(r5+11)] = Float32(f7);
    f5 = f15*f16;
    f7 = f11*f12;
    f1 = f1+f6;
    f6 = f22*f19;
    f1 = f1+f6;
    f5 = f5+f7;
    f6 = f20*f19;
    f3 = f3+f29;
    heapClassInst.heap32[(r5+12)] = 0;
    f5 = f5+f6;
    f1 = f1+f28;
    heapClassInst.heapFloat[(r5+13)] = Float32(f3);
    f3 = f5+f27;
    heapClassInst.heapFloat[(r5+14)] = Float32(f1);
    heapClassInst.heapFloat[(r5+15)] = Float32(f3);
    heapClassInst.heap32[(r5+16)] = 0;
    heapClassInst.heap32[(r5+48)] = Int32(r3);
    r3 = Int64(heapClassInst.heap32[(r0+5)]);
    r11 = r2 << 2;
    r3 = (r3 + r11)|0;
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r11 = r3 >> 2;
    r11 = Int64(heapClassInst.heap32[(r11)]);
    r11 = r11 >> 2;
    r11 = Int64(heapClassInst.heap32[(r11+3)]);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0+1)] = Int32(r4);
    heapClassInst.heap32[(g0+2)] = Int32(r1);
    heapClassInst.heap32[(g0+3)] = Int32(r9);
    heapClassInst.heap32[(g0+4)] = Int32(r10);
    __FUNCTION_TABLE__[(r11)>>2](i7);
    heapClassInst.heap32[(r5+48)] = Int32(r6);
    heapClassInst.heapFloat[(r5+1)] = Float32(f2);
    heapClassInst.heapFloat[(r5+2)] = Float32(f4);
    heapClassInst.heapFloat[(r5+3)] = Float32(f10);
    f26 = Float64(heapClassInst.heapFloat[(fp+(-4))]);
    heapClassInst.heapFloat[(r5+4)] = Float32(f26);
    heapClassInst.heapFloat[(r5+5)] = Float32(f17);
    heapClassInst.heapFloat[(r5+6)] = Float32(f13);
    heapClassInst.heapFloat[(r5+7)] = Float32(f22);
    f26 = Float64(heapClassInst.heapFloat[(fp+(-3))]);
    heapClassInst.heapFloat[(r5+8)] = Float32(f26);
    heapClassInst.heapFloat[(r5+9)] = Float32(f15);
    heapClassInst.heapFloat[(r5+10)] = Float32(f11);
    heapClassInst.heapFloat[(r5+11)] = Float32(f20);
    f26 = Float64(heapClassInst.heapFloat[(fp+(-2))]);
    heapClassInst.heapFloat[(r5+12)] = Float32(f26);
    heapClassInst.heapFloat[(r5+13)] = Float32(f29);
    heapClassInst.heapFloat[(r5+14)] = Float32(f28);
    r2 = (r2 + 1)|0;
    f0 = if (commonVariable.f_g0 < f0) {commonVariable.f_g0} else {f0};
    heapClassInst.heapFloat[(r5+15)] = Float32(f27);
    f26 = Float64(heapClassInst.heapFloat[(fp+(-1))]);
    heapClassInst.heapFloat[(r5+16)] = Float32(f26);
if(!(r8 != r2)) 
{
break 
}
}
}
else{
    f0 =                         1.0;
}
} while(false);
    commonVariable.f_g0 = f0;
    return;
}
else{
    r0 = _E2_str99;
    r1 = _E2_str1100;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = 308;
    _assert(i7);
}
}

func _ZN22btCompoundLeafCallback17ProcessChildShapeEP16btCollisionShapei(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var f11: Float64 = 0.0
    var f12: Float64 = 0.0
    var f13: Float64 = 0.0
    var f14: Float64 = 0.0
    var f15: Float64 = 0.0
    var f16: Float64 = 0.0
    var f17: Float64 = 0.0
    var f18: Float64 = 0.0
    var f19: Float64 = 0.0
    var f20: Float64 = 0.0
    var f21: Float64 = 0.0
    var f22: Float64 = 0.0
    var f23: Float64 = 0.0
    var f24: Float64 = 0.0
    var f25: Float64 = 0.0
    var f26: Float64 = 0.0
    var f27: Float64 = 0.0
    var f28: Float64 = 0.0
    var f29: Float64 = 0.0
    var f30: Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-264);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp+2)]);
    if(r0 > ( -1)) 
{
    r1 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r1 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1+1)]);
    r2 = r2 >> 2;
    r3 = Int64(heapClassInst.heap32[(r2+48)]);
    r3 = r3 >> 2;
    r4 = Int64(heapClassInst.heap32[(r3+4)]);
    if(r4 > r0) 
{
    r4 = Int64(heapClassInst.heap32[(fp+1)]);
    r3 = Int64(heapClassInst.heap32[(r3+6)]);
    r5 = (r0 * 80)|0;
    r3 = (r3 + r5)|0;
    r3 = r3 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r2+1)]);
    f1 = Float64(heapClassInst.heapFloat[(r3)]);
    f2 = Float64(heapClassInst.heapFloat[(r2+2)]);
    f3 = Float64(heapClassInst.heapFloat[(r3+4)]);
    f4 = Float64(heapClassInst.heapFloat[(r3+1)]);
    f5 = Float64(heapClassInst.heapFloat[(r3+5)]);
    f6 = Float64(heapClassInst.heapFloat[(r2+3)]);
    f7 = Float64(heapClassInst.heapFloat[(r3+8)]);
    f8 = f1*f0;
    f9 = f3*f2;
    f10 = Float64(heapClassInst.heapFloat[(r2+5)]);
    f11 = Float64(heapClassInst.heapFloat[(r2+6)]);
    f12 = Float64(heapClassInst.heapFloat[(r2+9)]);
    f13 = Float64(heapClassInst.heapFloat[(r3+12)]);
    f14 = Float64(heapClassInst.heapFloat[(r3+2)]);
    f15 = Float64(heapClassInst.heapFloat[(r2+10)]);
    f16 = Float64(heapClassInst.heapFloat[(r3+13)]);
    f17 = Float64(heapClassInst.heapFloat[(r3+6)]);
    f18 = Float64(heapClassInst.heapFloat[(r2+7)]);
    f19 = Float64(heapClassInst.heapFloat[(r3+14)]);
    f20 = Float64(heapClassInst.heapFloat[(r2+11)]);
    f21 = Float64(heapClassInst.heapFloat[(r3+10)]);
    f22 = Float64(heapClassInst.heapFloat[(r3+9)]);
    f23 = Float64(heapClassInst.heapFloat[(r2+4)]);
    f24 = Float64(heapClassInst.heapFloat[(r2+8)]);
    heapClassInst.heapFloat[(fp+(-59))] = Float32(f24);
    f24 = Float64(heapClassInst.heapFloat[(r2+12)]);
    heapClassInst.heapFloat[(fp+(-57))] = Float32(f24);
    f24 = Float64(heapClassInst.heapFloat[(r2+13)]);
    f25 = Float64(heapClassInst.heapFloat[(r2+14)]);
    f26 = Float64(heapClassInst.heapFloat[(r2+15)]);
    f27 = Float64(heapClassInst.heapFloat[(r2+16)]);
    heapClassInst.heapFloat[(fp+(-58))] = Float32(f27);
    f27 = Float64(heapClassInst.heapFloat[(r2+17)]);
    heapClassInst.heapFloat[(fp+(-42))] = Float32(f27);
    f27 = Float64(heapClassInst.heapFloat[(r2+18)]);
    heapClassInst.heapFloat[(fp+(-41))] = Float32(f27);
    f27 = Float64(heapClassInst.heapFloat[(r2+19)]);
    heapClassInst.heapFloat[(fp+(-44))] = Float32(f27);
    f27 = Float64(heapClassInst.heapFloat[(r2+20)]);
    heapClassInst.heapFloat[(fp+(-43))] = Float32(f27);
    f27 = Float64(heapClassInst.heapFloat[(r2+21)]);
    heapClassInst.heapFloat[(fp+(-46))] = Float32(f27);
    f27 = Float64(heapClassInst.heapFloat[(r2+22)]);
    heapClassInst.heapFloat[(fp+(-45))] = Float32(f27);
    f27 = Float64(heapClassInst.heapFloat[(r2+23)]);
    heapClassInst.heapFloat[(fp+(-48))] = Float32(f27);
    f27 = Float64(heapClassInst.heapFloat[(r2+24)]);
    heapClassInst.heapFloat[(fp+(-47))] = Float32(f27);
    f27 = Float64(heapClassInst.heapFloat[(r2+25)]);
    heapClassInst.heapFloat[(fp+(-50))] = Float32(f27);
    f27 = Float64(heapClassInst.heapFloat[(r2+26)]);
    heapClassInst.heapFloat[(fp+(-49))] = Float32(f27);
    f27 = Float64(heapClassInst.heapFloat[(r2+27)]);
    heapClassInst.heapFloat[(fp+(-52))] = Float32(f27);
    f27 = Float64(heapClassInst.heapFloat[(r2+28)]);
    heapClassInst.heapFloat[(fp+(-51))] = Float32(f27);
    f27 = Float64(heapClassInst.heapFloat[(r2+29)]);
    heapClassInst.heapFloat[(fp+(-54))] = Float32(f27);
    f27 = Float64(heapClassInst.heapFloat[(r2+30)]);
    heapClassInst.heapFloat[(fp+(-53))] = Float32(f27);
    f27 = Float64(heapClassInst.heapFloat[(r2+31)]);
    heapClassInst.heapFloat[(fp+(-56))] = Float32(f27);
    f27 = Float64(heapClassInst.heapFloat[(r2+32)]);
    heapClassInst.heapFloat[(fp+(-55))] = Float32(f27);
    f27 = f4*f0;
    f28 = f5*f2;
    f8 = f8+f9;
    f9 = f7*f6;
    r2 = sp + (-96);
    f29 = f14*f0;
    f30 = f17*f2;
    f27 = f27+f28;
    f28 = f22*f6;
    f8 = f8+f9;
    r3 = r2 >> 2;
    f9 = f29+f30;
    f29 = f21*f6;
    f27 = f27+f28;
    heapClassInst.heapFloat[(fp+(-24))] = Float32(f8);
    f8 = f1*f10;
    f28 = f3*f11;
    f9 = f9+f29;
    heapClassInst.heapFloat[(r3+1)] = Float32(f27);
    heapClassInst.heapFloat[(r3+2)] = Float32(f9);
    f9 = f4*f10;
    f27 = f5*f11;
    f8 = f8+f28;
    f28 = f7*f18;
    f29 = f14*f10;
    f30 = f17*f11;
    f9 = f9+f27;
    f27 = f22*f18;
    f8 = f8+f28;
    heapClassInst.heap32[(r3+3)] = 0;
    f28 = f29+f30;
    f29 = f21*f18;
    f9 = f9+f27;
    heapClassInst.heapFloat[(r3+4)] = Float32(f8);
    f1 = f1*f12;
    f3 = f3*f15;
    f8 = f28+f29;
    heapClassInst.heapFloat[(r3+5)] = Float32(f9);
    heapClassInst.heapFloat[(r3+6)] = Float32(f8);
    f4 = f4*f12;
    f5 = f5*f15;
    f1 = f1+f3;
    f3 = f7*f20;
    f7 = f14*f12;
    f8 = f17*f15;
    f4 = f4+f5;
    f5 = f22*f20;
    f1 = f1+f3;
    heapClassInst.heap32[(r3+7)] = 0;
    f3 = f0*f13;
    f9 = f2*f16;
    f7 = f7+f8;
    f8 = f21*f20;
    f4 = f4+f5;
    heapClassInst.heapFloat[(r3+8)] = Float32(f1);
    f1 = f10*f13;
    f5 = f11*f16;
    f3 = f3+f9;
    f9 = f6*f19;
    f7 = f7+f8;
    heapClassInst.heapFloat[(r3+9)] = Float32(f4);
    f3 = f3+f9;
    heapClassInst.heapFloat[(r3+10)] = Float32(f7);
    f4 = f12*f13;
    f7 = f15*f16;
    f1 = f1+f5;
    f5 = f18*f19;
    f1 = f1+f5;
    f4 = f4+f7;
    f5 = f20*f19;
    f3 = f3+f24;
    heapClassInst.heap32[(r3+11)] = 0;
    f4 = f4+f5;
    f1 = f1+f25;
    heapClassInst.heapFloat[(r3+12)] = Float32(f3);
    f3 = f4+f26;
    heapClassInst.heapFloat[(r3+13)] = Float32(f1);
    heapClassInst.heapFloat[(r3+14)] = Float32(f3);
    r5 = r4 >> 2;
    heapClassInst.heap32[(r3+15)] = 0;
    r5 = Int64(heapClassInst.heap32[(r5)]);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5+2)]);
    r6 = sp + (-112);
    r7 = sp + (-128);
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0+1)] = Int32(r2);
    heapClassInst.heap32[(g0+2)] = Int32(r6);
    heapClassInst.heap32[(g0+3)] = Int32(r7);
    __FUNCTION_TABLE__[(r5)>>2](i7);
    r2 = Int64(heapClassInst.heap32[(r1+2)]);
    r5 = r2 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5+48)]);
    r8 = r5 >> 2;
    r8 = Int64(heapClassInst.heap32[(r8)]);
    r8 = r8 >> 2;
    r8 = Int64(heapClassInst.heap32[(r8+2)]);
    r2 = (r2 + 4)|0;
    r9 = sp + (-144);
    r10 = sp + (-160);
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0+1)] = Int32(r2);
    heapClassInst.heap32[(g0+2)] = Int32(r9);
    heapClassInst.heap32[(g0+3)] = Int32(r10);
    __FUNCTION_TABLE__[(r8)>>2](i7);
    f1 = Float64(heapClassInst.heapFloat[(fp+(-28))]);
    f3 = Float64(heapClassInst.heapFloat[(fp+(-40))]);
    if(f1 > f3) 
{
__label__ = 7;
}
else{
    f1 = Float64(heapClassInst.heapFloat[(fp+(-32))]);
    f3 = Float64(heapClassInst.heapFloat[(fp+(-36))]);
    if(f1 < f3) 
{
__label__ = 7;
}
else{
    r2 = 1;
__label__ = 8;
}
}
if (__label__ == 7){
    r2 = 0;
}
    r5 = r6 >> 2;
    r8 = r10 >> 2;
    f1 = Float64(heapClassInst.heapFloat[(r5+2)]);
    f3 = Float64(heapClassInst.heapFloat[(r8+2)]);
    if(f1 > f3) 
{
__label__ = 10;
}
else{
    r11 = r7 >> 2;
    r12 = r9 >> 2;
    f1 = Float64(heapClassInst.heapFloat[(r11+2)]);
    f3 = Float64(heapClassInst.heapFloat[(r12+2)]);
    if(f1 < f3) 
{
__label__ = 10;
}
else{
__label__ = 11;
}
}
if (__label__ == 10){
    r2 = 0;
}
    f1 = Float64(heapClassInst.heapFloat[(r5+1)]);
    f3 = Float64(heapClassInst.heapFloat[(r8+1)]);
if(!(f1 > f3)) 
{
    r5 = r7 >> 2;
    r8 = r9 >> 2;
    f1 = Float64(heapClassInst.heapFloat[(r5+1)]);
    f3 = Float64(heapClassInst.heapFloat[(r8+1)]);
if(!(f1 < f3)) 
{
    r2 = r2 & 255;
if(!(r2 == 0)) 
{
    r2 = Int64(heapClassInst.heap32[(r1+1)]);
    r2 = r2 >> 2;
    heapClassInst.heap32[(r2+1)] = heapClassInst.heap32[(fp+(-24))];
    heapClassInst.heap32[(r2+2)] = heapClassInst.heap32[(r3+1)];
    heapClassInst.heap32[(r2+3)] = heapClassInst.heap32[(r3+2)];
    heapClassInst.heap32[(r2+4)] = heapClassInst.heap32[(r3+3)];
    heapClassInst.heap32[(r2+5)] = heapClassInst.heap32[(r3+4)];
    heapClassInst.heap32[(r2+6)] = heapClassInst.heap32[(r3+5)];
    heapClassInst.heap32[(r2+7)] = heapClassInst.heap32[(r3+6)];
    heapClassInst.heap32[(r2+8)] = heapClassInst.heap32[(r3+7)];
    heapClassInst.heap32[(r2+9)] = heapClassInst.heap32[(r3+8)];
    heapClassInst.heap32[(r2+10)] = heapClassInst.heap32[(r3+9)];
    heapClassInst.heap32[(r2+11)] = heapClassInst.heap32[(r3+10)];
    heapClassInst.heap32[(r2+12)] = heapClassInst.heap32[(r3+11)];
    heapClassInst.heap32[(r2+13)] = heapClassInst.heap32[(r3+12)];
    heapClassInst.heap32[(r2+14)] = heapClassInst.heap32[(r3+13)];
    heapClassInst.heap32[(r2+15)] = heapClassInst.heap32[(r3+14)];
    heapClassInst.heap32[(r2+16)] = heapClassInst.heap32[(r3+15)];
    r2 = Int64(heapClassInst.heap32[(r1+1)]);
    r2 = r2 >> 2;
    heapClassInst.heap32[(r2+17)] = heapClassInst.heap32[(fp+(-24))];
    heapClassInst.heap32[(r2+18)] = heapClassInst.heap32[(r3+1)];
    heapClassInst.heap32[(r2+19)] = heapClassInst.heap32[(r3+2)];
    heapClassInst.heap32[(r2+20)] = heapClassInst.heap32[(r3+3)];
    heapClassInst.heap32[(r2+21)] = heapClassInst.heap32[(r3+4)];
    heapClassInst.heap32[(r2+22)] = heapClassInst.heap32[(r3+5)];
    heapClassInst.heap32[(r2+23)] = heapClassInst.heap32[(r3+6)];
    heapClassInst.heap32[(r2+24)] = heapClassInst.heap32[(r3+7)];
    heapClassInst.heap32[(r2+25)] = heapClassInst.heap32[(r3+8)];
    heapClassInst.heap32[(r2+26)] = heapClassInst.heap32[(r3+9)];
    heapClassInst.heap32[(r2+27)] = heapClassInst.heap32[(r3+10)];
    heapClassInst.heap32[(r2+28)] = heapClassInst.heap32[(r3+11)];
    heapClassInst.heap32[(r2+29)] = heapClassInst.heap32[(r3+12)];
    heapClassInst.heap32[(r2+30)] = heapClassInst.heap32[(r3+13)];
    heapClassInst.heap32[(r2+31)] = heapClassInst.heap32[(r3+14)];
    heapClassInst.heap32[(r2+32)] = heapClassInst.heap32[(r3+15)];
    r2 = Int64(heapClassInst.heap32[(r1+1)]);
    r2 = r2 >> 2;
    r3 = Int64(heapClassInst.heap32[(r2+48)]);
    heapClassInst.heap32[(r2+48)] = Int32(r4);
    r2 = Int64(heapClassInst.heap32[(r1+6)]);
    r4 = r0 << 2;
    r2 = (r2 + r4)|0;
    r2 = r2 >> 2;
    r5 = Int64(heapClassInst.heap32[(r2)]);
if(!(r5 != 0)) 
{
    r5 = Int64(heapClassInst.heap32[(r1+3)]);
    r8 = r5 >> 2;
    r8 = Int64(heapClassInst.heap32[(r8)]);
    r8 = r8 >> 2;
    r8 = Int64(heapClassInst.heap32[(r8+2)]);
    r11 = Int64(heapClassInst.heap32[(r1+7)]);
    r12 = Int64(heapClassInst.heap32[(r1+2)]);
    r13 = Int64(heapClassInst.heap32[(r1+1)]);
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0+1)] = Int32(r13);
    heapClassInst.heap32[(g0+2)] = Int32(r12);
    heapClassInst.heap32[(g0+3)] = Int32(r11);
    __FUNCTION_TABLE__[(r8)>>2](i7);
    heapClassInst.heap32[(r2)] = Int32(commonVariable.r_g0);
}
    r2 = Int64(heapClassInst.heap32[(r1+5)]);
    r5 = r2 >> 2;
    r8 = Int64(heapClassInst.heap32[(r5)]);
    r5 = Int64(heapClassInst.heap32[(r5+34)]);
    r11 = Int64(heapClassInst.heap32[(r1+1)]);
    if(r5 != r11) 
{
    r5 = r8 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5+3)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0+1)] = ( -1);
    heapClassInst.heap32[(g0+2)] = Int32(r0);
    __FUNCTION_TABLE__[(r5)>>2](i7);
}
else{
    r8 = r8 >> 2;
    r8 = Int64(heapClassInst.heap32[(r8+2)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0+1)] = ( -1);
    heapClassInst.heap32[(g0+2)] = Int32(r0);
    __FUNCTION_TABLE__[(r8)>>2](i7);
}
    r0 = Int64(heapClassInst.heap32[(r1+6)]);
    r0 = (r0 + r4)|0;
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0)]);
    r2 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+2)]);
    r4 = Int64(heapClassInst.heap32[(r1+5)]);
    r5 = Int64(heapClassInst.heap32[(r1+4)]);
    r8 = Int64(heapClassInst.heap32[(r1+2)]);
    r11 = Int64(heapClassInst.heap32[(r1+1)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r11);
    heapClassInst.heap32[(g0+2)] = Int32(r8);
    heapClassInst.heap32[(g0+3)] = Int32(r5);
    heapClassInst.heap32[(g0+4)] = Int32(r4);
    __FUNCTION_TABLE__[(r2)>>2](i7);
    r0 = Int64(heapClassInst.heap32[(r1+4)]);
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0+5)]);
if(!(r0 == 0)) 
{
    r2 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+12)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r2)>>2](i7);
    r0 = commonVariable.r_g0 & 2;
if(!(r0 == 0)) 
{
    r0 = Int64(heapClassInst.heap32[(r1+4)]);
    r0 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r0+5)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+13)]);
    r4 = sp + (-32);
    r5 = r4 >> 2;
    heapClassInst.heap32[(fp+(-8))] = 1065353216;
    heapClassInst.heap32[(r5+1)] = 1065353216;
    heapClassInst.heap32[(r5+2)] = 1065353216;
    heapClassInst.heap32[(r5+3)] = 0;
    r0 = Int64(heapClassInst.heap32[(r0+5)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r6);
    heapClassInst.heap32[(g0+2)] = Int32(r7);
    heapClassInst.heap32[(g0+3)] = Int32(r4);
    __FUNCTION_TABLE__[(r2)>>2](i7);
    r0 = Int64(heapClassInst.heap32[(r1+4)]);
    r0 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r0+5)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2+13)]);
    r4 = sp + (-16);
    r5 = r4 >> 2;
    heapClassInst.heap32[(fp+(-4))] = 1065353216;
    heapClassInst.heap32[(r5+1)] = 1065353216;
    heapClassInst.heap32[(r5+2)] = 1065353216;
    heapClassInst.heap32[(r5+3)] = 0;
    r0 = Int64(heapClassInst.heap32[(r0+5)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r9);
    heapClassInst.heap32[(g0+2)] = Int32(r10);
    heapClassInst.heap32[(g0+3)] = Int32(r4);
    __FUNCTION_TABLE__[(r2)>>2](i7);
}
}
    r0 = Int64(heapClassInst.heap32[(r1+1)]);
    r0 = r0 >> 2;
    heapClassInst.heap32[(r0+48)] = Int32(r3);
    r0 = Int64(heapClassInst.heap32[(r1+1)]);
    r0 = r0 >> 2;
    heapClassInst.heapFloat[(r0+1)] = Float32(f0);
    heapClassInst.heapFloat[(r0+2)] = Float32(f2);
    heapClassInst.heapFloat[(r0+3)] = Float32(f6);
    heapClassInst.heapFloat[(r0+4)] = Float32(f23);
    heapClassInst.heapFloat[(r0+5)] = Float32(f10);
    heapClassInst.heapFloat[(r0+6)] = Float32(f11);
    heapClassInst.heapFloat[(r0+7)] = Float32(f18);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-59))]);
    heapClassInst.heapFloat[(r0+8)] = Float32(f0);
    heapClassInst.heapFloat[(r0+9)] = Float32(f12);
    heapClassInst.heapFloat[(r0+10)] = Float32(f15);
    heapClassInst.heapFloat[(r0+11)] = Float32(f20);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-57))]);
    heapClassInst.heapFloat[(r0+12)] = Float32(f0);
    heapClassInst.heapFloat[(r0+13)] = Float32(f24);
    heapClassInst.heapFloat[(r0+14)] = Float32(f25);
    heapClassInst.heapFloat[(r0+15)] = Float32(f26);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-58))]);
    heapClassInst.heapFloat[(r0+16)] = Float32(f0);
    r0 = Int64(heapClassInst.heap32[(r1+1)]);
    r0 = r0 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(fp+(-42))]);
    heapClassInst.heapFloat[(r0+17)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-41))]);
    heapClassInst.heapFloat[(r0+18)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-44))]);
    heapClassInst.heapFloat[(r0+19)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-43))]);
    heapClassInst.heapFloat[(r0+20)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-46))]);
    heapClassInst.heapFloat[(r0+21)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-45))]);
    heapClassInst.heapFloat[(r0+22)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-48))]);
    heapClassInst.heapFloat[(r0+23)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-47))]);
    heapClassInst.heapFloat[(r0+24)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-50))]);
    heapClassInst.heapFloat[(r0+25)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-49))]);
    heapClassInst.heapFloat[(r0+26)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-52))]);
    heapClassInst.heapFloat[(r0+27)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-51))]);
    heapClassInst.heapFloat[(r0+28)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-54))]);
    heapClassInst.heapFloat[(r0+29)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-53))]);
    heapClassInst.heapFloat[(r0+30)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-56))]);
    heapClassInst.heapFloat[(r0+31)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(fp+(-55))]);
    heapClassInst.heapFloat[(r0+32)] = Float32(f0);
}
}
}
    return;
}
else{
    r0 = _E2_str7106;
    r1 = _E2_str1100;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = 119;
    _assert(i7);
}
}
else{
    r0 = _E2_str6105;
    r1 = _E2_str1100;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = 117;
    _assert(i7);
}
}

func _ZN28btCompoundCollisionAlgorithm16processCollisionEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResult(sp:Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp>>2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var r16: Int64 = 0
    var r17: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var f11: Float64 = 0.0
    var f12: Float64 = 0.0
    var f13: Float64 = 0.0
    var f14: Float64 = 0.0
    var f15: Float64 = 0.0
    var f16: Float64 = 0.0
    var f17: Float64 = 0.0
    var f18: Float64 = 0.0
    var f19: Float64 = 0.0
    var f20: Float64 = 0.0
    var f21: Float64 = 0.0
    var f22: Float64 = 0.0
    var f23: Float64 = 0.0
    var f24: Float64 = 0.0
    var f25: Float64 = 0.0
    var f26: Float64 = 0.0
    var f27: Float64 = 0.0
    var f28: Float64 = 0.0
    var f29: Float64 = 0.0
var __label__ = 0;
    i7 = sp + (-328);
var g0 = i7>>2; 
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap32[(fp+1)]);
    r2 = Int64(heapClassInst.heap32[(fp+2)]);
    r3 = Int64(heapClassInst.heapU8[r0+28]);
    r4 = if (r3 == 0) {r1} else {r2};
    r5 = r4 >> 2;
    r6 = Int64(heapClassInst.heap32[(r5+48)]);
    r6 = r6 >> 2;
    r7 = Int64(heapClassInst.heap32[(r6+1)]);
    if(r7 == 31) 
{
    r7 = r0 >> 2;
    r8 = Int64(heapClassInst.heap32[(r6+17)]);
    r9 = Int64(heapClassInst.heap32[(r7+10)]);
if(!(r8 == r9)) 
{
    r8 = Int64(heapClassInst.heap32[(r7+3)]);
if(!(r8 < 1)) 
{
    r9 = 0;
while(true){
    r10 = Int64(heapClassInst.heap32[(r7+5)]);
    r11 = r9 << 2;
    r10 = (r10 + r11)|0;
    r10 = r10 >> 2;
    r10 = Int64(heapClassInst.heap32[(r10)]);
if(!(r10 == 0)) 
{
    r12 = r10 >> 2;
    r12 = Int64(heapClassInst.heap32[(r12)]);
    r12 = r12 >> 2;
    r12 = Int64(heapClassInst.heap32[(r12)]);
    heapClassInst.heap32[(g0)] = Int32(r10);
    __FUNCTION_TABLE__[(r12)>>2](i7);
    r10 = Int64(heapClassInst.heap32[(r7+1)]);
    r12 = r10 >> 2;
    r13 = Int64(heapClassInst.heap32[(r7+5)]);
    r11 = (r13 + r11)|0;
    r12 = Int64(heapClassInst.heap32[(r12)]);
    r12 = r12 >> 2;
    r11 = r11 >> 2;
    r12 = Int64(heapClassInst.heap32[(r12+13)]);
    r11 = Int64(heapClassInst.heap32[(r11)]);
    heapClassInst.heap32[(g0)] = Int32(r10);
    heapClassInst.heap32[(g0+1)] = Int32(r11);
    __FUNCTION_TABLE__[(r12)>>2](i7);
}
    r9 = (r9 + 1)|0;
if(!(r8 != r9)) 
{
break 
}
}
}
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = Int32(r2);
    _ZN28btCompoundCollisionAlgorithm26preallocateChildAlgorithmsEP17btCollisionObjectS1_(i7);
}
    r0 = Int64(heapClassInst.heap32[(fp+3)]);
    r8 = Int64(heapClassInst.heap32[(fp+4)]);
    r1 = if (r3 == 0) {r2} else {r1};
    r2 = _ZTV22btCompoundLeafCallback;
    r3 = Int64(heapClassInst.heap32[(r6+16)]);
    r9 = Int64(heapClassInst.heap32[(r7+8)]);
    r10 = Int64(heapClassInst.heap32[(r7+5)]);
    r11 = Int64(heapClassInst.heap32[(r7+1)]);
    r12 = sp + (-32);
    r2 = (r2 + 8)|0;
    r13 = r12 >> 2;
    heapClassInst.heap32[(fp+(-8))] = Int32(r2);
    heapClassInst.heap32[(r13+1)] = Int32(r4);
    heapClassInst.heap32[(r13+2)] = Int32(r1);
    heapClassInst.heap32[(r13+3)] = Int32(r11);
    heapClassInst.heap32[(r13+4)] = Int32(r0);
    heapClassInst.heap32[(r13+5)] = Int32(r8);
    heapClassInst.heap32[(r13+6)] = Int32(r10);
    r0 = sp + (-56);
    r2 = 1;
    heapClassInst.heap32[(r13+7)] = Int32(r9);
    r4 = r0 >> 2;
    heapClassInst.heap8[sp+(-40)] = Int8(r2);
    heapClassInst.heap32[(r4+3)] = 0;
    r9 = (r8 + 72)|0;
    r10 = (r8 + 8)|0;
    r11 = 0;
    heapClassInst.heap32[(r4+1)] = 0;
    heapClassInst.heap32[(r4+2)] = 0;
while(true){
    r13 = Int64(heapClassInst.heap32[(r7+3)]);
    if(r13 > r11) 
{
    r13 = Int64(heapClassInst.heap32[(r7+5)]);
    r14 = r11 << 2;
    r13 = (r13 + r14)|0;
    r13 = r13 >> 2;
    r13 = Int64(heapClassInst.heap32[(r13)]);
if(!(r13 == 0)) 
{
    r14 = r13 >> 2;
    r14 = Int64(heapClassInst.heap32[(r14)]);
    r14 = r14 >> 2;
    r14 = Int64(heapClassInst.heap32[(r14+4)]);
    heapClassInst.heap32[(g0)] = Int32(r13);
    heapClassInst.heap32[(g0+1)] = Int32(r0);
    r13 = 0;
    __FUNCTION_TABLE__[(r14)>>2](i7);
while(true){
    r14 = Int64(heapClassInst.heap32[(r4+3)]);
    r15 = Int64(heapClassInst.heap32[(r4+1)]);
    if(r15 > r13) 
{
    r15 = r13 << 2;
    r14 = (r14 + r15)|0;
    r14 = r14 >> 2;
    r14 = Int64(heapClassInst.heap32[(r14)]);
    r15 = r14 >> 2;
    r16 = Int64(heapClassInst.heap32[(r15+279)]);
if(!(r16 == 0)) 
{
    r16 = r8 >> 2;
    heapClassInst.heap32[(r16+1)] = Int32(r14);
    if(r14 != 0) 
{
    r17 = Int64(heapClassInst.heap32[(r15+279)]);
if(!(r17 == 0)) 
{
    r15 = Int64(heapClassInst.heap32[(r15+277)]);
    r17 = Int64(heapClassInst.heap32[(r16+34)]);
    if(r15 == r17) 
{
    heapClassInst.heap32[(g0)] = Int32(r14);
    heapClassInst.heap32[(g0+1)] = Int32(r10);
    heapClassInst.heap32[(g0+2)] = Int32(r9);
    _ZN20btPersistentManifold20refreshContactPointsERK11btTransformS2_(i7);
}
else{
    heapClassInst.heap32[(g0)] = Int32(r14);
    heapClassInst.heap32[(g0+1)] = Int32(r9);
    heapClassInst.heap32[(g0+2)] = Int32(r10);
    _ZN20btPersistentManifold20refreshContactPointsERK11btTransformS2_(i7);
}
}
    heapClassInst.heap32[(r16+1)] = 0;
}
else{
__label__ = 14;
break 
}
}
    r13 = (r13 + 1)|0;
}
else{
break 
}
}
if(!(r14 == 0)) 
{
    r13 = Int64(heapClassInst.heapU8[sp+(-40)]);
if(!(r13 == 0)) 
{
    r13 = gNumAlignedFree;
    r13 = r13 >> 2;
    r15 = Int64(heapClassInst.heap32[(r13)]);
    r15 = (r15 + 1)|0;
    r14 = r14 >> 2;
    heapClassInst.heap32[(r13)] = Int32(r15);
    r13 = Int64(heapClassInst.heap32[(r14+(-1))]);
    heapClassInst.heap32[(g0)] = Int32(r13);
    free(i7);
}
    heapClassInst.heap32[(r4+3)] = 0;
}
    r13 = 1;
    heapClassInst.heap8[sp+(-40)] = Int8(r13);
    heapClassInst.heap32[(r4+3)] = 0;
    heapClassInst.heap32[(r4+1)] = 0;
    heapClassInst.heap32[(r4+2)] = 0;
}
    r11 = (r11 + 1)|0;
}
else{
__label__ = 29;
break 
}
}
match(__label__ ){
case 29=>
    heapClassInst.heap8[sp+(-40)] = Int8(r2);
    heapClassInst.heap32[(r4+3)] = 0;
    heapClassInst.heap32[(r4+1)] = 0;
    heapClassInst.heap32[(r4+2)] = 0;
    do {
        if(r3 == 0) {
            if(r13 < 1) {
                __label__ = 49;
            }
            else{
                r0 = 0;
                while(true){
                    r3 = (r0 * 20)|0;
                    r4 = Int64(heapClassInst.heap32[(r6+6)]);
                    r3 = r3 << 2;
                    r3 = (r4 + r3)|0;
                    r3 = r3 >> 2;
                    r3 = Int64(heapClassInst.heap32[(r3+16)]);
                    heapClassInst.heap32[(g0)] = Int32(r12);
                    heapClassInst.heap32[(g0+1)] = Int32(r3);
                    heapClassInst.heap32[(g0+2)] = Int32(r0);
                    r0 = (r0 + 1)|0;
                    _ZN22btCompoundLeafCallback17ProcessChildShapeEP16btCollisionShapei(i7);
                    if(!(r13 != r0)) 
                    {
                        __label__ = 34;
                        break 
                    }
                }
            }
        }
        else{
            r13 = r1 >> 2;
            f0 = Float64(heapClassInst.heapFloat[(r5+1)]);
            f1 = Float64(heapClassInst.heapFloat[(r13+1)]);
            f2 = Float64(heapClassInst.heapFloat[(r5+5)]);
            f3 = Float64(heapClassInst.heapFloat[(r13+5)]);
            f4 = Float64(heapClassInst.heapFloat[(r13+2)]);
            f5 = Float64(heapClassInst.heapFloat[(r13+6)]);
            f6 = f1*f0;
            f7 = f3*f2;
            f8 = Float64(heapClassInst.heapFloat[(r5+9)]);
            f9 = Float64(heapClassInst.heapFloat[(r13+9)]);
            f10 = Float64(heapClassInst.heapFloat[(r5+2)]);
            f11 = Float64(heapClassInst.heapFloat[(r5+6)]);
            f12 = Float64(heapClassInst.heapFloat[(r5+3)]);
            f13 = Float64(heapClassInst.heapFloat[(r13+13)]);
            f14 = Float64(heapClassInst.heapFloat[(r13+3)]);
            f15 = Float64(heapClassInst.heapFloat[(r5+7)]);
            f16 = Float64(heapClassInst.heapFloat[(r5+14)]);
            f17 = Float64(heapClassInst.heapFloat[(r13+14)]);
            f18 = Float64(heapClassInst.heapFloat[(r13+7)]);
            f19 = Float64(heapClassInst.heapFloat[(r5+10)]);
            f20 = Float64(heapClassInst.heapFloat[(r5+15)]);
            f21 = Float64(heapClassInst.heapFloat[(r5+11)]);
            f22 = Float64(heapClassInst.heapFloat[(r13+15)]);
            f23 = Float64(heapClassInst.heapFloat[(r13+11)]);
            f24 = Float64(heapClassInst.heapFloat[(r13+10)]);
            f25 = Float64(heapClassInst.heapFloat[(r5+13)]);
            f26 = f4*f0;
            f27 = f5*f2;
            f6 = f6+f7;
            f7 = f9*f8;
            r0 = sp + (-152);
            f28 = f14*f0;
            f29 = f18*f2;
            f26 = f26+f27;
            f27 = f24*f8;
            f6 = f6+f7;
            r4 = r0 >> 2;
            f7 = f28+f29;
            f28 = f23*f8;
            f26 = f26+f27;
            heapClassInst.heapFloat[(fp+(-38))] = Float32(f6);
            f6 = f1*f10;
            f27 = f3*f11;
            f7 = f7+f28;
            heapClassInst.heapFloat[(r4+1)] = Float32(f26);
            heapClassInst.heapFloat[(r4+2)] = Float32(f7);
            f7 = f4*f10;
            f26 = f5*f11;
            f6 = f6+f27;
            f27 = f9*f19;
            f28 = f14*f10;
            f29 = f18*f11;
            f7 = f7+f26;
            f26 = f24*f19;
            f6 = f6+f27;
            heapClassInst.heap32[(r4+3)] = 0;
            f27 = f28+f29;
            f28 = f23*f19;
            f7 = f7+f26;
            heapClassInst.heapFloat[(r4+4)] = Float32(f6);
            f1 = f1*f12;
            f3 = f3*f15;
            f6 = f27+f28;
            heapClassInst.heapFloat[(r4+5)] = Float32(f7);
            heapClassInst.heapFloat[(r4+6)] = Float32(f6);
            f4 = f4*f12;
            f5 = f5*f15;
            f1 = f1+f3;
            f3 = f9*f21;
            f6 = -f25;
            f7 = f14*f12;
            f9 = f18*f15;
            f4 = f4+f5;
            f5 = f24*f21;
            f1 = f1+f3;
            heapClassInst.heap32[(r4+7)] = 0;
            f3 = f0*f13;
            f14 = f2*f17;
            f0 = f0*f6;
            f2 = f2*f16;
            f7 = f7+f9;
            f9 = f23*f21;
            f4 = f4+f5;
            heapClassInst.heapFloat[(r4+8)] = Float32(f1);
            f1 = f10*f13;
            f5 = f11*f17;
            f10 = f10*f6;
            f11 = f11*f16;
            f3 = f3+f14;
            f14 = f8*f22;
            f0 = f0-f2;
            f2 = f8*f20;
            f7 = f7+f9;
            heapClassInst.heapFloat[(r4+9)] = Float32(f4);
            heapClassInst.heapFloat[(r4+10)] = Float32(f7);
            f4 = f12*f13;
            f7 = f15*f17;
            f6 = f12*f6;
            f8 = f15*f16;
            f1 = f1+f5;
            f5 = f19*f22;
            f9 = f10-f11;
            f10 = f19*f20;
            f3 = f3+f14;
            f0 = f0-f2;
            f2 = f4+f7;
            f4 = f21*f22;
            f6 = f6-f8;
            f7 = f21*f20;
            f1 = f1+f5;
            f5 = f9-f10;
            f0 = f3+f0;
            heapClassInst.heap32[(r4+11)] = 0;
            f2 = f2+f4;
            f3 = f6-f7;
            f1 = f1+f5;
            heapClassInst.heapFloat[(r4+12)] = Float32(f0);
            f0 = f2+f3;
            heapClassInst.heapFloat[(r4+13)] = Float32(f1);
            heapClassInst.heapFloat[(r4+14)] = Float32(f0);
            heapClassInst.heap32[(r4+15)] = 0;
            r13 = Int64(heapClassInst.heap32[(r13+48)]);
            r4 = r13 >> 2;
            r4 = Int64(heapClassInst.heap32[(r4)]);
            r4 = r4 >> 2;
            r4 = Int64(heapClassInst.heap32[(r4+2)]);
            r8 = sp + (-72);
            r9 = sp + (-88);
            heapClassInst.heap32[(g0)] = Int32(r13);
            heapClassInst.heap32[(g0+1)] = Int32(r0);
            heapClassInst.heap32[(g0+2)] = Int32(r8);
            heapClassInst.heap32[(g0+3)] = Int32(r9);
            r13 = sp + (-184);
            __FUNCTION_TABLE__[(r4)>>2](i7);
            r0 = r13 >> 2;
            r4 = r8 >> 2;
            heapClassInst.heap32[(fp+(-46))] = heapClassInst.heap32[(fp+(-18))];
            heapClassInst.heap32[(r0+1)] = heapClassInst.heap32[(r4+1)];
            heapClassInst.heap32[(r0+2)] = heapClassInst.heap32[(r4+2)];
            heapClassInst.heap32[(r0+3)] = heapClassInst.heap32[(r4+3)];
            r4 = r9 >> 2;
            heapClassInst.heap32[(r0+4)] = heapClassInst.heap32[(fp+(-22))];
            heapClassInst.heap32[(r0+5)] = heapClassInst.heap32[(r4+1)];
            heapClassInst.heap32[(r0+6)] = heapClassInst.heap32[(r4+2)];
            r3 = r3 >> 2;
            heapClassInst.heap32[(r0+7)] = heapClassInst.heap32[(r4+3)];
            r0 = Int64(heapClassInst.heap32[(r3)]);
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0+1)] = Int32(r13);
            heapClassInst.heap32[(g0+2)] = Int32(r12);
            _ZN6btDbvt9collideTVEPK10btDbvtNodeRK12btDbvtAabbMmRNS_8ICollideE(i7);
        __label__ = 34;
        }
    } while(false);
    do {
    if (__label__ == 34){
        r0 = Int64(heapClassInst.heap32[(r7+3)]);
    if(!(r0 < 1)) 
    {
        r3 = 0;
        r4 = (r1 + 4)|0;
        r0 = (r3 - r0)|0;
    while(true){
        r8 = Int64(heapClassInst.heap32[(r7+5)]);
        r9 = r3 << 2;
        r8 = (r8 - r9)|0;
        r8 = r8 >> 2;
        r8 = Int64(heapClassInst.heap32[(r8)]);
    do {
    if(!(r8 == 0)) 
    {
        r8 = (r3 * ( -20))|0;
        r10 = Int64(heapClassInst.heap32[(r6+6)]);
        r8 = r8 << 2;
        r8 = (r10 + r8)|0;
        r8 = r8 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r5+1)]);
        f1 = Float64(heapClassInst.heapFloat[(r8)]);
        f2 = Float64(heapClassInst.heapFloat[(r5+2)]);
        f3 = Float64(heapClassInst.heapFloat[(r8+4)]);
        f4 = Float64(heapClassInst.heapFloat[(r8+1)]);
        f5 = Float64(heapClassInst.heapFloat[(r8+5)]);
        f6 = f1*f0;
        f7 = f3*f2;
        f8 = Float64(heapClassInst.heapFloat[(r5+3)]);
        f9 = Float64(heapClassInst.heapFloat[(r8+8)]);
        f10 = Float64(heapClassInst.heapFloat[(r5+5)]);
        f11 = Float64(heapClassInst.heapFloat[(r5+6)]);
        f12 = Float64(heapClassInst.heapFloat[(r5+9)]);
        f13 = Float64(heapClassInst.heapFloat[(r8+12)]);
        f14 = Float64(heapClassInst.heapFloat[(r8+2)]);
        f15 = Float64(heapClassInst.heapFloat[(r5+10)]);
        f16 = Float64(heapClassInst.heapFloat[(r8+13)]);
        f17 = Float64(heapClassInst.heapFloat[(r8+6)]);
        r10 = Int64(heapClassInst.heap32[(r8+16)]);
        f18 = Float64(heapClassInst.heapFloat[(r5+7)]);
        f19 = Float64(heapClassInst.heapFloat[(r8+14)]);
        f20 = Float64(heapClassInst.heapFloat[(r5+11)]);
        f21 = Float64(heapClassInst.heapFloat[(r8+10)]);
        f22 = Float64(heapClassInst.heapFloat[(r8+9)]);
        f23 = f4*f0;
        f24 = f5*f2;
        f6 = f6+f7;
        f7 = f9*f8;
        f25 = Float64(heapClassInst.heapFloat[(r5+13)]);
        f26 = Float64(heapClassInst.heapFloat[(r5+14)]);
        f27 = Float64(heapClassInst.heapFloat[(r5+15)]);
        r8 = sp + (-248);
        f28 = f14*f0;
        f29 = f17*f2;
        f23 = f23+f24;
        f24 = f22*f8;
        f6 = f6+f7;
        r11 = r8 >> 2;
        f7 = f28+f29;
        f28 = f21*f8;
        f23 = f23+f24;
        heapClassInst.heapFloat[(fp+(-62))] = Float32(f6);
        f6 = f1*f10;
        f24 = f3*f11;
        f7 = f7+f28;
        heapClassInst.heapFloat[(r11+1)] = Float32(f23);
        heapClassInst.heapFloat[(r11+2)] = Float32(f7);
        f7 = f4*f10;
        f23 = f5*f11;
        f6 = f6+f24;
        f24 = f9*f18;
        f28 = f14*f10;
        f29 = f17*f11;
        f7 = f7+f23;
        f23 = f22*f18;
        f6 = f6+f24;
        heapClassInst.heap32[(r11+3)] = 0;
        f24 = f28+f29;
        f28 = f21*f18;
        f7 = f7+f23;
        heapClassInst.heapFloat[(r11+4)] = Float32(f6);
        f1 = f1*f12;
        f3 = f3*f15;
        f6 = f24+f28;
        heapClassInst.heapFloat[(r11+5)] = Float32(f7);
        heapClassInst.heapFloat[(r11+6)] = Float32(f6);
        f4 = f4*f12;
        f5 = f5*f15;
        f1 = f1+f3;
        f3 = f9*f20;
        f6 = f14*f12;
        f7 = f17*f15;
        f4 = f4+f5;
        f5 = f22*f20;
        f1 = f1+f3;
        heapClassInst.heap32[(r11+7)] = 0;
        f0 = f0*f13;
        f2 = f2*f16;
        f3 = f6+f7;
        f6 = f21*f20;
        f4 = f4+f5;
        heapClassInst.heapFloat[(r11+8)] = Float32(f1);
        f1 = f10*f13;
        f5 = f11*f16;
        f0 = f0+f2;
        f2 = f8*f19;
        f3 = f3+f6;
        heapClassInst.heapFloat[(r11+9)] = Float32(f4);
        f0 = f0+f2;
        heapClassInst.heapFloat[(r11+10)] = Float32(f3);
        f2 = f12*f13;
        f3 = f15*f16;
        f1 = f1+f5;
        f4 = f18*f19;
        f1 = f1+f4;
        f2 = f2+f3;
        f3 = f20*f19;
        f0 = f0+f25;
        heapClassInst.heap32[(r11+11)] = 0;
        f2 = f2+f3;
        f1 = f1+f26;
        heapClassInst.heapFloat[(r11+12)] = Float32(f0);
        f0 = f2+f27;
        heapClassInst.heapFloat[(r11+13)] = Float32(f1);
        heapClassInst.heapFloat[(r11+14)] = Float32(f0);
        r12 = r10 >> 2;
        heapClassInst.heap32[(r11+15)] = 0;
        r11 = Int64(heapClassInst.heap32[(r12)]);
        r11 = r11 >> 2;
        r11 = Int64(heapClassInst.heap32[(r11+2)]);
        r12 = sp + (-264);
        r13 = sp + (-280);
        heapClassInst.heap32[(g0)] = Int32(r10);
        heapClassInst.heap32[(g0+1)] = Int32(r8);
        heapClassInst.heap32[(g0+2)] = Int32(r12);
        heapClassInst.heap32[(g0+3)] = Int32(r13);
        __FUNCTION_TABLE__[(r11)>>2](i7);
        r8 = r1 >> 2;
        r8 = Int64(heapClassInst.heap32[(r8+48)]);
        r10 = r8 >> 2;
        r10 = Int64(heapClassInst.heap32[(r10)]);
        r10 = r10 >> 2;
        r10 = Int64(heapClassInst.heap32[(r10+2)]);
        r11 = sp + (-296);
        r14 = sp + (-312);
        heapClassInst.heap32[(g0)] = Int32(r8);
        heapClassInst.heap32[(g0+1)] = Int32(r4);
        heapClassInst.heap32[(g0+2)] = Int32(r11);
        heapClassInst.heap32[(g0+3)] = Int32(r14);
        __FUNCTION_TABLE__[(r10)>>2](i7);
        f0 = Float64(heapClassInst.heapFloat[(fp+(-66))]);
        f1 = Float64(heapClassInst.heapFloat[(fp+(-78))]);
        if(f0 > f1) 
    {
    __label__ = 40;
    }
    else{
        f0 = Float64(heapClassInst.heapFloat[(fp+(-70))]);
        f1 = Float64(heapClassInst.heapFloat[(fp+(-74))]);
        if(f0 < f1) 
    {
    __label__ = 40;
    }
    else{
        r8 = r2;
    __label__ = 41;
    }
    }
    if (__label__ == 40){
        r8 = 0;
    }
        r10 = r12 >> 2;
        r12 = r14 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r10+2)]);
        f1 = Float64(heapClassInst.heapFloat[(r12+2)]);
        if(f0 > f1) 
    {
    __label__ = 43;
    }
    else{
        r14 = r13 >> 2;
        r15 = r11 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r14+2)]);
        f1 = Float64(heapClassInst.heapFloat[(r15+2)]);
        if(f0 < f1) 
    {
    __label__ = 43;
    }
    else{
    __label__ = 44;
    }
    }
    if (__label__ == 43){
        r8 = 0;
    }
        f0 = Float64(heapClassInst.heapFloat[(r10+1)]);
        f1 = Float64(heapClassInst.heapFloat[(r12+1)]);
    if(!(f0 > f1)) 
    {
        r10 = r13 >> 2;
        r11 = r11 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r10+1)]);
        f1 = Float64(heapClassInst.heapFloat[(r11+1)]);
    if(!(f0 < f1)) 
    {
        r8 = r8 & 255;
        if(r8 != 0) 
    {
    break 
    }
    }
    }
        r8 = Int64(heapClassInst.heap32[(r7+5)]);
        r8 = (r8 - r9)|0;
        r8 = r8 >> 2;
        r8 = Int64(heapClassInst.heap32[(r8)]);
        r10 = r8 >> 2;
        r10 = Int64(heapClassInst.heap32[(r10)]);
        r10 = r10 >> 2;
        r10 = Int64(heapClassInst.heap32[(r10)]);
        heapClassInst.heap32[(g0)] = Int32(r8);
        __FUNCTION_TABLE__[(r10)>>2](i7);
        r8 = Int64(heapClassInst.heap32[(r7+1)]);
        r10 = r8 >> 2;
        r11 = Int64(heapClassInst.heap32[(r7+5)]);
        r11 = (r11 - r9)|0;
        r10 = Int64(heapClassInst.heap32[(r10)]);
        r10 = r10 >> 2;
        r11 = r11 >> 2;
        r10 = Int64(heapClassInst.heap32[(r10+13)]);
        r11 = Int64(heapClassInst.heap32[(r11)]);
        heapClassInst.heap32[(g0)] = Int32(r8);
        heapClassInst.heap32[(g0+1)] = Int32(r11);
        __FUNCTION_TABLE__[(r10)>>2](i7);
        r8 = Int64(heapClassInst.heap32[(r7+5)]);
        r8 = (r8 - r9)|0;
        r8 = r8 >> 2;
        heapClassInst.heap32[(r8)] = 0;
    }
    } while(false);
        r3 = (r3 + (-1))|0;
    if(!(r0 != r3)) 
    {
    break 
    }
    }
    }
    }
    } while(false);
    return;
case 14 =>
    r14 = _E2_str59;
    r0 = _E2_str160;
    heapClassInst.heap32[(g0)] = Int32(r14);
    heapClassInst.heap32[(g0+1)] = Int32(r0);
    heapClassInst.heap32[(g0+2)] = 101;
    _assert(i7);
case _ => 
    println("break 15655")
}
}
else{
    r0 = _E2_str99;
    r1 = _E2_str1100;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0+1)] = Int32(r1);
    heapClassInst.heap32[(g0+2)] = 199;
    _assert(i7);
}
}

