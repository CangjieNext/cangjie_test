/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*
import std.math.*

@OverflowWrapping
func _ZNK17btTypedConstraint9serializeEPvP12btSerializer(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var r5: Int64 = 0
  var r6: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(fp)]);
  r3 = Int64(heapClassInst.heap32[(r1)]);
  r3 = r3 >> 2;
  r4 = r2 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3 + 7)]);
  r5 = Int64(heapClassInst.heap32[(r4 + 5)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r5);
  r5 = Int64(heapClassInst.heap32[(fp + 1)]);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r5 = r5 >> 2;
  heapClassInst.heap32[(r5)] = Int32(commonVariable.r_g0);
  r3 = Int64(heapClassInst.heap32[(r1)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3 + 7)]);
  r6 = Int64(heapClassInst.heap32[(r4 + 6)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r6);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  heapClassInst.heap32[(r5 + 1)] = Int32(commonVariable.r_g0);
  r3 = Int64(heapClassInst.heap32[(r1)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3 + 10)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r3 = commonVariable.r_g0;
  r6 = Int64(heapClassInst.heap32[(r1)]);
  r6 = r6 >> 2;
  r6 = Int64(heapClassInst.heap32[(r6 + 7)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
  __FUNCTION_TABLE__[(r6) >> 2](i7);
  r6 = commonVariable.r_g0;
  heapClassInst.heap32[(r5 + 2)] = Int32(r6);
  if (!(r6 == 0)) 
  {
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1 + 12)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    __FUNCTION_TABLE__[(r1) >> 2](i7);
  }
  r0 = Int64(heapClassInst.heap32[(r4 + 1)]);
  heapClassInst.heap32[(r5 + 3)] = Int32(r0);
  r0 = Int64(heapClassInst.heapU8[r2 + 16]);
  heapClassInst.heap32[(r5 + 6)] = Int32(r0);
  r0 = Int64(heapClassInst.heap32[(r4 + 3)]);
  heapClassInst.heap32[(r5 + 5)] = Int32(r0);
  r0 = Int64(heapClassInst.heap32[(r4 + 2)]);
  heapClassInst.heap32[(r5 + 4)] = Int32(r0);
  heapClassInst.heap32[(r5 + 7)] = heapClassInst.heap32[(r4 + 7)];
  heapClassInst.heap32[(r5 + 8)] = heapClassInst.heap32[(r4 + 8)];
  heapClassInst.heap32[(r5 + 9)] = 0;
  r0 = Int64(heapClassInst.heap32[(r4 + 5)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 120)]);
  if (!(r1 < 1)) 
  {
    r1 = 0;
    while (true) {
      r0 = r0 >> 2;
      r0 = Int64(heapClassInst.heap32[(r0 + 122)]);
      r3 = r1 << 2;
      r0 = (r0 + r3) | 0;
      r0 = r0 >> 2;
      r0 = Int64(heapClassInst.heap32[(r0)]);
      if (!(r0 != r2)) 
      {
        heapClassInst.heap32[(r5 + 9)] = 1;
      }
      r1 = (r1 + 1) | 0;
      r0 = Int64(heapClassInst.heap32[(r4 + 5)]);
      r3 = r0 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3 + 120)]);
      if (r3 > r1) 
      {
        continue 
      }
      else {
        break 
      }
    }
  }
  r0 = Int64(heapClassInst.heap32[(r4 + 6)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 120)]);
  do {
    if (!(r1 < 1)) 
    {
      r1 = 0;
      while (true) {
        r0 = r0 >> 2;
        r0 = Int64(heapClassInst.heap32[(r0 + 122)]);
        r3 = r1 << 2;
        r0 = (r0 + r3) | 0;
        r0 = r0 >> 2;
        r0 = Int64(heapClassInst.heap32[(r0)]);
        if (!(r0 != r2)) 
        {
          heapClassInst.heap32[(r5 + 9)] = 1;
        }
        r1 = (r1 + 1) | 0;
        r0 = Int64(heapClassInst.heap32[(r4 + 6)]);
        r3 = r0 >> 2;
        r3 = Int64(heapClassInst.heap32[(r3 + 120)]);
        if (r3 > r1) 
        {
          continue 
        }
        else {
          break 
        }
      }
    }
  } while (false);
  r0 = _E2_str76;
  commonVariable.r_g0 = r0;
  return;
}

@OverflowWrapping
func _ZN23btStridingMeshInterfaceD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV23btStridingMeshInterface;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

@OverflowWrapping
func _ZN23btStridingMeshInterfaceD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV23btStridingMeshInterface;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

@OverflowWrapping
func _ZN31btInternalTriangleIndexCallbackD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV31btInternalTriangleIndexCallback;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

@OverflowWrapping
func _ZN31btInternalTriangleIndexCallbackD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV31btInternalTriangleIndexCallback;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

@OverflowWrapping
func _ZN18btTriangleCallbackD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV18btTriangleCallback;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

@OverflowWrapping
func _ZN18btTriangleCallbackD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV18btTriangleCallback;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

@OverflowWrapping
func _ZN26btTriangleIndexVertexArray16unLockVertexBaseEi(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  return;
}

@OverflowWrapping
func _ZNK26btTriangleIndexVertexArray24unLockReadOnlyVertexBaseEi(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  return;
}

@OverflowWrapping
func _ZN26btTriangleIndexVertexArray19preallocateVerticesEi(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  return;
}

@OverflowWrapping
func _ZN26btTriangleIndexVertexArray18preallocateIndicesEi(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  return;
}

@OverflowWrapping
func _ZNK26btTriangleIndexVertexArray14hasPremadeAabbEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 12)]);
  r1 = 1;
  r0 = if (r0 == r1) {1} else {0};
  r0 = r0 & 1;
  commonVariable.r_g0 = r0;
  return;
}

@OverflowWrapping
func _ZNK26btTriangleIndexVertexArray14setPremadeAabbERK9btVector3S2_(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  r1 = r1 >> 2;
  heapClassInst.heap32[(r0 + 13)] = heapClassInst.heap32[(r1)];
  heapClassInst.heap32[(r0 + 14)] = heapClassInst.heap32[(r1 + 1)];
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(r0 + 15)] = heapClassInst.heap32[(r1 + 2)];
  r2 = r2 >> 2;
  heapClassInst.heap32[(r0 + 16)] = heapClassInst.heap32[(r1 + 3)];
  heapClassInst.heap32[(r0 + 17)] = heapClassInst.heap32[(r2)];
  heapClassInst.heap32[(r0 + 18)] = heapClassInst.heap32[(r2 + 1)];
  heapClassInst.heap32[(r0 + 19)] = heapClassInst.heap32[(r2 + 2)];
  heapClassInst.heap32[(r0 + 20)] = heapClassInst.heap32[(r2 + 3)];
  heapClassInst.heap32[(r0 + 12)] = 1;
  return;
}

@OverflowWrapping
func _ZNK26btTriangleIndexVertexArray14getPremadeAabbEP9btVector3S1_(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  r1 = r1 >> 2;
  heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r0 + 13)];
  heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r0 + 14)];
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r0 + 15)];
  r2 = r2 >> 2;
  heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r0 + 16)];
  heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r0 + 17)];
  heapClassInst.heap32[(r2 + 1)] = heapClassInst.heap32[(r0 + 18)];
  heapClassInst.heap32[(r2 + 2)] = heapClassInst.heap32[(r0 + 19)];
  heapClassInst.heap32[(r2 + 3)] = heapClassInst.heap32[(r0 + 20)];
  return;
}

@OverflowWrapping
func _ZNK26btTriangleIndexVertexArray14getNumSubPartsEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 6)]);
  commonVariable.r_g0 = r0;
  return;
}

@OverflowWrapping
func _ZNK26btTriangleIndexVertexArray32getLockedReadOnlyVertexIndexBaseEPPKhRiR14PHY_ScalarTypeS3_S2_S3_S3_S5_i(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 9)]);
  r0 = r0 >> 2;
  r1 = r1 << 5;
  r0 = Int64(heapClassInst.heap32[(r0 + 8)]);
  r0 = (r0 + r1) | 0;
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  r2 = Int64(heapClassInst.heap32[(r0 + 3)]);
  r1 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heap32[(r1)] = Int32(r2);
  r1 = r3 >> 2;
  r2 = Int64(heapClassInst.heap32[(r0 + 4)]);
  r3 = Int64(heapClassInst.heap32[(fp + 3)]);
  heapClassInst.heap32[(r1)] = Int32(r2);
  r1 = r3 >> 2;
  r2 = Int64(heapClassInst.heap32[(r0 + 7)]);
  r3 = Int64(heapClassInst.heap32[(fp + 4)]);
  heapClassInst.heap32[(r1)] = Int32(r2);
  r1 = r3 >> 2;
  r2 = Int64(heapClassInst.heap32[(r0 + 5)]);
  r3 = Int64(heapClassInst.heap32[(fp + 7)]);
  heapClassInst.heap32[(r1)] = Int32(r2);
  r1 = r3 >> 2;
  r2 = Int64(heapClassInst.heap32[(r0)]);
  r3 = Int64(heapClassInst.heap32[(fp + 5)]);
  heapClassInst.heap32[(r1)] = Int32(r2);
  r1 = r3 >> 2;
  r2 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r3 = Int64(heapClassInst.heap32[(fp + 6)]);
  heapClassInst.heap32[(r1)] = Int32(r2);
  r1 = r3 >> 2;
  r2 = Int64(heapClassInst.heap32[(r0 + 2)]);
  r3 = Int64(heapClassInst.heap32[(fp + 8)]);
  heapClassInst.heap32[(r1)] = Int32(r2);
  r1 = r3 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 6)]);
  heapClassInst.heap32[(r1)] = Int32(r0);
  return;
}

@OverflowWrapping
func _ZN26btTriangleIndexVertexArray24getLockedVertexIndexBaseEPPhRiR14PHY_ScalarTypeS2_S1_S2_S2_S4_i(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 7)]);
  r3 = Int64(heapClassInst.heap32[(fp + 9)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r0 = commonVariable.r_g0;
  if (r0 > r3) 
  {
    r0 = Int64(heapClassInst.heap32[(fp + 1)]);
    r2 = Int64(heapClassInst.heap32[(fp + 2)]);
    r4 = Int64(heapClassInst.heap32[(fp + 3)]);
    r5 = Int64(heapClassInst.heap32[(fp + 4)]);
    r6 = Int64(heapClassInst.heap32[(fp + 5)]);
    r7 = Int64(heapClassInst.heap32[(fp + 6)]);
    r8 = Int64(heapClassInst.heap32[(fp + 7)]);
    r9 = Int64(heapClassInst.heap32[(fp + 8)]);
    r3 = r3 << 5;
    r1 = Int64(heapClassInst.heap32[(r1 + 8)]);
    r1 = (r1 + r3) | 0;
    r1 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r1 + 3)]);
    r2 = r2 >> 2;
    heapClassInst.heap32[(r2)] = Int32(r3);
    r0 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1 + 4)]);
    heapClassInst.heap32[(r0)] = Int32(r2);
    r0 = r4 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1 + 7)]);
    heapClassInst.heap32[(r0)] = Int32(r2);
    r0 = r5 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1 + 5)]);
    heapClassInst.heap32[(r0)] = Int32(r2);
    r0 = r8 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1)]);
    heapClassInst.heap32[(r0)] = Int32(r2);
    r0 = r6 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1 + 1)]);
    heapClassInst.heap32[(r0)] = Int32(r2);
    r0 = r7 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1 + 2)]);
    heapClassInst.heap32[(r0)] = Int32(r2);
    r0 = r9 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1 + 6)]);
    heapClassInst.heap32[(r0)] = Int32(r1);
    return;
  }
  else {
    r1 = _E2_str367;
    r3 = _E2_str1368;
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    heapClassInst.heap32[(g0 + 2)] = 41;
    _assert(i7);
  }
}

@OverflowWrapping
func _ZN26btTriangleIndexVertexArrayD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV26btTriangleIndexVertexArray;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r1 = Int64(heapClassInst.heap32[(r2 + 8)]);
  if (!(r1 == 0)) 
  {
    r3 = Int64(heapClassInst.heapU8[r0 + 36]);
    if (!(r3 == 0)) 
    {
      r3 = gNumAlignedFree;
      r3 = r3 >> 2;
      r4 = Int64(heapClassInst.heap32[(r3)]);
      r4 = (r4 + 1) | 0;
      r1 = r1 >> 2;
      heapClassInst.heap32[(r3)] = Int32(r4);
      r1 = Int64(heapClassInst.heap32[(r1 + (-1))]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      free(i7);
    }
    heapClassInst.heap32[(r2 + 8)] = 0;
  }
  r1 = 1;
  heapClassInst.heap8[r0 + 36] = Int8(r1);
  heapClassInst.heap32[(r2 + 8)] = 0;
  r1 = _ZTV23btStridingMeshInterface;
  heapClassInst.heap32[(r2 + 6)] = 0;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2 + 7)] = 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  if (!(r0 == 0)) 
  {
    r0 = gNumAlignedFree;
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0)]);
    r1 = (r1 + 1) | 0;
    heapClassInst.heap32[(r0)] = Int32(r1);
    r0 = Int64(heapClassInst.heap32[(r2 + (-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
  }
  return;
}

@OverflowWrapping
func _ZN26btTriangleIndexVertexArrayD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV26btTriangleIndexVertexArray;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r1 = Int64(heapClassInst.heap32[(r2 + 8)]);
  if (!(r1 == 0)) 
  {
    r3 = Int64(heapClassInst.heapU8[r0 + 36]);
    if (!(r3 == 0)) 
    {
      r3 = gNumAlignedFree;
      r3 = r3 >> 2;
      r4 = Int64(heapClassInst.heap32[(r3)]);
      r4 = (r4 + 1) | 0;
      r1 = r1 >> 2;
      heapClassInst.heap32[(r3)] = Int32(r4);
      r1 = Int64(heapClassInst.heap32[(r1 + (-1))]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      free(i7);
    }
    heapClassInst.heap32[(r2 + 8)] = 0;
  }
  r1 = 1;
  heapClassInst.heap8[r0 + 36] = Int8(r1);
  heapClassInst.heap32[(r2 + 8)] = 0;
  r0 = _ZTV23btStridingMeshInterface;
  heapClassInst.heap32[(r2 + 6)] = 0;
  r0 = (r0 + 8) | 0;
  heapClassInst.heap32[(r2 + 7)] = 0;
  heapClassInst.heap32[(r2)] = Int32(r0);
  return;
}

@OverflowWrapping
func _ZNK19btTriangleMeshShape7getNameEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = _E2_str372;
  commonVariable.r_g0 = r0;
  return;
}

@OverflowWrapping
func _ZNK19btTriangleMeshShape7getAabbERK11btTransformR9btVector3S4_(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
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
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  f0 = Float64(heapClassInst.heapFloat[(r1 + 10)]);
  f1 = Float64(heapClassInst.heapFloat[(r1 + 6)]);
  f2 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
  f3 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
  f4 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
  f5 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f6 = commonVariable.f_g0;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f7 = commonVariable.f_g0;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  f4 = f4 - f5;
  f5 = 0.5;
  f2 = f2 - f3;
  f0 = f0 - f1;
  f1 = Float64(heapClassInst.heapFloat[(r1 + 10)]);
  f3 = Float64(heapClassInst.heapFloat[(r1 + 6)]);
  f9 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
  f10 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
  f11 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
  f12 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
  r0 = r0 >> 2;
  f4 = f4 * f5;
  f2 = f2 * f5;
  f0 = f0 * f5;
  f1 = f1 + f3;
  f3 = f9 + f10;
  f9 = f11 + f12;
  f10 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  r2 = Int64(heapClassInst.heap32[(fp + 3)]);
  f4 = f4 + commonVariable.f_g0;
  f2 = f2 + f7;
  f0 = f0 + f6;
  f1 = f1 * f5;
  f3 = f3 * f5;
  f5 = f9 * f5;
  f6 = 0.0;
  if (f10 < f6) 
  {
    f7 = -f10;
  }
  else {
    f7 = f10;
  }
  f8 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
  if (f8 < f6) 
  {
    f9 = -f8;
  }
  else {
    f9 = f8;
  }
  f11 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
  if (f11 < f6) 
  {
    f12 = -f11;
  }
  else {
    f12 = f11;
  }
  f13 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
  if (f13 < f6) 
  {
    f14 = -f13;
  }
  else {
    f14 = f13;
  }
  f15 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
  if (f15 < f6) 
  {
    f16 = -f15;
  }
  else {
    f16 = f15;
  }
  f17 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
  if (f17 < f6) 
  {
    f18 = -f17;
  }
  else {
    f18 = f17;
  }
  f19 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  if (f19 < f6) 
  {
    f20 = -f19;
  }
  else {
    f20 = f19;
  }
  f21 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  if (f21 < f6) 
  {
    f22 = -f21;
  }
  else {
    f22 = f21;
  }
  f23 = Float64(heapClassInst.heapFloat[(r0)]);
  if (f23 < f6) 
  {
    f6 = -f23;
  }
  else {
    f6 = f23;
  }
  f23 = f23 * f5;
  f21 = f21 * f3;
  f17 = f17 * f5;
  f15 = f15 * f3;
  f21 = f23 + f21;
  f19 = f19 * f1;
  f6 = f6 * f4;
  f22 = f22 * f2;
  f5 = f11 * f5;
  f3 = f8 * f3;
  f8 = f17 + f15;
  f11 = f13 * f1;
  f13 = f18 * f4;
  f15 = f16 * f2;
  f16 = f21 + f19;
  f17 = Float64(heapClassInst.heapFloat[(r0 + 12)]);
  f6 = f6 + f22;
  f18 = f20 * f0;
  f3 = f5 + f3;
  f1 = f10 * f1;
  f4 = f12 * f4;
  f2 = f9 * f2;
  f5 = f8 + f11;
  f8 = Float64(heapClassInst.heapFloat[(r0 + 13)]);
  f9 = Float64(heapClassInst.heapFloat[(r0 + 14)]);
  f10 = f13 + f15;
  f11 = f14 * f0;
  f12 = f16 + f17;
  f6 = f6 + f18;
  f1 = f3 + f1;
  r0 = r1 >> 2;
  f2 = f4 + f2;
  f0 = f7 * f0;
  f3 = f5 + f8;
  f4 = f10 + f11;
  f5 = f12 - f6;
  f1 = f1 + f9;
  f0 = f2 + f0;
  f2 = f3 - f4;
  heapClassInst.heapFloat[(r0)] = Float32(f5);
  f5 = f1 - f0;
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f2);
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f5);
  r1 = r2 >> 2;
  f2 = f12 + f6;
  heapClassInst.heap32[(r0 + 3)] = 0;
  f3 = f3 + f4;
  heapClassInst.heapFloat[(r1)] = Float32(f2);
  f0 = f1 + f0;
  heapClassInst.heapFloat[(r1 + 1)] = Float32(f3);
  heapClassInst.heapFloat[(r1 + 2)] = Float32(f0);
  heapClassInst.heap32[(r1 + 3)] = 0;
  return;
}

@OverflowWrapping
func _ZN19btTriangleMeshShape15recalcLocalAabbEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var r5: Int64 = 0
  var r6: Int64 = 0
  var r7: Int64 = 0
  var r8: Int64 = 0
  var f0: Float64 = 0.0
  var f1: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-64);
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = 0;
  while (true) {
    r2 = sp + (-16);
    r3 = r2 >> 2;
    heapClassInst.heap32[(fp + (-4))] = 0;
    heapClassInst.heap32[(r3 + 1)] = 0;
    heapClassInst.heap32[(r3 + 2)] = 0;
    r4 = (r2 + r1) | 0;
    heapClassInst.heap32[(r3 + 3)] = 0;
    r3 = r4 >> 2;
    heapClassInst.heap32[(r3)] = 1065353216;
    r4 = r0 >> 2;
    r5 = Int64(heapClassInst.heap32[(r4)]);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5 + 16)]);
    r6 = sp + (-32);
    heapClassInst.heap32[(g0)] = Int32(r6);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    heapClassInst.heap32[(g0 + 2)] = Int32(r2);
    r7 = (r6 + r1) | 0;
    __FUNCTION_TABLE__[(r5) >> 2](i7);
    r5 = r7 >> 2;
    r7 = (r0 + r1) | 0;
    f0 = Float64(heapClassInst.heapFloat[(r5)]);
    f1 = Float64(heapClassInst.heapFloat[(r4 + 3)]);
    f0 = f0 + f1;
    r7 = r7 >> 2;
    heapClassInst.heapFloat[(r7 + 8)] = Float32(f0);
    heapClassInst.heap32[(r3)] = ( -1082130432);
    r3 = Int64(heapClassInst.heap32[(r4)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3 + 16)]);
    r8 = sp + (-48);
    heapClassInst.heap32[(g0)] = Int32(r8);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    heapClassInst.heap32[(g0 + 2)] = Int32(r2);
    __FUNCTION_TABLE__[(r3) >> 2](i7);
    r2 = r6 >> 2;
    r3 = r8 >> 2;
    heapClassInst.heap32[(fp + (-8))] = heapClassInst.heap32[(fp + (-12))];
    heapClassInst.heap32[(r2 + 1)] = heapClassInst.heap32[(r3 + 1)];
    heapClassInst.heap32[(r2 + 2)] = heapClassInst.heap32[(r3 + 2)];
    heapClassInst.heap32[(r2 + 3)] = heapClassInst.heap32[(r3 + 3)];
    f0 = Float64(heapClassInst.heapFloat[(r5)]);
    f1 = Float64(heapClassInst.heapFloat[(r4 + 3)]);
    r1 = (r1 + 4) | 0;
    f0 = f0 - f1;
    heapClassInst.heapFloat[(r7 + 4)] = Float32(f0);
    if (r1 != 12) 
    {
      continue 
    }
    else {
      break 
    }
  }
  return;
}

@OverflowWrapping
func _ZN21SupportVertexCallbackD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV18btTriangleCallback;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

@OverflowWrapping
func _ZN21SupportVertexCallbackD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV18btTriangleCallback;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

@OverflowWrapping
func _ZN21SupportVertexCallback15processTriangleEP9btVector3ii(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var f0: Float64 = 0.0
  var f1: Float64 = 0.0
  var f2: Float64 = 0.0
  var f3: Float64 = 0.0
  var f4: Float64 = 0.0
  var f5: Float64 = 0.0
  var f6: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r1 >> 2;
  r0 = r0 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r1 + 22)]);
  f1 = Float64(heapClassInst.heapFloat[(r0)]);
  f2 = Float64(heapClassInst.heapFloat[(r1 + 23)]);
  f3 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f4 = Float64(heapClassInst.heapFloat[(r1 + 24)]);
  f5 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f1 = f0 * f1;
  f3 = f2 * f3;
  f1 = f1 + f3;
  f3 = f4 * f5;
  f5 = Float64(heapClassInst.heapFloat[(r1 + 21)]);
  f1 = f1 + f3;
  if (f5 < f1) 
  {
    heapClassInst.heapFloat[(r1 + 21)] = Float32(f1);
    heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r0)];
    heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r0 + 1)];
    heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r0 + 2)];
    heapClassInst.heap32[(r1 + 4)] = heapClassInst.heap32[(r0 + 3)];
    f5 = f1;
  }
  f1 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
  f3 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
  f1 = f0 * f1;
  f3 = f2 * f3;
  f6 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
  f1 = f1 + f3;
  f3 = f4 * f6;
  f1 = f1 + f3;
  if (f5 < f1) 
  {
    heapClassInst.heapFloat[(r1 + 21)] = Float32(f1);
    heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r0 + 4)];
    heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r0 + 5)];
    heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r0 + 6)];
    heapClassInst.heap32[(r1 + 4)] = heapClassInst.heap32[(r0 + 7)];
    f5 = f1;
  }
  f1 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
  f3 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
  f0 = f0 * f1;
  f1 = f2 * f3;
  f2 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
  f0 = f0 + f1;
  f1 = f4 * f2;
  f0 = f0 + f1;
  if (f5 < f0) 
  {
    heapClassInst.heapFloat[(r1 + 21)] = Float32(f0);
    heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r0 + 8)];
    heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r0 + 9)];
    heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r0 + 10)];
    heapClassInst.heap32[(r1 + 4)] = heapClassInst.heap32[(r0 + 11)];
    return;
  }
  else {
    return;
  }
}

@OverflowWrapping
func _ZN19btTriangleMeshShape15setLocalScalingERK9btVector3(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(r1 + 12)]);
  r1 = r1 >> 2;
  r2 = r2 >> 2;
  heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r2)];
  heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r2 + 1)];
  heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r2 + 2)];
  heapClassInst.heap32[(r1 + 4)] = heapClassInst.heap32[(r2 + 3)];
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZN19btTriangleMeshShape15recalcLocalAabbEv(i7);
  return;
}

@OverflowWrapping
func _ZNK19btTriangleMeshShape15getLocalScalingEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 12)]);
  r0 = (r0 + 4) | 0;
  commonVariable.r_g0 = r0;
  return;
}

@OverflowWrapping
func _ZZNK19btTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_EN16FilteredCallbackD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV31btInternalTriangleIndexCallback;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

@OverflowWrapping
func _ZZNK19btTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_EN16FilteredCallbackD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV31btInternalTriangleIndexCallback;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

@OverflowWrapping
func _ZZNK19btTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_EN16FilteredCallback28internalProcessTriangleIndexEPS2_ii(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var f0: Float64 = 0.0
  var f1: Float64 = 0.0
  var f2: Float64 = 0.0
  var f3: Float64 = 0.0
  var f4: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(fp)]);
  f0 = Float64(heapClassInst.heapFloat[(r1)]);
  f1 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
  f2 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
  f3 = if (f0 < f1) {f0} else {f1};
  r2 = r2 >> 2;
  f3 = if (f3 < f2) {f3} else {f2};
  f4 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
  if (!(f3 > f4)) 
  {
    f0 = if (f0 > f1) {f0} else {f1};
    f0 = if (f0 > f2) {f0} else {f2};
    f1 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
    if (!(f0 < f1)) 
    {
      f0 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
      f1 = Float64(heapClassInst.heapFloat[(r1 + 6)]);
      f2 = Float64(heapClassInst.heapFloat[(r1 + 10)]);
      f3 = if (f0 < f1) {f0} else {f1};
      f3 = if (f3 < f2) {f3} else {f2};
      f4 = Float64(heapClassInst.heapFloat[(r2 + 8)]);
      if (!(f3 > f4)) 
      {
        f0 = if (f0 > f1) {f0} else {f1};
        f0 = if (f0 > f2) {f0} else {f2};
        f1 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
        if (!(f0 < f1)) 
        {
          f0 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
          f1 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
          f2 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
          f3 = if (f0 < f1) {f0} else {f1};
          f3 = if (f3 < f2) {f3} else {f2};
          f4 = Float64(heapClassInst.heapFloat[(r2 + 7)]);
          if (!(f3 > f4)) 
          {
            f0 = if (f0 > f1) {f0} else {f1};
            f0 = if (f0 > f2) {f0} else {f2};
            f1 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
            if (!(f0 < f1)) 
            {
              r1 = Int64(heapClassInst.heap32[(fp + 2)]);
              r3 = Int64(heapClassInst.heap32[(fp + 3)]);
              r2 = Int64(heapClassInst.heap32[(r2 + 1)]);
              r4 = r2 >> 2;
              r4 = Int64(heapClassInst.heap32[(r4)]);
              r4 = r4 >> 2;
              r4 = Int64(heapClassInst.heap32[(r4 + 2)]);
              heapClassInst.heap32[(g0)] = Int32(r2);
              heapClassInst.heap32[(g0 + 1)] = Int32(r0);
              heapClassInst.heap32[(g0 + 2)] = Int32(r1);
              heapClassInst.heap32[(g0 + 3)] = Int32(r3);
              __FUNCTION_TABLE__[(r4) >> 2](i7);
            }
          }
        }
      }
    }
  }
  return;
}

@OverflowWrapping
func _ZNK19btTriangleMeshShape21calculateLocalInertiaEfR9btVector3(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = _E2_str10;
  r1 = _E2_str3375;
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  heapClassInst.heap32[(g0 + 2)] = 188;
  _assert(i7);
}

@OverflowWrapping
func _ZNK19btTriangleMeshShape24localGetSupportingVertexERK9btVector3(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var r5: Int64 = 0
  var r6: Int64 = 0
  var f0: Float64 = 0.0
  var f1: Float64 = 0.0
  var f2: Float64 = 0.0
  var f3: Float64 = 0.0
  var f4: Float64 = 0.0
  var f5: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-152); 
  var g0 = i7 >> 2; 
  r0 = _ZTV21SupportVertexCallback;
  r1 = sp + (-120);
  r0 = (r0 + 8) | 0;
  r2 = r1 >> 2;
  heapClassInst.heap32[(fp + (-30))] = Int32(r0);
  heapClassInst.heap32[(r2 + 1)] = 0;
  heapClassInst.heap32[(r2 + 2)] = 0;
  heapClassInst.heap32[(r2 + 3)] = 0;
  heapClassInst.heap32[(r2 + 4)] = 0;
  heapClassInst.heap32[(r2 + 5)] = 1065353216;
  heapClassInst.heap32[(r2 + 6)] = 0;
  heapClassInst.heap32[(r2 + 7)] = 0;
  heapClassInst.heap32[(r2 + 8)] = 0;
  heapClassInst.heap32[(r2 + 9)] = 0;
  heapClassInst.heap32[(r2 + 10)] = 1065353216;
  heapClassInst.heap32[(r2 + 11)] = 0;
  heapClassInst.heap32[(r2 + 12)] = 0;
  heapClassInst.heap32[(r2 + 13)] = 0;
  heapClassInst.heap32[(r2 + 14)] = 0;
  heapClassInst.heap32[(r2 + 15)] = 1065353216;
  heapClassInst.heap32[(r2 + 16)] = 0;
  heapClassInst.heap32[(r2 + 17)] = 0;
  heapClassInst.heap32[(r2 + 18)] = 0;
  heapClassInst.heap32[(r2 + 19)] = 0;
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(r2 + 20)] = 0;
  r0 = r0 >> 2;
  heapClassInst.heap32[(r2 + 21)] = ( -581039253);
  f0 = 0.0;
  f1 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f2 = Float64(heapClassInst.heapFloat[(r0)]);
  f3 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f4 = f1 * f0;
  f5 = f2 * f0;
  f2 = f2 + f4;
  f0 = f3 * f0;
  f1 = f5 + f1;
  f2 = f2 + f0;
  f4 = f5 + f4;
  f0 = f1 + f0;
  heapClassInst.heapFloat[(r2 + 22)] = Float32(f2);
  f1 = f4 + f3;
  heapClassInst.heapFloat[(r2 + 23)] = Float32(f0);
  heapClassInst.heapFloat[(r2 + 24)] = Float32(f1);
  r0 = sp + (-136);
  heapClassInst.heap32[(r2 + 25)] = 0;
  r3 = r0 >> 2;
  heapClassInst.heap32[(fp + (-34))] = 1566444395;
  heapClassInst.heap32[(r3 + 1)] = 1566444395;
  r4 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heap32[(r3 + 2)] = 1566444395;
  r5 = r4 >> 2;
  heapClassInst.heap32[(r3 + 3)] = 0;
  r3 = Int64(heapClassInst.heap32[(r5)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3 + 15)]);
  r5 = sp + (-16);
  r6 = r5 >> 2;
  heapClassInst.heap32[(fp + (-4))] = ( -581039253);
  heapClassInst.heap32[(r6 + 1)] = ( -581039253);
  heapClassInst.heap32[(r6 + 2)] = ( -581039253);
  heapClassInst.heap32[(r6 + 3)] = 0;
  heapClassInst.heap32[(g0)] = Int32(r4);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  heapClassInst.heap32[(g0 + 2)] = Int32(r5);
  heapClassInst.heap32[(g0 + 3)] = Int32(r0);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r0 = Int64(heapClassInst.heap32[(fp)]);
  f0 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
  f1 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
  f2 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
  r0 = r0 >> 2;
  heapClassInst.heap32[(r0)] = heapClassInst.heap32[(r2 + 1)];
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f2);
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f1);
  heapClassInst.heapFloat[(r0 + 3)] = Float32(f0);
  return;
}

@OverflowWrapping
func _ZNK19btTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var r5: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-56); 
  var g0 = i7 >> 2; 
  r0 = _ZTVZNK19btTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_E16FilteredCallback;
  r1 = sp + (-40);
  r0 = (r0 + 8) | 0;
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  r3 = r1 >> 2;
  r4 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heap32[(fp + (-10))] = Int32(r0);
  r0 = r2 >> 2;
  heapClassInst.heap32[(r3 + 1)] = Int32(r4);
  heapClassInst.heap32[(r3 + 2)] = heapClassInst.heap32[(r0)];
  heapClassInst.heap32[(r3 + 3)] = heapClassInst.heap32[(r0 + 1)];
  r4 = Int64(heapClassInst.heap32[(fp + 3)]);
  heapClassInst.heap32[(r3 + 4)] = heapClassInst.heap32[(r0 + 2)];
  r5 = r4 >> 2;
  heapClassInst.heap32[(r3 + 5)] = heapClassInst.heap32[(r0 + 3)];
  heapClassInst.heap32[(r3 + 6)] = heapClassInst.heap32[(r5)];
  heapClassInst.heap32[(r3 + 7)] = heapClassInst.heap32[(r5 + 1)];
  r0 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heap32[(r3 + 8)] = heapClassInst.heap32[(r5 + 2)];
  r0 = r0 >> 2;
  heapClassInst.heap32[(r3 + 9)] = heapClassInst.heap32[(r5 + 3)];
  r0 = Int64(heapClassInst.heap32[(r0 + 12)]);
  r3 = r0 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3 + 2)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  heapClassInst.heap32[(g0 + 2)] = Int32(r2);
  heapClassInst.heap32[(g0 + 3)] = Int32(r4);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  return;
}

@OverflowWrapping
func _ZN19btTriangleMeshShapeD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV14btConcaveShape;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

@OverflowWrapping
func _ZN19btTriangleMeshShapeD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV14btConcaveShape;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

@OverflowWrapping
func _GLOBAL__D__ZN19btGenericMemoryPool24allocate_from_free_nodesEj(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  return;
}

@OverflowWrapping
func _ZN16btPointCollectorD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV16btPointCollector;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

@OverflowWrapping
func _ZN16btPointCollectorD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV16btPointCollector;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

@OverflowWrapping
func _ZN16btPointCollector20setShapeIdentifiersAEii(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  return;
}

@OverflowWrapping
func _ZN16btPointCollector20setShapeIdentifiersBEii(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  return;
}

@OverflowWrapping
func _ZN16btPointCollector15addContactPointERK9btVector3S2_f(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var f0: Float64 = 0.0
  var f1: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  f0 = Float64(heapClassInst.heapFloat[(fp + 3)]);
  r1 = r0 >> 2;
  f1 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
  if (!(f1 <= f0)) 
  {
    r2 = Int64(heapClassInst.heap32[(fp + 1)]);
    r3 = Int64(heapClassInst.heap32[(fp + 2)]);
    r4 = 1;
    r2 = r2 >> 2;
    heapClassInst.heap8[r0 + 40] = Int8(r4);
    heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r2)];
    heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r2 + 1)];
    heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r2 + 2)];
    r0 = r3 >> 2;
    heapClassInst.heap32[(r1 + 4)] = heapClassInst.heap32[(r2 + 3)];
    heapClassInst.heap32[(r1 + 5)] = heapClassInst.heap32[(r0)];
    heapClassInst.heap32[(r1 + 6)] = heapClassInst.heap32[(r0 + 1)];
    heapClassInst.heap32[(r1 + 7)] = heapClassInst.heap32[(r0 + 2)];
    heapClassInst.heap32[(r1 + 8)] = heapClassInst.heap32[(r0 + 3)];
    heapClassInst.heapFloat[(r1 + 9)] = Float32(f0);
  }
  return;
}

@OverflowWrapping
func _ZN27btContinuousConvexCollisionD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV12btConvexCast;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

@OverflowWrapping
func _ZN27btContinuousConvexCollisionD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV12btConvexCast;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

@OverflowWrapping
func _ZN27btContinuousConvexCollision16calcTimeOfImpactERK11btTransformS2_S2_S2_RN12btConvexCast10CastResultE(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  i7 = sp + (-816); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r2 = 0;
  r3 = r1 >> 2;
  heapClassInst.heap8[r1 + 312] = Int8(r2);
  r4 = 1;
  heapClassInst.heap32[(r3)] = 0;
  heapClassInst.heap8[r1 + 356] = Int8(r4);
  heapClassInst.heap32[(r3 + 73)] = 1566444395;
  heapClassInst.heap32[(r3 + 74)] = 1566444395;
  heapClassInst.heap32[(r3 + 75)] = 1566444395;
  heapClassInst.heap32[(r3 + 76)] = 0;
  heapClassInst.heap8[r1 + 352] = Int8(r2);
  heapClassInst.heap32[(r3 + 84)] = 0;
  heapClassInst.heap32[(r3 + 85)] = 0;
  heapClassInst.heap32[(r3 + 86)] = 0;
  heapClassInst.heap32[(r3 + 87)] = 0;
  r3 = Int64(heapClassInst.heapU8[r1 + 332]);
  r5 = Int64(heapClassInst.heap32[(fp + 1)]);
  r6 = Int64(heapClassInst.heap32[(fp + 2)]);
  r3 = r3 & 240;
  r7 = r6 >> 2;
  heapClassInst.heap8[r1 + 332] = Int8(r3);
  r1 = r5 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r7 + 14)]);
  f1 = Float64(heapClassInst.heapFloat[(r1 + 14)]);
  f2 = Float64(heapClassInst.heapFloat[(r7 + 13)]);
  f3 = Float64(heapClassInst.heapFloat[(r1 + 13)]);
  f4 = Float64(heapClassInst.heapFloat[(r7 + 12)]);
  f5 = Float64(heapClassInst.heapFloat[(r1 + 12)]);
  r3 = sp + (-40);
  r7 = sp + (-44);
  heapClassInst.heap32[(g0)] = Int32(r5);
  heapClassInst.heap32[(g0 + 1)] = Int32(r6);
  heapClassInst.heap32[(g0 + 2)] = Int32(r3);
  heapClassInst.heap32[(g0 + 3)] = Int32(r7);
  _ZN15btTransformUtil22calculateDiffAxisAngleERK11btTransformS2_R9btVector3Rf(i7);
  r3 = r3 >> 2;
  f6 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
  f7 = Float64(heapClassInst.heapFloat[(fp + (-11))]);
  f8 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
  f9 = Float64(heapClassInst.heapFloat[(fp + (-10))]);
  r3 = sp + (-96);
  f9 = f9 * f7;
  f8 = f8 * f7;
  r6 = r3 >> 2;
  heapClassInst.heapFloat[(fp + (-24))] = Float32(f9);
  f6 = f6 * f7;
  heapClassInst.heapFloat[(r6 + 1)] = Float32(f8);
  r7 = Int64(heapClassInst.heap32[(fp + 3)]);
  r8 = Int64(heapClassInst.heap32[(fp + 4)]);
  heapClassInst.heapFloat[(r6 + 2)] = Float32(f6);
  r9 = r8 >> 2;
  heapClassInst.heap32[(r6 + 3)] = 0;
  r6 = r7 >> 2;
  f7 = Float64(heapClassInst.heapFloat[(r9 + 14)]);
  f10 = Float64(heapClassInst.heapFloat[(r6 + 14)]);
  f11 = Float64(heapClassInst.heapFloat[(r9 + 13)]);
  f12 = Float64(heapClassInst.heapFloat[(r6 + 13)]);
  f13 = Float64(heapClassInst.heapFloat[(r9 + 12)]);
  f14 = Float64(heapClassInst.heapFloat[(r6 + 12)]);
  r9 = sp + (-16);
  r10 = sp + (-20);
  heapClassInst.heap32[(g0)] = Int32(r7);
  heapClassInst.heap32[(g0 + 1)] = Int32(r8);
  heapClassInst.heap32[(g0 + 2)] = Int32(r9);
  heapClassInst.heap32[(g0 + 3)] = Int32(r10);
  _ZN15btTransformUtil22calculateDiffAxisAngleERK11btTransformS2_R9btVector3Rf(i7);
  r8 = r9 >> 2;
  f15 = Float64(heapClassInst.heapFloat[(r8 + 2)]);
  f16 = Float64(heapClassInst.heapFloat[(fp + (-5))]);
  f17 = Float64(heapClassInst.heapFloat[(r8 + 1)]);
  f18 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
  r8 = sp + (-112);
  f18 = f18 * f16;
  f17 = f17 * f16;
  r9 = r8 >> 2;
  heapClassInst.heapFloat[(fp + (-28))] = Float32(f18);
  f15 = f15 * f16;
  heapClassInst.heapFloat[(r9 + 1)] = Float32(f17);
  heapClassInst.heapFloat[(r9 + 2)] = Float32(f15);
  heapClassInst.heap32[(r9 + 3)] = 0;
  r9 = Int64(heapClassInst.heap32[(r0 + 3)]);
  r10 = r9 >> 2;
  r10 = Int64(heapClassInst.heap32[(r10)]);
  r10 = r10 >> 2;
  r10 = Int64(heapClassInst.heap32[(r10 + 4)]);
  heapClassInst.heap32[(g0)] = Int32(r9);
  __FUNCTION_TABLE__[(r10) >> 2](i7);
  f16 = commonVariable.f_g0;
  r9 = Int64(heapClassInst.heap32[(r0 + 4)]);
  r10 = r9 >> 2;
  r10 = Int64(heapClassInst.heap32[(r10)]);
  r10 = r10 >> 2;
  r10 = Int64(heapClassInst.heap32[(r10 + 4)]);
  heapClassInst.heap32[(g0)] = Int32(r9);
  f9 = f9 * f9;
  f8 = f8 * f8;
  __FUNCTION_TABLE__[(r10) >> 2](i7);
  f19 = commonVariable.f_g0;
  f8 = f9 + f8;
  f6 = f6 * f6;
  f6 = f8 + f6;
  heapClassInst.heapFloat[(g0)] = Float32(f6);
  f6 = f18 * f18;
  f8 = f17 * f17;
  sqrtf(i7);
  f9 = commonVariable.f_g0;
  f11 = f11 - f12;
  f2 = f2 - f3;
  f3 = f13 - f14;
  f4 = f4 - f5;
  f5 = f6 + f8;
  f6 = f15 * f15;
  f8 = f11 - f2;
  f12 = f3 - f4;
  f7 = f7 - f10;
  f0 = f0 - f1;
  f1 = f5 + f6;
  f5 = f7 - f0;
  heapClassInst.heapFloat[(g0)] = Float32(f1);
  f1 = f12 * f12;
  f6 = f8 * f8;
  sqrtf(i7);
  f1 = f1 + f6;
  f6 = f5 * f5;
  f1 = f1 + f6;
  f6 = f9 * f16;
  f9 = commonVariable.f_g0 * f19;
  heapClassInst.heapFloat[(g0)] = Float32(f1);
  f1 = f6 + f9;
  sqrtf(i7);
  f6 = commonVariable.f_g0 + f1;
  f9 = 0.0;
  do {
    if (!(f6 == f9)) 
    {
      r9 = _ZTV16btPointCollector;
      r9 = (r9 + 8) | 0;
      r10 = sp + (-176);
      heapClassInst.heap32[(fp + (-44))] = Int32(r9);
      r11 = r10 >> 2;
      heapClassInst.heap32[(r11 + 9)] = 1566444395;
      heapClassInst.heap8[sp + (-136)] = Int8(r2);
      r12 = Int64(heapClassInst.heap32[(r0 + 4)]);
      r13 = r12 >> 2;
      r13 = Int64(heapClassInst.heap32[(r13)]);
      r13 = r13 >> 2;
      r13 = Int64(heapClassInst.heap32[(r13 + 11)]);
      r14 = Int64(heapClassInst.heap32[(r0 + 2)]);
      r15 = Int64(heapClassInst.heap32[(r0 + 1)]);
      heapClassInst.heap32[(g0)] = Int32(r12);
      __FUNCTION_TABLE__[(r13) >> 2](i7);
      f6 = commonVariable.f_g0;
      r12 = Int64(heapClassInst.heap32[(r0 + 3)]);
      r13 = r12 >> 2;
      r13 = Int64(heapClassInst.heap32[(r13)]);
      r13 = r13 >> 2;
      r13 = Int64(heapClassInst.heap32[(r13 + 11)]);
      heapClassInst.heap32[(g0)] = Int32(r12);
      __FUNCTION_TABLE__[(r13) >> 2](i7);
      r12 = Int64(heapClassInst.heap32[(r0 + 4)]);
      r13 = Int64(heapClassInst.heap32[(r0 + 3)]);
      r16 = r12 >> 2;
      r17 = r13 >> 2;
      r18 = _ZTV17btGjkPairDetector;
      r16 = Int64(heapClassInst.heap32[(r16 + 1)]);
      r17 = Int64(heapClassInst.heap32[(r17 + 1)]);
      r19 = sp + (-256);
      r18 = (r18 + 8) | 0;
      r20 = r19 >> 2;
      heapClassInst.heap32[(fp + (-64))] = Int32(r18);
      heapClassInst.heap32[(r20 + 1)] = 0;
      heapClassInst.heap32[(r20 + 2)] = 1065353216;
      heapClassInst.heap32[(r20 + 3)] = 0;
      heapClassInst.heap32[(r20 + 4)] = 0;
      heapClassInst.heap32[(r20 + 5)] = Int32(r14);
      heapClassInst.heap32[(r20 + 6)] = Int32(r15);
      heapClassInst.heap32[(r20 + 7)] = Int32(r13);
      heapClassInst.heap32[(r20 + 8)] = Int32(r12);
      heapClassInst.heap32[(r20 + 9)] = Int32(r17);
      heapClassInst.heap32[(r20 + 10)] = Int32(r16);
      heapClassInst.heapFloat[(r20 + 11)] = Float32(commonVariable.f_g0);
      heapClassInst.heapFloat[(r20 + 12)] = Float32(f6);
      heapClassInst.heap8[sp + (-204)] = Int8(r2);
      r12 = sp + (-392);
      heapClassInst.heap32[(r20 + 15)] = ( -1);
      r13 = r12 >> 2;
      heapClassInst.heap32[(r20 + 18)] = 1;
      heapClassInst.heap32[(r13 + 32)] = 1566444395;
      heapClassInst.heap32[(r13 + 33)] = 0;
      heapClassInst.heap32[(fp + (-98))] = heapClassInst.heap32[(r1)];
      heapClassInst.heap32[(r13 + 1)] = heapClassInst.heap32[(r1 + 1)];
      heapClassInst.heap32[(r13 + 2)] = heapClassInst.heap32[(r1 + 2)];
      heapClassInst.heap32[(r13 + 3)] = heapClassInst.heap32[(r1 + 3)];
      heapClassInst.heap32[(r13 + 4)] = heapClassInst.heap32[(r1 + 4)];
      heapClassInst.heap32[(r13 + 5)] = heapClassInst.heap32[(r1 + 5)];
      heapClassInst.heap32[(r13 + 6)] = heapClassInst.heap32[(r1 + 6)];
      heapClassInst.heap32[(r13 + 7)] = heapClassInst.heap32[(r1 + 7)];
      heapClassInst.heap32[(r13 + 8)] = heapClassInst.heap32[(r1 + 8)];
      heapClassInst.heap32[(r13 + 9)] = heapClassInst.heap32[(r1 + 9)];
      heapClassInst.heap32[(r13 + 10)] = heapClassInst.heap32[(r1 + 10)];
      heapClassInst.heap32[(r13 + 11)] = heapClassInst.heap32[(r1 + 11)];
      heapClassInst.heap32[(r13 + 12)] = heapClassInst.heap32[(r1 + 12)];
      heapClassInst.heap32[(r13 + 13)] = heapClassInst.heap32[(r1 + 13)];
      heapClassInst.heap32[(r13 + 14)] = heapClassInst.heap32[(r1 + 14)];
      heapClassInst.heap32[(r13 + 15)] = heapClassInst.heap32[(r1 + 15)];
      heapClassInst.heap32[(r13 + 16)] = heapClassInst.heap32[(r6)];
      heapClassInst.heap32[(r13 + 17)] = heapClassInst.heap32[(r6 + 1)];
      heapClassInst.heap32[(r13 + 18)] = heapClassInst.heap32[(r6 + 2)];
      heapClassInst.heap32[(r13 + 19)] = heapClassInst.heap32[(r6 + 3)];
      heapClassInst.heap32[(r13 + 20)] = heapClassInst.heap32[(r6 + 4)];
      heapClassInst.heap32[(r13 + 21)] = heapClassInst.heap32[(r6 + 5)];
      heapClassInst.heap32[(r13 + 22)] = heapClassInst.heap32[(r6 + 6)];
      heapClassInst.heap32[(r13 + 23)] = heapClassInst.heap32[(r6 + 7)];
      heapClassInst.heap32[(r13 + 24)] = heapClassInst.heap32[(r6 + 8)];
      heapClassInst.heap32[(r13 + 25)] = heapClassInst.heap32[(r6 + 9)];
      heapClassInst.heap32[(r13 + 26)] = heapClassInst.heap32[(r6 + 10)];
      heapClassInst.heap32[(r13 + 27)] = heapClassInst.heap32[(r6 + 11)];
      heapClassInst.heap32[(r13 + 28)] = heapClassInst.heap32[(r6 + 12)];
      heapClassInst.heap32[(r13 + 29)] = heapClassInst.heap32[(r6 + 13)];
      heapClassInst.heap32[(r13 + 30)] = heapClassInst.heap32[(r6 + 14)];
      heapClassInst.heap32[(r13 + 31)] = heapClassInst.heap32[(r6 + 15)];
      heapClassInst.heap32[(g0)] = Int32(r19);
      heapClassInst.heap32[(g0 + 1)] = Int32(r12);
      heapClassInst.heap32[(g0 + 2)] = Int32(r10);
      heapClassInst.heap32[(g0 + 3)] = 0;
      heapClassInst.heap32[(g0 + 4)] = 0;
      _ZN17btGjkPairDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb(i7);
      f6 = Float64(heapClassInst.heapFloat[(r11 + 5)]);
      r1 = Int64(heapClassInst.heapU8[sp + (-136)]);
      r6 = sp + (-128);
      heapClassInst.heapFloat[(fp + (-32))] = Float32(f6);
      f10 = Float64(heapClassInst.heapFloat[(r11 + 6)]);
      r10 = r6 >> 2;
      heapClassInst.heapFloat[(r10 + 1)] = Float32(f10);
      f13 = Float64(heapClassInst.heapFloat[(r11 + 7)]);
      heapClassInst.heapFloat[(r10 + 2)] = Float32(f13);
      f14 = Float64(heapClassInst.heapFloat[(r11 + 8)]);
      heapClassInst.heapFloat[(r10 + 3)] = Float32(f14);
      if (!(r1 == 0)) 
      {
        r1 = Int64(heapClassInst.heap32[(fp + 5)]);
        f15 = Float64(heapClassInst.heapFloat[(r11 + 1)]);
        f16 = Float64(heapClassInst.heapFloat[(r11 + 2)]);
        f17 = Float64(heapClassInst.heapFloat[(r11 + 3)]);
        f18 = f12 * f15;
        f19 = f8 * f16;
        r12 = sp + (-456);
        f18 = f18 + f19;
        f19 = f5 * f17;
        f20 = Float64(heapClassInst.heapFloat[(r11 + 9)]);
        f21 = Float64(heapClassInst.heapFloat[(r11 + 4)]);
        f18 = f18 + f19;
        r11 = (r12 + 48) | 0;
        while (true) {
          f19 = 0.0010000000474974513;
          if (f20 > f19) 
          {
            r13 = r1 >> 2;
            r14 = Int64(heapClassInst.heap32[(r13 + 42)]);
            if (!(r14 == 0)) 
            {
              r15 = r14 >> 2;
              r15 = Int64(heapClassInst.heap32[(r15)]);
              r15 = r15 >> 2;
              r15 = Int64(heapClassInst.heap32[(r15 + 5)]);
              r16 = sp + (-80);
              r17 = r16 >> 2;
              heapClassInst.heap32[(fp + (-20))] = 1065353216;
              heapClassInst.heap32[(r17 + 1)] = 1065353216;
              heapClassInst.heap32[(r17 + 2)] = 1065353216;
              heapClassInst.heap32[(r17 + 3)] = 0;
              heapClassInst.heap32[(g0)] = Int32(r14);
              heapClassInst.heap32[(g0 + 1)] = Int32(r6);
              heapClassInst.heap32[(g0 + 2)] = 1045220557;
              heapClassInst.heap32[(g0 + 3)] = Int32(r16);
              __FUNCTION_TABLE__[(r15) >> 2](i7);
            }
            r2 = (r2 + 1) | 0;
            if (r2 > 64) 
            {
              break 
            }
            else {
              f6 = f12 * f15;
              f10 = f8 * f16;
              f6 = f6 + f10;
              f10 = f5 * f17;
              f18 = f6 + f10;
              f6 = f18 + f1;
              f10 = 1.1920928955078125e-007;
              if (f6 <= f10) 
              {
                break 
              }
              else {
                f6 = f20 / f6;
                f19 = f9 + f6;
                f6 = 0.0;
                if (f19 < f6) 
                {
                  break 
                }
                else {
                  f10 = 1.0;
                  if (f19 > f10) 
                  {
                    break 
                  }
                  else {
                    if (f19 <= f9) 
                    {
                      break 
                    }
                    else {
                      heapClassInst.heap32[(g0)] = Int32(r5);
                      heapClassInst.heapFloat[(g0 + 1)] = Float32(f4);
                      heapClassInst.heapFloat[(g0 + 2)] = Float32(f2);
                      heapClassInst.heapFloat[(g0 + 3)] = Float32(f0);
                      heapClassInst.heap32[(g0 + 4)] = Int32(r3);
                      heapClassInst.heapFloat[(g0 + 5)] = Float32(f19);
                      heapClassInst.heap32[(g0 + 6)] = Int32(r12);
                      _ZN15btTransformUtil18integrateTransformERK11btTransformRK9btVector3S5_fRS0_(i7);
                      r14 = sp + (-520);
                      heapClassInst.heap32[(g0)] = Int32(r7);
                      heapClassInst.heapFloat[(g0 + 1)] = Float32(f3);
                      heapClassInst.heapFloat[(g0 + 2)] = Float32(f11);
                      heapClassInst.heapFloat[(g0 + 3)] = Float32(f7);
                      heapClassInst.heap32[(g0 + 4)] = Int32(r8);
                      heapClassInst.heapFloat[(g0 + 5)] = Float32(f19);
                      heapClassInst.heap32[(g0 + 6)] = Int32(r14);
                      _ZN15btTransformUtil18integrateTransformERK11btTransformRK9btVector3S5_fRS0_(i7);
                      r15 = Int64(heapClassInst.heap32[(r13 + 42)]);
                      if (!(r15 == 0)) 
                      {
                        r16 = r15 >> 2;
                        r16 = Int64(heapClassInst.heap32[(r16)]);
                        r16 = r16 >> 2;
                        r16 = Int64(heapClassInst.heap32[(r16 + 5)]);
                        r17 = sp + (-64);
                        r19 = r17 >> 2;
                        heapClassInst.heap32[(fp + (-16))] = 1065353216;
                        heapClassInst.heap32[(r19 + 1)] = 0;
                        heapClassInst.heap32[(r19 + 2)] = 0;
                        heapClassInst.heap32[(r19 + 3)] = 0;
                        heapClassInst.heap32[(g0)] = Int32(r15);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r11);
                        heapClassInst.heap32[(g0 + 2)] = 1045220557;
                        heapClassInst.heap32[(g0 + 3)] = Int32(r17);
                        __FUNCTION_TABLE__[(r16) >> 2](i7);
                      }
                      r15 = Int64(heapClassInst.heap32[(r13)]);
                      r15 = r15 >> 2;
                      r15 = Int64(heapClassInst.heap32[(r15)]);
                      heapClassInst.heap32[(g0)] = Int32(r1);
                      heapClassInst.heapFloat[(g0 + 1)] = Float32(f19);
                      r16 = sp + (-568);
                      __FUNCTION_TABLE__[(r15) >> 2](i7);
                      r15 = r16 >> 2;
                      heapClassInst.heap32[(fp + (-142))] = Int32(r9);
                      r17 = 0;
                      heapClassInst.heap32[(r15 + 9)] = 1566444395;
                      heapClassInst.heap8[sp + (-528)] = Int8(r17);
                      r19 = Int64(heapClassInst.heap32[(r0 + 4)]);
                      r20 = Int64(heapClassInst.heap32[(r0 + 3)]);
                      r21 = Int64(heapClassInst.heap32[(r0 + 1)]);
                      r22 = Int64(heapClassInst.heap32[(r0 + 2)]);
                      r23 = sp + (-648);
                      heapClassInst.heap32[(fp + (-162))] = Int32(r18);
                      r24 = r23 >> 2;
                      heapClassInst.heap32[(r24 + 1)] = 0;
                      heapClassInst.heap32[(r24 + 2)] = 1065353216;
                      heapClassInst.heap32[(r24 + 3)] = 0;
                      heapClassInst.heap32[(r24 + 4)] = 0;
                      heapClassInst.heap32[(r24 + 5)] = Int32(r22);
                      heapClassInst.heap32[(r24 + 6)] = Int32(r21);
                      heapClassInst.heap32[(r24 + 7)] = Int32(r20);
                      r21 = r20 >> 2;
                      heapClassInst.heap32[(r24 + 8)] = Int32(r19);
                      r22 = Int64(heapClassInst.heap32[(r21 + 1)]);
                      heapClassInst.heap32[(r24 + 9)] = Int32(r22);
                      r22 = r19 >> 2;
                      r25 = Int64(heapClassInst.heap32[(r22 + 1)]);
                      heapClassInst.heap32[(r24 + 10)] = Int32(r25);
                      r21 = Int64(heapClassInst.heap32[(r21)]);
                      r21 = r21 >> 2;
                      r21 = Int64(heapClassInst.heap32[(r21 + 11)]);
                      heapClassInst.heap32[(g0)] = Int32(r20);
                      __FUNCTION_TABLE__[(r21) >> 2](i7);
                      heapClassInst.heapFloat[(r24 + 11)] = Float32(commonVariable.f_g0);
                      r20 = Int64(heapClassInst.heap32[(r22)]);
                      r20 = r20 >> 2;
                      r20 = Int64(heapClassInst.heap32[(r20 + 11)]);
                      heapClassInst.heap32[(g0)] = Int32(r19);
                      __FUNCTION_TABLE__[(r20) >> 2](i7);
                      heapClassInst.heapFloat[(r24 + 12)] = Float32(commonVariable.f_g0);
                      heapClassInst.heap8[sp + (-596)] = Int8(r17);
                      r19 = sp + (-784);
                      heapClassInst.heap32[(r24 + 15)] = ( -1);
                      r20 = r19 >> 2;
                      heapClassInst.heap32[(r24 + 18)] = 1;
                      heapClassInst.heap32[(r20 + 32)] = 1566444395;
                      heapClassInst.heap32[(r20 + 33)] = 0;
                      r21 = r12 >> 2;
                      heapClassInst.heap32[(fp + (-196))] = heapClassInst.heap32[(fp + (-114))];
                      heapClassInst.heap32[(r20 + 1)] = heapClassInst.heap32[(r21 + 1)];
                      heapClassInst.heap32[(r20 + 2)] = heapClassInst.heap32[(r21 + 2)];
                      heapClassInst.heap32[(r20 + 3)] = heapClassInst.heap32[(r21 + 3)];
                      heapClassInst.heap32[(r20 + 4)] = heapClassInst.heap32[(r21 + 4)];
                      heapClassInst.heap32[(r20 + 5)] = heapClassInst.heap32[(r21 + 5)];
                      heapClassInst.heap32[(r20 + 6)] = heapClassInst.heap32[(r21 + 6)];
                      heapClassInst.heap32[(r20 + 7)] = heapClassInst.heap32[(r21 + 7)];
                      heapClassInst.heap32[(r20 + 8)] = heapClassInst.heap32[(r21 + 8)];
                      heapClassInst.heap32[(r20 + 9)] = heapClassInst.heap32[(r21 + 9)];
                      heapClassInst.heap32[(r20 + 10)] = heapClassInst.heap32[(r21 + 10)];
                      heapClassInst.heap32[(r20 + 11)] = heapClassInst.heap32[(r21 + 11)];
                      heapClassInst.heap32[(r20 + 12)] = heapClassInst.heap32[(r21 + 12)];
                      heapClassInst.heap32[(r20 + 13)] = heapClassInst.heap32[(r21 + 13)];
                      heapClassInst.heap32[(r20 + 14)] = heapClassInst.heap32[(r21 + 14)];
                      heapClassInst.heap32[(r20 + 15)] = heapClassInst.heap32[(r21 + 15)];
                      r14 = r14 >> 2;
                      heapClassInst.heap32[(r20 + 16)] = heapClassInst.heap32[(fp + (-130))];
                      heapClassInst.heap32[(r20 + 17)] = heapClassInst.heap32[(r14 + 1)];
                      heapClassInst.heap32[(r20 + 18)] = heapClassInst.heap32[(r14 + 2)];
                      heapClassInst.heap32[(r20 + 19)] = heapClassInst.heap32[(r14 + 3)];
                      heapClassInst.heap32[(r20 + 20)] = heapClassInst.heap32[(r14 + 4)];
                      heapClassInst.heap32[(r20 + 21)] = heapClassInst.heap32[(r14 + 5)];
                      heapClassInst.heap32[(r20 + 22)] = heapClassInst.heap32[(r14 + 6)];
                      heapClassInst.heap32[(r20 + 23)] = heapClassInst.heap32[(r14 + 7)];
                      heapClassInst.heap32[(r20 + 24)] = heapClassInst.heap32[(r14 + 8)];
                      heapClassInst.heap32[(r20 + 25)] = heapClassInst.heap32[(r14 + 9)];
                      heapClassInst.heap32[(r20 + 26)] = heapClassInst.heap32[(r14 + 10)];
                      heapClassInst.heap32[(r20 + 27)] = heapClassInst.heap32[(r14 + 11)];
                      heapClassInst.heap32[(r20 + 28)] = heapClassInst.heap32[(r14 + 12)];
                      heapClassInst.heap32[(r20 + 29)] = heapClassInst.heap32[(r14 + 13)];
                      heapClassInst.heap32[(r20 + 30)] = heapClassInst.heap32[(r14 + 14)];
                      heapClassInst.heap32[(r20 + 31)] = heapClassInst.heap32[(r14 + 15)];
                      heapClassInst.heap32[(g0)] = Int32(r23);
                      heapClassInst.heap32[(g0 + 1)] = Int32(r19);
                      heapClassInst.heap32[(g0 + 2)] = Int32(r16);
                      heapClassInst.heap32[(g0 + 3)] = 0;
                      heapClassInst.heap32[(g0 + 4)] = 0;
                      _ZN17btGjkPairDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb(i7);
                      r14 = Int64(heapClassInst.heapU8[sp + (-528)]);
                      if (r14 != 0) 
                      {
                        f20 = Float64(heapClassInst.heapFloat[(r15 + 9)]);
                        if (f20 >= f6) 
                        {
                          f6 = Float64(heapClassInst.heapFloat[(r15 + 5)]);
                          heapClassInst.heapFloat[(fp + (-32))] = Float32(f6);
                          f10 = Float64(heapClassInst.heapFloat[(r15 + 6)]);
                          heapClassInst.heapFloat[(r10 + 1)] = Float32(f10);
                          f13 = Float64(heapClassInst.heapFloat[(r15 + 7)]);
                          heapClassInst.heapFloat[(r10 + 2)] = Float32(f13);
                          f14 = Float64(heapClassInst.heapFloat[(r15 + 8)]);
                          heapClassInst.heapFloat[(r10 + 3)] = Float32(f14);
                          f15 = Float64(heapClassInst.heapFloat[(r15 + 1)]);
                          f16 = Float64(heapClassInst.heapFloat[(r15 + 2)]);
                          f17 = Float64(heapClassInst.heapFloat[(r15 + 3)]);
                          f21 = Float64(heapClassInst.heapFloat[(r15 + 4)]);
                          heapClassInst.heap32[(fp + (-142))] = Int32(r9);
                          f9 = f19;
                        }
                        else {
                          __label__ = 14;
                          break 
                        }
                      }
                      else {
                        __label__ = 15;
                        break 
                      }
                    }
                  }
                }
              }
            }
          }
          else {
            __label__ = 18;
            break 
          }
        }
        match (__label__) {
          case 18 =>
            r0 = r1 >> 2;
            f0 = f18 + f1;
            f1 = Float64(heapClassInst.heapFloat[(r0 + 43)]);
            if (f0 <= f1) 
            {
              println("break 2098")
            }
            else {
              heapClassInst.heapFloat[(r0 + 41)] = Float32(f9);
              heapClassInst.heapFloat[(r0 + 33)] = Float32(f15);
              heapClassInst.heapFloat[(r0 + 34)] = Float32(f16);
              heapClassInst.heapFloat[(r0 + 35)] = Float32(f17);
              heapClassInst.heapFloat[(r0 + 36)] = Float32(f21);
              heapClassInst.heapFloat[(r0 + 37)] = Float32(f6);
              heapClassInst.heapFloat[(r0 + 38)] = Float32(f10);
              heapClassInst.heapFloat[(r0 + 39)] = Float32(f13);
              heapClassInst.heapFloat[(r0 + 40)] = Float32(f14);
              r0 = 1;
              commonVariable.r_g0 = r0;
              return;
            }
          case 14 =>
            heapClassInst.heapFloat[(r13 + 41)] = Float32(f19);
            f0 = Float64(heapClassInst.heapFloat[(r15 + 4)]);
            f1 = Float64(heapClassInst.heapFloat[(r15 + 3)]);
            f2 = Float64(heapClassInst.heapFloat[(r15 + 2)]);
            heapClassInst.heap32[(r13 + 33)] = heapClassInst.heap32[(r15 + 1)];
            heapClassInst.heapFloat[(r13 + 34)] = Float32(f2);
            heapClassInst.heapFloat[(r13 + 35)] = Float32(f1);
            heapClassInst.heapFloat[(r13 + 36)] = Float32(f0);
            heapClassInst.heap32[(r13 + 37)] = heapClassInst.heap32[(r15 + 5)];
            heapClassInst.heap32[(r13 + 38)] = heapClassInst.heap32[(r15 + 6)];
            heapClassInst.heap32[(r13 + 39)] = heapClassInst.heap32[(r15 + 7)];
            heapClassInst.heap32[(r13 + 40)] = heapClassInst.heap32[(r15 + 8)];
            r17 = r4;
          case _ =>
            println("break 2129");
        }
        heapClassInst.heap32[(fp + (-142))] = Int32(r9);
        r0 = r17 & 255;
        commonVariable.r_g0 = r0;
        return;
      }
    }
  } while (false);
  r0 = 0;
  commonVariable.r_g0 = r0;
  return;
}

@OverflowWrapping
func _ZN15btTransformUtil18integrateTransformERK11btTransformRK9btVector3S5_fRS0_(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
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
  i7 = sp + (-32); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(fp + 5)]);
  f1 = Float64(heapClassInst.heapFloat[(fp + 1)]);
  r2 = Int64(heapClassInst.heap32[(fp + 6)]);
  f2 = Float64(heapClassInst.heapFloat[(fp + 2)]);
  f1 = f1 * f0;
  f3 = Float64(heapClassInst.heapFloat[(r1 + 12)]);
  f4 = Float64(heapClassInst.heapFloat[(r1 + 14)]);
  f5 = Float64(heapClassInst.heapFloat[(r1 + 13)]);
  f6 = Float64(heapClassInst.heapFloat[(fp + 3)]);
  f2 = f2 * f0;
  r1 = r2 >> 2;
  f1 = f3 + f1;
  f3 = f6 * f0;
  f2 = f5 + f2;
  heapClassInst.heapFloat[(r1 + 12)] = Float32(f1);
  f1 = f4 + f3;
  heapClassInst.heapFloat[(r1 + 13)] = Float32(f2);
  r2 = Int64(heapClassInst.heap32[(fp + 4)]);
  heapClassInst.heapFloat[(r1 + 14)] = Float32(f1);
  r2 = r2 >> 2;
  heapClassInst.heap32[(r1 + 15)] = 0;
  f1 = Float64(heapClassInst.heapFloat[(r2)]);
  f2 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
  f3 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
  f1 = f1 * f1;
  f2 = f2 * f2;
  f1 = f1 + f2;
  f2 = f3 * f3;
  f1 = f1 + f2;
  heapClassInst.heapFloat[(g0)] = Float32(f1);
  sqrtf(i7);
  f1 = commonVariable.f_g0;
  f2 = f1 * f0;
  f3 = 0.78539818525314331;
  if (f2 > f3) 
  {
    f1 = f3 / f0;
  }
  f2 = 0.0010000000474974513;
  if (f1 >= f2) 
  {
    f2 = 0.5;
    f2 = f1 * f2;
    f2 = f2 * f0;
    heapClassInst.heapFloat[(g0)] = Float32(f2);
    sinf(i7);
    f3 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
    f2 = commonVariable.f_g0 / f1;
    f5 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
    f6 = Float64(heapClassInst.heapFloat[(r2)]);
    f4 = f3 * f2;
    f3 = f5 * f2;
    f2 = f6 * f2;
  }
  else {
    f2 = f0 * f0;
    f2 = f2 * f0;
    f3 = -0.02083333395421505;
    f2 = f2 * f3;
    f3 = 0.5;
    f2 = f2 * f1;
    f3 = f0 * f3;
    f2 = f2 * f1;
    f4 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
    f2 = f3 + f2;
    f3 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
    f5 = Float64(heapClassInst.heapFloat[(r2)]);
    f4 = f4 * f2;
    f3 = f3 * f2;
    f2 = f5 * f2;
  }
  f0 = f1 * f0;
  f1 = 0.5;
  f0 = f0 * f1;
  heapClassInst.heapFloat[(g0)] = Float32(f0);
  cosf(i7);
  f0 = commonVariable.f_g0;
  r2 = sp + (-16);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  _ZNK11btMatrix3x311getRotationER12btQuaternion(i7);
  r0 = r2 >> 2;
  f1 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
  f5 = Float64(heapClassInst.heapFloat[(r0 + 3)]);
  f6 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f7 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f8 = f0 * f6;
  f9 = f3 * f5;
  f10 = f0 * f1;
  f11 = f2 * f5;
  f12 = f0 * f7;
  f13 = f4 * f5;
  f8 = f8 + f9;
  f9 = f4 * f1;
  f10 = f10 + f11;
  f11 = f3 * f7;
  f0 = f0 * f5;
  f5 = f2 * f1;
  f12 = f12 + f13;
  f13 = f2 * f6;
  f8 = f8 + f9;
  f2 = f2 * f7;
  f9 = f10 + f11;
  f10 = f4 * f6;
  f2 = f8 - f2;
  f8 = f9 - f10;
  f0 = f0 - f5;
  f5 = f3 * f6;
  f6 = f12 + f13;
  f1 = f3 * f1;
  f1 = f6 - f1;
  f3 = f8 * f8;
  f6 = f2 * f2;
  f0 = f0 - f5;
  f4 = f4 * f7;
  f0 = f0 - f4;
  f3 = f3 + f6;
  f4 = f1 * f1;
  f3 = f3 + f4;
  f4 = f0 * f0;
  f3 = f3 + f4;
  heapClassInst.heapFloat[(g0)] = Float32(f3);
  sqrtf(i7);
  f3 = commonVariable.f_g0;
  f4 = 0.0;
  if (f3 != f4) 
  {
    f4 = 1.0;
    f3 = f4 / f3;
    f5 = f8 * f3;
    f2 = f2 * f3;
    f1 = f1 * f3;
    f6 = f5 * f5;
    f7 = f2 * f2;
    f0 = f0 * f3;
    f3 = f6 + f7;
    f6 = f1 * f1;
    f3 = f3 + f6;
    f6 = f0 * f0;
    f7 = 2.0;
    f3 = f3 + f6;
    f3 = f7 / f3;
    f6 = f1 * f3;
    f7 = f2 * f3;
    f8 = f2 * f7;
    f1 = f1 * f6;
    f9 = f8 + f1;
    f9 = f4 - f9;
    f10 = f5 * f7;
    f11 = f0 * f6;
    f12 = f5 * f6;
    f7 = f0 * f7;
    f13 = f10 - f11;
    heapClassInst.heapFloat[(r1)] = Float32(f9);
    f3 = f5 * f3;
    f9 = f12 + f7;
    heapClassInst.heapFloat[(r1 + 1)] = Float32(f13);
    f5 = f5 * f3;
    heapClassInst.heapFloat[(r1 + 2)] = Float32(f9);
    f1 = f5 + f1;
    f9 = f10 + f11;
    heapClassInst.heap32[(r1 + 3)] = 0;
    f2 = f2 * f6;
    f0 = f0 * f3;
    f1 = f4 - f1;
    heapClassInst.heapFloat[(r1 + 4)] = Float32(f9);
    f3 = f2 - f0;
    heapClassInst.heapFloat[(r1 + 5)] = Float32(f1);
    heapClassInst.heapFloat[(r1 + 6)] = Float32(f3);
    f1 = f12 - f7;
    heapClassInst.heap32[(r1 + 7)] = 0;
    f3 = f5 + f8;
    f0 = f2 + f0;
    heapClassInst.heapFloat[(r1 + 8)] = Float32(f1);
    f1 = f4 - f3;
    heapClassInst.heapFloat[(r1 + 9)] = Float32(f0);
    heapClassInst.heapFloat[(r1 + 10)] = Float32(f1);
    heapClassInst.heap32[(r1 + 11)] = 0;
    return;
  }
  else {
    r1 = _E2_str584;
    r0 = _E2_str685;
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    heapClassInst.heap32[(g0 + 2)] = 188;
    _assert(i7);
  }
}

@OverflowWrapping
func _ZN12btConvexCastD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV12btConvexCast;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

@OverflowWrapping
func _ZN12btConvexCastD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV12btConvexCast;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

@OverflowWrapping
func _ZN15btGjkConvexCastD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV12btConvexCast;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

@OverflowWrapping
func _ZN15btGjkConvexCastD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV12btConvexCast;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

@OverflowWrapping
func _ZN15btGjkConvexCast16calcTimeOfImpactERK11btTransformS2_S2_S2_RN12btConvexCast10CastResultE(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  var __label__ = 0;
  i7 = sp + (-288); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r2 = 0;
  r3 = r1 >> 2;
  heapClassInst.heap8[r1 + 312] = Int8(r2);
  r4 = 1;
  heapClassInst.heap32[(r3)] = 0;
  heapClassInst.heap8[r1 + 356] = Int8(r4);
  heapClassInst.heap32[(r3 + 73)] = 1566444395;
  heapClassInst.heap32[(r3 + 74)] = 1566444395;
  heapClassInst.heap32[(r3 + 75)] = 1566444395;
  heapClassInst.heap32[(r3 + 76)] = 0;
  heapClassInst.heap8[r1 + 352] = Int8(r2);
  heapClassInst.heap32[(r3 + 84)] = 0;
  heapClassInst.heap32[(r3 + 85)] = 0;
  heapClassInst.heap32[(r3 + 86)] = 0;
  heapClassInst.heap32[(r3 + 87)] = 0;
  r3 = Int64(heapClassInst.heapU8[r1 + 332]);
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  r5 = Int64(heapClassInst.heap32[(fp + 1)]);
  r6 = Int64(heapClassInst.heap32[(fp + 4)]);
  r7 = Int64(heapClassInst.heap32[(fp + 3)]);
  r3 = r3 & 240;
  r4 = r4 >> 2;
  heapClassInst.heap8[r1 + 332] = Int8(r3);
  r1 = r5 >> 2;
  r3 = r6 >> 2;
  r5 = r7 >> 2;
  r6 = _ZTV16btPointCollector;
  f0 = Float64(heapClassInst.heapFloat[(r4 + 14)]);
  f1 = Float64(heapClassInst.heapFloat[(r1 + 14)]);
  f2 = Float64(heapClassInst.heapFloat[(r3 + 14)]);
  f3 = Float64(heapClassInst.heapFloat[(r5 + 14)]);
  f4 = Float64(heapClassInst.heapFloat[(r4 + 13)]);
  f5 = Float64(heapClassInst.heapFloat[(r1 + 13)]);
  f6 = Float64(heapClassInst.heapFloat[(r3 + 13)]);
  f7 = Float64(heapClassInst.heapFloat[(r5 + 13)]);
  f8 = Float64(heapClassInst.heapFloat[(r4 + 12)]);
  f9 = Float64(heapClassInst.heapFloat[(r1 + 12)]);
  f10 = Float64(heapClassInst.heapFloat[(r3 + 12)]);
  f11 = Float64(heapClassInst.heapFloat[(r5 + 12)]);
  r7 = sp + (-48);
  r6 = (r6 + 8) | 0;
  r8 = r7 >> 2;
  heapClassInst.heap32[(fp + (-12))] = Int32(r6);
  heapClassInst.heap32[(r8 + 9)] = 1566444395;
  heapClassInst.heap8[sp + (-8)] = Int8(r2);
  r6 = Int64(heapClassInst.heap32[(r0 + 3)]);
  r9 = Int64(heapClassInst.heap32[(r0 + 2)]);
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r10 = _ZTV17btGjkPairDetector;
  r11 = sp + (-128);
  r10 = (r10 + 8) | 0;
  heapClassInst.heap32[(fp + (-32))] = Int32(r10);
  r10 = r11 >> 2;
  heapClassInst.heap32[(r10 + 1)] = 0;
  heapClassInst.heap32[(r10 + 2)] = 1065353216;
  heapClassInst.heap32[(r10 + 3)] = 0;
  heapClassInst.heap32[(r10 + 4)] = 0;
  heapClassInst.heap32[(r10 + 5)] = 0;
  heapClassInst.heap32[(r10 + 6)] = Int32(r0);
  heapClassInst.heap32[(r10 + 7)] = Int32(r9);
  r0 = r9 >> 2;
  heapClassInst.heap32[(r10 + 8)] = Int32(r6);
  r12 = Int64(heapClassInst.heap32[(r0 + 1)]);
  heapClassInst.heap32[(r10 + 9)] = Int32(r12);
  r12 = r6 >> 2;
  r13 = Int64(heapClassInst.heap32[(r12 + 1)]);
  heapClassInst.heap32[(r10 + 10)] = Int32(r13);
  r0 = Int64(heapClassInst.heap32[(r0)]);
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r9);
  __FUNCTION_TABLE__[(r0) >> 2](i7);
  heapClassInst.heapFloat[(r10 + 11)] = Float32(commonVariable.f_g0);
  r0 = Int64(heapClassInst.heap32[(r12)]);
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r6);
  __FUNCTION_TABLE__[(r0) >> 2](i7);
  heapClassInst.heapFloat[(r10 + 12)] = Float32(commonVariable.f_g0);
  heapClassInst.heap8[sp + (-76)] = Int8(r2);
  r0 = sp + (-264);
  heapClassInst.heap32[(r10 + 15)] = ( -1);
  r6 = r0 >> 2;
  heapClassInst.heap32[(r10 + 18)] = 1;
  heapClassInst.heap32[(r6 + 32)] = 1566444395;
  heapClassInst.heap32[(r6 + 33)] = 0;
  heapClassInst.heap32[(fp + (-66))] = heapClassInst.heap32[(r1)];
  heapClassInst.heap32[(r6 + 1)] = heapClassInst.heap32[(r1 + 1)];
  heapClassInst.heap32[(r6 + 2)] = heapClassInst.heap32[(r1 + 2)];
  heapClassInst.heap32[(r6 + 3)] = heapClassInst.heap32[(r1 + 3)];
  heapClassInst.heap32[(r6 + 4)] = heapClassInst.heap32[(r1 + 4)];
  heapClassInst.heap32[(r6 + 5)] = heapClassInst.heap32[(r1 + 5)];
  heapClassInst.heap32[(r6 + 6)] = heapClassInst.heap32[(r1 + 6)];
  heapClassInst.heap32[(r6 + 7)] = heapClassInst.heap32[(r1 + 7)];
  heapClassInst.heap32[(r6 + 8)] = heapClassInst.heap32[(r1 + 8)];
  heapClassInst.heap32[(r6 + 9)] = heapClassInst.heap32[(r1 + 9)];
  heapClassInst.heap32[(r6 + 10)] = heapClassInst.heap32[(r1 + 10)];
  heapClassInst.heap32[(r6 + 11)] = heapClassInst.heap32[(r1 + 11)];
  heapClassInst.heap32[(r6 + 12)] = heapClassInst.heap32[(r1 + 12)];
  heapClassInst.heap32[(r6 + 13)] = heapClassInst.heap32[(r1 + 13)];
  heapClassInst.heap32[(r6 + 14)] = heapClassInst.heap32[(r1 + 14)];
  heapClassInst.heap32[(r6 + 15)] = heapClassInst.heap32[(r1 + 15)];
  heapClassInst.heap32[(r6 + 16)] = heapClassInst.heap32[(r5)];
  heapClassInst.heap32[(r6 + 17)] = heapClassInst.heap32[(r5 + 1)];
  heapClassInst.heap32[(r6 + 18)] = heapClassInst.heap32[(r5 + 2)];
  heapClassInst.heap32[(r6 + 19)] = heapClassInst.heap32[(r5 + 3)];
  heapClassInst.heap32[(r6 + 20)] = heapClassInst.heap32[(r5 + 4)];
  heapClassInst.heap32[(r6 + 21)] = heapClassInst.heap32[(r5 + 5)];
  heapClassInst.heap32[(r6 + 22)] = heapClassInst.heap32[(r5 + 6)];
  heapClassInst.heap32[(r6 + 23)] = heapClassInst.heap32[(r5 + 7)];
  heapClassInst.heap32[(r6 + 24)] = heapClassInst.heap32[(r5 + 8)];
  heapClassInst.heap32[(r6 + 25)] = heapClassInst.heap32[(r5 + 9)];
  heapClassInst.heap32[(r6 + 26)] = heapClassInst.heap32[(r5 + 10)];
  heapClassInst.heap32[(r6 + 27)] = heapClassInst.heap32[(r5 + 11)];
  heapClassInst.heap32[(r6 + 28)] = heapClassInst.heap32[(r5 + 12)];
  heapClassInst.heap32[(r6 + 29)] = heapClassInst.heap32[(r5 + 13)];
  heapClassInst.heap32[(r6 + 30)] = heapClassInst.heap32[(r5 + 14)];
  heapClassInst.heap32[(r6 + 31)] = heapClassInst.heap32[(r5 + 15)];
  heapClassInst.heap32[(g0)] = Int32(r11);
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  heapClassInst.heap32[(g0 + 2)] = Int32(r7);
  heapClassInst.heap32[(g0 + 3)] = 0;
  heapClassInst.heap32[(g0 + 4)] = 0;
  _ZN17btGjkPairDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb(i7);
  r9 = Int64(heapClassInst.heapU8[sp + (-8)]);
  do {
    if (!(r9 == 0)) 
    {
      f0 = f0 - f1;
      f1 = f2 - f3;
      f2 = f4 - f5;
      f3 = f6 - f7;
      f4 = f8 - f9;
      f5 = f10 - f11;
      r9 = Int64(heapClassInst.heap32[(fp + 5)]);
      f0 = f0 - f1;
      f1 = f2 - f3;
      f2 = f4 - f5;
      f3 = Float64(heapClassInst.heapFloat[(r8 + 8)]);
      f4 = Float64(heapClassInst.heapFloat[(r8 + 7)]);
      f5 = Float64(heapClassInst.heapFloat[(r8 + 6)]);
      f6 = Float64(heapClassInst.heapFloat[(r8 + 5)]);
      f7 = Float64(heapClassInst.heapFloat[(r8 + 9)]);
      f8 = Float64(heapClassInst.heapFloat[(r8 + 1)]);
      f9 = Float64(heapClassInst.heapFloat[(r8 + 2)]);
      f10 = Float64(heapClassInst.heapFloat[(r8 + 3)]);
      f11 = Float64(heapClassInst.heapFloat[(r8 + 4)]);
      f12 = 0.0;
      while (true) {
        f13 = 0.0010000000474974513;
        if (f7 > f13) 
        {
          r2 = (r2 + 1) | 0;
          if (r2 > 32) 
          {
            break 
          }
          else {
            f3 = f2 * f8;
            f4 = f1 * f9;
            f3 = f3 + f4;
            f4 = f0 * f10;
            f3 = f3 + f4;
            f3 = f7 / f3;
            f13 = f12 - f3;
            f3 = 0.0;
            if (f13 < f3) 
            {
              break 
            }
            else {
              f4 = 1.0;
              if (f13 > f4) 
              {
                break 
              }
              else {
                if (f13 <= f12) 
                {
                  break 
                }
                else {
                  r10 = r9 >> 2;
                  r12 = Int64(heapClassInst.heap32[(r10)]);
                  r12 = r12 >> 2;
                  r12 = Int64(heapClassInst.heap32[(r12)]);
                  heapClassInst.heap32[(g0)] = Int32(r9);
                  heapClassInst.heapFloat[(g0 + 1)] = Float32(f13);
                  __FUNCTION_TABLE__[(r12) >> 2](i7);
                  f5 = Float64(heapClassInst.heapFloat[(r4 + 12)]);
                  f6 = Float64(heapClassInst.heapFloat[(r1 + 12)]);
                  f4 = f4 - f13;
                  f6 = f6 * f4;
                  f5 = f5 * f13;
                  f5 = f6 + f5;
                  heapClassInst.heapFloat[(r6 + 12)] = Float32(f5);
                  f5 = Float64(heapClassInst.heapFloat[(r1 + 13)]);
                  f6 = Float64(heapClassInst.heapFloat[(r4 + 13)]);
                  f5 = f5 * f4;
                  f6 = f6 * f13;
                  f5 = f5 + f6;
                  heapClassInst.heapFloat[(r6 + 13)] = Float32(f5);
                  f5 = Float64(heapClassInst.heapFloat[(r1 + 14)]);
                  f6 = Float64(heapClassInst.heapFloat[(r4 + 14)]);
                  f5 = f5 * f4;
                  f6 = f6 * f13;
                  f5 = f5 + f6;
                  heapClassInst.heapFloat[(r6 + 14)] = Float32(f5);
                  f5 = Float64(heapClassInst.heapFloat[(r5 + 12)]);
                  f6 = Float64(heapClassInst.heapFloat[(r3 + 12)]);
                  f5 = f5 * f4;
                  f6 = f6 * f13;
                  f5 = f5 + f6;
                  heapClassInst.heapFloat[(r6 + 28)] = Float32(f5);
                  f5 = Float64(heapClassInst.heapFloat[(r5 + 13)]);
                  f6 = Float64(heapClassInst.heapFloat[(r3 + 13)]);
                  f5 = f5 * f4;
                  f6 = f6 * f13;
                  f5 = f5 + f6;
                  heapClassInst.heapFloat[(r6 + 29)] = Float32(f5);
                  f5 = Float64(heapClassInst.heapFloat[(r5 + 14)]);
                  f6 = Float64(heapClassInst.heapFloat[(r3 + 14)]);
                  f4 = f5 * f4;
                  f5 = f6 * f13;
                  f4 = f4 + f5;
                  heapClassInst.heapFloat[(r6 + 30)] = Float32(f4);
                  heapClassInst.heap32[(g0)] = Int32(r11);
                  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
                  heapClassInst.heap32[(g0 + 2)] = Int32(r7);
                  heapClassInst.heap32[(g0 + 3)] = 0;
                  heapClassInst.heap32[(g0 + 4)] = 0;
                  _ZN17btGjkPairDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb(i7);
                  r12 = Int64(heapClassInst.heapU8[sp + (-8)]);
                  if (r12 == 0) 
                  {
                    break 
                  }
                  else {
                    f7 = Float64(heapClassInst.heapFloat[(r8 + 9)]);
                    if (f7 >= f3) 
                    {
                      f6 = Float64(heapClassInst.heapFloat[(r8 + 5)]);
                      f5 = Float64(heapClassInst.heapFloat[(r8 + 6)]);
                      f4 = Float64(heapClassInst.heapFloat[(r8 + 7)]);
                      f3 = Float64(heapClassInst.heapFloat[(r8 + 8)]);
                      f8 = Float64(heapClassInst.heapFloat[(r8 + 1)]);
                      f9 = Float64(heapClassInst.heapFloat[(r8 + 2)]);
                      f10 = Float64(heapClassInst.heapFloat[(r8 + 3)]);
                      f11 = Float64(heapClassInst.heapFloat[(r8 + 4)]);
                      f12 = f13;
                    }
                    else {
                      __label__ = 8;
                      break 
                    }
                  }
                }
              }
            }
          }
        }
        else {
          __label__ = 11;
          break 
        }
      }
      match (__label__) {
        case 11 =>
          r0 = r9 >> 2;
          f2 = f8 * f2;
          f1 = f9 * f1;
          f7 = Float64(heapClassInst.heapFloat[(r0 + 43)]);
          f1 = f2 + f1;
          f0 = f10 * f0;
          f0 = f1 + f0;
          f1 = -f7;
          if (f0 >= f1) 
          {
            println("break 2749") 
          }
          else {
            heapClassInst.heapFloat[(r0 + 41)] = Float32(f12);
            heapClassInst.heapFloat[(r0 + 33)] = Float32(f8);
            heapClassInst.heapFloat[(r0 + 34)] = Float32(f9);
            heapClassInst.heapFloat[(r0 + 35)] = Float32(f10);
            heapClassInst.heapFloat[(r0 + 36)] = Float32(f11);
            heapClassInst.heapFloat[(r0 + 37)] = Float32(f6);
            heapClassInst.heapFloat[(r0 + 38)] = Float32(f5);
            heapClassInst.heapFloat[(r0 + 39)] = Float32(f4);
            heapClassInst.heapFloat[(r0 + 40)] = Float32(f3);
          }
        case 8 =>
          heapClassInst.heapFloat[(r10 + 41)] = Float32(f13);
          f0 = Float64(heapClassInst.heapFloat[(r8 + 4)]);
          f1 = Float64(heapClassInst.heapFloat[(r8 + 3)]);
          f2 = Float64(heapClassInst.heapFloat[(r8 + 2)]);
          heapClassInst.heap32[(r10 + 33)] = heapClassInst.heap32[(r8 + 1)];
          heapClassInst.heapFloat[(r10 + 34)] = Float32(f2);
          heapClassInst.heapFloat[(r10 + 35)] = Float32(f1);
          heapClassInst.heapFloat[(r10 + 36)] = Float32(f0);
          heapClassInst.heap32[(r10 + 37)] = heapClassInst.heap32[(r8 + 5)];
          heapClassInst.heap32[(r10 + 38)] = heapClassInst.heap32[(r8 + 6)];
          heapClassInst.heap32[(r10 + 39)] = heapClassInst.heap32[(r8 + 7)];
          heapClassInst.heap32[(r10 + 40)] = heapClassInst.heap32[(r8 + 8)];
        case _ =>
          println("break 2776")
      }
      r0 = 1;
      commonVariable.r_g0 = r0;
      return;
    }
  } while (false);
  r0 = 0;
  commonVariable.r_g0 = r0;
  return;
}

@OverflowWrapping
func _ZN12gjkepa2_impl3GJK13projectoriginERK9btVector3S3_PfRj(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var f0: Float64 = 0.0
  var f1: Float64 = 0.0
  var f2: Float64 = 0.0
  var f3: Float64 = 0.0
  var f4: Float64 = 0.0
  var f5: Float64 = 0.0
  var f6: Float64 = 0.0
  var f7: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = r1 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f1 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f2 = Float64(heapClassInst.heapFloat[(r1)]);
  f3 = Float64(heapClassInst.heapFloat[(r0)]);
  f1 = f1 - f0;
  f3 = f3 - f2;
  f4 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f5 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f5 = f5 - f4;
  f6 = f3 * f3;
  f7 = f1 * f1;
  f6 = f6 + f7;
  f7 = f5 * f5;
  f6 = f6 + f7;
  f7 = 0.0;
  if (f6 <= f7) 
  {
    f0 = ( -1.0);
    commonVariable.f_g0 = f0;
    return;
  }
  else {
    r2 = Int64(heapClassInst.heap32[(fp + 2)]);
    r3 = Int64(heapClassInst.heap32[(fp + 3)]);
    f2 = f2 * f3;
    f0 = f0 * f1;
    f0 = f2 + f0;
    f2 = f4 * f5;
    f0 = f0 + f2;
    f0 = -f0;
    f0 = f0 / f6;
    f2 = 1.0
    if (f0 < f2) 
    {
      if (f0 > f7) 
      {
        r0 = r2 >> 2;
        f2 = f2 - f0;
        heapClassInst.heapFloat[(r0 + 1)] = Float32(f0);
        r2 = r3 >> 2;
        heapClassInst.heapFloat[(r0)] = Float32(f2);
        heapClassInst.heap32[(r2)] = 3;
        f2 = Float64(heapClassInst.heapFloat[(r1)]);
        f3 = f3 * f0;
        f4 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
        f1 = f1 * f0;
        f2 = f2 + f3;
        f1 = f4 + f1;
        f3 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
        f0 = f5 * f0;
        f0 = f3 + f0;
        f2 = f2 * f2;
        f1 = f1 * f1;
        f1 = f2 + f1;
        f0 = f0 * f0;
        f0 = f1 + f0;
        commonVariable.f_g0 = f0;
        return;
      }
      else {
        r2 = r2 >> 2;
        heapClassInst.heap32[(r2)] = 1065353216;
        r3 = r3 >> 2;
        heapClassInst.heap32[(r2 + 1)] = 0;
        heapClassInst.heap32[(r3)] = 1;
        f0 = Float64(heapClassInst.heapFloat[(r1)]);
        f1 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
        f2 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
      }
    }
    else {
      r1 = r2 >> 2;
      heapClassInst.heap32[(r1)] = 0;
      r2 = r3 >> 2;
      heapClassInst.heap32[(r1 + 1)] = 1065353216;
      heapClassInst.heap32[(r2)] = 2;
      f0 = Float64(heapClassInst.heapFloat[(r0)]);
      f1 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
      f2 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
    }
    f0 = f0 * f0;
    f1 = f1 * f1;
    f0 = f0 + f1;
    f1 = f2 * f2;
    f0 = f0 + f1;
    commonVariable.f_g0 = f0;
    return;
  }
}

@OverflowWrapping
func _ZN12gjkepa2_implL10InitializeEPK13btConvexShapeRK11btTransformS2_S5_RN15btGjkEpaSolver28sResultsERNS_13MinkowskiDiffEb(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
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
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 4)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(fp + 5)]);
  heapClassInst.heap32[(r0)] = 0;
  heapClassInst.heap32[(r0 + 1)] = 0;
  heapClassInst.heap32[(r0 + 2)] = 0;
  heapClassInst.heap32[(r0 + 3)] = 0;
  heapClassInst.heap32[(r0 + 4)] = 0;
  heapClassInst.heap32[(r0 + 5)] = 0;
  heapClassInst.heap32[(r0 + 6)] = 0;
  heapClassInst.heap32[(r0 + 7)] = 0;
  heapClassInst.heap32[(r0 + 8)] = 0;
  r0 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r2 = Int64(heapClassInst.heap32[(fp + 3)]);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(r0)] = Int32(r1);
  r1 = r2 >> 2;
  heapClassInst.heap32[(r0 + 1)] = Int32(r4);
  r2 = r3 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r2)]);
  f1 = Float64(heapClassInst.heapFloat[(r1)]);
  f2 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
  f3 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
  f4 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
  f5 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
  f6 = f1 * f0;
  f7 = f3 * f2;
  f8 = Float64(heapClassInst.heapFloat[(r2 + 8)]);
  f9 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
  f10 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f11 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
  f12 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f13 = Float64(heapClassInst.heapFloat[(r1 + 6)]);
  f14 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
  f15 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
  f16 = Float64(heapClassInst.heapFloat[(r1 + 10)]);
  f17 = Float64(heapClassInst.heapFloat[(r2 + 10)]);
  f18 = Float64(heapClassInst.heapFloat[(r2 + 9)]);
  f19 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
  f20 = f1 * f4;
  f21 = f3 * f5;
  f6 = f6 + f7;
  f7 = f9 * f8;
  f1 = f1 * f11;
  f3 = f3 * f14;
  f20 = f20 + f21;
  f21 = f9 * f18;
  f6 = f6 + f7;
  f1 = f1 + f3;
  f3 = f9 * f17;
  f7 = f20 + f21;
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f6);
  f6 = f12 * f0;
  f9 = f15 * f2;
  f1 = f1 + f3;
  heapClassInst.heapFloat[(r0 + 3)] = Float32(f7);
  heapClassInst.heapFloat[(r0 + 4)] = Float32(f1);
  f1 = f12 * f4;
  f3 = f15 * f5;
  f6 = f6 + f9;
  f7 = f19 * f8;
  f9 = f12 * f11;
  f12 = f15 * f14;
  f1 = f1 + f3;
  f3 = f19 * f18;
  f6 = f6 + f7;
  heapClassInst.heap32[(r0 + 5)] = 0;
  f7 = f9 + f12;
  f9 = f19 * f17;
  f1 = f1 + f3;
  heapClassInst.heapFloat[(r0 + 6)] = Float32(f6);
  f0 = f10 * f0;
  f2 = f13 * f2;
  f3 = f7 + f9;
  heapClassInst.heapFloat[(r0 + 7)] = Float32(f1);
  heapClassInst.heapFloat[(r0 + 8)] = Float32(f3);
  f1 = f10 * f4;
  f3 = f13 * f5;
  f0 = f0 + f2;
  f2 = f16 * f8;
  f4 = f10 * f11;
  f5 = f13 * f14;
  f1 = f1 + f3;
  f3 = f16 * f18;
  f0 = f0 + f2;
  heapClassInst.heap32[(r0 + 9)] = 0;
  f2 = f4 + f5;
  f4 = f16 * f17;
  f1 = f1 + f3;
  heapClassInst.heapFloat[(r0 + 10)] = Float32(f0);
  f0 = f2 + f4;
  heapClassInst.heapFloat[(r0 + 11)] = Float32(f1);
  heapClassInst.heapFloat[(r0 + 12)] = Float32(f0);
  heapClassInst.heap32[(r0 + 13)] = 0;
  f0 = Float64(heapClassInst.heapFloat[(r2)]);
  f1 = Float64(heapClassInst.heapFloat[(r1)]);
  f2 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
  f3 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
  f4 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f5 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
  f6 = f0 * f1;
  f7 = f2 * f3;
  f8 = Float64(heapClassInst.heapFloat[(r2 + 8)]);
  f9 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
  f10 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
  f11 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
  f12 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
  f13 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f14 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
  f15 = Float64(heapClassInst.heapFloat[(r1 + 6)]);
  f16 = Float64(heapClassInst.heapFloat[(r2 + 10)]);
  f17 = Float64(heapClassInst.heapFloat[(r1 + 10)]);
  f18 = Float64(heapClassInst.heapFloat[(r2 + 9)]);
  f19 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
  f20 = f0 * f4;
  f21 = f2 * f5;
  f6 = f6 + f7;
  f7 = f8 * f9;
  f22 = Float64(heapClassInst.heapFloat[(r1 + 14)]);
  f23 = Float64(heapClassInst.heapFloat[(r2 + 14)]);
  f24 = Float64(heapClassInst.heapFloat[(r1 + 13)]);
  f25 = Float64(heapClassInst.heapFloat[(r2 + 13)]);
  f26 = Float64(heapClassInst.heapFloat[(r1 + 12)]);
  f27 = Float64(heapClassInst.heapFloat[(r2 + 12)]);
  f28 = f0 * f13;
  f29 = f2 * f15;
  f20 = f20 + f21;
  f21 = f8 * f19;
  f6 = f6 + f7;
  f7 = f28 + f29;
  f28 = f8 * f17;
  f20 = f20 + f21;
  heapClassInst.heapFloat[(r0 + 14)] = Float32(f6);
  f6 = f12 * f1;
  f21 = f14 * f3;
  f7 = f7 + f28;
  heapClassInst.heapFloat[(r0 + 15)] = Float32(f20);
  heapClassInst.heapFloat[(r0 + 16)] = Float32(f7);
  f7 = f12 * f4;
  f20 = f14 * f5;
  f6 = f6 + f21;
  f21 = f18 * f9;
  f28 = f12 * f13;
  f29 = f14 * f15;
  f7 = f7 + f20;
  f20 = f18 * f19;
  f6 = f6 + f21;
  heapClassInst.heap32[(r0 + 17)] = 0;
  f21 = f28 + f29;
  f28 = f18 * f17;
  f7 = f7 + f20;
  heapClassInst.heapFloat[(r0 + 18)] = Float32(f6);
  f1 = f10 * f1;
  f3 = f11 * f3;
  f6 = f21 + f28;
  heapClassInst.heapFloat[(r0 + 19)] = Float32(f7);
  heapClassInst.heapFloat[(r0 + 20)] = Float32(f6);
  f4 = f10 * f4;
  f5 = f11 * f5;
  f1 = f1 + f3;
  f3 = f16 * f9;
  f6 = f10 * f13;
  f7 = f11 * f15;
  f4 = f4 + f5;
  f5 = f16 * f19;
  f1 = f1 + f3;
  heapClassInst.heap32[(r0 + 21)] = 0;
  f3 = f26 - f27;
  f9 = f24 - f25;
  f6 = f6 + f7;
  f7 = f16 * f17;
  f4 = f4 + f5;
  heapClassInst.heapFloat[(r0 + 22)] = Float32(f1);
  f1 = f22 - f23;
  f0 = f0 * f3;
  f2 = f2 * f9;
  f5 = f6 + f7;
  heapClassInst.heapFloat[(r0 + 23)] = Float32(f4);
  heapClassInst.heapFloat[(r0 + 24)] = Float32(f5);
  f4 = f12 * f3;
  f5 = f14 * f9;
  f0 = f0 + f2;
  f2 = f8 * f1;
  f3 = f10 * f3;
  f6 = f11 * f9;
  f4 = f4 + f5;
  f5 = f18 * f1;
  f0 = f0 + f2;
  heapClassInst.heap32[(r0 + 25)] = 0;
  f2 = f3 + f6;
  f1 = f16 * f1;
  f3 = f4 + f5;
  heapClassInst.heapFloat[(r0 + 26)] = Float32(f0);
  f0 = f2 + f1;
  heapClassInst.heapFloat[(r0 + 27)] = Float32(f3);
  heapClassInst.heapFloat[(r0 + 28)] = Float32(f0);
  heapClassInst.heap32[(r0 + 29)] = 0;
  r1 = Int64(heapClassInst.heap32[(fp + 6)]);
  if (r1 == 0) 
  {
    r1 = swrite_Index._ZNK13btConvexShape44localGetSupportVertexWithoutMarginNonVirtualERK9btVector3__index__;

  }
  else {
    r1 = swrite_Index._ZNK13btConvexShape31localGetSupportVertexNonVirtualERK9btVector3__index__;
  }
  heapClassInst.heap32[(r0 + 30)] = Int32(r1);
  heapClassInst.heap32[(r0 + 31)] = 0;
  return;
}

@OverflowWrapping
func _ZNK12gjkepa2_impl3GJK10getsupportERK9btVector3RNS0_3sSVE(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  var f8: Float64 = 0.0
  var f9: Float64 = 0.0
  var f10: Float64 = 0.0
  var f11: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-64);
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r0)]);
  f1 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f2 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f0 = f0 * f0;
  f1 = f1 * f1;
  f0 = f0 + f1;
  f1 = f2 * f2;
  f0 = f0 + f1;
  heapClassInst.heapFloat[(g0)] = Float32(f0);
  sqrtf(i7);
  f1 = 1.0
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  f0 = f1 / commonVariable.f_g0;
  f1 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f2 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f3 = Float64(heapClassInst.heapFloat[(r0)]);
  f3 = f3 * f0;
  r0 = r1 >> 2;
  f2 = f2 * f0;
  heapClassInst.heapFloat[(r0)] = Float32(f3);
  f0 = f1 * f0;
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f2);
  r2 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
  r2 = r2 >> 2;
  heapClassInst.heap32[(r0 + 3)] = 0;
  r3 = Int64(heapClassInst.heap32[(r2 + 30)]);
  f0 = -f0;
  f1 = -f2;
  f2 = -f3;
  r4 = Int64(heapClassInst.heap32[(r2 + 1)]);
  r5 = Int64(heapClassInst.heap32[(r2 + 31)]);
  r6 = r3 & 1;
  if (r6 != 0) 
  {
    r6 = (r4 + r5) | 0;
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6)]);
    r3 = (r6 + r3) | 0;
    r3 = (r3 + (-1)) | 0;
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
  }
  f3 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
  f4 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
  f5 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
  f6 = Float64(heapClassInst.heapFloat[(r2 + 7)]);
  f3 = f3 * f2;
  f4 = f4 * f1;
  f7 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
  f8 = Float64(heapClassInst.heapFloat[(r2 + 10)]);
  f9 = Float64(heapClassInst.heapFloat[(r2 + 11)]);
  f10 = Float64(heapClassInst.heapFloat[(r2 + 12)]);
  f11 = Float64(heapClassInst.heapFloat[(r2 + 8)]);
  f5 = f5 * f2;
  f6 = f6 * f1;
  f3 = f3 + f4;
  f4 = f7 * f0;
  r6 = sp + (-16);
  f2 = f8 * f2;
  f1 = f9 * f1;
  f5 = f5 + f6;
  f6 = f11 * f0;
  f3 = f3 + f4;
  r7 = r6 >> 2;
  f1 = f2 + f1;
  f0 = f10 * f0;
  f2 = f5 + f6;
  heapClassInst.heapFloat[(fp + (-4))] = Float32(f3);
  f0 = f1 + f0;
  heapClassInst.heapFloat[(r7 + 1)] = Float32(f2);
  heapClassInst.heapFloat[(r7 + 2)] = Float32(f0);
  heapClassInst.heap32[(r7 + 3)] = 0;
  r7 = sp + (-32);
  r4 = (r4 + r5) | 0;
  heapClassInst.heap32[(g0)] = Int32(r7);
  heapClassInst.heap32[(g0 + 1)] = Int32(r4);
  heapClassInst.heap32[(g0 + 2)] = Int32(r6);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r3 = r7 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r2 + 22)]);
  f1 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
  f2 = Float64(heapClassInst.heapFloat[(r2 + 18)]);
  f3 = Float64(heapClassInst.heapFloat[(r2 + 14)]);
  f4 = Float64(heapClassInst.heapFloat[(r2 + 23)]);
  f5 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
  f6 = Float64(heapClassInst.heapFloat[(r2 + 19)]);
  f7 = Float64(heapClassInst.heapFloat[(r2 + 15)]);
  f0 = f0 * f1;
  f4 = f4 * f5;
  f8 = Float64(heapClassInst.heapFloat[(r2 + 24)]);
  f9 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
  f10 = Float64(heapClassInst.heapFloat[(r2 + 20)]);
  f11 = Float64(heapClassInst.heapFloat[(r2 + 16)]);
  f2 = f2 * f1;
  f6 = f6 * f5;
  f1 = f3 * f1;
  f3 = f7 * f5;
  f0 = f0 + f4;
  f4 = f8 * f9;
  f2 = f2 + f6;
  f5 = f10 * f9;
  f1 = f1 + f3;
  f3 = f11 * f9;
  f0 = f0 + f4;
  f4 = Float64(heapClassInst.heapFloat[(r2 + 28)]);
  f2 = f2 + f5;
  f5 = Float64(heapClassInst.heapFloat[(r2 + 27)]);
  f1 = f1 + f3;
  f3 = Float64(heapClassInst.heapFloat[(r2 + 26)]);
  r3 = Int64(heapClassInst.heap32[(r2 + 30)]);
  f0 = f0 + f4;
  f2 = f2 + f5;
  f1 = f1 + f3;
  r4 = Int64(heapClassInst.heap32[(r2)]);
  r2 = Int64(heapClassInst.heap32[(r2 + 31)]);
  r5 = r3 & 1;
  if (r5 != 0) 
  {
    r5 = (r4 + r2) | 0;
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5)]);
    r3 = (r3 + r5) | 0;
    r3 = (r3 + (-1)) | 0;
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
  }
  r5 = sp + (-48);
  r2 = (r4 + r2) | 0;
  heapClassInst.heap32[(g0)] = Int32(r5);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  heapClassInst.heap32[(g0 + 2)] = Int32(r1);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r1 = r5 >> 2;
  f3 = Float64(heapClassInst.heapFloat[(fp + (-12))]);
  f4 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f5 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f1 = f3 - f1;
  f2 = f5 - f2;
  heapClassInst.heapFloat[(r0 + 4)] = Float32(f1);
  f0 = f4 - f0;
  heapClassInst.heapFloat[(r0 + 5)] = Float32(f2);
  heapClassInst.heapFloat[(r0 + 6)] = Float32(f0);
  heapClassInst.heap32[(r0 + 7)] = 0;
  return;
}

@OverflowWrapping
func _ZN12gjkepa2_impl3GJK13EncloseOriginEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  var f7: Float64 = 0.0
  var f8: Float64 = 0.0
  var f9: Float64 = 0.0
  var f10: Float64 = 0.0
  var f11: Float64 = 0.0
  var f12: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-128); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1 + 93)]);
  r3 = r2 >> 2;
  r4 = Int64(heapClassInst.heap32[(r3 + 8)]);
  do {
    if (r4 > 2) 
    {
      if (r4 == 3) 
      {
        r5 = Int64(heapClassInst.heap32[(r3)]);
        r6 = Int64(heapClassInst.heap32[(r3 + 2)]);
        r7 = Int64(heapClassInst.heap32[(r3 + 1)]);
        r6 = r6 >> 2;
        r5 = r5 >> 2;
        r7 = r7 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r6 + 6)]);
        f1 = Float64(heapClassInst.heapFloat[(r5 + 6)]);
        f2 = Float64(heapClassInst.heapFloat[(r7 + 6)]);
        f3 = Float64(heapClassInst.heapFloat[(r6 + 5)]);
        f4 = Float64(heapClassInst.heapFloat[(r5 + 5)]);
        f5 = Float64(heapClassInst.heapFloat[(r7 + 5)]);
        f5 = f5 - f4;
        f0 = f0 - f1;
        f1 = f2 - f1;
        f2 = f3 - f4;
        f3 = Float64(heapClassInst.heapFloat[(r6 + 4)]);
        f4 = Float64(heapClassInst.heapFloat[(r5 + 4)]);
        f6 = Float64(heapClassInst.heapFloat[(r7 + 4)]);
        f3 = f3 - f4;
        f4 = f6 - f4;
        f6 = f5 * f0;
        f7 = f1 * f2;
        r5 = sp + (-112);
        f6 = f6 - f7;
        f1 = f1 * f3;
        f0 = f4 * f0;
        f0 = f1 - f0;
        r6 = r5 >> 2;
        heapClassInst.heapFloat[(fp + (-28))] = Float32(f6);
        f1 = f4 * f2;
        f2 = f5 * f3;
        f1 = f1 - f2;
        heapClassInst.heapFloat[(r6 + 1)] = Float32(f0);
        f2 = f6 * f6;
        f0 = f0 * f0;
        heapClassInst.heapFloat[(r6 + 2)] = Float32(f1);
        f0 = f2 + f0;
        f1 = f1 * f1;
        f0 = f0 + f1;
        f1 = 0.0;
        heapClassInst.heap32[(r6 + 3)] = 0;
        if (f0 <= f1) 
        {
          __label__ = 24;
          break 
        }
        else {
          r4 = r4 << 2;
          r4 = (r2 + r4) | 0;
          r4 = r4 >> 2;
          heapClassInst.heap32[(r4 + 4)] = 0;
          r4 = Int64(heapClassInst.heap32[(r1 + 91)]);
          r4 = (r4 + (-1)) | 0;
          r7 = Int64(heapClassInst.heap32[(r3 + 8)]);
          r8 = r4 << 2;
          r7 = r7 << 2;
          r8 = (r0 + r8) | 0;
          r7 = (r2 + r7) | 0;
          r8 = r8 >> 2;
          heapClassInst.heap32[(r1 + 91)] = Int32(r4);
          r4 = r7 >> 2;
          r7 = Int64(heapClassInst.heap32[(r8 + 87)]);
          heapClassInst.heap32[(r4)] = Int32(r7);
          r4 = Int64(heapClassInst.heap32[(r3 + 8)]);
          r7 = r4 << 2;
          r2 = (r2 + r7) | 0;
          r2 = r2 >> 2;
          r2 = Int64(heapClassInst.heap32[(r2)]);
          r4 = (r4 + 1) | 0;
          heapClassInst.heap32[(r3 + 8)] = Int32(r4);
          heapClassInst.heap32[(g0)] = Int32(r0);
          heapClassInst.heap32[(g0 + 1)] = Int32(r5);
          heapClassInst.heap32[(g0 + 2)] = Int32(r2);
          _ZNK12gjkepa2_impl3GJK10getsupportERK9btVector3RNS0_3sSVE(i7);
          heapClassInst.heap32[(g0)] = Int32(r0);
          _ZN12gjkepa2_impl3GJK13EncloseOriginEv(i7);
          r3 = commonVariable.r_g0;
          if (r3 != 0) 
          {
            __label__ = 25;
            break 
          }
          else {
            r3 = Int64(heapClassInst.heap32[(r1 + 93)]);
            r2 = r3 >> 2;
            r4 = Int64(heapClassInst.heap32[(r2 + 8)]);
            r4 = (r4 + (-1)) | 0;
            r5 = Int64(heapClassInst.heap32[(r1 + 91)]);
            r7 = r4 << 2;
            r3 = (r3 + r7) | 0;
            r7 = (r0 + 348) | 0;
            r8 = r5 << 2;
            r8 = (r7 + r8) | 0;
            r3 = r3 >> 2;
            heapClassInst.heap32[(r2 + 8)] = Int32(r4);
            r2 = r8 >> 2;
            r3 = Int64(heapClassInst.heap32[(r3)]);
            r4 = (r5 + 1) | 0;
            heapClassInst.heap32[(r2)] = Int32(r3);
            heapClassInst.heap32[(r1 + 91)] = Int32(r4);
            f0 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
            f1 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
            f2 = Float64(heapClassInst.heapFloat[(fp + (-28))]);
            r3 = sp + (-16);
            f2 = -f2;
            r2 = r3 >> 2;
            f1 = -f1;
            heapClassInst.heapFloat[(fp + (-4))] = Float32(f2);
            f0 = -f0;
            heapClassInst.heapFloat[(r2 + 1)] = Float32(f1);
            heapClassInst.heapFloat[(r2 + 2)] = Float32(f0);
            heapClassInst.heap32[(r2 + 3)] = 0;
            r2 = Int64(heapClassInst.heap32[(r1 + 93)]);
            r4 = r2 >> 2;
            r5 = Int64(heapClassInst.heap32[(r4 + 8)]);
            r5 = r5 << 2;
            r5 = (r2 + r5) | 0;
            r5 = r5 >> 2;
            heapClassInst.heap32[(r5 + 4)] = 0;
            r5 = Int64(heapClassInst.heap32[(r1 + 91)]);
            r5 = (r5 + (-1)) | 0;
            r6 = Int64(heapClassInst.heap32[(r4 + 8)]);
            r8 = r5 << 2;
            r6 = r6 << 2;
            r7 = (r7 + r8) | 0;
            r6 = (r2 + r6) | 0;
            r7 = r7 >> 2;
            heapClassInst.heap32[(r1 + 91)] = Int32(r5);
            r5 = r6 >> 2;
            r6 = Int64(heapClassInst.heap32[(r7)]);
            heapClassInst.heap32[(r5)] = Int32(r6);
            r5 = Int64(heapClassInst.heap32[(r4 + 8)]);
            r6 = r5 << 2;
            r2 = (r2 + r6) | 0;
            r2 = r2 >> 2;
            r2 = Int64(heapClassInst.heap32[(r2)]);
            r5 = (r5 + 1) | 0;
            heapClassInst.heap32[(r4 + 8)] = Int32(r5);
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r3);
            heapClassInst.heap32[(g0 + 2)] = Int32(r2);
            _ZNK12gjkepa2_impl3GJK10getsupportERK9btVector3RNS0_3sSVE(i7);
            heapClassInst.heap32[(g0)] = Int32(r0);
            _ZN12gjkepa2_impl3GJK13EncloseOriginEv(i7);
            r3 = commonVariable.r_g0;
            if (r3 != 0) 
            {
              __label__ = 25;
              break 
            }
            else {
              r3 = Int64(heapClassInst.heap32[(r1 + 93)]);
              r2 = r3 >> 2;
              r4 = Int64(heapClassInst.heap32[(r2 + 8)]);
              r4 = (r4 + (-1)) | 0;
              r5 = Int64(heapClassInst.heap32[(r1 + 91)]);
              r6 = r4 << 2;
              r7 = r5 << 2;
              r3 = (r3 + r6) | 0;
              r0 = (r0 + r7) | 0;
              r3 = r3 >> 2;
              heapClassInst.heap32[(r2 + 8)] = Int32(r4);
              r0 = r0 >> 2;
              r3 = Int64(heapClassInst.heap32[(r3)]);
              r2 = (r5 + 1) | 0;
              heapClassInst.heap32[(r0 + 87)] = Int32(r3);
              heapClassInst.heap32[(r1 + 91)] = Int32(r2);
              r3 = 0;
              commonVariable.r_g0 = r3;
              return;
            }
          }
        }
      }
      else {
        if (r4 == 4) 
        {
          r0 = Int64(heapClassInst.heap32[(r3)]);
          r1 = Int64(heapClassInst.heap32[(r3 + 1)]);
          r2 = Int64(heapClassInst.heap32[(r3 + 3)]);
          r0 = r0 >> 2;
          r1 = r1 >> 2;
          r2 = r2 >> 2;
          r3 = Int64(heapClassInst.heap32[(r3 + 2)]);
          r3 = r3 >> 2;
          f0 = Float64(heapClassInst.heapFloat[(r1 + 6)]);
          f1 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
          f2 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
          f3 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
          f4 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
          f5 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
          f6 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
          f7 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
          f8 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
          f9 = Float64(heapClassInst.heapFloat[(r3 + 4)]);
          f0 = f0 - f1;
          f3 = f3 - f4;
          f5 = f5 - f6;
          f2 = f2 - f1;
          f8 = f8 - f6;
          f10 = f3 * f0;
          f6 = f9 - f6;
          f9 = f2 * f5;
          f7 = f7 - f4;
          f0 = f8 * f0;
          f11 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
          f12 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
          f10 = f10 * f6;
          f9 = f9 * f7;
          f4 = f12 - f4;
          f9 = f10 + f9;
          f0 = f0 * f7;
          f3 = f3 * f5;
          f1 = f11 - f1;
          f5 = f8 * f4;
          f0 = f9 - f0;
          f3 = f3 * f1;
          f2 = f2 * f4;
          f0 = f0 - f3;
          f1 = f5 * f1;
          f0 = f0 + f1;
          f1 = f2 * f6;
          f0 = f0 - f1;
          f1 = 0.0
          if (f0 < f1) 
          {
            f0 = -f0;
          }
          r0 = if (f0 > f1) {1} else {0};
          r0 = r0 & 1;
          commonVariable.r_g0 = r0;
          return;
        }
        else {
          __label__ = 24;
          break 
        }
      }
    }
    else {
      if (r4 == 1) 
      {
        r2 = 0;
        while (true) {
          if (`UIntNative`(r2) < `UIntNative`(3)) 
          {
            r3 = sp + (-64);
            r4 = r3 >> 2;
            heapClassInst.heap32[(fp + (-16))] = 0;
            r5 = r2 << 2;
            heapClassInst.heap32[(r4 + 1)] = 0;
            r5 = (r3 + r5) | 0;
            heapClassInst.heap32[(r4 + 2)] = 0;
            r5 = r5 >> 2;
            heapClassInst.heap32[(r4 + 3)] = 0;
            heapClassInst.heap32[(r5)] = 1065353216;
            r5 = Int64(heapClassInst.heap32[(r1 + 93)]);
            r6 = r5 >> 2;
            r7 = Int64(heapClassInst.heap32[(r6 + 8)]);
            r7 = r7 << 2;
            r7 = (r5 + r7) | 0;
            r7 = r7 >> 2;
            heapClassInst.heap32[(r7 + 4)] = 0;
            r7 = Int64(heapClassInst.heap32[(r1 + 91)]);
            r7 = (r7 + (-1)) | 0;
            r8 = Int64(heapClassInst.heap32[(r6 + 8)]);
            r9 = r7 << 2;
            r8 = r8 << 2;
            r9 = (r0 + r9) | 0;
            r8 = (r5 + r8) | 0;
            r9 = r9 >> 2;
            heapClassInst.heap32[(r1 + 91)] = Int32(r7);
            r7 = r8 >> 2;
            r8 = Int64(heapClassInst.heap32[(r9 + 87)]);
            heapClassInst.heap32[(r7)] = Int32(r8);
            r7 = Int64(heapClassInst.heap32[(r6 + 8)]);
            r8 = r7 << 2;
            r5 = (r5 + r8) | 0;
            r5 = r5 >> 2;
            r5 = Int64(heapClassInst.heap32[(r5)]);
            r7 = (r7 + 1) | 0;
            heapClassInst.heap32[(r6 + 8)] = Int32(r7);
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r3);
            heapClassInst.heap32[(g0 + 2)] = Int32(r5);
            _ZNK12gjkepa2_impl3GJK10getsupportERK9btVector3RNS0_3sSVE(i7);
            heapClassInst.heap32[(g0)] = Int32(r0);
            _ZN12gjkepa2_impl3GJK13EncloseOriginEv(i7);
            r3 = commonVariable.r_g0;
            if (r3 != 0) 
            {
              __label__ = 25;
              break 
            }
            else {
              r3 = Int64(heapClassInst.heap32[(r1 + 93)]);
              r5 = r3 >> 2;
              r6 = Int64(heapClassInst.heap32[(r5 + 8)]);
              r6 = (r6 + (-1)) | 0;
              r7 = Int64(heapClassInst.heap32[(r1 + 91)]);
              r8 = r6 << 2;
              r3 = (r3 + r8) | 0;
              r8 = (r0 + 348) | 0;
              r9 = r7 << 2;
              r9 = (r8 + r9) | 0;
              r3 = r3 >> 2;
              heapClassInst.heap32[(r5 + 8)] = Int32(r6);
              r5 = r9 >> 2;
              r3 = Int64(heapClassInst.heap32[(r3)]);
              r6 = (r7 + 1) | 0;
              heapClassInst.heap32[(r5)] = Int32(r3);
              heapClassInst.heap32[(r1 + 91)] = Int32(r6);
              f0 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
              f1 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
              f2 = Float64(heapClassInst.heapFloat[(fp + (-16))]);
              r3 = sp + (-48);
              f2 = -f2;
              r4 = r3 >> 2;
              f1 = -f1;
              heapClassInst.heapFloat[(fp + (-12))] = Float32(f2);
              f0 = -f0;
              heapClassInst.heapFloat[(r4 + 1)] = Float32(f1);
              heapClassInst.heapFloat[(r4 + 2)] = Float32(f0);
              heapClassInst.heap32[(r4 + 3)] = 0;
              r4 = Int64(heapClassInst.heap32[(r1 + 93)]);
              r5 = r4 >> 2;
              r6 = Int64(heapClassInst.heap32[(r5 + 8)]);
              r6 = r6 << 2;
              r6 = (r4 + r6) | 0;
              r6 = r6 >> 2;
              heapClassInst.heap32[(r6 + 4)] = 0;
              r6 = Int64(heapClassInst.heap32[(r1 + 91)]);
              r6 = (r6 + (-1)) | 0;
              r7 = Int64(heapClassInst.heap32[(r5 + 8)]);
              r9 = r6 << 2;
              r7 = r7 << 2;
              r8 = (r8 + r9) | 0;
              r7 = (r4 + r7) | 0;
              r8 = r8 >> 2;
              heapClassInst.heap32[(r1 + 91)] = Int32(r6);
              r6 = r7 >> 2;
              r7 = Int64(heapClassInst.heap32[(r8)]);
              heapClassInst.heap32[(r6)] = Int32(r7);
              r6 = Int64(heapClassInst.heap32[(r5 + 8)]);
              r7 = r6 << 2;
              r4 = (r4 + r7) | 0;
              r4 = r4 >> 2;
              r4 = Int64(heapClassInst.heap32[(r4)]);
              r6 = (r6 + 1) | 0;
              heapClassInst.heap32[(r5 + 8)] = Int32(r6);
              heapClassInst.heap32[(g0)] = Int32(r0);
              heapClassInst.heap32[(g0 + 1)] = Int32(r3);
              heapClassInst.heap32[(g0 + 2)] = Int32(r4);
              _ZNK12gjkepa2_impl3GJK10getsupportERK9btVector3RNS0_3sSVE(i7);
              heapClassInst.heap32[(g0)] = Int32(r0);
              _ZN12gjkepa2_impl3GJK13EncloseOriginEv(i7);
              r3 = commonVariable.r_g0;
              if (r3 != 0) 
              {
                __label__ = 25;
                break 
              }
              else {
                r3 = Int64(heapClassInst.heap32[(r1 + 93)]);
                r4 = r3 >> 2;
                r5 = Int64(heapClassInst.heap32[(r4 + 8)]);
                r5 = (r5 + (-1)) | 0;
                r6 = Int64(heapClassInst.heap32[(r1 + 91)]);
                r7 = r5 << 2;
                r8 = r6 << 2;
                r3 = (r3 + r7) | 0;
                r7 = (r0 + r8) | 0;
                r3 = r3 >> 2;
                heapClassInst.heap32[(r4 + 8)] = Int32(r5);
                r4 = r7 >> 2;
                r3 = Int64(heapClassInst.heap32[(r3)]);
                r2 = (r2 + 1) | 0;
                r5 = (r6 + 1) | 0;
                heapClassInst.heap32[(r4 + 87)] = Int32(r3);
                heapClassInst.heap32[(r1 + 91)] = Int32(r5);
                continue 
              }
            }
          }
          else {
            __label__ = 24;
            break 
          }
        }
      }
      else {
        if (r4 == 2) 
        {
          r2 = Int64(heapClassInst.heap32[(r3 + 1)]);
          r3 = Int64(heapClassInst.heap32[(r3)]);
          r2 = r2 >> 2;
          r3 = r3 >> 2;
          f0 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
          f1 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
          f2 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
          f3 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
          f4 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
          f5 = Float64(heapClassInst.heapFloat[(r3 + 4)]);
          f0 = f0 - f1;
          f1 = f2 - f3;
          f2 = f4 - f5;
          r2 = 0;
          while (true) {
            if (`UIntNative`(r2) < `UIntNative`(3)) 
            {
              r3 = sp + (-80);
              r4 = r3 >> 2;
              heapClassInst.heap32[(fp + (-20))] = 0;
              r5 = r2 << 2;
              heapClassInst.heap32[(r4 + 1)] = 0;
              r3 = (r3 + r5) | 0;
              heapClassInst.heap32[(r4 + 2)] = 0;
              r3 = r3 >> 2;
              heapClassInst.heap32[(r4 + 3)] = 0;
              heapClassInst.heap32[(r3)] = 1065353216;
              f3 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
              f4 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
              f5 = Float64(heapClassInst.heapFloat[(fp + (-20))]);
              f6 = f1 * f3;
              f7 = f0 * f4;
              r3 = sp + (-96);
              f6 = f6 - f7;
              f7 = f0 * f5;
              f3 = f2 * f3;
              f3 = f7 - f3;
              r4 = r3 >> 2;
              heapClassInst.heapFloat[(fp + (-24))] = Float32(f6);
              f4 = f2 * f4;
              f5 = f1 * f5;
              f4 = f4 - f5;
              heapClassInst.heapFloat[(r4 + 1)] = Float32(f3);
              f5 = f6 * f6;
              f3 = f3 * f3;
              heapClassInst.heapFloat[(r4 + 2)] = Float32(f4);
              f3 = f5 + f3;
              f4 = f4 * f4;
              f3 = f3 + f4;
              f4 = 0.0;
              heapClassInst.heap32[(r4 + 3)] = 0;
              if (!(f3 <= f4)) 
              {
                r5 = Int64(heapClassInst.heap32[(r1 + 93)]);
                r6 = r5 >> 2;
                r7 = Int64(heapClassInst.heap32[(r6 + 8)]);
                r7 = r7 << 2;
                r7 = (r5 + r7) | 0;
                r7 = r7 >> 2;
                heapClassInst.heap32[(r7 + 4)] = 0;
                r7 = Int64(heapClassInst.heap32[(r1 + 91)]);
                r7 = (r7 + (-1)) | 0;
                r8 = Int64(heapClassInst.heap32[(r6 + 8)]);
                r9 = r7 << 2;
                r8 = r8 << 2;
                r9 = (r0 + r9) | 0;
                r8 = (r5 + r8) | 0;
                r9 = r9 >> 2;
                heapClassInst.heap32[(r1 + 91)] = Int32(r7);
                r7 = r8 >> 2;
                r8 = Int64(heapClassInst.heap32[(r9 + 87)]);
                heapClassInst.heap32[(r7)] = Int32(r8);
                r7 = Int64(heapClassInst.heap32[(r6 + 8)]);
                r8 = r7 << 2;
                r5 = (r5 + r8) | 0;
                r5 = r5 >> 2;
                r5 = Int64(heapClassInst.heap32[(r5)]);
                r7 = (r7 + 1) | 0;
                heapClassInst.heap32[(r6 + 8)] = Int32(r7);
                heapClassInst.heap32[(g0)] = Int32(r0);
                heapClassInst.heap32[(g0 + 1)] = Int32(r3);
                heapClassInst.heap32[(g0 + 2)] = Int32(r5);
                _ZNK12gjkepa2_impl3GJK10getsupportERK9btVector3RNS0_3sSVE(i7);
                heapClassInst.heap32[(g0)] = Int32(r0);
                _ZN12gjkepa2_impl3GJK13EncloseOriginEv(i7);
                r3 = commonVariable.r_g0;
                if (r3 != 0) 
                {
                  __label__ = 25;
                  break 
                }
                else {
                  r3 = Int64(heapClassInst.heap32[(r1 + 93)]);
                  r5 = r3 >> 2;
                  r6 = Int64(heapClassInst.heap32[(r5 + 8)]);
                  r6 = (r6 + (-1)) | 0;
                  r7 = Int64(heapClassInst.heap32[(r1 + 91)]);
                  r8 = r6 << 2;
                  r3 = (r3 + r8) | 0;
                  r8 = (r0 + 348) | 0;
                  r9 = r7 << 2;
                  r9 = (r8 + r9) | 0;
                  r3 = r3 >> 2;
                  heapClassInst.heap32[(r5 + 8)] = Int32(r6);
                  r5 = r9 >> 2;
                  r3 = Int64(heapClassInst.heap32[(r3)]);
                  r6 = (r7 + 1) | 0;
                  heapClassInst.heap32[(r5)] = Int32(r3);
                  heapClassInst.heap32[(r1 + 91)] = Int32(r6);
                  f3 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
                  f4 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
                  f5 = Float64(heapClassInst.heapFloat[(fp + (-24))]);
                  r3 = sp + (-32);
                  f5 = -f5;
                  r4 = r3 >> 2;
                  f4 = -f4;
                  heapClassInst.heapFloat[(fp + (-8))] = Float32(f5);
                  f3 = -f3;
                  heapClassInst.heapFloat[(r4 + 1)] = Float32(f4);
                  heapClassInst.heapFloat[(r4 + 2)] = Float32(f3);
                  heapClassInst.heap32[(r4 + 3)] = 0;
                  r4 = Int64(heapClassInst.heap32[(r1 + 93)]);
                  r5 = r4 >> 2;
                  r6 = Int64(heapClassInst.heap32[(r5 + 8)]);
                  r6 = r6 << 2;
                  r6 = (r4 + r6) | 0;
                  r6 = r6 >> 2;
                  heapClassInst.heap32[(r6 + 4)] = 0;
                  r6 = Int64(heapClassInst.heap32[(r1 + 91)]);
                  r6 = (r6 + (-1)) | 0;
                  r7 = Int64(heapClassInst.heap32[(r5 + 8)]);
                  r9 = r6 << 2;
                  r7 = r7 << 2;
                  r8 = (r8 + r9) | 0;
                  r7 = (r4 + r7) | 0;
                  r8 = r8 >> 2;
                  heapClassInst.heap32[(r1 + 91)] = Int32(r6);
                  r6 = r7 >> 2;
                  r7 = Int64(heapClassInst.heap32[(r8)]);
                  heapClassInst.heap32[(r6)] = Int32(r7);
                  r6 = Int64(heapClassInst.heap32[(r5 + 8)]);
                  r7 = r6 << 2;
                  r4 = (r4 + r7) | 0;
                  r4 = r4 >> 2;
                  r4 = Int64(heapClassInst.heap32[(r4)]);
                  r6 = (r6 + 1) | 0;
                  heapClassInst.heap32[(r5 + 8)] = Int32(r6);
                  heapClassInst.heap32[(g0)] = Int32(r0);
                  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
                  heapClassInst.heap32[(g0 + 2)] = Int32(r4);
                  _ZNK12gjkepa2_impl3GJK10getsupportERK9btVector3RNS0_3sSVE(i7);
                  heapClassInst.heap32[(g0)] = Int32(r0);
                  _ZN12gjkepa2_impl3GJK13EncloseOriginEv(i7);
                  r3 = commonVariable.r_g0;
                  if (r3 != 0) 
                  {
                    __label__ = 25;
                    break 
                  }
                  else {
                    r3 = Int64(heapClassInst.heap32[(r1 + 93)]);
                    r4 = r3 >> 2;
                    r5 = Int64(heapClassInst.heap32[(r4 + 8)]);
                    r5 = (r5 + (-1)) | 0;
                    r6 = Int64(heapClassInst.heap32[(r1 + 91)]);
                    r7 = r5 << 2;
                    r8 = r6 << 2;
                    r3 = (r3 + r7) | 0;
                    r7 = (r0 + r8) | 0;
                    r3 = r3 >> 2;
                    heapClassInst.heap32[(r4 + 8)] = Int32(r5);
                    r4 = r7 >> 2;
                    r3 = Int64(heapClassInst.heap32[(r3)]);
                    r5 = (r6 + 1) | 0;
                    heapClassInst.heap32[(r4 + 87)] = Int32(r3);
                    heapClassInst.heap32[(r1 + 91)] = Int32(r5);
                  }
                }
              }
              r2 = (r2 + 1) | 0;
              continue 
            }
            else {
              __label__ = 24;
              break 
            }
          }
        }
        else {
          __label__ = 24;
        }
      }
    }
  } while (false);
  match (__label__) {
    case 24 =>
      r0 = 0;
      commonVariable.r_g0 = r0;
      return;
    case 25 =>
      r0 = 1;
      commonVariable.r_g0 = r0;
      return;
    case _ =>
      println("break 3970")
  }
}

@OverflowWrapping
func _ZN12gjkepa2_impl3GJK13projectoriginERK9btVector3S3_S3_PfRj(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  var __label__ = 0;
  i7 = sp + (-96); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = sp + (-12);
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  r3 = r1 >> 2;
  heapClassInst.heap32[(fp + (-3))] = Int32(r0);
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(r3 + 1)] = Int32(r2);
  r5 = r0 >> 2;
  heapClassInst.heap32[(r3 + 2)] = Int32(r4);
  r2 = r2 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r5 + 2)]);
  f1 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
  f2 = Float64(heapClassInst.heapFloat[(r5 + 1)]);
  f3 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
  f4 = Float64(heapClassInst.heapFloat[(r5)]);
  f5 = Float64(heapClassInst.heapFloat[(r2)]);
  r3 = sp + (-64);
  f6 = f4 - f5;
  f7 = f2 - f3;
  r6 = r3 >> 2;
  heapClassInst.heapFloat[(fp + (-16))] = Float32(f6);
  f8 = f0 - f1;
  heapClassInst.heapFloat[(r6 + 1)] = Float32(f7);
  heapClassInst.heapFloat[(r6 + 2)] = Float32(f8);
  r4 = r4 >> 2;
  heapClassInst.heap32[(r6 + 3)] = 0;
  f9 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
  f10 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
  f11 = Float64(heapClassInst.heapFloat[(r4)]);
  f5 = f5 - f11;
  f3 = f3 - f10;
  heapClassInst.heapFloat[(r6 + 4)] = Float32(f5);
  f1 = f1 - f9;
  heapClassInst.heapFloat[(r6 + 5)] = Float32(f3);
  heapClassInst.heapFloat[(r6 + 6)] = Float32(f1);
  f12 = f8 * f5;
  f13 = f6 * f1;
  f14 = f7 * f1;
  f15 = f8 * f3;
  f12 = f12 - f13;
  f13 = f14 - f15;
  f11 = f11 - f4;
  heapClassInst.heap32[(r6 + 7)] = 0;
  f14 = f6 * f3;
  f15 = f7 * f5;
  f14 = f14 - f15;
  f10 = f10 - f2;
  heapClassInst.heapFloat[(r6 + 8)] = Float32(f11);
  f15 = f13 * f13;
  f16 = f12 * f12;
  f9 = f9 - f0;
  heapClassInst.heapFloat[(r6 + 9)] = Float32(f10);
  f15 = f15 + f16;
  f16 = f14 * f14;
  f15 = f15 + f16;
  heapClassInst.heapFloat[(r6 + 10)] = Float32(f9);
  heapClassInst.heap32[(r6 + 11)] = 0;
  f16 = 0.0;
  if (f15 > f16) 
  {
    r6 = Int64(heapClassInst.heap32[(fp + 3)]);
    r7 = Int64(heapClassInst.heap32[(fp + 4)]);
    r8 = sp + (-72);
    r9 = r8 >> 2;
    heapClassInst.heap32[(fp + (-18))] = 0;
    r10 = 0;
    f17 = ( -1.0);
    heapClassInst.heap32[(r9 + 1)] = 0;
    heapClassInst.heap32[(fp + (-19))] = 0;
    r18 = 0;
    while (true) {
      f18 = f7 * f14;
      f19 = f8 * f12;
      f8 = f8 * f13;
      f20 = f6 * f14;
      f18 = f18 - f19;
      f8 = f8 - f20;
      f6 = f6 * f12;
      f7 = f7 * f13;
      f4 = f4 * f18;
      f2 = f2 * f8;
      f6 = f6 - f7;
      f2 = f4 + f2;
      f0 = f0 * f6;
      f0 = f2 + f0;
      do {
        if (f0 > f16) 
        {
          r11 = _ZZN12gjkepa2_impl3GJK13projectoriginERK9btVector3S3_S3_PfRjE4imd3;
          r12 = r10 << 2;
          r13 = (r11 + r12) | 0;
          r13 = r13 >> 2;
          r13 = Int64(heapClassInst.heap32[(r13)]);
          r14 = r13 << 2;
          r15 = (r1 + r14) | 0;
          r15 = r15 >> 2;
          r15 = Int64(heapClassInst.heap32[(r15)]);
          r16 = sp + (-76);
          heapClassInst.heap32[(g0)] = Int32(r0);
          heapClassInst.heap32[(g0 + 1)] = Int32(r15);
          heapClassInst.heap32[(g0 + 2)] = Int32(r8);
          heapClassInst.heap32[(g0 + 3)] = Int32(r16);
          _ZN12gjkepa2_impl3GJK13projectoriginERK9btVector3S3_PfRj(i7);
          f0 = commonVariable.f_g0;
          if (!(f17 < f16)) 
          {
            if (f0 >= f17) 
            {
              break 
            }
          }
          r0 = Int64(heapClassInst.heap32[(fp + (-19))]);
          r15 = 1;
          r11 = (r11 + r14) | 0;
          r16 = r0 & 1;
          r17 = r15 << r10;
          r0 = r0 & 2;
          r13 = r15 << r13;
          r11 = r11 >> 2;
          r15 = if (r16 == 0) {r18} else {r17};
          r0 = if (r0 == 0) {r18} else {r13};
          r11 = Int64(heapClassInst.heap32[(r11)]);
          r12 = (r6 + r12) | 0;
          r13 = r7 >> 2;
          r0 = (r15 + r0) | 0;
          r11 = r11 << 2;
          r14 = (r6 + r14) | 0;
          r12 = r12 >> 2;
          heapClassInst.heap32[(r13)] = Int32(r0);
          r0 = (r6 + r11) | 0;
          r11 = r14 >> 2;
          heapClassInst.heap32[(r12)] = heapClassInst.heap32[(fp + (-18))];
          r0 = r0 >> 2;
          heapClassInst.heap32[(r11)] = heapClassInst.heap32[(r9 + 1)];
          heapClassInst.heap32[(r0)] = 0;
          f17 = f0;
        }
      } while (false);
      if (r10 == 2) 
      {
        break 
      }
      else {
        r11 = (r10 + 1) | 0;
        r0 = r10 << 2;
        r0 = (r1 + r0) | 0;
        r0 = r0 >> 2;
        r10 = r10 << 4;
        r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
        r10 = (r3 + r10) | 0;
        r10 = r10 >> 2;
        r12 = r0 >> 2;
        f6 = Float64(heapClassInst.heapFloat[(r10 + 4)]);
        f7 = Float64(heapClassInst.heapFloat[(r10 + 5)]);
        f8 = Float64(heapClassInst.heapFloat[(r10 + 6)]);
        f4 = Float64(heapClassInst.heapFloat[(r12)]);
        f2 = Float64(heapClassInst.heapFloat[(r12 + 1)]);
        f0 = Float64(heapClassInst.heapFloat[(r12 + 2)]);
        r10 = r11;
      }
    }
    if (f17 < f16) 
    {
      f17 = Float64(heapClassInst.heapFloat[(r5)]);
      f0 = Float64(heapClassInst.heapFloat[(r5 + 1)]);
      f2 = Float64(heapClassInst.heapFloat[(r5 + 2)]);
      f17 = f17 * f13;
      f0 = f0 * f12;
      heapClassInst.heapFloat[(g0)] = Float32(f15);
      f17 = f17 + f0;
      f0 = f2 * f14;
      f17 = f17 + f0;
      r0 = r7 >> 2;
      sqrtf(i7);
      f0 = commonVariable.f_g0;
      f17 = f17 / f15;
      heapClassInst.heap32[(r0)] = 7;
      f2 = f13 * f17;
      f4 = Float64(heapClassInst.heapFloat[(r2)]);
      f6 = f12 * f17;
      f7 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
      f8 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
      f17 = f14 * f17;
      f7 = f7 - f6;
      f8 = f8 - f17;
      f4 = f4 - f2;
      f12 = f3 * f8;
      f13 = f1 * f7;
      f1 = f1 * f4;
      f8 = f5 * f8;
      f12 = f12 - f13;
      f1 = f1 - f8;
      f5 = f5 * f7;
      f3 = f3 * f4;
      f3 = f5 - f3;
      f4 = f12 * f12;
      f1 = f1 * f1;
      f1 = f4 + f1;
      f3 = f3 * f3;
      f1 = f1 + f3;
      heapClassInst.heapFloat[(g0)] = Float32(f1);
      sqrtf(i7);
      r0 = r6 >> 2;
      f1 = commonVariable.f_g0 / f0;
      heapClassInst.heapFloat[(r0)] = Float32(f1);
      f1 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
      f3 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
      f4 = Float64(heapClassInst.heapFloat[(r4)]);
      f3 = f3 - f6;
      f1 = f1 - f17;
      f4 = f4 - f2;
      f5 = f10 * f1;
      f7 = f9 * f3;
      f8 = f9 * f4;
      f1 = f11 * f1;
      f5 = f5 - f7;
      f1 = f8 - f1;
      f3 = f11 * f3;
      f4 = f10 * f4;
      f3 = f3 - f4;
      f4 = f5 * f5;
      f1 = f1 * f1;
      f1 = f4 + f1;
      f3 = f3 * f3;
      f1 = f1 + f3;
      heapClassInst.heapFloat[(g0)] = Float32(f1);
      sqrtf(i7);
      f0 = commonVariable.f_g0 / f0;
      heapClassInst.heapFloat[(r0 + 1)] = Float32(f0);
      f1 = Float64(heapClassInst.heapFloat[(r0)]);
      f3 = 1.0;
      f0 = f1 + f0;
      f1 = f2 * f2;
      f2 = f6 * f6;
      f0 = f3 - f0;
      f1 = f1 + f2;
      f17 = f17 * f17;
      heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
      f17 = f1 + f17;
    }
  }
  else {
    f17 = ( -1.0);
  }
  commonVariable.f_g0 = f17;
  return;
}

@OverflowWrapping
func _ZN12gjkepa2_impl3GJK8EvaluateERKNS_13MinkowskiDiffERK9btVector3(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  var __label__ = 0;
  i7 = sp + (-240); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = (r0 + 220) | 0;
  r3 = (r0 + 252) | 0;
  heapClassInst.heap32[(r1 + 87)] = Int32(r2);
  r2 = (r0 + 284) | 0;
  heapClassInst.heap32[(r1 + 88)] = Int32(r3);
  r3 = (r0 + 316) | 0;
  heapClassInst.heap32[(r1 + 89)] = Int32(r2);
  heapClassInst.heap32[(r1 + 90)] = Int32(r3);
  heapClassInst.heap32[(r1 + 91)] = 4;
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heap32[(r1 + 92)] = 0;
  r2 = r2 >> 2;
  heapClassInst.heap32[(r1 + 94)] = 0;
  r4 = Int64(heapClassInst.heap32[(r2 + 1)]);
  r5 = Int64(heapClassInst.heap32[(r2)]);
  heapClassInst.heap32[(r1)] = Int32(r5);
  heapClassInst.heap32[(r1 + 1)] = Int32(r4);
  heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r2 + 2)];
  heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r2 + 3)];
  heapClassInst.heap32[(r1 + 4)] = heapClassInst.heap32[(r2 + 4)];
  heapClassInst.heap32[(r1 + 5)] = heapClassInst.heap32[(r2 + 5)];
  heapClassInst.heap32[(r1 + 6)] = heapClassInst.heap32[(r2 + 6)];
  heapClassInst.heap32[(r1 + 7)] = heapClassInst.heap32[(r2 + 7)];
  heapClassInst.heap32[(r1 + 8)] = heapClassInst.heap32[(r2 + 8)];
  heapClassInst.heap32[(r1 + 9)] = heapClassInst.heap32[(r2 + 9)];
  heapClassInst.heap32[(r1 + 10)] = heapClassInst.heap32[(r2 + 10)];
  heapClassInst.heap32[(r1 + 11)] = heapClassInst.heap32[(r2 + 11)];
  heapClassInst.heap32[(r1 + 12)] = heapClassInst.heap32[(r2 + 12)];
  heapClassInst.heap32[(r1 + 13)] = heapClassInst.heap32[(r2 + 13)];
  heapClassInst.heap32[(r1 + 14)] = heapClassInst.heap32[(r2 + 14)];
  heapClassInst.heap32[(r1 + 15)] = heapClassInst.heap32[(r2 + 15)];
  heapClassInst.heap32[(r1 + 16)] = heapClassInst.heap32[(r2 + 16)];
  heapClassInst.heap32[(r1 + 17)] = heapClassInst.heap32[(r2 + 17)];
  heapClassInst.heap32[(r1 + 18)] = heapClassInst.heap32[(r2 + 18)];
  heapClassInst.heap32[(r1 + 19)] = heapClassInst.heap32[(r2 + 19)];
  heapClassInst.heap32[(r1 + 20)] = heapClassInst.heap32[(r2 + 20)];
  heapClassInst.heap32[(r1 + 21)] = heapClassInst.heap32[(r2 + 21)];
  heapClassInst.heap32[(r1 + 22)] = heapClassInst.heap32[(r2 + 22)];
  heapClassInst.heap32[(r1 + 23)] = heapClassInst.heap32[(r2 + 23)];
  heapClassInst.heap32[(r1 + 24)] = heapClassInst.heap32[(r2 + 24)];
  heapClassInst.heap32[(r1 + 25)] = heapClassInst.heap32[(r2 + 25)];
  heapClassInst.heap32[(r1 + 26)] = heapClassInst.heap32[(r2 + 26)];
  heapClassInst.heap32[(r1 + 27)] = heapClassInst.heap32[(r2 + 27)];
  heapClassInst.heap32[(r1 + 28)] = heapClassInst.heap32[(r2 + 28)];
  heapClassInst.heap32[(r1 + 29)] = heapClassInst.heap32[(r2 + 29)];
  r4 = Int64(heapClassInst.heap32[(r2 + 31)]);
  r2 = Int64(heapClassInst.heap32[(r2 + 30)]);
  heapClassInst.heap32[(r1 + 30)] = Int32(r2);
  heapClassInst.heap32[(r1 + 31)] = Int32(r4);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(r1 + 36)] = 0;
  r2 = r2 >> 2;
  heapClassInst.heap32[(r1 + 45)] = 0;
  f0 = Float64(heapClassInst.heapFloat[(r2)]);
  heapClassInst.heapFloat[(r1 + 32)] = Float32(f0);
  f1 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
  heapClassInst.heapFloat[(r1 + 33)] = Float32(f1);
  f2 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
  f3 = f0 * f0;
  f4 = f1 * f1;
  f3 = f3 + f4;
  f4 = f2 * f2;
  f3 = f3 + f4;
  heapClassInst.heapFloat[(r1 + 34)] = Float32(f2);
  heapClassInst.heap32[(r1 + 35)] = heapClassInst.heap32[(r2 + 3)];
  f4 = 0.0;
  if (f3 <= f4) 
  {
    r2 = sp + (-112);
    r2 = r2 >> 2;
    heapClassInst.heap32[(fp + (-28))] = 1065353216;
    heapClassInst.heap32[(r2 + 1)] = 0;
    heapClassInst.heap32[(r2 + 2)] = 0;
    heapClassInst.heap32[(r2 + 3)] = 0;
  }
  else {
    r2 = sp + (-112);
    f0 = -f0;
    r2 = r2 >> 2;
    f1 = -f1;
    heapClassInst.heapFloat[(fp + (-28))] = Float32(f0);
    f0 = -f2;
    heapClassInst.heapFloat[(r2 + 1)] = Float32(f1);
    heapClassInst.heapFloat[(r2 + 2)] = Float32(f0);
    heapClassInst.heap32[(r2 + 3)] = 0;
  }
  heapClassInst.heap32[(r1 + 41)] = 0;
  heapClassInst.heap32[(r1 + 91)] = 3;
  heapClassInst.heap32[(r1 + 37)] = Int32(r3);
  heapClassInst.heap32[(r1 + 45)] = 1;
  r2 = sp + (-112);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  heapClassInst.heap32[(g0 + 2)] = Int32(r3);
  _ZNK12gjkepa2_impl3GJK10getsupportERK9btVector3RNS0_3sSVE(i7);
  heapClassInst.heap32[(r1 + 41)] = 1065353216;
  r2 = Int64(heapClassInst.heap32[(r1 + 37)]);
  r2 = r2 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
  heapClassInst.heapFloat[(r1 + 32)] = Float32(f0);
  f1 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
  heapClassInst.heapFloat[(r1 + 33)] = Float32(f1);
  f2 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
  heapClassInst.heapFloat[(r1 + 34)] = Float32(f2);
  f5 = Float64(heapClassInst.heapFloat[(r2 + 7)]);
  r2 = sp + (-176);
  r3 = r2 >> 2;
  heapClassInst.heapFloat[(r1 + 35)] = Float32(f5);
  heapClassInst.heapFloat[(r3 + 12)] = Float32(f0);
  heapClassInst.heapFloat[(r3 + 13)] = Float32(f1);
  heapClassInst.heapFloat[(r3 + 14)] = Float32(f2);
  heapClassInst.heapFloat[(r3 + 15)] = Float32(f5);
  heapClassInst.heapFloat[(r3 + 8)] = Float32(f0);
  heapClassInst.heapFloat[(r3 + 9)] = Float32(f1);
  heapClassInst.heapFloat[(r3 + 10)] = Float32(f2);
  heapClassInst.heapFloat[(r3 + 11)] = Float32(f5);
  heapClassInst.heapFloat[(r3 + 4)] = Float32(f0);
  heapClassInst.heapFloat[(r3 + 5)] = Float32(f1);
  heapClassInst.heapFloat[(r3 + 6)] = Float32(f2);
  heapClassInst.heapFloat[(r3 + 7)] = Float32(f5);
  heapClassInst.heapFloat[(fp + (-44))] = Float32(f0);
  heapClassInst.heapFloat[(r3 + 1)] = Float32(f1);
  r4 = (r0 + 148) | 0;
  heapClassInst.heap32[(fp + (-52))] = Int32(r4);
  r4 = 0;
  r5 = 1;
  heapClassInst.heap32[(fp + (-53))] = Int32(r5);
  heapClassInst.heapFloat[(r3 + 2)] = Float32(f2);
  heapClassInst.heapFloat[(r3 + 3)] = Float32(f5);
  heapClassInst.heap32[(fp + (-50))] = Int32(r5);
  r24 = 0;
  while (true) {
    f0 = f0 * f0;
    f1 = f1 * f1;
    r3 = Int64(heapClassInst.heap32[(r1 + 92)]);
    f0 = f0 + f1;
    f1 = f2 * f2;
    f0 = f0 + f1;
    heapClassInst.heapFloat[(g0)] = Float32(f0);
    sqrtf(i7);
    f0 = commonVariable.f_g0;
    f1 = 9.9999997473787516e-005;
    if (f0 >= f1) 
    {
      r5 = Int64(heapClassInst.heap32[(fp + (-53))]);
      r5 = (r5 - r3) | 0;
      heapClassInst.heap32[(fp + (-51))] = Int32(r5);
      f2 = Float64(heapClassInst.heapFloat[(r1 + 34)]);
      f5 = Float64(heapClassInst.heapFloat[(r1 + 33)]);
      f6 = Float64(heapClassInst.heapFloat[(r1 + 32)]);
      r5 = sp + (-96);
      f6 = -f6;
      r6 = r5 >> 2;
      f5 = -f5;
      heapClassInst.heapFloat[(fp + (-24))] = Float32(f6);
      r3 = (r3 * 36) | 0;
      f2 = -f2;
      heapClassInst.heapFloat[(r6 + 1)] = Float32(f5);
      r7 = (r0 + r3) | 0;
      heapClassInst.heapFloat[(r6 + 2)] = Float32(f2);
      heapClassInst.heap32[(r6 + 3)] = 0;
      r6 = r7 >> 2;
      r8 = Int64(heapClassInst.heap32[(r6 + 45)]);
      r8 = r8 << 2;
      r8 = (r7 + r8) | 0;
      r8 = r8 >> 2;
      heapClassInst.heap32[(r8 + 41)] = 0;
      r8 = Int64(heapClassInst.heap32[(r1 + 91)]);
      r8 = (r8 + (-1)) | 0;
      r9 = Int64(heapClassInst.heap32[(r6 + 45)]);
      r10 = r8 << 2;
      r10 = (r0 + r10) | 0;
      r9 = r9 << 2;
      r7 = (r7 + 148) | 0;
      r9 = (r7 + r9) | 0;
      r10 = r10 >> 2;
      heapClassInst.heap32[(r1 + 91)] = Int32(r8);
      r8 = r9 >> 2;
      r9 = Int64(heapClassInst.heap32[(r10 + 87)]);
      heapClassInst.heap32[(r8)] = Int32(r9);
      r8 = Int64(heapClassInst.heap32[(r6 + 45)]);
      r9 = r8 << 2;
      r9 = (r7 + r9) | 0;
      r9 = r9 >> 2;
      r9 = Int64(heapClassInst.heap32[(r9)]);
      r8 = (r8 + 1) | 0;
      heapClassInst.heap32[(r6 + 45)] = Int32(r8);
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r5);
      heapClassInst.heap32[(g0 + 2)] = Int32(r9);
      _ZNK12gjkepa2_impl3GJK10getsupportERK9btVector3RNS0_3sSVE(i7);
      r5 = Int64(heapClassInst.heap32[(r6 + 45)]);
      r8 = r5 << 2;
      r7 = (r8 + r7) | 0;
      r7 = r7 >> 2;
      r7 = Int64(heapClassInst.heap32[(r7 + (-1))]);
      r8 = 0;
      while (true) {
        if (`UIntNative`(r8) < `UIntNative`(4)) 
        {
          r9 = r8 << 4;
          r9 = (r2 + r9) | 0;
          r10 = r7 >> 2;
          r9 = r9 >> 2;
          f2 = Float64(heapClassInst.heapFloat[(r10 + 4)]);
          f5 = Float64(heapClassInst.heapFloat[(r9)]);
          f6 = Float64(heapClassInst.heapFloat[(r10 + 5)]);
          f7 = Float64(heapClassInst.heapFloat[(r9 + 1)]);
          f2 = f2 - f5;
          f5 = f6 - f7;
          f6 = Float64(heapClassInst.heapFloat[(r10 + 6)]);
          f7 = Float64(heapClassInst.heapFloat[(r9 + 2)]);
          f6 = f6 - f7;
          f2 = f2 * f2;
          f5 = f5 * f5;
          f2 = f2 + f5;
          f5 = f6 * f6;
          f2 = f2 + f5;
          if (f2 < f1) 
          {
            __label__ = 10;
            break 
          }
          else {
            r8 = (r8 + 1) | 0;
          }
        }
        else {
          break 
        }
      }
      r8 = Int64(heapClassInst.heap32[(fp + (-50))]);
      r8 = r8 << 4;
      r8 = (r2 + r8) | 0;
      r8 = r8 >> 2;
      r7 = r7 >> 2;
      heapClassInst.heap32[(r8)] = heapClassInst.heap32[(r7 + 4)];
      heapClassInst.heap32[(r8 + 1)] = heapClassInst.heap32[(r7 + 5)];
      heapClassInst.heap32[(r8 + 2)] = heapClassInst.heap32[(r7 + 6)];
      heapClassInst.heap32[(r8 + 3)] = heapClassInst.heap32[(r7 + 7)];
      f1 = Float64(heapClassInst.heapFloat[(r1 + 32)]);
      f2 = Float64(heapClassInst.heapFloat[(r7 + 4)]);
      f5 = Float64(heapClassInst.heapFloat[(r1 + 33)]);
      f6 = Float64(heapClassInst.heapFloat[(r7 + 5)]);
      f1 = f1 * f2;
      f2 = f5 * f6;
      f5 = Float64(heapClassInst.heapFloat[(r1 + 34)]);
      f6 = Float64(heapClassInst.heapFloat[(r7 + 6)]);
      f1 = f1 + f2;
      f2 = f5 * f6;
      f1 = f1 + f2;
      f1 = f1 / f0;
      f4 = if (f1 > f4) {f1} else {f4};
      f1 = -9.9999997473787516e-005;
      f2 = f0 - f4;
      f0 = f0 * f1;
      f0 = f2 + f0;
      f5 = 0.0;
      if (f0 > f5) 
      {
        heapClassInst.heap32[(fp + (-49))] = 0;
        do {
          if (r5 == 2) 
          {
            r5 = Int64(heapClassInst.heap32[(r6 + 38)]);
            r7 = Int64(heapClassInst.heap32[(r6 + 37)]);
            r7 = (r7 + 16) | 0;
            r5 = (r5 + 16) | 0;
            r8 = sp + (-192);
            r9 = sp + (-196);
            heapClassInst.heap32[(g0)] = Int32(r7);
            heapClassInst.heap32[(g0 + 1)] = Int32(r5);
            heapClassInst.heap32[(g0 + 2)] = Int32(r8);
            heapClassInst.heap32[(g0 + 3)] = Int32(r9);
            _ZN12gjkepa2_impl3GJK13projectoriginERK9btVector3S3_PfRj(i7);
            f3 = commonVariable.f_g0;
            __label__ = 32;
            break 
          }
          else {
            if (r5 == 3) 
            {
              r5 = Int64(heapClassInst.heap32[(r6 + 39)]);
              r7 = Int64(heapClassInst.heap32[(r6 + 38)]);
              r8 = Int64(heapClassInst.heap32[(r6 + 37)]);
              r8 = (r8 + 16) | 0;
              r7 = (r7 + 16) | 0;
              r5 = (r5 + 16) | 0;
              r9 = sp + (-192);
              r10 = sp + (-196);
              heapClassInst.heap32[(g0)] = Int32(r8);
              heapClassInst.heap32[(g0 + 1)] = Int32(r7);
              heapClassInst.heap32[(g0 + 2)] = Int32(r5);
              heapClassInst.heap32[(g0 + 3)] = Int32(r9);
              heapClassInst.heap32[(g0 + 4)] = Int32(r10);
              _ZN12gjkepa2_impl3GJK13projectoriginERK9btVector3S3_S3_PfRj(i7);
              f3 = commonVariable.f_g0;
              __label__ = 32;
            }
            else {
              if (r5 == 4) 
              {
                r5 = Int64(heapClassInst.heap32[(r6 + 40)]);
                r7 = Int64(heapClassInst.heap32[(r6 + 39)]);
                r8 = Int64(heapClassInst.heap32[(r6 + 38)]);
                r9 = Int64(heapClassInst.heap32[(r6 + 37)]);
                r10 = sp + (-16);
                r11 = (r9 + 16) | 0;
                r12 = r10 >> 2;
                r13 = (r8 + 16) | 0;
                heapClassInst.heap32[(fp + (-4))] = Int32(r11);
                r11 = (r7 + 16) | 0;
                heapClassInst.heap32[(r12 + 1)] = Int32(r13);
                r13 = (r5 + 16) | 0;
                heapClassInst.heap32[(r12 + 2)] = Int32(r11);
                r9 = r9 >> 2;
                heapClassInst.heap32[(r12 + 3)] = Int32(r13);
                r5 = r5 >> 2;
                f0 = Float64(heapClassInst.heapFloat[(r9 + 6)]);
                f1 = Float64(heapClassInst.heapFloat[(r5 + 6)]);
                f2 = Float64(heapClassInst.heapFloat[(r9 + 5)]);
                f3 = Float64(heapClassInst.heapFloat[(r5 + 5)]);
                f6 = Float64(heapClassInst.heapFloat[(r9 + 4)]);
                f7 = Float64(heapClassInst.heapFloat[(r5 + 4)]);
                r11 = sp + (-64);
                f8 = f6 - f7;
                f9 = f2 - f3;
                r12 = r11 >> 2;
                heapClassInst.heapFloat[(fp + (-16))] = Float32(f8);
                f10 = f0 - f1;
                heapClassInst.heapFloat[(r12 + 1)] = Float32(f9);
                heapClassInst.heapFloat[(r12 + 2)] = Float32(f10);
                r8 = r8 >> 2;
                heapClassInst.heap32[(r12 + 3)] = 0;
                f11 = Float64(heapClassInst.heapFloat[(r8 + 6)]);
                f12 = Float64(heapClassInst.heapFloat[(r8 + 5)]);
                f13 = Float64(heapClassInst.heapFloat[(r8 + 4)]);
                f14 = f13 - f7;
                f15 = f12 - f3;
                heapClassInst.heapFloat[(r12 + 4)] = Float32(f14);
                f16 = f11 - f1;
                heapClassInst.heapFloat[(r12 + 5)] = Float32(f15);
                heapClassInst.heapFloat[(r12 + 6)] = Float32(f16);
                r7 = r7 >> 2;
                heapClassInst.heap32[(r12 + 7)] = 0;
                f17 = Float64(heapClassInst.heapFloat[(r7 + 5)]);
                f18 = Float64(heapClassInst.heapFloat[(r7 + 4)]);
                f19 = f9 * f16;
                f7 = f18 - f7;
                f20 = f10 * f14;
                f3 = f17 - f3;
                f21 = Float64(heapClassInst.heapFloat[(r7 + 6)]);
                f16 = f8 * f16;
                f19 = f19 * f7;
                f20 = f20 * f3;
                f22 = f11 - f21;
                f23 = f2 - f12;
                f18 = f13 - f18;
                f11 = f0 - f11;
                f12 = f12 - f17;
                f13 = f6 - f13;
                f17 = f19 + f20;
                f16 = f16 * f3;
                f14 = f9 * f14;
                f1 = f21 - f1;
                f19 = f8 * f15;
                f20 = f12 * f11;
                f21 = f22 * f23;
                f22 = f22 * f13;
                f11 = f18 * f11;
                f16 = f17 - f16;
                f14 = f14 * f1;
                f17 = f20 - f21;
                f11 = f22 - f11;
                f15 = f10 * f15;
                heapClassInst.heapFloat[(r12 + 8)] = Float32(f7);
                f18 = f18 * f23;
                f12 = f12 * f13;
                f13 = f16 - f14;
                f14 = f19 * f1;
                f12 = f18 - f12;
                heapClassInst.heapFloat[(r12 + 9)] = Float32(f3);
                f3 = f6 * f17;
                f2 = f2 * f11;
                f6 = f13 + f14;
                f7 = f15 * f7;
                f6 = f6 - f7;
                heapClassInst.heapFloat[(r12 + 10)] = Float32(f1);
                f1 = f3 + f2;
                f0 = f0 * f12;
                f0 = f1 + f0;
                heapClassInst.heap32[(r12 + 11)] = 0;
                f0 = f0 * f6;
                if (f0 > f5) 
                {
                  __label__ = 42;
                  break 
                }
                else {
                  if (f6 < f5) 
                  {
                    f0 = -f6;
                  }
                  else {
                    f0 = f6;
                  }
                  if (f0 <= f5) 
                  {
                    __label__ = 42;
                    break 
                  }
                  else {
                    r12 = sp + (-76);
                    r14 = r12 >> 2;
                    heapClassInst.heap32[(fp + (-19))] = 0;
                    heapClassInst.heap32[(r14 + 1)] = 0;
                    r15 = 0;
                    f3 = ( -1.0);
                    heapClassInst.heap32[(r14 + 2)] = 0;
                    heapClassInst.heap32[(fp + (-20))] = 0;
                    while (true) {
                      r16 = _ZZN12gjkepa2_impl3GJK13projectoriginERK9btVector3S3_S3_PfRjE4imd3;
                      r17 = r15 << 2;
                      r18 = (r16 + r17) | 0;
                      r18 = r18 >> 2;
                      r18 = Int64(heapClassInst.heap32[(r18)]);
                      r19 = r18 << 4;
                      r19 = (r11 + r19) | 0;
                      r19 = r19 >> 2;
                      f0 = Float64(heapClassInst.heapFloat[(r19 + 1)]);
                      f1 = Float64(heapClassInst.heapFloat[(r19 + 2)]);
                      f2 = Float64(heapClassInst.heapFloat[(r19)]);
                      f7 = f9 * f1;
                      f11 = f10 * f0;
                      f10 = f10 * f2;
                      f1 = f8 * f1;
                      f12 = Float64(heapClassInst.heapFloat[(r5 + 4)]);
                      f7 = f7 - f11;
                      f11 = Float64(heapClassInst.heapFloat[(r5 + 5)]);
                      f1 = f10 - f1;
                      f0 = f8 * f0;
                      f2 = f9 * f2;
                      f8 = f12 * f7;
                      f1 = f11 * f1;
                      f9 = Float64(heapClassInst.heapFloat[(r5 + 6)]);
                      f0 = f0 - f2;
                      f1 = f8 + f1;
                      f0 = f9 * f0;
                      f0 = f1 + f0;
                      f0 = f0 * f6;
                      do {
                        if (f0 > f5) 
                        {
                          r19 = r18 << 2;
                          r20 = (r10 + r19) | 0;
                          r21 = (r10 + r17) | 0;
                          r20 = r20 >> 2;
                          r21 = r21 >> 2;
                          r20 = Int64(heapClassInst.heap32[(r20)]);
                          r21 = Int64(heapClassInst.heap32[(r21)]);
                          r22 = sp + (-80);
                          heapClassInst.heap32[(g0)] = Int32(r21);
                          heapClassInst.heap32[(g0 + 1)] = Int32(r20);
                          heapClassInst.heap32[(g0 + 2)] = Int32(r13);
                          heapClassInst.heap32[(g0 + 3)] = Int32(r12);
                          heapClassInst.heap32[(g0 + 4)] = Int32(r22);
                          _ZN12gjkepa2_impl3GJK13projectoriginERK9btVector3S3_S3_PfRj(i7);
                          f0 = commonVariable.f_g0;
                          f1 = 0.0
                          if (!(f3 < f1)) 
                          {
                            if (f0 >= f3) 
                            {
                              break 
                            }
                          }
                          r20 = Int64(heapClassInst.heap32[(fp + (-20))]);
                          r21 = 1;
                          r22 = r20 & 1;
                          r23 = r21 << r15;
                          r25 = r20 & 2;
                          r18 = r21 << r18;
                          r16 = (r16 + r19) | 0;
                          r21 = if (r22 == 0) {r24} else {r23};
                          r18 = if (r25 == 0) {r24} else {r18};
                          r20 = r20 & 4;
                          r22 = 8;
                          r23 = sp + (-192);
                          r16 = r16 >> 2;
                          r18 = (r21 + r18) | 0;
                          r20 = if (r20 == 0) {r24} else {r22};
                          r16 = Int64(heapClassInst.heap32[(r16)]);
                          r17 = (r23 + r17) | 0;
                          r18 = (r18 + r20) | 0;
                          r16 = r16 << 2;
                          r19 = (r23 + r19) | 0;
                          r17 = r17 >> 2;
                          heapClassInst.heap32[(fp + (-49))] = Int32(r18);
                          r16 = (r23 + r16) | 0;
                          r18 = r19 >> 2;
                          heapClassInst.heap32[(r17)] = heapClassInst.heap32[(fp + (-19))];
                          r16 = r16 >> 2;
                          heapClassInst.heap32[(r18)] = heapClassInst.heap32[(r14 + 1)];
                          r17 = r23 >> 2;
                          heapClassInst.heap32[(r16)] = 0;
                          heapClassInst.heap32[(r17 + 3)] = heapClassInst.heap32[(r14 + 2)];
                          f3 = f0;
                        }
                      } while (false);
                      if (r15 == 2) 
                      {
                        break 
                      }
                      else {
                        r16 = (r15 + 1) | 0;
                        r15 = r15 << 4;
                        r15 = (r11 + r15) | 0;
                        r15 = r15 >> 2;
                        f8 = Float64(heapClassInst.heapFloat[(r15 + 4)]);
                        f9 = Float64(heapClassInst.heapFloat[(r15 + 5)]);
                        f10 = Float64(heapClassInst.heapFloat[(r15 + 6)]);
                        r15 = r16;
                      }
                    }
                    if (f3 < f5) 
                    {
                      heapClassInst.heap32[(fp + (-49))] = 15;
                      f0 = Float64(heapClassInst.heapFloat[(r7 + 5)]);
                      f1 = Float64(heapClassInst.heapFloat[(r8 + 6)]);
                      f2 = Float64(heapClassInst.heapFloat[(r8 + 4)]);
                      f3 = Float64(heapClassInst.heapFloat[(r7 + 6)]);
                      f7 = Float64(heapClassInst.heapFloat[(r7 + 4)]);
                      f8 = f0 * f1;
                      f9 = Float64(heapClassInst.heapFloat[(r5 + 4)]);
                      f10 = f3 * f2;
                      f11 = Float64(heapClassInst.heapFloat[(r5 + 5)]);
                      f12 = f7 * f1;
                      f8 = f8 * f9;
                      f10 = f10 * f11;
                      f13 = Float64(heapClassInst.heapFloat[(r8 + 5)]);
                      f14 = Float64(heapClassInst.heapFloat[(r5 + 6)]);
                      f15 = f0 * f2;
                      f8 = f8 + f10;
                      f10 = f12 * f11;
                      f12 = f7 * f13;
                      f8 = f8 - f10;
                      f10 = f15 * f14;
                      f15 = f3 * f13;
                      f8 = f8 - f10;
                      f10 = f12 * f14;
                      f8 = f8 + f10;
                      f10 = f15 * f9;
                      f8 = f8 - f10;
                      f8 = f8 / f6;
                      heapClassInst.heapFloat[(fp + (-48))] = Float32(f8);
                      f10 = Float64(heapClassInst.heapFloat[(r9 + 5)]);
                      f12 = Float64(heapClassInst.heapFloat[(r9 + 6)]);
                      f15 = Float64(heapClassInst.heapFloat[(r9 + 4)]);
                      f16 = f10 * f3;
                      f17 = f12 * f7;
                      f18 = f13 * f12;
                      f19 = f1 * f15;
                      f3 = f15 * f3;
                      f16 = f16 * f9;
                      f17 = f17 * f11;
                      f20 = f2 * f12;
                      f7 = f10 * f7;
                      f18 = f18 * f9;
                      f19 = f19 * f11;
                      f16 = f16 + f17;
                      f3 = f3 * f11;
                      f13 = f13 * f15;
                      f15 = f15 * f0;
                      f17 = f18 + f19;
                      f11 = f20 * f11;
                      f3 = f16 - f3;
                      f7 = f7 * f14;
                      f2 = f2 * f10;
                      f0 = f12 * f0;
                      f11 = f17 - f11;
                      f12 = f13 * f14;
                      f3 = f3 - f7;
                      f7 = f15 * f14;
                      f1 = f1 * f10;
                      f10 = f11 - f12;
                      f2 = f2 * f14;
                      f3 = f3 + f7;
                      f0 = f0 * f9;
                      f0 = f3 - f0;
                      f2 = f10 + f2;
                      f1 = f1 * f9;
                      r5 = sp + (-192);
                      f1 = f2 - f1;
                      f0 = f0 / f6;
                      r5 = r5 >> 2;
                      f2 = f8 + f0;
                      f1 = f1 / f6;
                      heapClassInst.heapFloat[(r5 + 1)] = Float32(f0);
                      f0 = 1.0;
                      f2 = f2 + f1;
                      r7 = 15;
                      f0 = f0 - f2;
                      heapClassInst.heapFloat[(r5 + 2)] = Float32(f1);
                      heapClassInst.heapFloat[(r5 + 3)] = Float32(f0);
                      __label__ = 34;
                    }
                    else {
                      __label__ = 32;
                    }
                  }
                }
              }
              else {
                __label__ = 32;
              }
            }
          }
        } while (false);
        if (__label__ == 32) {
          f0 = 0.0;
          if (f3 < f0) 
          {
            __label__ = 42;
            break 
          }
          else {
            r7 = Int64(heapClassInst.heap32[(fp + (-49))]);
            f5 = f3;
          }
        }
        r5 = Int64(heapClassInst.heap32[(fp + (-51))]);
        r8 = (r5 * 36) | 0;
        r8 = (r0 + r8) | 0;
        r9 = r8 >> 2;
        heapClassInst.heap32[(r9 + 45)] = 0;
        heapClassInst.heap32[(r1 + 32)] = 0;
        heapClassInst.heap32[(r1 + 33)] = 0;
        heapClassInst.heap32[(r1 + 34)] = 0;
        heapClassInst.heap32[(r1 + 35)] = 0;
        heapClassInst.heap32[(r1 + 92)] = Int32(r5);
        r5 = Int64(heapClassInst.heap32[(r6 + 45)]);
        do {
          if (!(r5 == 0)) 
          {
            r6 = Int64(heapClassInst.heap32[(fp + (-52))]);
            r3 = (r6 + r3) | 0;
            r6 = 0;
            while (true) {
              r10 = 1;
              r10 = r10 << r6;
              r10 = r7 & r10;
              if (r10 == 0) 
              {
                r10 = r6 << 2;
                r11 = Int64(heapClassInst.heap32[(r1 + 91)]);
                r10 = (r3 + r10) | 0;
                r12 = r11 << 2;
                r10 = r10 >> 2;
                r12 = (r0 + r12) | 0;
                r10 = Int64(heapClassInst.heap32[(r10)]);
                r12 = r12 >> 2;
                r11 = (r11 + 1) | 0;
                heapClassInst.heap32[(r12 + 87)] = Int32(r10);
                heapClassInst.heap32[(r1 + 91)] = Int32(r11);
              }
              else {
                r10 = r6 << 2;
                r11 = (r3 + r10) | 0;
                r12 = Int64(heapClassInst.heap32[(r9 + 45)]);
                r11 = r11 >> 2;
                r13 = (r8 + 148) | 0;
                r12 = r12 << 2;
                r12 = (r13 + r12) | 0;
                r14 = Int64(heapClassInst.heap32[(r11)]);
                r12 = r12 >> 2;
                r15 = sp + (-192);
                heapClassInst.heap32[(r12)] = Int32(r14);
                r12 = Int64(heapClassInst.heap32[(r9 + 45)]);
                r10 = (r15 + r10) | 0;
                r14 = r12 << 2;
                r10 = r10 >> 2;
                r13 = (r13 + r14) | 0;
                f0 = Float64(heapClassInst.heapFloat[(r10)]);
                r10 = r13 >> 2;
                r12 = (r12 + 1) | 0;
                heapClassInst.heapFloat[(r10 + 4)] = Float32(f0);
                heapClassInst.heap32[(r9 + 45)] = Int32(r12);
                r10 = Int64(heapClassInst.heap32[(r11)]);
                r10 = r10 >> 2;
                f1 = Float64(heapClassInst.heapFloat[(r10 + 4)]);
                f2 = Float64(heapClassInst.heapFloat[(r10 + 6)]);
                f3 = Float64(heapClassInst.heapFloat[(r10 + 5)]);
                f6 = Float64(heapClassInst.heapFloat[(r1 + 32)]);
                f1 = f1 * f0;
                f1 = f6 + f1;
                heapClassInst.heapFloat[(r1 + 32)] = Float32(f1);
                f1 = f3 * f0;
                f3 = Float64(heapClassInst.heapFloat[(r1 + 33)]);
                f1 = f3 + f1;
                heapClassInst.heapFloat[(r1 + 33)] = Float32(f1);
                f0 = f2 * f0;
                f1 = Float64(heapClassInst.heapFloat[(r1 + 34)]);
                f0 = f1 + f0;
                heapClassInst.heapFloat[(r1 + 34)] = Float32(f0);
              }
              r6 = (r6 + 1) | 0;
              if (!(r5 != r6)) 
              {
                break 
              }
            }
          }
        } while (false);
        if (!(r7 != 15)) 
        {
          heapClassInst.heap32[(r1 + 94)] = 1;
        }
        r4 = (r4 + 1) | 0;
        if (`UIntNative`(r4) < `UIntNative`(128)) 
        {
          r3 = Int64(heapClassInst.heap32[(r1 + 94)]);
          if (r3 != 0) 
          {
            __label__ = 47;
            break 
          }
          else {
            r5 = Int64(heapClassInst.heap32[(fp + (-50))]);
            r3 = (r5 + 1) | 0;
            f0 = Float64(heapClassInst.heapFloat[(r1 + 32)]);
            f1 = Float64(heapClassInst.heapFloat[(r1 + 33)]);
            f2 = Float64(heapClassInst.heapFloat[(r1 + 34)]);
            r5 = r3 & 3;
            heapClassInst.heap32[(fp + (-50))] = Int32(r5);
            f3 = f5;
            continue 
          }
        }
        else {
          __label__ = 44;
          break 
        }
      }
      else {
        __label__ = 12;
        break 
      }
    }
    else {
      __label__ = 5;
      break 
    }
  }
  match (__label__) {
    case 10 =>
      r2 = Int64(heapClassInst.heap32[(r1 + 92)]);
      r2 = (r2 * 36) | 0;
      r2 = (r0 + r2) | 0;
      r3 = r2 >> 2;
      r4 = Int64(heapClassInst.heap32[(r3 + 45)]);
      r4 = (r4 + (-1)) | 0;
      r5 = r4 << 2;
      r6 = Int64(heapClassInst.heap32[(r1 + 91)]);
      r2 = (r2 + r5) | 0;
      r5 = r6 << 2;
      r2 = (r2 + 148) | 0;
      r5 = (r0 + r5) | 0;
      r2 = r2 >> 2;
      heapClassInst.heap32[(r3 + 45)] = Int32(r4);
      r3 = r5 >> 2;
      r2 = Int64(heapClassInst.heap32[(r2)]);
      r4 = (r6 + 1) | 0;
      heapClassInst.heap32[(r3 + 87)] = Int32(r2);
      heapClassInst.heap32[(r1 + 91)] = Int32(r4);
    case 42 =>
      r2 = Int64(heapClassInst.heap32[(r1 + 92)]);
      r2 = (r2 * 36) | 0;
      r2 = (r0 + r2) | 0;
      r4 = r2 >> 2;
      r3 = Int64(heapClassInst.heap32[(r4 + 45)]);
      r3 = (r3 + (-1)) | 0;
      r5 = r3 << 2;
      r6 = Int64(heapClassInst.heap32[(r1 + 91)]);
      r2 = (r2 + r5) | 0;
      r5 = r6 << 2;
      r2 = (r2 + 148) | 0;
      r5 = (r0 + r5) | 0;
      r2 = r2 >> 2;
      heapClassInst.heap32[(r4 + 45)] = Int32(r3);
      r4 = r5 >> 2;
      r2 = Int64(heapClassInst.heap32[(r2)]);
      r3 = (r6 + 1) | 0;
      heapClassInst.heap32[(r4 + 87)] = Int32(r2);
      heapClassInst.heap32[(r1 + 91)] = Int32(r3);
    case 5 =>
      heapClassInst.heap32[(r1 + 94)] = 1;
    case 44 =>
      heapClassInst.heap32[(r1 + 94)] = 2;
    case 12 =>
      r2 = Int64(heapClassInst.heap32[(r1 + 92)]);
      r2 = (r2 * 36) | 0;
      r2 = (r0 + r2) | 0;
      r3 = r2 >> 2;
      r4 = Int64(heapClassInst.heap32[(r3 + 45)]);
      r4 = (r4 + (-1)) | 0;
      r5 = r4 << 2;
      r6 = Int64(heapClassInst.heap32[(r1 + 91)]);
      r2 = (r2 + r5) | 0;
      r5 = r6 << 2;
      r2 = (r2 + 148) | 0;
      r5 = (r0 + r5) | 0;
      r2 = r2 >> 2;
      heapClassInst.heap32[(r3 + 45)] = Int32(r4);
      r3 = r5 >> 2;
      r2 = Int64(heapClassInst.heap32[(r2)]);
      r4 = (r6 + 1) | 0;
      heapClassInst.heap32[(r3 + 87)] = Int32(r2);
      heapClassInst.heap32[(r1 + 91)] = Int32(r4);
    case _ =>
      println("break 5147")
  }
  r2 = Int64(heapClassInst.heap32[(r1 + 92)]);
  r2 = (r2 * 36) | 0;
  r0 = (r0 + r2) | 0;
  r0 = (r0 + 148) | 0;
  heapClassInst.heap32[(r1 + 93)] = Int32(r0);
  r0 = Int64(heapClassInst.heap32[(r1 + 94)]);
  if (r0 == 1) 
  {
    heapClassInst.heap32[(r1 + 36)] = 0;
    r0 = 1;
  }
  else {
    if (!(r0 != 0)) 
    {
      f0 = Float64(heapClassInst.heapFloat[(r1 + 32)]);
      f1 = Float64(heapClassInst.heapFloat[(r1 + 33)]);
      f2 = Float64(heapClassInst.heapFloat[(r1 + 34)]);
      f0 = f0 * f0;
      f1 = f1 * f1;
      f0 = f0 + f1;
      f1 = f2 * f2;
      f0 = f0 + f1;
      heapClassInst.heapFloat[(g0)] = Float32(f0);
      sqrtf(i7);
      heapClassInst.heapFloat[(r1 + 36)] = Float32(commonVariable.f_g0);
      r0 = Int64(heapClassInst.heap32[(r1 + 94)]);
      commonVariable.r_g0 = r0;
      return;
    }
  }
  commonVariable.r_g0 = r0;
  return;
}

@OverflowWrapping
func _ZN12gjkepa2_impl3EPA7newfaceEPNS_3GJK3sSVES3_S3_b(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 2450)]);
  do {
    if (r1 == 0) 
    {
      heapClassInst.heap32[(r0)] = 5;
      r1 = 0;
    }
    else {
      r2 = r1 >> 2;
      r3 = Int64(heapClassInst.heap32[(r2 + 13)]);
      if (!(r3 == 0)) 
      {
        r3 = r3 >> 2;
        r4 = Int64(heapClassInst.heap32[(r2 + 12)]);
        heapClassInst.heap32[(r3 + 12)] = Int32(r4);
      }
      r3 = Int64(heapClassInst.heap32[(r2 + 12)]);
      if (!(r3 == 0)) 
      {
        r3 = r3 >> 2;
        r4 = Int64(heapClassInst.heap32[(r2 + 13)]);
        heapClassInst.heap32[(r3 + 13)] = Int32(r4);
      }
      r3 = Int64(heapClassInst.heap32[(r0 + 2450)]);
      if (!(r3 != r1)) 
      {
        r3 = Int64(heapClassInst.heap32[(r2 + 13)]);
        heapClassInst.heap32[(r0 + 2450)] = Int32(r3);
      }
      r3 = Int64(heapClassInst.heap32[(r0 + 2451)]);
      r3 = (r3 + (-1)) | 0;
      heapClassInst.heap32[(r0 + 2451)] = Int32(r3);
      heapClassInst.heap32[(r2 + 12)] = 0;
      r3 = Int64(heapClassInst.heap32[(r0 + 2448)]);
      heapClassInst.heap32[(r2 + 13)] = Int32(r3);
      r3 = Int64(heapClassInst.heap32[(r0 + 2448)]);
      if (!(r3 == 0)) 
      {
        r3 = r3 >> 2;
        heapClassInst.heap32[(r3 + 12)] = Int32(r1);
      }
      r3 = Int64(heapClassInst.heap32[(fp + 1)]);
      r4 = Int64(heapClassInst.heap32[(fp + 2)]);
      r5 = Int64(heapClassInst.heap32[(fp + 3)]);
      heapClassInst.heap32[(r0 + 2448)] = Int32(r1);
      r6 = Int64(heapClassInst.heap32[(r0 + 2449)]);
      r6 = (r6 + 1) | 0;
      r7 = 0;
      heapClassInst.heap32[(r0 + 2449)] = Int32(r6);
      heapClassInst.heap8[r1 + 59] = Int8(r7);
      heapClassInst.heap32[(r2 + 6)] = Int32(r3);
      heapClassInst.heap32[(r2 + 7)] = Int32(r4);
      heapClassInst.heap32[(r2 + 8)] = Int32(r5);
      r5 = r5 >> 2;
      r3 = r3 >> 2;
      r4 = r4 >> 2;
      f0 = Float64(heapClassInst.heapFloat[(r5 + 6)]);
      f1 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
      f2 = Float64(heapClassInst.heapFloat[(r4 + 6)]);
      f3 = Float64(heapClassInst.heapFloat[(r5 + 5)]);
      f4 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
      f5 = Float64(heapClassInst.heapFloat[(r4 + 5)]);
      f5 = f5 - f4;
      f0 = f0 - f1;
      f1 = f2 - f1;
      f2 = f3 - f4;
      f3 = Float64(heapClassInst.heapFloat[(r5 + 4)]);
      f4 = Float64(heapClassInst.heapFloat[(r3 + 4)]);
      f6 = Float64(heapClassInst.heapFloat[(r4 + 4)]);
      f3 = f3 - f4;
      f4 = f6 - f4;
      f6 = f5 * f0;
      f7 = f1 * f2;
      f6 = f6 - f7;
      f1 = f1 * f3;
      f0 = f4 * f0;
      f0 = f1 - f0;
      heapClassInst.heapFloat[(r2)] = Float32(f6);
      f1 = f4 * f2;
      f2 = f5 * f3;
      f1 = f1 - f2;
      heapClassInst.heapFloat[(r2 + 1)] = Float32(f0);
      heapClassInst.heapFloat[(r2 + 2)] = Float32(f1);
      f2 = f6 * f6;
      f0 = f0 * f0;
      heapClassInst.heap32[(r2 + 3)] = 0;
      f0 = f2 + f0;
      f1 = f1 * f1;
      f0 = f0 + f1;
      heapClassInst.heapFloat[(g0)] = Float32(f0);
      sqrtf(i7);
      f0 = commonVariable.f_g0;
      f1 = Float64(heapClassInst.heapFloat[(r5 + 6)]);
      f2 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
      f3 = Float64(heapClassInst.heapFloat[(r4 + 6)]);
      f4 = Float64(heapClassInst.heapFloat[(r5 + 5)]);
      f5 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
      f6 = Float64(heapClassInst.heapFloat[(r4 + 5)]);
      f7 = Float64(heapClassInst.heapFloat[(r5 + 4)]);
      f8 = Float64(heapClassInst.heapFloat[(r3 + 4)]);
      f9 = Float64(heapClassInst.heapFloat[(r4 + 4)]);
      f10 = Float64(heapClassInst.heapFloat[(r2)]);
      f11 = f2 - f3;
      f12 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
      f13 = f3 - f1;
      f14 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
      f15 = f5 - f6;
      f16 = f8 - f9;
      f17 = f6 - f4;
      f18 = f9 - f7;
      f19 = f1 - f2;
      f20 = f4 - f5;
      f21 = f7 - f8;
      f22 = f12 * f11;
      f23 = f14 * f15;
      f24 = f14 * f16;
      f11 = f10 * f11;
      f25 = f12 * f13;
      f26 = f14 * f17;
      f27 = f14 * f18;
      f13 = f10 * f13;
      f22 = f22 - f23;
      f11 = f24 - f11;
      f23 = f25 - f26;
      f13 = f27 - f13;
      f15 = f10 * f15;
      f16 = f12 * f16;
      f17 = f10 * f17;
      f18 = f12 * f18;
      f24 = f12 * f19;
      f25 = f14 * f20;
      f26 = f14 * f21;
      f19 = f10 * f19;
      f15 = f15 - f16;
      f16 = f17 - f18;
      f17 = f24 - f25;
      f18 = f26 - f19;
      f8 = f8 * f22;
      f5 = f5 * f11;
      f9 = f9 * f23;
      f6 = f6 * f13;
      f11 = f10 * f20;
      f13 = f12 * f21;
      f11 = f11 - f13;
      f5 = f8 + f5;
      f2 = f2 * f15;
      f6 = f9 + f6;
      f3 = f3 * f16;
      f7 = f7 * f17;
      f4 = f4 * f18;
      f2 = f5 + f2;
      f3 = f6 + f3;
      f4 = f7 + f4;
      f1 = f1 * f11;
      f5 = 9.9999997473787516e-005;
      f6 = 1.0;
      f2 = if (f2 < f3) {f2} else {f3};
      f1 = f4 + f1;
      f1 = if (f2 < f1) {f2} else {f1};
      f2 = if (f0 > f5) {f0} else {f6};
      f1 = f1 / f2;
      f2 = -0.0099999997764825821;
      f3 = 0.0;
      f1 = if (f1 < f2) {f1} else {f3};
      heapClassInst.heapFloat[(r2 + 5)] = Float32(f1);
      if (f0 <= f5) 
      {
        heapClassInst.heap32[(r0)] = 2;
      }
      else {
        r4 = Int64(heapClassInst.heap32[(fp + 4)]);
        f1 = Float64(heapClassInst.heapFloat[(r3 + 4)]);
        f2 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
        f3 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
        f1 = f1 * f10;
        f2 = f2 * f12;
        f1 = f1 + f2;
        f2 = f3 * f14;
        f1 = f1 + f2;
        f2 = f6 / f0;
        f0 = f1 / f0;
        f1 = f10 * f2;
        heapClassInst.heapFloat[(r2 + 4)] = Float32(f0);
        f3 = f12 * f2;
        heapClassInst.heapFloat[(r2)] = Float32(f1);
        f1 = f14 * f2;
        heapClassInst.heapFloat[(r2 + 1)] = Float32(f3);
        heapClassInst.heapFloat[(r2 + 2)] = Float32(f1);
        if (r4 != 0) 
        {
          break 
        }
        else {
          f1 = -9.9999997473787516e-006;
          if (f0 >= f1) 
          {
            break 
          }
          else {
            heapClassInst.heap32[(r0)] = 3;
          }
        }
      }
      r3 = Int64(heapClassInst.heap32[(r2 + 13)]);
      if (!(r3 == 0)) 
      {
        r3 = r3 >> 2;
        r4 = Int64(heapClassInst.heap32[(r2 + 12)]);
        heapClassInst.heap32[(r3 + 12)] = Int32(r4);
      }
      r3 = Int64(heapClassInst.heap32[(r2 + 12)]);
      if (!(r3 == 0)) 
      {
        r3 = r3 >> 2;
        r4 = Int64(heapClassInst.heap32[(r2 + 13)]);
        heapClassInst.heap32[(r3 + 13)] = Int32(r4);
      }
      r3 = Int64(heapClassInst.heap32[(r0 + 2448)]);
      if (!(r3 != r1)) 
      {
        r3 = Int64(heapClassInst.heap32[(r2 + 13)]);
        heapClassInst.heap32[(r0 + 2448)] = Int32(r3);
      }
      r3 = Int64(heapClassInst.heap32[(r0 + 2449)]);
      r3 = (r3 + (-1)) | 0;
      heapClassInst.heap32[(r0 + 2449)] = Int32(r3);
      heapClassInst.heap32[(r2 + 12)] = 0;
      r3 = Int64(heapClassInst.heap32[(r0 + 2450)]);
      heapClassInst.heap32[(r2 + 13)] = Int32(r3);
      r2 = Int64(heapClassInst.heap32[(r0 + 2450)]);
      if (!(r2 == 0)) 
      {
        r2 = r2 >> 2;
        heapClassInst.heap32[(r2 + 12)] = Int32(r1);
      }
      heapClassInst.heap32[(r0 + 2450)] = Int32(r1);
      r1 = Int64(heapClassInst.heap32[(r0 + 2451)]);
      r1 = (r1 + 1) | 0;
      heapClassInst.heap32[(r0 + 2451)] = Int32(r1);
      r0 = 0;
      commonVariable.r_g0 = r0;
      return;
    }
  } while (false);
  commonVariable.r_g0 = r1;
  return;
}

@OverflowWrapping
func _ZN12gjkepa2_impl3EPA6expandEjPNS_3GJK3sSVEPNS0_5sFaceEjRNS0_8sHorizonE(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  var __label__ = 0;
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 3)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = Int64(heapClassInst.heapU8[r0 + 59]);
  do {
    if (!(r2 == r1)) 
    {
      r2 = Int64(heapClassInst.heap32[(fp)]);
      r3 = Int64(heapClassInst.heap32[(fp + 2)]);
      r4 = Int64(heapClassInst.heap32[(fp + 4)]);
      r5 = Int64(heapClassInst.heap32[(fp + 5)]);
      r6 = r0 >> 2;
      r7 = r3 >> 2;
      f0 = Float64(heapClassInst.heapFloat[(r6)]);
      f1 = Float64(heapClassInst.heapFloat[(r7 + 4)]);
      f2 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
      f3 = Float64(heapClassInst.heapFloat[(r7 + 5)]);
      r8 = _ZZN12gjkepa2_impl3GJK13projectoriginERK9btVector3S3_S3_PfRjE4imd3;
      r9 = r4 << 2;
      r8 = (r8 + r9) | 0;
      f0 = f0 * f1;
      f1 = f2 * f3;
      f2 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
      f3 = Float64(heapClassInst.heapFloat[(r7 + 6)]);
      r7 = r8 >> 2;
      f0 = f0 + f1;
      f1 = f2 * f3;
      r7 = Int64(heapClassInst.heap32[(r7)]);
      f0 = f0 + f1;
      f1 = Float64(heapClassInst.heapFloat[(r6 + 4)]);
      f0 = f0 - f1;
      f1 = -9.9999997473787516e-006;
      if (f0 >= f1) 
      {
        r4 = r7 << 2;
        r4 = (r0 + r4) | 0;
        r7 = (r0 + r7) | 0;
        heapClassInst.heap8[r0 + 59] = Int8(r1);
        r4 = r4 >> 2;
        r7 = Int64(heapClassInst.heapU8[r7 + 56]);
        r4 = Int64(heapClassInst.heap32[(r4 + 9)]);
        r8 = _ZZN12gjkepa2_impl3EPA6expandEjPNS_3GJK3sSVEPNS0_5sFaceEjRNS0_8sHorizonEE4i2m3;
        r8 = (r8 + r9) | 0;
        r8 = r8 >> 2;
        heapClassInst.heap32[(g0)] = Int32(r2);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = Int32(r3);
        heapClassInst.heap32[(g0 + 3)] = Int32(r4);
        heapClassInst.heap32[(g0 + 4)] = Int32(r7);
        heapClassInst.heap32[(g0 + 5)] = Int32(r5);
        r4 = Int64(heapClassInst.heap32[(r8)]);
        _ZN12gjkepa2_impl3EPA6expandEjPNS_3GJK3sSVEPNS0_5sFaceEjRNS0_8sHorizonE(i7);
        r7 = commonVariable.r_g0;
        if (r7 == 0) 
        {
          break 
        }
        else {
          r7 = r4 << 2;
          r7 = (r0 + r7) | 0;
          r4 = (r0 + r4) | 0;
          r7 = r7 >> 2;
          r4 = Int64(heapClassInst.heapU8[r4 + 56]);
          r7 = Int64(heapClassInst.heap32[(r7 + 9)]);
          heapClassInst.heap32[(g0)] = Int32(r2);
          heapClassInst.heap32[(g0 + 1)] = Int32(r1);
          heapClassInst.heap32[(g0 + 2)] = Int32(r3);
          heapClassInst.heap32[(g0 + 3)] = Int32(r7);
          heapClassInst.heap32[(g0 + 4)] = Int32(r4);
          heapClassInst.heap32[(g0 + 5)] = Int32(r5);
          _ZN12gjkepa2_impl3EPA6expandEjPNS_3GJK3sSVEPNS0_5sFaceEjRNS0_8sHorizonE(i7);
          r1 = commonVariable.r_g0;
          if (r1 != 0) 
          {
            r1 = Int64(heapClassInst.heap32[(r6 + 13)]);
            if (!(r1 == 0)) 
            {
              r1 = r1 >> 2;
              r3 = Int64(heapClassInst.heap32[(r6 + 12)]);
              heapClassInst.heap32[(r1 + 12)] = Int32(r3);
            }
            r1 = Int64(heapClassInst.heap32[(r6 + 12)]);
            if (!(r1 == 0)) 
            {
              r1 = r1 >> 2;
              r3 = Int64(heapClassInst.heap32[(r6 + 13)]);
              heapClassInst.heap32[(r1 + 13)] = Int32(r3);
            }
            r1 = r2 >> 2;
            r2 = Int64(heapClassInst.heap32[(r1 + 2448)]);
            if (!(r2 != r0)) 
            {
              r2 = Int64(heapClassInst.heap32[(r6 + 13)]);
              heapClassInst.heap32[(r1 + 2448)] = Int32(r2);
            }
            r2 = Int64(heapClassInst.heap32[(r1 + 2449)]);
            r2 = (r2 + (-1)) | 0;
            heapClassInst.heap32[(r1 + 2449)] = Int32(r2);
            heapClassInst.heap32[(r6 + 12)] = 0;
            r2 = Int64(heapClassInst.heap32[(r1 + 2450)]);
            heapClassInst.heap32[(r6 + 13)] = Int32(r2);
            r2 = Int64(heapClassInst.heap32[(r1 + 2450)]);
            if (!(r2 == 0)) 
            {
              r2 = r2 >> 2;
              heapClassInst.heap32[(r2 + 12)] = Int32(r0);
            }
            heapClassInst.heap32[(r1 + 2450)] = Int32(r0);
            r0 = Int64(heapClassInst.heap32[(r1 + 2451)]);
            r0 = (r0 + 1) | 0;
            heapClassInst.heap32[(r1 + 2451)] = Int32(r0);
          }
          else {
            break 
          }
        }
      }
      else {
        r1 = (r0 + 24) | 0;
        r6 = r7 << 2;
        r7 = (r1 + r9) | 0;
        r1 = (r1 + r6) | 0;
        r6 = r7 >> 2;
        r1 = r1 >> 2;
        r6 = Int64(heapClassInst.heap32[(r6)]);
        r1 = Int64(heapClassInst.heap32[(r1)]);
        heapClassInst.heap32[(g0)] = Int32(r2);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = Int32(r6);
        heapClassInst.heap32[(g0 + 3)] = Int32(r3);
        heapClassInst.heap32[(g0 + 4)] = 0;
        _ZN12gjkepa2_impl3EPA7newfaceEPNS_3GJK3sSVES3_S3_b(i7);
        r1 = commonVariable.r_g0;
        if (r1 == 0) 
        {
          break 
        }
        else {
          r2 = r1 >> 2;
          heapClassInst.heap8[r1 + 56] = Int8(r4);
          r3 = (r0 + r9) | 0;
          r6 = (r0 + r4) | 0;
          r7 = 0;
          heapClassInst.heap32[(r2 + 9)] = Int32(r0);
          r0 = r3 >> 2;
          heapClassInst.heap8[r6 + 56] = Int8(r7);
          r3 = r5 >> 2;
          heapClassInst.heap32[(r0 + 9)] = Int32(r1);
          r0 = Int64(heapClassInst.heap32[(r3)]);
          if (r0 == 0) 
          {
            heapClassInst.heap32[(r3 + 1)] = Int32(r1);
          }
          else {
            r5 = 2;
            r6 = r0 >> 2;
            heapClassInst.heap8[r0 + 57] = Int8(r5);
            r5 = 1;
            heapClassInst.heap32[(r6 + 10)] = Int32(r1);
            heapClassInst.heap8[r1 + 58] = Int8(r5);
            heapClassInst.heap32[(r2 + 11)] = Int32(r0);
          }
          heapClassInst.heap32[(r3)] = Int32(r1);
          r0 = Int64(heapClassInst.heap32[(r3 + 2)]);
          r0 = (r0 + 1) | 0;
          heapClassInst.heap32[(r3 + 2)] = Int32(r0);
        }
      }
      r0 = 1;
      commonVariable.r_g0 = r0;
      return;
    }
  } while (false);
  r0 = 0;
  commonVariable.r_g0 = r0;
  return;
}

@OverflowWrapping
func _ZN15btGjkEpaSolver211PenetrationEPK13btConvexShapeRK11btTransformS2_S5_RK9btVector3RNS_8sResultsEb(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  var __label__ = 0;
  i7 = sp + (-10400); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp + 5)]);
  r2 = Int64(heapClassInst.heap32[(fp)]);
  r3 = Int64(heapClassInst.heap32[(fp + 2)]);
  r4 = Int64(heapClassInst.heap32[(fp + 3)]);
  r5 = sp + (-176);
  r6 = Int64(heapClassInst.heap32[(fp + 6)]);
  heapClassInst.heap32[(g0)] = Int32(r2);
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  heapClassInst.heap32[(g0 + 2)] = Int32(r3);
  heapClassInst.heap32[(g0 + 3)] = Int32(r4);
  heapClassInst.heap32[(g0 + 4)] = Int32(r1);
  heapClassInst.heap32[(g0 + 5)] = Int32(r5);
  heapClassInst.heap32[(g0 + 6)] = Int32(r6);
  r2 = sp + (-560);
  r3 = r2 >> 2;
  _ZN12gjkepa2_implL10InitializeEPK13btConvexShapeRK11btTransformS2_S5_RN15btGjkEpaSolver28sResultsERNS_13MinkowskiDiffEb(i7);
  heapClassInst.heap32[(r3 + 32)] = 0;
  heapClassInst.heap32[(r3 + 33)] = 0;
  heapClassInst.heap32[(r3 + 34)] = 0;
  heapClassInst.heap32[(r3 + 35)] = 0;
  heapClassInst.heap32[(r3 + 91)] = 0;
  heapClassInst.heap32[(r3 + 94)] = 2;
  r4 = Int64(heapClassInst.heap32[(fp + 4)]);
  heapClassInst.heap32[(r3 + 92)] = 0;
  r4 = r4 >> 2;
  heapClassInst.heap32[(r3 + 36)] = 0;
  f0 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
  f1 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
  f2 = Float64(heapClassInst.heapFloat[(r4)]);
  r6 = sp + (-48);
  f2 = -f2;
  r7 = r6 >> 2;
  f1 = -f1;
  heapClassInst.heapFloat[(fp + (-12))] = Float32(f2);
  f0 = -f0;
  heapClassInst.heapFloat[(r7 + 1)] = Float32(f1);
  heapClassInst.heapFloat[(r7 + 2)] = Float32(f0);
  heapClassInst.heap32[(r7 + 3)] = 0;
  heapClassInst.heap32[(g0)] = Int32(r2);
  heapClassInst.heap32[(g0 + 1)] = Int32(r5);
  heapClassInst.heap32[(g0 + 2)] = Int32(r6);
  _ZN12gjkepa2_impl3GJK8EvaluateERKNS_13MinkowskiDiffERK9btVector3(i7);
  r6 = commonVariable.r_g0;
  if (r6 == 2) 
  {
    r0 = r1 >> 2;
    heapClassInst.heap32[(r0)] = 2;
  }
  else {
    if (!(r6 != 1)) 
    {
      r6 = sp + (-10368);
      r7 = r6 >> 2;
      heapClassInst.heap32[(r7 + 2448)] = 0;
      heapClassInst.heap32[(r7 + 2449)] = 0;
      heapClassInst.heap32[(r7 + 2450)] = 0;
      heapClassInst.heap32[(r7 + 2451)] = 0;
      heapClassInst.heap32[(fp + (-2592))] = 9;
      heapClassInst.heap32[(r7 + 10)] = 0;
      heapClassInst.heap32[(r7 + 11)] = 0;
      heapClassInst.heap32[(r7 + 12)] = 0;
      heapClassInst.heap32[(r7 + 13)] = 0;
      r8 = 0;
      r9 = (r6 + 9780) | 0;
      r10 = (r6 + 9728) | 0;
      heapClassInst.heap32[(r7 + 14)] = 0;
      heapClassInst.heap32[(r7 + 2447)] = 0;
      r11 = r8;
      r12 = r8;
      r13 = r8;
      while (true) {
        r14 = 127;
        r14 = (r14 - r13) | 0;
        r15 = (r9 + r8) | 0;
        r14 = (r14 * 60) | 0;
        r14 = (r6 + r14) | 0;
        r15 = r15 >> 2;
        r14 = (r14 + 2108) | 0;
        r16 = (r10 + r8) | 0;
        heapClassInst.heap32[(r15 + (-1))] = 0;
        heapClassInst.heap32[(r15)] = Int32(r12);
        if (r12 != 0) 
        {
          r11 = r12 >> 2;
          heapClassInst.heap32[(r11 + 12)] = Int32(r16);
          r11 = Int64(heapClassInst.heap32[(r7 + 2451)]);
        }
        r8 = (r8 + (-60)) | 0;
        r13 = (r13 + 1) | 0;
        r11 = (r11 + 1) | 0;
        heapClassInst.heap32[(r7 + 2450)] = Int32(r16);
        heapClassInst.heap32[(r7 + 2451)] = Int32(r11);
        r12 = r14;
        if (!(r8 != ( -7680))) 
        {
          break 
        }
      }
      r3 = Int64(heapClassInst.heap32[(r3 + 93)]);
      f0 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
      f1 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
      f2 = Float64(heapClassInst.heapFloat[(r4)]);
      r3 = r3 >> 2;
      r4 = Int64(heapClassInst.heap32[(r3 + 8)]);
      if (`UIntNative`(r4) < `UIntNative`(2)) 
      {
        __label__ = 56;
      }
      else {
        heapClassInst.heap32[(g0)] = Int32(r2);
        _ZN12gjkepa2_impl3GJK13EncloseOriginEv(i7);
        r4 = commonVariable.r_g0;
        if (r4 == 0) 
        {
          __label__ = 56;
        }
        else {
          r4 = Int64(heapClassInst.heap32[(r7 + 2448)]);
          do {
            if (!(r4 == 0)) 
            {
              while (true) {
                r8 = r4 >> 2;
                r9 = Int64(heapClassInst.heap32[(r8 + 13)]);
                if (!(r9 == 0)) 
                {
                  r9 = r9 >> 2;
                  r10 = Int64(heapClassInst.heap32[(r8 + 12)]);
                  heapClassInst.heap32[(r9 + 12)] = Int32(r10);
                }
                r9 = Int64(heapClassInst.heap32[(r8 + 12)]);
                if (!(r9 == 0)) 
                {
                  r9 = r9 >> 2;
                  r10 = Int64(heapClassInst.heap32[(r8 + 13)]);
                  heapClassInst.heap32[(r9 + 13)] = Int32(r10);
                }
                r9 = Int64(heapClassInst.heap32[(r7 + 2448)]);
                if (!(r9 != r4)) 
                {
                  r9 = Int64(heapClassInst.heap32[(r8 + 13)]);
                  heapClassInst.heap32[(r7 + 2448)] = Int32(r9);
                }
                r9 = Int64(heapClassInst.heap32[(r7 + 2449)]);
                r9 = (r9 + (-1)) | 0;
                heapClassInst.heap32[(r7 + 2449)] = Int32(r9);
                heapClassInst.heap32[(r8 + 12)] = 0;
                r9 = Int64(heapClassInst.heap32[(r7 + 2450)]);
                heapClassInst.heap32[(r8 + 13)] = Int32(r9);
                r8 = Int64(heapClassInst.heap32[(r7 + 2450)]);
                if (!(r8 == 0)) 
                {
                  r8 = r8 >> 2;
                  heapClassInst.heap32[(r8 + 12)] = Int32(r4);
                }
                heapClassInst.heap32[(r7 + 2450)] = Int32(r4);
                r4 = Int64(heapClassInst.heap32[(r7 + 2451)]);
                r4 = (r4 + 1) | 0;
                heapClassInst.heap32[(r7 + 2451)] = Int32(r4);
                r4 = Int64(heapClassInst.heap32[(r7 + 2448)]);
                if (!(r4 != 0)) 
                {
                  break 
                }
              }
            }
          } while (false);
          heapClassInst.heap32[(fp + (-2592))] = 0;
          heapClassInst.heap32[(r7 + 2447)] = 0;
          r4 = Int64(heapClassInst.heap32[(r3 + 1)]);
          r8 = Int64(heapClassInst.heap32[(r3)]);
          r9 = Int64(heapClassInst.heap32[(r3 + 3)]);
          r10 = r8 >> 2;
          r11 = r4 >> 2;
          r9 = r9 >> 2;
          r12 = Int64(heapClassInst.heap32[(r3 + 2)]);
          r13 = r12 >> 2;
          f3 = Float64(heapClassInst.heapFloat[(r11 + 6)]);
          f4 = Float64(heapClassInst.heapFloat[(r9 + 6)]);
          f5 = Float64(heapClassInst.heapFloat[(r10 + 6)]);
          f6 = Float64(heapClassInst.heapFloat[(r10 + 5)]);
          f7 = Float64(heapClassInst.heapFloat[(r9 + 5)]);
          f8 = Float64(heapClassInst.heapFloat[(r11 + 4)]);
          f9 = Float64(heapClassInst.heapFloat[(r9 + 4)]);
          f10 = Float64(heapClassInst.heapFloat[(r13 + 5)]);
          f11 = Float64(heapClassInst.heapFloat[(r10 + 4)]);
          f12 = Float64(heapClassInst.heapFloat[(r13 + 4)]);
          f3 = f3 - f4;
          f6 = f6 - f7;
          f8 = f8 - f9;
          f5 = f5 - f4;
          f11 = f11 - f9;
          f13 = f6 * f3;
          f9 = f12 - f9;
          f12 = f5 * f8;
          f10 = f10 - f7;
          f3 = f11 * f3;
          f14 = Float64(heapClassInst.heapFloat[(r13 + 6)]);
          f15 = Float64(heapClassInst.heapFloat[(r11 + 5)]);
          f13 = f13 * f9;
          f12 = f12 * f10;
          f7 = f15 - f7;
          f12 = f13 + f12;
          f3 = f3 * f10;
          f6 = f6 * f8;
          f4 = f14 - f4;
          f8 = f11 * f7;
          f3 = f12 - f3;
          f6 = f6 * f4;
          f5 = f5 * f7;
          f3 = f3 - f6;
          f4 = f8 * f4;
          f3 = f3 + f4;
          f4 = f5 * f9;
          f3 = f3 - f4;
          f4 = 0.0;
          if (f3 < f4) 
          {
            heapClassInst.heap32[(r3)] = Int32(r4);
            heapClassInst.heap32[(r3 + 1)] = Int32(r8);
            f3 = Float64(heapClassInst.heapFloat[(r3 + 4)]);
            heapClassInst.heap32[(r3 + 4)] = heapClassInst.heap32[(r3 + 5)];
            heapClassInst.heapFloat[(r3 + 5)] = Float32(f3);
            r9 = r4;
            r4 = r8;
          }
          else {
            r9 = r8;
          }
          heapClassInst.heap32[(g0)] = Int32(r6);
          heapClassInst.heap32[(g0 + 1)] = Int32(r9);
          heapClassInst.heap32[(g0 + 2)] = Int32(r4);
          heapClassInst.heap32[(g0 + 3)] = Int32(r12);
          heapClassInst.heap32[(g0 + 4)] = 1;
          _ZN12gjkepa2_impl3EPA7newfaceEPNS_3GJK3sSVES3_S3_b(i7);
          r4 = commonVariable.r_g0;
          r8 = Int64(heapClassInst.heap32[(r3 + 3)]);
          r9 = Int64(heapClassInst.heap32[(r3)]);
          r10 = Int64(heapClassInst.heap32[(r3 + 1)]);
          heapClassInst.heap32[(g0)] = Int32(r6);
          heapClassInst.heap32[(g0 + 1)] = Int32(r10);
          heapClassInst.heap32[(g0 + 2)] = Int32(r9);
          heapClassInst.heap32[(g0 + 3)] = Int32(r8);
          heapClassInst.heap32[(g0 + 4)] = 1;
          _ZN12gjkepa2_impl3EPA7newfaceEPNS_3GJK3sSVES3_S3_b(i7);
          r8 = commonVariable.r_g0;
          r9 = Int64(heapClassInst.heap32[(r3 + 3)]);
          r10 = Int64(heapClassInst.heap32[(r3 + 1)]);
          r11 = Int64(heapClassInst.heap32[(r3 + 2)]);
          heapClassInst.heap32[(g0)] = Int32(r6);
          heapClassInst.heap32[(g0 + 1)] = Int32(r11);
          heapClassInst.heap32[(g0 + 2)] = Int32(r10);
          heapClassInst.heap32[(g0 + 3)] = Int32(r9);
          heapClassInst.heap32[(g0 + 4)] = 1;
          _ZN12gjkepa2_impl3EPA7newfaceEPNS_3GJK3sSVES3_S3_b(i7);
          r9 = commonVariable.r_g0;
          r10 = Int64(heapClassInst.heap32[(r3 + 3)]);
          r11 = Int64(heapClassInst.heap32[(r3 + 2)]);
          r12 = Int64(heapClassInst.heap32[(r3)]);
          heapClassInst.heap32[(g0)] = Int32(r6);
          heapClassInst.heap32[(g0 + 1)] = Int32(r12);
          heapClassInst.heap32[(g0 + 2)] = Int32(r11);
          heapClassInst.heap32[(g0 + 3)] = Int32(r10);
          heapClassInst.heap32[(g0 + 4)] = 1;
          _ZN12gjkepa2_impl3EPA7newfaceEPNS_3GJK3sSVES3_S3_b(i7);
          r10 = commonVariable.r_g0;
          r11 = Int64(heapClassInst.heap32[(r7 + 2449)]);
          if (r11 != 4) 
          {
            __label__ = 56;
          }
          else {
            r3 = Int64(heapClassInst.heap32[(r7 + 2448)]);
            r11 = r3 >> 2;
            f0 = Float64(heapClassInst.heapFloat[(r11 + 4)]);
            f0 = f0 * f0;
            f1 = Float64(heapClassInst.heapFloat[(r11 + 5)]);
            while (true) {
              f2 = f1;
              r11 = r3;
              f3 = f0;
              while (true) {
                r3 = r3 >> 2;
                r3 = Int64(heapClassInst.heap32[(r3 + 13)]);
                if (r3 != 0) 
                {
                  r12 = r3 >> 2;
                  f1 = Float64(heapClassInst.heapFloat[(r12 + 5)]);
                  if (!(f1 < f2)) 
                  {
                    f0 = Float64(heapClassInst.heapFloat[(r12 + 4)]);
                    f0 = f0 * f0;
                    if (!(f0 >= f3)) 
                    {
                      continue 
                    }
                  }
                }
                else {
                  break 
                }
              }
            }
            r3 = r11 >> 2;
            f0 = Float64(heapClassInst.heapFloat[(r3)]);
            f1 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
            f2 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
            f3 = Float64(heapClassInst.heapFloat[(r3 + 3)]);
            f4 = Float64(heapClassInst.heapFloat[(r3 + 4)]);
            f5 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
            r12 = Int64(heapClassInst.heap32[(r3 + 6)]);
            r13 = Int64(heapClassInst.heap32[(r3 + 7)]);
            r3 = Int64(heapClassInst.heap32[(r3 + 8)]);
            r14 = 0;
            r15 = r4 >> 2;
            heapClassInst.heap8[r4 + 56] = Int8(r14);
            heapClassInst.heap32[(r15 + 9)] = Int32(r8);
            r16 = r8 >> 2;
            heapClassInst.heap8[r8 + 56] = Int8(r14);
            heapClassInst.heap32[(r16 + 9)] = Int32(r4);
            heapClassInst.heap8[r4 + 57] = Int8(r14);
            r17 = 1;
            heapClassInst.heap32[(r15 + 10)] = Int32(r9);
            r18 = r9 >> 2;
            heapClassInst.heap8[r9 + 56] = Int8(r17);
            heapClassInst.heap32[(r18 + 9)] = Int32(r4);
            heapClassInst.heap8[r4 + 58] = Int8(r14);
            r19 = 2;
            heapClassInst.heap32[(r15 + 11)] = Int32(r10);
            r15 = r10 >> 2;
            heapClassInst.heap8[r10 + 56] = Int8(r19);
            heapClassInst.heap32[(r15 + 9)] = Int32(r4);
            heapClassInst.heap8[r8 + 57] = Int8(r19);
            heapClassInst.heap32[(r16 + 10)] = Int32(r10);
            heapClassInst.heap8[r10 + 58] = Int8(r17);
            heapClassInst.heap32[(r15 + 11)] = Int32(r8);
            heapClassInst.heap8[r8 + 58] = Int8(r17);
            heapClassInst.heap32[(r16 + 11)] = Int32(r9);
            heapClassInst.heap8[r9 + 57] = Int8(r19);
            heapClassInst.heap32[(r18 + 10)] = Int32(r8);
            heapClassInst.heap8[r9 + 58] = Int8(r17);
            heapClassInst.heap32[(r18 + 11)] = Int32(r10);
            heapClassInst.heap8[r10 + 57] = Int8(r19);
            heapClassInst.heap32[(r15 + 10)] = Int32(r9);
            heapClassInst.heap32[(fp + (-2592))] = 0;
            while (true) {
              r4 = (r14 + 1) | 0;
              while (true) {
                if (`UIntNative`(r14) < `UIntNative`(255)) 
                {
                  r8 = Int64(heapClassInst.heap32[(r7 + 2447)]);
                  if (`UIntNative`(r8) > `UIntNative`(63)) 
                  {
                    __label__ = 53;
                    break 
                  }
                  else {
                    r9 = sp + (-16);
                    r10 = r9 >> 2;
                    heapClassInst.heap32[(fp + (-4))] = 0;
                    heapClassInst.heap32[(r10 + 1)] = 0;
                    r15 = (r8 + 1) | 0;
                    heapClassInst.heap32[(r10 + 2)] = 0;
                    r8 = r8 << 5;
                    heapClassInst.heap32[(r7 + 2447)] = Int32(r15);
                    r8 = (r6 + r8) | 0;
                    heapClassInst.heap8[r11 + 59] = Int8(r4);
                    r15 = (r8 + 60) | 0;
                    heapClassInst.heap32[(g0)] = Int32(r2);
                    heapClassInst.heap32[(g0 + 1)] = Int32(r11);
                    heapClassInst.heap32[(g0 + 2)] = Int32(r15);
                    r8 = r8 >> 2;
                    _ZNK12gjkepa2_impl3GJK10getsupportERK9btVector3RNS0_3sSVE(i7);
                    r16 = r11 >> 2;
                    f6 = Float64(heapClassInst.heapFloat[(r16)]);
                    f7 = Float64(heapClassInst.heapFloat[(r8 + 19)]);
                    f8 = Float64(heapClassInst.heapFloat[(r16 + 1)]);
                    f9 = Float64(heapClassInst.heapFloat[(r8 + 20)]);
                    f6 = f6 * f7;
                    f7 = f8 * f9;
                    f8 = Float64(heapClassInst.heapFloat[(r16 + 2)]);
                    f9 = Float64(heapClassInst.heapFloat[(r8 + 21)]);
                    f6 = f6 + f7;
                    f7 = f8 * f9;
                    f6 = f6 + f7;
                    f7 = Float64(heapClassInst.heapFloat[(r16 + 4)]);
                    f6 = f6 - f7;
                    f7 = 9.9999997473787516e-005;
                    if (f6 <= f7) 
                    {
                      __label__ = 52;
                      break 
                    }
                    else {
                      r14 = (r14 + 1) | 0;
                      r8 = (r11 + 1) | 0;
                      r18 = 0;
                      r20 = r17;
                      while (true) {
                        r21 = r18 << 2;
                        r21 = (r11 + r21) | 0;
                        r22 = (r8 + r18) | 0;
                        r21 = r21 >> 2;
                        r22 = Int64(heapClassInst.heapU8[r22 + 55]);
                        r21 = Int64(heapClassInst.heap32[(r21 + 9)]);
                        heapClassInst.heap32[(g0)] = Int32(r6);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r14);
                        heapClassInst.heap32[(g0 + 2)] = Int32(r15);
                        heapClassInst.heap32[(g0 + 3)] = Int32(r21);
                        heapClassInst.heap32[(g0 + 4)] = Int32(r22);
                        heapClassInst.heap32[(g0 + 5)] = Int32(r9);
                        _ZN12gjkepa2_impl3EPA6expandEjPNS_3GJK3sSVEPNS0_5sFaceEjRNS0_8sHorizonE(i7);
                        r18 = (r18 + 1) | 0;
                        r20 = commonVariable.r_g0 & r20;
                        if (`UIntNative`(r18) > `UIntNative`(2)) 
                        {
                          break 
                        }
                        else {
                          if (!(r20 != 0)) 
                          {
                            break 
                          }
                        }
                      }
                      if (r20 != 1) 
                      {
                        __label__ = 51;
                        break 
                      }
                      else {
                        r8 = Int64(heapClassInst.heap32[(r10 + 2)]);
                        if (`UIntNative`(r8) < `UIntNative`(3)) 
                        {
                          __label__ = 51;
                          break 
                        }
                        else {
                          r8 = Int64(heapClassInst.heap32[(fp + (-4))]);
                          r9 = Int64(heapClassInst.heap32[(r10 + 1)]);
                          r10 = r8 >> 2;
                          heapClassInst.heap8[r8 + 57] = Int8(r19);
                          r15 = 1;
                          heapClassInst.heap32[(r10 + 10)] = Int32(r9);
                          r10 = r9 >> 2;
                          heapClassInst.heap8[r9 + 58] = Int8(r15);
                          heapClassInst.heap32[(r10 + 11)] = Int32(r8);
                          r8 = Int64(heapClassInst.heap32[(r16 + 13)]);
                          if (!(r8 == 0)) 
                          {
                            r8 = r8 >> 2;
                            r9 = Int64(heapClassInst.heap32[(r16 + 12)]);
                            heapClassInst.heap32[(r8 + 12)] = Int32(r9);
                          }
                          r8 = Int64(heapClassInst.heap32[(r16 + 12)]);
                          if (!(r8 == 0)) 
                          {
                            r8 = r8 >> 2;
                            r9 = Int64(heapClassInst.heap32[(r16 + 13)]);
                            heapClassInst.heap32[(r8 + 13)] = Int32(r9);
                          }
                          r8 = Int64(heapClassInst.heap32[(r7 + 2448)]);
                          if (!(r8 != r11)) 
                          {
                            r8 = Int64(heapClassInst.heap32[(r16 + 13)]);
                            heapClassInst.heap32[(r7 + 2448)] = Int32(r8);
                          }
                          r8 = Int64(heapClassInst.heap32[(r7 + 2449)]);
                          r8 = (r8 + (-1)) | 0;
                          heapClassInst.heap32[(r7 + 2449)] = Int32(r8);
                          heapClassInst.heap32[(r16 + 12)] = 0;
                          r8 = Int64(heapClassInst.heap32[(r7 + 2450)]);
                          heapClassInst.heap32[(r16 + 13)] = Int32(r8);
                          r8 = Int64(heapClassInst.heap32[(r7 + 2450)]);
                          if (!(r8 == 0)) 
                          {
                            r8 = r8 >> 2;
                            heapClassInst.heap32[(r8 + 12)] = Int32(r11);
                          }
                          heapClassInst.heap32[(r7 + 2450)] = Int32(r11);
                          r11 = Int64(heapClassInst.heap32[(r7 + 2451)]);
                          r11 = (r11 + 1) | 0;
                          heapClassInst.heap32[(r7 + 2451)] = Int32(r11);
                          r8 = Int64(heapClassInst.heap32[(r7 + 2448)]);
                          r11 = r8 >> 2;
                          f6 = Float64(heapClassInst.heapFloat[(r11 + 4)]);
                          f6 = f6 * f6;
                          f7 = Float64(heapClassInst.heapFloat[(r11 + 5)]);
                          while (true) {
                            f8 = f7;
                            r11 = r8;
                            f9 = f6;
                            while (true) {
                              r8 = r8 >> 2;
                              r8 = Int64(heapClassInst.heap32[(r8 + 13)]);
                              if (r8 != 0) 
                              {
                                r9 = r8 >> 2;
                                f7 = Float64(heapClassInst.heapFloat[(r9 + 5)]);
                                if (!(f7 < f8)) 
                                {
                                  f6 = Float64(heapClassInst.heapFloat[(r9 + 4)]);
                                  f6 = f6 * f6;
                                  if (!(f6 >= f9)) 
                                  {
                                    continue 
                                  }
                                }
                              }
                              else {
                                break 
                              }
                            }
                          }
                          r8 = r11 >> 2;
                          f6 = Float64(heapClassInst.heapFloat[(r8 + 5)]);
                          r4 = (r4 + 1) | 0;
                          if (!(f6 < f5)) 
                          {
                            break 
                          }
                        }
                      }
                    }
                  }
                }
                else {
                  __label__ = 55;
                  break 
                }
              }
              f0 = Float64(heapClassInst.heapFloat[(r8)]);
              f1 = Float64(heapClassInst.heapFloat[(r8 + 1)]);
              f2 = Float64(heapClassInst.heapFloat[(r8 + 2)]);
              f3 = Float64(heapClassInst.heapFloat[(r8 + 3)]);
              f4 = Float64(heapClassInst.heapFloat[(r8 + 4)]);
              r12 = Int64(heapClassInst.heap32[(r8 + 6)]);
              r13 = Int64(heapClassInst.heap32[(r8 + 7)]);
              r3 = Int64(heapClassInst.heap32[(r8 + 8)]);
              f5 = f6;
            }
            match (__label__) {
              case 53 =>
                heapClassInst.heap32[(fp + (-2592))] = 6;
              case 52 =>
                heapClassInst.heap32[(fp + (-2592))] = 7;
              case 51 =>
                heapClassInst.heap32[(fp + (-2592))] = 4;
              case _ =>
                println("break");
            }
            heapClassInst.heapFloat[(r7 + 10)] = Float32(f0);
            heapClassInst.heapFloat[(r7 + 11)] = Float32(f1);
            heapClassInst.heapFloat[(r7 + 12)] = Float32(f2);
            heapClassInst.heapFloat[(r7 + 13)] = Float32(f3);
            heapClassInst.heapFloat[(r7 + 14)] = Float32(f4);
            heapClassInst.heap32[(r7 + 9)] = 3;
            heapClassInst.heap32[(r7 + 1)] = Int32(r12);
            heapClassInst.heap32[(r7 + 2)] = Int32(r13);
            heapClassInst.heap32[(r7 + 3)] = Int32(r3);
            r3 = r3 >> 2;
            r2 = r13 >> 2;
            f2 = f2 * f4;
            f3 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
            f5 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
            f1 = f1 * f4;
            f6 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
            f7 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
            f0 = f0 * f4;
            f4 = Float64(heapClassInst.heapFloat[(r3 + 4)]);
            f8 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
            f5 = f5 - f2;
            f6 = f6 - f1;
            f8 = f8 - f0;
            f3 = f3 - f2;
            f7 = f7 - f1;
            f4 = f4 - f0;
            f9 = f7 * f3;
            f10 = f5 * f6;
            f5 = f5 * f4;
            f3 = f8 * f3;
            f9 = f9 - f10;
            f3 = f5 - f3;
            f5 = f8 * f6;
            f4 = f7 * f4;
            f4 = f5 - f4;
            f5 = f9 * f9;
            f3 = f3 * f3;
            f3 = f5 + f3;
            f4 = f4 * f4;
            f3 = f3 + f4;
            heapClassInst.heapFloat[(g0)] = Float32(f3);
            sqrtf(i7);
            heapClassInst.heapFloat[(r7 + 5)] = Float32(commonVariable.f_g0);
            r4 = r12 >> 2;
            f3 = Float64(heapClassInst.heapFloat[(r4 + 6)]);
            f4 = Float64(heapClassInst.heapFloat[(r4 + 5)]);
            f5 = Float64(heapClassInst.heapFloat[(r4 + 4)]);
            f6 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
            f7 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
            f8 = Float64(heapClassInst.heapFloat[(r3 + 4)]);
            f6 = f6 - f2;
            f4 = f4 - f1;
            f8 = f8 - f0;
            f3 = f3 - f2;
            f7 = f7 - f1;
            f5 = f5 - f0;
            f9 = f7 * f3;
            f10 = f6 * f4;
            f6 = f6 * f5;
            f3 = f8 * f3;
            f9 = f9 - f10;
            f3 = f6 - f3;
            f4 = f8 * f4;
            f5 = f7 * f5;
            f4 = f4 - f5;
            f5 = f9 * f9;
            f3 = f3 * f3;
            f3 = f5 + f3;
            f4 = f4 * f4;
            f3 = f3 + f4;
            heapClassInst.heapFloat[(g0)] = Float32(f3);
            sqrtf(i7);
            heapClassInst.heapFloat[(r7 + 6)] = Float32(commonVariable.f_g0);
            f3 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
            f4 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
            f5 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
            f6 = Float64(heapClassInst.heapFloat[(r4 + 6)]);
            f7 = Float64(heapClassInst.heapFloat[(r4 + 5)]);
            f8 = Float64(heapClassInst.heapFloat[(r4 + 4)]);
            f6 = f6 - f2;
            f4 = f4 - f1;
            f8 = f8 - f0;
            f2 = f3 - f2;
            f1 = f7 - f1;
            f0 = f5 - f0;
            f3 = f1 * f2;
            f5 = f6 * f4;
            f6 = f6 * f0;
            f2 = f8 * f2;
            f3 = f3 - f5;
            f2 = f6 - f2;
            f4 = f8 * f4;
            f0 = f1 * f0;
            f0 = f4 - f0;
            f1 = f3 * f3;
            f2 = f2 * f2;
            f1 = f1 + f2;
            f0 = f0 * f0;
            f0 = f1 + f0;
            heapClassInst.heapFloat[(g0)] = Float32(f0);
            sqrtf(i7);
            f1 = Float64(heapClassInst.heapFloat[(r7 + 5)]);
            f2 = Float64(heapClassInst.heapFloat[(r7 + 6)]);
            f3 = f1 + f2;
            f3 = f3 + commonVariable.f_g0;
            f1 = f1 / f3;
            f2 = f2 / f3;
            heapClassInst.heapFloat[(r7 + 5)] = Float32(f1);
            f0 = commonVariable.f_g0 / f3;
            heapClassInst.heapFloat[(r7 + 6)] = Float32(f2);
            heapClassInst.heapFloat[(r7 + 7)] = Float32(f0);
            __label__ = 60;
          }
        }
      }
      if (__label__ == 56) {
        heapClassInst.heap32[(fp + (-2592))] = 8;
        heapClassInst.heapFloat[(r7 + 10)] = Float32(f2);
        heapClassInst.heapFloat[(r7 + 11)] = Float32(f1);
        heapClassInst.heapFloat[(r7 + 12)] = Float32(f0);
        f2 = f2 * f2;
        f1 = f1 * f1;
        heapClassInst.heap32[(r7 + 13)] = 0;
        f1 = f2 + f1;
        f0 = f0 * f0;
        f0 = f1 + f0;
        heapClassInst.heapFloat[(g0)] = Float32(f0);
        sqrtf(i7);
        f0 = commonVariable.f_g0;
        f1 = 0.0
        if (f0 > f1) 
        {
          f1 = 1.0
          f2 = Float64(heapClassInst.heapFloat[(r7 + 12)]);
          f0 = f1 / f0;
          f1 = Float64(heapClassInst.heapFloat[(r7 + 11)]);
          f3 = Float64(heapClassInst.heapFloat[(r7 + 10)]);
          f2 = f2 * f0;
          f1 = f1 * f0;
          f0 = f3 * f0;
        }
        else {
          f0 = 1.0
          f2 = f1;
        }
        heapClassInst.heapFloat[(r7 + 10)] = Float32(f0);
        heapClassInst.heapFloat[(r7 + 11)] = Float32(f1);
        heapClassInst.heapFloat[(r7 + 12)] = Float32(f2);
        heapClassInst.heap32[(r7 + 13)] = 0;
        heapClassInst.heap32[(r7 + 14)] = 0;
        heapClassInst.heap32[(r7 + 9)] = 1;
        r2 = Int64(heapClassInst.heap32[(r3)]);
        heapClassInst.heap32[(r7 + 1)] = Int32(r2);
        heapClassInst.heap32[(r7 + 5)] = 1065353216;
      }
      r2 = Int64(heapClassInst.heap32[(fp + (-2592))]);
      if (r2 == 9) 
      {
        r1 = r1 >> 2;
        heapClassInst.heap32[(r1)] = 3;
        r1 = 0;
        commonVariable.r_g0 = r1;
        return;
      }
      else {
        r2 = Int64(heapClassInst.heap32[(r7 + 9)]);
        do {
          if (r2 != 0) 
          {
            r2 = 0;
            f0 = 0.0;
            f1 = f0;
            f2 = f0;
            while (true) {
              r3 = r2 << 2;
              r3 = (r6 + r3) | 0;
              r4 = r5 >> 2;
              r3 = r3 >> 2;
              r8 = Int64(heapClassInst.heap32[(r4 + 30)]);
              r2 = (r2 + 1) | 0;
              r9 = Int64(heapClassInst.heap32[(r3 + 1)]);
              r10 = Int64(heapClassInst.heap32[(fp + (-44))]);
              r4 = Int64(heapClassInst.heap32[(r4 + 31)]);
              r11 = r8 & 1;
              if (r11 != 0) 
              {
                r11 = (r10 + r4) | 0;
                r11 = r11 >> 2;
                r11 = Int64(heapClassInst.heap32[(r11)]);
                r8 = (r8 + r11) | 0;
                r8 = (r8 + (-1)) | 0;
                r8 = r8 >> 2;
                r8 = Int64(heapClassInst.heap32[(r8)]);
              }
              r11 = sp + (-32);
              r4 = (r10 + r4) | 0;
              heapClassInst.heap32[(g0)] = Int32(r11);
              heapClassInst.heap32[(g0 + 1)] = Int32(r4);
              heapClassInst.heap32[(g0 + 2)] = Int32(r9);
              __FUNCTION_TABLE__[(r8) >> 2](i7);
              r4 = r11 >> 2;
              f3 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
              f4 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
              f5 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
              f6 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
              f3 = f3 * f4;
              f5 = f5 * f4;
              f4 = f6 * f4;
              f2 = f2 + f3;
              f1 = f1 + f5;
              f0 = f0 + f4;
              r3 = Int64(heapClassInst.heap32[(r7 + 9)]);
              if (!(`UIntNative`(r3) > `UIntNative`(r2))) 
              {
                break 
              }
            }
          }
          else {
            f0 = 0.0;
            f1 = f0;
            f2 = f0;
          }
        } while (false);
        r1 = r1 >> 2;
        r0 = r0 >> 2;
        heapClassInst.heap32[(r1)] = 1;
        f3 = Float64(heapClassInst.heapFloat[(r0)]);
        f4 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
        f5 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
        f6 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
        f3 = f3 * f2;
        f4 = f4 * f1;
        f7 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
        f8 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
        f9 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
        f10 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
        f5 = f5 * f2;
        f6 = f6 * f1;
        f3 = f3 + f4;
        f4 = f7 * f0;
        f7 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
        f8 = f8 * f2;
        f9 = f9 * f1;
        f5 = f5 + f6;
        f6 = f10 * f0;
        f3 = f3 + f4;
        f4 = Float64(heapClassInst.heapFloat[(r0 + 12)]);
        f10 = Float64(heapClassInst.heapFloat[(r0 + 14)]);
        f11 = Float64(heapClassInst.heapFloat[(r0 + 13)]);
        f5 = f5 + f6;
        f6 = f8 + f9;
        f7 = f7 * f0;
        f3 = f3 + f4;
        f4 = f6 + f7;
        f5 = f5 + f11;
        heapClassInst.heapFloat[(r1 + 1)] = Float32(f3);
        f3 = f4 + f10;
        heapClassInst.heapFloat[(r1 + 2)] = Float32(f5);
        heapClassInst.heapFloat[(r1 + 3)] = Float32(f3);
        heapClassInst.heap32[(r1 + 4)] = 0;
        f3 = Float64(heapClassInst.heapFloat[(r7 + 14)]);
        f4 = Float64(heapClassInst.heapFloat[(r7 + 11)]);
        f5 = Float64(heapClassInst.heapFloat[(r7 + 10)]);
        f6 = Float64(heapClassInst.heapFloat[(r7 + 12)]);
        f7 = f5 * f3;
        f8 = f4 * f3;
        f9 = f6 * f3;
        f2 = f2 - f7;
        f7 = Float64(heapClassInst.heapFloat[(r0)]);
        f1 = f1 - f8;
        f8 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
        f10 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
        f11 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
        f7 = f7 * f2;
        f8 = f8 * f1;
        f0 = f0 - f9;
        f9 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
        f12 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
        f13 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
        f14 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
        f10 = f10 * f2;
        f11 = f11 * f1;
        f7 = f7 + f8;
        f8 = f9 * f0;
        f9 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
        f2 = f12 * f2;
        f1 = f13 * f1;
        f10 = f10 + f11;
        f11 = f14 * f0;
        f7 = f7 + f8;
        f8 = Float64(heapClassInst.heapFloat[(r0 + 12)]);
        f12 = Float64(heapClassInst.heapFloat[(r0 + 14)]);
        f13 = Float64(heapClassInst.heapFloat[(r0 + 13)]);
        f10 = f10 + f11;
        f1 = f2 + f1;
        f0 = f9 * f0;
        f2 = f7 + f8;
        f0 = f1 + f0;
        f1 = f10 + f13;
        heapClassInst.heapFloat[(r1 + 5)] = Float32(f2);
        f0 = f0 + f12;
        heapClassInst.heapFloat[(r1 + 6)] = Float32(f1);
        heapClassInst.heapFloat[(r1 + 7)] = Float32(f0);
        f0 = -f5;
        heapClassInst.heap32[(r1 + 8)] = 0;
        f1 = -f4;
        heapClassInst.heapFloat[(r1 + 9)] = Float32(f0);
        f0 = -f6;
        heapClassInst.heapFloat[(r1 + 10)] = Float32(f1);
        heapClassInst.heapFloat[(r1 + 11)] = Float32(f0);
        f0 = -f3;
        heapClassInst.heap32[(r1 + 12)] = 0;
        heapClassInst.heapFloat[(r1 + 13)] = Float32(f0);
        r1 = 1;
        commonVariable.r_g0 = r1;
        return;
      }
    }
  }
  r0 = 0;
  commonVariable.r_g0 = r0;
  return;
}

@OverflowWrapping
func _ZN15btGjkEpaSolver28DistanceEPK13btConvexShapeRK11btTransformS2_S5_RK9btVector3RNS_8sResultsE(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  var __label__ = 0;
  i7 = sp + (-592); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp + 5)]);
  r2 = Int64(heapClassInst.heap32[(fp)]);
  r3 = Int64(heapClassInst.heap32[(fp + 2)]);
  r4 = Int64(heapClassInst.heap32[(fp + 3)]);
  r5 = sp + (-176);
  heapClassInst.heap32[(g0)] = Int32(r2);
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  heapClassInst.heap32[(g0 + 2)] = Int32(r3);
  heapClassInst.heap32[(g0 + 3)] = Int32(r4);
  heapClassInst.heap32[(g0 + 4)] = Int32(r1);
  heapClassInst.heap32[(g0 + 5)] = Int32(r5);
  heapClassInst.heap32[(g0 + 6)] = 0;
  r2 = sp + (-560);
  r3 = r2 >> 2;
  _ZN12gjkepa2_implL10InitializeEPK13btConvexShapeRK11btTransformS2_S5_RN15btGjkEpaSolver28sResultsERNS_13MinkowskiDiffEb(i7);
  heapClassInst.heap32[(r3 + 32)] = 0;
  heapClassInst.heap32[(r3 + 33)] = 0;
  heapClassInst.heap32[(r3 + 34)] = 0;
  heapClassInst.heap32[(r3 + 35)] = 0;
  heapClassInst.heap32[(r3 + 91)] = 0;
  heapClassInst.heap32[(r3 + 94)] = 2;
  heapClassInst.heap32[(r3 + 92)] = 0;
  heapClassInst.heap32[(r3 + 36)] = 0;
  r4 = Int64(heapClassInst.heap32[(fp + 4)]);
  heapClassInst.heap32[(g0)] = Int32(r2);
  heapClassInst.heap32[(g0 + 1)] = Int32(r5);
  heapClassInst.heap32[(g0 + 2)] = Int32(r4);
  _ZN12gjkepa2_impl3GJK8EvaluateERKNS_13MinkowskiDiffERK9btVector3(i7);
  r2 = commonVariable.r_g0;
  if (r2 == 0) 
  {
    r2 = Int64(heapClassInst.heap32[(r3 + 93)]);
    r4 = r2 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4 + 8)]);
    do {
      if (r4 != 0) 
      {
        r4 = 0;
        f0 = 0.0;
        f1 = f0;
        f2 = f0;
        f3 = f0;
        f4 = f0;
        f5 = f0;
        while (true) {
          r6 = r4 << 2;
          r2 = (r2 + r6) | 0;
          r2 = r2 >> 2;
          r7 = r5 >> 2;
          r8 = Int64(heapClassInst.heap32[(r7 + 30)]);
          r4 = (r4 + 1) | 0;
          f6 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
          r2 = Int64(heapClassInst.heap32[(r2)]);
          r9 = Int64(heapClassInst.heap32[(fp + (-44))]);
          r10 = Int64(heapClassInst.heap32[(r7 + 31)]);
          r11 = r8 & 1;
          if (r11 != 0) 
          {
            r11 = (r9 + r10) | 0;
            r11 = r11 >> 2;
            r11 = Int64(heapClassInst.heap32[(r11)]);
            r8 = (r8 + r11) | 0;
            r8 = (r8 + (-1)) | 0;
            r8 = r8 >> 2;
            r8 = Int64(heapClassInst.heap32[(r8)]);
          }
          r11 = sp + (-48);
          r9 = (r9 + r10) | 0;
          heapClassInst.heap32[(g0)] = Int32(r11);
          heapClassInst.heap32[(g0 + 1)] = Int32(r9);
          heapClassInst.heap32[(g0 + 2)] = Int32(r2);
          __FUNCTION_TABLE__[(r8) >> 2](i7);
          r2 = Int64(heapClassInst.heap32[(r3 + 93)]);
          r2 = (r2 + r6) | 0;
          r2 = r2 >> 2;
          r6 = r11 >> 2;
          r2 = Int64(heapClassInst.heap32[(r2)]);
          r2 = r2 >> 2;
          f7 = Float64(heapClassInst.heapFloat[(fp + (-12))]);
          f8 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
          f9 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
          f10 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
          f11 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
          f12 = Float64(heapClassInst.heapFloat[(r2)]);
          f7 = f7 * f6;
          f8 = f8 * f6;
          f9 = f9 * f6;
          r2 = Int64(heapClassInst.heap32[(r7 + 30)]);
          f5 = f5 + f7;
          f4 = f4 + f8;
          f3 = f3 + f9;
          f7 = -f10;
          f8 = -f11;
          f9 = -f12;
          r6 = Int64(heapClassInst.heap32[(r7 + 1)]);
          r8 = Int64(heapClassInst.heap32[(r7 + 31)]);
          r9 = r2 & 1;
          if (r9 != 0) 
          {
            r9 = (r6 + r8) | 0;
            r9 = r9 >> 2;
            r9 = Int64(heapClassInst.heap32[(r9)]);
            r2 = (r2 + r9) | 0;
            r2 = (r2 + (-1)) | 0;
            r2 = r2 >> 2;
            r2 = Int64(heapClassInst.heap32[(r2)]);
          }
          f10 = Float64(heapClassInst.heapFloat[(r7 + 2)]);
          f11 = Float64(heapClassInst.heapFloat[(r7 + 3)]);
          f12 = Float64(heapClassInst.heapFloat[(r7 + 6)]);
          f13 = Float64(heapClassInst.heapFloat[(r7 + 7)]);
          f10 = f10 * f9;
          f11 = f11 * f8;
          f14 = Float64(heapClassInst.heapFloat[(r7 + 4)]);
          f15 = Float64(heapClassInst.heapFloat[(r7 + 10)]);
          f16 = Float64(heapClassInst.heapFloat[(r7 + 11)]);
          f17 = Float64(heapClassInst.heapFloat[(r7 + 12)]);
          f18 = Float64(heapClassInst.heapFloat[(r7 + 8)]);
          f12 = f12 * f9;
          f13 = f13 * f8;
          f10 = f10 + f11;
          f11 = f14 * f7;
          r9 = sp + (-16);
          f9 = f15 * f9;
          f8 = f16 * f8;
          f12 = f12 + f13;
          f13 = f18 * f7;
          f10 = f10 + f11;
          r10 = r9 >> 2;
          f8 = f9 + f8;
          f7 = f17 * f7;
          f9 = f12 + f13;
          heapClassInst.heapFloat[(fp + (-4))] = Float32(f10);
          f7 = f8 + f7;
          heapClassInst.heapFloat[(r10 + 1)] = Float32(f9);
          heapClassInst.heapFloat[(r10 + 2)] = Float32(f7);
          heapClassInst.heap32[(r10 + 3)] = 0;
          r10 = sp + (-32);
          r6 = (r6 + r8) | 0;
          heapClassInst.heap32[(g0)] = Int32(r10);
          heapClassInst.heap32[(g0 + 1)] = Int32(r6);
          heapClassInst.heap32[(g0 + 2)] = Int32(r9);
          __FUNCTION_TABLE__[(r2) >> 2](i7);
          r2 = r10 >> 2;
          f7 = Float64(heapClassInst.heapFloat[(r7 + 14)]);
          f8 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
          f9 = Float64(heapClassInst.heapFloat[(r7 + 18)]);
          f10 = Float64(heapClassInst.heapFloat[(r7 + 22)]);
          f11 = Float64(heapClassInst.heapFloat[(r7 + 15)]);
          f12 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
          f13 = Float64(heapClassInst.heapFloat[(r7 + 19)]);
          f14 = Float64(heapClassInst.heapFloat[(r7 + 23)]);
          f7 = f7 * f8;
          f11 = f11 * f12;
          f15 = Float64(heapClassInst.heapFloat[(r7 + 16)]);
          f16 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
          f17 = Float64(heapClassInst.heapFloat[(r7 + 20)]);
          f18 = Float64(heapClassInst.heapFloat[(r7 + 24)]);
          f9 = f9 * f8;
          f13 = f13 * f12;
          f8 = f10 * f8;
          f10 = f14 * f12;
          f7 = f7 + f11;
          f11 = f15 * f16;
          f9 = f9 + f13;
          f12 = f17 * f16;
          f8 = f8 + f10;
          f10 = f18 * f16;
          f7 = f7 + f11;
          f11 = Float64(heapClassInst.heapFloat[(r7 + 26)]);
          f9 = f9 + f12;
          f12 = Float64(heapClassInst.heapFloat[(r7 + 27)]);
          f8 = f8 + f10;
          f10 = Float64(heapClassInst.heapFloat[(r7 + 28)]);
          f7 = f7 + f11;
          f9 = f9 + f12;
          f8 = f8 + f10;
          f7 = f7 * f6;
          f9 = f9 * f6;
          f6 = f8 * f6;
          r2 = Int64(heapClassInst.heap32[(r3 + 93)]);
          f2 = f2 + f7;
          f1 = f1 + f9;
          f0 = f0 + f6;
          r6 = r2 >> 2;
          r6 = Int64(heapClassInst.heap32[(r6 + 8)]);
          if (!(`UIntNative`(r6) > `UIntNative`(r4))) 
          {
            break 
          }
        }
      }
      else {
        f0 = 0.0;
        f1 = f0;
        f2 = f0;
        f3 = f0;
        f4 = f0;
        f5 = f0;
      }
    } while (false);
    r0 = r0 >> 2;
    f6 = Float64(heapClassInst.heapFloat[(r0)]);
    f7 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
    f8 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
    f9 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
    f6 = f6 * f5;
    f7 = f7 * f4;
    f10 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
    f11 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
    f12 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
    f13 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
    f8 = f8 * f5;
    f9 = f9 * f4;
    f6 = f6 + f7;
    f7 = f10 * f3;
    f10 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
    f11 = f11 * f5;
    f12 = f12 * f4;
    f8 = f8 + f9;
    f9 = f13 * f3;
    f6 = f6 + f7;
    f7 = Float64(heapClassInst.heapFloat[(r0 + 12)]);
    f13 = Float64(heapClassInst.heapFloat[(r0 + 14)]);
    f14 = Float64(heapClassInst.heapFloat[(r0 + 13)]);
    f8 = f8 + f9;
    r1 = r1 >> 2;
    f9 = f11 + f12;
    f10 = f10 * f3;
    f6 = f6 + f7;
    f7 = f9 + f10;
    f8 = f8 + f14;
    heapClassInst.heapFloat[(r1 + 1)] = Float32(f6);
    f6 = f7 + f13;
    heapClassInst.heapFloat[(r1 + 2)] = Float32(f8);
    heapClassInst.heapFloat[(r1 + 3)] = Float32(f6);
    heapClassInst.heap32[(r1 + 4)] = 0;
    f6 = Float64(heapClassInst.heapFloat[(r0)]);
    f7 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
    f8 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
    f9 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
    f10 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
    f6 = f6 * f2;
    f7 = f7 * f1;
    f11 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
    f12 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
    f13 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
    f8 = f8 * f2;
    f9 = f9 * f1;
    f6 = f6 + f7;
    f7 = f10 * f0;
    f10 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
    f11 = f11 * f2;
    f12 = f12 * f1;
    f8 = f8 + f9;
    f9 = f13 * f0;
    f6 = f6 + f7;
    f7 = Float64(heapClassInst.heapFloat[(r0 + 12)]);
    f13 = Float64(heapClassInst.heapFloat[(r0 + 14)]);
    f14 = Float64(heapClassInst.heapFloat[(r0 + 13)]);
    f8 = f8 + f9;
    f9 = f11 + f12;
    f10 = f10 * f0;
    f6 = f6 + f7;
    f7 = f9 + f10;
    f8 = f8 + f14;
    heapClassInst.heapFloat[(r1 + 5)] = Float32(f6);
    f6 = f7 + f13;
    heapClassInst.heapFloat[(r1 + 6)] = Float32(f8);
    heapClassInst.heapFloat[(r1 + 7)] = Float32(f6);
    f2 = f5 - f2;
    heapClassInst.heap32[(r1 + 8)] = 0;
    f1 = f4 - f1;
    heapClassInst.heapFloat[(r1 + 9)] = Float32(f2);
    f0 = f3 - f0;
    heapClassInst.heapFloat[(r1 + 10)] = Float32(f1);
    heapClassInst.heapFloat[(r1 + 11)] = Float32(f0);
    f2 = f2 * f2;
    f1 = f1 * f1;
    heapClassInst.heap32[(r1 + 12)] = 0;
    f1 = f2 + f1;
    f0 = f0 * f0;
    f0 = f1 + f0;
    heapClassInst.heapFloat[(g0)] = Float32(f0);
    sqrtf(i7);
    f1 = 1.0;
    f2 = 9.9999997473787516e-005;
    f2 = if (commonVariable.f_g0 > f2) {commonVariable.f_g0} else {f1};
    heapClassInst.heapFloat[(r1 + 13)] = Float32(commonVariable.f_g0);
    f0 = f1 / f2;
    f1 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
    f1 = f1 * f0;
    heapClassInst.heapFloat[(r1 + 9)] = Float32(f1);
    f1 = Float64(heapClassInst.heapFloat[(r1 + 10)]);
    f1 = f1 * f0;
    heapClassInst.heapFloat[(r1 + 10)] = Float32(f1);
    f1 = Float64(heapClassInst.heapFloat[(r1 + 11)]);
    f0 = f1 * f0;
    heapClassInst.heapFloat[(r1 + 11)] = Float32(f0);
    r0 = 1;
    commonVariable.r_g0 = r0;
    return;
  }
  else {
    if (r2 != 1) 
    {
      r0 = 2;
    }
    else {
      r0 = 1;
    }
    r1 = r1 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r0);
    r0 = 0;
    commonVariable.r_g0 = r0;
    return;
  }
}

@OverflowWrapping
func _ZN30btGjkEpaPenetrationDepthSolver12calcPenDepthER22btVoronoiSimplexSolverPK13btConvexShapeS4_RK11btTransformS7_R9btVector3S9_S9_P12btIDebugDrawP12btStackAlloc(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  var __label__ = 0;
  i7 = sp + (-104); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 4)]);
  r1 = Int64(heapClassInst.heap32[(fp + 5)]);
  r2 = r0 >> 2;
  r3 = r1 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r2 + 14)]);
  f1 = Float64(heapClassInst.heapFloat[(r3 + 14)]);
  f2 = Float64(heapClassInst.heapFloat[(r2 + 13)]);
  f3 = Float64(heapClassInst.heapFloat[(r3 + 13)]);
  f4 = Float64(heapClassInst.heapFloat[(r2 + 12)]);
  f5 = Float64(heapClassInst.heapFloat[(r3 + 12)]);
  r2 = sp + (-16);
  f4 = f4 - f5;
  r3 = r2 >> 2;
  f2 = f2 - f3;
  heapClassInst.heapFloat[(fp + (-4))] = Float32(f4);
  f0 = f0 - f1;
  heapClassInst.heapFloat[(r3 + 1)] = Float32(f2);
  heapClassInst.heapFloat[(r3 + 2)] = Float32(f0);
  heapClassInst.heap32[(r3 + 3)] = 0;
  r3 = Int64(heapClassInst.heap32[(fp + 2)]);
  r4 = Int64(heapClassInst.heap32[(fp + 3)]);
  r5 = sp + (-72);
  heapClassInst.heap32[(g0)] = Int32(r3);
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  heapClassInst.heap32[(g0 + 2)] = Int32(r4);
  heapClassInst.heap32[(g0 + 3)] = Int32(r1);
  heapClassInst.heap32[(g0 + 4)] = Int32(r2);
  heapClassInst.heap32[(g0 + 5)] = Int32(r5);
  heapClassInst.heap32[(g0 + 6)] = 1;
  r6 = Int64(heapClassInst.heap32[(fp + 6)]);
  r7 = Int64(heapClassInst.heap32[(fp + 7)]);
  r8 = Int64(heapClassInst.heap32[(fp + 8)]);
  _ZN15btGjkEpaSolver211PenetrationEPK13btConvexShapeRK11btTransformS2_S5_RK9btVector3RNS_8sResultsEb(i7);
  r9 = commonVariable.r_g0;
  if (r9 == 0) 
  {
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    heapClassInst.heap32[(g0 + 2)] = Int32(r4);
    heapClassInst.heap32[(g0 + 3)] = Int32(r1);
    heapClassInst.heap32[(g0 + 4)] = Int32(r2);
    heapClassInst.heap32[(g0 + 5)] = Int32(r5);
    _ZN15btGjkEpaSolver28DistanceEPK13btConvexShapeRK11btTransformS2_S5_RK9btVector3RNS_8sResultsE(i7);
    r0 = commonVariable.r_g0;
    if (!(r0 == 0)) 
    {
      r0 = r5 >> 2;
      r1 = r7 >> 2;
      heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r0 + 1)];
      heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r0 + 2)];
      heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r0 + 3)];
      r2 = r8 >> 2;
      heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r0 + 4)];
      heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r0 + 5)];
      heapClassInst.heap32[(r2 + 1)] = heapClassInst.heap32[(r0 + 6)];
      heapClassInst.heap32[(r2 + 2)] = heapClassInst.heap32[(r0 + 7)];
      r1 = r6 >> 2;
      heapClassInst.heap32[(r2 + 3)] = heapClassInst.heap32[(r0 + 8)];
      heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r0 + 9)];
      heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r0 + 10)];
      heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r0 + 11)];
      heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r0 + 12)];
    }
    r0 = 0;
    commonVariable.r_g0 = r0;
    return;
  }
  else {
    r0 = r5 >> 2;
    r1 = r7 >> 2;
    heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r0 + 1)];
    heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r0 + 2)];
    heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r0 + 3)];
    r2 = r8 >> 2;
    heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r0 + 4)];
    heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r0 + 5)];
    heapClassInst.heap32[(r2 + 1)] = heapClassInst.heap32[(r0 + 6)];
    heapClassInst.heap32[(r2 + 2)] = heapClassInst.heap32[(r0 + 7)];
    r1 = r6 >> 2;
    heapClassInst.heap32[(r2 + 3)] = heapClassInst.heap32[(r0 + 8)];
    heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r0 + 9)];
    heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r0 + 10)];
    heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r0 + 11)];
    heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r0 + 12)];
    r0 = 1;
    commonVariable.r_g0 = r0;
    return;
  }
}

@OverflowWrapping
func _ZN30btGjkEpaPenetrationDepthSolverD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV30btGjkEpaPenetrationDepthSolver;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

@OverflowWrapping
func _ZN30btGjkEpaPenetrationDepthSolverD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV30btGjkEpaPenetrationDepthSolver;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

@OverflowWrapping
func _ZN17btGjkPairDetectorD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV17btGjkPairDetector;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

@OverflowWrapping
func _ZN17btGjkPairDetectorD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV17btGjkPairDetector;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

@OverflowWrapping
func _ZN17btGjkPairDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  i7 = sp + (-304); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = sp + (-32);
  heapClassInst.heap32[(r1 + 14)] = 0;
  r3 = r2 >> 2;
  heapClassInst.heap32[(fp + (-8))] = 0;
  heapClassInst.heap32[(r3 + 1)] = 0;
  r4 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heap32[(r3 + 2)] = 0;
  r5 = sp + (-96);
  r4 = r4 >> 2;
  heapClassInst.heap32[(r3 + 3)] = 0;
  r6 = r5 >> 2;
  heapClassInst.heap32[(fp + (-24))] = heapClassInst.heap32[(r4)];
  heapClassInst.heap32[(r6 + 1)] = heapClassInst.heap32[(r4 + 1)];
  heapClassInst.heap32[(r6 + 2)] = heapClassInst.heap32[(r4 + 2)];
  heapClassInst.heap32[(r6 + 3)] = heapClassInst.heap32[(r4 + 3)];
  heapClassInst.heap32[(r6 + 4)] = heapClassInst.heap32[(r4 + 4)];
  heapClassInst.heap32[(r6 + 5)] = heapClassInst.heap32[(r4 + 5)];
  heapClassInst.heap32[(r6 + 6)] = heapClassInst.heap32[(r4 + 6)];
  heapClassInst.heap32[(r6 + 7)] = heapClassInst.heap32[(r4 + 7)];
  heapClassInst.heap32[(r6 + 8)] = heapClassInst.heap32[(r4 + 8)];
  heapClassInst.heap32[(r6 + 9)] = heapClassInst.heap32[(r4 + 9)];
  heapClassInst.heap32[(r6 + 10)] = heapClassInst.heap32[(r4 + 10)];
  heapClassInst.heap32[(r6 + 11)] = heapClassInst.heap32[(r4 + 11)];
  f0 = Float64(heapClassInst.heapFloat[(r4 + 12)]);
  f1 = Float64(heapClassInst.heapFloat[(r4 + 13)]);
  f2 = Float64(heapClassInst.heapFloat[(r4 + 14)]);
  r7 = sp + (-160);
  heapClassInst.heap32[(r6 + 15)] = heapClassInst.heap32[(r4 + 15)];
  r8 = r7 >> 2;
  heapClassInst.heap32[(fp + (-40))] = heapClassInst.heap32[(r4 + 16)];
  heapClassInst.heap32[(r8 + 1)] = heapClassInst.heap32[(r4 + 17)];
  heapClassInst.heap32[(r8 + 2)] = heapClassInst.heap32[(r4 + 18)];
  heapClassInst.heap32[(r8 + 3)] = heapClassInst.heap32[(r4 + 19)];
  heapClassInst.heap32[(r8 + 4)] = heapClassInst.heap32[(r4 + 20)];
  heapClassInst.heap32[(r8 + 5)] = heapClassInst.heap32[(r4 + 21)];
  heapClassInst.heap32[(r8 + 6)] = heapClassInst.heap32[(r4 + 22)];
  heapClassInst.heap32[(r8 + 7)] = heapClassInst.heap32[(r4 + 23)];
  heapClassInst.heap32[(r8 + 8)] = heapClassInst.heap32[(r4 + 24)];
  heapClassInst.heap32[(r8 + 9)] = heapClassInst.heap32[(r4 + 25)];
  heapClassInst.heap32[(r8 + 10)] = heapClassInst.heap32[(r4 + 26)];
  heapClassInst.heap32[(r8 + 11)] = heapClassInst.heap32[(r4 + 27)];
  f3 = Float64(heapClassInst.heapFloat[(r4 + 28)]);
  f4 = Float64(heapClassInst.heapFloat[(r4 + 29)]);
  f5 = Float64(heapClassInst.heapFloat[(r4 + 30)]);
  f6 = f0 + f3;
  f7 = 0.5;
  f6 = f6 * f7;
  f8 = f1 + f4;
  f8 = f8 * f7;
  f9 = f2 + f5;
  f0 = f0 - f6;
  heapClassInst.heap32[(r8 + 15)] = heapClassInst.heap32[(r4 + 31)];
  f7 = f9 * f7;
  f1 = f1 - f8;
  heapClassInst.heapFloat[(r6 + 12)] = Float32(f0);
  f0 = f2 - f7;
  heapClassInst.heapFloat[(r6 + 13)] = Float32(f1);
  f1 = f3 - f6;
  heapClassInst.heapFloat[(r6 + 14)] = Float32(f0);
  f0 = f4 - f8;
  heapClassInst.heapFloat[(r8 + 12)] = Float32(f1);
  f1 = f5 - f7;
  heapClassInst.heapFloat[(r8 + 13)] = Float32(f0);
  heapClassInst.heapFloat[(r8 + 14)] = Float32(f1);
  r9 = Int64(heapClassInst.heap32[(r1 + 7)]);
  r9 = r9 >> 2;
  r10 = Int64(heapClassInst.heap32[(fp + 2)]);
  r11 = Int64(heapClassInst.heap32[(fp + 3)]);
  r9 = Int64(heapClassInst.heap32[(r9 + 1)]);
  r9 = (r9 + (-17)) | 0;
  if (`UIntNative`(r9) > `UIntNative`(1)) 
  {
    __label__ = 3;
  }
  else {
    r9 = Int64(heapClassInst.heap32[(r1 + 8)]);
    r9 = r9 >> 2;
    r9 = Int64(heapClassInst.heap32[(r9 + 1)]);
    r9 = (r9 + (-17)) | 0;
    if (`UIntNative`(r9) > `UIntNative`(1)) 
    {
      __label__ = 3;
    }
    else {
      r9 = (r0 + 32) | 0;
      r12 = 0;
      __label__ = 4;
    }
  }
  if (__label__ == 3) {
    r9 = (r0 + 32) | 0;
    r12 = 1;
  }
  r13 = gNumGjkChecks;
  r13 = r13 >> 2;
  r14 = Int64(heapClassInst.heap32[(r13)]);
  f0 = Float64(heapClassInst.heapFloat[(r1 + 11)]);
  f1 = Float64(heapClassInst.heapFloat[(r1 + 12)]);
  r14 = (r14 + 1) | 0;
  heapClassInst.heap32[(r13)] = Int32(r14);
  r13 = Int64(heapClassInst.heapU8[r0 + 52]);
  heapClassInst.heap32[(r1 + 16)] = 0;
  heapClassInst.heap32[(r1 + 1)] = 0;
  heapClassInst.heap32[(r1 + 2)] = 1065353216;
  heapClassInst.heap32[(r1 + 3)] = 0;
  heapClassInst.heap32[(r1 + 4)] = 0;
  heapClassInst.heap32[(r1 + 17)] = 0;
  heapClassInst.heap32[(r1 + 15)] = ( -1);
  r14 = Int64(heapClassInst.heap32[(r1 + 6)]);
  r15 = 0;
  r16 = r14 >> 2;
  heapClassInst.heap8[r14 + 312] = Int8(r15);
  r17 = 1;
  heapClassInst.heap32[(r16)] = 0;
  heapClassInst.heap8[r14 + 356] = Int8(r17);
  heapClassInst.heap32[(r16 + 73)] = 1566444395;
  heapClassInst.heap32[(r16 + 74)] = 1566444395;
  heapClassInst.heap32[(r16 + 75)] = 1566444395;
  heapClassInst.heap32[(r16 + 76)] = 0;
  heapClassInst.heap8[r14 + 352] = Int8(r15);
  heapClassInst.heap32[(r16 + 84)] = 0;
  heapClassInst.heap32[(r16 + 85)] = 0;
  heapClassInst.heap32[(r16 + 86)] = 0;
  heapClassInst.heap32[(r16 + 87)] = 0;
  r16 = Int64(heapClassInst.heapU8[r14 + 332]);
  f2 = 0.0;
  r16 = r16 & 240;
  heapClassInst.heap8[r14 + 332] = Int8(r16);
  f1 = if (r13 == r15) {f1} else {f2};
  f0 = if (r13 == r15) {f0} else {f2};
  f0 = f0 + f1;
  f3 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
  f4 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f5 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f9 = 999999984306749440.0;
  while (true) {
    f10 = -f5;
    f11 = Float64(heapClassInst.heapFloat[(r4)]);
    f12 = Float64(heapClassInst.heapFloat[(r4 + 4)]);
    f13 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
    f14 = Float64(heapClassInst.heapFloat[(r4 + 5)]);
    f11 = f11 * f10;
    f12 = f12 * f4;
    f15 = Float64(heapClassInst.heapFloat[(r4 + 8)]);
    f16 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
    f17 = Float64(heapClassInst.heapFloat[(r4 + 6)]);
    f18 = Float64(heapClassInst.heapFloat[(r4 + 10)]);
    f19 = Float64(heapClassInst.heapFloat[(r4 + 9)]);
    f13 = f13 * f10;
    f14 = f14 * f4;
    f11 = f11 - f12;
    f12 = f15 * f3;
    r13 = sp + (-176);
    f10 = f16 * f10;
    f15 = f17 * f4;
    f13 = f13 - f14;
    f14 = f19 * f3;
    f11 = f11 - f12;
    r14 = r13 >> 2;
    f10 = f10 - f15;
    f12 = f18 * f3;
    f13 = f13 - f14;
    heapClassInst.heapFloat[(fp + (-44))] = Float32(f11);
    f10 = f10 - f12;
    heapClassInst.heapFloat[(r14 + 1)] = Float32(f13);
    heapClassInst.heapFloat[(r14 + 2)] = Float32(f10);
    heapClassInst.heap32[(r14 + 3)] = 0;
    f10 = Float64(heapClassInst.heapFloat[(r4 + 16)]);
    f11 = Float64(heapClassInst.heapFloat[(r4 + 20)]);
    f12 = Float64(heapClassInst.heapFloat[(r4 + 17)]);
    f13 = Float64(heapClassInst.heapFloat[(r4 + 21)]);
    f14 = Float64(heapClassInst.heapFloat[(r4 + 24)]);
    f10 = f10 * f5;
    f11 = f11 * f4;
    f15 = Float64(heapClassInst.heapFloat[(r4 + 18)]);
    f16 = Float64(heapClassInst.heapFloat[(r4 + 22)]);
    f17 = Float64(heapClassInst.heapFloat[(r4 + 26)]);
    f18 = Float64(heapClassInst.heapFloat[(r4 + 25)]);
    f12 = f12 * f5;
    f13 = f13 * f4;
    f10 = f10 + f11;
    f11 = f14 * f3;
    r14 = sp + (-192);
    f5 = f15 * f5;
    f4 = f16 * f4;
    f12 = f12 + f13;
    f13 = f18 * f3;
    f10 = f10 + f11;
    r16 = r14 >> 2;
    f4 = f5 + f4;
    f3 = f17 * f3;
    f5 = f12 + f13;
    heapClassInst.heapFloat[(fp + (-48))] = Float32(f10);
    f3 = f4 + f3;
    heapClassInst.heapFloat[(r16 + 1)] = Float32(f5);
    heapClassInst.heapFloat[(r16 + 2)] = Float32(f3);
    heapClassInst.heap32[(r16 + 3)] = 0;
    r16 = Int64(heapClassInst.heap32[(r1 + 7)]);
    r18 = sp + (-208);
    heapClassInst.heap32[(g0)] = Int32(r18);
    heapClassInst.heap32[(g0 + 1)] = Int32(r16);
    heapClassInst.heap32[(g0 + 2)] = Int32(r13);
    r13 = r9 >> 2;
    _ZNK13btConvexShape44localGetSupportVertexWithoutMarginNonVirtualERK9btVector3(i7);
    r16 = Int64(heapClassInst.heap32[(r13)]);
    r19 = sp + (-224);
    heapClassInst.heap32[(g0)] = Int32(r19);
    heapClassInst.heap32[(g0 + 1)] = Int32(r16);
    heapClassInst.heap32[(g0 + 2)] = Int32(r14);
    _ZNK13btConvexShape44localGetSupportVertexWithoutMarginNonVirtualERK9btVector3(i7);
    r14 = r18 >> 2;
    r16 = r19 >> 2;
    f3 = Float64(heapClassInst.heapFloat[(r6 + 8)]);
    f4 = Float64(heapClassInst.heapFloat[(fp + (-52))]);
    f5 = Float64(heapClassInst.heapFloat[(r6 + 4)]);
    f10 = Float64(heapClassInst.heapFloat[(fp + (-24))]);
    f11 = Float64(heapClassInst.heapFloat[(r6 + 9)]);
    f12 = Float64(heapClassInst.heapFloat[(r14 + 1)]);
    f13 = Float64(heapClassInst.heapFloat[(r6 + 5)]);
    f14 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
    f15 = Float64(heapClassInst.heapFloat[(r8 + 8)]);
    f16 = Float64(heapClassInst.heapFloat[(fp + (-56))]);
    f17 = Float64(heapClassInst.heapFloat[(r8 + 4)]);
    f18 = Float64(heapClassInst.heapFloat[(fp + (-40))]);
    f19 = Float64(heapClassInst.heapFloat[(r8 + 9)]);
    f20 = Float64(heapClassInst.heapFloat[(r16 + 1)]);
    f21 = Float64(heapClassInst.heapFloat[(r8 + 5)]);
    f22 = Float64(heapClassInst.heapFloat[(r8 + 1)]);
    f3 = f3 * f4;
    f11 = f11 * f12;
    f23 = Float64(heapClassInst.heapFloat[(r6 + 10)]);
    f24 = Float64(heapClassInst.heapFloat[(r14 + 2)]);
    f25 = Float64(heapClassInst.heapFloat[(r6 + 6)]);
    f26 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
    f15 = f15 * f16;
    f19 = f19 * f20;
    f27 = Float64(heapClassInst.heapFloat[(r8 + 10)]);
    f28 = Float64(heapClassInst.heapFloat[(r16 + 2)]);
    f29 = Float64(heapClassInst.heapFloat[(r8 + 6)]);
    f30 = Float64(heapClassInst.heapFloat[(r8 + 2)]);
    f5 = f5 * f4;
    f13 = f13 * f12;
    f17 = f17 * f16;
    f21 = f21 * f20;
    f4 = f10 * f4;
    f10 = f14 * f12;
    f12 = f18 * f16;
    f14 = f22 * f20;
    f3 = f3 + f11;
    f11 = f23 * f24;
    f15 = f15 + f19;
    f16 = f27 * f28;
    f5 = f5 + f13;
    f13 = f25 * f24;
    f17 = f17 + f21;
    f18 = f29 * f28;
    f4 = f4 + f10;
    f10 = f26 * f24;
    f12 = f12 + f14;
    f14 = f30 * f28;
    f3 = f3 + f11;
    f11 = Float64(heapClassInst.heapFloat[(r6 + 14)]);
    f15 = f15 + f16;
    f16 = Float64(heapClassInst.heapFloat[(r8 + 14)]);
    f5 = f5 + f13;
    f13 = Float64(heapClassInst.heapFloat[(r6 + 13)]);
    f17 = f17 + f18;
    f18 = Float64(heapClassInst.heapFloat[(r8 + 13)]);
    f4 = f4 + f10;
    f10 = Float64(heapClassInst.heapFloat[(r6 + 12)]);
    f12 = f12 + f14;
    f14 = Float64(heapClassInst.heapFloat[(r8 + 12)]);
    f5 = f5 + f13;
    f13 = f17 + f18;
    f4 = f4 + f10;
    f10 = f12 + f14;
    f3 = f3 + f11;
    f11 = f15 + f16;
    f3 = if (r12 != r15) {f3} else {f2};
    f11 = if (r12 != r15) {f11} else {f2};
    f12 = f5 - f13;
    f14 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
    f15 = f4 - f10;
    f16 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
    f17 = f3 - f11;
    f18 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
    f16 = f16 * f15;
    f14 = f14 * f12;
    f14 = f16 + f14;
    f16 = f18 * f17;
    f14 = f14 + f16;
    if (!(f14 <= f2)) 
    {
      f16 = Float64(heapClassInst.heapFloat[(r4 + 32)]);
      f18 = f14 * f14;
      f16 = f16 * f9;
      if (!(f18 <= f16)) 
      {
        __label__ = 7;
        break 
      }
    }
    r14 = Int64(heapClassInst.heap32[(r1 + 6)]);
    r16 = r14 >> 2;
    r18 = Int64(heapClassInst.heap32[(r16)]);
    do {
      if (r18 > 0) 
      {
        r19 = ( -12);
        f16 = Float64(heapClassInst.heapFloat[(r16 + 77)]);
        r20 = (r19 - r14) | 0;
        r21 = 0;
        r22 = r18;
        r19 = r21;
        while (true) {
          r23 = ( -8);
          r24 = ( -4);
          r23 = (r23 - r20) | 0;
          r24 = (r24 - r20) | 0;
          r23 = r23 >> 2;
          r24 = r24 >> 2;
          r25 = (r21 - r20) | 0;
          r25 = r25 >> 2;
          f18 = Float64(heapClassInst.heapFloat[(r23)]);
          f19 = Float64(heapClassInst.heapFloat[(r24)]);
          f18 = f15 - f18;
          f19 = f12 - f19;
          f20 = Float64(heapClassInst.heapFloat[(r25)]);
          f20 = f17 - f20;
          f18 = f18 * f18;
          f19 = f19 * f19;
          f18 = f18 + f19;
          f19 = f20 * f20;
          f18 = f18 + f19;
          r22 = (r22 + (-1)) | 0;
          r19 = if (f18 > f16) {r19} else {r17};
          r20 = (r20 + (-16)) | 0;
          if (r22 != 0) 
          {
            continue 
          }
          else {
            break 
          }
        }
      }
      else {
        r19 = r15;
      }
    } while (false);
    f16 = Float64(heapClassInst.heapFloat[(r16 + 76)]);
    if (f16 == f2) 
    {
      f16 = Float64(heapClassInst.heapFloat[(r16 + 75)]);
      if (!(f17 != f16)) 
      {
        f16 = Float64(heapClassInst.heapFloat[(r16 + 74)]);
        if (!(f12 != f16)) 
        {
          f16 = Float64(heapClassInst.heapFloat[(r16 + 73)]);
          r19 = if (f15 != f16) {r19} else {r17};
        }
      }
    }
    r19 = r19 & 255;
    if (r19 == 0) 
    {
      f14 = f9 - f14;
      f16 = 9.9999999747524271e-007;
      f18 = f9 * f16;
      if (f14 > f18) 
      {
        heapClassInst.heapFloat[(r16 + 73)] = Float32(f15);
        heapClassInst.heapFloat[(r16 + 74)] = Float32(f12);
        r18 = r18 << 4;
        heapClassInst.heapFloat[(r16 + 75)] = Float32(f17);
        r18 = (r14 + r18) | 0;
        heapClassInst.heap32[(r16 + 76)] = 0;
        r18 = r18 >> 2;
        heapClassInst.heap8[r14 + 356] = Int8(r17);
        heapClassInst.heapFloat[(r18 + 1)] = Float32(f15);
        heapClassInst.heapFloat[(r18 + 2)] = Float32(f12);
        heapClassInst.heapFloat[(r18 + 3)] = Float32(f17);
        heapClassInst.heap32[(r18 + 4)] = 0;
        r18 = Int64(heapClassInst.heap32[(r16)]);
        r18 = r18 << 4;
        r18 = (r14 + r18) | 0;
        r18 = r18 >> 2;
        heapClassInst.heapFloat[(r18 + 21)] = Float32(f4);
        heapClassInst.heapFloat[(r18 + 22)] = Float32(f5);
        heapClassInst.heapFloat[(r18 + 23)] = Float32(f3);
        heapClassInst.heap32[(r18 + 24)] = 0;
        r18 = Int64(heapClassInst.heap32[(r16)]);
        r18 = r18 << 4;
        r14 = (r14 + r18) | 0;
        r14 = r14 >> 2;
        heapClassInst.heapFloat[(r14 + 41)] = Float32(f10);
        heapClassInst.heapFloat[(r14 + 42)] = Float32(f13);
        heapClassInst.heapFloat[(r14 + 43)] = Float32(f11);
        heapClassInst.heap32[(r14 + 44)] = 0;
        r14 = Int64(heapClassInst.heap32[(r16)]);
        r14 = (r14 + 1) | 0;
        heapClassInst.heap32[(r16)] = Int32(r14);
        r14 = Int64(heapClassInst.heap32[(r1 + 6)]);
        heapClassInst.heap32[(g0)] = Int32(r14);
        _ZN22btVoronoiSimplexSolver28updateClosestVectorAndPointsEv(i7);
        r16 = commonVariable.r_g0;
        if (r16 != 0) 
        {
          r14 = r14 >> 2;
          f5 = Float64(heapClassInst.heapFloat[(r14 + 69)]);
          f4 = Float64(heapClassInst.heapFloat[(r14 + 70)]);
          f3 = Float64(heapClassInst.heapFloat[(r14 + 71)]);
          f10 = Float64(heapClassInst.heapFloat[(r14 + 72)]);
          heapClassInst.heapFloat[(r1 + 1)] = Float32(f5);
          f11 = f5 * f5;
          f12 = f4 * f4;
          heapClassInst.heapFloat[(r1 + 2)] = Float32(f4);
          f11 = f11 + f12;
          f12 = f3 * f3;
          f11 = f11 + f12;
          heapClassInst.heapFloat[(r1 + 3)] = Float32(f3);
          heapClassInst.heapFloat[(r1 + 4)] = Float32(f10);
          if (f11 >= f16) 
          {
            f10 = 1.1920928955078125e-007;
            f12 = f9 - f11;
            f9 = f9 * f10;
            if (f12 > f9) 
            {
              r14 = Int64(heapClassInst.heap32[(r1 + 16)]);
              r16 = (r14 + 1) | 0;
              heapClassInst.heap32[(r1 + 16)] = Int32(r16);
              if (r14 < 1001) 
              {
                r14 = Int64(heapClassInst.heap32[(r1 + 6)]);
                r14 = r14 >> 2;
                r16 = Int64(heapClassInst.heap32[(r14)]);
                f9 = f11;
                if (r16 != 4) 
                {
                  continue 
                }
                else {
                  __label__ = 29;
                  break 
                }
              }
              else {
                __label__ = 27;
                break 
              }
            }
            else {
              __label__ = 25;
              break 
            }
          }
          else {
            __label__ = 23;
            break 
          }
        }
        else {
          __label__ = 21;
          break 
        }
      }
      else {
        __label__ = 19;
        break 
      }
    }
    else {
      __label__ = 17;
      break 
    }
  }
  do {
    match (__label__) {
      case 7 =>
        heapClassInst.heap32[(r1 + 17)] = 10;
        __label__ = 30;

      case 29 =>
        heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r14 + 69)];
        heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r14 + 70)];
        heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r14 + 71)];
        r17 = 0;
        heapClassInst.heap32[(r1 + 4)] = heapClassInst.heap32[(r14 + 72)];
        heapClassInst.heap32[(r1 + 17)] = 13;
        __label__ = 37;

      case 27 =>
        r6 = _E2_str425;
        heapClassInst.heap32[(g0)] = Int32(r6);
        heapClassInst.heap32[(g0 + 1)] = Int32(r16);
        printf(i7);
        r6 = Int64(heapClassInst.heap32[(r13)]);
        r8 = Int64(heapClassInst.heap32[(r1 + 7)]);
        r6 = r6 >> 2;
        r8 = r8 >> 2;
        f2 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
        f3 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
        f4 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
        r6 = Int64(heapClassInst.heap32[(r6 + 1)]);
        r8 = Int64(heapClassInst.heap32[(r8 + 1)]);
        r9 = _E2_str1426;
        
        heapClassInst.heap32[(g0)] = Int32(r9);
        llvm_writeDouble((i7 + 8), f4);
        llvm_writeDouble((i7 + 16), f3);
        llvm_writeDouble((i7 + 24), f2);
        llvm_writeDouble((i7 + 32), f5);
        heapClassInst.heap32[(g0 + 10)] = Int32(r8);
        heapClassInst.heap32[(g0 + 11)] = Int32(r6);
        f2 = 0.0;
        r17 = 0;
        printf(i7);
        __label__ = 37;

      case 25 =>
        r6 = Int64(heapClassInst.heap32[(r1 + 6)]);
        r6 = r6 >> 2;
        heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r6 + 69)];
        heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r6 + 70)];
        heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r6 + 71)];
        heapClassInst.heap32[(r1 + 4)] = heapClassInst.heap32[(r6 + 72)];
        heapClassInst.heap32[(r1 + 17)] = 12;
        
        __label__ = 30;

      case 23 =>
        heapClassInst.heap32[(r1 + 17)] = 6;
        __label__ = 30;

      case 21 =>
        heapClassInst.heap32[(r1 + 17)] = 3;
        __label__ = 30;

      case 19 =>
        r6 = 11;
        r8 = 2;
        
        heapClassInst.heap32[(r1 + 17)] = Int32(r6);
        __label__ = 30;

      case 17 =>
        heapClassInst.heap32[(r1 + 17)] = 1;
        __label__ = 30;

      case _ =>
        println("break 7760")
    }
  } while (false);
  if (__label__ == 30) {
    r6 = Int64(heapClassInst.heap32[(r1 + 6)]);
    heapClassInst.heap32[(g0)] = Int32(r6);
    r6 = r6 >> 2;
    _ZN22btVoronoiSimplexSolver28updateClosestVectorAndPointsEv(i7);
    f3 = Float64(heapClassInst.heapFloat[(r6 + 65)]);
    f2 = Float64(heapClassInst.heapFloat[(r6 + 61)]);
    f4 = Float64(heapClassInst.heapFloat[(r6 + 66)]);
    f5 = Float64(heapClassInst.heapFloat[(r6 + 62)]);
    f10 = Float64(heapClassInst.heapFloat[(r6 + 67)]);
    f11 = Float64(heapClassInst.heapFloat[(r6 + 63)]);
    f2 = f2 - f3;
    f5 = f5 - f4;
    heapClassInst.heapFloat[(fp + (-8))] = Float32(f2);
    f2 = f11 - f10;
    heapClassInst.heapFloat[(r3 + 1)] = Float32(f5);
    heapClassInst.heapFloat[(r3 + 2)] = Float32(f2);
    heapClassInst.heap32[(r3 + 3)] = 0;
    f2 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
    f5 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
    f11 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
    f2 = f2 * f2;
    f5 = f5 * f5;
    f2 = f2 + f5;
    f5 = f11 * f11;
    f2 = f2 + f5;
    f5 = f2; 
    f11 = 0.0001;
    if (!(f5 >= f11)) 
    {
      heapClassInst.heap32[(r1 + 17)] = 5;
    }
    f5 = 1.4210854715202004e-014;
    if (f2 <= f5) 
    {
      f2 = 0.0;
      r17 = 0;
      heapClassInst.heap32[(r1 + 15)] = 2;
    }
    else {
      heapClassInst.heapFloat[(g0)] = Float32(f2);
      sqrtf(i7);
      f5 = 1.0;
      f2 = f5 / commonVariable.f_g0;
      f11 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
      f11 = f11 * f2;
      heapClassInst.heapFloat[(fp + (-8))] = Float32(f11);
      f11 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
      f11 = f11 * f2;
      heapClassInst.heapFloat[(r3 + 1)] = Float32(f11);
      f11 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
      f11 = f11 * f2;
      heapClassInst.heapFloat[(r3 + 2)] = Float32(f11);
      heapClassInst.heapFloat[(g0)] = Float32(f9);
      sqrtf(i7);
      f9 = commonVariable.f_g0;
      f11 = 0.0;
      if (f9 > f11) 
      {
        f9 = f1 / f9;
        f11 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
        f12 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
        f13 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
        f13 = f13 * f9;
        f12 = f12 * f9;
        f9 = f11 * f9;
        f2 = f5 / f2;
        f3 = f3 + f13;
        f4 = f4 + f12;
        f10 = f10 + f9;
        f2 = f2 - f0;
        heapClassInst.heap32[(r1 + 15)] = 1;
      }
      else {
        r0 = _E2_str2427;
        r1 = _E2_str3428;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 320;
        _assert(i7);
      }
    }
  }
  r6 = Int64(heapClassInst.heap32[(r1 + 18)]);
  if (r6 == 0) 
  {
    __label__ = 42;
  }
  else {
    r6 = Int64(heapClassInst.heap32[(r1 + 5)]);
    if (r6 == 0) 
    {
      __label__ = 42;
    }
    else {
      r8 = Int64(heapClassInst.heap32[(r1 + 17)]);
      if (r8 == 0) 
      {
        __label__ = 42;
      }
      else {
        f5 = f2 + f0;
        
        f9 = 0.01;
        if (f5 < f9) 
        {
          __label__ = 44;
        }
        else {
          r8 = r17 & 255;
          if (r8 == 1) 
          {
            __label__ = 60;
          }
          else {
            __label__ = 44;
          }
        }
      }
    }
  }
  if (__label__ == 42) {
    r6 = r17 & 255;
    if (r6 == 1) 
    {
      __label__ = 60;
    }
    else {
      r6 = Int64(heapClassInst.heap32[(r1 + 5)]);
      if (r6 == 0) 
      {
        __label__ = 59;
      }
      else {
        __label__ = 44;
      }
    }
  }
  do {
    if (__label__ == 44) {
      r8 = gNumDeepPenetrationChecks;
      r8 = r8 >> 2;
      r9 = Int64(heapClassInst.heap32[(r8)]);
      r9 = (r9 + 1) | 0;
      heapClassInst.heap32[(r8)] = Int32(r9);
      heapClassInst.heap32[(r1 + 1)] = 0;
      heapClassInst.heap32[(r1 + 2)] = 0;
      heapClassInst.heap32[(r1 + 3)] = 0;
      heapClassInst.heap32[(r1 + 4)] = 0;
      r8 = r6 >> 2;
      r8 = Int64(heapClassInst.heap32[(r8)]);
      r8 = r8 >> 2;
      r8 = Int64(heapClassInst.heap32[(r8 + 2)]);
      r9 = Int64(heapClassInst.heap32[(r4 + 33)]);
      r12 = Int64(heapClassInst.heap32[(r13)]);
      r13 = Int64(heapClassInst.heap32[(r1 + 7)]);
      r14 = Int64(heapClassInst.heap32[(r1 + 6)]);
      r0 = (r0 + 4) | 0;
      r15 = sp + (-240);
      r16 = sp + (-256);
      heapClassInst.heap32[(g0)] = Int32(r6);
      heapClassInst.heap32[(g0 + 1)] = Int32(r14);
      heapClassInst.heap32[(g0 + 2)] = Int32(r13);
      heapClassInst.heap32[(g0 + 3)] = Int32(r12);
      heapClassInst.heap32[(g0 + 4)] = Int32(r5);
      heapClassInst.heap32[(g0 + 5)] = Int32(r7);
      heapClassInst.heap32[(g0 + 6)] = Int32(r0);
      heapClassInst.heap32[(g0 + 7)] = Int32(r15);
      heapClassInst.heap32[(g0 + 8)] = Int32(r16);
      heapClassInst.heap32[(g0 + 9)] = Int32(r11);
      heapClassInst.heap32[(g0 + 10)] = Int32(r9);
      __FUNCTION_TABLE__[(r8) >> 2](i7);
      r0 = commonVariable.r_g0;
      if (r0 == 0) 
      {
        f5 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
        f9 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
        f11 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
        f5 = f5 * f5;
        f9 = f9 * f9;
        f5 = f5 + f9;
        f9 = f11 * f11;
        f5 = f5 + f9;
        f9 = 0.0;
        if (f5 <= f9) 
        {
          __label__ = 59;
          break 
        }
        else {
          r0 = r15 >> 2;
          r5 = r16 >> 2;
          f5 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
          f9 = Float64(heapClassInst.heapFloat[(r5 + 1)]);
          f11 = Float64(heapClassInst.heapFloat[(fp + (-60))]);
          f12 = Float64(heapClassInst.heapFloat[(fp + (-64))]);
          f11 = f11 - f12;
          f5 = f5 - f9;
          f9 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
          f12 = Float64(heapClassInst.heapFloat[(r5 + 2)]);
          f9 = f9 - f12;
          f11 = f11 * f11;
          f5 = f5 * f5;
          f5 = f11 + f5;
          f9 = f9 * f9;
          f5 = f5 + f9;
          heapClassInst.heapFloat[(g0)] = Float32(f5);
          sqrtf(i7);
          f0 = commonVariable.f_g0 - f0;
          r0 = r17 & 255;
          if (!(r0 != 1)) 
          {
            if (f0 >= f2) 
            {
              heapClassInst.heap32[(r1 + 15)] = 5;
              __label__ = 59;
              break 
            }
          }
          f2 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
          f3 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
          f4 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
          f10 = Float64(heapClassInst.heapFloat[(fp + (-64))]);
          f5 = Float64(heapClassInst.heapFloat[(r5 + 1)]);
          f9 = Float64(heapClassInst.heapFloat[(r5 + 2)]);
          heapClassInst.heapFloat[(fp + (-8))] = Float32(f2);
          heapClassInst.heapFloat[(r3 + 1)] = Float32(f3);
          heapClassInst.heapFloat[(r3 + 2)] = Float32(f4);
          f11 = f2 * f2;
          f12 = f3 * f3;
          heapClassInst.heap32[(r3 + 3)] = heapClassInst.heap32[(r1 + 4)];
          f11 = f11 + f12;
          f12 = f4 * f4;
          f11 = f11 + f12;
          heapClassInst.heapFloat[(g0)] = Float32(f11);
          sqrtf(i7);
          f12 = 1.0;
          f11 = f12 / commonVariable.f_g0;
          f12 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
          f12 = f12 * f11;
          heapClassInst.heapFloat[(fp + (-8))] = Float32(f12);
          f12 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
          f12 = f12 * f11;
          heapClassInst.heapFloat[(r3 + 1)] = Float32(f12);
          f12 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
          f2 = f2 * f1;
          f13 = f3 * f1;
          f1 = f4 * f1;
          f11 = f12 * f11;
          f3 = f10 + f2;
          f4 = f5 + f13;
          f10 = f9 + f1;
          heapClassInst.heapFloat[(r3 + 2)] = Float32(f11);
          heapClassInst.heap32[(r1 + 15)] = 6;
          f2 = f0;
          __label__ = 60;
          break 
        }
      }
      else {
        r16 = r16 >> 2;
        r15 = r15 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r16 + 1)]);
        f1 = Float64(heapClassInst.heapFloat[(r15 + 1)]);
        f5 = Float64(heapClassInst.heapFloat[(fp + (-64))]);
        f9 = Float64(heapClassInst.heapFloat[(fp + (-60))]);
        f0 = f0 - f1;
        f1 = f5 - f9;
        f5 = Float64(heapClassInst.heapFloat[(r16 + 2)]);
        f9 = Float64(heapClassInst.heapFloat[(r15 + 2)]);
        f5 = f5 - f9;
        f9 = f1 * f1;
        f11 = f0 * f0;
        f9 = f9 + f11;
        f11 = f5 * f5;
        f9 = f9 + f11;
        f11 = 1.4210854715202004e-014;
        if (f9 <= f11) 
        {
          f1 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
          f0 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
          f5 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
          f9 = f1 * f1;
          f12 = f0 * f0;
          f9 = f9 + f12;
          f13 = f5 * f5;
          f12 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
          f9 = f9 + f13;
        }
        else {
          f12 = 0.0;
        }
        if (f9 <= f11) 
        {
          heapClassInst.heap32[(r1 + 15)] = 9;
          __label__ = 59;
          break 
        }
        else {
          heapClassInst.heapFloat[(g0)] = Float32(f9);
          sqrtf(i7);
          f9 = commonVariable.f_g0;
          f11 = Float64(heapClassInst.heapFloat[(r15 + 1)]);
          f13 = Float64(heapClassInst.heapFloat[(r16 + 1)]);
          f14 = Float64(heapClassInst.heapFloat[(fp + (-60))]);
          f15 = Float64(heapClassInst.heapFloat[(fp + (-64))]);
          f14 = f14 - f15;
          f11 = f11 - f13;
          f13 = Float64(heapClassInst.heapFloat[(r15 + 2)]);
          f15 = Float64(heapClassInst.heapFloat[(r16 + 2)]);
          f13 = f13 - f15;
          f14 = f14 * f14;
          f11 = f11 * f11;
          f11 = f14 + f11;
          f13 = f13 * f13;
          f11 = f11 + f13;
          heapClassInst.heapFloat[(g0)] = Float32(f11);
          sqrtf(i7);
          f11 = -commonVariable.f_g0;
          r15 = r17 & 255;
          if (!(r15 != 1)) 
          {
            if (f2 <= f11) 
            {
              heapClassInst.heap32[(r1 + 15)] = 8;
              __label__ = 59;
              break 
            }
          }
          f2 = 1.0;
          f2 = f2 / f9;
          f3 = Float64(heapClassInst.heapFloat[(fp + (-64))]);
          f4 = Float64(heapClassInst.heapFloat[(r16 + 1)]);
          f10 = Float64(heapClassInst.heapFloat[(r16 + 2)]);
          f1 = f1 * f2;
          f0 = f0 * f2;
          heapClassInst.heapFloat[(fp + (-8))] = Float32(f1);
          f1 = f5 * f2;
          heapClassInst.heapFloat[(r3 + 1)] = Float32(f0);
          heapClassInst.heapFloat[(r3 + 2)] = Float32(f1);
          heapClassInst.heapFloat[(r3 + 3)] = Float32(f12);
          heapClassInst.heap32[(r1 + 15)] = 3;
          f2 = f11;
          __label__ = 60;
        }
      }
    }
  } while (false);
  if (__label__ == 59) {
    r0 = r17 & 255;
    if (r0 == 0) 
    {
      __label__ = 63;
    }
    else {
      __label__ = 60;
    }
  }
  do {
    if (__label__ == 60) {
      f0 = 0.0;
      if (!(f2 < f0)) 
      {
        f0 = f2 * f2;
        f1 = Float64(heapClassInst.heapFloat[(r4 + 32)]);
        if (f0 >= f1) 
        {
          break 
        }
      }
      heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(fp + (-8))];
      heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r3 + 1)];
      heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r3 + 2)];
      heapClassInst.heap32[(r1 + 4)] = heapClassInst.heap32[(r3 + 3)];
      r0 = r10 >> 2;
      heapClassInst.heapFloat[(r1 + 14)] = Float32(f2);
      r0 = Int64(heapClassInst.heap32[(r0)]);
      r0 = r0 >> 2;
      r0 = Int64(heapClassInst.heap32[(r0 + 4)]);
      r1 = sp + (-16);
      f0 = f3 + f6;
      r3 = r1 >> 2;
      f1 = f4 + f8;
      heapClassInst.heapFloat[(fp + (-4))] = Float32(f0);
      
      heapClassInst.heapFloat[(r3 + 1)] = Float32(f1);
      heapClassInst.heapFloat[(r3 + 2)] = Float32(f0);
      heapClassInst.heap32[(r3 + 3)] = 0;
      heapClassInst.heap32[(g0)] = Int32(r10);
      heapClassInst.heap32[(g0 + 1)] = Int32(r2);
      heapClassInst.heap32[(g0 + 2)] = Int32(r1);
      heapClassInst.heapFloat[(g0 + 3)] = Float32(f2);
      __FUNCTION_TABLE__[(r0) >> 2](i7);
    }
  } while (false);
  return;
}

@OverflowWrapping
func _ZN20btPersistentManifold18removeContactPointEi(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var r5: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1 + 279)]);
  r3 = (r2 + (-1)) | 0;
  r4 = Int64(heapClassInst.heap32[(fp + 1)]);
  if (r3 == r4) 
  {
    r3 = (r2 * 276) | 0;
    r0 = (r0 + r3) | 0;
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0 + (-41))]);
    if (r0 != 0) 
    {
      r1 = _E2_str434;
      r2 = _E2_str483;
      heapClassInst.heap32[(g0)] = Int32(r1);
      heapClassInst.heap32[(g0 + 1)] = Int32(r2);
      heapClassInst.heap32[(g0 + 2)] = 160;
      _assert(i7);
    }
  }
  else {
    r4 = (r4 * 276) | 0;
    r5 = (r0 + 4) | 0;
    r3 = (r3 * 276) | 0;
    r4 = (r5 + r4) | 0;
    r3 = (r5 + r3) | 0;
    r2 = (r2 * 276) | 0;
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    heapClassInst.heap32[(g0 + 2)] = 276;
    r0 = (r0 + r2) | 0;
    memcpy(i7);
    r2 = r0 >> 2;
    heapClassInst.heap32[(r2 + (-41))] = 0;
    heapClassInst.heap32[(r2 + (-16))] = 0;
    heapClassInst.heap32[(r2 + (-8))] = 0;
    heapClassInst.heap32[(r2)] = 0;
    r3 = 0;
    heapClassInst.heap32[(r2 + (-40))] = 0;
    heapClassInst.heap8[r0 + (-156)] = Int8(r3);
    heapClassInst.heap32[(r2 + (-38))] = 0;
    heapClassInst.heap32[(r2 + (-37))] = 0;
    heapClassInst.heap32[(r2 + (-32))] = 0;
    r2 = Int64(heapClassInst.heap32[(r1 + 279)]);
  }
  r0 = (r2 + (-1)) | 0;
  heapClassInst.heap32[(r1 + 279)] = Int32(r0);
  return;
}

@OverflowWrapping
func _ZN20btPersistentManifold20refreshContactPointsERK11btTransformS2_(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var r5: Int64 = 0
  var r6: Int64 = 0
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
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1 + 279)]);
  r3 = (r2 + (-1)) | 0;
  if (r3 > ( -1)) 
  {
    r3 = Int64(heapClassInst.heap32[(fp + 1)]);
    r4 = Int64(heapClassInst.heap32[(fp + 2)]);
    while (true) {
      r5 = (r2 * 69) | 0;
      r5 = r5 << 2;
      r5 = (r0 + r5) | 0;
      r6 = r3 >> 2;
      r5 = r5 >> 2;
      f0 = Float64(heapClassInst.heapFloat[(r5 + (-68))]);
      f1 = Float64(heapClassInst.heapFloat[(r6)]);
      f2 = Float64(heapClassInst.heapFloat[(r5 + (-67))]);
      f3 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
      f4 = Float64(heapClassInst.heapFloat[(r6 + 4)]);
      f5 = Float64(heapClassInst.heapFloat[(r6 + 5)]);
      f1 = f1 * f0;
      f3 = f3 * f2;
      f6 = Float64(heapClassInst.heapFloat[(r5 + (-66))]);
      f7 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
      f8 = Float64(heapClassInst.heapFloat[(r6 + 8)]);
      f9 = Float64(heapClassInst.heapFloat[(r6 + 9)]);
      f10 = Float64(heapClassInst.heapFloat[(r6 + 6)]);
      f4 = f4 * f0;
      f5 = f5 * f2;
      f1 = f1 + f3;
      f3 = f7 * f6;
      f7 = Float64(heapClassInst.heapFloat[(r6 + 10)]);
      f0 = f8 * f0;
      f2 = f9 * f2;
      f4 = f4 + f5;
      f5 = f10 * f6;
      f1 = f1 + f3;
      f3 = Float64(heapClassInst.heapFloat[(r6 + 12)]);
      f8 = Float64(heapClassInst.heapFloat[(r6 + 14)]);
      f9 = Float64(heapClassInst.heapFloat[(r6 + 13)]);
      f4 = f4 + f5;
      f0 = f0 + f2;
      f2 = f7 * f6;
      f1 = f1 + f3;
      f0 = f0 + f2;
      f2 = f4 + f9;
      heapClassInst.heapFloat[(r5 + (-56))] = Float32(f1);
      f0 = f0 + f8;
      heapClassInst.heapFloat[(r5 + (-55))] = Float32(f2);
      heapClassInst.heapFloat[(r5 + (-54))] = Float32(f0);
      heapClassInst.heap32[(r5 + (-53))] = 0;
      r6 = r4 >> 2;
      f0 = Float64(heapClassInst.heapFloat[(r5 + (-64))]);
      f1 = Float64(heapClassInst.heapFloat[(r6)]);
      f2 = Float64(heapClassInst.heapFloat[(r5 + (-63))]);
      f3 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
      f4 = Float64(heapClassInst.heapFloat[(r6 + 4)]);
      f5 = Float64(heapClassInst.heapFloat[(r6 + 5)]);
      f1 = f1 * f0;
      f3 = f3 * f2;
      f6 = Float64(heapClassInst.heapFloat[(r5 + (-62))]);
      f7 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
      f8 = Float64(heapClassInst.heapFloat[(r6 + 8)]);
      f9 = Float64(heapClassInst.heapFloat[(r6 + 9)]);
      f10 = Float64(heapClassInst.heapFloat[(r6 + 6)]);
      f4 = f4 * f0;
      f5 = f5 * f2;
      f1 = f1 + f3;
      f3 = f7 * f6;
      f7 = Float64(heapClassInst.heapFloat[(r6 + 10)]);
      f0 = f8 * f0;
      f2 = f9 * f2;
      f4 = f4 + f5;
      f5 = f10 * f6;
      f1 = f1 + f3;
      f3 = Float64(heapClassInst.heapFloat[(r6 + 12)]);
      f8 = Float64(heapClassInst.heapFloat[(r6 + 14)]);
      f9 = Float64(heapClassInst.heapFloat[(r6 + 13)]);
      f4 = f4 + f5;
      f0 = f0 + f2;
      f2 = f7 * f6;
      f1 = f1 + f3;
      f0 = f0 + f2;
      f2 = f4 + f9;
      heapClassInst.heapFloat[(r5 + (-60))] = Float32(f1);
      f0 = f0 + f8;
      heapClassInst.heapFloat[(r5 + (-59))] = Float32(f2);
      heapClassInst.heapFloat[(r5 + (-58))] = Float32(f0);
      heapClassInst.heap32[(r5 + (-57))] = 0;
      f0 = Float64(heapClassInst.heapFloat[(r5 + (-55))]);
      f1 = Float64(heapClassInst.heapFloat[(r5 + (-59))]);
      f2 = Float64(heapClassInst.heapFloat[(r5 + (-56))]);
      f3 = Float64(heapClassInst.heapFloat[(r5 + (-60))]);
      f2 = f2 - f3;
      f3 = Float64(heapClassInst.heapFloat[(r5 + (-52))]);
      f0 = f0 - f1;
      f1 = Float64(heapClassInst.heapFloat[(r5 + (-51))]);
      f4 = Float64(heapClassInst.heapFloat[(r5 + (-54))]);
      f5 = Float64(heapClassInst.heapFloat[(r5 + (-58))]);
      f6 = Float64(heapClassInst.heapFloat[(r5 + (-50))]);
      f4 = f4 - f5;
      f2 = f2 * f3;
      f0 = f0 * f1;
      f0 = f2 + f0;
      f1 = f4 * f6;
      f0 = f0 + f1;
      heapClassInst.heapFloat[(r5 + (-48))] = Float32(f0);
      r6 = Int64(heapClassInst.heap32[(r5 + (-32))]);
      r2 = (r2 + (-1)) | 0;
      r6 = (r6 + 1) | 0;
      heapClassInst.heap32[(r5 + (-32))] = Int32(r6);
      if (!(r2 != 0)) 
      {
        break 
      }
    }
    r2 = Int64(heapClassInst.heap32[(r1 + 279)]);
  }
  r2 = (r2 + (-1)) | 0;
  do {
    if (!(r2 < 0)) 
    {
      while (true) {
        r3 = r2;
        r2 = (r3 * 69) | 0;
        r2 = r2 << 2;
        r2 = (r0 + r2) | 0;
        r2 = r2 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r2 + 21)]);
        f1 = Float64(heapClassInst.heapFloat[(r1 + 280)]);
        if (f0 <= f1) 
        {
          f2 = Float64(heapClassInst.heapFloat[(r2 + 17)]);
          f3 = Float64(heapClassInst.heapFloat[(r2 + 18)]);
          f4 = Float64(heapClassInst.heapFloat[(r2 + 19)]);
          f5 = Float64(heapClassInst.heapFloat[(r2 + 13)]);
          f2 = f2 * f0;
          f6 = Float64(heapClassInst.heapFloat[(r2 + 14)]);
          f3 = f3 * f0;
          f7 = Float64(heapClassInst.heapFloat[(r2 + 9)]);
          f2 = f5 - f2;
          f5 = Float64(heapClassInst.heapFloat[(r2 + 10)]);
          f3 = f6 - f3;
          f6 = Float64(heapClassInst.heapFloat[(r2 + 15)]);
          f0 = f4 * f0;
          f2 = f7 - f2;
          f3 = f5 - f3;
          f4 = Float64(heapClassInst.heapFloat[(r2 + 11)]);
          f0 = f6 - f0;
          f0 = f4 - f0;
          f2 = f2 * f2;
          f3 = f3 * f3;
          f2 = f2 + f3;
          f0 = f0 * f0;
          f1 = f1 * f1;
          f0 = f2 + f0;
          if (!(f1 >= f0)) 
          {
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r3);
            _ZN20btPersistentManifold18removeContactPointEi(i7);
          }
        }
        else {
          heapClassInst.heap32[(g0)] = Int32(r0);
          heapClassInst.heap32[(g0 + 1)] = Int32(r3);
          _ZN20btPersistentManifold18removeContactPointEi(i7);
        }
        r2 = (r3 + (-1)) | 0;
        if (r3 != 0) 
        {
          continue 
        }
        else {
          break 
        }
      }
    }
  } while (false);
  return;
}

@OverflowWrapping
func _ZN25btTriangleRaycastCallback15processTriangleEP9btVector3ii(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var r5: Int64 = 0
  var r6: Int64 = 0
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
  var __label__ = 0;
  i7 = sp + (-56); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
  f1 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f2 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
  f3 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
  f4 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f5 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
  f6 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
  f7 = Float64(heapClassInst.heapFloat[(r0)]);
  f8 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
  f9 = f3 - f4;
  f10 = f2 - f1;
  f11 = f0 - f1;
  f12 = f5 - f4;
  f13 = f8 - f7;
  f14 = f6 - f7;
  f15 = f9 * f10;
  f16 = f11 * f12;
  f15 = f15 - f16;
  r0 = sp + (-32);
  f11 = f11 * f13;
  f10 = f14 * f10;
  f10 = f11 - f10;
  r1 = r0 >> 2;
  heapClassInst.heapFloat[(fp + (-8))] = Float32(f15);
  f11 = f14 * f12;
  f9 = f9 * f13;
  f9 = f11 - f9;
  heapClassInst.heapFloat[(r1 + 1)] = Float32(f10);
  r2 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heapFloat[(r1 + 2)] = Float32(f9);
  r3 = r2 >> 2;
  heapClassInst.heap32[(r1 + 3)] = 0;
  f11 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
  f12 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
  f13 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
  f14 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
  f16 = Float64(heapClassInst.heapFloat[(r3 + 3)]);
  f17 = Float64(heapClassInst.heapFloat[(r3 + 7)]);
  f18 = f15 * f11;
  f19 = f10 * f12;
  f20 = f15 * f13;
  f21 = f10 * f14;
  f22 = f7 * f15;
  f23 = f4 * f10;
  f18 = f18 + f19;
  f19 = f9 * f16;
  f20 = f20 + f21;
  f21 = f9 * f17;
  f22 = f22 + f23;
  f23 = f1 * f9;
  f18 = f18 + f19;
  f19 = f22 + f23;
  f20 = f20 + f21;
  f18 = f18 - f19;
  f19 = f20 - f19;
  f20 = f18 * f19;
  f21 = 0.0;
  do {
    if (!(f20 >= f21)) 
    {
      r4 = Int64(heapClassInst.heap32[(r3 + 9)]);
      r4 = r4 & 1;
      if (!(r4 == 0)) 
      {
        if (f18 > f21) 
        {
          break 
        }
      }
      f19 = f18 - f19;
      f19 = f18 / f19;
      f20 = Float64(heapClassInst.heapFloat[(r3 + 10)]);
      if (!(f20 <= f19)) 
      {
        f20 = 1.0;
        f22 = f20 - f19;
        f16 = f16 * f22;
        f17 = f17 * f19;
        f12 = f12 * f22;
        f14 = f14 * f19;
        f11 = f11 * f22;
        f13 = f13 * f19;
        f16 = f16 + f17;
        f12 = f12 + f14;
        f11 = f11 + f13;
        f1 = f1 - f16;
        f3 = f3 - f12;
        f7 = f7 - f11;
        f0 = f0 - f16;
        f4 = f4 - f12;
        f6 = f6 - f11;
        f13 = f15 * f15;
        f14 = f10 * f10;
        f17 = f4 * f0;
        f22 = f1 * f3;
        f23 = f1 * f6;
        f24 = f7 * f0;
        f13 = f13 + f14;
        f14 = f9 * f9;
        f17 = f17 - f22;
        f22 = f23 - f24;
        f13 = f13 + f14;
        f14 = -9.9999997473787516e-005;
        f23 = f7 * f3;
        f24 = f4 * f6;
        f23 = f23 - f24;
        f14 = f13 * f14;
        f17 = f17 * f15;
        f22 = f22 * f10;
        f17 = f17 + f22;
        f22 = f23 * f9;
        f17 = f17 + f22;
        if (!(f17 < f14)) 
        {
          f2 = f2 - f16;
          f5 = f5 - f12;
          f8 = f8 - f11;
          f11 = f3 * f2;
          f12 = f0 * f5;
          f0 = f0 * f8;
          f16 = f6 * f2;
          f11 = f11 - f12;
          f0 = f0 - f16;
          f6 = f6 * f5;
          f3 = f3 * f8;
          f11 = f11 * f15;
          f0 = f0 * f10;
          f3 = f6 - f3;
          f0 = f11 + f0;
          f3 = f3 * f9;
          f0 = f0 + f3;
          if (!(f0 < f14)) 
          {
            f0 = f5 * f1;
            f3 = f2 * f4;
            f2 = f2 * f7;
            f1 = f8 * f1;
            f0 = f0 - f3;
            f1 = f2 - f1;
            f2 = f8 * f4;
            f3 = f5 * f7;
            f0 = f0 * f15;
            f1 = f1 * f10;
            f2 = f2 - f3;
            f0 = f0 + f1;
            f1 = f2 * f9;
            f0 = f0 + f1;
            if (!(f0 < f14)) 
            {
              r4 = Int64(heapClassInst.heap32[(fp + 2)]);
              r5 = Int64(heapClassInst.heap32[(fp + 3)]);
              heapClassInst.heapFloat[(g0)] = Float32(f13);
              sqrtf(i7);
              f0 = f20 / commonVariable.f_g0;
              f1 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
              f1 = f1 * f0;
              heapClassInst.heapFloat[(fp + (-8))] = Float32(f1);
              f2 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
              f2 = f2 * f0;
              heapClassInst.heapFloat[(r1 + 1)] = Float32(f2);
              f3 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
              f0 = f3 * f0;
              heapClassInst.heapFloat[(r1 + 2)] = Float32(f0);
              r1 = Int64(heapClassInst.heap32[(r3)]);
              r1 = r1 >> 2;
              r1 = Int64(heapClassInst.heap32[(r1 + 3)]);
              r6 = Int64(heapClassInst.heap32[(r3 + 9)]);
              r6 = r6 & 2;
              if (r6 != 0) 
              {
                __label__ = 9;
              }
              else {
                if (f18 > f21) 
                {
                  __label__ = 10;
                }
                else {
                  __label__ = 9;
                }
              }
              if (__label__ == 9) {
                r0 = sp + (-16);
                f1 = -f1;
                r6 = r0 >> 2;
                f2 = -f2;
                heapClassInst.heapFloat[(fp + (-4))] = Float32(f1);
                f0 = -f0;
                heapClassInst.heapFloat[(r6 + 1)] = Float32(f2);
                heapClassInst.heapFloat[(r6 + 2)] = Float32(f0);
                heapClassInst.heap32[(r6 + 3)] = 0;
              }
              heapClassInst.heap32[(g0)] = Int32(r2);
              heapClassInst.heap32[(g0 + 1)] = Int32(r0);
              heapClassInst.heapFloat[(g0 + 2)] = Float32(f19);
              heapClassInst.heap32[(g0 + 3)] = Int32(r4);
              heapClassInst.heap32[(g0 + 4)] = Int32(r5);
              __FUNCTION_TABLE__[(r1) >> 2](i7);
              heapClassInst.heapFloat[(r3 + 10)] = Float32(commonVariable.f_g0);
            }
          }
        }
      }
    }
  } while (false);
  return;
}

@OverflowWrapping
func _ZN28btTriangleConvexcastCallbackC2EPK13btConvexShapeRK11btTransformS5_S5_f(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV28btTriangleConvexcastCallback;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heap32[(r0)] = Int32(r1);
  r1 = r2 >> 2;
  heapClassInst.heap32[(r0 + 1)] = Int32(r3);
  heapClassInst.heap32[(r0 + 2)] = heapClassInst.heap32[(r1)];
  heapClassInst.heap32[(r0 + 3)] = heapClassInst.heap32[(r1 + 1)];
  heapClassInst.heap32[(r0 + 4)] = heapClassInst.heap32[(r1 + 2)];
  heapClassInst.heap32[(r0 + 5)] = heapClassInst.heap32[(r1 + 3)];
  heapClassInst.heap32[(r0 + 6)] = heapClassInst.heap32[(r1 + 4)];
  heapClassInst.heap32[(r0 + 7)] = heapClassInst.heap32[(r1 + 5)];
  heapClassInst.heap32[(r0 + 8)] = heapClassInst.heap32[(r1 + 6)];
  heapClassInst.heap32[(r0 + 9)] = heapClassInst.heap32[(r1 + 7)];
  heapClassInst.heap32[(r0 + 10)] = heapClassInst.heap32[(r1 + 8)];
  heapClassInst.heap32[(r0 + 11)] = heapClassInst.heap32[(r1 + 9)];
  heapClassInst.heap32[(r0 + 12)] = heapClassInst.heap32[(r1 + 10)];
  heapClassInst.heap32[(r0 + 13)] = heapClassInst.heap32[(r1 + 11)];
  heapClassInst.heap32[(r0 + 14)] = heapClassInst.heap32[(r1 + 12)];
  heapClassInst.heap32[(r0 + 15)] = heapClassInst.heap32[(r1 + 13)];
  r2 = Int64(heapClassInst.heap32[(fp + 3)]);
  heapClassInst.heap32[(r0 + 16)] = heapClassInst.heap32[(r1 + 14)];
  r2 = r2 >> 2;
  heapClassInst.heap32[(r0 + 17)] = heapClassInst.heap32[(r1 + 15)];
  heapClassInst.heap32[(r0 + 18)] = heapClassInst.heap32[(r2)];
  heapClassInst.heap32[(r0 + 19)] = heapClassInst.heap32[(r2 + 1)];
  heapClassInst.heap32[(r0 + 20)] = heapClassInst.heap32[(r2 + 2)];
  heapClassInst.heap32[(r0 + 21)] = heapClassInst.heap32[(r2 + 3)];
  heapClassInst.heap32[(r0 + 22)] = heapClassInst.heap32[(r2 + 4)];
  heapClassInst.heap32[(r0 + 23)] = heapClassInst.heap32[(r2 + 5)];
  heapClassInst.heap32[(r0 + 24)] = heapClassInst.heap32[(r2 + 6)];
  heapClassInst.heap32[(r0 + 25)] = heapClassInst.heap32[(r2 + 7)];
  heapClassInst.heap32[(r0 + 26)] = heapClassInst.heap32[(r2 + 8)];
  heapClassInst.heap32[(r0 + 27)] = heapClassInst.heap32[(r2 + 9)];
  heapClassInst.heap32[(r0 + 28)] = heapClassInst.heap32[(r2 + 10)];
  heapClassInst.heap32[(r0 + 29)] = heapClassInst.heap32[(r2 + 11)];
  heapClassInst.heap32[(r0 + 30)] = heapClassInst.heap32[(r2 + 12)];
  heapClassInst.heap32[(r0 + 31)] = heapClassInst.heap32[(r2 + 13)];
  r1 = Int64(heapClassInst.heap32[(fp + 4)]);
  heapClassInst.heap32[(r0 + 32)] = heapClassInst.heap32[(r2 + 14)];
  r1 = r1 >> 2;
  heapClassInst.heap32[(r0 + 33)] = heapClassInst.heap32[(r2 + 15)];
  heapClassInst.heap32[(r0 + 34)] = heapClassInst.heap32[(r1)];
  heapClassInst.heap32[(r0 + 35)] = heapClassInst.heap32[(r1 + 1)];
  heapClassInst.heap32[(r0 + 36)] = heapClassInst.heap32[(r1 + 2)];
  heapClassInst.heap32[(r0 + 37)] = heapClassInst.heap32[(r1 + 3)];
  heapClassInst.heap32[(r0 + 38)] = heapClassInst.heap32[(r1 + 4)];
  heapClassInst.heap32[(r0 + 39)] = heapClassInst.heap32[(r1 + 5)];
  heapClassInst.heap32[(r0 + 40)] = heapClassInst.heap32[(r1 + 6)];
  heapClassInst.heap32[(r0 + 41)] = heapClassInst.heap32[(r1 + 7)];
  heapClassInst.heap32[(r0 + 42)] = heapClassInst.heap32[(r1 + 8)];
  heapClassInst.heap32[(r0 + 43)] = heapClassInst.heap32[(r1 + 9)];
  heapClassInst.heap32[(r0 + 44)] = heapClassInst.heap32[(r1 + 10)];
  heapClassInst.heap32[(r0 + 45)] = heapClassInst.heap32[(r1 + 11)];
  heapClassInst.heap32[(r0 + 46)] = heapClassInst.heap32[(r1 + 12)];
  heapClassInst.heap32[(r0 + 47)] = heapClassInst.heap32[(r1 + 13)];
  heapClassInst.heap32[(r0 + 48)] = heapClassInst.heap32[(r1 + 14)];
  heapClassInst.heap32[(r0 + 49)] = heapClassInst.heap32[(r1 + 15)];
  heapClassInst.heap32[(r0 + 50)] = 1065353216;
  heapClassInst.heap32[(r0 + 51)] = heapClassInst.heap32[(fp + 5)];
  return;
}

@OverflowWrapping
func _ZN28btTriangleConvexcastCallbackD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV18btTriangleCallback;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

@OverflowWrapping
func _ZN28btTriangleConvexcastCallbackD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV18btTriangleCallback;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

@OverflowWrapping
func _ZN28btTriangleConvexcastCallback15processTriangleEP9btVector3ii(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  i7 = sp + (-696); 
  var g0 = i7 >> 2; 
  r0 = sp + (-104);
  r1 = r0 >> 2;
  heapClassInst.heap32[(r1 + 2)] = 0;
  heapClassInst.heap32[(r1 + 3)] = 1065353216;
  heapClassInst.heap32[(r1 + 4)] = 1065353216;
  r2 = _ZTV15btTriangleShape;
  heapClassInst.heap32[(r1 + 5)] = 1065353216;
  r2 = (r2 + 8) | 0;
  heapClassInst.heap32[(r1 + 6)] = 0;
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heap32[(fp + (-26))] = Int32(r2);
  r2 = r3 >> 2;
  heapClassInst.heap32[(r1 + 1)] = 1;
  heapClassInst.heap32[(r1 + 13)] = heapClassInst.heap32[(r2)];
  heapClassInst.heap32[(r1 + 14)] = heapClassInst.heap32[(r2 + 1)];
  heapClassInst.heap32[(r1 + 15)] = heapClassInst.heap32[(r2 + 2)];
  heapClassInst.heap32[(r1 + 16)] = heapClassInst.heap32[(r2 + 3)];
  heapClassInst.heap32[(r1 + 17)] = heapClassInst.heap32[(r2 + 4)];
  heapClassInst.heap32[(r1 + 18)] = heapClassInst.heap32[(r2 + 5)];
  heapClassInst.heap32[(r1 + 19)] = heapClassInst.heap32[(r2 + 6)];
  heapClassInst.heap32[(r1 + 20)] = heapClassInst.heap32[(r2 + 7)];
  heapClassInst.heap32[(r1 + 21)] = heapClassInst.heap32[(r2 + 8)];
  heapClassInst.heap32[(r1 + 22)] = heapClassInst.heap32[(r2 + 9)];
  r3 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heap32[(r1 + 23)] = heapClassInst.heap32[(r2 + 10)];
  r4 = sp + (-464);
  r5 = r3 >> 2;
  heapClassInst.heap32[(r1 + 24)] = heapClassInst.heap32[(r2 + 11)];
  r2 = r4 >> 2;
  heapClassInst.heap32[(r1 + 11)] = heapClassInst.heap32[(r5 + 51)];
  r1 = _ZTV30btGjkEpaPenetrationDepthSolver;
  r6 = 0;
  heapClassInst.heap32[(r2 + 77)] = 953267991;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap8[sp + (-132)] = Int8(r6);
  heapClassInst.heap32[(fp + (-118))] = Int32(r1);
  r1 = _ZTV27btContinuousConvexCollision;
  r2 = sp + (-496);
  r6 = Int64(heapClassInst.heap32[(r5 + 1)]);
  r1 = (r1 + 8) | 0;
  r7 = r2 >> 2;
  heapClassInst.heap32[(fp + (-124))] = Int32(r1);
  r1 = sp + (-472);
  heapClassInst.heap32[(r7 + 1)] = Int32(r4);
  heapClassInst.heap32[(r7 + 2)] = Int32(r1);
  r1 = _ZTVN12btConvexCast10CastResultE;
  heapClassInst.heap32[(r7 + 3)] = Int32(r6);
  r4 = sp + (-672);
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r7 + 4)] = Int32(r0);
  r0 = r4 >> 2;
  heapClassInst.heap32[(fp + (-168))] = Int32(r1);
  heapClassInst.heap32[(r0 + 42)] = 0;
  heapClassInst.heap32[(r0 + 43)] = 0;
  heapClassInst.heap32[(r0 + 41)] = 1065353216;
  r1 = (r3 + 136) | 0;
  r6 = (r3 + 8) | 0;
  r7 = (r3 + 72) | 0;
  heapClassInst.heap32[(g0)] = Int32(r2);
  heapClassInst.heap32[(g0 + 1)] = Int32(r6);
  heapClassInst.heap32[(g0 + 2)] = Int32(r7);
  heapClassInst.heap32[(g0 + 3)] = Int32(r1);
  heapClassInst.heap32[(g0 + 4)] = Int32(r1);
  heapClassInst.heap32[(g0 + 5)] = Int32(r4);
  _ZN27btContinuousConvexCollision16calcTimeOfImpactERK11btTransformS2_S2_S2_RN12btConvexCast10CastResultE(i7);
  r1 = commonVariable.r_g0;
  if (!(r1 == 0)) 
  {
    f0 = Float64(heapClassInst.heapFloat[(r0 + 33)]);
    f1 = Float64(heapClassInst.heapFloat[(r0 + 34)]);
    f2 = Float64(heapClassInst.heapFloat[(r0 + 35)]);
    f0 = f0 * f0;
    f1 = f1 * f1;
    f0 = f0 + f1;
    f1 = f2 * f2;
    f0 = f0 + f1;
    f1 = 9.9999997473787516e-005;
    if (!(f0 <= f1)) 
    {
      f1 = Float64(heapClassInst.heapFloat[(r0 + 41)]);
      f2 = Float64(heapClassInst.heapFloat[(r5 + 50)]);
      if (!(f1 >= f2)) 
      {
        r1 = Int64(heapClassInst.heap32[(fp + 2)]);
        r2 = Int64(heapClassInst.heap32[(fp + 3)]);
        heapClassInst.heapFloat[(g0)] = Float32(f0);
        sqrtf(i7);
        f1 = 1.0
        f0 = f1 / commonVariable.f_g0;
        f1 = Float64(heapClassInst.heapFloat[(r0 + 33)]);
        f1 = f1 * f0;
        heapClassInst.heapFloat[(r0 + 33)] = Float32(f1);
        f1 = Float64(heapClassInst.heapFloat[(r0 + 34)]);
        f1 = f1 * f0;
        heapClassInst.heapFloat[(r0 + 34)] = Float32(f1);
        f1 = Float64(heapClassInst.heapFloat[(r0 + 35)]);
        f0 = f1 * f0;
        heapClassInst.heapFloat[(r0 + 35)] = Float32(f0);
        r5 = Int64(heapClassInst.heap32[(r5)]);
        r5 = r5 >> 2;
        r5 = Int64(heapClassInst.heap32[(r5 + 3)]);
        f0 = Float64(heapClassInst.heapFloat[(r0 + 41)]);
        r0 = (r4 + 132) | 0;
        r4 = (r4 + 148) | 0;
        heapClassInst.heap32[(g0)] = Int32(r3);
        heapClassInst.heap32[(g0 + 1)] = Int32(r0);
        heapClassInst.heap32[(g0 + 2)] = Int32(r4);
        heapClassInst.heapFloat[(g0 + 3)] = Float32(f0);
        heapClassInst.heap32[(g0 + 4)] = Int32(r1);
        heapClassInst.heap32[(g0 + 5)] = Int32(r2);
        __FUNCTION_TABLE__[(r5) >> 2](i7);
      }
    }
  }
  return;
}

@OverflowWrapping
func _ZN22btSubsimplexConvexCastD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV12btConvexCast;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

@OverflowWrapping
func _ZN22btSubsimplexConvexCastD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV12btConvexCast;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

@OverflowWrapping
func _ZN22btSubsimplexConvexCast16calcTimeOfImpactERK11btTransformS2_S2_S2_RN12btConvexCast10CastResultE(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  i7 = sp + (-240); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r2 = 0;
  r3 = r1 >> 2;
  heapClassInst.heap8[r1 + 312] = Int8(r2);
  r4 = 1;
  heapClassInst.heap32[(r3)] = 0;
  heapClassInst.heap8[r1 + 356] = Int8(r4);
  heapClassInst.heap32[(r3 + 73)] = 1566444395;
  heapClassInst.heap32[(r3 + 74)] = 1566444395;
  heapClassInst.heap32[(r3 + 75)] = 1566444395;
  heapClassInst.heap32[(r3 + 76)] = 0;
  heapClassInst.heap8[r1 + 352] = Int8(r2);
  heapClassInst.heap32[(r3 + 84)] = 0;
  heapClassInst.heap32[(r3 + 85)] = 0;
  heapClassInst.heap32[(r3 + 86)] = 0;
  heapClassInst.heap32[(r3 + 87)] = 0;
  r3 = Int64(heapClassInst.heapU8[r1 + 332]);
  r5 = Int64(heapClassInst.heap32[(fp + 1)]);
  r6 = Int64(heapClassInst.heap32[(fp + 2)]);
  r7 = Int64(heapClassInst.heap32[(fp + 4)]);
  r8 = Int64(heapClassInst.heap32[(fp + 3)]);
  r3 = r3 & 240;
  heapClassInst.heap8[r1 + 332] = Int8(r3);
  r1 = r5 >> 2;
  r3 = r8 >> 2;
  r5 = r6 >> 2;
  r6 = r7 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r1 + 12)]);
  f1 = Float64(heapClassInst.heapFloat[(r5 + 12)]);
  f2 = Float64(heapClassInst.heapFloat[(r3 + 12)]);
  f3 = Float64(heapClassInst.heapFloat[(r6 + 12)]);
  f4 = Float64(heapClassInst.heapFloat[(r1 + 13)]);
  f5 = Float64(heapClassInst.heapFloat[(r5 + 13)]);
  f6 = Float64(heapClassInst.heapFloat[(r3 + 13)]);
  f7 = Float64(heapClassInst.heapFloat[(r6 + 13)]);
  r7 = Int64(heapClassInst.heap32[(r0 + 2)]);
  f1 = f1 - f0;
  f3 = f3 - f2;
  f1 = f1 - f3;
  heapClassInst.heapFloat[(fp + (-50))] = Float32(f1);
  f3 = Float64(heapClassInst.heapFloat[(r1 + 14)]);
  f8 = Float64(heapClassInst.heapFloat[(r5 + 14)]);
  f9 = Float64(heapClassInst.heapFloat[(r3 + 14)]);
  f10 = Float64(heapClassInst.heapFloat[(r6 + 14)]);
  r8 = r7 >> 2;
  f5 = f5 - f4;
  f7 = f7 - f6;
  f5 = f5 - f7;
  heapClassInst.heapFloat[(fp + (-51))] = Float32(f5);
  f7 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
  heapClassInst.heapFloat[(fp + (-42))] = Float32(f7);
  f11 = Float64(heapClassInst.heapFloat[(r1)]);
  heapClassInst.heapFloat[(fp + (-43))] = Float32(f11);
  f12 = -f1;
  r8 = Int64(heapClassInst.heap32[(r8)]);
  f8 = f8 - f3;
  f10 = f10 - f9;
  f13 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  heapClassInst.heapFloat[(fp + (-44))] = Float32(f13);
  f14 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
  heapClassInst.heapFloat[(fp + (-45))] = Float32(f14);
  r8 = r8 >> 2;
  f8 = f8 - f10;
  heapClassInst.heapFloat[(fp + (-52))] = Float32(f8);
  f10 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
  heapClassInst.heapFloat[(fp + (-46))] = Float32(f10);
  f11 = f11 * f12;
  f7 = f7 * f5;
  f15 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  heapClassInst.heapFloat[(fp + (-47))] = Float32(f15);
  f16 = Float64(heapClassInst.heapFloat[(r1 + 6)]);
  f17 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
  f18 = Float64(heapClassInst.heapFloat[(r1 + 10)]);
  f19 = Float64(heapClassInst.heapFloat[(r3)]);
  heapClassInst.heapFloat[(fp + (-33))] = Float32(f19);
  f19 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
  heapClassInst.heapFloat[(fp + (-34))] = Float32(f19);
  f19 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
  heapClassInst.heapFloat[(fp + (-35))] = Float32(f19);
  f19 = Float64(heapClassInst.heapFloat[(r3 + 4)]);
  heapClassInst.heapFloat[(fp + (-36))] = Float32(f19);
  f19 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
  heapClassInst.heapFloat[(fp + (-37))] = Float32(f19);
  f19 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
  heapClassInst.heapFloat[(fp + (-38))] = Float32(f19);
  f19 = Float64(heapClassInst.heapFloat[(r3 + 8)]);
  heapClassInst.heapFloat[(fp + (-39))] = Float32(f19);
  f19 = Float64(heapClassInst.heapFloat[(r3 + 9)]);
  heapClassInst.heapFloat[(fp + (-40))] = Float32(f19);
  f19 = Float64(heapClassInst.heapFloat[(r3 + 10)]);
  heapClassInst.heapFloat[(fp + (-41))] = Float32(f19);
  r8 = Int64(heapClassInst.heap32[(r8 + 15)]);
  f13 = f13 * f12;
  f14 = f14 * f5;
  f7 = f11 - f7;
  f10 = f10 * f8;
  r9 = sp + (-112);
  f11 = f15 * f12;
  f12 = f16 * f5;
  f13 = f13 - f14;
  f14 = f17 * f8;
  f7 = f7 - f10;
  r10 = r9 >> 2;
  f10 = f11 - f12;
  f11 = f18 * f8;
  f12 = f13 - f14;
  heapClassInst.heapFloat[(fp + (-28))] = Float32(f7);
  f7 = f10 - f11;
  heapClassInst.heapFloat[(r10 + 1)] = Float32(f12);
  heapClassInst.heapFloat[(r10 + 2)] = Float32(f7);
  heapClassInst.heap32[(r10 + 3)] = 0;
  r10 = sp + (-128);
  heapClassInst.heap32[(g0)] = Int32(r10);
  heapClassInst.heap32[(g0 + 1)] = Int32(r7);
  heapClassInst.heap32[(g0 + 2)] = Int32(r9);
  __FUNCTION_TABLE__[(r8) >> 2](i7);
  r7 = Int64(heapClassInst.heap32[(r0 + 3)]);
  r8 = r7 >> 2;
  r8 = Int64(heapClassInst.heap32[(r8)]);
  f7 = Float64(heapClassInst.heapFloat[(r3)]);
  f10 = Float64(heapClassInst.heapFloat[(r3 + 4)]);
  r9 = r10 >> 2;
  r8 = r8 >> 2;
  f11 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
  f12 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
  f13 = Float64(heapClassInst.heapFloat[(r3 + 8)]);
  f7 = f7 * f1;
  f10 = f10 * f5;
  f14 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
  f15 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
  f19 = Float64(heapClassInst.heapFloat[(r3 + 10)]);
  f20 = Float64(heapClassInst.heapFloat[(r3 + 9)]);
  r8 = Int64(heapClassInst.heap32[(r8 + 15)]);
  f11 = f11 * f1;
  f12 = f12 * f5;
  f7 = f7 + f10;
  f10 = f13 * f8;
  f13 = Float64(heapClassInst.heapFloat[(r1)]);
  heapClassInst.heapFloat[(fp + (-48))] = Float32(f13);
  f21 = Float64(heapClassInst.heapFloat[(fp + (-32))]);
  f22 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
  f23 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
  heapClassInst.heapFloat[(fp + (-49))] = Float32(f23);
  f24 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f25 = Float64(heapClassInst.heapFloat[(r9 + 1)]);
  f26 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
  f27 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
  f28 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f29 = Float64(heapClassInst.heapFloat[(r9 + 2)]);
  f30 = Float64(heapClassInst.heapFloat[(r1 + 6)]);
  f13 = Float64(heapClassInst.heapFloat[(r1 + 10)]);
  heapClassInst.heapFloat[(fp + (-54))] = Float32(f13);
  f13 = Float64(heapClassInst.heapFloat[(r1 + 12)]);
  heapClassInst.heapFloat[(fp + (-53))] = Float32(f13);
  f13 = Float64(heapClassInst.heapFloat[(r1 + 13)]);
  heapClassInst.heapFloat[(fp + (-56))] = Float32(f13);
  f13 = Float64(heapClassInst.heapFloat[(r1 + 14)]);
  heapClassInst.heapFloat[(fp + (-55))] = Float32(f13);
  r9 = sp + (-80);
  f1 = f14 * f1;
  f5 = f15 * f5;
  f11 = f11 + f12;
  f12 = f20 * f8;
  f7 = f7 + f10;
  r10 = r9 >> 2;
  f1 = f1 + f5;
  f5 = f19 * f8;
  f8 = f11 + f12;
  heapClassInst.heapFloat[(fp + (-20))] = Float32(f7);
  f1 = f1 + f5;
  heapClassInst.heapFloat[(r10 + 1)] = Float32(f8);
  heapClassInst.heapFloat[(r10 + 2)] = Float32(f1);
  heapClassInst.heap32[(r10 + 3)] = 0;
  r10 = sp + (-96);
  heapClassInst.heap32[(g0)] = Int32(r10);
  heapClassInst.heap32[(g0 + 1)] = Int32(r7);
  heapClassInst.heap32[(g0 + 2)] = Int32(r9);
  __FUNCTION_TABLE__[(r8) >> 2](i7);
  r7 = r10 >> 2;
  f1 = Float64(heapClassInst.heapFloat[(r3)]);
  f5 = Float64(heapClassInst.heapFloat[(fp + (-24))]);
  f7 = Float64(heapClassInst.heapFloat[(r3 + 4)]);
  f8 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
  f10 = Float64(heapClassInst.heapFloat[(r7 + 1)]);
  f11 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
  f12 = Float64(heapClassInst.heapFloat[(r3 + 8)]);
  f14 = Float64(heapClassInst.heapFloat[(r3 + 9)]);
  f13 = Float64(heapClassInst.heapFloat[(fp + (-48))]);
  f13 = f13 * f21;
  f15 = f24 * f25;
  f1 = f1 * f5;
  f8 = f8 * f10;
  f19 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
  f20 = Float64(heapClassInst.heapFloat[(r7 + 2)]);
  f24 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
  f22 = f22 * f21;
  f26 = f26 * f25;
  f7 = f7 * f5;
  f11 = f11 * f10;
  f23 = Float64(heapClassInst.heapFloat[(r3 + 10)]);
  f13 = f13 + f15;
  f15 = f28 * f29;
  f1 = f1 + f8;
  f8 = f19 * f20;
  f19 = f22 + f26;
  f22 = f30 * f29;
  f7 = f7 + f11;
  f11 = f24 * f20;
  f24 = Float64(heapClassInst.heapFloat[(fp + (-49))]);
  f21 = f24 * f21;
  f24 = f27 * f25;
  f5 = f12 * f5;
  f10 = f14 * f10;
  f12 = f13 + f15;
  f13 = f19 + f22;
  f1 = f1 + f8;
  f8 = Float64(heapClassInst.heapFloat[(r3 + 12)]);
  f7 = f7 + f11;
  f11 = Float64(heapClassInst.heapFloat[(r3 + 13)]);
  f14 = f21 + f24;
  f15 = Float64(heapClassInst.heapFloat[(fp + (-54))]);
  f15 = f15 * f29;
  f5 = f5 + f10;
  f10 = f23 * f20;
  f14 = f14 + f15;
  f15 = Float64(heapClassInst.heapFloat[(fp + (-53))]);
  f12 = f12 + f15;
  f1 = f1 + f8;
  f8 = Float64(heapClassInst.heapFloat[(fp + (-56))]);
  f8 = f13 + f8;
  f7 = f7 + f11;
  f5 = f5 + f10;
  f10 = Float64(heapClassInst.heapFloat[(r3 + 14)]);
  f1 = f12 - f1;
  f7 = f8 - f7;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-55))]);
  f8 = f14 + f13;
  f5 = f5 + f10;
  f5 = f8 - f5;
  f8 = f1 * f1;
  f10 = f7 * f7;
  f8 = f8 + f10;
  f10 = f5 * f5;
  r7 = Int64(heapClassInst.heap32[(fp + 5)]);
  f8 = f8 + f10;
  r8 = ( -33);
  f10 = 0.0;
  heapClassInst.heapFloat[(fp + (-48))] = Float32(f10);
  heapClassInst.heapFloat[(fp + (-49))] = Float32(f10);
  f11 = f10;
  while (true) {
    f12 = 9.9999997473787516e-005;
    if (f8 <= f12) 
    {
      __label__ = 19;
      break 
    }
    else {
      r8 = (r8 + 1) | 0;
      if (r8 != 0) 
      {
        r9 = Int64(heapClassInst.heap32[(r0 + 2)]);
        r10 = r9 >> 2;
        r10 = Int64(heapClassInst.heap32[(r10)]);
        f8 = -f1;
        r10 = r10 >> 2;
        f12 = Float64(heapClassInst.heapFloat[(fp + (-43))]);
        f12 = f12 * f8;
        f13 = Float64(heapClassInst.heapFloat[(fp + (-42))]);
        f13 = f13 * f7;
        r10 = Int64(heapClassInst.heap32[(r10 + 15)]);
        f14 = Float64(heapClassInst.heapFloat[(fp + (-44))]);
        f14 = f14 * f8;
        f15 = Float64(heapClassInst.heapFloat[(fp + (-45))]);
        f15 = f15 * f7;
        f12 = f12 - f13;
        f13 = Float64(heapClassInst.heapFloat[(fp + (-46))]);
        f13 = f13 * f5;
        r11 = sp + (-48);
        f19 = Float64(heapClassInst.heapFloat[(fp + (-47))]);
        f8 = f19 * f8;
        f19 = f16 * f7;
        f14 = f14 - f15;
        f15 = f17 * f5;
        f12 = f12 - f13;
        r12 = r11 >> 2;
        f8 = f8 - f19;
        f13 = f18 * f5;
        f14 = f14 - f15;
        heapClassInst.heapFloat[(fp + (-12))] = Float32(f12);
        f8 = f8 - f13;
        heapClassInst.heapFloat[(r12 + 1)] = Float32(f14);
        heapClassInst.heapFloat[(r12 + 2)] = Float32(f8);
        heapClassInst.heap32[(r12 + 3)] = 0;
        r12 = sp + (-64);
        heapClassInst.heap32[(g0)] = Int32(r12);
        heapClassInst.heap32[(g0 + 1)] = Int32(r9);
        heapClassInst.heap32[(g0 + 2)] = Int32(r11);
        __FUNCTION_TABLE__[(r10) >> 2](i7);
        r9 = Int64(heapClassInst.heap32[(r0 + 3)]);
        r10 = r9 >> 2;
        r10 = Int64(heapClassInst.heap32[(r10)]);
        r11 = r12 >> 2;
        r10 = r10 >> 2;
        f8 = Float64(heapClassInst.heapFloat[(fp + (-33))]);
        f8 = f8 * f1;
        f12 = Float64(heapClassInst.heapFloat[(fp + (-36))]);
        f12 = f12 * f7;
        f13 = Float64(heapClassInst.heapFloat[(fp + (-16))]);
        f14 = Float64(heapClassInst.heapFloat[(r11 + 1)]);
        f15 = Float64(heapClassInst.heapFloat[(r11 + 2)]);
        r10 = Int64(heapClassInst.heap32[(r10 + 15)]);
        f19 = Float64(heapClassInst.heapFloat[(fp + (-34))]);
        f19 = f19 * f1;
        f20 = Float64(heapClassInst.heapFloat[(fp + (-37))]);
        f20 = f20 * f7;
        f8 = f8 + f12;
        f12 = Float64(heapClassInst.heapFloat[(fp + (-39))]);
        f12 = f12 * f5;
        r11 = sp + (-16);
        f21 = Float64(heapClassInst.heapFloat[(fp + (-35))]);
        f21 = f21 * f1;
        f22 = Float64(heapClassInst.heapFloat[(fp + (-38))]);
        f22 = f22 * f7;
        f19 = f19 + f20;
        f20 = Float64(heapClassInst.heapFloat[(fp + (-40))]);
        f20 = f20 * f5;
        f8 = f8 + f12;
        r12 = r11 >> 2;
        f12 = f21 + f22;
        f21 = Float64(heapClassInst.heapFloat[(fp + (-41))]);
        f21 = f21 * f5;
        f19 = f19 + f20;
        heapClassInst.heapFloat[(fp + (-4))] = Float32(f8);
        f8 = f12 + f21;
        heapClassInst.heapFloat[(r12 + 1)] = Float32(f19);
        heapClassInst.heapFloat[(r12 + 2)] = Float32(f8);
        heapClassInst.heap32[(r12 + 3)] = 0;
        r12 = sp + (-32);
        heapClassInst.heap32[(g0)] = Int32(r12);
        heapClassInst.heap32[(g0 + 1)] = Int32(r9);
        heapClassInst.heap32[(g0 + 2)] = Int32(r11);
        __FUNCTION_TABLE__[(r10) >> 2](i7);
        f12 = 1.0;
        if (f11 > f12) 
        {
          __label__ = 24;
          break 
        }
        else {
          r9 = r12 >> 2;
          f8 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
          f19 = Float64(heapClassInst.heapFloat[(r9 + 1)]);
          f20 = Float64(heapClassInst.heapFloat[(r9 + 2)]);
          f21 = Float64(heapClassInst.heapFloat[(fp + (-43))]);
          f21 = f21 * f13;
          f22 = Float64(heapClassInst.heapFloat[(fp + (-44))]);
          f22 = f22 * f14;
          f23 = Float64(heapClassInst.heapFloat[(fp + (-33))]);
          f23 = f23 * f8;
          f24 = Float64(heapClassInst.heapFloat[(fp + (-34))]);
          f24 = f24 * f19;
          f25 = Float64(heapClassInst.heapFloat[(fp + (-42))]);
          f25 = f25 * f13;
          f26 = Float64(heapClassInst.heapFloat[(fp + (-45))]);
          f26 = f26 * f14;
          f27 = Float64(heapClassInst.heapFloat[(fp + (-36))]);
          f27 = f27 * f8;
          f28 = Float64(heapClassInst.heapFloat[(fp + (-37))]);
          f28 = f28 * f19;
          f21 = f21 + f22;
          f22 = Float64(heapClassInst.heapFloat[(fp + (-47))]);
          f22 = f22 * f15;
          f23 = f23 + f24;
          f24 = Float64(heapClassInst.heapFloat[(fp + (-35))]);
          f24 = f24 * f20;
          f25 = f25 + f26;
          f26 = f16 * f15;
          f27 = f27 + f28;
          f28 = Float64(heapClassInst.heapFloat[(fp + (-38))]);
          f28 = f28 * f20;
          f29 = Float64(heapClassInst.heapFloat[(fp + (-46))]);
          f13 = f29 * f13;
          f14 = f17 * f14;
          f29 = Float64(heapClassInst.heapFloat[(fp + (-39))]);
          f8 = f29 * f8;
          f29 = Float64(heapClassInst.heapFloat[(fp + (-40))]);
          f19 = f29 * f19;
          f21 = f21 + f22;
          f22 = f23 + f24;
          f23 = f25 + f26;
          f24 = f27 + f28;
          f13 = f13 + f14;
          f14 = f18 * f15;
          f8 = f8 + f19;
          f15 = Float64(heapClassInst.heapFloat[(fp + (-41))]);
          f15 = f15 * f20;
          f19 = f21 + f0;
          f20 = f22 + f2;
          f21 = f23 + f4;
          f22 = f24 + f6;
          f13 = f13 + f14;
          f8 = f8 + f15;
          f14 = f19 - f20;
          f15 = f21 - f22;
          f13 = f13 + f3;
          f23 = f8 + f9;
          f24 = f13 - f23;
          f8 = f1 * f14;
          f25 = f7 * f15;
          f8 = f8 + f25;
          f25 = f5 * f24;
          f25 = f8 + f25;
          f8 = 0.0;
          if (f25 > f8) 
          {
            f0 = Float64(heapClassInst.heapFloat[(fp + (-50))]);
            f0 = f1 * f0;
            f2 = Float64(heapClassInst.heapFloat[(fp + (-51))]);
            f2 = f7 * f2;
            f0 = f0 + f2;
            f2 = Float64(heapClassInst.heapFloat[(fp + (-52))]);
            f2 = f5 * f2;
            f0 = f0 + f2;
            f2 = -1.4210854715202004e-014;
            if (f0 >= f2) 
            {
              __label__ = 24;
              break 
            }
            else {
              f0 = f25 / f0;
              f11 = f11 - f0;
              f0 = Float64(heapClassInst.heapFloat[(r5 + 12)]);
              f2 = Float64(heapClassInst.heapFloat[(r5 + 13)]);
              f3 = Float64(heapClassInst.heapFloat[(r5 + 14)]);
              f4 = Float64(heapClassInst.heapFloat[(r6 + 12)]);
              f6 = Float64(heapClassInst.heapFloat[(r6 + 13)]);
              f9 = Float64(heapClassInst.heapFloat[(r6 + 14)]);
              f10 = Float64(heapClassInst.heapFloat[(r1 + 12)]);
              f12 = f12 - f11;
              f25 = Float64(heapClassInst.heapFloat[(r1 + 13)]);
              f26 = Float64(heapClassInst.heapFloat[(r1 + 14)]);
              f27 = Float64(heapClassInst.heapFloat[(r3 + 12)]);
              f28 = Float64(heapClassInst.heapFloat[(r3 + 13)]);
              f29 = Float64(heapClassInst.heapFloat[(r3 + 14)]);
              f10 = f10 * f12;
              f0 = f0 * f11;
              f25 = f25 * f12;
              f2 = f2 * f11;
              f26 = f26 * f12;
              f3 = f3 * f11;
              f27 = f27 * f12;
              f30 = f4 * f11;
              f28 = f28 * f12;
              f6 = f6 * f11;
              f12 = f29 * f12;
              f9 = f9 * f11;
              f0 = f10 + f0;
              f4 = f25 + f2;
              f3 = f26 + f3;
              f2 = f27 + f30;
              f6 = f28 + f6;
              f9 = f12 + f9;
              f10 = f1;
              heapClassInst.heapFloat[(fp + (-48))] = Float32(f7);
              heapClassInst.heapFloat[(fp + (-49))] = Float32(f5);
            }
          }
          r9 = Int64(heapClassInst.heap32[(r0 + 1)]);
          r10 = r9 >> 2;
          r11 = Int64(heapClassInst.heap32[(r10)]);
          do {
            if (r11 > 0) 
            {
              r12 = ( -12);
              f1 = Float64(heapClassInst.heapFloat[(r10 + 77)]);
              r13 = (r12 - r9) | 0;
              r14 = 0;
              r15 = r11;
              r12 = r14;
              while (true) {
                r16 = ( -8);
                r17 = ( -4);
                r16 = (r16 - r13) | 0;
                r17 = (r17 - r13) | 0;
                r16 = r16 >> 2;
                r17 = r17 >> 2;
                r18 = (r14 - r13) | 0;
                r18 = r18 >> 2;
                f5 = Float64(heapClassInst.heapFloat[(r16)]);
                f7 = Float64(heapClassInst.heapFloat[(r17)]);
                f5 = f14 - f5;
                f7 = f15 - f7;
                f12 = Float64(heapClassInst.heapFloat[(r18)]);
                f12 = f24 - f12;
                f5 = f5 * f5;
                f7 = f7 * f7;
                f5 = f5 + f7;
                f7 = f12 * f12;
                f5 = f5 + f7;
                r15 = (r15 + (-1)) | 0;
                r12 = if (f5 > f1) {r12} else {r4};
                r13 = (r13 + (-16)) | 0;
                if (!(r15 != 0)) 
                {
                  break 
                }
              }
            }
            else {
              r12 = r2;
            }
          } while (false);
          f1 = Float64(heapClassInst.heapFloat[(r10 + 76)]);
          if (f1 == f8) 
          {
            f1 = Float64(heapClassInst.heapFloat[(r10 + 75)]);
            if (!(f24 != f1)) 
            {
              f1 = Float64(heapClassInst.heapFloat[(r10 + 74)]);
              if (!(f15 != f1)) 
              {
                f1 = Float64(heapClassInst.heapFloat[(r10 + 73)]);
                r12 = if (f14 != f1) {r12} else {r4};
              }
            }
          }
          r12 = r12 & 255;
          if (r12 == 0) 
          {
            heapClassInst.heapFloat[(r10 + 73)] = Float32(f14);
            heapClassInst.heapFloat[(r10 + 74)] = Float32(f15);
            r11 = r11 << 4;
            heapClassInst.heapFloat[(r10 + 75)] = Float32(f24);
            r11 = (r9 + r11) | 0;
            heapClassInst.heap32[(r10 + 76)] = 0;
            r11 = r11 >> 2;
            heapClassInst.heap8[r9 + 356] = Int8(r4);
            heapClassInst.heapFloat[(r11 + 1)] = Float32(f14);
            heapClassInst.heapFloat[(r11 + 2)] = Float32(f15);
            heapClassInst.heapFloat[(r11 + 3)] = Float32(f24);
            heapClassInst.heap32[(r11 + 4)] = 0;
            r11 = Int64(heapClassInst.heap32[(r10)]);
            r11 = r11 << 4;
            r11 = (r9 + r11) | 0;
            r11 = r11 >> 2;
            heapClassInst.heapFloat[(r11 + 21)] = Float32(f19);
            heapClassInst.heapFloat[(r11 + 22)] = Float32(f21);
            heapClassInst.heapFloat[(r11 + 23)] = Float32(f13);
            heapClassInst.heap32[(r11 + 24)] = 0;
            r11 = Int64(heapClassInst.heap32[(r10)]);
            r11 = r11 << 4;
            r9 = (r9 + r11) | 0;
            r9 = r9 >> 2;
            heapClassInst.heapFloat[(r9 + 41)] = Float32(f20);
            heapClassInst.heapFloat[(r9 + 42)] = Float32(f22);
            heapClassInst.heapFloat[(r9 + 43)] = Float32(f23);
            heapClassInst.heap32[(r9 + 44)] = 0;
            r9 = Int64(heapClassInst.heap32[(r10)]);
            r9 = (r9 + 1) | 0;
            heapClassInst.heap32[(r10)] = Int32(r9);
            r9 = Int64(heapClassInst.heap32[(r0 + 1)]);
          }
          heapClassInst.heap32[(g0)] = Int32(r9);
          _ZN22btVoronoiSimplexSolver28updateClosestVectorAndPointsEv(i7);
          r10 = commonVariable.r_g0;
          r9 = r9 >> 2;
          f1 = Float64(heapClassInst.heapFloat[(r9 + 69)]);
          f7 = Float64(heapClassInst.heapFloat[(r9 + 70)]);
          f5 = Float64(heapClassInst.heapFloat[(r9 + 71)]);
          if (r10 == 0) 
          {
            continue 
          }
          else {
            f8 = f1 * f1;
            f12 = f7 * f7;
            f8 = f8 + f12;
            f12 = f5 * f5;
            f8 = f8 + f12;
            continue 
          }
        }
      }
      else {
        __label__ = 19;
        break 
      }
    }
  }
  if (__label__ == 19) {
    f0 = f10 * f10;
    f7 = Float64(heapClassInst.heapFloat[(fp + (-48))]);
    f1 = f7 * f7;
    f0 = f0 + f1;
    f1 = Float64(heapClassInst.heapFloat[(fp + (-49))]);
    f1 = f1 * f1;
    f0 = f0 + f1;
    r1 = r7 >> 2;
    heapClassInst.heapFloat[(r1 + 41)] = Float32(f11);
    f1 = 1.4210854715202004e-014;
    if (f0 < f1) 
    {
      heapClassInst.heap32[(r1 + 33)] = 0;
      heapClassInst.heap32[(r1 + 34)] = 0;
      f0 = 0.0;
      heapClassInst.heap32[(r1 + 35)] = 0;
      heapClassInst.heap32[(r1 + 36)] = 0;
      f2 = f0;
      f1 = f0;
    }
    else {
      heapClassInst.heapFloat[(g0)] = Float32(f0);
      f0 = 1.0;
      sqrtf(i7);
      f0 = f0 / commonVariable.f_g0;
      f1 = f10 * f0;
      f7 = Float64(heapClassInst.heapFloat[(fp + (-48))]);
      f2 = f7 * f0;
      heapClassInst.heapFloat[(r1 + 33)] = Float32(f1);
      f11 = Float64(heapClassInst.heapFloat[(fp + (-49))]);
      f0 = f11 * f0;
      heapClassInst.heapFloat[(r1 + 34)] = Float32(f2);
      heapClassInst.heapFloat[(r1 + 35)] = Float32(f0);
      heapClassInst.heap32[(r1 + 36)] = 0;
    }
    f3 = Float64(heapClassInst.heapFloat[(fp + (-50))]);
    f1 = f1 * f3;
    f3 = Float64(heapClassInst.heapFloat[(fp + (-51))]);
    f2 = f2 * f3;
    f3 = Float64(heapClassInst.heapFloat[(r1 + 43)]);
    f1 = f1 + f2;
    f2 = Float64(heapClassInst.heapFloat[(fp + (-52))]);
    f0 = f0 * f2;
    f0 = f1 + f0;
    f1 = -f3;
    if (!(f0 >= f1)) 
    {
      r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
      heapClassInst.heap32[(g0)] = Int32(r0);
      r0 = r0 >> 2;
      _ZN22btVoronoiSimplexSolver28updateClosestVectorAndPointsEv(i7);
      f0 = Float64(heapClassInst.heapFloat[(r0 + 68)]);
      f1 = Float64(heapClassInst.heapFloat[(r0 + 67)]);
      f2 = Float64(heapClassInst.heapFloat[(r0 + 66)]);
      heapClassInst.heap32[(r1 + 37)] = heapClassInst.heap32[(r0 + 65)];
      heapClassInst.heapFloat[(r1 + 38)] = Float32(f2);
      heapClassInst.heapFloat[(r1 + 39)] = Float32(f1);
      heapClassInst.heapFloat[(r1 + 40)] = Float32(f0);
      r0 = 1;
      commonVariable.r_g0 = r0;
      return;
    }
  }
  r0 = 0;
  commonVariable.r_g0 = r0;
  return;
}

@OverflowWrapping
func _ZN22btVoronoiSimplexSolver12removeVertexEi(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var r5: Int64 = 0
  var r6: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  if (r2 > 0) 
  {
    r3 = Int64(heapClassInst.heap32[(fp + 1)]);
    r2 = (r2 + (-1)) | 0;
    r3 = r3 << 4;
    r4 = (r0 + 4) | 0;
    r5 = r2 << 4;
    r6 = (r4 + r3) | 0;
    r4 = (r4 + r5) | 0;
    r5 = r6 >> 2;
    r4 = r4 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r2);
    heapClassInst.heap32[(r5)] = heapClassInst.heap32[(r4)];
    heapClassInst.heap32[(r5 + 1)] = heapClassInst.heap32[(r4 + 1)];
    heapClassInst.heap32[(r5 + 2)] = heapClassInst.heap32[(r4 + 2)];
    heapClassInst.heap32[(r5 + 3)] = heapClassInst.heap32[(r4 + 3)];
    r2 = Int64(heapClassInst.heap32[(r1)]);
    r4 = (r0 + 84) | 0;
    r2 = r2 << 4;
    r5 = (r4 + r3) | 0;
    r2 = (r4 + r2) | 0;
    r4 = r5 >> 2;
    r2 = r2 >> 2;
    heapClassInst.heap32[(r4)] = heapClassInst.heap32[(r2)];
    heapClassInst.heap32[(r4 + 1)] = heapClassInst.heap32[(r2 + 1)];
    heapClassInst.heap32[(r4 + 2)] = heapClassInst.heap32[(r2 + 2)];
    heapClassInst.heap32[(r4 + 3)] = heapClassInst.heap32[(r2 + 3)];
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r0 = (r0 + 164) | 0;
    r1 = r1 << 4;
    r2 = (r0 + r3) | 0;
    r0 = (r0 + r1) | 0;
    r1 = r2 >> 2;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r0)];
    heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r0 + 1)];
    heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r0 + 2)];
    heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r0 + 3)];
    return;
  }
  else {
    r0 = _E2_str457;
    r1 = _E2_str1458;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = 38;
    _assert(i7);
  }
}

@OverflowWrapping
func _ZN22btVoronoiSimplexSolver22closestPtPointTriangleERK9btVector3S2_S2_S2_R25btSubSimplexClosestResult(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 4)]);
  r1 = Int64(heapClassInst.heapU8[r0 + 16]);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  r3 = Int64(heapClassInst.heap32[(fp + 3)]);
  r4 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = r1 & ( -16);
  r5 = Int64(heapClassInst.heap32[(fp)]);
  r2 = r2 >> 2;
  heapClassInst.heap8[r0 + 16] = Int8(r1);
  r3 = r3 >> 2;
  r5 = r5 >> 2;
  r4 = r4 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
  f1 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
  f2 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
  f3 = Float64(heapClassInst.heapFloat[(r5 + 1)]);
  f4 = Float64(heapClassInst.heapFloat[(r2)]);
  f5 = Float64(heapClassInst.heapFloat[(r4)]);
  f6 = Float64(heapClassInst.heapFloat[(r3)]);
  f7 = Float64(heapClassInst.heapFloat[(r5)]);
  f8 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
  f9 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
  f10 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
  f11 = Float64(heapClassInst.heapFloat[(r5 + 2)]);
  f12 = f0 - f1;
  f13 = f4 - f5;
  f14 = f6 - f5;
  f15 = f7 - f5;
  f16 = f2 - f1;
  f17 = f3 - f1;
  f18 = f8 - f9;
  f19 = f10 - f9;
  f20 = f11 - f9;
  f21 = f13 * f15;
  f22 = f12 * f17;
  f15 = f14 * f15;
  f17 = f16 * f17;
  f21 = f21 + f22;
  f22 = f18 * f20;
  f15 = f15 + f17;
  f17 = f19 * f20;
  f20 = f21 + f22;
  f15 = f15 + f17;
  f17 = 0.0;
  if (!(f20 > f17)) 
  {
    if (!(f15 > f17)) 
    {
      r2 = r0 >> 2;
      heapClassInst.heapFloat[(r2)] = Float32(f5);
      heapClassInst.heap32[(r2 + 1)] = heapClassInst.heap32[(r4 + 1)];
      heapClassInst.heap32[(r2 + 2)] = heapClassInst.heap32[(r4 + 2)];
      r1 = r1 | 1;
      heapClassInst.heap32[(r2 + 3)] = heapClassInst.heap32[(r4 + 3)];
      heapClassInst.heap8[r0 + 16] = Int8(r1);
      heapClassInst.heap32[(r2 + 5)] = 1065353216;
      heapClassInst.heap32[(r2 + 6)] = 0;
      heapClassInst.heap32[(r2 + 7)] = 0;
      heapClassInst.heap32[(r2 + 8)] = 0;
      return;
    }
  }
  f21 = f7 - f4;
  f22 = f3 - f0;
  f23 = f13 * f21;
  f24 = f12 * f22;
  f25 = f11 - f8;
  f21 = f14 * f21;
  f22 = f16 * f22;
  f23 = f23 + f24;
  f24 = f18 * f25;
  f21 = f21 + f22;
  f22 = f19 * f25;
  f23 = f23 + f24;
  f21 = f21 + f22;
  if (f23 < f17) 
  {
    __label__ = 7;
  }
  else {
    if (f21 > f23) 
    {
      __label__ = 7;
    }
    else {
      r3 = r0 >> 2;
      heapClassInst.heapFloat[(r3)] = Float32(f4);
      heapClassInst.heap32[(r3 + 1)] = heapClassInst.heap32[(r2 + 1)];
      heapClassInst.heap32[(r3 + 2)] = heapClassInst.heap32[(r2 + 2)];
      r1 = r1 | 2;
      heapClassInst.heap32[(r3 + 3)] = heapClassInst.heap32[(r2 + 3)];
      heapClassInst.heap8[r0 + 16] = Int8(r1);
      heapClassInst.heap32[(r3 + 5)] = 0;
      heapClassInst.heap32[(r3 + 6)] = 1065353216;
      __label__ = 6;
    }
  }
  do {
    if (__label__ == 7) {
      f22 = f20 * f21;
      f24 = f23 * f15;
      f22 = f22 - f24;
      if (!(f22 > f17)) 
      {
        if (!(f20 < f17)) 
        {
          if (!(f23 > f17)) 
          {
            f0 = f20 - f23;
            f0 = f20 / f0;
            f2 = f13 * f0;
            r3 = r0 >> 2;
            f2 = f5 + f2;
            f3 = f12 * f0;
            f4 = f18 * f0;
            f1 = f1 + f3;
            heapClassInst.heapFloat[(r3)] = Float32(f2);
            f2 = f9 + f4;
            heapClassInst.heapFloat[(r3 + 1)] = Float32(f1);
            heapClassInst.heapFloat[(r3 + 2)] = Float32(f2);
            f1 = 1.0
            r1 = r1 | 3;
            heapClassInst.heap32[(r3 + 3)] = 0;
            f1 = f1 - f0;
            heapClassInst.heap8[r0 + 16] = Int8(r1);
            heapClassInst.heapFloat[(r3 + 5)] = Float32(f1);
            heapClassInst.heapFloat[(r3 + 6)] = Float32(f0);
            break 
          }
        }
      }
      f7 = f7 - f6;
      f3 = f3 - f2;
      f24 = f14 * f7;
      f25 = f16 * f3;
      f11 = f11 - f10;
      f7 = f13 * f7;
      f3 = f12 * f3;
      f24 = f24 + f25;
      f25 = f19 * f11;
      f3 = f7 + f3;
      f7 = f18 * f11;
      f11 = f24 + f25;
      f3 = f3 + f7;
      if (!(f11 < f17)) 
      {
        if (!(f3 > f11)) 
        {
          r2 = r0 >> 2;
          heapClassInst.heapFloat[(r2)] = Float32(f6);
          heapClassInst.heap32[(r2 + 1)] = heapClassInst.heap32[(r3 + 1)];
          heapClassInst.heap32[(r2 + 2)] = heapClassInst.heap32[(r3 + 2)];
          r1 = r1 | 4;
          heapClassInst.heap32[(r2 + 3)] = heapClassInst.heap32[(r3 + 3)];
          heapClassInst.heap8[r0 + 16] = Int8(r1);
          heapClassInst.heap32[(r2 + 5)] = 0;
          heapClassInst.heap32[(r2 + 6)] = 0;
          heapClassInst.heap32[(r2 + 7)] = 1065353216;
          heapClassInst.heap32[(r2 + 8)] = 0;
          return;
        }
      }
      f7 = f3 * f15;
      f20 = f20 * f11;
      f7 = f7 - f20;
      if (f7 > f17) 
      {
        __label__ = 19;
      }
      else {
        if (f15 < f17) 
        {
          __label__ = 19;
        }
        else {
          if (f11 > f17) 
          {
            __label__ = 19;
          }
          else {
            f0 = f15 - f11;
            f0 = f15 / f0;
            f2 = f14 * f0;
            r2 = r0 >> 2;
            f2 = f5 + f2;
            f3 = f16 * f0;
            f4 = f19 * f0;
            f1 = f1 + f3;
            heapClassInst.heapFloat[(r2)] = Float32(f2);
            f2 = f9 + f4;
            heapClassInst.heapFloat[(r2 + 1)] = Float32(f1);
            heapClassInst.heapFloat[(r2 + 2)] = Float32(f2);
            f1 = 1.0;
            r1 = r1 | 5;
            heapClassInst.heap32[(r2 + 3)] = 0;
            f1 = f1 - f0;
            heapClassInst.heap8[r0 + 16] = Int8(r1);
            heapClassInst.heapFloat[(r2 + 5)] = Float32(f1);
            heapClassInst.heap32[(r2 + 6)] = 0;
            __label__ = 18;
          }
        }
      }
      if (__label__ == 19) {
        f15 = f23 * f11;
        f20 = f3 * f21;
        f15 = f15 - f20;
        if (!(f15 > f17)) 
        {
          f20 = f21 - f23;
          if (!(f20 < f17)) 
          {
            f3 = f3 - f11;
            if (!(f3 < f17)) 
            {
              f1 = f20 + f3;
              f1 = f20 / f1;
              f5 = f6 - f4;
              f7 = f2 - f0;
              f5 = f5 * f1;
              f9 = f10 - f8;
              f7 = f7 * f1;
              r2 = r0 >> 2;
              f5 = f4 + f5;
              f9 = f9 * f1;
              f7 = f0 + f7;
              heapClassInst.heapFloat[(r2)] = Float32(f5);
              f5 = f8 + f9;
              heapClassInst.heapFloat[(r2 + 1)] = Float32(f7);
              heapClassInst.heapFloat[(r2 + 2)] = Float32(f5);
              r1 = r1 | 6;
              heapClassInst.heap32[(r2 + 3)] = 0;
              f5 = 1.0;
              heapClassInst.heap8[r0 + 16] = Int8(r1);
              f5 = f5 - f1;
              heapClassInst.heap32[(r2 + 5)] = 0;
              heapClassInst.heapFloat[(r2 + 6)] = Float32(f5);
              heapClassInst.heapFloat[(r2 + 7)] = Float32(f1);
              heapClassInst.heap32[(r2 + 8)] = 0;
              return;
            }
          }
        }
        f0 = f15 + f7;
        f0 = f0 + f22;
        f2 = 1.0
        f0 = f2 / f0;
        f3 = f7 * f0;
        f0 = f22 * f0;
        f4 = f13 * f3;
        f6 = f12 * f3;
        f4 = f5 + f4;
        f5 = f14 * f0;
        r2 = r0 >> 2;
        f4 = f4 + f5;
        f5 = f18 * f3;
        f1 = f1 + f6;
        f6 = f16 * f0;
        f5 = f9 + f5;
        f7 = f19 * f0;
        f1 = f1 + f6;
        heapClassInst.heapFloat[(r2)] = Float32(f4);
        f4 = f5 + f7;
        heapClassInst.heapFloat[(r2 + 1)] = Float32(f1);
        heapClassInst.heapFloat[(r2 + 2)] = Float32(f4);
        f1 = f2 - f3;
        r1 = r1 | 7;
        heapClassInst.heap32[(r2 + 3)] = 0;
        f1 = f1 - f0;
        heapClassInst.heap8[r0 + 16] = Int8(r1);
        heapClassInst.heapFloat[(r2 + 5)] = Float32(f1);
        heapClassInst.heapFloat[(r2 + 6)] = Float32(f3);
      }
      heapClassInst.heapFloat[(r2 + 7)] = Float32(f0);
      heapClassInst.heap32[(r2 + 8)] = 0;
      return;
    }
  } while (false);
  heapClassInst.heap32[(r3 + 7)] = 0;
  heapClassInst.heap32[(r3 + 8)] = 0;
  return;
}

@OverflowWrapping
func _ZN22btVoronoiSimplexSolver19pointOutsideOfPlaneERK9btVector3S2_S2_S2_S2_(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
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
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  f0 = Float64(heapClassInst.heapFloat[(fp + 5)]);
  f1 = Float64(heapClassInst.heapFloat[(fp + 8)]);
  f2 = Float64(heapClassInst.heapFloat[(fp + 11)]);
  f3 = Float64(heapClassInst.heapFloat[(fp + 4)]);
  f4 = Float64(heapClassInst.heapFloat[(fp + 10)]);
  f5 = Float64(heapClassInst.heapFloat[(fp + 7)]);
  f6 = Float64(heapClassInst.heapFloat[(fp + 3)]);
  f7 = Float64(heapClassInst.heapFloat[(fp + 6)]);
  f8 = Float64(heapClassInst.heapFloat[(fp + 9)]);
  f1 = f1 - f0;
  f4 = f4 - f3;
  f7 = f7 - f6;
  f2 = f2 - f0;
  f5 = f5 - f3;
  f8 = f8 - f6;
  f9 = Float64(heapClassInst.heapFloat[(fp + 12)]);
  f10 = Float64(heapClassInst.heapFloat[(fp + 13)]);
  f11 = f5 * f2;
  f12 = f1 * f4;
  f1 = f1 * f8;
  f2 = f7 * f2;
  f11 = f11 - f12;
  f9 = f9 - f6;
  f1 = f1 - f2;
  f2 = f10 - f3;
  f10 = Float64(heapClassInst.heapFloat[(fp + 14)]);
  f4 = f7 * f4;
  f5 = f5 * f8;
  f4 = f4 - f5;
  f5 = f10 - f0;
  f7 = f9 * f11;
  f2 = f2 * f1;
  f2 = f7 + f2;
  f5 = f5 * f4;
  f2 = f2 + f5;
  f5 = f2 * f2;
  f7 = 9.9999990510468706e-009;
  if (f5 < f7) 
  {
    r0 = ( -1);
    commonVariable.r_g0 = r0;
    return;
  }
  else {
    f5 = Float64(heapClassInst.heapFloat[(fp)]);
    f7 = Float64(heapClassInst.heapFloat[(fp + 1)]);
    f8 = Float64(heapClassInst.heapFloat[(fp + 2)]);
    f5 = f5 - f6;
    f3 = f7 - f3;
    f5 = f5 * f11;
    f1 = f3 * f1;
    f0 = f8 - f0;
    f1 = f5 + f1;
    f0 = f0 * f4;
    f0 = f1 + f0;
    f0 = f0 * f2;
    f1 = 0.0;
    r0 = if (f0 < f1) {1} else {0};
    r0 = r0 & 1;
    commonVariable.r_g0 = r0;
    return;
  }
}

@OverflowWrapping
func _ZN22btVoronoiSimplexSolver14reduceVerticesERK15btUsageBitfield(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  if (r2 > 3) 
  {
    r2 = Int64(heapClassInst.heapU8[r3]);
    r4 = r2 & 8;
    if (r4 == 0) 
    {
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = 3;
      _ZN22btVoronoiSimplexSolver12removeVertexEi(i7);
      r2 = Int64(heapClassInst.heap32[(r1)]);
      __label__ = 3;
    }
    else {
      __label__ = 5;
    }
  }
  else {
    __label__ = 3;
  }
  if (__label__ == 3) {
    if (r2 > 2) 
    {
      r2 = Int64(heapClassInst.heapU8[r3]);
      __label__ = 5;
    }
    else {
      __label__ = 7;
    }
  }
  if (__label__ == 5) {
    r4 = r2 & 4;
    if (r4 == 0) 
    {
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = 2;
      _ZN22btVoronoiSimplexSolver12removeVertexEi(i7);
      r2 = Int64(heapClassInst.heap32[(r1)]);
      __label__ = 7;
    }
    else {
      __label__ = 9;
    }
  }
  if (__label__ == 7) {
    if (r2 > 1) 
    {
      r2 = Int64(heapClassInst.heapU8[r3]);
      __label__ = 9;
    }
    else {
      __label__ = 11;
    }
  }
  if (__label__ == 9) {
    r4 = r2 & 2;
    if (r4 == 0) 
    {
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = 1;
      _ZN22btVoronoiSimplexSolver12removeVertexEi(i7);
      r2 = Int64(heapClassInst.heap32[(r1)]);
      __label__ = 11;
    }
    else {
      __label__ = 13;
    }
  }
  if (__label__ == 11) {
    if (r2 < 1) 
    {
      __label__ = 14;
    }
    else {
      r2 = Int64(heapClassInst.heapU8[r3]);
      __label__ = 13;
    }
  }
  if (__label__ == 13) {
    r1 = r2 & 1;
    if (r1 == 0) 
    {
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = 0;
      _ZN22btVoronoiSimplexSolver12removeVertexEi(i7);
      return;
    }
  }
  return;
}

@OverflowWrapping
func _ZN22btVoronoiSimplexSolver28updateClosestVectorAndPointsEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  var __label__ = 0;
  i7 = sp + (-136); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heapU8[r0 + 356]);
  if (r1 != 0) 
  {
    r1 = 0;
    r2 = r0 >> 2;
    heapClassInst.heap8[r0 + 352] = Int8(r1);
    heapClassInst.heap32[(r2 + 84)] = 0;
    heapClassInst.heap32[(r2 + 85)] = 0;
    heapClassInst.heap32[(r2 + 86)] = 0;
    heapClassInst.heap32[(r2 + 87)] = 0;
    r3 = Int64(heapClassInst.heapU8[r0 + 332]);
    r4 = r3 & ( -16);
    heapClassInst.heap8[r0 + 332] = Int8(r4);
    heapClassInst.heap8[r0 + 356] = Int8(r1);
    r5 = Int64(heapClassInst.heap32[(r2)]);
    do {
      if (r5 > 1) 
      {
        do {
          if (r5 == 2) 
          {
            f0 = 0.0;
            f1 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
            f2 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
            f3 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
            f4 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
            f5 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
            f6 = Float64(heapClassInst.heapFloat[(r2 + 7)]);
            f2 = f2 - f1;
            f1 = f0 - f1;
            f4 = f4 - f3;
            f3 = f0 - f3;
            f6 = f6 - f5;
            f5 = f0 - f5;
            f3 = f4 * f3;
            f1 = f2 * f1;
            f1 = f3 + f1;
            f3 = f6 * f5;
            f1 = f1 + f3;
            if (f1 <= f0) 
            {
              r1 = r4 | 1;
              heapClassInst.heap8[r0 + 332] = Int8(r1);
              f1 = f0;
            }
            else {
              f3 = f4 * f4;
              f2 = f2 * f2;
              f2 = f3 + f2;
              f3 = f6 * f6;
              f2 = f2 + f3;
              if (f1 >= f2) 
              {
                f1 = 1.0
                r1 = r4 | 2;
                heapClassInst.heap8[r0 + 332] = Int8(r1);
              }
              else {
                f1 = f1 / f2;
                r1 = r4 | 3;
                heapClassInst.heap8[r0 + 332] = Int8(r1);
              }
            }
            f2 = 1.0
            f2 = f2 - f1;
            heapClassInst.heapFloat[(r2 + 84)] = Float32(f2);
            heapClassInst.heapFloat[(r2 + 85)] = Float32(f1);
            heapClassInst.heap32[(r2 + 86)] = 0;
            heapClassInst.heap32[(r2 + 87)] = 0;
            f2 = Float64(heapClassInst.heapFloat[(r2 + 25)]);
            f3 = Float64(heapClassInst.heapFloat[(r2 + 21)]);
            f2 = f2 - f3;
            f4 = Float64(heapClassInst.heapFloat[(r2 + 26)]);
            f5 = Float64(heapClassInst.heapFloat[(r2 + 22)]);
            f4 = f4 - f5;
            f2 = f2 * f1;
            f6 = Float64(heapClassInst.heapFloat[(r2 + 27)]);
            f7 = Float64(heapClassInst.heapFloat[(r2 + 23)]);
            f6 = f6 - f7;
            f4 = f4 * f1;
            f2 = f3 + f2;
            f3 = f6 * f1;
            f4 = f5 + f4;
            heapClassInst.heapFloat[(r2 + 61)] = Float32(f2);
            f3 = f7 + f3;
            heapClassInst.heapFloat[(r2 + 62)] = Float32(f4);
            heapClassInst.heapFloat[(r2 + 63)] = Float32(f3);
            heapClassInst.heap32[(r2 + 64)] = 0;
            f5 = Float64(heapClassInst.heapFloat[(r2 + 45)]);
            f6 = Float64(heapClassInst.heapFloat[(r2 + 41)]);
            f5 = f5 - f6;
            f7 = Float64(heapClassInst.heapFloat[(r2 + 46)]);
            f8 = Float64(heapClassInst.heapFloat[(r2 + 42)]);
            f7 = f7 - f8;
            f5 = f5 * f1;
            f9 = Float64(heapClassInst.heapFloat[(r2 + 47)]);
            f10 = Float64(heapClassInst.heapFloat[(r2 + 43)]);
            f9 = f9 - f10;
            f7 = f7 * f1;
            f5 = f6 + f5;
            f1 = f9 * f1;
            f6 = f8 + f7;
            heapClassInst.heapFloat[(r2 + 65)] = Float32(f5);
            f1 = f10 + f1;
            heapClassInst.heapFloat[(r2 + 66)] = Float32(f6);
            heapClassInst.heapFloat[(r2 + 67)] = Float32(f1);
            f2 = f2 - f5;
            heapClassInst.heap32[(r2 + 68)] = 0;
            f4 = f4 - f6;
            heapClassInst.heapFloat[(r2 + 69)] = Float32(f2);
            f1 = f3 - f1;
            heapClassInst.heapFloat[(r2 + 70)] = Float32(f4);
            heapClassInst.heapFloat[(r2 + 71)] = Float32(f1);
            heapClassInst.heap32[(r2 + 72)] = 0;
            r1 = (r0 + 332) | 0;
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r1);
            _ZN22btVoronoiSimplexSolver14reduceVerticesERK15btUsageBitfield(i7);
            f1 = Float64(heapClassInst.heapFloat[(r2 + 84)]);
            if (f1 >= f0) 
            {
              f0 = Float64(heapClassInst.heapFloat[(r2 + 85)]);
              f1 = 0.0
              if (!(f0 < f1)) 
              {
                f0 = Float64(heapClassInst.heapFloat[(r2 + 86)]);
                if (!(f0 < f1)) 
                {
                  f0 = Float64(heapClassInst.heapFloat[(r2 + 87)]);
                  r1 = if (f0 >= f1) {1} else {0};
                  r1 = r1 & 1;
                  break 
                }
              }
            }
            r1 = 0;
          }
          else {
            if (r5 == 3) 
            {
              r1 = sp + (-56);
              r3 = r1 >> 2;
              heapClassInst.heap32[(fp + (-14))] = 0;
              heapClassInst.heap32[(r3 + 1)] = 0;
              heapClassInst.heap32[(r3 + 2)] = 0;
              heapClassInst.heap32[(r3 + 3)] = 0;
              r3 = (r0 + 4) | 0;
              r4 = (r0 + 20) | 0;
              r5 = (r0 + 36) | 0;
              r6 = (r0 + 316) | 0;
              heapClassInst.heap32[(g0)] = Int32(r1);
              heapClassInst.heap32[(g0 + 1)] = Int32(r3);
              heapClassInst.heap32[(g0 + 2)] = Int32(r4);
              heapClassInst.heap32[(g0 + 3)] = Int32(r5);
              heapClassInst.heap32[(g0 + 4)] = Int32(r6);
              _ZN22btVoronoiSimplexSolver22closestPtPointTriangleERK9btVector3S2_S2_S2_R25btSubSimplexClosestResult(i7);
              f0 = Float64(heapClassInst.heapFloat[(r2 + 85)]);
              f1 = Float64(heapClassInst.heapFloat[(r2 + 25)]);
              f2 = Float64(heapClassInst.heapFloat[(r2 + 84)]);
              f3 = Float64(heapClassInst.heapFloat[(r2 + 21)]);
              f4 = Float64(heapClassInst.heapFloat[(r2 + 26)]);
              f5 = Float64(heapClassInst.heapFloat[(r2 + 22)]);
              f3 = f3 * f2;
              f1 = f1 * f0;
              f6 = Float64(heapClassInst.heapFloat[(r2 + 86)]);
              f7 = Float64(heapClassInst.heapFloat[(r2 + 29)]);
              f8 = Float64(heapClassInst.heapFloat[(r2 + 31)]);
              f9 = Float64(heapClassInst.heapFloat[(r2 + 30)]);
              f10 = Float64(heapClassInst.heapFloat[(r2 + 27)]);
              f11 = Float64(heapClassInst.heapFloat[(r2 + 23)]);
              f5 = f5 * f2;
              f4 = f4 * f0;
              f1 = f3 + f1;
              f3 = f7 * f6;
              f7 = f11 * f2;
              f10 = f10 * f0;
              f4 = f5 + f4;
              f5 = f9 * f6;
              f1 = f1 + f3;
              f3 = f7 + f10;
              f7 = f8 * f6;
              f4 = f4 + f5;
              heapClassInst.heapFloat[(r2 + 61)] = Float32(f1);
              f3 = f3 + f7;
              heapClassInst.heapFloat[(r2 + 62)] = Float32(f4);
              heapClassInst.heapFloat[(r2 + 63)] = Float32(f3);
              heapClassInst.heap32[(r2 + 64)] = 0;
              f5 = Float64(heapClassInst.heapFloat[(r2 + 45)]);
              f7 = Float64(heapClassInst.heapFloat[(r2 + 41)]);
              f8 = Float64(heapClassInst.heapFloat[(r2 + 49)]);
              f9 = Float64(heapClassInst.heapFloat[(r2 + 46)]);
              f10 = Float64(heapClassInst.heapFloat[(r2 + 42)]);
              f7 = f7 * f2;
              f5 = f5 * f0;
              f11 = Float64(heapClassInst.heapFloat[(r2 + 51)]);
              f12 = Float64(heapClassInst.heapFloat[(r2 + 50)]);
              f13 = Float64(heapClassInst.heapFloat[(r2 + 47)]);
              f14 = Float64(heapClassInst.heapFloat[(r2 + 43)]);
              f10 = f10 * f2;
              f9 = f9 * f0;
              f5 = f7 + f5;
              f7 = f8 * f6;
              f5 = f5 + f7;
              f2 = f14 * f2;
              f0 = f13 * f0;
              f7 = f10 + f9;
              f8 = f12 * f6;
              f7 = f7 + f8;
              heapClassInst.heapFloat[(r2 + 65)] = Float32(f5);
              f0 = f2 + f0;
              f2 = f11 * f6;
              f0 = f0 + f2;
              heapClassInst.heapFloat[(r2 + 66)] = Float32(f7);
              heapClassInst.heapFloat[(r2 + 67)] = Float32(f0);
              f1 = f1 - f5;
              heapClassInst.heap32[(r2 + 68)] = 0;
              f2 = f4 - f7;
              heapClassInst.heapFloat[(r2 + 69)] = Float32(f1);
              f0 = f3 - f0;
              heapClassInst.heapFloat[(r2 + 70)] = Float32(f2);
              heapClassInst.heapFloat[(r2 + 71)] = Float32(f0);
              heapClassInst.heap32[(r2 + 72)] = 0;
              r1 = (r0 + 332) | 0;
              heapClassInst.heap32[(g0)] = Int32(r0);
              heapClassInst.heap32[(g0 + 1)] = Int32(r1);
              _ZN22btVoronoiSimplexSolver14reduceVerticesERK15btUsageBitfield(i7);
              f0 = Float64(heapClassInst.heapFloat[(r2 + 84)]);
              f1 = 0.0
              if (f0 >= f1) 
              {
                f0 = Float64(heapClassInst.heapFloat[(r2 + 85)]);
                if (!(f0 < f1)) 
                {
                  f0 = Float64(heapClassInst.heapFloat[(r2 + 86)]);
                  if (!(f0 < f1)) 
                  {
                    f0 = Float64(heapClassInst.heapFloat[(r2 + 87)]);
                    r1 = if (f0 >= f1) {1} else {0};
                    r1 = r1 & 1;
                    break 
                  }
                }
              }
              r1 = 0;
            }
            else {
              if (r5 == 4) 
              {
                r4 = sp + (-72);
                r5 = r4 >> 2;
                heapClassInst.heap32[(fp + (-18))] = 0;
                heapClassInst.heap32[(r5 + 1)] = 0;
                heapClassInst.heap32[(r5 + 2)] = 0;
                heapClassInst.heap32[(r5 + 3)] = 0;
                heapClassInst.heap8[sp + (-24)] = Int8(r1);
                heapClassInst.heap32[(r2 + 79)] = 0;
                heapClassInst.heap32[(r2 + 80)] = 0;
                heapClassInst.heap32[(r2 + 81)] = 0;
                r3 = r3 | 15;
                heapClassInst.heap32[(r2 + 82)] = 0;
                heapClassInst.heap8[r0 + 332] = Int8(r3);
                f0 = Float64(heapClassInst.heapFloat[(r2 + 11)]);
                f1 = Float64(heapClassInst.heapFloat[(r2 + 7)]);
                f2 = Float64(heapClassInst.heapFloat[(r2 + 15)]);
                f3 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
                f4 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
                f5 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
                f6 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
                f7 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
                f8 = Float64(heapClassInst.heapFloat[(r2 + 9)]);
                f9 = Float64(heapClassInst.heapFloat[(r2 + 10)]);
                f10 = Float64(heapClassInst.heapFloat[(r2 + 13)]);
                f11 = Float64(heapClassInst.heapFloat[(r2 + 14)]);
                heapClassInst.heap32[(g0)] = 0;
                heapClassInst.heap32[(g0 + 1)] = 0;
                heapClassInst.heap32[(g0 + 2)] = 0;
                heapClassInst.heapFloat[(g0 + 3)] = Float32(f3);
                heapClassInst.heapFloat[(g0 + 4)] = Float32(f4);
                heapClassInst.heapFloat[(g0 + 5)] = Float32(f5);
                heapClassInst.heapFloat[(g0 + 6)] = Float32(f6);
                heapClassInst.heapFloat[(g0 + 7)] = Float32(f7);
                heapClassInst.heapFloat[(g0 + 8)] = Float32(f1);
                heapClassInst.heapFloat[(g0 + 9)] = Float32(f8);
                heapClassInst.heapFloat[(g0 + 10)] = Float32(f9);
                heapClassInst.heapFloat[(g0 + 11)] = Float32(f0);
                heapClassInst.heapFloat[(g0 + 12)] = Float32(f10);
                heapClassInst.heapFloat[(g0 + 13)] = Float32(f11);
                heapClassInst.heapFloat[(g0 + 14)] = Float32(f2);
                _ZN22btVoronoiSimplexSolver19pointOutsideOfPlaneERK9btVector3S2_S2_S2_S2_(i7);
                r3 = commonVariable.r_g0;
                heapClassInst.heap32[(g0)] = 0;
                heapClassInst.heap32[(g0 + 1)] = 0;
                heapClassInst.heap32[(g0 + 2)] = 0;
                heapClassInst.heapFloat[(g0 + 3)] = Float32(f3);
                heapClassInst.heapFloat[(g0 + 4)] = Float32(f4);
                heapClassInst.heapFloat[(g0 + 5)] = Float32(f5);
                heapClassInst.heapFloat[(g0 + 6)] = Float32(f8);
                heapClassInst.heapFloat[(g0 + 7)] = Float32(f9);
                heapClassInst.heapFloat[(g0 + 8)] = Float32(f0);
                heapClassInst.heapFloat[(g0 + 9)] = Float32(f10);
                heapClassInst.heapFloat[(g0 + 10)] = Float32(f11);
                heapClassInst.heapFloat[(g0 + 11)] = Float32(f2);
                heapClassInst.heapFloat[(g0 + 12)] = Float32(f6);
                heapClassInst.heapFloat[(g0 + 13)] = Float32(f7);
                heapClassInst.heapFloat[(g0 + 14)] = Float32(f1);
                _ZN22btVoronoiSimplexSolver19pointOutsideOfPlaneERK9btVector3S2_S2_S2_S2_(i7);
                r6 = commonVariable.r_g0;
                heapClassInst.heap32[(g0)] = 0;
                heapClassInst.heap32[(g0 + 1)] = 0;
                heapClassInst.heap32[(g0 + 2)] = 0;
                heapClassInst.heapFloat[(g0 + 3)] = Float32(f3);
                heapClassInst.heapFloat[(g0 + 4)] = Float32(f4);
                heapClassInst.heapFloat[(g0 + 5)] = Float32(f5);
                heapClassInst.heapFloat[(g0 + 6)] = Float32(f10);
                heapClassInst.heapFloat[(g0 + 7)] = Float32(f11);
                heapClassInst.heapFloat[(g0 + 8)] = Float32(f2);
                heapClassInst.heapFloat[(g0 + 9)] = Float32(f6);
                heapClassInst.heapFloat[(g0 + 10)] = Float32(f7);
                heapClassInst.heapFloat[(g0 + 11)] = Float32(f1);
                heapClassInst.heapFloat[(g0 + 12)] = Float32(f8);
                heapClassInst.heapFloat[(g0 + 13)] = Float32(f9);
                heapClassInst.heapFloat[(g0 + 14)] = Float32(f0);
                _ZN22btVoronoiSimplexSolver19pointOutsideOfPlaneERK9btVector3S2_S2_S2_S2_(i7);
                r7 = commonVariable.r_g0;
                heapClassInst.heap32[(g0)] = 0;
                heapClassInst.heap32[(g0 + 1)] = 0;
                heapClassInst.heap32[(g0 + 2)] = 0;
                heapClassInst.heapFloat[(g0 + 3)] = Float32(f6);
                heapClassInst.heapFloat[(g0 + 4)] = Float32(f7);
                heapClassInst.heapFloat[(g0 + 5)] = Float32(f1);
                heapClassInst.heapFloat[(g0 + 6)] = Float32(f10);
                heapClassInst.heapFloat[(g0 + 7)] = Float32(f11);
                heapClassInst.heapFloat[(g0 + 8)] = Float32(f2);
                heapClassInst.heapFloat[(g0 + 9)] = Float32(f8);
                heapClassInst.heapFloat[(g0 + 10)] = Float32(f9);
                heapClassInst.heapFloat[(g0 + 11)] = Float32(f0);
                heapClassInst.heapFloat[(g0 + 12)] = Float32(f3);
                heapClassInst.heapFloat[(g0 + 13)] = Float32(f4);
                heapClassInst.heapFloat[(g0 + 14)] = Float32(f5);
                r8 = r6 | r3;
                _ZN22btVoronoiSimplexSolver19pointOutsideOfPlaneERK9btVector3S2_S2_S2_S2_(i7);
                r9 = commonVariable.r_g0;
                if (!(r8 < 0)) 
                {
                  r10 = r9 | r7;
                  if (!(r10 < 0)) 
                  {
                    r8 = r8 | r7;
                    r8 = r8 | r9;
                    if (r8 == 0) 
                    {
                      r1 = 1;
                      heapClassInst.heap8[r0 + 312] = Int8(r1);
                      heapClassInst.heap32[(r2 + 69)] = 0;
                      heapClassInst.heap32[(r2 + 70)] = 0;
                      heapClassInst.heap32[(r2 + 71)] = 0;
                      heapClassInst.heap32[(r2 + 72)] = 0;
                      commonVariable.r_g0 = r1;
                      return;
                    }
                    else {
                      r8 = (r0 + 4) | 0;
                      r10 = (r0 + 20) | 0;
                      r11 = (r0 + 36) | 0;
                      r12 = (r0 + 52) | 0;
                      if (r3 != 0) 
                      {
                        r3 = sp + (-40);
                        heapClassInst.heap32[(g0)] = Int32(r4);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r8);
                        heapClassInst.heap32[(g0 + 2)] = Int32(r10);
                        heapClassInst.heap32[(g0 + 3)] = Int32(r11);
                        heapClassInst.heap32[(g0 + 4)] = Int32(r3);
                        _ZN22btVoronoiSimplexSolver22closestPtPointTriangleERK9btVector3S2_S2_S2_R25btSubSimplexClosestResult(i7);
                        r3 = r3 >> 2;
                        f1 = Float64(heapClassInst.heapFloat[(fp + (-10))]);
                        f0 = Float64(heapClassInst.heapFloat[(fp + (-18))]);
                        f2 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
                        f3 = Float64(heapClassInst.heapFloat[(r5 + 1)]);
                        f0 = f1 - f0;
                        f3 = f2 - f3;
                        f4 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
                        f5 = Float64(heapClassInst.heapFloat[(r5 + 2)]);
                        f5 = f4 - f5;
                        f0 = f0 * f0;
                        f3 = f3 * f3;
                        f0 = f0 + f3;
                        f3 = f5 * f5;
                        f0 = f0 + f3;
                        f3 = 3.4028234663852886e38;
                        if (f0 >= f3) 
                        {
                          __label__ = 31;
                        }
                        else {
                          f3 = Float64(heapClassInst.heapFloat[(r3 + 3)]);
                          heapClassInst.heapFloat[(r2 + 79)] = Float32(f1);
                          heapClassInst.heapFloat[(r2 + 80)] = Float32(f2);
                          heapClassInst.heapFloat[(r2 + 81)] = Float32(f4);
                          heapClassInst.heapFloat[(r2 + 82)] = Float32(f3);
                          r13 = Int64(heapClassInst.heapU8[sp + (-24)]);
                          r14 = Int64(heapClassInst.heapU8[r0 + 332]);
                          r15 = r13 & 1;
                          r14 = r14 & 240;
                          r14 = r15 | r14;
                          r15 = r13 & 2;
                          r14 = r14 | r15;
                          r13 = r13 & 4;
                          r13 = r14 | r13;
                          heapClassInst.heap8[r0 + 332] = Int8(r13);
                          f1 = Float64(heapClassInst.heapFloat[(r3 + 7)]);
                          f2 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
                          heapClassInst.heap32[(r2 + 84)] = heapClassInst.heap32[(r3 + 5)];
                          heapClassInst.heapFloat[(r2 + 85)] = Float32(f2);
                          heapClassInst.heapFloat[(r2 + 86)] = Float32(f1);
                          heapClassInst.heap32[(r2 + 87)] = 0;
                          __label__ = 34;
                        }
                      }
                      else {
                        __label__ = 31;
                      }
                      if (__label__ == 31) {
                        f0 = 3.4028234663852886e38;
                      }
                      if (r6 != 0) 
                      {
                        r3 = sp + (-40);
                        heapClassInst.heap32[(g0)] = Int32(r4);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r8);
                        heapClassInst.heap32[(g0 + 2)] = Int32(r11);
                        heapClassInst.heap32[(g0 + 3)] = Int32(r12);
                        heapClassInst.heap32[(g0 + 4)] = Int32(r3);
                        _ZN22btVoronoiSimplexSolver22closestPtPointTriangleERK9btVector3S2_S2_S2_R25btSubSimplexClosestResult(i7);
                        r3 = r3 >> 2;
                        f1 = Float64(heapClassInst.heapFloat[(fp + (-10))]);
                        f2 = Float64(heapClassInst.heapFloat[(fp + (-18))]);
                        f3 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
                        f4 = Float64(heapClassInst.heapFloat[(r5 + 1)]);
                        f2 = f1 - f2;
                        f4 = f3 - f4;
                        f5 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
                        f6 = Float64(heapClassInst.heapFloat[(r5 + 2)]);
                        f6 = f5 - f6;
                        f2 = f2 * f2;
                        f4 = f4 * f4;
                        f2 = f2 + f4;
                        f4 = f6 * f6;
                        f2 = f2 + f4;
                        if (!(f2 >= f0)) 
                        {
                          f0 = Float64(heapClassInst.heapFloat[(r3 + 3)]);
                          heapClassInst.heapFloat[(r2 + 79)] = Float32(f1);
                          heapClassInst.heapFloat[(r2 + 80)] = Float32(f3);
                          heapClassInst.heapFloat[(r2 + 81)] = Float32(f5);
                          heapClassInst.heapFloat[(r2 + 82)] = Float32(f0);
                          r6 = Int64(heapClassInst.heapU8[sp + (-24)]);
                          r13 = Int64(heapClassInst.heapU8[r0 + 332]);
                          r14 = r6 << 1;
                          r6 = r6 & 1;
                          r13 = r13 & 240;
                          r6 = r6 | r13;
                          r13 = r14 & 4;
                          r6 = r6 | r13;
                          r13 = r14 & 8;
                          r6 = r6 | r13;
                          heapClassInst.heap8[r0 + 332] = Int8(r6);
                          f0 = Float64(heapClassInst.heapFloat[(r3 + 7)]);
                          f1 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
                          heapClassInst.heap32[(r2 + 84)] = heapClassInst.heap32[(r3 + 5)];
                          heapClassInst.heap32[(r2 + 85)] = 0;
                          heapClassInst.heapFloat[(r2 + 86)] = Float32(f1);
                          heapClassInst.heapFloat[(r2 + 87)] = Float32(f0);
                          f0 = f2;
                        }
                      }
                      if (r7 != 0) 
                      {
                        r3 = sp + (-40);
                        heapClassInst.heap32[(g0)] = Int32(r4);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r8);
                        heapClassInst.heap32[(g0 + 2)] = Int32(r12);
                        heapClassInst.heap32[(g0 + 3)] = Int32(r10);
                        heapClassInst.heap32[(g0 + 4)] = Int32(r3);
                        _ZN22btVoronoiSimplexSolver22closestPtPointTriangleERK9btVector3S2_S2_S2_R25btSubSimplexClosestResult(i7);
                        r3 = r3 >> 2;
                        f1 = Float64(heapClassInst.heapFloat[(fp + (-10))]);
                        f2 = Float64(heapClassInst.heapFloat[(fp + (-18))]);
                        f3 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
                        f4 = Float64(heapClassInst.heapFloat[(r5 + 1)]);
                        f2 = f1 - f2;
                        f4 = f3 - f4;
                        f5 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
                        f6 = Float64(heapClassInst.heapFloat[(r5 + 2)]);
                        f6 = f5 - f6;
                        f2 = f2 * f2;
                        f4 = f4 * f4;
                        f2 = f2 + f4;
                        f4 = f6 * f6;
                        f2 = f2 + f4;
                        if (!(f2 >= f0)) 
                        {
                          f0 = Float64(heapClassInst.heapFloat[(r3 + 3)]);
                          heapClassInst.heapFloat[(r2 + 79)] = Float32(f1);
                          heapClassInst.heapFloat[(r2 + 80)] = Float32(f3);
                          heapClassInst.heapFloat[(r2 + 81)] = Float32(f5);
                          heapClassInst.heapFloat[(r2 + 82)] = Float32(f0);
                          r6 = Int64(heapClassInst.heapU8[sp + (-24)]);
                          r7 = Int64(heapClassInst.heapU8[r0 + 332]);
                          r8 = r6 >> 1;
                          r13 = r6 & 1;
                          r7 = r7 & 240;
                          r6 = r6 << 2;
                          r7 = r13 | r7;
                          r8 = r8 & 2;
                          r7 = r7 | r8;
                          r6 = r6 & 8;
                          r6 = r7 | r6;
                          heapClassInst.heap8[r0 + 332] = Int8(r6);
                          f0 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
                          f1 = Float64(heapClassInst.heapFloat[(r3 + 7)]);
                          heapClassInst.heap32[(r2 + 84)] = heapClassInst.heap32[(r3 + 5)];
                          heapClassInst.heapFloat[(r2 + 85)] = Float32(f1);
                          heapClassInst.heap32[(r2 + 86)] = 0;
                          heapClassInst.heapFloat[(r2 + 87)] = Float32(f0);
                          f0 = f2;
                        }
                      }
                      if (!(r9 == 0)) 
                      {
                        r3 = sp + (-40);
                        heapClassInst.heap32[(g0)] = Int32(r4);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r10);
                        heapClassInst.heap32[(g0 + 2)] = Int32(r12);
                        heapClassInst.heap32[(g0 + 3)] = Int32(r11);
                        heapClassInst.heap32[(g0 + 4)] = Int32(r3);
                        _ZN22btVoronoiSimplexSolver22closestPtPointTriangleERK9btVector3S2_S2_S2_R25btSubSimplexClosestResult(i7);
                        r3 = r3 >> 2;
                        f1 = Float64(heapClassInst.heapFloat[(fp + (-10))]);
                        f2 = Float64(heapClassInst.heapFloat[(fp + (-18))]);
                        f3 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
                        f4 = Float64(heapClassInst.heapFloat[(r5 + 1)]);
                        f2 = f1 - f2;
                        f4 = f3 - f4;
                        f5 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
                        f6 = Float64(heapClassInst.heapFloat[(r5 + 2)]);
                        f6 = f5 - f6;
                        f2 = f2 * f2;
                        f4 = f4 * f4;
                        f2 = f2 + f4;
                        f4 = f6 * f6;
                        f2 = f2 + f4;
                        if (!(f2 >= f0)) 
                        {
                          f0 = Float64(heapClassInst.heapFloat[(r3 + 3)]);
                          heapClassInst.heapFloat[(r2 + 79)] = Float32(f1);
                          heapClassInst.heapFloat[(r2 + 80)] = Float32(f3);
                          heapClassInst.heapFloat[(r2 + 81)] = Float32(f5);
                          heapClassInst.heapFloat[(r2 + 82)] = Float32(f0);
                          r4 = Int64(heapClassInst.heapU8[sp + (-24)]);
                          r5 = Int64(heapClassInst.heapU8[r0 + 332]);
                          r6 = r4 << 1;
                          r6 = r6 & 2;
                          r5 = r5 & 240;
                          r7 = r4 << 2;
                          r5 = r6 | r5;
                          r4 = r4 & 4;
                          r4 = r5 | r4;
                          r5 = r7 & 8;
                          r4 = r4 | r5;
                          heapClassInst.heap8[r0 + 332] = Int8(r4);
                          f0 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
                          f1 = Float64(heapClassInst.heapFloat[(r3 + 7)]);
                          f2 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
                          heapClassInst.heap32[(r2 + 84)] = 0;
                          heapClassInst.heapFloat[(r2 + 85)] = Float32(f2);
                          heapClassInst.heapFloat[(r2 + 86)] = Float32(f1);
                          heapClassInst.heapFloat[(r2 + 87)] = Float32(f0);
                        }
                      }
                      f0 = Float64(heapClassInst.heapFloat[(r2 + 85)]);
                      f1 = Float64(heapClassInst.heapFloat[(r2 + 25)]);
                      f2 = Float64(heapClassInst.heapFloat[(r2 + 84)]);
                      f3 = Float64(heapClassInst.heapFloat[(r2 + 21)]);
                      f4 = Float64(heapClassInst.heapFloat[(r2 + 26)]);
                      f5 = Float64(heapClassInst.heapFloat[(r2 + 22)]);
                      f3 = f3 * f2;
                      f1 = f1 * f0;
                      f6 = Float64(heapClassInst.heapFloat[(r2 + 86)]);
                      f7 = Float64(heapClassInst.heapFloat[(r2 + 29)]);
                      f8 = Float64(heapClassInst.heapFloat[(r2 + 30)]);
                      f9 = Float64(heapClassInst.heapFloat[(r2 + 27)]);
                      f10 = Float64(heapClassInst.heapFloat[(r2 + 23)]);
                      f5 = f5 * f2;
                      f4 = f4 * f0;
                      f1 = f3 + f1;
                      f3 = f7 * f6;
                      f7 = Float64(heapClassInst.heapFloat[(r2 + 87)]);
                      f11 = Float64(heapClassInst.heapFloat[(r2 + 33)]);
                      f12 = Float64(heapClassInst.heapFloat[(r2 + 35)]);
                      f13 = Float64(heapClassInst.heapFloat[(r2 + 34)]);
                      f14 = Float64(heapClassInst.heapFloat[(r2 + 31)]);
                      f10 = f10 * f2;
                      f9 = f9 * f0;
                      f4 = f5 + f4;
                      f5 = f8 * f6;
                      f1 = f1 + f3;
                      f3 = f11 * f7;
                      f8 = f10 + f9;
                      f9 = f14 * f6;
                      f4 = f4 + f5;
                      f5 = f13 * f7;
                      f1 = f1 + f3;
                      f3 = f8 + f9;
                      f8 = f12 * f7;
                      f4 = f4 + f5;
                      heapClassInst.heapFloat[(r2 + 61)] = Float32(f1);
                      f3 = f3 + f8;
                      heapClassInst.heapFloat[(r2 + 62)] = Float32(f4);
                      heapClassInst.heapFloat[(r2 + 63)] = Float32(f3);
                      heapClassInst.heap32[(r2 + 64)] = 0;
                      f5 = Float64(heapClassInst.heapFloat[(r2 + 45)]);
                      f8 = Float64(heapClassInst.heapFloat[(r2 + 41)]);
                      f9 = Float64(heapClassInst.heapFloat[(r2 + 49)]);
                      f10 = Float64(heapClassInst.heapFloat[(r2 + 46)]);
                      f11 = Float64(heapClassInst.heapFloat[(r2 + 42)]);
                      f8 = f8 * f2;
                      f5 = f5 * f0;
                      f12 = Float64(heapClassInst.heapFloat[(r2 + 53)]);
                      f13 = Float64(heapClassInst.heapFloat[(r2 + 50)]);
                      f14 = Float64(heapClassInst.heapFloat[(r2 + 47)]);
                      f15 = Float64(heapClassInst.heapFloat[(r2 + 43)]);
                      f11 = f11 * f2;
                      f10 = f10 * f0;
                      f5 = f8 + f5;
                      f8 = f9 * f6;
                      f9 = Float64(heapClassInst.heapFloat[(r2 + 55)]);
                      f16 = Float64(heapClassInst.heapFloat[(r2 + 54)]);
                      f17 = Float64(heapClassInst.heapFloat[(r2 + 51)]);
                      f2 = f15 * f2;
                      f0 = f14 * f0;
                      f10 = f11 + f10;
                      f11 = f13 * f6;
                      f5 = f5 + f8;
                      f8 = f12 * f7;
                      f5 = f5 + f8;
                      f0 = f2 + f0;
                      f2 = f17 * f6;
                      f6 = f10 + f11;
                      f8 = f16 * f7;
                      f6 = f6 + f8;
                      heapClassInst.heapFloat[(r2 + 65)] = Float32(f5);
                      f0 = f0 + f2;
                      f2 = f9 * f7;
                      f0 = f0 + f2;
                      heapClassInst.heapFloat[(r2 + 66)] = Float32(f6);
                      heapClassInst.heapFloat[(r2 + 67)] = Float32(f0);
                      f1 = f1 - f5;
                      heapClassInst.heap32[(r2 + 68)] = 0;
                      f2 = f4 - f6;
                      heapClassInst.heapFloat[(r2 + 69)] = Float32(f1);
                      f0 = f3 - f0;
                      heapClassInst.heapFloat[(r2 + 70)] = Float32(f2);
                      heapClassInst.heapFloat[(r2 + 71)] = Float32(f0);
                      heapClassInst.heap32[(r2 + 72)] = 0;
                      r3 = (r0 + 332) | 0;
                      heapClassInst.heap32[(g0)] = Int32(r0);
                      heapClassInst.heap32[(g0 + 1)] = Int32(r3);
                      _ZN22btVoronoiSimplexSolver14reduceVerticesERK15btUsageBitfield(i7);
                      f0 = Float64(heapClassInst.heapFloat[(r2 + 84)]);
                      f1 = 0.0
                      if (f0 >= f1) 
                      {
                        f0 = Float64(heapClassInst.heapFloat[(r2 + 85)]);
                        if (f0 < f1) 
                        {
                          break 
                        }
                        else {
                          f0 = Float64(heapClassInst.heapFloat[(r2 + 86)]);
                          if (f0 < f1) 
                          {
                            break 
                          }
                          else {
                            f0 = Float64(heapClassInst.heapFloat[(r2 + 87)]);
                            r1 = if (f0 >= f1) {1} else {0};
                            r1 = r1 & 1;
                            break 
                          }
                        }
                      }
                      else {
                        break 
                      }
                    }
                  }
                }
                r2 = 1;
                heapClassInst.heap8[r0 + 352] = Int8(r2);
                r2 = 0;
                heapClassInst.heap8[r0 + 312] = Int8(r2);
                commonVariable.r_g0 = r2;
                return;
              }
              else {
                __label__ = 8;
                break 
              }
            }
          }
        } while (false);
        heapClassInst.heap8[r0 + 312] = Int8(r1);
        r0 = r1 & 255;
        commonVariable.r_g0 = r0;
        return;
      }
      else {
        if (r5 == 0) 
        {
          __label__ = 8;
        }
        else {
          if (r5 == 1) 
          {
            f0 = Float64(heapClassInst.heapFloat[(r2 + 21)]);
            heapClassInst.heapFloat[(r2 + 61)] = Float32(f0);
            f1 = Float64(heapClassInst.heapFloat[(r2 + 22)]);
            heapClassInst.heapFloat[(r2 + 62)] = Float32(f1);
            f2 = Float64(heapClassInst.heapFloat[(r2 + 23)]);
            heapClassInst.heapFloat[(r2 + 63)] = Float32(f2);
            heapClassInst.heap32[(r2 + 64)] = heapClassInst.heap32[(r2 + 24)];
            f3 = Float64(heapClassInst.heapFloat[(r2 + 41)]);
            heapClassInst.heapFloat[(r2 + 65)] = Float32(f3);
            f4 = Float64(heapClassInst.heapFloat[(r2 + 42)]);
            heapClassInst.heapFloat[(r2 + 66)] = Float32(f4);
            f5 = Float64(heapClassInst.heapFloat[(r2 + 43)]);
            heapClassInst.heapFloat[(r2 + 67)] = Float32(f5);
            f0 = f0 - f3;
            heapClassInst.heap32[(r2 + 68)] = heapClassInst.heap32[(r2 + 44)];
            f1 = f1 - f4;
            heapClassInst.heapFloat[(r2 + 69)] = Float32(f0);
            f0 = f2 - f5;
            heapClassInst.heapFloat[(r2 + 70)] = Float32(f1);
            heapClassInst.heapFloat[(r2 + 71)] = Float32(f0);
            r1 = 0;
            heapClassInst.heap32[(r2 + 72)] = 0;
            heapClassInst.heap8[r0 + 352] = Int8(r1);
            heapClassInst.heap8[r0 + 332] = Int8(r4);
            heapClassInst.heap32[(r2 + 84)] = 1065353216;
            heapClassInst.heap32[(r2 + 85)] = 0;
            heapClassInst.heap32[(r2 + 86)] = 0;
            heapClassInst.heap32[(r2 + 87)] = 0;
            r1 = 1;
            __label__ = 9;
          }
          else {
            __label__ = 8;
          }
        }
      }
    } while (false);
    if (__label__ == 8) {
      r1 = 0;
    }
    heapClassInst.heap8[r0 + 312] = Int8(r1);
    commonVariable.r_g0 = r1;
    return;
  }
  else {
    r0 = Int64(heapClassInst.heapU8[r0 + 312]);
    commonVariable.r_g0 = r0;
    return;
  }
}

@OverflowWrapping
func _ZN16btCollisionWorld27ClosestConvexResultCallbackD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVN16btCollisionWorld27ClosestConvexResultCallbackE;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

@OverflowWrapping
func _ZN16btCollisionWorld27ClosestConvexResultCallbackD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVN16btCollisionWorld27ClosestConvexResultCallbackE;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

@OverflowWrapping
func _ZN16btCollisionWorld27ClosestConvexResultCallback15addSingleResultERNS_17LocalConvexResultEb(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
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
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(fp)]);
  f0 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
  r1 = r1 >> 2;
  f1 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  if (f0 <= f1) 
  {
    r2 = Int64(heapClassInst.heap32[(fp + 2)]);
    heapClassInst.heapFloat[(r1 + 1)] = Float32(f0);
    r3 = Int64(heapClassInst.heap32[(r0)]);
    heapClassInst.heap32[(r1 + 19)] = Int32(r3);
    if (r2 == 0) 
    {
      r2 = r3 >> 2;
      f0 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
      f1 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
      f2 = Float64(heapClassInst.heapFloat[(r0 + 3)]);
      f3 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
      f4 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
      f5 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
      f1 = f1 * f0;
      f3 = f3 * f2;
      f6 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
      f7 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
      f8 = Float64(heapClassInst.heapFloat[(r2 + 9)]);
      f9 = Float64(heapClassInst.heapFloat[(r2 + 10)]);
      f10 = Float64(heapClassInst.heapFloat[(r2 + 11)]);
      f11 = Float64(heapClassInst.heapFloat[(r2 + 7)]);
      f4 = f4 * f0;
      f5 = f5 * f2;
      f1 = f1 + f3;
      f3 = f7 * f6;
      f0 = f8 * f0;
      f2 = f9 * f2;
      f4 = f4 + f5;
      f5 = f11 * f6;
      f1 = f1 + f3;
      f0 = f0 + f2;
      f2 = f10 * f6;
      f3 = f4 + f5;
      heapClassInst.heapFloat[(r1 + 11)] = Float32(f1);
      f0 = f0 + f2;
      heapClassInst.heapFloat[(r1 + 12)] = Float32(f3);
      heapClassInst.heapFloat[(r1 + 13)] = Float32(f0);
      heapClassInst.heap32[(r1 + 14)] = 0;
    }
    else {
      heapClassInst.heap32[(r1 + 11)] = heapClassInst.heap32[(r0 + 2)];
      heapClassInst.heap32[(r1 + 12)] = heapClassInst.heap32[(r0 + 3)];
      heapClassInst.heap32[(r1 + 13)] = heapClassInst.heap32[(r0 + 4)];
      heapClassInst.heap32[(r1 + 14)] = heapClassInst.heap32[(r0 + 5)];
    }
    heapClassInst.heap32[(r1 + 15)] = heapClassInst.heap32[(r0 + 6)];
    heapClassInst.heap32[(r1 + 16)] = heapClassInst.heap32[(r0 + 7)];
    heapClassInst.heap32[(r1 + 17)] = heapClassInst.heap32[(r0 + 8)];
    heapClassInst.heap32[(r1 + 18)] = heapClassInst.heap32[(r0 + 9)];
    f0 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
    commonVariable.f_g0 = f0;
    return;
  }
  else {
    r0 = _E2_str36;
    r1 = _E2_str4;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = 384;
    _assert(i7);
  }
}

@OverflowWrapping
func _ZNK21btConeTwistConstraint28calculateSerializeBufferSizeEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = 204;
  commonVariable.r_g0 = r0;
  return;
}

@OverflowWrapping
func _ZNK21btConeTwistConstraint9serializeEPvP12btSerializer(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  heapClassInst.heap32[(g0 + 2)] = Int32(r2);
  r1 = r1 >> 2;
  r0 = r0 >> 2;
  _ZNK17btTypedConstraint9serializeEPvP12btSerializer(i7);
  heapClassInst.heap32[(r1 + 11)] = heapClassInst.heap32[(r0 + 72)];
  heapClassInst.heap32[(r1 + 12)] = heapClassInst.heap32[(r0 + 73)];
  heapClassInst.heap32[(r1 + 13)] = heapClassInst.heap32[(r0 + 74)];
  heapClassInst.heap32[(r1 + 14)] = heapClassInst.heap32[(r0 + 75)];
  heapClassInst.heap32[(r1 + 15)] = heapClassInst.heap32[(r0 + 76)];
  heapClassInst.heap32[(r1 + 16)] = heapClassInst.heap32[(r0 + 77)];
  heapClassInst.heap32[(r1 + 17)] = heapClassInst.heap32[(r0 + 78)];
  heapClassInst.heap32[(r1 + 18)] = heapClassInst.heap32[(r0 + 79)];
  heapClassInst.heap32[(r1 + 19)] = heapClassInst.heap32[(r0 + 80)];
  heapClassInst.heap32[(r1 + 20)] = heapClassInst.heap32[(r0 + 81)];
  heapClassInst.heap32[(r1 + 21)] = heapClassInst.heap32[(r0 + 82)];
  heapClassInst.heap32[(r1 + 22)] = heapClassInst.heap32[(r0 + 83)];
  heapClassInst.heap32[(r1 + 23)] = heapClassInst.heap32[(r0 + 84)];
  heapClassInst.heap32[(r1 + 24)] = heapClassInst.heap32[(r0 + 85)];
  heapClassInst.heap32[(r1 + 25)] = heapClassInst.heap32[(r0 + 86)];
  heapClassInst.heap32[(r1 + 26)] = heapClassInst.heap32[(r0 + 87)];
  heapClassInst.heap32[(r1 + 27)] = heapClassInst.heap32[(r0 + 88)];
  heapClassInst.heap32[(r1 + 28)] = heapClassInst.heap32[(r0 + 89)];
  heapClassInst.heap32[(r1 + 29)] = heapClassInst.heap32[(r0 + 90)];
  heapClassInst.heap32[(r1 + 30)] = heapClassInst.heap32[(r0 + 91)];
  heapClassInst.heap32[(r1 + 31)] = heapClassInst.heap32[(r0 + 92)];
  heapClassInst.heap32[(r1 + 32)] = heapClassInst.heap32[(r0 + 93)];
  heapClassInst.heap32[(r1 + 33)] = heapClassInst.heap32[(r0 + 94)];
  heapClassInst.heap32[(r1 + 34)] = heapClassInst.heap32[(r0 + 95)];
  heapClassInst.heap32[(r1 + 35)] = heapClassInst.heap32[(r0 + 96)];
  heapClassInst.heap32[(r1 + 36)] = heapClassInst.heap32[(r0 + 97)];
  heapClassInst.heap32[(r1 + 37)] = heapClassInst.heap32[(r0 + 98)];
  heapClassInst.heap32[(r1 + 38)] = heapClassInst.heap32[(r0 + 99)];
  heapClassInst.heap32[(r1 + 39)] = heapClassInst.heap32[(r0 + 100)];
  heapClassInst.heap32[(r1 + 40)] = heapClassInst.heap32[(r0 + 101)];
  heapClassInst.heap32[(r1 + 41)] = heapClassInst.heap32[(r0 + 102)];
  heapClassInst.heap32[(r1 + 42)] = heapClassInst.heap32[(r0 + 103)];
  heapClassInst.heap32[(r1 + 43)] = heapClassInst.heap32[(r0 + 108)];
  heapClassInst.heap32[(r1 + 44)] = heapClassInst.heap32[(r0 + 109)];
  heapClassInst.heap32[(r1 + 45)] = heapClassInst.heap32[(r0 + 110)];
  heapClassInst.heap32[(r1 + 46)] = heapClassInst.heap32[(r0 + 104)];
  heapClassInst.heap32[(r1 + 47)] = heapClassInst.heap32[(r0 + 105)];
  heapClassInst.heap32[(r1 + 48)] = heapClassInst.heap32[(r0 + 106)];
  heapClassInst.heap32[(r1 + 49)] = heapClassInst.heap32[(r0 + 107)];
  r0 = _E2_str239;
  commonVariable.r_g0 = r0;
  return;
}

@OverflowWrapping
func _ZN21btConeTwistConstraintD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV21btConeTwistConstraint;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

@OverflowWrapping
func _ZN21btConeTwistConstraintD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV21btConeTwistConstraint;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

@OverflowWrapping
func _ZN21btConeTwistConstraint13buildJacobianEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  var __label__ = 0;
  i7 = sp + (-216); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heapU8[r0 + 515]);
  if (!(r1 == 0)) 
  {
    r1 = r0 >> 2;
    heapClassInst.heap32[(r1 + 7)] = 0;
    heapClassInst.heap32[(r1 + 127)] = 0;
    heapClassInst.heap32[(r1 + 126)] = 0;
    heapClassInst.heap32[(r1 + 141)] = 0;
    heapClassInst.heap32[(r1 + 142)] = 0;
    heapClassInst.heap32[(r1 + 143)] = 0;
    heapClassInst.heap32[(r1 + 144)] = 0;
    r2 = Int64(heapClassInst.heapU8[r0 + 512]);
    if (!(r2 != 0)) 
    {
      r2 = Int64(heapClassInst.heap32[(r1 + 6)]);
      r3 = Int64(heapClassInst.heap32[(r1 + 5)]);
      r2 = r2 >> 2;
      r3 = r3 >> 2;
      f0 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
      f1 = Float64(heapClassInst.heapFloat[(r1 + 100)]);
      f2 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
      f3 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
      f4 = Float64(heapClassInst.heapFloat[(r1 + 101)]);
      f5 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
      f6 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
      f7 = Float64(heapClassInst.heapFloat[(r1 + 84)]);
      f8 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
      f9 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
      f10 = Float64(heapClassInst.heapFloat[(r1 + 85)]);
      f11 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
      f12 = Float64(heapClassInst.heapFloat[(r2 + 9)]);
      f13 = Float64(heapClassInst.heapFloat[(r2 + 10)]);
      f14 = Float64(heapClassInst.heapFloat[(r3 + 9)]);
      f15 = Float64(heapClassInst.heapFloat[(r3 + 10)]);
      f0 = f0 * f1;
      f3 = f3 * f4;
      f16 = Float64(heapClassInst.heapFloat[(r2 + 7)]);
      f17 = Float64(heapClassInst.heapFloat[(r1 + 102)]);
      f18 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
      f6 = f6 * f7;
      f9 = f9 * f10;
      f19 = Float64(heapClassInst.heapFloat[(r3 + 7)]);
      f20 = Float64(heapClassInst.heapFloat[(r1 + 86)]);
      f21 = Float64(heapClassInst.heapFloat[(r3 + 3)]);
      f2 = f2 * f1;
      f5 = f5 * f4;
      f8 = f8 * f7;
      f11 = f11 * f10;
      f22 = Float64(heapClassInst.heapFloat[(r2 + 11)]);
      f23 = Float64(heapClassInst.heapFloat[(r3 + 11)]);
      f1 = f12 * f1;
      f4 = f13 * f4;
      f7 = f14 * f7;
      f10 = f15 * f10;
      f0 = f0 + f3;
      f3 = f16 * f17;
      f6 = f6 + f9;
      f9 = f19 * f20;
      f2 = f2 + f5;
      f5 = f18 * f17;
      f8 = f8 + f11;
      f11 = f21 * f20;
      f1 = f1 + f4;
      f4 = f22 * f17;
      f7 = f7 + f10;
      f10 = f23 * f20;
      f0 = f0 + f3;
      f3 = Float64(heapClassInst.heapFloat[(r2 + 14)]);
      f6 = f6 + f9;
      f9 = Float64(heapClassInst.heapFloat[(r3 + 14)]);
      f2 = f2 + f5;
      f5 = Float64(heapClassInst.heapFloat[(r2 + 13)]);
      f8 = f8 + f11;
      f11 = Float64(heapClassInst.heapFloat[(r3 + 13)]);
      f0 = f0 + f3;
      f3 = f6 + f9;
      f2 = f2 + f5;
      f5 = f8 + f11;
      f1 = f1 + f4;
      f4 = Float64(heapClassInst.heapFloat[(r2 + 15)]);
      f6 = f7 + f10;
      f7 = Float64(heapClassInst.heapFloat[(r3 + 15)]);
      f8 = f0 - f3;
      f9 = f2 - f5;
      f1 = f1 + f4;
      f4 = f6 + f7;
      f6 = f1 - f4;
      f7 = f9 * f9;
      f10 = f8 * f8;
      f7 = f7 + f10;
      f10 = f6 * f6;
      f7 = f7 + f10;
      f10 = 1.1920928955078125e-007;
      if (f7 > f10) 
      {
        heapClassInst.heapFloat[(g0)] = Float32(f7);
        f10 = 1.0;
        sqrtf(i7);
        f11 = f10 / commonVariable.f_g0;
        r2 = sp + (-176);
        f7 = f9 * f11;
        f8 = f8 * f11;
        r3 = r2 >> 2;
        heapClassInst.heapFloat[(fp + (-44))] = Float32(f7);
        f6 = f6 * f11;
        heapClassInst.heapFloat[(r3 + 1)] = Float32(f8);
        r2 = (r2 + 8) | 0;
        heapClassInst.heapFloat[(r3 + 2)] = Float32(f6);
        heapClassInst.heap32[(r3 + 3)] = 0;
        f9 = 0.0;
        if (f6 < f9) 
        {
          f9 = -f6;
        }
        else {
          f9 = f6;
        }
        f11 = 0.70710676908493042;
        if (f9 > f11) 
        {
          f7 = f8 * f8;
          f8 = f6 * f6;
          f7 = f7 + f8;
          heapClassInst.heapFloat[(g0)] = Float32(f7);
          sqrtf(i7);
          heapClassInst.heap32[(r3 + 4)] = 0;
          f6 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
          f8 = f10 / commonVariable.f_g0;
          f6 = -f6;
          f6 = f8 * f6;
          heapClassInst.heapFloat[(r3 + 5)] = Float32(f6);
          f9 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
          f9 = f9 * f8;
          f7 = f7 * f8;
          heapClassInst.heapFloat[(r3 + 6)] = Float32(f9);
          heapClassInst.heapFloat[(r3 + 8)] = Float32(f7);
          f7 = Float64(heapClassInst.heapFloat[(fp + (-44))]);
          f8 = -f7;
          f8 = f9 * f8;
          f7 = f7 * f6;
          heapClassInst.heapFloat[(r3 + 9)] = Float32(f8);
          heapClassInst.heapFloat[(r3 + 10)] = Float32(f7);
          __label__ = 10;
        }
        else {
          __label__ = 9;
        }
      }
      else {
        r2 = sp + (-176);
        r3 = r2 >> 2;
        heapClassInst.heap32[(fp + (-44))] = 1065353216;
        heapClassInst.heap32[(r3 + 1)] = 0;
        r2 = (r2 + 8) | 0;
        f7 = 1.0;
        f8 = 0.0;
        heapClassInst.heap32[(r3 + 2)] = 0;
        heapClassInst.heap32[(r3 + 3)] = 0;
        __label__ = 9;
      }
      if (__label__ == 9) {
        f6 = f7 * f7;
        f7 = f8 * f8;
        f6 = f6 + f7;
        r3 = sp + (-176);
        heapClassInst.heapFloat[(g0)] = Float32(f6);
        r3 = r3 >> 2;
        sqrtf(i7);
        f8 = 1.0;
        f9 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
        f7 = f8 / commonVariable.f_g0;
        f8 = -f9;
        f8 = f7 * f8;
        heapClassInst.heapFloat[(r3 + 4)] = Float32(f8);
        f9 = Float64(heapClassInst.heapFloat[(fp + (-44))]);
        f9 = f9 * f7;
        heapClassInst.heapFloat[(r3 + 5)] = Float32(f9);
        r2 = r2 >> 2;
        heapClassInst.heap32[(r3 + 6)] = 0;
        f10 = Float64(heapClassInst.heapFloat[(r2)]);
        f11 = -f10;
        f9 = f9 * f11;
        f8 = f10 * f8;
        heapClassInst.heapFloat[(r3 + 8)] = Float32(f9);
        f6 = f6 * f7;
        heapClassInst.heapFloat[(r3 + 9)] = Float32(f8);
        heapClassInst.heapFloat[(r3 + 10)] = Float32(f6);
      }
      r2 = (r0 + 36) | 0;
      r3 = 0;
      while (true) {
        r4 = Int64(heapClassInst.heap32[(r1 + 5)]);
        r5 = r4 >> 2;
        r6 = sp + (-128);
        r7 = r6 >> 2;
        heapClassInst.heap32[(fp + (-32))] = heapClassInst.heap32[(r5 + 1)];
        heapClassInst.heap32[(r7 + 1)] = heapClassInst.heap32[(r5 + 5)];
        heapClassInst.heap32[(r7 + 2)] = heapClassInst.heap32[(r5 + 9)];
        heapClassInst.heap32[(r7 + 3)] = 0;
        heapClassInst.heap32[(r7 + 4)] = heapClassInst.heap32[(r5 + 2)];
        heapClassInst.heap32[(r7 + 5)] = heapClassInst.heap32[(r5 + 6)];
        heapClassInst.heap32[(r7 + 6)] = heapClassInst.heap32[(r5 + 10)];
        heapClassInst.heap32[(r7 + 7)] = 0;
        heapClassInst.heap32[(r7 + 8)] = heapClassInst.heap32[(r5 + 3)];
        heapClassInst.heap32[(r7 + 9)] = heapClassInst.heap32[(r5 + 7)];
        heapClassInst.heap32[(r7 + 10)] = heapClassInst.heap32[(r5 + 11)];
        heapClassInst.heap32[(r7 + 11)] = 0;
        r7 = Int64(heapClassInst.heap32[(r1 + 6)]);
        r8 = sp + (-80);
        r9 = r7 >> 2;
        r10 = r8 >> 2;
        heapClassInst.heap32[(fp + (-20))] = heapClassInst.heap32[(r9 + 1)];
        heapClassInst.heap32[(r10 + 1)] = heapClassInst.heap32[(r9 + 5)];
        heapClassInst.heap32[(r10 + 2)] = heapClassInst.heap32[(r9 + 9)];
        heapClassInst.heap32[(r10 + 3)] = 0;
        heapClassInst.heap32[(r10 + 4)] = heapClassInst.heap32[(r9 + 2)];
        heapClassInst.heap32[(r10 + 5)] = heapClassInst.heap32[(r9 + 6)];
        heapClassInst.heap32[(r10 + 6)] = heapClassInst.heap32[(r9 + 10)];
        heapClassInst.heap32[(r10 + 7)] = 0;
        heapClassInst.heap32[(r10 + 8)] = heapClassInst.heap32[(r9 + 3)];
        heapClassInst.heap32[(r10 + 9)] = heapClassInst.heap32[(r9 + 7)];
        heapClassInst.heap32[(r10 + 10)] = heapClassInst.heap32[(r9 + 11)];
        heapClassInst.heap32[(r10 + 11)] = 0;
        f6 = Float64(heapClassInst.heapFloat[(r5 + 13)]);
        f7 = Float64(heapClassInst.heapFloat[(r5 + 15)]);
        f8 = Float64(heapClassInst.heapFloat[(r5 + 14)]);
        r10 = sp + (-32);
        f6 = f5 - f6;
        r11 = r10 >> 2;
        f8 = f3 - f8;
        heapClassInst.heapFloat[(fp + (-8))] = Float32(f6);
        f6 = f4 - f7;
        heapClassInst.heapFloat[(r11 + 1)] = Float32(f8);
        heapClassInst.heapFloat[(r11 + 2)] = Float32(f6);
        heapClassInst.heap32[(r11 + 3)] = 0;
        f6 = Float64(heapClassInst.heapFloat[(r9 + 13)]);
        f7 = Float64(heapClassInst.heapFloat[(r9 + 15)]);
        f8 = Float64(heapClassInst.heapFloat[(r9 + 14)]);
        r11 = sp + (-16);
        f6 = f2 - f6;
        r12 = r11 >> 2;
        f8 = f0 - f8;
        heapClassInst.heapFloat[(fp + (-4))] = Float32(f6);
        f6 = f1 - f7;
        heapClassInst.heapFloat[(r12 + 1)] = Float32(f8);
        heapClassInst.heapFloat[(r12 + 2)] = Float32(f6);
        heapClassInst.heap32[(r12 + 3)] = 0;
        f6 = Float64(heapClassInst.heapFloat[(r9 + 84)]);
        f7 = Float64(heapClassInst.heapFloat[(r5 + 84)]);
        r5 = sp + (-176);
        r5 = (r5 + r3) | 0;
        r4 = (r4 + 388) | 0;
        r7 = (r7 + 388) | 0;
        heapClassInst.heap32[(g0)] = Int32(r2);
        heapClassInst.heap32[(g0 + 1)] = Int32(r6);
        heapClassInst.heap32[(g0 + 2)] = Int32(r8);
        heapClassInst.heap32[(g0 + 3)] = Int32(r10);
        heapClassInst.heap32[(g0 + 4)] = Int32(r11);
        heapClassInst.heap32[(g0 + 5)] = Int32(r5);
        heapClassInst.heap32[(g0 + 6)] = Int32(r4);
        heapClassInst.heapFloat[(g0 + 7)] = Float32(f7);
        heapClassInst.heap32[(g0 + 8)] = Int32(r7);
        heapClassInst.heapFloat[(g0 + 9)] = Float32(f6);
        r3 = (r3 + 16) | 0;
        r2 = (r2 + 84) | 0;
        _ZN15btJacobianEntryC2ERK11btMatrix3x3S2_RK9btVector3S5_S5_S5_fS5_f(i7);
        if (!(r3 != 48)) 
        {
          break 
        }
      }
    }
    r2 = Int64(heapClassInst.heap32[(r1 + 6)]);
    r1 = Int64(heapClassInst.heap32[(r1 + 5)]);
    r3 = (r1 + 4) | 0;
    r4 = (r2 + 4) | 0;
    r1 = (r1 + 256) | 0;
    r2 = (r2 + 256) | 0;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    heapClassInst.heap32[(g0 + 2)] = Int32(r4);
    heapClassInst.heap32[(g0 + 3)] = Int32(r1);
    heapClassInst.heap32[(g0 + 4)] = Int32(r2);
    _ZN21btConeTwistConstraint14calcAngleInfo2ERK11btTransformS2_RK11btMatrix3x3S5_(i7);
  }
  return;
}

@OverflowWrapping
func _ZN21btConeTwistConstraint8getInfo1EPN17btTypedConstraint17btConstraintInfo1E(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = Int64(heapClassInst.heapU8[r0 + 515]);
  if (r2 == 0) 
  {
    r1 = r1 >> 2;
    heapClassInst.heap32[(r1)] = 3;
    r2 = r0 >> 2;
    heapClassInst.heap32[(r1 + 1)] = 3;
    r3 = Int64(heapClassInst.heap32[(r2 + 6)]);
    r4 = Int64(heapClassInst.heap32[(r2 + 5)]);
    r5 = (r4 + 4) | 0;
    r6 = (r3 + 4) | 0;
    r4 = (r4 + 256) | 0;
    r3 = (r3 + 256) | 0;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r5);
    heapClassInst.heap32[(g0 + 2)] = Int32(r6);
    heapClassInst.heap32[(g0 + 3)] = Int32(r4);
    heapClassInst.heap32[(g0 + 4)] = Int32(r3);
    _ZN21btConeTwistConstraint14calcAngleInfo2ERK11btTransformS2_RK11btMatrix3x3S5_(i7);
    r3 = Int64(heapClassInst.heapU8[r0 + 514]);
    if (!(r3 == 0)) 
    {
      r3 = Int64(heapClassInst.heap32[(r1)]);
      r4 = (r3 + 1) | 0;
      heapClassInst.heap32[(r1)] = Int32(r4);
      r4 = Int64(heapClassInst.heap32[(r1 + 1)]);
      r5 = (r4 + (-1)) | 0;
      heapClassInst.heap32[(r1 + 1)] = Int32(r5);
      f0 = Float64(heapClassInst.heapFloat[(r2 + 111)]);
      f1 = Float64(heapClassInst.heapFloat[(r2 + 108)]);
      if (!(f1 >= f0)) 
      {
        f1 = Float64(heapClassInst.heapFloat[(r2 + 109)]);
        if (!(f1 >= f0)) 
        {
          r2 = (r3 + 2) | 0;
          r3 = (r4 + (-2)) | 0;
          heapClassInst.heap32[(r1)] = Int32(r2);
          heapClassInst.heap32[(r1 + 1)] = Int32(r3);
        }
      }
    }
    r0 = Int64(heapClassInst.heapU8[r0 + 513]);
    if (!(r0 == 0)) 
    {
      r0 = Int64(heapClassInst.heap32[(r1)]);
      r0 = (r0 + 1) | 0;
      heapClassInst.heap32[(r1)] = Int32(r0);
      r0 = Int64(heapClassInst.heap32[(r1 + 1)]);
      r0 = (r0 + (-1)) | 0;
      heapClassInst.heap32[(r1 + 1)] = Int32(r0);
    }
    return;
  }
  else {
    r0 = r1 >> 2;
    heapClassInst.heap32[(r0)] = 0;
    heapClassInst.heap32[(r0 + 1)] = 0;
    return;
  }
}

@OverflowWrapping
func _ZN21btConeTwistConstraint8getInfo2EPN17btTypedConstraint17btConstraintInfo2E(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  var __label__ = 0;
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1 + 6)]);
  r3 = Int64(heapClassInst.heap32[(r1 + 5)]);
  r4 = (r3 + 4) | 0;
  r5 = (r2 + 4) | 0;
  r6 = (r3 + 256) | 0;
  r7 = (r2 + 256) | 0;
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r4);
  heapClassInst.heap32[(g0 + 2)] = Int32(r5);
  heapClassInst.heap32[(g0 + 3)] = Int32(r6);
  heapClassInst.heap32[(g0 + 4)] = Int32(r7);
  _ZN21btConeTwistConstraint14calcAngleInfo2ERK11btTransformS2_RK11btMatrix3x3S5_(i7);
  r4 = Int64(heapClassInst.heapU8[r0 + 515]);
  if (r4 == 0) 
  {
    r4 = Int64(heapClassInst.heap32[(fp + 1)]);
    r5 = r4 >> 2;
    r6 = Int64(heapClassInst.heap32[(r5 + 2)]);
    r6 = r6 >> 2;
    heapClassInst.heap32[(r6)] = 1065353216;
    r6 = Int64(heapClassInst.heap32[(r5 + 6)]);
    r7 = Int64(heapClassInst.heap32[(r5 + 2)]);
    r6 = r6 << 2;
    r6 = (r6 + r7) | 0;
    r6 = r6 >> 2;
    heapClassInst.heap32[(r6 + 1)] = 1065353216;
    r6 = Int64(heapClassInst.heap32[(r5 + 6)]);
    r7 = Int64(heapClassInst.heap32[(r5 + 2)]);
    r6 = r6 << 3;
    r6 = (r6 + r7) | 0;
    r6 = r6 >> 2;
    heapClassInst.heap32[(r6 + 2)] = 1065353216;
    r3 = r3 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r3 + 9)]);
    f1 = Float64(heapClassInst.heapFloat[(r1 + 84)]);
    f2 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
    f3 = Float64(heapClassInst.heapFloat[(r3 + 10)]);
    f4 = Float64(heapClassInst.heapFloat[(r1 + 85)]);
    f5 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
    r6 = Int64(heapClassInst.heap32[(r5 + 6)]);
    f6 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
    f7 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
    r7 = Int64(heapClassInst.heap32[(r5 + 3)]);
    f2 = f2 * f1;
    f5 = f5 * f4;
    f0 = f0 * f1;
    f3 = f3 * f4;
    f8 = Float64(heapClassInst.heapFloat[(r3 + 11)]);
    f9 = Float64(heapClassInst.heapFloat[(r1 + 86)]);
    f10 = Float64(heapClassInst.heapFloat[(r3 + 7)]);
    f11 = Float64(heapClassInst.heapFloat[(r3 + 3)]);
    f2 = f2 + f5;
    f5 = f10 * f9;
    r8 = r7 >> 2;
    f0 = f0 + f3;
    f3 = f8 * f9;
    f2 = f2 + f5;
    f0 = f0 + f3;
    heapClassInst.heap32[(r8)] = 0;
    r9 = r6 << 2;
    f3 = -f2;
    heapClassInst.heapFloat[(r8 + 1)] = Float32(f0);
    r9 = (r7 + r9) | 0;
    heapClassInst.heapFloat[(r8 + 2)] = Float32(f3);
    r9 = r9 >> 2;
    f1 = f6 * f1;
    f3 = f7 * f4;
    f4 = -f0;
    heapClassInst.heap32[(r8 + 3)] = 0;
    heapClassInst.heapFloat[(r9)] = Float32(f4);
    f1 = f1 + f3;
    f3 = f11 * f9;
    r6 = r6 << 3;
    f1 = f1 + f3;
    heapClassInst.heap32[(r9 + 1)] = 0;
    r8 = (r6 + r7) | 0;
    r6 = r6 | 4;
    heapClassInst.heapFloat[(r9 + 2)] = Float32(f1);
    r6 = (r7 + r6) | 0;
    r7 = r8 >> 2;
    heapClassInst.heap32[(r9 + 3)] = 0;
    r6 = r6 >> 2;
    f3 = -f1;
    heapClassInst.heapFloat[(r7)] = Float32(f2);
    heapClassInst.heapFloat[(r6)] = Float32(f3);
    heapClassInst.heap32[(r7 + 2)] = 0;
    heapClassInst.heap32[(r7 + 3)] = 0;
    r2 = r2 >> 2;
    f3 = Float64(heapClassInst.heapFloat[(r2 + 9)]);
    f4 = Float64(heapClassInst.heapFloat[(r1 + 100)]);
    f5 = Float64(heapClassInst.heapFloat[(r2 + 10)]);
    f6 = Float64(heapClassInst.heapFloat[(r1 + 101)]);
    f3 = f3 * f4;
    f5 = f5 * f6;
    f7 = Float64(heapClassInst.heapFloat[(r2 + 11)]);
    f8 = Float64(heapClassInst.heapFloat[(r1 + 102)]);
    r6 = Int64(heapClassInst.heap32[(r5 + 6)]);
    f9 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
    f10 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
    f11 = Float64(heapClassInst.heapFloat[(r2 + 7)]);
    f12 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
    f13 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
    f14 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
    r7 = Int64(heapClassInst.heap32[(r5 + 5)]);
    f3 = f3 + f5;
    f5 = f7 * f8;
    f3 = f3 + f5;
    r8 = r7 >> 2;
    f5 = f9 * f4;
    f7 = f10 * f6;
    f5 = f5 + f7;
    f7 = f11 * f8;
    f9 = -f3;
    heapClassInst.heap32[(r8)] = 0;
    f5 = f5 + f7;
    r9 = r6 << 2;
    heapClassInst.heapFloat[(r8 + 1)] = Float32(f9);
    r9 = (r7 + r9) | 0;
    heapClassInst.heapFloat[(r8 + 2)] = Float32(f5);
    f4 = f12 * f4;
    f6 = f13 * f6;
    f4 = f4 + f6;
    f6 = f14 * f8;
    r9 = r9 >> 2;
    heapClassInst.heap32[(r8 + 3)] = 0;
    f4 = f4 + f6;
    heapClassInst.heapFloat[(r9)] = Float32(f3);
    r6 = r6 << 3;
    f6 = -f4;
    heapClassInst.heap32[(r9 + 1)] = 0;
    r8 = (r6 + r7) | 0;
    r6 = r6 | 4;
    heapClassInst.heapFloat[(r9 + 2)] = Float32(f6);
    r6 = (r7 + r6) | 0;
    r7 = r8 >> 2;
    f6 = -f5;
    heapClassInst.heap32[(r9 + 3)] = 0;
    r6 = r6 >> 2;
    heapClassInst.heapFloat[(r7)] = Float32(f6);
    heapClassInst.heapFloat[(r6)] = Float32(f4);
    heapClassInst.heap32[(r7 + 2)] = 0;
    heapClassInst.heap32[(r7 + 3)] = 0;
    r6 = Int64(heapClassInst.heapU8[r0 + 580]);
    r6 = r6 & 2;
    if (r6 == 0) 
    {
      r4 = (r4 + 4) | 0;
    }
    else {
      r4 = (r0 + 588) | 0;
    }
    f6 = Float64(heapClassInst.heapFloat[(r2 + 13)]);
    r4 = r4 >> 2;
    f4 = f4 + f6;
    f1 = f4 - f1;
    f4 = Float64(heapClassInst.heapFloat[(r3 + 13)]);
    f6 = Float64(heapClassInst.heapFloat[(r4)]);
    f7 = Float64(heapClassInst.heapFloat[(r5)]);
    r4 = Int64(heapClassInst.heap32[(r5 + 7)]);
    f6 = f7 * f6;
    f1 = f1 - f4;
    r4 = r4 >> 2;
    f1 = f1 * f6;
    heapClassInst.heapFloat[(r4)] = Float32(f1);
    r4 = Int64(heapClassInst.heap32[(r5 + 9)]);
    r4 = r4 >> 2;
    heapClassInst.heap32[(r4)] = ( -8388609);
    r4 = Int64(heapClassInst.heap32[(r5 + 10)]);
    r4 = r4 >> 2;
    heapClassInst.heap32[(r4)] = 2139095039;
    r4 = Int64(heapClassInst.heapU8[r0 + 580]);
    r4 = r4 & 1;
    if (!(r4 == 0)) 
    {
      r4 = Int64(heapClassInst.heap32[(r5 + 8)]);
      r4 = r4 >> 2;
      heapClassInst.heap32[(r4)] = heapClassInst.heap32[(r1 + 146)];
    }
    f1 = Float64(heapClassInst.heapFloat[(r2 + 14)]);
    r4 = Int64(heapClassInst.heap32[(r5 + 6)]);
    f1 = f5 + f1;
    r4 = r4 << 2;
    r6 = Int64(heapClassInst.heap32[(r5 + 7)]);
    f4 = Float64(heapClassInst.heapFloat[(r3 + 14)]);
    f1 = f1 - f2;
    r4 = (r6 + r4) | 0;
    f1 = f1 - f4;
    r4 = r4 >> 2;
    f1 = f1 * f6;
    heapClassInst.heapFloat[(r4)] = Float32(f1);
    r4 = Int64(heapClassInst.heap32[(r5 + 6)]);
    r6 = Int64(heapClassInst.heap32[(r5 + 9)]);
    r4 = r4 << 2;
    r4 = (r6 + r4) | 0;
    r4 = r4 >> 2;
    heapClassInst.heap32[(r4)] = ( -8388609);
    r4 = Int64(heapClassInst.heap32[(r5 + 6)]);
    r6 = Int64(heapClassInst.heap32[(r5 + 10)]);
    r4 = r4 << 2;
    r4 = (r6 + r4) | 0;
    r4 = r4 >> 2;
    heapClassInst.heap32[(r4)] = 2139095039;
    r4 = Int64(heapClassInst.heapU8[r0 + 580]);
    r4 = r4 & 1;
    if (!(r4 == 0)) 
    {
      r4 = Int64(heapClassInst.heap32[(r5 + 6)]);
      r6 = Int64(heapClassInst.heap32[(r5 + 8)]);
      r4 = r4 << 2;
      r4 = (r6 + r4) | 0;
      r4 = r4 >> 2;
      heapClassInst.heap32[(r4)] = heapClassInst.heap32[(r1 + 146)];
    }
    f1 = Float64(heapClassInst.heapFloat[(r2 + 15)]);
    r2 = Int64(heapClassInst.heap32[(r5 + 6)]);
    f3 = f3 + f1;
    r2 = r2 << 3;
    r4 = Int64(heapClassInst.heap32[(r5 + 7)]);
    f1 = Float64(heapClassInst.heapFloat[(r3 + 15)]);
    f0 = f3 - f0;
    r2 = (r4 + r2) | 0;
    f0 = f0 - f1;
    r2 = r2 >> 2;
    f0 = f0 * f6;
    heapClassInst.heapFloat[(r2)] = Float32(f0);
    r2 = Int64(heapClassInst.heap32[(r5 + 6)]);
    r4 = Int64(heapClassInst.heap32[(r5 + 9)]);
    r2 = r2 << 3;
    r2 = (r4 + r2) | 0;
    r2 = r2 >> 2;
    heapClassInst.heap32[(r2)] = ( -8388609);
    r2 = Int64(heapClassInst.heap32[(r5 + 6)]);
    r4 = Int64(heapClassInst.heap32[(r5 + 10)]);
    r2 = r2 << 3;
    r2 = (r4 + r2) | 0;
    r2 = r2 >> 2;
    heapClassInst.heap32[(r2)] = 2139095039;
    r2 = Int64(heapClassInst.heapU8[r0 + 580]);
    r2 = r2 & 1;
    if (!(r2 == 0)) 
    {
      r2 = Int64(heapClassInst.heap32[(r5 + 6)]);
      r4 = Int64(heapClassInst.heap32[(r5 + 8)]);
      r2 = r2 << 3;
      r2 = (r4 + r2) | 0;
      r2 = r2 >> 2;
      heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r1 + 146)];
    }
    r2 = Int64(heapClassInst.heap32[(r5 + 6)]);
    r4 = (r2 * 3) | 0;
    r6 = Int64(heapClassInst.heapU8[r0 + 514]);
    do {
      if (r6 != 0) 
      {
        f0 = Float64(heapClassInst.heapFloat[(r1 + 111)]);
        r6 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r7 = Int64(heapClassInst.heap32[(r5 + 5)]);
        f3 = Float64(heapClassInst.heapFloat[(r1 + 108)]);
        if (!(f3 >= f0)) 
        {
          f3 = Float64(heapClassInst.heapFloat[(r1 + 109)]);
          if (!(f3 >= f0)) 
          {
            f0 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
            f3 = Float64(heapClassInst.heapFloat[(r1 + 73)]);
            f6 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
            f1 = Float64(heapClassInst.heapFloat[(r1 + 77)]);
            r8 = (r4 + 1) | 0;
            f2 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
            f4 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
            r9 = r4 << 2;
            f5 = f3 * f0;
            f7 = f1 * f6;
            f8 = Float64(heapClassInst.heapFloat[(r3 + 3)]);
            f9 = Float64(heapClassInst.heapFloat[(r1 + 81)]);
            f10 = Float64(heapClassInst.heapFloat[(r1 + 74)]);
            f11 = Float64(heapClassInst.heapFloat[(r3 + 9)]);
            f12 = Float64(heapClassInst.heapFloat[(r1 + 78)]);
            f13 = Float64(heapClassInst.heapFloat[(r3 + 10)]);
            r10 = (r4 + 2) | 0;
            r8 = r8 << 2;
            r11 = (r6 + r9) | 0;
            f14 = Float64(heapClassInst.heapFloat[(r3 + 11)]);
            f15 = Float64(heapClassInst.heapFloat[(r1 + 82)]);
            f16 = Float64(heapClassInst.heapFloat[(r3 + 7)]);
            f17 = f3 * f2;
            f18 = f1 * f4;
            f5 = f5 + f7;
            f7 = f9 * f8;
            r2 = (r2 + r4) | 0;
            r3 = r10 << 2;
            r4 = (r6 + r8) | 0;
            f5 = f5 + f7;
            f3 = f3 * f11;
            f1 = f1 * f13;
            f7 = f17 + f18;
            f17 = f9 * f16;
            r10 = r11 >> 2;
            r11 = (r2 + 1) | 0;
            r12 = r2 << 2;
            r13 = (r6 + r3) | 0;
            f7 = f7 + f17;
            f0 = f10 * f0;
            f6 = f12 * f6;
            f3 = f3 + f1;
            f1 = f9 * f14;
            r4 = r4 >> 2;
            heapClassInst.heapFloat[(r10)] = Float32(f5);
            r10 = (r2 + 2) | 0;
            r11 = r11 << 2;
            r14 = (r6 + r12) | 0;
            f3 = f3 + f1;
            f1 = f10 * f2;
            f2 = f12 * f4;
            f0 = f0 + f6;
            f6 = f15 * f8;
            r13 = r13 >> 2;
            heapClassInst.heapFloat[(r4)] = Float32(f7);
            r4 = r10 << 2;
            r10 = (r6 + r11) | 0;
            f0 = f0 + f6;
            f6 = f10 * f11;
            f4 = f12 * f13;
            f1 = f1 + f2;
            f2 = f15 * f16;
            r14 = r14 >> 2;
            heapClassInst.heapFloat[(r13)] = Float32(f3);
            r6 = (r6 + r4) | 0;
            f1 = f1 + f2;
            f6 = f6 + f4;
            f2 = f15 * f14;
            r10 = r10 >> 2;
            heapClassInst.heapFloat[(r14)] = Float32(f0);
            r13 = (r7 + r9) | 0;
            f6 = f6 + f2;
            r6 = r6 >> 2;
            heapClassInst.heapFloat[(r10)] = Float32(f1);
            r8 = (r7 + r8) | 0;
            r10 = r13 >> 2;
            f2 = -f5;
            heapClassInst.heapFloat[(r6)] = Float32(f6);
            r3 = (r7 + r3) | 0;
            r6 = r8 >> 2;
            f4 = -f7;
            heapClassInst.heapFloat[(r10)] = Float32(f2);
            r8 = (r7 + r12) | 0;
            r3 = r3 >> 2;
            f2 = -f3;
            heapClassInst.heapFloat[(r6)] = Float32(f4);
            r6 = (r7 + r11) | 0;
            r8 = r8 >> 2;
            f4 = -f0;
            heapClassInst.heapFloat[(r3)] = Float32(f2);
            r3 = (r7 + r4) | 0;
            r4 = r6 >> 2;
            f2 = -f1;
            heapClassInst.heapFloat[(r8)] = Float32(f4);
            r3 = r3 >> 2;
            f4 = -f6;
            heapClassInst.heapFloat[(r4)] = Float32(f2);
            heapClassInst.heapFloat[(r3)] = Float32(f4);
            f2 = Float64(heapClassInst.heapFloat[(r1 + 112)]);
            f4 = Float64(heapClassInst.heapFloat[(r1 + 113)]);
            f8 = Float64(heapClassInst.heapFloat[(r1 + 114)]);
            f2 = f2 * f5;
            f4 = f4 * f7;
            r3 = Int64(heapClassInst.heap32[(r5 + 7)]);
            f2 = f2 + f4;
            f3 = f8 * f3;
            f4 = Float64(heapClassInst.heapFloat[(r5)]);
            f5 = Float64(heapClassInst.heapFloat[(r1 + 106)]);
            r3 = (r3 + r9) | 0;
            f3 = f2 + f3;
            f2 = f4 * f5;
            r3 = r3 >> 2;
            f3 = f3 * f2;
            heapClassInst.heapFloat[(r3)] = Float32(f3);
            f3 = Float64(heapClassInst.heapFloat[(r1 + 112)]);
            f4 = Float64(heapClassInst.heapFloat[(r1 + 113)]);
            f5 = Float64(heapClassInst.heapFloat[(r1 + 114)]);
            f0 = f3 * f0;
            f3 = f4 * f1;
            r3 = Int64(heapClassInst.heap32[(r5 + 7)]);
            f0 = f0 + f3;
            f3 = f5 * f6;
            r3 = (r3 + r12) | 0;
            f0 = f0 + f3;
            r3 = r3 >> 2;
            f0 = f0 * f2;
            heapClassInst.heapFloat[(r3)] = Float32(f0);
            r3 = Int64(heapClassInst.heap32[(r5 + 9)]);
            r3 = (r3 + r9) | 0;
            r3 = r3 >> 2;
            heapClassInst.heap32[(r3)] = ( -8388609);
            r3 = Int64(heapClassInst.heap32[(r5 + 10)]);
            r3 = (r3 + r9) | 0;
            r3 = r3 >> 2;
            heapClassInst.heap32[(r3)] = 2139095039;
            r3 = Int64(heapClassInst.heap32[(r5 + 9)]);
            r3 = (r3 + r12) | 0;
            r3 = r3 >> 2;
            heapClassInst.heap32[(r3)] = ( -8388609);
            r3 = Int64(heapClassInst.heap32[(r5 + 10)]);
            r3 = (r3 + r12) | 0;
            r3 = r3 >> 2;
            heapClassInst.heap32[(r3)] = 2139095039;
            r3 = Int64(heapClassInst.heap32[(r5 + 6)]);
            r4 = (r3 + r2) | 0;
            break 
          }
        }
        r2 = (r4 + 1) | 0;
        r3 = r4 << 2;
        f0 = Float64(heapClassInst.heapFloat[(r1 + 106)]);
        f3 = Float64(heapClassInst.heapFloat[(r1 + 112)]);
        r8 = (r4 + 2) | 0;
        r2 = r2 << 2;
        r9 = (r6 + r3) | 0;
        f3 = f3 * f0;
        f6 = Float64(heapClassInst.heapFloat[(r1 + 114)]);
        f1 = Float64(heapClassInst.heapFloat[(r1 + 113)]);
        r8 = r8 << 2;
        r10 = (r6 + r2) | 0;
        f1 = f1 * f0;
        f3 = f3 * f0;
        r9 = r9 >> 2;
        r6 = (r6 + r8) | 0;
        f6 = f6 * f0;
        f1 = f1 * f0;
        r10 = r10 >> 2;
        heapClassInst.heapFloat[(r9)] = Float32(f3);
        r9 = (r7 + r3) | 0;
        f0 = f6 * f0;
        r6 = r6 >> 2;
        heapClassInst.heapFloat[(r10)] = Float32(f1);
        r2 = (r7 + r2) | 0;
        r9 = r9 >> 2;
        f3 = -f3;
        heapClassInst.heapFloat[(r6)] = Float32(f0);
        r6 = (r7 + r8) | 0;
        r2 = r2 >> 2;
        f6 = -f1;
        heapClassInst.heapFloat[(r9)] = Float32(f3);
        r6 = r6 >> 2;
        f0 = -f0;
        heapClassInst.heapFloat[(r2)] = Float32(f6);
        heapClassInst.heapFloat[(r6)] = Float32(f0);
        r2 = Int64(heapClassInst.heap32[(r5 + 7)]);
        f0 = Float64(heapClassInst.heapFloat[(r5)]);
        f3 = Float64(heapClassInst.heapFloat[(r1 + 105)]);
        r2 = (r2 + r3) | 0;
        f6 = Float64(heapClassInst.heapFloat[(r1 + 123)]);
        f0 = f0 * f3;
        r2 = r2 >> 2;
        f0 = f6 * f0;
        heapClassInst.heapFloat[(r2)] = Float32(f0);
        r2 = Int64(heapClassInst.heapU8[r0 + 580]);
        r2 = r2 & 4;
        if (!(r2 == 0)) 
        {
          r2 = Int64(heapClassInst.heap32[(r5 + 8)]);
          r2 = (r2 + r3) | 0;
          r2 = r2 >> 2;
          heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r1 + 148)];
        }
        r2 = Int64(heapClassInst.heap32[(r5 + 9)]);
        r2 = (r2 + r3) | 0;
        r2 = r2 >> 2;
        heapClassInst.heap32[(r2)] = 0;
        r2 = Int64(heapClassInst.heap32[(r5 + 10)]);
        r2 = (r2 + r3) | 0;
        r2 = r2 >> 2;
        heapClassInst.heap32[(r2)] = 2139095039;
        r2 = Int64(heapClassInst.heap32[(r5 + 6)]);
        r4 = (r2 + r4) | 0;
      }
    } while (false);
    r2 = Int64(heapClassInst.heapU8[r0 + 513]);
    if (r2 == 0) 
    {
      return;
    }
    else {
      r2 = (r4 + 1) | 0;
      r3 = r4 << 2;
      r6 = Int64(heapClassInst.heap32[(r5 + 3)]);
      f0 = Float64(heapClassInst.heapFloat[(r1 + 106)]);
      f3 = Float64(heapClassInst.heapFloat[(r1 + 116)]);
      r4 = (r4 + 2) | 0;
      r2 = r2 << 2;
      r7 = Int64(heapClassInst.heap32[(r5 + 5)]);
      r8 = (r6 + r3) | 0;
      f3 = f3 * f0;
      f6 = Float64(heapClassInst.heapFloat[(r1 + 118)]);
      f1 = Float64(heapClassInst.heapFloat[(r1 + 117)]);
      r4 = r4 << 2;
      r9 = (r6 + r2) | 0;
      f1 = f1 * f0;
      f3 = f3 * f0;
      r8 = r8 >> 2;
      r6 = (r6 + r4) | 0;
      f6 = f6 * f0;
      f1 = f1 * f0;
      r9 = r9 >> 2;
      heapClassInst.heapFloat[(r8)] = Float32(f3);
      r8 = (r7 + r3) | 0;
      f0 = f6 * f0;
      r6 = r6 >> 2;
      heapClassInst.heapFloat[(r9)] = Float32(f1);
      r2 = (r7 + r2) | 0;
      r8 = r8 >> 2;
      f3 = -f3;
      heapClassInst.heapFloat[(r6)] = Float32(f0);
      r4 = (r7 + r4) | 0;
      r2 = r2 >> 2;
      f6 = -f1;
      heapClassInst.heapFloat[(r8)] = Float32(f3);
      r4 = r4 >> 2;
      f0 = -f0;
      heapClassInst.heapFloat[(r2)] = Float32(f6);
      heapClassInst.heapFloat[(r4)] = Float32(f0);
      r2 = Int64(heapClassInst.heap32[(r5 + 7)]);
      f0 = Float64(heapClassInst.heapFloat[(r5)]);
      f3 = Float64(heapClassInst.heapFloat[(r1 + 105)]);
      r2 = (r2 + r3) | 0;
      f6 = Float64(heapClassInst.heapFloat[(r1 + 124)]);
      f0 = f0 * f3;
      r2 = r2 >> 2;
      f0 = f6 * f0;
      heapClassInst.heapFloat[(r2)] = Float32(f0);
      r0 = Int64(heapClassInst.heapU8[r0 + 580]);
      r0 = r0 & 4;
      if (!(r0 == 0)) 
      {
        r0 = Int64(heapClassInst.heap32[(r5 + 8)]);
        r0 = (r0 + r3) | 0;
        r0 = r0 >> 2;
        heapClassInst.heap32[(r0)] = heapClassInst.heap32[(r1 + 148)];
      }
      f0 = Float64(heapClassInst.heapFloat[(r1 + 110)]);
      f3 = 0.0;
      if (f0 <= f3) 
      {
        r0 = Int64(heapClassInst.heap32[(r5 + 9)]);
        r0 = (r0 + r3) | 0;
        r0 = r0 >> 2;
        heapClassInst.heap32[(r0)] = ( -8388609);
      }
      else {
        r0 = Int64(heapClassInst.heap32[(r5 + 9)]);
        f0 = Float64(heapClassInst.heapFloat[(r1 + 124)]);
        if (f0 <= f3) 
        {
          r0 = (r0 + r3) | 0;
          r0 = r0 >> 2;
          heapClassInst.heap32[(r0)] = ( -8388609);
          r0 = Int64(heapClassInst.heap32[(r5 + 10)]);
          r3 = (r0 + r3) | 0;
          r3 = r3 >> 2;
          heapClassInst.heap32[(r3)] = 0;
          return;
        }
        else {
          r0 = (r0 + r3) | 0;
          r0 = r0 >> 2;
          heapClassInst.heap32[(r0)] = 0;
        }
      }
      r0 = Int64(heapClassInst.heap32[(r5 + 10)]);
      r0 = (r0 + r3) | 0;
      r0 = r0 >> 2;
      heapClassInst.heap32[(r0)] = 2139095039;
      return;
    }
  }
  else {
    r0 = _E2_str1149;
    r1 = _E2_str24;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = 126;
    _assert(i7);
  }
}

@OverflowWrapping
func _ZN21btConeTwistConstraint23solveConstraintObsoleteER11btRigidBodyS1_f(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  i7 = sp + (-624); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heapU8[r0 + 515]);
  if (!(r1 == 0)) 
  {
    r1 = Int64(heapClassInst.heap32[(fp + 1)]);
    r2 = Int64(heapClassInst.heap32[(fp + 2)]);
    f0 = Float64(heapClassInst.heapFloat[(fp + 3)]);
    heapClassInst.heapFloat[(fp + (-117))] = Float32(f0);
    r3 = r0 >> 2;
    r4 = Int64(heapClassInst.heapU8[r0 + 512]);
    if (!(r4 != 0)) 
    {
      r4 = Int64(heapClassInst.heap32[(r3 + 5)]);
      r5 = Int64(heapClassInst.heap32[(r3 + 6)]);
      r4 = r4 >> 2;
      r5 = r5 >> 2;
      f0 = Float64(heapClassInst.heapFloat[(r4 + 9)]);
      f1 = Float64(heapClassInst.heapFloat[(r3 + 84)]);
      f2 = Float64(heapClassInst.heapFloat[(r4 + 5)]);
      f3 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
      f4 = Float64(heapClassInst.heapFloat[(r4 + 10)]);
      f5 = Float64(heapClassInst.heapFloat[(r3 + 85)]);
      f6 = Float64(heapClassInst.heapFloat[(r4 + 6)]);
      f7 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
      f8 = Float64(heapClassInst.heapFloat[(r5 + 9)]);
      f9 = Float64(heapClassInst.heapFloat[(r3 + 100)]);
      f10 = Float64(heapClassInst.heapFloat[(r5 + 5)]);
      f11 = Float64(heapClassInst.heapFloat[(r5 + 1)]);
      f12 = Float64(heapClassInst.heapFloat[(r5 + 10)]);
      f13 = Float64(heapClassInst.heapFloat[(r3 + 101)]);
      f14 = Float64(heapClassInst.heapFloat[(r5 + 6)]);
      f15 = Float64(heapClassInst.heapFloat[(r5 + 2)]);
      f0 = f0 * f1;
      f4 = f4 * f5;
      f16 = Float64(heapClassInst.heapFloat[(r4 + 11)]);
      f17 = Float64(heapClassInst.heapFloat[(r3 + 86)]);
      f18 = Float64(heapClassInst.heapFloat[(r4 + 7)]);
      f19 = Float64(heapClassInst.heapFloat[(r4 + 3)]);
      f2 = f2 * f1;
      f6 = f6 * f5;
      f1 = f3 * f1;
      f3 = f7 * f5;
      f5 = f8 * f9;
      f7 = f12 * f13;
      f8 = Float64(heapClassInst.heapFloat[(r5 + 11)]);
      f12 = Float64(heapClassInst.heapFloat[(r3 + 102)]);
      f20 = Float64(heapClassInst.heapFloat[(r5 + 7)]);
      f21 = Float64(heapClassInst.heapFloat[(r5 + 3)]);
      f10 = f10 * f9;
      f14 = f14 * f13;
      f9 = f11 * f9;
      f11 = f15 * f13;
      f0 = f0 + f4;
      f4 = f16 * f17;
      f2 = f2 + f6;
      f6 = f18 * f17;
      f1 = f1 + f3;
      f3 = f19 * f17;
      f5 = f5 + f7;
      f7 = f8 * f12;
      f8 = f10 + f14;
      f10 = f20 * f12;
      f9 = f9 + f11;
      f11 = f21 * f12;
      f12 = Float64(heapClassInst.heapFloat[(r4 + 15)]);
      f0 = f0 + f4;
      f4 = Float64(heapClassInst.heapFloat[(r4 + 14)]);
      f2 = f2 + f6;
      f6 = Float64(heapClassInst.heapFloat[(r4 + 13)]);
      f1 = f1 + f3;
      f3 = Float64(heapClassInst.heapFloat[(r5 + 15)]);
      f5 = f5 + f7;
      f7 = Float64(heapClassInst.heapFloat[(r5 + 14)]);
      f8 = f8 + f10;
      f10 = Float64(heapClassInst.heapFloat[(r5 + 13)]);
      f9 = f9 + f11;
      f0 = f0 + f12;
      heapClassInst.heapFloat[(fp + (-119))] = Float32(f0);
      f0 = f2 + f4;
      heapClassInst.heapFloat[(fp + (-121))] = Float32(f0);
      f1 = f1 + f6;
      heapClassInst.heapFloat[(fp + (-120))] = Float32(f1);
      f0 = f5 + f3;
      heapClassInst.heapFloat[(fp + (-122))] = Float32(f0);
      f0 = f8 + f7;
      heapClassInst.heapFloat[(fp + (-123))] = Float32(f0);
      f1 = f9 + f10;
      r4 = r1 >> 2;
      r5 = r2 >> 2;
      f2 = Float64(heapClassInst.heapFloat[(r4 + 80)]);
      f5 = Float64(heapClassInst.heapFloat[(r4 + 130)]);
      f8 = Float64(heapClassInst.heapFloat[(r5 + 80)]);
      f9 = Float64(heapClassInst.heapFloat[(r5 + 130)]);
      f11 = Float64(heapClassInst.heapFloat[(r4 + 81)]);
      f13 = Float64(heapClassInst.heapFloat[(r4 + 131)]);
      f14 = Float64(heapClassInst.heapFloat[(r4 + 82)]);
      f15 = Float64(heapClassInst.heapFloat[(r4 + 132)]);
      f16 = Float64(heapClassInst.heapFloat[(r5 + 81)]);
      f17 = Float64(heapClassInst.heapFloat[(r5 + 131)]);
      f18 = Float64(heapClassInst.heapFloat[(r5 + 82)]);
      f19 = Float64(heapClassInst.heapFloat[(r5 + 132)]);
      f20 = Float64(heapClassInst.heapFloat[(fp + (-120))]);
      f6 = f20 - f6;
      f10 = f1 - f10;
      f11 = f11 + f13;
      f0 = Float64(heapClassInst.heapFloat[(fp + (-119))]);
      f12 = f0 - f12;
      f2 = f2 + f5;
      f0 = Float64(heapClassInst.heapFloat[(fp + (-121))]);
      f4 = f0 - f4;
      f5 = f14 + f15;
      f13 = f16 + f17;
      f0 = Float64(heapClassInst.heapFloat[(fp + (-122))]);
      f3 = f0 - f3;
      f8 = f8 + f9;
      f0 = Float64(heapClassInst.heapFloat[(fp + (-123))]);
      f7 = f0 - f7;
      f9 = f18 + f19;
      f14 = Float64(heapClassInst.heapFloat[(r4 + 78)]);
      f15 = Float64(heapClassInst.heapFloat[(r4 + 128)]);
      f16 = f2 * f4;
      f17 = f11 * f6;
      f18 = Float64(heapClassInst.heapFloat[(r5 + 78)]);
      f19 = Float64(heapClassInst.heapFloat[(r5 + 128)]);
      f21 = f8 * f7;
      f22 = f13 * f10;
      f23 = Float64(heapClassInst.heapFloat[(r4 + 77)]);
      f24 = Float64(heapClassInst.heapFloat[(r4 + 127)]);
      f25 = f5 * f6;
      f2 = f2 * f12;
      f26 = Float64(heapClassInst.heapFloat[(r5 + 77)]);
      f27 = Float64(heapClassInst.heapFloat[(r5 + 127)]);
      f28 = f9 * f10;
      f8 = f8 * f3;
      f29 = Float64(heapClassInst.heapFloat[(r4 + 76)]);
      f30 = Float64(heapClassInst.heapFloat[(r4 + 126)]);
      f11 = f11 * f12;
      f5 = f5 * f4;
      f0 = Float64(heapClassInst.heapFloat[(r5 + 76)]);
      f20 = Float64(heapClassInst.heapFloat[(r5 + 126)]);
      f13 = f13 * f3;
      f9 = f9 * f7;
      f14 = f14 + f15;
      f15 = f16 - f17;
      f16 = f18 + f19;
      f17 = f21 - f22;
      f18 = f23 + f24;
      f2 = f25 - f2;
      f19 = f26 + f27;
      f8 = f28 - f8;
      f21 = f29 + f30;
      f5 = f11 - f5;
      f0 = f0 + f20;
      f9 = f13 - f9;
      f11 = f14 + f15;
      f13 = f16 + f17;
      f2 = f18 + f2;
      f8 = f19 + f8;
      f5 = f21 + f5;
      f0 = f0 + f9;
      f9 = f11 - f13;
      f2 = f2 - f8;
      heapClassInst.heapFloat[(fp + (-118))] = Float32(f2);
      f0 = f5 - f0;
      f2 = Float64(heapClassInst.heapFloat[(fp + (-119))]);
      f5 = Float64(heapClassInst.heapFloat[(fp + (-122))]);
      f2 = f2 - f5;
      f5 = Float64(heapClassInst.heapFloat[(fp + (-121))]);
      f8 = Float64(heapClassInst.heapFloat[(fp + (-123))]);
      f5 = f5 - f8;
      f8 = Float64(heapClassInst.heapFloat[(fp + (-120))]);
      f1 = f8 - f1;
      r6 = 0;
      while (true) {
        r7 = (r6 * ( -21)) | 0;
        r8 = r7 << 2;
        r8 = (r0 + r8) | 0;
        r8 = r8 >> 2;
        f8 = Float64(heapClassInst.heapFloat[(r8 + 9)]);
        f11 = Float64(heapClassInst.heapFloat[(r8 + 10)]);
        f13 = Float64(heapClassInst.heapFloat[(r8 + 11)]);
        f14 = f1 * f8;
        f15 = f5 * f11;
        f14 = f14 + f15;
        f15 = f2 * f13;
        f14 = f14 + f15;
        f15 = -0.30000001192092896;
        f16 = f8 * f0;
        f17 = Float64(heapClassInst.heapFloat[(fp + (-118))]);
        f17 = f11 * f17;
        f14 = f14 * f15;
        f15 = f16 + f17;
        f16 = f13 * f9;
        f17 = 1.0;
        f18 = Float64(heapClassInst.heapFloat[(r8 + 29)]);
        f19 = Float64(heapClassInst.heapFloat[(fp + (-117))]);
        f14 = f14 / f19;
        f17 = f17 / f18;
        f15 = f15 + f16;
        f14 = f14 * f17;
        f15 = f15 * f17;
        f14 = f14 - f15;
        f15 = Float64(heapClassInst.heapFloat[(r3 + 7)]);
        f15 = f15 + f14;
        heapClassInst.heapFloat[(r3 + 7)] = Float32(f15);
        f15 = Float64(heapClassInst.heapFloat[(r4 + 84)]);
        f16 = 0.0;
        if (!(f15 == f16)) 
        {
          r9 = Int64(heapClassInst.heap32[(r3 + 5)]);
          r9 = r9 >> 2;
          f15 = f6 * f11;
          f17 = f4 * f8;
          f18 = f12 * f8;
          f19 = f6 * f13;
          f20 = f4 * f13;
          f21 = f12 * f11;
          f15 = f15 - f17;
          f17 = f18 - f19;
          f18 = f20 - f21;
          f19 = Float64(heapClassInst.heapFloat[(r9 + 84)]);
          f20 = f8 * f19;
          f20 = f20 * f14;
          f21 = Float64(heapClassInst.heapFloat[(r4 + 126)]);
          f22 = Float64(heapClassInst.heapFloat[(r9 + 65)]);
          f23 = Float64(heapClassInst.heapFloat[(r9 + 64)]);
          f24 = Float64(heapClassInst.heapFloat[(r9 + 69)]);
          f25 = Float64(heapClassInst.heapFloat[(r9 + 68)]);
          f26 = Float64(heapClassInst.heapFloat[(r9 + 73)]);
          f27 = Float64(heapClassInst.heapFloat[(r9 + 72)]);
          f28 = Float64(heapClassInst.heapFloat[(r9 + 66)]);
          f29 = Float64(heapClassInst.heapFloat[(r9 + 70)]);
          f30 = Float64(heapClassInst.heapFloat[(r9 + 74)]);
          f20 = f21 + f20;
          f21 = f11 * f19;
          heapClassInst.heapFloat[(r4 + 126)] = Float32(f20);
          f20 = f21 * f14;
          f21 = Float64(heapClassInst.heapFloat[(r4 + 127)]);
          f20 = f21 + f20;
          f19 = f13 * f19;
          heapClassInst.heapFloat[(r4 + 127)] = Float32(f20);
          f19 = f19 * f14;
          f20 = Float64(heapClassInst.heapFloat[(r4 + 128)]);
          f19 = f20 + f19;
          heapClassInst.heapFloat[(r4 + 128)] = Float32(f19);
          f19 = f23 * f18;
          f20 = f22 * f17;
          f21 = Float64(heapClassInst.heapFloat[(r4 + 134)]);
          f19 = f19 + f20;
          f20 = f28 * f15;
          f19 = f19 + f20;
          f20 = f21 * f14;
          f21 = Float64(heapClassInst.heapFloat[(r4 + 136)]);
          f22 = Float64(heapClassInst.heapFloat[(r4 + 135)]);
          f23 = Float64(heapClassInst.heapFloat[(r4 + 130)]);
          f19 = f19 * f20;
          f20 = f25 * f18;
          f24 = f24 * f17;
          f20 = f20 + f24;
          f24 = f29 * f15;
          f19 = f23 + f19;
          heapClassInst.heapFloat[(r4 + 130)] = Float32(f19);
          f19 = f20 + f24;
          f20 = f22 * f14;
          f18 = f27 * f18;
          f17 = f26 * f17;
          f19 = f19 * f20;
          f20 = Float64(heapClassInst.heapFloat[(r4 + 131)]);
          f19 = f20 + f19;
          f17 = f18 + f17;
          f15 = f30 * f15;
          heapClassInst.heapFloat[(r4 + 131)] = Float32(f19);
          f15 = f17 + f15;
          f17 = f21 * f14;
          f15 = f15 * f17;
          f17 = Float64(heapClassInst.heapFloat[(r4 + 132)]);
          f15 = f17 + f15;
          heapClassInst.heapFloat[(r4 + 132)] = Float32(f15);
        }
        f15 = Float64(heapClassInst.heapFloat[(r5 + 84)]);
        if (!(f15 == f16)) 
        {
          f15 = f10 * f11;
          f16 = f7 * f8;
          f8 = f3 * f8;
          f17 = f10 * f13;
          f13 = f7 * f13;
          f11 = f3 * f11;
          f15 = f15 - f16;
          f8 = f8 - f17;
          f11 = f13 - f11;
          r9 = Int64(heapClassInst.heap32[(r3 + 6)]);
          r9 = r9 >> 2;
          f13 = -f14;
          f14 = Float64(heapClassInst.heapFloat[(r9 + 84)]);
          r10 = r7 << 2;
          r10 = (r0 + r10) | 0;
          r10 = r10 >> 2;
          r7 = r7 << 2;
          r7 = (r0 + r7) | 0;
          f16 = Float64(heapClassInst.heapFloat[(r10 + 9)]);
          r7 = r7 >> 2;
          f16 = f16 * f14;
          f17 = Float64(heapClassInst.heapFloat[(r7 + 10)]);
          f18 = Float64(heapClassInst.heapFloat[(r8 + 11)]);
          f16 = f16 * f13;
          f19 = Float64(heapClassInst.heapFloat[(r5 + 126)]);
          f20 = Float64(heapClassInst.heapFloat[(r9 + 65)]);
          f21 = Float64(heapClassInst.heapFloat[(r9 + 64)]);
          f22 = Float64(heapClassInst.heapFloat[(r9 + 69)]);
          f23 = Float64(heapClassInst.heapFloat[(r9 + 68)]);
          f24 = Float64(heapClassInst.heapFloat[(r9 + 73)]);
          f25 = Float64(heapClassInst.heapFloat[(r9 + 72)]);
          f26 = Float64(heapClassInst.heapFloat[(r9 + 66)]);
          f27 = Float64(heapClassInst.heapFloat[(r9 + 70)]);
          f28 = Float64(heapClassInst.heapFloat[(r9 + 74)]);
          f16 = f19 + f16;
          f17 = f17 * f14;
          heapClassInst.heapFloat[(r5 + 126)] = Float32(f16);
          f16 = f17 * f13;
          f17 = Float64(heapClassInst.heapFloat[(r5 + 127)]);
          f16 = f17 + f16;
          f14 = f18 * f14;
          heapClassInst.heapFloat[(r5 + 127)] = Float32(f16);
          f14 = f14 * f13;
          f16 = Float64(heapClassInst.heapFloat[(r5 + 128)]);
          f14 = f16 + f14;
          heapClassInst.heapFloat[(r5 + 128)] = Float32(f14);
          f14 = f21 * f11;
          f16 = f20 * f8;
          f17 = Float64(heapClassInst.heapFloat[(r5 + 134)]);
          f14 = f14 + f16;
          f16 = f26 * f15;
          f14 = f14 + f16;
          f16 = f17 * f13;
          f17 = Float64(heapClassInst.heapFloat[(r5 + 136)]);
          f18 = Float64(heapClassInst.heapFloat[(r5 + 135)]);
          f19 = Float64(heapClassInst.heapFloat[(r5 + 130)]);
          f14 = f14 * f16;
          f16 = f23 * f11;
          f20 = f22 * f8;
          f16 = f16 + f20;
          f20 = f27 * f15;
          f14 = f19 + f14;
          heapClassInst.heapFloat[(r5 + 130)] = Float32(f14);
          f14 = f16 + f20;
          f16 = f18 * f13;
          f11 = f25 * f11;
          f8 = f24 * f8;
          f14 = f14 * f16;
          f16 = Float64(heapClassInst.heapFloat[(r5 + 131)]);
          f14 = f16 + f14;
          f8 = f11 + f8;
          f11 = f28 * f15;
          heapClassInst.heapFloat[(r5 + 131)] = Float32(f14);
          f8 = f8 + f11;
          f11 = f17 * f13;
          f8 = f8 * f11;
          f11 = Float64(heapClassInst.heapFloat[(r5 + 132)]);
          f8 = f11 + f8;
          heapClassInst.heapFloat[(r5 + 132)] = Float32(f8);
        }
        r6 = (r6 + (-1)) | 0;
        if (!(r6 != ( -3))) 
        {
          break 
        }
      }
    }
    r4 = Int64(heapClassInst.heapU8[r0 + 540]);
    do {
      if (r4 == 0) 
      {
        f0 = Float64(heapClassInst.heapFloat[(r3 + 107)]);
        f1 = 1.1920928955078125e-007;
        if (f0 <= f1) 
        {
          break 
        }
        else {
          r4 = r2 >> 2;
          r5 = r1 >> 2;
          f0 = Float64(heapClassInst.heapFloat[(r4 + 81)]);
          f2 = Float64(heapClassInst.heapFloat[(r4 + 131)]);
          f3 = Float64(heapClassInst.heapFloat[(r5 + 81)]);
          f4 = Float64(heapClassInst.heapFloat[(r5 + 131)]);
          f5 = Float64(heapClassInst.heapFloat[(r4 + 80)]);
          f6 = Float64(heapClassInst.heapFloat[(r4 + 130)]);
          f7 = Float64(heapClassInst.heapFloat[(r5 + 80)]);
          f8 = Float64(heapClassInst.heapFloat[(r5 + 130)]);
          f9 = Float64(heapClassInst.heapFloat[(r4 + 82)]);
          f10 = Float64(heapClassInst.heapFloat[(r4 + 132)]);
          f11 = Float64(heapClassInst.heapFloat[(r5 + 82)]);
          f12 = Float64(heapClassInst.heapFloat[(r5 + 132)]);
          f0 = f0 + f2;
          f2 = f3 + f4;
          f3 = f5 + f6;
          f4 = f7 + f8;
          f0 = f0 - f2;
          f2 = f3 - f4;
          f3 = f9 + f10;
          f4 = f11 + f12;
          f3 = f3 - f4;
          f4 = f2 * f2;
          f5 = f0 * f0;
          f4 = f4 + f5;
          f5 = f3 * f3;
          f4 = f4 + f5;
          if (f4 <= f1) 
          {
            break 
          }
          else {
            heapClassInst.heapFloat[(g0)] = Float32(f4);
            sqrtf(i7);
            r6 = Int64(heapClassInst.heap32[(r3 + 5)]);
            r7 = Int64(heapClassInst.heap32[(r3 + 6)]);
            f4 = 1.0;
            r6 = r6 >> 2;
            r7 = r7 >> 2;
            f1 = f4 / commonVariable.f_g0;
            f5 = Float64(heapClassInst.heapFloat[(r6 + 64)]);
            f6 = f2 * f1;
            f7 = Float64(heapClassInst.heapFloat[(r6 + 65)]);
            f8 = Float64(heapClassInst.heapFloat[(r7 + 64)]);
            f9 = Float64(heapClassInst.heapFloat[(r7 + 65)]);
            f10 = Float64(heapClassInst.heapFloat[(r6 + 68)]);
            f11 = f0 * f1;
            f12 = Float64(heapClassInst.heapFloat[(r6 + 69)]);
            f13 = Float64(heapClassInst.heapFloat[(r7 + 68)]);
            f14 = Float64(heapClassInst.heapFloat[(r7 + 69)]);
            f15 = Float64(heapClassInst.heapFloat[(r6 + 66)]);
            f16 = Float64(heapClassInst.heapFloat[(r6 + 70)]);
            f17 = Float64(heapClassInst.heapFloat[(r7 + 66)]);
            f18 = Float64(heapClassInst.heapFloat[(r7 + 70)]);
            f5 = f5 * f6;
            f10 = f10 * f11;
            f19 = Float64(heapClassInst.heapFloat[(r6 + 72)]);
            f1 = f3 * f1;
            f20 = Float64(heapClassInst.heapFloat[(r6 + 73)]);
            f21 = Float64(heapClassInst.heapFloat[(r7 + 72)]);
            f22 = Float64(heapClassInst.heapFloat[(r7 + 73)]);
            f7 = f7 * f6;
            f12 = f12 * f11;
            f8 = f8 * f6;
            f13 = f13 * f11;
            f9 = f9 * f6;
            f14 = f14 * f11;
            f23 = Float64(heapClassInst.heapFloat[(r6 + 74)]);
            f24 = Float64(heapClassInst.heapFloat[(r7 + 74)]);
            f5 = f5 + f10;
            f10 = f19 * f1;
            f7 = f7 + f12;
            f12 = f20 * f1;
            f15 = f15 * f6;
            f16 = f16 * f11;
            f8 = f8 + f13;
            f13 = f21 * f1;
            f9 = f9 + f14;
            f14 = f22 * f1;
            f17 = f17 * f6;
            f18 = f18 * f11;
            f5 = f5 + f10;
            f7 = f7 + f12;
            f8 = f8 + f13;
            f9 = f9 + f14;
            f10 = f15 + f16;
            f12 = f23 * f1;
            f13 = f17 + f18;
            f14 = f24 * f1;
            f10 = f10 + f12;
            f12 = f13 + f14;
            f5 = f6 * f5;
            f7 = f11 * f7;
            f6 = f6 * f8;
            f8 = f11 * f9;
            f5 = f5 + f7;
            f7 = f1 * f10;
            f6 = f6 + f8;
            f1 = f1 * f12;
            f5 = f5 + f7;
            f1 = f6 + f1;
            f1 = f5 + f1;
            f5 = Float64(heapClassInst.heapFloat[(r3 + 107)]);
            f1 = f4 / f1;
            f1 = f5 * f1;
            f0 = f0 * f1;
            f2 = f2 * f1;
            f1 = f3 * f1;
            f3 = f2 * f2;
            f5 = f0 * f0;
            f3 = f3 + f5;
            f5 = f1 * f1;
            f3 = f3 + f5;
            heapClassInst.heapFloat[(g0)] = Float32(f3);
            sqrtf(i7);
            f3 = commonVariable.f_g0;
            f4 = f4 / f3;
            f1 = f1 * f4;
            f0 = f0 * f4;
            f2 = f2 * f4;
            f4 = Float64(heapClassInst.heapFloat[(r5 + 84)]);
            f5 = 0.0;
            if (!(f4 == f5)) 
            {
              r6 = Int64(heapClassInst.heap32[(r3 + 5)]);
              r6 = r6 >> 2;
              f4 = f3 * f5;
              f6 = Float64(heapClassInst.heapFloat[(r5 + 126)]);
              f7 = Float64(heapClassInst.heapFloat[(r6 + 65)]);
              f8 = Float64(heapClassInst.heapFloat[(r6 + 64)]);
              f9 = Float64(heapClassInst.heapFloat[(r6 + 69)]);
              f10 = Float64(heapClassInst.heapFloat[(r6 + 68)]);
              f11 = Float64(heapClassInst.heapFloat[(r6 + 73)]);
              f12 = Float64(heapClassInst.heapFloat[(r6 + 72)]);
              f13 = Float64(heapClassInst.heapFloat[(r6 + 66)]);
              f14 = Float64(heapClassInst.heapFloat[(r6 + 70)]);
              f15 = Float64(heapClassInst.heapFloat[(r6 + 74)]);
              f6 = f6 + f4;
              heapClassInst.heapFloat[(r5 + 126)] = Float32(f6);
              f6 = Float64(heapClassInst.heapFloat[(r5 + 127)]);
              f6 = f6 + f4;
              heapClassInst.heapFloat[(r5 + 127)] = Float32(f6);
              f6 = Float64(heapClassInst.heapFloat[(r5 + 128)]);
              f4 = f6 + f4;
              heapClassInst.heapFloat[(r5 + 128)] = Float32(f4);
              f4 = f8 * f2;
              f6 = f7 * f0;
              f7 = Float64(heapClassInst.heapFloat[(r5 + 134)]);
              f4 = f4 + f6;
              f6 = f13 * f1;
              f4 = f4 + f6;
              f6 = f7 * f3;
              f7 = Float64(heapClassInst.heapFloat[(r5 + 136)]);
              f8 = Float64(heapClassInst.heapFloat[(r5 + 135)]);
              f13 = Float64(heapClassInst.heapFloat[(r5 + 130)]);
              f4 = f4 * f6;
              f6 = f10 * f2;
              f9 = f9 * f0;
              f6 = f6 + f9;
              f9 = f14 * f1;
              f4 = f13 + f4;
              heapClassInst.heapFloat[(r5 + 130)] = Float32(f4);
              f4 = f6 + f9;
              f6 = f8 * f3;
              f8 = f12 * f2;
              f9 = f11 * f0;
              f4 = f4 * f6;
              f6 = Float64(heapClassInst.heapFloat[(r5 + 131)]);
              f4 = f6 + f4;
              f6 = f8 + f9;
              f8 = f15 * f1;
              heapClassInst.heapFloat[(r5 + 131)] = Float32(f4);
              f4 = f6 + f8;
              f6 = f7 * f3;
              f4 = f4 * f6;
              f6 = Float64(heapClassInst.heapFloat[(r5 + 132)]);
              f4 = f6 + f4;
              heapClassInst.heapFloat[(r5 + 132)] = Float32(f4);
            }
            f4 = Float64(heapClassInst.heapFloat[(r4 + 84)]);
            if (f4 == f5) 
            {
              break 
            }
            else {
              f4 = -f3;
              r5 = Int64(heapClassInst.heap32[(r3 + 6)]);
              r5 = r5 >> 2;
              f5 = ( -0.0);
              f3 = f3 * f5;
              f5 = Float64(heapClassInst.heapFloat[(r4 + 126)]);
              f6 = Float64(heapClassInst.heapFloat[(r5 + 65)]);
              f7 = Float64(heapClassInst.heapFloat[(r5 + 64)]);
              f8 = Float64(heapClassInst.heapFloat[(r5 + 69)]);
              f9 = Float64(heapClassInst.heapFloat[(r5 + 68)]);
              f10 = Float64(heapClassInst.heapFloat[(r5 + 73)]);
              f11 = Float64(heapClassInst.heapFloat[(r5 + 72)]);
              f12 = Float64(heapClassInst.heapFloat[(r5 + 66)]);
              f13 = Float64(heapClassInst.heapFloat[(r5 + 70)]);
              f14 = Float64(heapClassInst.heapFloat[(r5 + 74)]);
              f5 = f5 + f3;
              heapClassInst.heapFloat[(r4 + 126)] = Float32(f5);
              f5 = Float64(heapClassInst.heapFloat[(r4 + 127)]);
              f5 = f5 + f3;
              heapClassInst.heapFloat[(r4 + 127)] = Float32(f5);
              f5 = Float64(heapClassInst.heapFloat[(r4 + 128)]);
              f3 = f5 + f3;
              heapClassInst.heapFloat[(r4 + 128)] = Float32(f3);
              f3 = f7 * f2;
              f5 = f6 * f0;
              f3 = f3 + f5;
              f5 = f12 * f1;
              f6 = Float64(heapClassInst.heapFloat[(r4 + 134)]);
              f3 = f3 + f5;
              f5 = f6 * f4;
              f6 = Float64(heapClassInst.heapFloat[(r4 + 136)]);
              f7 = Float64(heapClassInst.heapFloat[(r4 + 135)]);
              f12 = Float64(heapClassInst.heapFloat[(r4 + 130)]);
              f3 = f3 * f5;
              f5 = f9 * f2;
              f8 = f8 * f0;
              f5 = f5 + f8;
              f8 = f13 * f1;
              f3 = f12 + f3;
              heapClassInst.heapFloat[(r4 + 130)] = Float32(f3);
              f3 = f5 + f8;
              f5 = f7 * f4;
              f2 = f11 * f2;
              f0 = f10 * f0;
              f3 = f3 * f5;
              f5 = Float64(heapClassInst.heapFloat[(r4 + 131)]);
              f3 = f5 + f3;
              f0 = f2 + f0;
              f1 = f14 * f1;
              heapClassInst.heapFloat[(r4 + 131)] = Float32(f3);
              f0 = f0 + f1;
              f1 = f6 * f4;
              f0 = f0 * f1;
              f1 = Float64(heapClassInst.heapFloat[(r4 + 132)]);
              f0 = f1 + f0;
              heapClassInst.heapFloat[(r4 + 132)] = Float32(f0);
            }
          }
        }
      }
      else {
        r4 = Int64(heapClassInst.heap32[(r3 + 5)]);
        r5 = sp + (-112);
        r4 = r4 >> 2;
        r6 = r5 >> 2;
        heapClassInst.heap32[(fp + (-28))] = heapClassInst.heap32[(r4 + 1)];
        heapClassInst.heap32[(r6 + 1)] = heapClassInst.heap32[(r4 + 2)];
        heapClassInst.heap32[(r6 + 2)] = heapClassInst.heap32[(r4 + 3)];
        heapClassInst.heap32[(r6 + 3)] = heapClassInst.heap32[(r4 + 4)];
        heapClassInst.heap32[(r6 + 4)] = heapClassInst.heap32[(r4 + 5)];
        heapClassInst.heap32[(r6 + 5)] = heapClassInst.heap32[(r4 + 6)];
        heapClassInst.heap32[(r6 + 6)] = heapClassInst.heap32[(r4 + 7)];
        heapClassInst.heap32[(r6 + 7)] = heapClassInst.heap32[(r4 + 8)];
        heapClassInst.heap32[(r6 + 8)] = heapClassInst.heap32[(r4 + 9)];
        heapClassInst.heap32[(r6 + 9)] = heapClassInst.heap32[(r4 + 10)];
        heapClassInst.heap32[(r6 + 10)] = heapClassInst.heap32[(r4 + 11)];
        heapClassInst.heap32[(r6 + 11)] = heapClassInst.heap32[(r4 + 12)];
        heapClassInst.heap32[(r6 + 12)] = heapClassInst.heap32[(r4 + 13)];
        heapClassInst.heap32[(r6 + 13)] = heapClassInst.heap32[(r4 + 14)];
        heapClassInst.heap32[(r6 + 14)] = heapClassInst.heap32[(r4 + 15)];
        heapClassInst.heap32[(r6 + 15)] = heapClassInst.heap32[(r4 + 16)];
        r4 = Int64(heapClassInst.heap32[(r3 + 6)]);
        r6 = sp + (-176);
        r4 = r4 >> 2;
        r7 = r6 >> 2;
        heapClassInst.heap32[(fp + (-44))] = heapClassInst.heap32[(r4 + 1)];
        heapClassInst.heap32[(r7 + 1)] = heapClassInst.heap32[(r4 + 2)];
        heapClassInst.heap32[(r7 + 2)] = heapClassInst.heap32[(r4 + 3)];
        heapClassInst.heap32[(r7 + 3)] = heapClassInst.heap32[(r4 + 4)];
        heapClassInst.heap32[(r7 + 4)] = heapClassInst.heap32[(r4 + 5)];
        heapClassInst.heap32[(r7 + 5)] = heapClassInst.heap32[(r4 + 6)];
        heapClassInst.heap32[(r7 + 6)] = heapClassInst.heap32[(r4 + 7)];
        heapClassInst.heap32[(r7 + 7)] = heapClassInst.heap32[(r4 + 8)];
        heapClassInst.heap32[(r7 + 8)] = heapClassInst.heap32[(r4 + 9)];
        heapClassInst.heap32[(r7 + 9)] = heapClassInst.heap32[(r4 + 10)];
        heapClassInst.heap32[(r7 + 10)] = heapClassInst.heap32[(r4 + 11)];
        heapClassInst.heap32[(r7 + 11)] = heapClassInst.heap32[(r4 + 12)];
        heapClassInst.heap32[(r7 + 12)] = heapClassInst.heap32[(r4 + 13)];
        heapClassInst.heap32[(r7 + 13)] = heapClassInst.heap32[(r4 + 14)];
        heapClassInst.heap32[(r7 + 14)] = heapClassInst.heap32[(r4 + 15)];
        r8 = r1 >> 2;
        heapClassInst.heap32[(r7 + 15)] = heapClassInst.heap32[(r4 + 16)];
        f0 = Float64(heapClassInst.heapFloat[(r8 + 82)]);
        f1 = Float64(heapClassInst.heapFloat[(r8 + 132)]);
        f2 = Float64(heapClassInst.heapFloat[(r8 + 81)]);
        f3 = Float64(heapClassInst.heapFloat[(r8 + 131)]);
        f4 = Float64(heapClassInst.heapFloat[(r8 + 80)]);
        f5 = Float64(heapClassInst.heapFloat[(r8 + 130)]);
        r4 = sp + (-192);
        f4 = f4 + f5;
        r7 = r4 >> 2;
        f2 = f2 + f3;
        heapClassInst.heapFloat[(fp + (-48))] = Float32(f4);
        f0 = f0 + f1;
        heapClassInst.heapFloat[(r7 + 1)] = Float32(f2);
        heapClassInst.heapFloat[(r7 + 2)] = Float32(f0);
        r9 = r2 >> 2;
        heapClassInst.heap32[(r7 + 3)] = 0;
        f0 = Float64(heapClassInst.heapFloat[(r9 + 82)]);
        f1 = Float64(heapClassInst.heapFloat[(r9 + 132)]);
        f2 = Float64(heapClassInst.heapFloat[(r9 + 81)]);
        f3 = Float64(heapClassInst.heapFloat[(r9 + 131)]);
        f4 = Float64(heapClassInst.heapFloat[(r9 + 80)]);
        f5 = Float64(heapClassInst.heapFloat[(r9 + 130)]);
        r10 = sp + (-208);
        f4 = f4 + f5;
        f2 = f2 + f3;
        heapClassInst.heapFloat[(fp + (-52))] = Float32(f4);
        r11 = r10 >> 2;
        f0 = f0 + f1;
        heapClassInst.heapFloat[(r11 + 1)] = Float32(f2);
        heapClassInst.heapFloat[(r11 + 2)] = Float32(f0);
        r12 = sp + (-272);
        heapClassInst.heap32[(r11 + 3)] = 0;
        r13 = r12 >> 2;
        heapClassInst.heap32[(fp + (-68))] = 1065353216;
        heapClassInst.heap32[(r13 + 1)] = 0;
        heapClassInst.heap32[(r13 + 2)] = 0;
        heapClassInst.heap32[(r13 + 3)] = 0;
        heapClassInst.heap32[(r13 + 4)] = 0;
        heapClassInst.heap32[(r13 + 5)] = 1065353216;
        heapClassInst.heap32[(r13 + 6)] = 0;
        heapClassInst.heap32[(r13 + 7)] = 0;
        heapClassInst.heap32[(r13 + 8)] = 0;
        heapClassInst.heap32[(r13 + 9)] = 0;
        heapClassInst.heap32[(r13 + 10)] = 1065353216;
        heapClassInst.heap32[(r13 + 11)] = 0;
        heapClassInst.heap32[(r13 + 12)] = 0;
        heapClassInst.heap32[(r13 + 13)] = 0;
        heapClassInst.heap32[(r13 + 14)] = 0;
        heapClassInst.heap32[(r13 + 15)] = 0;
        heapClassInst.heap32[(g0)] = Int32(r5);
        heapClassInst.heap32[(g0 + 1)] = 0;
        heapClassInst.heap32[(g0 + 2)] = 0;
        heapClassInst.heap32[(g0 + 3)] = 0;
        heapClassInst.heap32[(g0 + 4)] = Int32(r4);
        f0 = Float64(heapClassInst.heapFloat[(fp + (-117))]);
        heapClassInst.heapFloat[(g0 + 5)] = Float32(f0);
        heapClassInst.heap32[(g0 + 6)] = Int32(r12);
        r4 = sp + (-336);
        _ZN15btTransformUtil18integrateTransformERK11btTransformRK9btVector3S5_fRS0_(i7);
        r12 = r4 >> 2;
        heapClassInst.heap32[(fp + (-84))] = 1065353216;
        heapClassInst.heap32[(r12 + 1)] = 0;
        heapClassInst.heap32[(r12 + 2)] = 0;
        heapClassInst.heap32[(r12 + 3)] = 0;
        heapClassInst.heap32[(r12 + 4)] = 0;
        heapClassInst.heap32[(r12 + 5)] = 1065353216;
        heapClassInst.heap32[(r12 + 6)] = 0;
        heapClassInst.heap32[(r12 + 7)] = 0;
        heapClassInst.heap32[(r12 + 8)] = 0;
        heapClassInst.heap32[(r12 + 9)] = 0;
        heapClassInst.heap32[(r12 + 10)] = 1065353216;
        heapClassInst.heap32[(r12 + 11)] = 0;
        heapClassInst.heap32[(r12 + 12)] = 0;
        heapClassInst.heap32[(r12 + 13)] = 0;
        heapClassInst.heap32[(r12 + 14)] = 0;
        heapClassInst.heap32[(r12 + 15)] = 0;
        heapClassInst.heap32[(g0)] = Int32(r6);
        heapClassInst.heap32[(g0 + 1)] = 0;
        heapClassInst.heap32[(g0 + 2)] = 0;
        heapClassInst.heap32[(g0 + 3)] = 0;
        heapClassInst.heap32[(g0 + 4)] = Int32(r10);
        heapClassInst.heapFloat[(g0 + 5)] = Float32(f0);
        heapClassInst.heap32[(g0 + 6)] = Int32(r4);
        _ZN15btTransformUtil18integrateTransformERK11btTransformRK9btVector3S5_fRS0_(i7);
        f1 = Float64(heapClassInst.heapFloat[(r3 + 136)]);
        f2 = Float64(heapClassInst.heapFloat[(r3 + 137)]);
        f3 = Float64(heapClassInst.heapFloat[(r3 + 138)]);
        f4 = f1 * f1;
        f5 = f2 * f2;
        f6 = Float64(heapClassInst.heapFloat[(r3 + 139)]);
        f4 = f4 + f5;
        f5 = f3 * f3;
        f4 = f4 + f5;
        f5 = f6 * f6;
        f7 = 2.0;
        f4 = f4 + f5;
        f4 = f7 / f4;
        f5 = f3 * f4;
        f7 = f2 * f4;
        f4 = f1 * f4;
        f3 = f3 * f5;
        f8 = f1 * f4;
        f9 = f2 * f7;
        f0 = 1.0;
        heapClassInst.heapFloat[(fp + (-118))] = Float32(f0);
        f10 = f9 + f3;
        f3 = f8 + f3;
        f11 = f1 * f7;
        f12 = f6 * f5;
        f10 = f0 - f10;
        f0 = Float64(heapClassInst.heapFloat[(r3 + 92)]);
        heapClassInst.heapFloat[(fp + (-131))] = Float32(f0);
        f13 = f11 - f12;
        f0 = Float64(heapClassInst.heapFloat[(r3 + 88)]);
        heapClassInst.heapFloat[(fp + (-120))] = Float32(f0);
        f11 = f11 + f12;
        f12 = Float64(heapClassInst.heapFloat[(r3 + 93)]);
        heapClassInst.heapFloat[(fp + (-132))] = Float32(f12);
        f0 = Float64(heapClassInst.heapFloat[(fp + (-118))]);
        f3 = f0 - f3;
        f0 = Float64(heapClassInst.heapFloat[(r3 + 89)]);
        heapClassInst.heapFloat[(fp + (-121))] = Float32(f0);
        f1 = f1 * f5;
        f7 = f6 * f7;
        f2 = f2 * f5;
        f4 = f6 * f4;
        f5 = f1 + f7;
        f6 = Float64(heapClassInst.heapFloat[(r3 + 96)]);
        heapClassInst.heapFloat[(fp + (-129))] = Float32(f6);
        f12 = f2 - f4;
        f14 = Float64(heapClassInst.heapFloat[(r3 + 97)]);
        heapClassInst.heapFloat[(fp + (-136))] = Float32(f14);
        f8 = f8 + f9;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-120))]);
        f9 = f10 * f0;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-121))]);
        f15 = f11 * f0;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-120))]);
        f16 = f13 * f0;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-121))]);
        f17 = f3 * f0;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-131))]);
        f18 = f10 * f0;
        f19 = Float64(heapClassInst.heapFloat[(fp + (-132))]);
        f20 = f11 * f19;
        f21 = f13 * f0;
        f22 = f3 * f19;
        f1 = f1 - f7;
        f7 = Float64(heapClassInst.heapFloat[(r3 + 94)]);
        heapClassInst.heapFloat[(fp + (-137))] = Float32(f7);
        f2 = f2 + f4;
        f0 = Float64(heapClassInst.heapFloat[(r3 + 90)]);
        heapClassInst.heapFloat[(fp + (-133))] = Float32(f0);
        f0 = Float64(heapClassInst.heapFloat[(fp + (-118))]);
        f4 = f0 - f8;
        f6 = Float64(heapClassInst.heapFloat[(r3 + 98)]);
        heapClassInst.heapFloat[(fp + (-130))] = Float32(f6);
        f7 = f9 + f15;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-133))]);
        f8 = f1 * f0;
        f9 = f16 + f17;
        f14 = f2 * f0;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-120))]);
        f15 = f5 * f0;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-121))]);
        f16 = f12 * f0;
        f17 = f18 + f20;
        f18 = Float64(heapClassInst.heapFloat[(fp + (-137))]);
        f19 = f1 * f18;
        f20 = f21 + f22;
        f21 = f2 * f18;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-131))]);
        f22 = f5 * f0;
        f23 = Float64(heapClassInst.heapFloat[(fp + (-132))]);
        f24 = f12 * f23;
        f6 = Float64(heapClassInst.heapFloat[(fp + (-129))]);
        f10 = f10 * f6;
        f25 = Float64(heapClassInst.heapFloat[(fp + (-136))]);
        f11 = f11 * f25;
        f13 = f13 * f6;
        f3 = f3 * f25;
        f0 = f7 + f8;
        heapClassInst.heapFloat[(fp + (-124))] = Float32(f0);
        f6 = Float64(heapClassInst.heapFloat[(r3 + 72)]);
        f7 = f17 + f19;
        heapClassInst.heapFloat[(fp + (-134))] = Float32(f7);
        f0 = f9 + f14;
        heapClassInst.heapFloat[(fp + (-125))] = Float32(f0);
        f7 = Float64(heapClassInst.heapFloat[(r3 + 73)]);
        f8 = f20 + f21;
        heapClassInst.heapFloat[(fp + (-139))] = Float32(f8);
        f9 = f15 + f16;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-133))]);
        f14 = f4 * f0;
        f15 = f22 + f24;
        f16 = f4 * f18;
        f10 = f10 + f11;
        f11 = Float64(heapClassInst.heapFloat[(fp + (-130))]);
        f1 = f1 * f11;
        f3 = f13 + f3;
        f2 = f2 * f11;
        f13 = Float64(heapClassInst.heapFloat[(fp + (-129))]);
        f5 = f5 * f13;
        f12 = f12 * f25;
        f17 = Float64(heapClassInst.heapFloat[(r3 + 76)]);
        f1 = f10 + f1;
        heapClassInst.heapFloat[(fp + (-138))] = Float32(f1);
        f10 = Float64(heapClassInst.heapFloat[(r3 + 77)]);
        f2 = f3 + f2;
        heapClassInst.heapFloat[(fp + (-123))] = Float32(f2);
        f0 = Float64(heapClassInst.heapFloat[(fp + (-124))]);
        f3 = f6 * f0;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-125))]);
        f19 = f7 * f0;
        f0 = f9 + f14;
        heapClassInst.heapFloat[(fp + (-126))] = Float32(f0);
        f1 = Float64(heapClassInst.heapFloat[(r3 + 74)]);
        f0 = f15 + f16;
        heapClassInst.heapFloat[(fp + (-127))] = Float32(f0);
        f2 = Float64(heapClassInst.heapFloat[(fp + (-134))]);
        f8 = f6 * f2;
        f9 = Float64(heapClassInst.heapFloat[(fp + (-139))]);
        f11 = f7 * f9;
        f5 = f5 + f12;
        f12 = Float64(heapClassInst.heapFloat[(fp + (-130))]);
        f4 = f4 * f12;
        f13 = Float64(heapClassInst.heapFloat[(r3 + 80)]);
        f14 = Float64(heapClassInst.heapFloat[(r3 + 81)]);
        f15 = Float64(heapClassInst.heapFloat[(r3 + 78)]);
        f4 = f5 + f4;
        heapClassInst.heapFloat[(fp + (-122))] = Float32(f4);
        f0 = Float64(heapClassInst.heapFloat[(fp + (-124))]);
        f5 = f17 * f0;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-125))]);
        f16 = f10 * f0;
        f18 = f17 * f2;
        f20 = f10 * f9;
        f3 = f3 + f19;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-126))]);
        f19 = f1 * f0;
        f8 = f8 + f11;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-127))]);
        f11 = f1 * f0;
        f21 = Float64(heapClassInst.heapFloat[(fp + (-138))]);
        f22 = f6 * f21;
        f2 = Float64(heapClassInst.heapFloat[(fp + (-123))]);
        f23 = f7 * f2;
        f24 = Float64(heapClassInst.heapFloat[(r3 + 82)]);
        f0 = Float64(heapClassInst.heapFloat[(fp + (-124))]);
        f25 = f13 * f0;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-125))]);
        f26 = f14 * f0;
        f2 = Float64(heapClassInst.heapFloat[(fp + (-134))]);
        f27 = f13 * f2;
        f28 = f14 * f9;
        f5 = f5 + f16;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-126))]);
        f16 = f15 * f0;
        f18 = f18 + f20;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-127))]);
        f20 = f15 * f0;
        f29 = f17 * f21;
        f2 = Float64(heapClassInst.heapFloat[(fp + (-123))]);
        f30 = f10 * f2;
        f3 = f3 + f19;
        f19 = Float64(heapClassInst.heapFloat[(fp + (-84))]);
        heapClassInst.heapFloat[(fp + (-140))] = Float32(f19);
        f0 = f8 + f11;
        heapClassInst.heapFloat[(fp + (-135))] = Float32(f0);
        f2 = Float64(heapClassInst.heapFloat[(r12 + 1)]);
        heapClassInst.heapFloat[(fp + (-128))] = Float32(f2);
        f4 = f22 + f23;
        f8 = Float64(heapClassInst.heapFloat[(fp + (-122))]);
        f9 = f1 * f8;
        f5 = f5 + f16;
        f0 = f18 + f20;
        heapClassInst.heapFloat[(fp + (-119))] = Float32(f0);
        f2 = f25 + f26;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-126))]);
        f8 = f24 * f0;
        f11 = f27 + f28;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-127))]);
        f12 = f24 * f0;
        f16 = f13 * f21;
        f18 = Float64(heapClassInst.heapFloat[(fp + (-123))]);
        f19 = f14 * f18;
        f20 = f29 + f30;
        f22 = Float64(heapClassInst.heapFloat[(fp + (-122))]);
        f23 = f15 * f22;
        f25 = Float64(heapClassInst.heapFloat[(fp + (-140))]);
        f26 = f3 * f25;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-135))]);
        f27 = Float64(heapClassInst.heapFloat[(fp + (-128))]);
        f28 = f0 * f27;
        f4 = f4 + f9;
        f9 = Float64(heapClassInst.heapFloat[(r12 + 2)]);
        f29 = Float64(heapClassInst.heapFloat[(r3 + 86)]);
        f30 = Float64(heapClassInst.heapFloat[(r3 + 85)]);
        f0 = Float64(heapClassInst.heapFloat[(r12 + 8)]);
        heapClassInst.heapFloat[(fp + (-141))] = Float32(f0);
        f2 = f2 + f8;
        f8 = Float64(heapClassInst.heapFloat[(r12 + 4)]);
        f0 = Float64(heapClassInst.heapFloat[(r12 + 9)]);
        f11 = f11 + f12;
        f12 = Float64(heapClassInst.heapFloat[(r12 + 5)]);
        f20 = f20 + f23;
        f18 = Float64(heapClassInst.heapFloat[(r12 + 10)]);
        heapClassInst.heapFloat[(fp + (-148))] = Float32(f18);
        f21 = Float64(heapClassInst.heapFloat[(r12 + 6)]);
        f22 = Float64(heapClassInst.heapFloat[(r3 + 84)]);
        f16 = f16 + f19;
        f19 = Float64(heapClassInst.heapFloat[(fp + (-122))]);
        f23 = f24 * f19;
        f27 = f5 * f25;
        f19 = Float64(heapClassInst.heapFloat[(fp + (-119))]);
        f18 = Float64(heapClassInst.heapFloat[(fp + (-128))]);
        f18 = f19 * f18;
        f26 = f26 + f28;
        f28 = f4 * f9;
        f19 = Float64(heapClassInst.heapFloat[(r3 + 102)]);
        heapClassInst.heapFloat[(fp + (-142))] = Float32(f19);
        f19 = Float64(heapClassInst.heapFloat[(r3 + 101)]);
        heapClassInst.heapFloat[(fp + (-143))] = Float32(f19);
        f19 = Float64(heapClassInst.heapFloat[(r3 + 100)]);
        heapClassInst.heapFloat[(fp + (-145))] = Float32(f19);
        f19 = Float64(heapClassInst.heapFloat[(r12 + 14)]);
        heapClassInst.heapFloat[(fp + (-144))] = Float32(f19);
        f19 = Float64(heapClassInst.heapFloat[(r12 + 13)]);
        heapClassInst.heapFloat[(fp + (-146))] = Float32(f19);
        f19 = Float64(heapClassInst.heapFloat[(r12 + 12)]);
        heapClassInst.heapFloat[(fp + (-147))] = Float32(f19);
        f16 = f16 + f23;
        r4 = sp + (-400);
        f23 = f2 * f25;
        f19 = Float64(heapClassInst.heapFloat[(fp + (-128))]);
        f19 = f11 * f19;
        f18 = f27 + f18;
        f27 = f20 * f9;
        f26 = f26 + f28;
        f22 = -f22;
        r10 = r4 >> 2;
        f19 = f23 + f19;
        f23 = f16 * f9;
        f18 = f18 + f27;
        heapClassInst.heapFloat[(fp + (-100))] = Float32(f26);
        f6 = f6 * f22;
        f17 = f17 * f30;
        f7 = f7 * f22;
        f10 = f10 * f30;
        f26 = f3 * f8;
        f27 = Float64(heapClassInst.heapFloat[(fp + (-135))]);
        f28 = f27 * f12;
        f19 = f19 + f23;
        heapClassInst.heapFloat[(r10 + 1)] = Float32(f18);
        f18 = 0.0;
        heapClassInst.heapFloat[(r10 + 2)] = Float32(f19);
        f6 = f6 - f17;
        f13 = f13 * f29;
        f7 = f7 - f10;
        f10 = f14 * f29;
        f1 = f1 * f22;
        f14 = f15 * f30;
        f15 = f5 * f8;
        f19 = Float64(heapClassInst.heapFloat[(fp + (-119))]);
        f17 = f19 * f12;
        f22 = f26 + f28;
        f23 = f4 * f21;
        f6 = f6 - f13;
        f7 = f7 - f10;
        f10 = Float64(heapClassInst.heapFloat[(fp + (-120))]);
        f10 = f10 * f18;
        f13 = Float64(heapClassInst.heapFloat[(fp + (-121))]);
        f13 = f13 * f18;
        f26 = Float64(heapClassInst.heapFloat[(fp + (-131))]);
        f26 = f26 * f18;
        f28 = Float64(heapClassInst.heapFloat[(fp + (-132))]);
        f28 = f28 * f18;
        f1 = f1 - f14;
        f14 = f24 * f29;
        f24 = f2 * f8;
        f29 = f11 * f12;
        f15 = f15 + f17;
        f17 = f20 * f21;
        f22 = f22 + f23;
        heapClassInst.heap32[(r10 + 3)] = 0;
        f1 = f1 - f14;
        f14 = Float64(heapClassInst.heapFloat[(fp + (-124))]);
        f14 = f14 * f6;
        f23 = Float64(heapClassInst.heapFloat[(fp + (-125))]);
        f23 = f23 * f7;
        f10 = f10 + f13;
        f13 = Float64(heapClassInst.heapFloat[(fp + (-133))]);
        f13 = f13 * f18;
        f30 = Float64(heapClassInst.heapFloat[(fp + (-134))]);
        f30 = f30 * f6;
        f19 = Float64(heapClassInst.heapFloat[(fp + (-139))]);
        f19 = f19 * f7;
        f26 = f26 + f28;
        f28 = Float64(heapClassInst.heapFloat[(fp + (-137))]);
        f28 = f28 * f18;
        f25 = Float64(heapClassInst.heapFloat[(fp + (-129))]);
        f25 = f25 * f18;
        f27 = Float64(heapClassInst.heapFloat[(fp + (-136))]);
        f27 = f27 * f18;
        f24 = f24 + f29;
        f29 = f16 * f21;
        f15 = f15 + f17;
        heapClassInst.heapFloat[(r10 + 4)] = Float32(f22);
        f10 = f10 + f13;
        f13 = f26 + f28;
        f14 = f14 + f23;
        f17 = Float64(heapClassInst.heapFloat[(fp + (-126))]);
        f17 = f17 * f1;
        f19 = f30 + f19;
        f22 = Float64(heapClassInst.heapFloat[(fp + (-127))]);
        f22 = f22 * f1;
        f23 = Float64(heapClassInst.heapFloat[(fp + (-138))]);
        f6 = f23 * f6;
        f23 = Float64(heapClassInst.heapFloat[(fp + (-123))]);
        f7 = f23 * f7;
        f23 = f25 + f27;
        f25 = Float64(heapClassInst.heapFloat[(fp + (-130))]);
        f25 = f25 * f18;
        f26 = Float64(heapClassInst.heapFloat[(fp + (-141))]);
        f27 = f3 * f26;
        f28 = Float64(heapClassInst.heapFloat[(fp + (-135))]);
        f30 = f28 * f0;
        f24 = f24 + f29;
        heapClassInst.heapFloat[(r10 + 5)] = Float32(f15);
        f15 = f23 + f25;
        heapClassInst.heapFloat[(r10 + 6)] = Float32(f24);
        f14 = f14 + f17;
        f17 = Float64(heapClassInst.heapFloat[(fp + (-145))]);
        f10 = f10 + f17;
        f17 = f19 + f22;
        f19 = Float64(heapClassInst.heapFloat[(fp + (-143))]);
        f13 = f13 + f19;
        f6 = f6 + f7;
        f19 = Float64(heapClassInst.heapFloat[(fp + (-122))]);
        f1 = f19 * f1;
        f7 = f5 * f26;
        f19 = Float64(heapClassInst.heapFloat[(fp + (-119))]);
        f22 = f19 * f0;
        f23 = f27 + f30;
        f24 = Float64(heapClassInst.heapFloat[(fp + (-148))]);
        f25 = f4 * f24;
        f13 = f17 + f13;
        f10 = f14 + f10;
        f1 = f6 + f1;
        f19 = Float64(heapClassInst.heapFloat[(fp + (-142))]);
        f6 = f15 + f19;
        f14 = f2 * f26;
        f15 = f11 * f0;
        f7 = f7 + f22;
        f17 = f20 * f24;
        f19 = f23 + f25;
        heapClassInst.heap32[(r10 + 7)] = 0;
        f1 = f1 + f6;
        f25 = Float64(heapClassInst.heapFloat[(fp + (-140))]);
        f6 = f25 * f10;
        f22 = Float64(heapClassInst.heapFloat[(fp + (-128))]);
        f22 = f22 * f13;
        f14 = f14 + f15;
        f15 = f16 * f24;
        f7 = f7 + f17;
        heapClassInst.heapFloat[(r10 + 8)] = Float32(f19);
        f8 = f8 * f10;
        f12 = f12 * f13;
        f6 = f6 + f22;
        f9 = f9 * f1;
        f14 = f14 + f15;
        heapClassInst.heapFloat[(r10 + 9)] = Float32(f7);
        f6 = f6 + f9;
        heapClassInst.heapFloat[(r10 + 10)] = Float32(f14);
        f7 = f26 * f10;
        f0 = f0 * f13;
        f8 = f8 + f12;
        f9 = f21 * f1;
        f8 = f8 + f9;
        f0 = f7 + f0;
        f7 = f24 * f1;
        f19 = Float64(heapClassInst.heapFloat[(fp + (-147))]);
        f6 = f6 + f19;
        heapClassInst.heap32[(r10 + 11)] = 0;
        f0 = f0 + f7;
        f19 = Float64(heapClassInst.heapFloat[(fp + (-146))]);
        f7 = f8 + f19;
        heapClassInst.heapFloat[(r10 + 12)] = Float32(f6);
        f19 = Float64(heapClassInst.heapFloat[(fp + (-144))]);
        f0 = f0 + f19;
        heapClassInst.heapFloat[(r10 + 13)] = Float32(f7);
        heapClassInst.heapFloat[(r10 + 14)] = Float32(f0);
        heapClassInst.heap32[(r10 + 15)] = 0;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-68))]);
        f6 = Float64(heapClassInst.heapFloat[(r13 + 1)]);
        f7 = Float64(heapClassInst.heapFloat[(r13 + 2)]);
        f8 = f3 * f0;
        f9 = f5 * f6;
        f12 = Float64(heapClassInst.heapFloat[(r13 + 8)]);
        f14 = Float64(heapClassInst.heapFloat[(r13 + 9)]);
        f15 = Float64(heapClassInst.heapFloat[(r13 + 10)]);
        f17 = Float64(heapClassInst.heapFloat[(r13 + 4)]);
        f19 = Float64(heapClassInst.heapFloat[(r13 + 5)]);
        f21 = Float64(heapClassInst.heapFloat[(r13 + 6)]);
        f22 = f28 * f0;
        f23 = Float64(heapClassInst.heapFloat[(fp + (-119))]);
        f24 = f23 * f6;
        f8 = f8 + f9;
        f9 = f2 * f7;
        f25 = Float64(heapClassInst.heapFloat[(r13 + 14)]);
        f26 = Float64(heapClassInst.heapFloat[(r13 + 13)]);
        f27 = Float64(heapClassInst.heapFloat[(r13 + 12)]);
        r10 = sp + (-464);
        f29 = f4 * f0;
        f30 = f20 * f6;
        f22 = f22 + f24;
        f24 = f11 * f7;
        f8 = f8 + f9;
        r12 = r10 >> 2;
        f9 = f29 + f30;
        f29 = f16 * f7;
        f22 = f22 + f24;
        heapClassInst.heapFloat[(fp + (-116))] = Float32(f8);
        f8 = f3 * f17;
        f24 = f5 * f19;
        f9 = f9 + f29;
        heapClassInst.heapFloat[(r12 + 1)] = Float32(f22);
        heapClassInst.heapFloat[(r12 + 2)] = Float32(f9);
        f9 = f28 * f17;
        f22 = f23 * f19;
        f8 = f8 + f24;
        f24 = f2 * f21;
        f29 = f4 * f17;
        f30 = f20 * f19;
        f9 = f9 + f22;
        f22 = f11 * f21;
        f8 = f8 + f24;
        heapClassInst.heap32[(r12 + 3)] = 0;
        f10 = -f10;
        f24 = f29 + f30;
        f29 = f16 * f21;
        f9 = f9 + f22;
        heapClassInst.heapFloat[(r12 + 4)] = Float32(f8);
        f8 = f3 * f10;
        f22 = f28 * f13;
        f30 = f5 * f10;
        f23 = f23 * f13;
        f3 = f3 * f12;
        f5 = f5 * f14;
        f24 = f24 + f29;
        heapClassInst.heapFloat[(r12 + 5)] = Float32(f9);
        heapClassInst.heapFloat[(r12 + 6)] = Float32(f24);
        f8 = f8 - f22;
        f9 = f4 * f1;
        f22 = f30 - f23;
        f23 = f20 * f1;
        f10 = f2 * f10;
        f13 = f11 * f13;
        f24 = f28 * f12;
        f28 = Float64(heapClassInst.heapFloat[(fp + (-119))]);
        f28 = f28 * f14;
        f3 = f3 + f5;
        f2 = f2 * f15;
        f5 = f8 - f9;
        f8 = f22 - f23;
        f9 = f10 - f13;
        f1 = f16 * f1;
        f4 = f4 * f12;
        f10 = f20 * f14;
        f13 = f24 + f28;
        f11 = f11 * f15;
        f2 = f3 + f2;
        heapClassInst.heap32[(r12 + 7)] = 0;
        f1 = f9 - f1;
        f0 = f0 * f5;
        f3 = f6 * f8;
        f4 = f4 + f10;
        f6 = f16 * f15;
        f9 = f13 + f11;
        heapClassInst.heapFloat[(r12 + 8)] = Float32(f2);
        f2 = f17 * f5;
        f10 = f19 * f8;
        f0 = f0 + f3;
        f3 = f7 * f1;
        f4 = f4 + f6;
        heapClassInst.heapFloat[(r12 + 9)] = Float32(f9);
        f0 = f0 + f3;
        heapClassInst.heapFloat[(r12 + 10)] = Float32(f4);
        f3 = f12 * f5;
        f4 = f14 * f8;
        f2 = f2 + f10;
        f5 = f21 * f1;
        f2 = f2 + f5;
        f3 = f3 + f4;
        f1 = f15 * f1;
        f0 = f0 + f27;
        heapClassInst.heap32[(r12 + 11)] = 0;
        f1 = f3 + f1;
        f2 = f2 + f26;
        heapClassInst.heapFloat[(r12 + 12)] = Float32(f0);
        f0 = f1 + f25;
        heapClassInst.heapFloat[(r12 + 13)] = Float32(f2);
        heapClassInst.heapFloat[(r12 + 14)] = Float32(f0);
        heapClassInst.heap32[(r12 + 15)] = 0;
        r12 = sp + (-16);
        r13 = sp + (-20);
        heapClassInst.heap32[(g0)] = Int32(r5);
        heapClassInst.heap32[(g0 + 1)] = Int32(r4);
        heapClassInst.heap32[(g0 + 2)] = Int32(r12);
        heapClassInst.heap32[(g0 + 3)] = Int32(r13);
        _ZN15btTransformUtil22calculateDiffAxisAngleERK11btTransformS2_R9btVector3Rf(i7);
        r4 = r12 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
        f1 = Float64(heapClassInst.heapFloat[(fp + (-5))]);
        f2 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
        f3 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
        r4 = sp + (-40);
        r5 = sp + (-44);
        heapClassInst.heap32[(g0)] = Int32(r6);
        heapClassInst.heap32[(g0 + 1)] = Int32(r10);
        heapClassInst.heap32[(g0 + 2)] = Int32(r4);
        heapClassInst.heap32[(g0 + 3)] = Int32(r5);
        _ZN15btTransformUtil22calculateDiffAxisAngleERK11btTransformS2_R9btVector3Rf(i7);
        f2 = f2 * f1;
        f5 = Float64(heapClassInst.heapFloat[(fp + (-118))]);
        f4 = Float64(heapClassInst.heapFloat[(fp + (-117))]);
        f4 = f5 / f4;
        f3 = f3 * f1;
        r4 = r4 >> 2;
        f0 = f0 * f1;
        f1 = f2 * f4;
        f2 = Float64(heapClassInst.heapFloat[(r7 + 1)]);
        f3 = f3 * f4;
        f5 = Float64(heapClassInst.heapFloat[(fp + (-48))]);
        f1 = f1 - f2;
        f2 = f3 - f5;
        f0 = f0 * f4;
        f3 = Float64(heapClassInst.heapFloat[(r7 + 2)]);
        f5 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
        f6 = Float64(heapClassInst.heapFloat[(fp + (-11))]);
        f7 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
        f8 = Float64(heapClassInst.heapFloat[(fp + (-10))]);
        f0 = f0 - f3;
        f3 = f5 * f6;
        f5 = f7 * f6;
        f6 = f8 * f6;
        f7 = f2 * f2;
        f8 = f1 * f1;
        f7 = f7 + f8;
        f8 = f0 * f0;
        f3 = f3 * f4;
        f9 = Float64(heapClassInst.heapFloat[(r11 + 2)]);
        f5 = f5 * f4;
        f10 = Float64(heapClassInst.heapFloat[(r11 + 1)]);
        f4 = f6 * f4;
        f6 = Float64(heapClassInst.heapFloat[(fp + (-52))]);
        f7 = f7 + f8;
        f3 = f3 - f9;
        f5 = f5 - f10;
        f4 = f4 - f6;
        f6 = 1.1920928955078125e-007;
        if (f7 > f6) 
        {
          heapClassInst.heapFloat[(g0)] = Float32(f7);
          sqrtf(i7);
          r4 = Int64(heapClassInst.heap32[(r3 + 5)]);
          r4 = r4 >> 2;
          f7 = Float64(heapClassInst.heapFloat[(fp + (-118))]);
          f18 = f7 / commonVariable.f_g0;
          f7 = f2 * f18;
          f8 = Float64(heapClassInst.heapFloat[(r4 + 64)]);
          f9 = Float64(heapClassInst.heapFloat[(r4 + 65)]);
          f10 = f1 * f18;
          f11 = Float64(heapClassInst.heapFloat[(r4 + 68)]);
          f12 = Float64(heapClassInst.heapFloat[(r4 + 69)]);
          f13 = f0 * f18;
          f18 = Float64(heapClassInst.heapFloat[(r4 + 72)]);
          f14 = Float64(heapClassInst.heapFloat[(r4 + 73)]);
          f15 = Float64(heapClassInst.heapFloat[(r4 + 66)]);
          f16 = Float64(heapClassInst.heapFloat[(r4 + 70)]);
          f8 = f8 * f7;
          f11 = f11 * f10;
          f9 = f9 * f7;
          f12 = f12 * f10;
          f17 = Float64(heapClassInst.heapFloat[(r4 + 74)]);
          f8 = f8 + f11;
          f18 = f18 * f13;
          f9 = f9 + f12;
          f11 = f14 * f13;
          f12 = f15 * f7;
          f14 = f16 * f10;
          f18 = f8 + f18;
          f8 = f9 + f11;
          f9 = f12 + f14;
          f11 = f17 * f13;
          f9 = f9 + f11;
          f18 = f7 * f18;
          f8 = f10 * f8;
          f18 = f18 + f8;
          f8 = f13 * f9;
          f18 = f18 + f8;
        }
        f8 = f4 * f4;
        f9 = f5 * f5;
        f8 = f8 + f9;
        f9 = f3 * f3;
        f8 = f8 + f9;
        if (f8 > f6) 
        {
          heapClassInst.heapFloat[(g0)] = Float32(f8);
          sqrtf(i7);
          r4 = Int64(heapClassInst.heap32[(r3 + 6)]);
          r4 = r4 >> 2;
          f9 = Float64(heapClassInst.heapFloat[(fp + (-118))]);
          f8 = f9 / commonVariable.f_g0;
          f9 = f4 * f8;
          f11 = Float64(heapClassInst.heapFloat[(r4 + 64)]);
          f12 = Float64(heapClassInst.heapFloat[(r4 + 65)]);
          f14 = f5 * f8;
          f15 = Float64(heapClassInst.heapFloat[(r4 + 68)]);
          f16 = Float64(heapClassInst.heapFloat[(r4 + 69)]);
          f17 = f3 * f8;
          f8 = Float64(heapClassInst.heapFloat[(r4 + 72)]);
          f19 = Float64(heapClassInst.heapFloat[(r4 + 73)]);
          f20 = Float64(heapClassInst.heapFloat[(r4 + 66)]);
          f21 = Float64(heapClassInst.heapFloat[(r4 + 70)]);
          f11 = f11 * f9;
          f15 = f15 * f14;
          f12 = f12 * f9;
          f16 = f16 * f14;
          f22 = Float64(heapClassInst.heapFloat[(r4 + 74)]);
          f11 = f11 + f15;
          f8 = f8 * f17;
          f12 = f12 + f16;
          f15 = f19 * f17;
          f16 = f20 * f9;
          f19 = f21 * f14;
          f8 = f11 + f8;
          f11 = f12 + f15;
          f12 = f16 + f19;
          f15 = f22 * f17;
          f12 = f12 + f15;
          f8 = f9 * f8;
          f11 = f14 * f11;
          f8 = f8 + f11;
          f11 = f17 * f12;
          f8 = f8 + f11;
        }
        else {
          f8 = 0.0;
        }
        f10 = f10 * f18;
        f11 = f14 * f8;
        f7 = f7 * f18;
        f9 = f9 * f8;
        f10 = f10 + f11;
        f7 = f7 + f9;
        f9 = f13 * f18;
        f8 = f17 * f8;
        f8 = f9 + f8;
        f9 = f7 * f7;
        f11 = f10 * f10;
        f9 = f9 + f11;
        f11 = f8 * f8;
        f9 = f9 + f11;
        if (!(f9 <= f6)) 
        {
          heapClassInst.heapFloat[(g0)] = Float32(f9);
          sqrtf(i7);
          r4 = Int64(heapClassInst.heap32[(r3 + 5)]);
          r5 = Int64(heapClassInst.heap32[(r3 + 6)]);
          r4 = r4 >> 2;
          r5 = r5 >> 2;
          f9 = Float64(heapClassInst.heapFloat[(fp + (-118))]);
          f6 = f9 / commonVariable.f_g0;
          f11 = Float64(heapClassInst.heapFloat[(r4 + 64)]);
          f7 = f7 * f6;
          f12 = Float64(heapClassInst.heapFloat[(r4 + 65)]);
          f13 = Float64(heapClassInst.heapFloat[(r5 + 64)]);
          f14 = Float64(heapClassInst.heapFloat[(r5 + 65)]);
          f15 = Float64(heapClassInst.heapFloat[(r4 + 68)]);
          f10 = f10 * f6;
          f16 = Float64(heapClassInst.heapFloat[(r4 + 69)]);
          f17 = Float64(heapClassInst.heapFloat[(r5 + 68)]);
          f18 = Float64(heapClassInst.heapFloat[(r5 + 69)]);
          f19 = Float64(heapClassInst.heapFloat[(r4 + 66)]);
          f20 = Float64(heapClassInst.heapFloat[(r4 + 70)]);
          f21 = Float64(heapClassInst.heapFloat[(r5 + 66)]);
          f22 = Float64(heapClassInst.heapFloat[(r5 + 70)]);
          f11 = f11 * f7;
          f15 = f15 * f10;
          f23 = Float64(heapClassInst.heapFloat[(r4 + 72)]);
          f6 = f8 * f6;
          f8 = Float64(heapClassInst.heapFloat[(r4 + 73)]);
          f24 = Float64(heapClassInst.heapFloat[(r5 + 72)]);
          f25 = Float64(heapClassInst.heapFloat[(r5 + 73)]);
          f12 = f12 * f7;
          f16 = f16 * f10;
          f13 = f13 * f7;
          f17 = f17 * f10;
          f14 = f14 * f7;
          f18 = f18 * f10;
          f26 = Float64(heapClassInst.heapFloat[(r4 + 74)]);
          f27 = Float64(heapClassInst.heapFloat[(r5 + 74)]);
          f11 = f11 + f15;
          f15 = f23 * f6;
          f12 = f12 + f16;
          f8 = f8 * f6;
          f16 = f19 * f7;
          f19 = f20 * f10;
          f13 = f13 + f17;
          f17 = f24 * f6;
          f14 = f14 + f18;
          f18 = f25 * f6;
          f20 = f21 * f7;
          f21 = f22 * f10;
          f11 = f11 + f15;
          f8 = f12 + f8;
          f12 = f13 + f17;
          f13 = f14 + f18;
          f14 = f16 + f19;
          f15 = f26 * f6;
          f16 = f20 + f21;
          f17 = f27 * f6;
          f14 = f14 + f15;
          f15 = f16 + f17;
          f11 = f7 * f11;
          f8 = f10 * f8;
          f7 = f7 * f12;
          f10 = f10 * f13;
          f8 = f11 + f8;
          f11 = f6 * f14;
          f7 = f7 + f10;
          f6 = f6 * f15;
          f8 = f8 + f11;
          f6 = f7 + f6;
          f7 = f8 + f6;
          f7 = f7 * f7;
          f0 = f0 * f8;
          f3 = f3 * f6;
          f1 = f1 * f8;
          f5 = f5 * f6;
          f2 = f2 * f8;
          f4 = f4 * f6;
          f0 = f0 - f3;
          f3 = f9 / f7;
          f1 = f1 - f5;
          f2 = f2 - f4;
          f4 = Float64(heapClassInst.heapFloat[(r3 + 140)]);
          f0 = f0 * f3;
          f1 = f1 * f3;
          f2 = f2 * f3;
          f3 = 0.0;
          if (f4 >= f3) 
          {
            r4 = Int64(heapClassInst.heapU8[r0 + 541]);
            if (r4 != 0) 
            {
              f4 = f4 / f8;
            }
            f5 = Float64(heapClassInst.heapFloat[(r3 + 141)]);
            f6 = Float64(heapClassInst.heapFloat[(r3 + 142)]);
            f5 = f5 + f2;
            f6 = f6 + f1;
            f7 = Float64(heapClassInst.heapFloat[(r3 + 143)]);
            f7 = f7 + f0;
            f8 = f5 * f5;
            f9 = f6 * f6;
            f8 = f8 + f9;
            f9 = f7 * f7;
            f8 = f8 + f9;
            heapClassInst.heapFloat[(g0)] = Float32(f8);
            sqrtf(i7);
            f9 = commonVariable.f_g0;
            if (f9 > f4) 
            {
              heapClassInst.heapFloat[(g0)] = Float32(f8);
              sqrtf(i7);
              f1 = Float64(heapClassInst.heapFloat[(fp + (-118))]);
              f0 = f1 / commonVariable.f_g0;
              f1 = f7 * f0;
              f2 = f6 * f0;
              f0 = f5 * f0;
              f7 = Float64(heapClassInst.heapFloat[(r3 + 143)]);
              f1 = f1 * f4;
              f6 = Float64(heapClassInst.heapFloat[(r3 + 142)]);
              f2 = f2 * f4;
              f5 = Float64(heapClassInst.heapFloat[(r3 + 141)]);
              f4 = f0 * f4;
              f0 = f1 - f7;
              f1 = f2 - f6;
              f2 = f4 - f5;
            }
            else {
              f5 = Float64(heapClassInst.heapFloat[(r3 + 141)]);
              f6 = Float64(heapClassInst.heapFloat[(r3 + 142)]);
              f7 = Float64(heapClassInst.heapFloat[(r3 + 143)]);
            }
            f4 = f5 + f2;
            f5 = f6 + f1;
            heapClassInst.heapFloat[(r3 + 141)] = Float32(f4);
            f4 = f7 + f0;
            heapClassInst.heapFloat[(r3 + 142)] = Float32(f5);
            heapClassInst.heapFloat[(r3 + 143)] = Float32(f4);
          }
          f4 = f2 * f2;
          f5 = f1 * f1;
          f4 = f4 + f5;
          f5 = f0 * f0;
          f4 = f4 + f5;
          heapClassInst.heapFloat[(g0)] = Float32(f4);
          sqrtf(i7);
          f4 = commonVariable.f_g0;
          f5 = Float64(heapClassInst.heapFloat[(fp + (-118))]);
          f5 = f5 / f4;
          f0 = f0 * f5;
          f1 = f1 * f5;
          f2 = f2 * f5;
          f5 = Float64(heapClassInst.heapFloat[(r8 + 84)]);
          if (!(f5 == f3)) 
          {
            r4 = Int64(heapClassInst.heap32[(r3 + 5)]);
            r4 = r4 >> 2;
            f5 = f4 * f3;
            f6 = Float64(heapClassInst.heapFloat[(r8 + 126)]);
            f7 = Float64(heapClassInst.heapFloat[(r4 + 65)]);
            f8 = Float64(heapClassInst.heapFloat[(r4 + 64)]);
            f9 = Float64(heapClassInst.heapFloat[(r4 + 69)]);
            f10 = Float64(heapClassInst.heapFloat[(r4 + 68)]);
            f11 = Float64(heapClassInst.heapFloat[(r4 + 73)]);
            f12 = Float64(heapClassInst.heapFloat[(r4 + 72)]);
            f13 = Float64(heapClassInst.heapFloat[(r4 + 66)]);
            f14 = Float64(heapClassInst.heapFloat[(r4 + 70)]);
            f15 = Float64(heapClassInst.heapFloat[(r4 + 74)]);
            f6 = f6 + f5;
            heapClassInst.heapFloat[(r8 + 126)] = Float32(f6);
            f6 = Float64(heapClassInst.heapFloat[(r8 + 127)]);
            f6 = f6 + f5;
            heapClassInst.heapFloat[(r8 + 127)] = Float32(f6);
            f6 = Float64(heapClassInst.heapFloat[(r8 + 128)]);
            f5 = f6 + f5;
            heapClassInst.heapFloat[(r8 + 128)] = Float32(f5);
            f5 = f8 * f2;
            f6 = f7 * f1;
            f7 = Float64(heapClassInst.heapFloat[(r8 + 134)]);
            f5 = f5 + f6;
            f6 = f13 * f0;
            f5 = f5 + f6;
            f6 = f7 * f4;
            f7 = Float64(heapClassInst.heapFloat[(r8 + 136)]);
            f8 = Float64(heapClassInst.heapFloat[(r8 + 135)]);
            f13 = Float64(heapClassInst.heapFloat[(r8 + 130)]);
            f5 = f5 * f6;
            f6 = f10 * f2;
            f9 = f9 * f1;
            f6 = f6 + f9;
            f9 = f14 * f0;
            f5 = f13 + f5;
            heapClassInst.heapFloat[(r8 + 130)] = Float32(f5);
            f5 = f6 + f9;
            f6 = f8 * f4;
            f8 = f12 * f2;
            f9 = f11 * f1;
            f5 = f5 * f6;
            f6 = Float64(heapClassInst.heapFloat[(r8 + 131)]);
            f5 = f6 + f5;
            f6 = f8 + f9;
            f8 = f15 * f0;
            heapClassInst.heapFloat[(r8 + 131)] = Float32(f5);
            f5 = f6 + f8;
            f6 = f7 * f4;
            f5 = f5 * f6;
            f6 = Float64(heapClassInst.heapFloat[(r8 + 132)]);
            f5 = f6 + f5;
            heapClassInst.heapFloat[(r8 + 132)] = Float32(f5);
          }
          f5 = Float64(heapClassInst.heapFloat[(r9 + 84)]);
          if (!(f5 == f3)) 
          {
            f3 = -f4;
            r4 = Int64(heapClassInst.heap32[(r3 + 6)]);
            r4 = r4 >> 2;
            f5 = ( -0.0);
            f4 = f4 * f5;
            f5 = Float64(heapClassInst.heapFloat[(r9 + 126)]);
            f6 = Float64(heapClassInst.heapFloat[(r4 + 65)]);
            f7 = Float64(heapClassInst.heapFloat[(r4 + 64)]);
            f8 = Float64(heapClassInst.heapFloat[(r4 + 69)]);
            f9 = Float64(heapClassInst.heapFloat[(r4 + 68)]);
            f10 = Float64(heapClassInst.heapFloat[(r4 + 73)]);
            f11 = Float64(heapClassInst.heapFloat[(r4 + 72)]);
            f12 = Float64(heapClassInst.heapFloat[(r4 + 66)]);
            f13 = Float64(heapClassInst.heapFloat[(r4 + 70)]);
            f14 = Float64(heapClassInst.heapFloat[(r4 + 74)]);
            f5 = f5 + f4;
            heapClassInst.heapFloat[(r9 + 126)] = Float32(f5);
            f5 = Float64(heapClassInst.heapFloat[(r9 + 127)]);
            f5 = f5 + f4;
            heapClassInst.heapFloat[(r9 + 127)] = Float32(f5);
            f5 = Float64(heapClassInst.heapFloat[(r9 + 128)]);
            f4 = f5 + f4;
            heapClassInst.heapFloat[(r9 + 128)] = Float32(f4);
            f4 = f7 * f2;
            f5 = f6 * f1;
            f4 = f4 + f5;
            f5 = f12 * f0;
            f6 = Float64(heapClassInst.heapFloat[(r9 + 134)]);
            f4 = f4 + f5;
            f5 = f6 * f3;
            f6 = Float64(heapClassInst.heapFloat[(r9 + 136)]);
            f7 = Float64(heapClassInst.heapFloat[(r9 + 135)]);
            f12 = Float64(heapClassInst.heapFloat[(r9 + 130)]);
            f4 = f4 * f5;
            f5 = f9 * f2;
            f8 = f8 * f1;
            f5 = f5 + f8;
            f8 = f13 * f0;
            f4 = f12 + f4;
            heapClassInst.heapFloat[(r9 + 130)] = Float32(f4);
            f4 = f5 + f8;
            f5 = f7 * f3;
            f2 = f11 * f2;
            f1 = f10 * f1;
            f4 = f4 * f5;
            f5 = Float64(heapClassInst.heapFloat[(r9 + 131)]);
            f4 = f5 + f4;
            f1 = f2 + f1;
            f0 = f14 * f0;
            heapClassInst.heapFloat[(r9 + 131)] = Float32(f4);
            f0 = f1 + f0;
            f1 = f6 * f3;
            f0 = f0 * f1;
            f1 = Float64(heapClassInst.heapFloat[(r9 + 132)]);
            f0 = f1 + f0;
            heapClassInst.heapFloat[(r9 + 132)] = Float32(f0);
          }
        }
      }
    } while (false);
    r1 = r1 >> 2;
    r2 = r2 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r1 + 82)]);
    f1 = Float64(heapClassInst.heapFloat[(r1 + 132)]);
    f2 = Float64(heapClassInst.heapFloat[(r1 + 81)]);
    f3 = Float64(heapClassInst.heapFloat[(r1 + 131)]);
    f4 = Float64(heapClassInst.heapFloat[(r1 + 80)]);
    f5 = Float64(heapClassInst.heapFloat[(r1 + 130)]);
    f6 = Float64(heapClassInst.heapFloat[(r2 + 82)]);
    f7 = Float64(heapClassInst.heapFloat[(r2 + 132)]);
    f8 = Float64(heapClassInst.heapFloat[(r2 + 81)]);
    f9 = Float64(heapClassInst.heapFloat[(r2 + 131)]);
    f10 = Float64(heapClassInst.heapFloat[(r2 + 80)]);
    f11 = Float64(heapClassInst.heapFloat[(r2 + 130)]);
    f0 = f0 + f1;
    f1 = f2 + f3;
    f2 = f4 + f5;
    f3 = f6 + f7;
    f4 = f8 + f9;
    f5 = f10 + f11;
    r4 = Int64(heapClassInst.heapU8[r0 + 514]);
    if (!(r4 == 0)) 
    {
      f6 = Float64(heapClassInst.heapFloat[(r3 + 129)]);
      f7 = Float64(heapClassInst.heapFloat[(r3 + 123)]);
      f8 = Float64(heapClassInst.heapFloat[(r3 + 112)]);
      f9 = f5 - f2;
      f10 = Float64(heapClassInst.heapFloat[(r3 + 113)]);
      f11 = f4 - f1;
      f12 = Float64(heapClassInst.heapFloat[(r3 + 114)]);
      f13 = f3 - f0;
      f9 = f9 * f8;
      f11 = f11 * f10;
      f7 = f6 * f7;
      f14 = Float64(heapClassInst.heapFloat[(r3 + 105)]);
      f9 = f9 + f11;
      f11 = f13 * f12;
      f7 = f7 * f14;
      f9 = f9 + f11;
      f11 = Float64(heapClassInst.heapFloat[(fp + (-117))]);
      f7 = f7 / f11;
      f11 = 0.0;
      if (f9 > f11) 
      {
        f6 = f6 * f9;
        f9 = Float64(heapClassInst.heapFloat[(r3 + 106)]);
        f6 = f6 * f9;
        f7 = f6 + f7;
      }
      f6 = Float64(heapClassInst.heapFloat[(r3 + 120)]);
      f9 = Float64(heapClassInst.heapFloat[(r3 + 126)]);
      f6 = f6 * f7;
      f6 = f9 + f6;
      f6 = if (f6 > f11) {f6} else {f11};
      heapClassInst.heapFloat[(r3 + 126)] = Float32(f6);
      f6 = f6 - f9;
      f7 = f8 * f6;
      f8 = Float64(heapClassInst.heapFloat[(r3 + 131)]);
      f9 = f10 * f6;
      f10 = Float64(heapClassInst.heapFloat[(r3 + 132)]);
      f13 = Float64(heapClassInst.heapFloat[(r3 + 133)]);
      f6 = f12 * f6;
      f12 = f7 * f8;
      f14 = f9 * f10;
      f12 = f12 + f14;
      f14 = f6 * f13;
      f12 = f12 + f14;
      f10 = f10 * f12;
      f8 = f8 * f12;
      f12 = f13 * f12;
      f9 = f9 - f10;
      f7 = f7 - f8;
      f6 = f6 - f12;
      f8 = f7 * f7;
      f10 = f9 * f9;
      f8 = f8 + f10;
      f10 = f6 * f6;
      f8 = f8 + f10;
      heapClassInst.heapFloat[(g0)] = Float32(f8);
      sqrtf(i7);
      f8 = commonVariable.f_g0;
      f10 = 1.0;
      f10 = f10 / f8;
      f6 = f6 * f10;
      f9 = f9 * f10;
      f7 = f7 * f10;
      f10 = Float64(heapClassInst.heapFloat[(r1 + 84)]);
      if (!(f10 == f11)) 
      {
        r4 = Int64(heapClassInst.heap32[(r3 + 5)]);
        r4 = r4 >> 2;
        f10 = f8 * f11;
        f12 = Float64(heapClassInst.heapFloat[(r1 + 126)]);
        f13 = Float64(heapClassInst.heapFloat[(r4 + 65)]);
        f14 = Float64(heapClassInst.heapFloat[(r4 + 64)]);
        f15 = Float64(heapClassInst.heapFloat[(r4 + 69)]);
        f16 = Float64(heapClassInst.heapFloat[(r4 + 68)]);
        f17 = Float64(heapClassInst.heapFloat[(r4 + 73)]);
        f18 = Float64(heapClassInst.heapFloat[(r4 + 72)]);
        f19 = Float64(heapClassInst.heapFloat[(r4 + 66)]);
        f20 = Float64(heapClassInst.heapFloat[(r4 + 70)]);
        f21 = Float64(heapClassInst.heapFloat[(r4 + 74)]);
        f12 = f12 + f10;
        heapClassInst.heapFloat[(r1 + 126)] = Float32(f12);
        f12 = Float64(heapClassInst.heapFloat[(r1 + 127)]);
        f12 = f12 + f10;
        heapClassInst.heapFloat[(r1 + 127)] = Float32(f12);
        f12 = Float64(heapClassInst.heapFloat[(r1 + 128)]);
        f10 = f12 + f10;
        heapClassInst.heapFloat[(r1 + 128)] = Float32(f10);
        f10 = f14 * f7;
        f12 = f13 * f9;
        f13 = Float64(heapClassInst.heapFloat[(r1 + 134)]);
        f10 = f10 + f12;
        f12 = f19 * f6;
        f10 = f10 + f12;
        f12 = f13 * f8;
        f13 = Float64(heapClassInst.heapFloat[(r1 + 136)]);
        f14 = Float64(heapClassInst.heapFloat[(r1 + 135)]);
        f19 = Float64(heapClassInst.heapFloat[(r1 + 130)]);
        f10 = f10 * f12;
        f12 = f16 * f7;
        f15 = f15 * f9;
        f12 = f12 + f15;
        f15 = f20 * f6;
        f10 = f19 + f10;
        heapClassInst.heapFloat[(r1 + 130)] = Float32(f10);
        f10 = f12 + f15;
        f12 = f14 * f8;
        f14 = f18 * f7;
        f15 = f17 * f9;
        f10 = f10 * f12;
        f12 = Float64(heapClassInst.heapFloat[(r1 + 131)]);
        f10 = f12 + f10;
        f12 = f14 + f15;
        f14 = f21 * f6;
        heapClassInst.heapFloat[(r1 + 131)] = Float32(f10);
        f10 = f12 + f14;
        f12 = f13 * f8;
        f10 = f10 * f12;
        f12 = Float64(heapClassInst.heapFloat[(r1 + 132)]);
        f10 = f12 + f10;
        heapClassInst.heapFloat[(r1 + 132)] = Float32(f10);
      }
      f10 = Float64(heapClassInst.heapFloat[(r2 + 84)]);
      if (!(f10 == f11)) 
      {
        f10 = -f8;
        r4 = Int64(heapClassInst.heap32[(r3 + 6)]);
        r4 = r4 >> 2;
        f11 = ( -0.0);
        f8 = f8 * f11;
        f11 = Float64(heapClassInst.heapFloat[(r2 + 126)]);
        f12 = Float64(heapClassInst.heapFloat[(r4 + 65)]);
        f13 = Float64(heapClassInst.heapFloat[(r4 + 64)]);
        f14 = Float64(heapClassInst.heapFloat[(r4 + 69)]);
        f15 = Float64(heapClassInst.heapFloat[(r4 + 68)]);
        f16 = Float64(heapClassInst.heapFloat[(r4 + 73)]);
        f17 = Float64(heapClassInst.heapFloat[(r4 + 72)]);
        f18 = Float64(heapClassInst.heapFloat[(r4 + 66)]);
        f19 = Float64(heapClassInst.heapFloat[(r4 + 70)]);
        f20 = Float64(heapClassInst.heapFloat[(r4 + 74)]);
        f11 = f11 + f8;
        heapClassInst.heapFloat[(r2 + 126)] = Float32(f11);
        f11 = Float64(heapClassInst.heapFloat[(r2 + 127)]);
        f11 = f11 + f8;
        heapClassInst.heapFloat[(r2 + 127)] = Float32(f11);
        f11 = Float64(heapClassInst.heapFloat[(r2 + 128)]);
        f8 = f11 + f8;
        heapClassInst.heapFloat[(r2 + 128)] = Float32(f8);
        f8 = f13 * f7;
        f11 = f12 * f9;
        f8 = f8 + f11;
        f11 = f18 * f6;
        f12 = Float64(heapClassInst.heapFloat[(r2 + 134)]);
        f8 = f8 + f11;
        f11 = f12 * f10;
        f12 = Float64(heapClassInst.heapFloat[(r2 + 136)]);
        f13 = Float64(heapClassInst.heapFloat[(r2 + 135)]);
        f18 = Float64(heapClassInst.heapFloat[(r2 + 130)]);
        f8 = f8 * f11;
        f11 = f15 * f7;
        f14 = f14 * f9;
        f11 = f11 + f14;
        f14 = f19 * f6;
        f8 = f18 + f8;
        heapClassInst.heapFloat[(r2 + 130)] = Float32(f8);
        f8 = f11 + f14;
        f11 = f13 * f10;
        f7 = f17 * f7;
        f9 = f16 * f9;
        f8 = f8 * f11;
        f11 = Float64(heapClassInst.heapFloat[(r2 + 131)]);
        f8 = f11 + f8;
        f7 = f7 + f9;
        f6 = f20 * f6;
        heapClassInst.heapFloat[(r2 + 131)] = Float32(f8);
        f6 = f7 + f6;
        f7 = f12 * f10;
        f6 = f6 * f7;
        f7 = Float64(heapClassInst.heapFloat[(r2 + 132)]);
        f6 = f7 + f6;
        heapClassInst.heapFloat[(r2 + 132)] = Float32(f6);
      }
    }
    r0 = Int64(heapClassInst.heapU8[r0 + 513]);
    if (!(r0 == 0)) 
    {
      f6 = Float64(heapClassInst.heapFloat[(r3 + 130)]);
      f7 = Float64(heapClassInst.heapFloat[(r3 + 124)]);
      f8 = Float64(heapClassInst.heapFloat[(r3 + 116)]);
      f2 = f5 - f2;
      f5 = Float64(heapClassInst.heapFloat[(r3 + 117)]);
      f1 = f4 - f1;
      f4 = Float64(heapClassInst.heapFloat[(r3 + 118)]);
      f0 = f3 - f0;
      f2 = f2 * f8;
      f1 = f1 * f5;
      f3 = f6 * f7;
      f7 = Float64(heapClassInst.heapFloat[(r3 + 105)]);
      f1 = f2 + f1;
      f0 = f0 * f4;
      f2 = f3 * f7;
      f0 = f1 + f0;
      f1 = Float64(heapClassInst.heapFloat[(fp + (-117))]);
      f1 = f2 / f1;
      f2 = 0.0;
      if (f0 > f2) 
      {
        f0 = f6 * f0;
        f3 = Float64(heapClassInst.heapFloat[(r3 + 106)]);
        f0 = f0 * f3;
        f1 = f0 + f1;
      }
      f0 = Float64(heapClassInst.heapFloat[(r3 + 121)]);
      f3 = Float64(heapClassInst.heapFloat[(r3 + 127)]);
      f0 = f0 * f1;
      f0 = f3 + f0;
      f0 = if (f0 > f2) {f0} else {f2};
      heapClassInst.heapFloat[(r3 + 127)] = Float32(f0);
      f0 = f0 - f3;
      f1 = Float64(heapClassInst.heapFloat[(r1 + 84)]);
      if (f1 != f2) 
      {
        r0 = Int64(heapClassInst.heap32[(r3 + 5)]);
        r0 = r0 >> 2;
        f1 = f0 * f2;
        f3 = Float64(heapClassInst.heapFloat[(r1 + 126)]);
        f6 = Float64(heapClassInst.heapFloat[(r0 + 65)]);
        f7 = Float64(heapClassInst.heapFloat[(r0 + 64)]);
        f9 = Float64(heapClassInst.heapFloat[(r0 + 69)]);
        f10 = Float64(heapClassInst.heapFloat[(r0 + 68)]);
        f11 = Float64(heapClassInst.heapFloat[(r0 + 73)]);
        f12 = Float64(heapClassInst.heapFloat[(r0 + 72)]);
        f13 = Float64(heapClassInst.heapFloat[(r0 + 66)]);
        f14 = Float64(heapClassInst.heapFloat[(r0 + 70)]);
        f15 = Float64(heapClassInst.heapFloat[(r0 + 74)]);
        f3 = f3 + f1;
        heapClassInst.heapFloat[(r1 + 126)] = Float32(f3);
        f3 = Float64(heapClassInst.heapFloat[(r1 + 127)]);
        f3 = f3 + f1;
        heapClassInst.heapFloat[(r1 + 127)] = Float32(f3);
        f3 = Float64(heapClassInst.heapFloat[(r1 + 128)]);
        f1 = f3 + f1;
        heapClassInst.heapFloat[(r1 + 128)] = Float32(f1);
        f1 = f7 * f8;
        f3 = f6 * f5;
        f6 = Float64(heapClassInst.heapFloat[(r1 + 134)]);
        f1 = f1 + f3;
        f3 = f13 * f4;
        f1 = f1 + f3;
        f3 = f6 * f0;
        f6 = Float64(heapClassInst.heapFloat[(r1 + 136)]);
        f7 = Float64(heapClassInst.heapFloat[(r1 + 135)]);
        f13 = Float64(heapClassInst.heapFloat[(r1 + 130)]);
        f1 = f1 * f3;
        f3 = f10 * f8;
        f9 = f9 * f5;
        f3 = f3 + f9;
        f9 = f14 * f4;
        f1 = f13 + f1;
        heapClassInst.heapFloat[(r1 + 130)] = Float32(f1);
        f1 = f3 + f9;
        f3 = f7 * f0;
        f8 = f12 * f8;
        f5 = f11 * f5;
        f1 = f1 * f3;
        f3 = Float64(heapClassInst.heapFloat[(r1 + 131)]);
        f1 = f3 + f1;
        f5 = f8 + f5;
        f4 = f15 * f4;
        heapClassInst.heapFloat[(r1 + 131)] = Float32(f1);
        f4 = f5 + f4;
        f5 = f6 * f0;
        f4 = f4 * f5;
        f5 = Float64(heapClassInst.heapFloat[(r1 + 132)]);
        f4 = f5 + f4;
        heapClassInst.heapFloat[(r1 + 132)] = Float32(f4);
        f8 = Float64(heapClassInst.heapFloat[(r3 + 116)]);
        f5 = Float64(heapClassInst.heapFloat[(r3 + 117)]);
        f4 = Float64(heapClassInst.heapFloat[(r3 + 118)]);
      }
      f1 = Float64(heapClassInst.heapFloat[(r2 + 84)]);
      if (!(f1 == f2)) 
      {
        f1 = -f0;
        r0 = Int64(heapClassInst.heap32[(r3 + 6)]);
        r0 = r0 >> 2;
        f2 = ( -0.0);
        f0 = f0 * f2;
        f2 = Float64(heapClassInst.heapFloat[(r2 + 126)]);
        f3 = Float64(heapClassInst.heapFloat[(r0 + 65)]);
        f6 = Float64(heapClassInst.heapFloat[(r0 + 64)]);
        f7 = Float64(heapClassInst.heapFloat[(r0 + 69)]);
        f9 = Float64(heapClassInst.heapFloat[(r0 + 68)]);
        f10 = Float64(heapClassInst.heapFloat[(r0 + 73)]);
        f11 = Float64(heapClassInst.heapFloat[(r0 + 72)]);
        f12 = Float64(heapClassInst.heapFloat[(r0 + 66)]);
        f13 = Float64(heapClassInst.heapFloat[(r0 + 70)]);
        f14 = Float64(heapClassInst.heapFloat[(r0 + 74)]);
        f2 = f2 + f0;
        heapClassInst.heapFloat[(r2 + 126)] = Float32(f2);
        f2 = Float64(heapClassInst.heapFloat[(r2 + 127)]);
        f2 = f2 + f0;
        heapClassInst.heapFloat[(r2 + 127)] = Float32(f2);
        f2 = Float64(heapClassInst.heapFloat[(r2 + 128)]);
        f0 = f2 + f0;
        heapClassInst.heapFloat[(r2 + 128)] = Float32(f0);
        f0 = f6 * f8;
        f2 = f3 * f5;
        f0 = f0 + f2;
        f2 = f12 * f4;
        f3 = Float64(heapClassInst.heapFloat[(r2 + 134)]);
        f0 = f0 + f2;
        f2 = f3 * f1;
        f3 = Float64(heapClassInst.heapFloat[(r2 + 136)]);
        f6 = Float64(heapClassInst.heapFloat[(r2 + 135)]);
        f12 = Float64(heapClassInst.heapFloat[(r2 + 130)]);
        f0 = f0 * f2;
        f2 = f9 * f8;
        f7 = f7 * f5;
        f2 = f2 + f7;
        f7 = f13 * f4;
        f0 = f12 + f0;
        heapClassInst.heapFloat[(r2 + 130)] = Float32(f0);
        f0 = f2 + f7;
        f2 = f6 * f1;
        f6 = f11 * f8;
        f5 = f10 * f5;
        f0 = f0 * f2;
        f2 = Float64(heapClassInst.heapFloat[(r2 + 131)]);
        f0 = f2 + f0;
        f2 = f6 + f5;
        f4 = f14 * f4;
        heapClassInst.heapFloat[(r2 + 131)] = Float32(f0);
        f0 = f2 + f4;
        f1 = f3 * f1;
        f0 = f0 * f1;
        f1 = Float64(heapClassInst.heapFloat[(r2 + 132)]);
        f0 = f1 + f0;
        heapClassInst.heapFloat[(r2 + 132)] = Float32(f0);
      }
    }
  }
  return;
}

@OverflowWrapping
func _ZN21btConeTwistConstraint8setParamEifi(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var f0: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  f0 = Float64(heapClassInst.heapFloat[(fp + 2)]);
  r2 = Int64(heapClassInst.heap32[(fp + 3)]);
  r3 = (r0 + (-3)) | 0;
  if (`UIntNative`(r3) < `UIntNative`(2)) 
  {
    if (`UIntNative`(r2) > `UIntNative`(2)) 
    {
      r0 = r1 >> 2;
      heapClassInst.heapFloat[(r0 + 148)] = Float32(f0);
      r1 = Int64(heapClassInst.heap32[(r0 + 145)]);
      r1 = r1 | 4;
      heapClassInst.heap32[(r0 + 145)] = Int32(r1);
      return;
    }
    else {
      r1 = r1 >> 2;
      heapClassInst.heapFloat[(r1 + 146)] = Float32(f0);
      r0 = Int64(heapClassInst.heap32[(r1 + 145)]);
      r0 = r0 | 1;
      heapClassInst.heap32[(r1 + 145)] = Int32(r0);
      return;
    }
  }
  else {
    r0 = (r0 + (-1)) | 0;
    if (`UIntNative`(r0) > `UIntNative`(1)) 
    {
      r0 = _E2_str10;
      r1 = _E2_str24;
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      heapClassInst.heap32[(g0 + 2)] = 1066;
      _assert(i7);
    }
    else {
      if (`UIntNative`(r2) > `UIntNative`(2)) 
      {
        r1 = r1 >> 2;
        heapClassInst.heapFloat[(r1 + 105)] = Float32(f0);
        return;
      }
      else {
        r1 = r1 >> 2;
        heapClassInst.heapFloat[(r1 + 147)] = Float32(f0);
        r2 = Int64(heapClassInst.heap32[(r1 + 145)]);
        r2 = r2 | 2;
        heapClassInst.heap32[(r1 + 145)] = Int32(r2);
        return;
      }
    }
  }
}

@OverflowWrapping
func _ZNK21btConeTwistConstraint8getParamEii(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var f0: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  r3 = (r0 + (-3)) | 0;
  if (`UIntNative`(r3) < `UIntNative`(2)) 
  {
    if (`UIntNative`(r2) > `UIntNative`(2)) 
    {
      r0 = (r2 + (-3)) | 0;
      if (`UIntNative`(r0) > `UIntNative`(2)) 
      {
        r1 = _E2_str10;
        r0 = _E2_str24;
        heapClassInst.heap32[(g0)] = Int32(r1);
        heapClassInst.heap32[(g0 + 1)] = Int32(r0);
        heapClassInst.heap32[(g0 + 2)] = 1107;
        _assert(i7);
      }
      else {
        r0 = Int64(heapClassInst.heapU8[r1 + 580]);
        r0 = r0 & 4;
        if (r0 != 0) 
        {
          r1 = (r1 + 592) | 0;
        }
        else {
          r1 = _E2_str543;
          r0 = _E2_str24;
          heapClassInst.heap32[(g0)] = Int32(r1);
          heapClassInst.heap32[(g0 + 1)] = Int32(r0);
          heapClassInst.heap32[(g0 + 2)] = 1102;
          _assert(i7);
        }
      }
    }
    else {
      r2 = Int64(heapClassInst.heapU8[r1 + 580]);
      r2 = r2 & 1;
      if (r2 != 0) 
      {
        r1 = (r1 + 584) | 0;
      }
      else {
        r1 = _E2_str442;
        r2 = _E2_str24;
        heapClassInst.heap32[(g0)] = Int32(r1);
        heapClassInst.heap32[(g0 + 1)] = Int32(r2);
        heapClassInst.heap32[(g0 + 2)] = 1097;
        _assert(i7);
      }
    }
  }
  else {
    r0 = (r0 + (-1)) | 0;
    if (`UIntNative`(r0) > `UIntNative`(1)) 
    {
      r1 = _E2_str10;
      r0 = _E2_str24;
      heapClassInst.heap32[(g0)] = Int32(r1);
      heapClassInst.heap32[(g0 + 1)] = Int32(r0);
      heapClassInst.heap32[(g0 + 2)] = 1111;
      _assert(i7);
    }
    else {
      if (`UIntNative`(r2) > `UIntNative`(2)) 
      {
        r2 = (r2 + (-3)) | 0;
        if (`UIntNative`(r2) > `UIntNative`(2)) 
        {
          r1 = _E2_str10;
          r2 = _E2_str24;
          heapClassInst.heap32[(g0)] = Int32(r1);
          heapClassInst.heap32[(g0 + 1)] = Int32(r2);
          heapClassInst.heap32[(g0 + 2)] = 1090;
          _assert(i7);
        }
        else {
          r1 = (r1 + 420) | 0;
        }
      }
      else {
        r2 = Int64(heapClassInst.heapU8[r1 + 580]);
        r2 = r2 & 2;
        if (r2 != 0) 
        {
          r1 = (r1 + 588) | 0;
        }
        else {
          r1 = _E2_str1340;
          r2 = _E2_str24;
          heapClassInst.heap32[(g0)] = Int32(r1);
          heapClassInst.heap32[(g0 + 1)] = Int32(r2);
          heapClassInst.heap32[(g0 + 2)] = 1081;
          _assert(i7);
        }
      }
    }
  }
  r0 = r1 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r0)]);
  commonVariable.f_g0 = f0;
  return;
}

@OverflowWrapping
func _ZN15btJacobianEntryC2ERK11btMatrix3x3S2_RK9btVector3S5_S5_S5_fS5_f(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
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
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 5)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = r1 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r0)]);
  heapClassInst.heapFloat[(r1)] = Float32(f0);
  f1 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  heapClassInst.heapFloat[(r1 + 1)] = Float32(f1);
  f2 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  r2 = Int64(heapClassInst.heap32[(fp + 3)]);
  heapClassInst.heapFloat[(r1 + 2)] = Float32(f2);
  r2 = r2 >> 2;
  heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r0 + 3)];
  f3 = Float64(heapClassInst.heapFloat[(r2)]);
  f4 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
  f5 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  f6 = f4 * f2;
  f7 = f5 * f1;
  f5 = f5 * f0;
  f8 = f3 * f2;
  f6 = f6 - f7;
  f7 = Float64(heapClassInst.heapFloat[(r0)]);
  f5 = f5 - f8;
  f8 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f3 = f3 * f1;
  f4 = f4 * f0;
  f9 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
  f10 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
  f7 = f7 * f6;
  f8 = f8 * f5;
  f3 = f3 - f4;
  f4 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f11 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
  f12 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
  f13 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
  f14 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
  f9 = f9 * f6;
  f10 = f10 * f5;
  f7 = f7 + f8;
  f4 = f4 * f3;
  f6 = f11 * f6;
  f5 = f12 * f5;
  f8 = f9 + f10;
  f9 = f14 * f3;
  f4 = f7 + f4;
  f5 = f6 + f5;
  f3 = f13 * f3;
  f6 = f8 + f9;
  heapClassInst.heapFloat[(r1 + 4)] = Float32(f4);
  f3 = f5 + f3;
  heapClassInst.heapFloat[(r1 + 5)] = Float32(f6);
  r0 = Int64(heapClassInst.heap32[(fp + 4)]);
  heapClassInst.heapFloat[(r1 + 6)] = Float32(f3);
  r0 = r0 >> 2;
  heapClassInst.heap32[(r1 + 7)] = 0;
  f5 = Float64(heapClassInst.heapFloat[(r0)]);
  f7 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f8 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r0 = r0 >> 2;
  f9 = f8 * f1;
  f10 = f7 * f2;
  f2 = f5 * f2;
  f8 = f8 * f0;
  f9 = f9 - f10;
  f10 = Float64(heapClassInst.heapFloat[(r0)]);
  f2 = f2 - f8;
  f8 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f0 = f7 * f0;
  f1 = f5 * f1;
  f5 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
  f7 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
  f10 = f10 * f9;
  f8 = f8 * f2;
  f0 = f0 - f1;
  f1 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f11 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
  f12 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
  f13 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
  f14 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
  f5 = f5 * f9;
  f7 = f7 * f2;
  f8 = f10 + f8;
  f1 = f1 * f0;
  f9 = f11 * f9;
  f2 = f12 * f2;
  f5 = f5 + f7;
  f7 = f14 * f0;
  f1 = f8 + f1;
  f2 = f9 + f2;
  f0 = f13 * f0;
  f5 = f5 + f7;
  heapClassInst.heapFloat[(r1 + 8)] = Float32(f1);
  f0 = f2 + f0;
  heapClassInst.heapFloat[(r1 + 9)] = Float32(f5);
  r0 = Int64(heapClassInst.heap32[(fp + 6)]);
  heapClassInst.heapFloat[(r1 + 10)] = Float32(f0);
  r0 = r0 >> 2;
  heapClassInst.heap32[(r1 + 11)] = 0;
  f2 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f7 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f8 = Float64(heapClassInst.heapFloat[(r0)]);
  f8 = f8 * f4;
  f7 = f7 * f6;
  heapClassInst.heapFloat[(r1 + 12)] = Float32(f8);
  f2 = f2 * f3;
  heapClassInst.heapFloat[(r1 + 13)] = Float32(f7);
  r0 = Int64(heapClassInst.heap32[(fp + 8)]);
  heapClassInst.heapFloat[(r1 + 14)] = Float32(f2);
  r0 = r0 >> 2;
  heapClassInst.heap32[(r1 + 15)] = 0;
  f9 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f10 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f11 = Float64(heapClassInst.heapFloat[(r0)]);
  f4 = f8 * f4;
  f6 = f7 * f6;
  f7 = f10 * f5;
  f8 = f11 * f1;
  f4 = f4 + f6;
  f2 = f2 * f3;
  f3 = f9 * f0;
  heapClassInst.heapFloat[(r1 + 16)] = Float32(f8);
  f2 = f4 + f2;
  f4 = Float64(heapClassInst.heapFloat[(fp + 7)]);
  f1 = f8 * f1;
  f5 = f7 * f5;
  heapClassInst.heapFloat[(r1 + 17)] = Float32(f7);
  f2 = f2 + f4;
  f4 = Float64(heapClassInst.heapFloat[(fp + 9)]);
  f1 = f1 + f5;
  f0 = f3 * f0;
  heapClassInst.heapFloat[(r1 + 18)] = Float32(f3);
  f2 = f2 + f4;
  f0 = f1 + f0;
  f0 = f2 + f0;
  heapClassInst.heap32[(r1 + 19)] = 0;
  f1 = 0.0
  heapClassInst.heapFloat[(r1 + 20)] = Float32(f0);
  if (f0 > f1) 
  {
    return;
  }
  else {
    r0 = _E2_str846;
    r1 = _E2_str947;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = 53;
    _assert(i7);
  }
}

@OverflowWrapping
func _ZNK21btConeTwistConstraint16GetPointForAngleEff(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
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
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  f0 = Float64(heapClassInst.heapFloat[(fp + 2)]);
  heapClassInst.heapFloat[(g0)] = Float32(f0);
  cosf(i7);
  f1 = commonVariable.f_g0;
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heapFloat[(g0)] = Float32(f0);
  sinf(i7);
  f0 = commonVariable.f_g0;
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(fp)]);
  f2 = Float64(heapClassInst.heapFloat[(fp + 3)]);
  f3 = f1; 
  f3 = abs(f3);
  f4 = 1.1920928955078125e-007;
  if (f3 > f4) 
  {
    f3 = Float64(heapClassInst.heapFloat[(r0 + 109)]);
    f4 = Float64(heapClassInst.heapFloat[(r0 + 108)]);
    f5 = f0 * f0;
    f6 = f1 * f1;
    f5 = f5 / f6;
    f4 = f4 * f4;
    f6 = 1.0;
    f3 = f3 * f3;
    f4 = f5 / f4;
    f3 = f6 / f3;
    f5 = f5 + f6;
    f3 = f4 + f3;
    f3 = f5 / f3;
    heapClassInst.heapFloat[(g0)] = Float32(f3);
    sqrtf(i7);
    f3 = commonVariable.f_g0;
  }
  else {
    f3 = Float64(heapClassInst.heapFloat[(r0 + 108)]);
  }
  f4 = 0.0;
  f5 = f1 * f1;
  f5 = f5 + f4;
  f6 = f0 * f0;
  f5 = f5 + f6;
  heapClassInst.heapFloat[(g0)] = Float32(f5);
  sqrtf(i7);
  f5 = commonVariable.f_g0;
  if (f5 != f4) 
  {
    f6 = 0.5;
    f3 = f3 * f6;
    heapClassInst.heapFloat[(g0)] = Float32(f3);
    sinf(i7);
    f5 = commonVariable.f_g0 / f5;
    f6 = f5 * f4;
    heapClassInst.heapFloat[(g0)] = Float32(f3);
    f0 = -f0;
    f1 = f1 * f5;
    cosf(i7);
    f7 = -f6;
    f0 = f5 * f0;
    f5 = commonVariable.f_g0 * f2;
    f8 = f1 * f4;
    f7 = f2 * f7;
    f5 = f5 + f8;
    f9 = f0 * f4;
    f7 = f7 - f8;
    f8 = f0 * f2;
    f10 = commonVariable.f_g0 * f4;
    f5 = f5 - f9;
    f7 = f7 - f9;
    f4 = f6 * f4;
    f8 = f10 + f8;
    f8 = f8 - f4;
    f9 = f5 * commonVariable.f_g0;
    f11 = f7 * f6;
    f4 = f10 + f4;
    f2 = f1 * f2;
    f2 = f4 - f2;
    f4 = f8 * commonVariable.f_g0;
    f10 = f7 * f1;
    f9 = f9 - f11;
    f11 = f8 * f0;
    f3 = f2 * commonVariable.f_g0;
    f7 = f7 * f0;
    f4 = f4 - f10;
    f10 = f2 * f6;
    f9 = f9 - f11;
    f2 = f2 * f1;
    r0 = r1 >> 2;
    f2 = f9 + f2;
    f3 = f3 - f7;
    f1 = f5 * f1;
    f4 = f4 - f10;
    f0 = f5 * f0;
    f1 = f3 - f1;
    f3 = f8 * f6;
    f0 = f4 + f0;
    heapClassInst.heapFloat[(r0)] = Float32(f2);
    f1 = f1 + f3;
    heapClassInst.heapFloat[(r0 + 1)] = Float32(f0);
    heapClassInst.heapFloat[(r0 + 2)] = Float32(f1);
    heapClassInst.heap32[(r0 + 3)] = 0;
    return;
  }
  else {
    r1 = _E2_str115;
    r0 = _E2_str685;
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    heapClassInst.heap32[(g0 + 2)] = 61;
    _assert(i7);
  }
}

@OverflowWrapping
func _ZN21btConeTwistConstraint14calcAngleInfo2ERK11btTransformS2_RK11btMatrix3x3S5_(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  i7 = sp + (-384); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  heapClassInst.heap32[(r1 + 123)] = 0;
  r2 = 0;
  heapClassInst.heap32[(r1 + 122)] = 0;
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap8[r0 + 513] = Int8(r2);
  heapClassInst.heap8[r0 + 514] = Int8(r2);
  r2 = Int64(heapClassInst.heapU8[r0 + 540]);
  if (r2 == 0) 
  {
    __label__ = 6;
  }
  else {
    r2 = Int64(heapClassInst.heapU8[r0 + 515]);
    if (r2 != 0) 
    {
      __label__ = 6;
    }
    else {
      f0 = Float64(heapClassInst.heapFloat[(r1 + 136)]);
      f1 = Float64(heapClassInst.heapFloat[(r1 + 137)]);
      f2 = Float64(heapClassInst.heapFloat[(r1 + 138)]);
      f3 = f0 * f0;
      f4 = f1 * f1;
      f5 = Float64(heapClassInst.heapFloat[(r1 + 139)]);
      f3 = f3 + f4;
      f4 = f2 * f2;
      f3 = f3 + f4;
      f4 = f5 * f5;
      f6 = 2.0;
      f3 = f3 + f4;
      r4 = r4 >> 2;
      f3 = f6 / f3;
      f4 = f2 * f3;
      f6 = f1 * f3;
      f3 = f0 * f3;
      f7 = Float64(heapClassInst.heapFloat[(r4)]);
      heapClassInst.heapFloat[(fp + (-48))] = Float32(f7);
      f7 = Float64(heapClassInst.heapFloat[(r1 + 89)]);
      heapClassInst.heapFloat[(fp + (-64))] = Float32(f7);
      f7 = Float64(heapClassInst.heapFloat[(r1 + 88)]);
      heapClassInst.heapFloat[(fp + (-66))] = Float32(f7);
      f8 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
      heapClassInst.heapFloat[(fp + (-49))] = Float32(f8);
      f9 = Float64(heapClassInst.heapFloat[(r1 + 93)]);
      heapClassInst.heapFloat[(fp + (-65))] = Float32(f9);
      f7 = Float64(heapClassInst.heapFloat[(r1 + 92)]);
      heapClassInst.heapFloat[(fp + (-67))] = Float32(f7);
      f8 = Float64(heapClassInst.heapFloat[(r1 + 90)]);
      heapClassInst.heapFloat[(fp + (-54))] = Float32(f8);
      f9 = Float64(heapClassInst.heapFloat[(r1 + 94)]);
      heapClassInst.heapFloat[(fp + (-55))] = Float32(f9);
      f2 = f2 * f4;
      f10 = f0 * f3;
      f11 = f1 * f6;
      f12 = Float64(heapClassInst.heapFloat[(fp + (-66))]);
      f7 = Float64(heapClassInst.heapFloat[(fp + (-48))]);
      f13 = f12 * f7;
      f7 = Float64(heapClassInst.heapFloat[(fp + (-67))]);
      f8 = Float64(heapClassInst.heapFloat[(fp + (-49))]);
      f14 = f7 * f8;
      f15 = Float64(heapClassInst.heapFloat[(fp + (-64))]);
      f7 = Float64(heapClassInst.heapFloat[(fp + (-48))]);
      f16 = f15 * f7;
      f9 = Float64(heapClassInst.heapFloat[(fp + (-65))]);
      f17 = f9 * f8;
      f18 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
      heapClassInst.heapFloat[(fp + (-83))] = Float32(f18);
      f19 = Float64(heapClassInst.heapFloat[(r1 + 97)]);
      heapClassInst.heapFloat[(fp + (-80))] = Float32(f19);
      f20 = Float64(heapClassInst.heapFloat[(r1 + 96)]);
      heapClassInst.heapFloat[(fp + (-81))] = Float32(f20);
      r3 = r3 >> 2;
      f21 = Float64(heapClassInst.heapFloat[(r1 + 98)]);
      heapClassInst.heapFloat[(fp + (-77))] = Float32(f21);
      f22 = f11 + f2;
      f23 = 1.0;
      heapClassInst.heapFloat[(fp + (-76))] = Float32(f23);
      f2 = f10 + f2;
      f24 = f0 * f6;
      f25 = f5 * f4;
      f13 = f13 + f14;
      f14 = f20 * f18;
      f16 = f16 + f17;
      f17 = f19 * f18;
      f8 = Float64(heapClassInst.heapFloat[(fp + (-54))]);
      f26 = f8 * f7;
      f9 = Float64(heapClassInst.heapFloat[(fp + (-55))]);
      f8 = Float64(heapClassInst.heapFloat[(fp + (-49))]);
      f27 = f9 * f8;
      f22 = f23 - f22;
      heapClassInst.heapFloat[(fp + (-78))] = Float32(f22);
      f13 = f13 + f14;
      heapClassInst.heapFloat[(fp + (-50))] = Float32(f13);
      f14 = f24 - f25;
      heapClassInst.heapFloat[(fp + (-52))] = Float32(f14);
      f24 = f24 + f25;
      heapClassInst.heapFloat[(fp + (-79))] = Float32(f24);
      f16 = f16 + f17;
      heapClassInst.heapFloat[(fp + (-51))] = Float32(f16);
      f2 = f23 - f2;
      heapClassInst.heapFloat[(fp + (-53))] = Float32(f2);
      f0 = f0 * f4;
      f6 = f5 * f6;
      f1 = f1 * f4;
      f3 = f5 * f3;
      f4 = f26 + f27;
      f5 = f21 * f18;
      f2 = Float64(heapClassInst.heapFloat[(r3)]);
      heapClassInst.heapFloat[(fp + (-40))] = Float32(f2);
      f7 = Float64(heapClassInst.heapFloat[(r1 + 73)]);
      f8 = Float64(heapClassInst.heapFloat[(r1 + 72)]);
      f2 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
      heapClassInst.heapFloat[(fp + (-41))] = Float32(f2);
      f9 = Float64(heapClassInst.heapFloat[(r1 + 77)]);
      f12 = Float64(heapClassInst.heapFloat[(r1 + 76)]);
      f13 = Float64(heapClassInst.heapFloat[(r4 + 4)]);
      heapClassInst.heapFloat[(fp + (-59))] = Float32(f13);
      f14 = Float64(heapClassInst.heapFloat[(r4 + 5)]);
      heapClassInst.heapFloat[(fp + (-60))] = Float32(f14);
      f15 = Float64(heapClassInst.heapFloat[(r3 + 4)]);
      heapClassInst.heapFloat[(fp + (-68))] = Float32(f15);
      f16 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
      heapClassInst.heapFloat[(fp + (-69))] = Float32(f16);
      f17 = Float64(heapClassInst.heapFloat[(r1 + 74)]);
      f18 = Float64(heapClassInst.heapFloat[(r1 + 78)]);
      f19 = f0 + f6;
      heapClassInst.heapFloat[(fp + (-56))] = Float32(f19);
      f20 = f1 - f3;
      heapClassInst.heapFloat[(fp + (-58))] = Float32(f20);
      f10 = f10 + f11;
      f2 = Float64(heapClassInst.heapFloat[(fp + (-40))]);
      f11 = f8 * f2;
      f2 = Float64(heapClassInst.heapFloat[(fp + (-41))]);
      f21 = f12 * f2;
      f13 = Float64(heapClassInst.heapFloat[(fp + (-50))]);
      f23 = f22 * f13;
      f16 = Float64(heapClassInst.heapFloat[(fp + (-51))]);
      f25 = f24 * f16;
      f0 = f0 - f6;
      heapClassInst.heapFloat[(fp + (-61))] = Float32(f0);
      f4 = f4 + f5;
      heapClassInst.heapFloat[(fp + (-57))] = Float32(f4);
      f1 = f1 + f3;
      heapClassInst.heapFloat[(fp + (-62))] = Float32(f1);
      f2 = Float64(heapClassInst.heapFloat[(fp + (-40))]);
      f3 = f7 * f2;
      f2 = Float64(heapClassInst.heapFloat[(fp + (-41))]);
      f5 = f9 * f2;
      f14 = Float64(heapClassInst.heapFloat[(fp + (-52))]);
      f6 = f14 * f13;
      f2 = Float64(heapClassInst.heapFloat[(fp + (-53))]);
      f26 = f2 * f16;
      f0 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
      heapClassInst.heapFloat[(fp + (-71))] = Float32(f0);
      f1 = Float64(heapClassInst.heapFloat[(r1 + 81)]);
      f2 = Float64(heapClassInst.heapFloat[(r1 + 80)]);
      f4 = Float64(heapClassInst.heapFloat[(r3 + 8)]);
      heapClassInst.heapFloat[(fp + (-38))] = Float32(f4);
      f13 = Float64(heapClassInst.heapFloat[(r3 + 9)]);
      heapClassInst.heapFloat[(fp + (-39))] = Float32(f13);
      f14 = Float64(heapClassInst.heapFloat[(r4 + 6)]);
      heapClassInst.heapFloat[(fp + (-37))] = Float32(f14);
      f15 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
      heapClassInst.heapFloat[(fp + (-70))] = Float32(f15);
      f0 = Float64(heapClassInst.heapFloat[(r1 + 82)]);
      heapClassInst.heapFloat[(fp + (-82))] = Float32(f0);
      f4 = Float64(heapClassInst.heapFloat[(fp + (-76))]);
      f10 = f4 - f10;
      heapClassInst.heapFloat[(fp + (-63))] = Float32(f10);
      f14 = Float64(heapClassInst.heapFloat[(fp + (-66))]);
      f13 = Float64(heapClassInst.heapFloat[(fp + (-59))]);
      f15 = f14 * f13;
      f16 = Float64(heapClassInst.heapFloat[(fp + (-67))]);
      f14 = Float64(heapClassInst.heapFloat[(fp + (-60))]);
      f19 = f16 * f14;
      f20 = Float64(heapClassInst.heapFloat[(fp + (-64))]);
      f22 = f20 * f13;
      f24 = Float64(heapClassInst.heapFloat[(fp + (-65))]);
      f27 = f24 * f14;
      f28 = Float64(heapClassInst.heapFloat[(fp + (-68))]);
      f29 = f8 * f28;
      f16 = Float64(heapClassInst.heapFloat[(fp + (-69))]);
      f30 = f12 * f16;
      f0 = f7 * f28;
      f4 = f9 * f16;
      f11 = f11 + f21;
      heapClassInst.heapFloat[(fp + (-42))] = Float32(f11);
      f21 = Float64(heapClassInst.heapFloat[(fp + (-71))]);
      f10 = f2 * f21;
      heapClassInst.heapFloat[(fp + (-43))] = Float32(f10);
      f10 = f23 + f25;
      heapClassInst.heapFloat[(fp + (-44))] = Float32(f10);
      f13 = Float64(heapClassInst.heapFloat[(fp + (-61))]);
      f11 = Float64(heapClassInst.heapFloat[(fp + (-57))]);
      f14 = f13 * f11;
      f3 = f3 + f5;
      f5 = f1 * f21;
      f6 = f6 + f26;
      f16 = Float64(heapClassInst.heapFloat[(fp + (-62))]);
      f20 = f16 * f11;
      f23 = Float64(heapClassInst.heapFloat[(fp + (-40))]);
      f24 = f17 * f23;
      f25 = Float64(heapClassInst.heapFloat[(fp + (-41))]);
      f26 = f18 * f25;
      f28 = Float64(heapClassInst.heapFloat[(fp + (-56))]);
      f13 = Float64(heapClassInst.heapFloat[(fp + (-50))]);
      f10 = f28 * f13;
      f11 = Float64(heapClassInst.heapFloat[(fp + (-58))]);
      f16 = Float64(heapClassInst.heapFloat[(fp + (-51))]);
      f11 = f11 * f16;
      f13 = Float64(heapClassInst.heapFloat[(r3 + 10)]);
      heapClassInst.heapFloat[(fp + (-72))] = Float32(f13);
      f15 = f15 + f19;
      f13 = Float64(heapClassInst.heapFloat[(fp + (-81))]);
      f19 = Float64(heapClassInst.heapFloat[(fp + (-37))]);
      f13 = f13 * f19;
      f22 = f22 + f27;
      f19 = Float64(heapClassInst.heapFloat[(fp + (-80))]);
      f27 = Float64(heapClassInst.heapFloat[(fp + (-37))]);
      f16 = f19 * f27;
      f19 = Float64(heapClassInst.heapFloat[(fp + (-54))]);
      f21 = Float64(heapClassInst.heapFloat[(fp + (-59))]);
      f19 = f19 * f21;
      f21 = Float64(heapClassInst.heapFloat[(fp + (-55))]);
      f23 = Float64(heapClassInst.heapFloat[(fp + (-60))]);
      f21 = f21 * f23;
      f23 = Float64(heapClassInst.heapFloat[(fp + (-38))]);
      f8 = f8 * f23;
      f23 = Float64(heapClassInst.heapFloat[(fp + (-39))]);
      f12 = f12 * f23;
      f23 = Float64(heapClassInst.heapFloat[(fp + (-38))]);
      f7 = f7 * f23;
      f23 = Float64(heapClassInst.heapFloat[(fp + (-39))]);
      f9 = f9 * f23;
      f29 = f29 + f30;
      f30 = Float64(heapClassInst.heapFloat[(fp + (-70))]);
      f23 = f2 * f30;
      f0 = f0 + f4;
      f4 = f1 * f30;
      f28 = Float64(heapClassInst.heapFloat[(fp + (-68))]);
      f25 = f17 * f28;
      f27 = Float64(heapClassInst.heapFloat[(fp + (-69))]);
      f27 = f18 * f27;
      f28 = Float64(heapClassInst.heapFloat[(fp + (-42))]);
      f30 = Float64(heapClassInst.heapFloat[(fp + (-43))]);
      f28 = f28 + f30;
      f30 = Float64(heapClassInst.heapFloat[(fp + (-44))]);
      f14 = f30 + f14;
      heapClassInst.heapFloat[(fp + (-73))] = Float32(f14);
      f3 = f3 + f5;
      f5 = f6 + f20;
      heapClassInst.heapFloat[(fp + (-42))] = Float32(f5);
      f6 = f24 + f26;
      f20 = Float64(heapClassInst.heapFloat[(fp + (-82))]);
      f14 = Float64(heapClassInst.heapFloat[(fp + (-71))]);
      f24 = f20 * f14;
      f10 = f10 + f11;
      f26 = Float64(heapClassInst.heapFloat[(fp + (-63))]);
      f11 = Float64(heapClassInst.heapFloat[(fp + (-57))]);
      f30 = f26 * f11;
      f5 = f15 + f13;
      heapClassInst.heapFloat[(fp + (-44))] = Float32(f5);
      f5 = f22 + f16;
      heapClassInst.heapFloat[(fp + (-45))] = Float32(f5);
      f11 = f29 + f23;
      f0 = f0 + f4;
      f4 = f19 + f21;
      f21 = Float64(heapClassInst.heapFloat[(fp + (-77))]);
      f13 = Float64(heapClassInst.heapFloat[(fp + (-37))]);
      f14 = f21 * f13;
      f8 = f8 + f12;
      f13 = Float64(heapClassInst.heapFloat[(fp + (-72))]);
      f2 = f2 * f13;
      f7 = f7 + f9;
      f1 = f1 * f13;
      f23 = Float64(heapClassInst.heapFloat[(fp + (-38))]);
      f9 = f17 * f23;
      f23 = Float64(heapClassInst.heapFloat[(fp + (-39))]);
      f12 = f18 * f23;
      f15 = f25 + f27;
      f16 = Float64(heapClassInst.heapFloat[(fp + (-70))]);
      f17 = f20 * f16;
      f18 = Float64(heapClassInst.heapFloat[(fp + (-73))]);
      f19 = f28 * f18;
      f5 = Float64(heapClassInst.heapFloat[(fp + (-42))]);
      f22 = f3 * f5;
      f6 = f6 + f24;
      f10 = f10 + f30;
      heapClassInst.heapFloat[(fp + (-43))] = Float32(f10);
      f4 = f4 + f14;
      heapClassInst.heapFloat[(fp + (-74))] = Float32(f4);
      f14 = Float64(heapClassInst.heapFloat[(r1 + 84)]);
      f24 = Float64(heapClassInst.heapFloat[(r1 + 85)]);
      f25 = Float64(heapClassInst.heapFloat[(r1 + 86)]);
      f4 = Float64(heapClassInst.heapFloat[(r4 + 8)]);
      heapClassInst.heapFloat[(fp + (-46))] = Float32(f4);
      f5 = Float64(heapClassInst.heapFloat[(r1 + 100)]);
      heapClassInst.heapFloat[(fp + (-85))] = Float32(f5);
      f4 = Float64(heapClassInst.heapFloat[(r4 + 9)]);
      heapClassInst.heapFloat[(fp + (-47))] = Float32(f4);
      f5 = Float64(heapClassInst.heapFloat[(r1 + 101)]);
      heapClassInst.heapFloat[(fp + (-86))] = Float32(f5);
      f10 = Float64(heapClassInst.heapFloat[(r4 + 10)]);
      heapClassInst.heapFloat[(fp + (-75))] = Float32(f10);
      f13 = Float64(heapClassInst.heapFloat[(r1 + 102)]);
      heapClassInst.heapFloat[(fp + (-84))] = Float32(f13);
      f2 = f8 + f2;
      f1 = f7 + f1;
      f7 = f15 + f17;
      f8 = Float64(heapClassInst.heapFloat[(fp + (-78))]);
      f5 = Float64(heapClassInst.heapFloat[(fp + (-44))]);
      f15 = f8 * f5;
      f16 = Float64(heapClassInst.heapFloat[(fp + (-79))]);
      f5 = Float64(heapClassInst.heapFloat[(fp + (-45))]);
      f17 = f16 * f5;
      f18 = Float64(heapClassInst.heapFloat[(fp + (-52))]);
      f5 = Float64(heapClassInst.heapFloat[(fp + (-44))]);
      f20 = f18 * f5;
      f21 = Float64(heapClassInst.heapFloat[(fp + (-53))]);
      f5 = Float64(heapClassInst.heapFloat[(fp + (-45))]);
      f23 = f21 * f5;
      f9 = f9 + f12;
      f12 = Float64(heapClassInst.heapFloat[(fp + (-82))]);
      f13 = Float64(heapClassInst.heapFloat[(fp + (-72))]);
      f12 = f12 * f13;
      f18 = Float64(heapClassInst.heapFloat[(fp + (-73))]);
      f26 = f11 * f18;
      f5 = Float64(heapClassInst.heapFloat[(fp + (-42))]);
      f27 = f0 * f5;
      f19 = f19 + f22;
      f10 = Float64(heapClassInst.heapFloat[(fp + (-43))]);
      f22 = f6 * f10;
      f29 = Float64(heapClassInst.heapFloat[(r3 + 14)]);
      heapClassInst.heapFloat[(fp + (-82))] = Float32(f29);
      f30 = Float64(heapClassInst.heapFloat[(r3 + 13)]);
      heapClassInst.heapFloat[(fp + (-87))] = Float32(f30);
      f4 = Float64(heapClassInst.heapFloat[(r3 + 12)]);
      heapClassInst.heapFloat[(fp + (-89))] = Float32(f4);
      f4 = Float64(heapClassInst.heapFloat[(r4 + 14)]);
      heapClassInst.heapFloat[(fp + (-88))] = Float32(f4);
      f4 = Float64(heapClassInst.heapFloat[(r4 + 13)]);
      heapClassInst.heapFloat[(fp + (-90))] = Float32(f4);
      f4 = Float64(heapClassInst.heapFloat[(r4 + 12)]);
      heapClassInst.heapFloat[(fp + (-91))] = Float32(f4);
      r3 = sp + (-128);
      f9 = f9 + f12;
      f12 = Float64(heapClassInst.heapFloat[(fp + (-66))]);
      f4 = Float64(heapClassInst.heapFloat[(fp + (-46))]);
      f12 = f12 * f4;
      f4 = Float64(heapClassInst.heapFloat[(fp + (-67))]);
      f5 = Float64(heapClassInst.heapFloat[(fp + (-47))]);
      f4 = f4 * f5;
      f5 = Float64(heapClassInst.heapFloat[(fp + (-64))]);
      f8 = Float64(heapClassInst.heapFloat[(fp + (-46))]);
      f5 = f5 * f8;
      f8 = Float64(heapClassInst.heapFloat[(fp + (-65))]);
      f10 = Float64(heapClassInst.heapFloat[(fp + (-47))]);
      f8 = f8 * f10;
      f15 = f15 + f17;
      f13 = Float64(heapClassInst.heapFloat[(fp + (-61))]);
      f17 = Float64(heapClassInst.heapFloat[(fp + (-74))]);
      f10 = f13 * f17;
      f20 = f20 + f23;
      f16 = Float64(heapClassInst.heapFloat[(fp + (-62))]);
      f23 = f16 * f17;
      f13 = Float64(heapClassInst.heapFloat[(fp + (-56))]);
      f16 = Float64(heapClassInst.heapFloat[(fp + (-44))]);
      f13 = f13 * f16;
      f16 = Float64(heapClassInst.heapFloat[(fp + (-58))]);
      f17 = Float64(heapClassInst.heapFloat[(fp + (-45))]);
      f16 = f16 * f17;
      f17 = f2 * f18;
      f18 = Float64(heapClassInst.heapFloat[(fp + (-42))]);
      f18 = f1 * f18;
      f26 = f26 + f27;
      f27 = Float64(heapClassInst.heapFloat[(fp + (-43))]);
      f21 = f7 * f27;
      f19 = f19 + f22;
      f10 = f15 + f10;
      f15 = f20 + f23;
      r4 = r3 >> 2;
      f20 = Float64(heapClassInst.heapFloat[(fp + (-40))]);
      f20 = f20 * f14;
      f22 = Float64(heapClassInst.heapFloat[(fp + (-41))]);
      f22 = f22 * f24;
      f4 = f12 + f4;
      f12 = Float64(heapClassInst.heapFloat[(fp + (-81))]);
      f23 = Float64(heapClassInst.heapFloat[(fp + (-75))]);
      f12 = f12 * f23;
      f5 = f5 + f8;
      f8 = Float64(heapClassInst.heapFloat[(fp + (-80))]);
      f8 = f8 * f23;
      f23 = Float64(heapClassInst.heapFloat[(fp + (-54))]);
      f27 = Float64(heapClassInst.heapFloat[(fp + (-46))]);
      f23 = f23 * f27;
      f27 = Float64(heapClassInst.heapFloat[(fp + (-55))]);
      f29 = Float64(heapClassInst.heapFloat[(fp + (-47))]);
      f27 = f27 * f29;
      f13 = f13 + f16;
      f16 = Float64(heapClassInst.heapFloat[(fp + (-63))]);
      f29 = Float64(heapClassInst.heapFloat[(fp + (-74))]);
      f16 = f16 * f29;
      f17 = f17 + f18;
      f18 = Float64(heapClassInst.heapFloat[(fp + (-43))]);
      f18 = f9 * f18;
      f21 = f26 + f21;
      heapClassInst.heapFloat[(fp + (-32))] = Float32(f19);
      f4 = f4 + f12;
      f5 = f5 + f8;
      f8 = f13 + f16;
      f12 = f20 + f22;
      f13 = Float64(heapClassInst.heapFloat[(fp + (-71))]);
      f13 = f13 * f25;
      f16 = Float64(heapClassInst.heapFloat[(fp + (-68))]);
      f16 = f16 * f14;
      f19 = Float64(heapClassInst.heapFloat[(fp + (-69))]);
      f19 = f19 * f24;
      f20 = f23 + f27;
      f22 = Float64(heapClassInst.heapFloat[(fp + (-77))]);
      f23 = Float64(heapClassInst.heapFloat[(fp + (-75))]);
      f22 = f22 * f23;
      f26 = f28 * f10;
      f27 = f3 * f15;
      f17 = f17 + f18;
      heapClassInst.heapFloat[(r4 + 1)] = Float32(f21);
      f18 = f20 + f22;
      f12 = f12 + f13;
      heapClassInst.heapFloat[(r4 + 2)] = Float32(f17);
      f13 = f16 + f19;
      f16 = Float64(heapClassInst.heapFloat[(fp + (-70))]);
      f16 = f16 * f25;
      f17 = Float64(heapClassInst.heapFloat[(fp + (-38))]);
      f14 = f17 * f14;
      f17 = Float64(heapClassInst.heapFloat[(fp + (-39))]);
      f17 = f17 * f24;
      f19 = Float64(heapClassInst.heapFloat[(fp + (-78))]);
      f19 = f19 * f4;
      f20 = Float64(heapClassInst.heapFloat[(fp + (-79))]);
      f20 = f20 * f5;
      f21 = Float64(heapClassInst.heapFloat[(fp + (-52))]);
      f21 = f21 * f4;
      f22 = Float64(heapClassInst.heapFloat[(fp + (-53))]);
      f22 = f22 * f5;
      f24 = f11 * f10;
      f23 = f0 * f15;
      f26 = f26 + f27;
      f27 = f6 * f8;
      f29 = Float64(heapClassInst.heapFloat[(fp + (-89))]);
      f12 = f12 + f29;
      f13 = f13 + f16;
      f14 = f14 + f17;
      f16 = Float64(heapClassInst.heapFloat[(fp + (-72))]);
      f16 = f16 * f25;
      f17 = f19 + f20;
      f19 = Float64(heapClassInst.heapFloat[(fp + (-61))]);
      f19 = f19 * f18;
      f20 = f21 + f22;
      f21 = Float64(heapClassInst.heapFloat[(fp + (-62))]);
      f21 = f21 * f18;
      f22 = Float64(heapClassInst.heapFloat[(fp + (-56))]);
      f22 = f22 * f4;
      f25 = Float64(heapClassInst.heapFloat[(fp + (-58))]);
      f25 = f25 * f5;
      f29 = f2 * f10;
      f30 = f1 * f15;
      f23 = f24 + f23;
      f24 = f7 * f8;
      f26 = f26 + f27;
      heapClassInst.heap32[(r4 + 3)] = 0;
      f12 = -f12;
      f27 = Float64(heapClassInst.heapFloat[(fp + (-87))]);
      f13 = f13 + f27;
      f17 = f17 + f19;
      f19 = f20 + f21;
      f14 = f14 + f16;
      f16 = f22 + f25;
      f20 = Float64(heapClassInst.heapFloat[(fp + (-63))]);
      f20 = f20 * f18;
      f21 = f29 + f30;
      f22 = f9 * f8;
      f23 = f23 + f24;
      heapClassInst.heapFloat[(r4 + 4)] = Float32(f26);
      f29 = Float64(heapClassInst.heapFloat[(fp + (-82))]);
      f14 = f14 + f29;
      f16 = f16 + f20;
      f20 = f28 * f12;
      f24 = f11 * f13;
      f25 = f3 * f12;
      f26 = f0 * f13;
      f27 = f28 * f17;
      f3 = f3 * f19;
      f21 = f21 + f22;
      heapClassInst.heapFloat[(r4 + 5)] = Float32(f23);
      f22 = 0.0;
      heapClassInst.heapFloat[(r4 + 6)] = Float32(f21);
      f20 = f20 - f24;
      f21 = f2 * f14;
      f23 = f25 - f26;
      f24 = f1 * f14;
      f12 = f6 * f12;
      f13 = f7 * f13;
      f25 = Float64(heapClassInst.heapFloat[(fp + (-48))]);
      f26 = Float64(heapClassInst.heapFloat[(fp + (-85))]);
      f25 = f25 * f26;
      f28 = Float64(heapClassInst.heapFloat[(fp + (-49))]);
      f29 = Float64(heapClassInst.heapFloat[(fp + (-86))]);
      f28 = f28 * f29;
      f11 = f11 * f17;
      f0 = f0 * f19;
      f3 = f27 + f3;
      f6 = f6 * f16;
      f20 = f20 - f21;
      f21 = f23 - f24;
      f23 = Float64(heapClassInst.heapFloat[(fp + (-59))]);
      f23 = f23 * f26;
      f24 = Float64(heapClassInst.heapFloat[(fp + (-60))]);
      f24 = f24 * f29;
      f12 = f12 - f13;
      f13 = f9 * f14;
      f14 = Float64(heapClassInst.heapFloat[(fp + (-50))]);
      f14 = f14 * f22;
      f27 = Float64(heapClassInst.heapFloat[(fp + (-51))]);
      f27 = f27 * f22;
      f25 = f25 + f28;
      f28 = Float64(heapClassInst.heapFloat[(fp + (-83))]);
      f30 = Float64(heapClassInst.heapFloat[(fp + (-84))]);
      f28 = f28 * f30;
      f2 = f2 * f17;
      f1 = f1 * f19;
      f0 = f11 + f0;
      f7 = f7 * f16;
      f3 = f3 + f6;
      heapClassInst.heap32[(r4 + 7)] = 0;
      f6 = f12 - f13;
      f11 = f25 + f28;
      f12 = Float64(heapClassInst.heapFloat[(fp + (-46))]);
      f12 = f12 * f26;
      f13 = Float64(heapClassInst.heapFloat[(fp + (-47))]);
      f13 = f13 * f29;
      f25 = Float64(heapClassInst.heapFloat[(fp + (-44))]);
      f25 = f25 * f22;
      f26 = Float64(heapClassInst.heapFloat[(fp + (-45))]);
      f26 = f26 * f22;
      f23 = f23 + f24;
      f24 = Float64(heapClassInst.heapFloat[(fp + (-37))]);
      f24 = f24 * f30;
      f28 = Float64(heapClassInst.heapFloat[(fp + (-73))]);
      f28 = f28 * f20;
      f29 = Float64(heapClassInst.heapFloat[(fp + (-42))]);
      f29 = f29 * f21;
      f14 = f14 + f27;
      f27 = Float64(heapClassInst.heapFloat[(fp + (-57))]);
      f27 = f27 * f22;
      f1 = f2 + f1;
      f2 = f9 * f16;
      f0 = f0 + f7;
      heapClassInst.heapFloat[(r4 + 8)] = Float32(f3);
      f3 = f23 + f24;
      f4 = f4 * f22;
      f5 = f5 * f22;
      f7 = f12 + f13;
      f23 = Float64(heapClassInst.heapFloat[(fp + (-75))]);
      f9 = f23 * f30;
      f10 = f10 * f20;
      f12 = f15 * f21;
      f13 = f25 + f26;
      f15 = Float64(heapClassInst.heapFloat[(fp + (-74))]);
      f15 = f15 * f22;
      f23 = f28 + f29;
      f24 = Float64(heapClassInst.heapFloat[(fp + (-43))]);
      f24 = f24 * f6;
      f14 = f14 + f27;
      f25 = Float64(heapClassInst.heapFloat[(fp + (-91))]);
      f11 = f11 + f25;
      f1 = f1 + f2;
      heapClassInst.heapFloat[(r4 + 9)] = Float32(f0);
      f0 = f7 + f9;
      heapClassInst.heapFloat[(r4 + 10)] = Float32(f1);
      f1 = f17 * f20;
      f2 = f19 * f21;
      f4 = f4 + f5;
      f5 = f18 * f22;
      f7 = f10 + f12;
      f8 = f8 * f6;
      f9 = f13 + f15;
      f10 = Float64(heapClassInst.heapFloat[(fp + (-90))]);
      f3 = f3 + f10;
      f10 = f23 + f24;
      f11 = f14 + f11;
      f1 = f1 + f2;
      f2 = f16 * f6;
      f4 = f4 + f5;
      f5 = Float64(heapClassInst.heapFloat[(fp + (-88))]);
      f0 = f0 + f5;
      f5 = f7 + f8;
      f3 = f9 + f3;
      f6 = f10 + f11;
      heapClassInst.heap32[(r4 + 11)] = 0;
      f1 = f1 + f2;
      f0 = f4 + f0;
      f2 = f5 + f3;
      heapClassInst.heapFloat[(r4 + 12)] = Float32(f6);
      f0 = f1 + f0;
      heapClassInst.heapFloat[(r4 + 13)] = Float32(f2);
      heapClassInst.heapFloat[(r4 + 14)] = Float32(f0);
      heapClassInst.heap32[(r4 + 15)] = 0;
      r4 = sp + (-144);
      heapClassInst.heap32[(g0)] = Int32(r3);
      heapClassInst.heap32[(g0 + 1)] = Int32(r4);
      _ZNK11btMatrix3x311getRotationER12btQuaternion(i7);
      r3 = r4 >> 2;
      f0 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
      f1 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
      f2 = Float64(heapClassInst.heapFloat[(fp + (-36))]);
      heapClassInst.heapFloat[(r1 + 112)] = Float32(f2);
      heapClassInst.heapFloat[(r1 + 113)] = Float32(f1);
      heapClassInst.heapFloat[(r1 + 114)] = Float32(f0);
      heapClassInst.heap32[(r1 + 115)] = 0;
      f2 = f2 * f2;
      f1 = f1 * f1;
      f1 = f2 + f1;
      f0 = f0 * f0;
      f0 = f1 + f0;
      heapClassInst.heapFloat[(g0)] = Float32(f0);
      sqrtf(i7);
      f4 = Float64(heapClassInst.heapFloat[(fp + (-76))]);
      f0 = f4 / commonVariable.f_g0;
      f1 = Float64(heapClassInst.heapFloat[(r1 + 112)]);
      f1 = f1 * f0;
      heapClassInst.heapFloat[(r1 + 112)] = Float32(f1);
      f1 = Float64(heapClassInst.heapFloat[(r1 + 113)]);
      f1 = f1 * f0;
      heapClassInst.heapFloat[(r1 + 113)] = Float32(f1);
      f1 = Float64(heapClassInst.heapFloat[(r1 + 114)]);
      f0 = f1 * f0;
      heapClassInst.heapFloat[(r1 + 114)] = Float32(f0);
      f0 = Float64(heapClassInst.heapFloat[(r3 + 3)]);
      f1 = -1.0
      f0 = if (f0 < f1) {f1} else {f0};
      f0 = if (f0 > f4) {f4} else {f0};
      heapClassInst.heapFloat[(g0)] = Float32(f0);
      acosf(i7);
      f0 = commonVariable.f_g0 + commonVariable.f_g0;
      heapClassInst.heapFloat[(r1 + 123)] = Float32(f0);
      if (f0 < f22) 
      {
        f0 = -f0;
      }
      f1 = 1.1920928955078125e-007;
      if (f0 < f1) 
      {
        __label__ = 72;
      }
      else {
        r1 = 1;
        heapClassInst.heap8[r0 + 514] = Int8(r1);
        return;
      }
    }
  }
  do {
    if (__label__ == 6) {
      r2 = Int64(heapClassInst.heap32[(fp + 3)]);
      r5 = Int64(heapClassInst.heap32[(fp + 4)]);
      r6 = sp + (-64);
      r7 = (r0 + 288) | 0;
      heapClassInst.heap32[(g0)] = Int32(r7);
      heapClassInst.heap32[(g0 + 1)] = Int32(r6);
      _ZNK11btMatrix3x311getRotationER12btQuaternion(i7);
      r7 = sp + (-48);
      heapClassInst.heap32[(g0)] = Int32(r3);
      heapClassInst.heap32[(g0 + 1)] = Int32(r7);
      _ZNK11btMatrix3x311getRotationER12btQuaternion(i7);
      r7 = r7 >> 2;
      r6 = r6 >> 2;
      f0 = Float64(heapClassInst.heapFloat[(r7 + 3)]);
      f1 = Float64(heapClassInst.heapFloat[(r6 + 3)]);
      f2 = Float64(heapClassInst.heapFloat[(fp + (-12))]);
      f3 = Float64(heapClassInst.heapFloat[(fp + (-16))]);
      f4 = Float64(heapClassInst.heapFloat[(r7 + 1)]);
      f5 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
      f6 = Float64(heapClassInst.heapFloat[(r7 + 2)]);
      f7 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
      r6 = sp + (-32);
      r7 = (r0 + 352) | 0;
      heapClassInst.heap32[(g0)] = Int32(r7);
      heapClassInst.heap32[(g0 + 1)] = Int32(r6);
      _ZNK11btMatrix3x311getRotationER12btQuaternion(i7);
      r7 = sp + (-16);
      heapClassInst.heap32[(g0)] = Int32(r4);
      heapClassInst.heap32[(g0 + 1)] = Int32(r7);
      _ZNK11btMatrix3x311getRotationER12btQuaternion(i7);
      r6 = r6 >> 2;
      r7 = r7 >> 2;
      f8 = Float64(heapClassInst.heapFloat[(r7 + 3)]);
      f9 = Float64(heapClassInst.heapFloat[(r6 + 3)]);
      f10 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
      f11 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
      f12 = Float64(heapClassInst.heapFloat[(r7 + 1)]);
      f13 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
      f14 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
      f15 = Float64(heapClassInst.heapFloat[(r7 + 2)]);
      f16 = f8 * f9;
      f17 = f10 * f13;
      f18 = f0 * f3;
      f19 = f2 * f1;
      f20 = f0 * f1;
      f21 = f2 * f3;
      f22 = f8 * f13;
      f23 = f10 * f9;
      f24 = f8 * f11;
      f25 = f12 * f9;
      f26 = f0 * f5;
      f27 = f4 * f1;
      f16 = f16 - f17;
      f17 = f12 * f11;
      f18 = f18 + f19;
      f19 = f4 * f7;
      f20 = f20 - f21;
      f21 = f4 * f5;
      f22 = f22 + f23;
      f23 = f12 * f14;
      f0 = f0 * f7;
      f1 = f6 * f1;
      f24 = f24 + f25;
      f25 = f15 * f13;
      f26 = f26 + f27;
      f27 = f6 * f3;
      f8 = f8 * f14;
      f9 = f15 * f9;
      f16 = f16 - f17;
      f17 = f15 * f14;
      f18 = f18 + f19;
      f19 = f6 * f5;
      f20 = f20 - f21;
      f6 = f6 * f7;
      f21 = f22 + f23;
      f15 = f15 * f11;
      f0 = f0 + f1;
      f1 = f2 * f5;
      f5 = f24 + f25;
      f14 = f10 * f14;
      f22 = f26 + f27;
      f2 = f2 * f7;
      f7 = f8 + f9;
      f8 = f10 * f11;
      f9 = f21 - f15;
      heapClassInst.heapFloat[(fp + (-46))] = Float32(f9);
      f10 = f18 - f19;
      heapClassInst.heapFloat[(fp + (-49))] = Float32(f10);
      f5 = f5 - f14;
      heapClassInst.heapFloat[(fp + (-45))] = Float32(f5);
      f6 = f20 - f6;
      heapClassInst.heapFloat[(fp + (-52))] = Float32(f6);
      f11 = f16 - f17;
      heapClassInst.heapFloat[(fp + (-48))] = Float32(f11);
      f2 = f22 - f2;
      heapClassInst.heapFloat[(fp + (-50))] = Float32(f2);
      f0 = f0 + f1;
      f1 = f4 * f3;
      f3 = f7 + f8;
      f4 = f12 * f13;
      f3 = f3 - f4;
      heapClassInst.heapFloat[(fp + (-47))] = Float32(f3);
      f0 = f0 - f1;
      heapClassInst.heapFloat[(fp + (-51))] = Float32(f0);
      f1 = f11 * f2;
      f4 = f6 * f5;
      f7 = f11 * f6;
      f8 = f10 * f9;
      f12 = f11 * f10;
      f13 = f6 * f9;
      f1 = f1 - f4;
      f4 = f10 * f3;
      f7 = f7 + f8;
      f8 = f2 * f5;
      f11 = f11 * f0;
      f6 = f6 * f3;
      f12 = f12 - f13;
      f13 = f0 * f5;
      f1 = f1 - f4;
      f4 = f0 * f9;
      f7 = f7 + f8;
      f0 = f0 * f3;
      f6 = f11 - f6;
      f8 = f2 * f9;
      f11 = f12 - f13;
      f2 = f2 * f3;
      f2 = f11 + f2;
      f1 = f1 + f4;
      f4 = 0.0;
      f0 = f7 + f0;
      f6 = f6 - f8;
      f7 = f10 * f5;
      f6 = f6 + f7;
      f7 = f1 * f4;
      f8 = -f2;
      f10 = f0 * f4;
      f11 = f2 * f4;
      f12 = f10 + f6;
      f8 = f8 - f7;
      f13 = f6 * f4;
      f7 = f0 + f7;
      f8 = f8 - f13;
      f7 = f7 - f13;
      f12 = f12 - f11;
      f10 = f10 + f11;
      f10 = f10 - f1;
      f11 = f7 * f0;
      f13 = f8 * f2;
      f14 = f12 * f0;
      f15 = f8 * f1;
      f11 = f11 - f13;
      f13 = f12 * f6;
      f14 = f14 - f15;
      f15 = f10 * f2;
      f16 = f10 * f0;
      f8 = f8 * f6;
      f11 = f11 - f13;
      f10 = f10 * f1;
      f13 = f14 - f15;
      f14 = f7 * f6;
      f8 = f16 - f8;
      f7 = f7 * f1;
      f10 = f11 + f10;
      f11 = f13 + f14;
      f7 = f8 - f7;
      f8 = f12 * f2;
      f7 = f7 + f8;
      f8 = f10 * f10;
      f12 = f11 * f11;
      f8 = f8 + f12;
      f12 = f7 * f7;
      f8 = f8 + f12;
      heapClassInst.heapFloat[(g0)] = Float32(f8);
      f8 = 1.0;
      sqrtf(i7);
      f12 = f8 / commonVariable.f_g0;
      f11 = f11 * f12;
      f7 = f7 * f12;
      f10 = f10 * f12;
      f12 = f11 * f4;
      f13 = f7 * f4;
      f14 = f10 + f12;
      f14 = f14 + f13;
      f3 = -f3;
      heapClassInst.heapFloat[(fp + (-43))] = Float32(f3);
      f3 = -f5;
      heapClassInst.heapFloat[(fp + (-44))] = Float32(f3);
      f3 = -f9;
      heapClassInst.heapFloat[(fp + (-42))] = Float32(f3);
      f3 = -0.99999988079071045;
      if (f14 >= f3) 
      {
        f3 = f14 + f8;
        f3 = f3 + f3;
        heapClassInst.heapFloat[(g0)] = Float32(f3);
        sqrtf(i7);
        f10 = f10 * f4;
        f5 = 0.5;
        f11 = f11 - f10;
        f9 = f8 / commonVariable.f_g0;
        f7 = f10 - f7;
        f13 = f13 - f12;
        f12 = commonVariable.f_g0 * f5;
        f11 = f11 * f9;
        f10 = f7 * f9;
        f7 = f13 * f9;
      }
      else {
        f7 = ( -0.0);
        f10 = 1.0;
        f11 = 0.0;
        f12 = f11;
      }
      f3 = f7 * f7;
      f5 = f10 * f10;
      f3 = f3 + f5;
      f5 = f11 * f11;
      f3 = f3 + f5;
      f5 = f12 * f12;
      f3 = f3 + f5;
      heapClassInst.heapFloat[(g0)] = Float32(f3);
      sqrtf(i7);
      f3 = commonVariable.f_g0;
      if (f3 != f4) 
      {
        f3 = f8 / f3;
        f5 = f12 * f3;
        f7 = f7 * f3;
        f9 = f10 * f3;
        f3 = f11 * f3;
        f10 = f5 * f1;
        f11 = f0 * f9;
        f12 = f5 * f2;
        f13 = f0 * f7;
        f14 = f5 * f6;
        f15 = f0 * f3;
        f10 = f10 - f11;
        f11 = f2 * f3;
        f12 = f12 - f13;
        f13 = f6 * f9;
        f0 = f5 * f0;
        f16 = f2 * f7;
        f14 = f14 - f15;
        f15 = f1 * f7;
        f10 = f10 - f11;
        f11 = f6 * f7;
        f12 = f12 - f13;
        f13 = f1 * f3;
        f10 = f10 + f11;
        f11 = f12 + f13;
        f0 = f0 + f16;
        f1 = f1 * f9;
        f12 = f14 - f15;
        f2 = f2 * f9;
        f2 = f12 + f2;
        f12 = f11 * f11;
        f13 = f10 * f10;
        f0 = f0 + f1;
        f1 = f6 * f3;
        f0 = f0 + f1;
        f1 = f12 + f13;
        f6 = f2 * f2;
        f1 = f1 + f6;
        f6 = f0 * f0;
        f1 = f1 + f6;
        heapClassInst.heapFloat[(g0)] = Float32(f1);
        sqrtf(i7);
        f1 = commonVariable.f_g0;
        if (f1 != f4) 
        {
          f1 = f8 / f1;
          f6 = Float64(heapClassInst.heapFloat[(r1 + 108)]);
          heapClassInst.heapFloat[(fp + (-40))] = Float32(f6);
          f12 = Float64(heapClassInst.heapFloat[(r1 + 111)]);
          f11 = f11 * f1;
          heapClassInst.heapFloat[(fp + (-37))] = Float32(f11);
          f10 = f10 * f1;
          heapClassInst.heapFloat[(fp + (-38))] = Float32(f10);
          f2 = f2 * f1;
          heapClassInst.heapFloat[(fp + (-39))] = Float32(f2);
          f0 = f0 * f1;
          heapClassInst.heapFloat[(fp + (-41))] = Float32(f0);
          if (f6 < f12) 
          {
            __label__ = 27;
          }
          else {
            f0 = Float64(heapClassInst.heapFloat[(r1 + 109)]);
            if (f0 < f12) 
            {
              __label__ = 27;
            }
            else {
              f12 = ( -1.0);
              f12 = if (f5 < f12) {f12} else {f5};
              f12 = if (f12 > f8) {f8} else {f12};
              heapClassInst.heapFloat[(g0)] = Float32(f12);
              acosf(i7);
              f12 = commonVariable.f_g0 + commonVariable.f_g0;
              f0 = 1.1920928955078125e-007;
              if (f12 > f0) 
              {
                f4 = f7 * f7;
                f0 = f9 * f9;
                f4 = f4 + f0;
                f0 = f3 * f3;
                f4 = f4 + f0;
                heapClassInst.heapFloat[(g0)] = Float32(f4);
                f4 = 1.0;
                sqrtf(i7);
                f0 = f4 / commonVariable.f_g0;
                f1 = f9 * f0;
                f2 = f7 * f0;
                f0 = f3 * f0;
                f3 = f1; 
                f3 = abs(f3);
                f5 = 1.1920928955078125e-007;
                if (f3 > f5) 
                {
                  f3 = Float64(heapClassInst.heapFloat[(r1 + 109)]);
                  f5 = Float64(heapClassInst.heapFloat[(r1 + 108)]);
                  f6 = f0 * f0;
                  f7 = f1 * f1;
                  f6 = f6 / f7;
                  f5 = f5 * f5;
                  f3 = f3 * f3;
                  f5 = f6 / f5;
                  f3 = f4 / f3;
                  f4 = f6 + f4;
                  f3 = f5 + f3;
                  f4 = f4 / f3;
                  heapClassInst.heapFloat[(g0)] = Float32(f4);
                  sqrtf(i7);
                  f4 = commonVariable.f_g0;
                }
                else {
                  f4 = Float64(heapClassInst.heapFloat[(r1 + 108)]);
                }
              }
              f3 = Float64(heapClassInst.heapFloat[(r1 + 104)]);
              f5 = f3 * f4;
              if (f5 >= f12) 
              {
                __label__ = 58;
              }
              else {
                r3 = 1;
                heapClassInst.heap8[r0 + 514] = Int8(r3);
                if (!(f12 >= f4)) 
                {
                  f6 = 0.99999988079071045;
                  if (f3 < f6) 
                  {
                    f8 = f12 - f5;
                    f3 = f4 - f5;
                    f8 = f8 / f3;
                  }
                }
                f12 = f12 - f5;
                heapClassInst.heapFloat[(r1 + 129)] = Float32(f8);
                f3 = f1; 
                heapClassInst.heapFloat[(r1 + 123)] = Float32(f12);
                f12 = abs(f3);
                f3 = 1.1920928955078125e-007;
                if (f12 > f3) 
                {
                  f0 = -f0;
                  f12 = Float64(heapClassInst.heapFloat[(r1 + 109)]);
                  f3 = Float64(heapClassInst.heapFloat[(r1 + 108)]);
                  f12 = f12 / f3;
                  f3 = f0 / f1;
                  f12 = f12 * f3;
                  f12 = f12 * f1;
                  
                  f12 = abs(f12);
                  
                  f3 = 0.0;
                  if (f0 <= f3) 
                  {
                    f12 = -f12;
                  }
                  f0 = f2 * f2;
                  f3 = f1 * f1;
                  f0 = f0 + f3;
                  f3 = f12 * f12;
                  f0 = f0 + f3;
                  heapClassInst.heapFloat[(g0)] = Float32(f0);
                  f0 = 1.0;
                  sqrtf(i7);
                  f0 = f0 / commonVariable.f_g0;
                  f12 = -f12;
                  f2 = f2 * f0;
                  f1 = f1 * f0;
                  f0 = f0 * f12;
                }
                f12 = -f2;
                f3 = -f1;
                f4 = Float64(heapClassInst.heapFloat[(fp + (-46))]);
                f5 = f2 * f4;
                f6 = Float64(heapClassInst.heapFloat[(fp + (-45))]);
                f7 = f6 * f1;
                f8 = Float64(heapClassInst.heapFloat[(fp + (-48))]);
                f12 = f8 * f12;
                f9 = f6 * f0;
                f10 = -f0;
                f5 = f5 + f7;
                f7 = Float64(heapClassInst.heapFloat[(fp + (-47))]);
                f11 = f7 * f0;
                f12 = f12 - f9;
                f9 = f7 * f1;
                f3 = f8 * f3;
                f7 = f7 * f2;
                f12 = f12 + f9;
                f5 = f5 + f11;
                f3 = f3 - f7;
                f0 = f4 * f0;
                f7 = f8 * f10;
                f1 = f4 * f1;
                f0 = f3 + f0;
                f3 = Float64(heapClassInst.heapFloat[(fp + (-42))]);
                f4 = f5 * f3;
                f9 = f12 * f8;
                f1 = f7 - f1;
                f2 = f6 * f2;
                f1 = f1 + f2;
                f2 = Float64(heapClassInst.heapFloat[(fp + (-44))]);
                f6 = f5 * f2;
                f7 = f0 * f8;
                f4 = f4 + f9;
                f9 = Float64(heapClassInst.heapFloat[(fp + (-43))]);
                f10 = f0 * f9;
                f5 = f5 * f9;
                f8 = f1 * f8;
                f6 = f6 + f7;
                f7 = f1 * f3;
                f4 = f4 + f10;
                f1 = f1 * f2;
                f1 = f4 - f1;
                f4 = f5 + f8;
                f2 = f12 * f2;
                f5 = f6 + f7;
                f12 = f12 * f9;
                f2 = f4 + f2;
                f0 = f0 * f3;
                f12 = f5 - f12;
                heapClassInst.heapFloat[(r1 + 112)] = Float32(f1);
                f0 = f2 - f0;
                heapClassInst.heapFloat[(r1 + 113)] = Float32(f12);
                heapClassInst.heapFloat[(r1 + 114)] = Float32(f0);
                heapClassInst.heap32[(r1 + 115)] = 0;
                heapClassInst.heap32[(r1 + 131)] = 0;
                heapClassInst.heap32[(r1 + 132)] = 0;
                heapClassInst.heap32[(r1 + 133)] = 0;
                r3 = r2 >> 2;
                heapClassInst.heap32[(r1 + 134)] = 0;
                r4 = r5 >> 2;
                f2 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
                f3 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
                f4 = Float64(heapClassInst.heapFloat[(r3)]);
                f5 = Float64(heapClassInst.heapFloat[(r3 + 4)]);
                f6 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
                f7 = Float64(heapClassInst.heapFloat[(r4 + 5)]);
                f8 = Float64(heapClassInst.heapFloat[(r4)]);
                f9 = Float64(heapClassInst.heapFloat[(r4 + 4)]);
                f10 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
                f11 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
                f13 = Float64(heapClassInst.heapFloat[(r3 + 9)]);
                f14 = Float64(heapClassInst.heapFloat[(r3 + 8)]);
                f15 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
                f16 = Float64(heapClassInst.heapFloat[(r4 + 6)]);
                f17 = Float64(heapClassInst.heapFloat[(r4 + 9)]);
                f18 = Float64(heapClassInst.heapFloat[(r4 + 8)]);
                f4 = f4 * f1;
                f5 = f5 * f12;
                f2 = f2 * f1;
                f3 = f3 * f12;
                f8 = f8 * f1;
                f9 = f9 * f12;
                f6 = f6 * f1;
                f7 = f7 * f12;
                f19 = Float64(heapClassInst.heapFloat[(r3 + 10)]);
                f20 = Float64(heapClassInst.heapFloat[(r4 + 10)]);
                f4 = f4 + f5;
                f5 = f14 * f0;
                f2 = f2 + f3;
                f3 = f13 * f0;
                f10 = f10 * f1;
                f11 = f11 * f12;
                f8 = f8 + f9;
                f9 = f18 * f0;
                f6 = f6 + f7;
                f7 = f17 * f0;
                f13 = f15 * f1;
                f14 = f16 * f12;
                f4 = f4 + f5;
                f2 = f2 + f3;
                f3 = f8 + f9;
                f5 = f6 + f7;
                f6 = f10 + f11;
                f7 = f19 * f0;
                f8 = f13 + f14;
                f9 = f20 * f0;
                f6 = f6 + f7;
                f7 = f8 + f9;
                f4 = f1 * f4;
                f2 = f12 * f2;
                f1 = f1 * f3;
                f12 = f12 * f5;
                f2 = f4 + f2;
                f3 = f0 * f6;
                f12 = f1 + f12;
                f0 = f0 * f7;
                f1 = f2 + f3;
                f12 = f12 + f0;
                f0 = 1.0;
                f12 = f1 + f12;
                f12 = f0 / f12;
                heapClassInst.heapFloat[(r1 + 120)] = Float32(f12);
                __label__ = 58;
              }
            }
          }
          do {
            if (__label__ == 27) {
              r4 = r4 >> 2;
              r3 = r3 >> 2;
              f0 = Float64(heapClassInst.heapFloat[(r1 + 72)]);
              f1 = Float64(heapClassInst.heapFloat[(r3)]);
              f2 = Float64(heapClassInst.heapFloat[(r1 + 73)]);
              f3 = Float64(heapClassInst.heapFloat[(r3 + 4)]);
              f4 = Float64(heapClassInst.heapFloat[(r1 + 74)]);
              f5 = Float64(heapClassInst.heapFloat[(r1 + 76)]);
              f6 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
              f7 = Float64(heapClassInst.heapFloat[(r1 + 77)]);
              f8 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
              f9 = Float64(heapClassInst.heapFloat[(r1 + 78)]);
              f10 = Float64(heapClassInst.heapFloat[(r4)]);
              f11 = Float64(heapClassInst.heapFloat[(r1 + 88)]);
              f13 = Float64(heapClassInst.heapFloat[(r4 + 4)]);
              heapClassInst.heapFloat[(fp + (-55))] = Float32(f13);
              f14 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
              f15 = Float64(heapClassInst.heapFloat[(r1 + 92)]);
              f13 = Float64(heapClassInst.heapFloat[(r4 + 5)]);
              heapClassInst.heapFloat[(fp + (-56))] = Float32(f13);
              f16 = Float64(heapClassInst.heapFloat[(r3 + 8)]);
              f17 = Float64(heapClassInst.heapFloat[(r3 + 9)]);
              f18 = Float64(heapClassInst.heapFloat[(r4 + 8)]);
              heapClassInst.heapFloat[(fp + (-53))] = Float32(f18);
              f19 = Float64(heapClassInst.heapFloat[(r4 + 9)]);
              heapClassInst.heapFloat[(fp + (-54))] = Float32(f19);
              f13 = f1 * f0;
              heapClassInst.heapFloat[(fp + (-57))] = Float32(f13);
              f13 = f6 * f5;
              heapClassInst.heapFloat[(fp + (-61))] = Float32(f13);
              f18 = f3 * f0;
              heapClassInst.heapFloat[(fp + (-59))] = Float32(f18);
              f13 = f8 * f5;
              heapClassInst.heapFloat[(fp + (-62))] = Float32(f13);
              f18 = Float64(heapClassInst.heapFloat[(r1 + 80)]);
              f19 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
              f20 = Float64(heapClassInst.heapFloat[(r1 + 81)]);
              f21 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
              f22 = Float64(heapClassInst.heapFloat[(r1 + 82)]);
              f23 = f1 * f2;
              f24 = f6 * f7;
              f25 = f3 * f2;
              f26 = f8 * f7;
              f10 = f10 * f11;
              heapClassInst.heapFloat[(fp + (-60))] = Float32(f10);
              f10 = f14 * f15;
              heapClassInst.heapFloat[(fp + (-63))] = Float32(f10);
              f10 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
              heapClassInst.heapFloat[(fp + (-64))] = Float32(f10);
              f13 = Float64(heapClassInst.heapFloat[(r1 + 96)]);
              f14 = Float64(heapClassInst.heapFloat[(r4 + 6)]);
              heapClassInst.heapFloat[(fp + (-58))] = Float32(f14);
              f1 = f1 * f4;
              f6 = f6 * f9;
              f27 = Float64(heapClassInst.heapFloat[(fp + (-55))]);
              f27 = f27 * f11;
              f28 = Float64(heapClassInst.heapFloat[(fp + (-56))]);
              f28 = f28 * f15;
              f3 = f3 * f4;
              f8 = f8 * f9;
              f29 = Float64(heapClassInst.heapFloat[(r3 + 10)]);
              f30 = Float64(heapClassInst.heapFloat[(r4 + 10)]);
              heapClassInst.heapFloat[(fp + (-55))] = Float32(f30);
              f10 = Float64(heapClassInst.heapFloat[(fp + (-57))]);
              f14 = Float64(heapClassInst.heapFloat[(fp + (-61))]);
              f10 = f10 + f14;
              heapClassInst.heapFloat[(fp + (-56))] = Float32(f10);
              f14 = f19 * f18;
              f10 = Float64(heapClassInst.heapFloat[(fp + (-59))]);
              f30 = Float64(heapClassInst.heapFloat[(fp + (-62))]);
              f10 = f10 + f30;
              f30 = f21 * f18;
              f0 = f16 * f0;
              heapClassInst.heapFloat[(fp + (-57))] = Float32(f0);
              f0 = f17 * f5;
              heapClassInst.heapFloat[(fp + (-59))] = Float32(f0);
              f5 = f23 + f24;
              f23 = f19 * f20;
              f24 = f25 + f26;
              f25 = f21 * f20;
              f2 = f16 * f2;
              f7 = f17 * f7;
              f26 = Float64(heapClassInst.heapFloat[(fp + (-60))]);
              f0 = Float64(heapClassInst.heapFloat[(fp + (-63))]);
              f0 = f26 + f0;
              f26 = Float64(heapClassInst.heapFloat[(fp + (-64))]);
              f26 = f26 * f13;
              f1 = f1 + f6;
              f6 = f19 * f22;
              f19 = f27 + f28;
              f27 = Float64(heapClassInst.heapFloat[(fp + (-58))]);
              f27 = f27 * f13;
              f3 = f3 + f8;
              f8 = f21 * f22;
              f21 = Float64(heapClassInst.heapFloat[(fp + (-53))]);
              f11 = f21 * f11;
              f21 = Float64(heapClassInst.heapFloat[(fp + (-54))]);
              f15 = f21 * f15;
              f4 = f16 * f4;
              f9 = f17 * f9;
              f16 = Float64(heapClassInst.heapFloat[(fp + (-56))]);
              f14 = f16 + f14;
              f0 = f0 + f26;
              f5 = f5 + f23;
              f1 = f1 + f6;
              f6 = f10 + f30;
              f10 = f19 + f27;
              f16 = f24 + f25;
              f3 = f3 + f8;
              f8 = Float64(heapClassInst.heapFloat[(fp + (-57))]);
              f17 = Float64(heapClassInst.heapFloat[(fp + (-59))]);
              f8 = f8 + f17;
              f17 = f29 * f18;
              f2 = f2 + f7;
              f7 = f29 * f20;
              f11 = f11 + f15;
              f30 = Float64(heapClassInst.heapFloat[(fp + (-55))]);
              f13 = f30 * f13;
              f4 = f4 + f9;
              f9 = f29 * f22;
              f8 = f8 + f17;
              f11 = f11 + f13;
              f2 = f2 + f7;
              f4 = f4 + f9;
              f7 = f0 * f5;
              f9 = f10 * f16;
              f13 = f0 * f1;
              f15 = f10 * f3;
              f7 = f7 + f9;
              f9 = f11 * f2;
              f13 = f13 + f15;
              f15 = f11 * f4;
              f7 = f7 + f9;
              f9 = f13 + f15;
              f13 = Float64(heapClassInst.heapFloat[(fp + (-40))]);
              if (!(f13 >= f12)) 
              {
                f13 = Float64(heapClassInst.heapFloat[(r1 + 109)]);
                if (!(f13 >= f12)) 
                {
                  f1 = 0.0
                  if (f7 < f1) 
                  {
                    f7 = -f7;
                  }
                  f2 = 1.1920928955078125e-007;
                  if (!(f7 >= f2)) 
                  {
                    if (f9 < f1) 
                    {
                      f9 = -f9;
                    }
                    if (f9 < f2) 
                    {
                      break 
                    }
                  }
                  f1 = f10 * f8;
                  f2 = f11 * f6;
                  f1 = f1 - f2;
                  r3 = 1;
                  f2 = f11 * f14;
                  f3 = f0 * f8;
                  f2 = f2 - f3;
                  f0 = f0 * f6;
                  f3 = f10 * f14;
                  f1 = -f1;
                  heapClassInst.heap8[r0 + 514] = Int8(r3);
                  f0 = f0 - f3;
                  f2 = -f2;
                  heapClassInst.heapFloat[(r1 + 112)] = Float32(f1);
                  f0 = -f0;
                  heapClassInst.heapFloat[(r1 + 113)] = Float32(f2);
                  heapClassInst.heapFloat[(r1 + 114)] = Float32(f0);
                  heapClassInst.heap32[(r1 + 115)] = 0;
                  break 
                }
              }
              f13 = f0 * f14;
              f15 = f10 * f6;
              f13 = f13 + f15;
              f15 = f11 * f8;
              f13 = f13 + f15;
              f15 = Float64(heapClassInst.heapFloat[(fp + (-40))]);
              do {
                if (f15 >= f12) 
                {
                  f15 = 0.0
                  if (f9 < f15) 
                  {
                    f17 = -f9;
                  }
                  else {
                    f17 = f9;
                  }
                  f18 = 1.1920928955078125e-007;
                  if (f17 < f18) 
                  {
                    break 
                  }
                  else {
                    r3 = 1;
                    heapClassInst.heap8[r0 + 514] = Int8(r3);
                    f17 = Float64(heapClassInst.heapFloat[(fp + (-40))]);
                    if (f17 < f12) 
                    {
                      break 
                    }
                    else {
                      heapClassInst.heapFloat[(g0)] = Float32(f7);
                      heapClassInst.heapFloat[(g0 + 1)] = Float32(f13);
                      atan2f(i7);
                      f9 = commonVariable.f_g0;
                      f12 = Float64(heapClassInst.heapFloat[(r1 + 108)]);
                      if (f12 >= f9) 
                      {
                        f17 = -f12;
                        if (f9 < f17) 
                        {
                          heapClassInst.heapFloat[(g0)] = Float32(f12);
                          cosf(i7);
                          f13 = commonVariable.f_g0;
                          f7 = Float64(heapClassInst.heapFloat[(r1 + 108)]);
                          heapClassInst.heapFloat[(g0)] = Float32(f7);
                          sinf(i7);
                          f7 = -commonVariable.f_g0;
                          f9 = 0.0
                        }
                        else {
                          f9 = f15;
                        }
                      }
                      else {
                        heapClassInst.heapFloat[(g0)] = Float32(f12);
                        cosf(i7);
                        f13 = commonVariable.f_g0;
                        f9 = Float64(heapClassInst.heapFloat[(r1 + 108)]);
                        heapClassInst.heapFloat[(g0)] = Float32(f9);
                        f9 = 0.0
                        sinf(i7);
                        f7 = commonVariable.f_g0;
                      }
                    }
                  }
                }
                else {
                  f15 = 0.0
                  if (f7 < f15) 
                  {
                    f17 = -f7;
                  }
                  else {
                    f17 = f7;
                  }
                  f18 = 1.1920928955078125e-007;
                  if (f17 >= f18) 
                  {
                    r3 = 1;
                    heapClassInst.heap8[r0 + 514] = Int8(r3);
                    f17 = Float64(heapClassInst.heapFloat[(r1 + 109)]);
                    if (!(f17 < f12)) 
                    {
                      heapClassInst.heapFloat[(g0)] = Float32(f9);
                      heapClassInst.heapFloat[(g0 + 1)] = Float32(f13);
                      atan2f(i7);
                      f7 = commonVariable.f_g0;
                      f12 = Float64(heapClassInst.heapFloat[(r1 + 109)]);
                      if (f12 >= f7) 
                      {
                        f17 = -f12;
                        if (f7 < f17) 
                        {
                          heapClassInst.heapFloat[(g0)] = Float32(f12);
                          cosf(i7);
                          f13 = commonVariable.f_g0;
                          f7 = Float64(heapClassInst.heapFloat[(r1 + 109)]);
                          heapClassInst.heapFloat[(g0)] = Float32(f7);
                          sinf(i7);
                          f9 = -commonVariable.f_g0;
                          f7 = 0.0
                        }
                        else {
                          f7 = f15;
                        }
                      }
                      else {
                        heapClassInst.heapFloat[(g0)] = Float32(f12);
                        cosf(i7);
                        f13 = commonVariable.f_g0;
                        f7 = Float64(heapClassInst.heapFloat[(r1 + 109)]);
                        heapClassInst.heapFloat[(g0)] = Float32(f7);
                        f7 = 0.0
                        sinf(i7);
                        f9 = commonVariable.f_g0;
                      }
                    }
                  }
                }
              } while (false);
              f12 = f14 * f13;
              f5 = f5 * f7;
              f6 = f6 * f13;
              f14 = f16 * f7;
              f5 = f12 + f5;
              f1 = f1 * f9;
              f6 = f6 + f14;
              f3 = f3 * f9;
              f8 = f8 * f13;
              f2 = f2 * f7;
              f1 = f5 + f1;
              f3 = f6 + f3;
              f2 = f8 + f2;
              f4 = f4 * f9;
              f2 = f2 + f4;
              f4 = f1 * f1;
              f5 = f3 * f3;
              f4 = f4 + f5;
              f5 = f2 * f2;
              f4 = f4 + f5;
              heapClassInst.heapFloat[(g0)] = Float32(f4);
              f4 = 1.0;
              sqrtf(i7);
              f5 = f4 / commonVariable.f_g0;
              f2 = f2 * f5;
              f3 = f3 * f5;
              f1 = f1 * f5;
              f5 = f10 * f2;
              f6 = f11 * f3;
              f5 = f5 - f6;
              f6 = f11 * f1;
              f2 = f0 * f2;
              f2 = f6 - f2;
              f6 = -f5;
              f0 = f0 * f3;
              f1 = f10 * f1;
              f0 = f0 - f1;
              f1 = -f2;
              heapClassInst.heapFloat[(r1 + 112)] = Float32(f6);
              f3 = -f0;
              heapClassInst.heapFloat[(r1 + 113)] = Float32(f1);
              heapClassInst.heapFloat[(r1 + 114)] = Float32(f3);
              heapClassInst.heap32[(r1 + 115)] = 0;
              f1 = f5 * f5;
              f2 = f2 * f2;
              f1 = f1 + f2;
              f0 = f0 * f0;
              f0 = f1 + f0;
              heapClassInst.heapFloat[(g0)] = Float32(f0);
              sqrtf(i7);
              heapClassInst.heapFloat[(r1 + 123)] = Float32(commonVariable.f_g0);
              f0 = Float64(heapClassInst.heapFloat[(r1 + 112)]);
              f1 = Float64(heapClassInst.heapFloat[(r1 + 113)]);
              f2 = Float64(heapClassInst.heapFloat[(r1 + 114)]);
              f0 = f0 * f0;
              f1 = f1 * f1;
              f0 = f0 + f1;
              f1 = f2 * f2;
              f0 = f0 + f1;
              heapClassInst.heapFloat[(g0)] = Float32(f0);
              sqrtf(i7);
              f0 = f4 / commonVariable.f_g0;
              f1 = Float64(heapClassInst.heapFloat[(r1 + 112)]);
              f1 = f1 * f0;
              heapClassInst.heapFloat[(r1 + 112)] = Float32(f1);
              f1 = Float64(heapClassInst.heapFloat[(r1 + 113)]);
              f1 = f1 * f0;
              heapClassInst.heapFloat[(r1 + 113)] = Float32(f1);
              f1 = Float64(heapClassInst.heapFloat[(r1 + 114)]);
              f0 = f1 * f0;
              heapClassInst.heapFloat[(r1 + 114)] = Float32(f0);
            }
          } while (false);
          f0 = Float64(heapClassInst.heapFloat[(r1 + 110)]);
          f1 = 0.0
          if (f0 < f1) 
          {
            heapClassInst.heap32[(r1 + 125)] = 0;
            break 
          }
          else {
            f0 = -1.0
            f1 = Float64(heapClassInst.heapFloat[(fp + (-41))]);
            f1 = if (f1 < f0) {f0} else {f1};
            f2 = 1.0
            f1 = if (f1 > f2) {f2} else {f1};
            heapClassInst.heapFloat[(g0)] = Float32(f1);
            acosf(i7);
            f1 = commonVariable.f_g0 + commonVariable.f_g0;
            heapClassInst.heapFloat[(r1 + 125)] = Float32(f1);
            f3 = 3.1415927410125732;
            if (f1 > f3) 
            {
              f1 = Float64(heapClassInst.heapFloat[(fp + (-41))]);
              f1 = -f1;
              f1 = if (f1 < f0) {f0} else {f1};
              f0 = 1.0;
              f1 = if (f1 > f0) {f0} else {f1};
              heapClassInst.heapFloat[(g0)] = Float32(f1);
              acosf(i7);
              f0 = Float64(heapClassInst.heapFloat[(fp + (-39))]);
              f0 = -f0;
              heapClassInst.heapFloat[(fp + (-39))] = Float32(f0);
              f0 = Float64(heapClassInst.heapFloat[(fp + (-38))]);
              f0 = -f0;
              heapClassInst.heapFloat[(fp + (-38))] = Float32(f0);
              f0 = Float64(heapClassInst.heapFloat[(fp + (-37))]);
              f0 = -f0;
              heapClassInst.heapFloat[(fp + (-37))] = Float32(f0);
              f1 = commonVariable.f_g0 + commonVariable.f_g0;
              heapClassInst.heapFloat[(r1 + 125)] = Float32(f1);
            }
            f0 = 1.1920928955078125e-007;
            if (f1 > f0) 
            {
              f1 = Float64(heapClassInst.heapFloat[(fp + (-37))]);
              f0 = f1 * f1;
              f3 = Float64(heapClassInst.heapFloat[(fp + (-38))]);
              f4 = f3 * f3;
              f0 = f0 + f4;
              f4 = Float64(heapClassInst.heapFloat[(fp + (-39))]);
              f5 = f4 * f4;
              f0 = f0 + f5;
              heapClassInst.heapFloat[(g0)] = Float32(f0);
              f0 = 1.0
              sqrtf(i7);
              f0 = f0 / commonVariable.f_g0;
              f1 = f1 * f0;
              heapClassInst.heapFloat[(fp + (-37))] = Float32(f1);
              f3 = f3 * f0;
              heapClassInst.heapFloat[(fp + (-38))] = Float32(f3);
              f4 = f4 * f0;
              heapClassInst.heapFloat[(fp + (-39))] = Float32(f4);
              f1 = Float64(heapClassInst.heapFloat[(r1 + 125)]);
            }
            f0 = Float64(heapClassInst.heapFloat[(r1 + 110)]);
            f3 = Float64(heapClassInst.heapFloat[(r1 + 104)]);
            f4 = f0 * f3;
            if (!(f1 <= f4)) 
            {
              r3 = 1;
              heapClassInst.heap8[r0 + 513] = Int8(r3);
              if (f1 >= f0) 
              {
                __label__ = 66;
              }
              else {
                f5 = 0.99999988079071045;
                if (f3 < f5) 
                {
                  f3 = f1 - f4;
                  f0 = f0 - f4;
                  f0 = f3 / f0;
                  __label__ = 68;
                }
                else {
                  __label__ = 66;
                }
              }
              if (__label__ == 66) {
                f0 = f2;
              }
              f3 = Float64(heapClassInst.heapFloat[(fp + (-37))]);
              f5 = -f3;
              f6 = Float64(heapClassInst.heapFloat[(fp + (-38))]);
              f7 = -f6;
              f8 = Float64(heapClassInst.heapFloat[(fp + (-46))]);
              f9 = f3 * f8;
              f10 = Float64(heapClassInst.heapFloat[(fp + (-45))]);
              f11 = f10 * f6;
              f12 = Float64(heapClassInst.heapFloat[(fp + (-48))]);
              f5 = f12 * f5;
              f13 = Float64(heapClassInst.heapFloat[(fp + (-39))]);
              f14 = f10 * f13;
              f15 = -f13;
              f9 = f9 + f11;
              f11 = Float64(heapClassInst.heapFloat[(fp + (-47))]);
              f16 = f11 * f13;
              f5 = f5 - f14;
              f14 = f11 * f6;
              f7 = f12 * f7;
              f11 = f11 * f3;
              f5 = f5 + f14;
              f9 = f9 + f16;
              f7 = f7 - f11;
              f11 = f8 * f13;
              f13 = f12 * f15;
              f6 = f8 * f6;
              f7 = f7 + f11;
              f8 = Float64(heapClassInst.heapFloat[(fp + (-42))]);
              f11 = f9 * f8;
              f14 = f5 * f12;
              f6 = f13 - f6;
              f3 = f10 * f3;
              f3 = f6 + f3;
              f6 = Float64(heapClassInst.heapFloat[(fp + (-44))]);
              f10 = f9 * f6;
              f13 = f7 * f12;
              f11 = f11 + f14;
              f14 = Float64(heapClassInst.heapFloat[(fp + (-43))]);
              f15 = f7 * f14;
              f9 = f9 * f14;
              f12 = f3 * f12;
              f10 = f10 + f13;
              f13 = f3 * f8;
              f11 = f11 + f15;
              f3 = f3 * f6;
              f1 = f1 - f4;
              heapClassInst.heapFloat[(r1 + 130)] = Float32(f0);
              f0 = f9 + f12;
              f4 = f5 * f6;
              f6 = f10 + f13;
              f5 = f5 * f14;
              f3 = f11 - f3;
              heapClassInst.heapFloat[(r1 + 124)] = Float32(f1);
              f0 = f0 + f4;
              f1 = f7 * f8;
              f4 = f6 - f5;
              heapClassInst.heapFloat[(r1 + 116)] = Float32(f3);
              f0 = f0 - f1;
              heapClassInst.heapFloat[(r1 + 117)] = Float32(f4);
              heapClassInst.heapFloat[(r1 + 118)] = Float32(f0);
              r2 = r2 >> 2;
              heapClassInst.heap32[(r1 + 119)] = 0;
              r3 = r5 >> 2;
              f1 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
              f5 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
              f6 = Float64(heapClassInst.heapFloat[(r2)]);
              f7 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
              f8 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
              f9 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
              f10 = Float64(heapClassInst.heapFloat[(r3)]);
              f11 = Float64(heapClassInst.heapFloat[(r3 + 4)]);
              f12 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
              f13 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
              f14 = Float64(heapClassInst.heapFloat[(r2 + 9)]);
              f15 = Float64(heapClassInst.heapFloat[(r2 + 8)]);
              f16 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
              f17 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
              f18 = Float64(heapClassInst.heapFloat[(r3 + 9)]);
              f19 = Float64(heapClassInst.heapFloat[(r3 + 8)]);
              f6 = f6 * f3;
              f7 = f7 * f4;
              f1 = f1 * f3;
              f5 = f5 * f4;
              f10 = f10 * f3;
              f11 = f11 * f4;
              f8 = f8 * f3;
              f9 = f9 * f4;
              f20 = Float64(heapClassInst.heapFloat[(r2 + 10)]);
              f21 = Float64(heapClassInst.heapFloat[(r3 + 10)]);
              f6 = f6 + f7;
              f7 = f15 * f0;
              f1 = f1 + f5;
              f5 = f14 * f0;
              f12 = f12 * f3;
              f13 = f13 * f4;
              f10 = f10 + f11;
              f11 = f19 * f0;
              f8 = f8 + f9;
              f9 = f18 * f0;
              f14 = f16 * f3;
              f15 = f17 * f4;
              f6 = f6 + f7;
              f1 = f1 + f5;
              f5 = f10 + f11;
              f7 = f8 + f9;
              f8 = f12 + f13;
              f9 = f20 * f0;
              f10 = f14 + f15;
              f11 = f21 * f0;
              f8 = f8 + f9;
              f9 = f10 + f11;
              f6 = f3 * f6;
              f1 = f4 * f1;
              f3 = f3 * f5;
              f4 = f4 * f7;
              f1 = f6 + f1;
              f5 = f0 * f8;
              f3 = f3 + f4;
              f0 = f0 * f9;
              f1 = f1 + f5;
              f0 = f3 + f0;
              f0 = f1 + f0;
              f0 = f2 / f0;
              heapClassInst.heapFloat[(r1 + 121)] = Float32(f0);
            }
            r0 = Int64(heapClassInst.heapU8[r0 + 514]);
            if (r0 == 0) 
            {
              break 
            }
            else {
              f0 = Float64(heapClassInst.heapFloat[(fp + (-37))]);
              f1 = -f0;
              f2 = Float64(heapClassInst.heapFloat[(fp + (-38))]);
              f3 = -f2;
              f4 = Float64(heapClassInst.heapFloat[(fp + (-52))]);
              f1 = f4 * f1;
              f6 = Float64(heapClassInst.heapFloat[(fp + (-39))]);
              f5 = Float64(heapClassInst.heapFloat[(fp + (-50))]);
              f7 = f5 * f6;
              f8 = Float64(heapClassInst.heapFloat[(fp + (-49))]);
              f9 = f0 * f8;
              f10 = f5 * f2;
              f11 = -f6;
              f1 = f1 - f7;
              f7 = Float64(heapClassInst.heapFloat[(fp + (-51))]);
              f12 = f7 * f2;
              f9 = f9 + f10;
              f10 = f7 * f6;
              f3 = f4 * f3;
              f13 = f7 * f0;
              f1 = f1 + f12;
              f9 = f9 + f10;
              f3 = f3 - f13;
              f6 = f8 * f6;
              f10 = f4 * f11;
              f2 = f8 * f2;
              f3 = f3 + f6;
              f6 = f1 * f4;
              f11 = f9 * f8;
              f2 = f10 - f2;
              f0 = f5 * f0;
              f0 = f2 + f0;
              f2 = f3 * f4;
              f10 = f9 * f5;
              f6 = f6 - f11;
              f11 = f3 * f7;
              f4 = f0 * f4;
              f9 = f9 * f7;
              f2 = f2 - f10;
              f10 = f0 * f8;
              f6 = f6 - f11;
              f0 = f0 * f5;
              f0 = f6 + f0;
              f4 = f4 - f9;
              f5 = f1 * f5;
              f2 = f2 - f10;
              f1 = f1 * f7;
              f4 = f4 - f5;
              f3 = f3 * f8;
              f1 = f2 + f1;
              heapClassInst.heapFloat[(r1 + 131)] = Float32(f0);
              f0 = f4 + f3;
              heapClassInst.heapFloat[(r1 + 132)] = Float32(f1);
              heapClassInst.heapFloat[(r1 + 133)] = Float32(f0);
              heapClassInst.heap32[(r1 + 134)] = 0;
              return;
            }
          }
        }
      }
      r0 = _E2_str584;
      r1 = _E2_str685;
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      heapClassInst.heap32[(g0 + 2)] = 188;
      _assert(i7);
    }
  } while (false);
  return;
}

@OverflowWrapping
func _ZN15btJacobianEntryC2ERK9btVector3RK11btMatrix3x3S5_S2_S2_(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
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
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  heapClassInst.heap32[(r0)] = 0;
  heapClassInst.heap32[(r0 + 1)] = 0;
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(r0 + 2)] = 0;
  r1 = r1 >> 2;
  heapClassInst.heap32[(r0 + 3)] = 0;
  r2 = r2 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r1)]);
  f1 = Float64(heapClassInst.heapFloat[(r2)]);
  f2 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f3 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
  f4 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
  f5 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
  f1 = f1 * f0;
  f3 = f3 * f2;
  f6 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f7 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
  f8 = Float64(heapClassInst.heapFloat[(r2 + 8)]);
  f9 = Float64(heapClassInst.heapFloat[(r2 + 9)]);
  f10 = Float64(heapClassInst.heapFloat[(r2 + 10)]);
  f11 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
  f4 = f4 * f0;
  f5 = f5 * f2;
  f1 = f1 + f3;
  f3 = f7 * f6;
  f0 = f8 * f0;
  f2 = f9 * f2;
  f4 = f4 + f5;
  f5 = f11 * f6;
  f1 = f1 + f3;
  f0 = f0 + f2;
  f2 = f10 * f6;
  f3 = f4 + f5;
  heapClassInst.heapFloat[(r0 + 4)] = Float32(f1);
  f0 = f0 + f2;
  heapClassInst.heapFloat[(r0 + 5)] = Float32(f3);
  heapClassInst.heapFloat[(r0 + 6)] = Float32(f0);
  heapClassInst.heap32[(r0 + 7)] = 0;
  r2 = Int64(heapClassInst.heap32[(fp + 3)]);
  r2 = r2 >> 2;
  f2 = Float64(heapClassInst.heapFloat[(r1)]);
  f2 = -f2;
  f4 = Float64(heapClassInst.heapFloat[(r2)]);
  f5 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f6 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
  f7 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
  f8 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
  f4 = f4 * f2;
  f6 = f6 * f5;
  f9 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f10 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
  f11 = Float64(heapClassInst.heapFloat[(r2 + 8)]);
  f12 = Float64(heapClassInst.heapFloat[(r2 + 9)]);
  f13 = Float64(heapClassInst.heapFloat[(r2 + 10)]);
  f14 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
  f7 = f7 * f2;
  f8 = f8 * f5;
  f4 = f4 - f6;
  f6 = f10 * f9;
  f2 = f11 * f2;
  f5 = f12 * f5;
  f7 = f7 - f8;
  f8 = f14 * f9;
  f4 = f4 - f6;
  f2 = f2 - f5;
  f5 = f13 * f9;
  f6 = f7 - f8;
  heapClassInst.heapFloat[(r0 + 8)] = Float32(f4);
  f2 = f2 - f5;
  heapClassInst.heapFloat[(r0 + 9)] = Float32(f6);
  r1 = Int64(heapClassInst.heap32[(fp + 4)]);
  heapClassInst.heapFloat[(r0 + 10)] = Float32(f2);
  r1 = r1 >> 2;
  heapClassInst.heap32[(r0 + 11)] = 0;
  f5 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f7 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f8 = Float64(heapClassInst.heapFloat[(r1)]);
  f8 = f8 * f1;
  f7 = f7 * f3;
  heapClassInst.heapFloat[(r0 + 12)] = Float32(f8);
  f5 = f5 * f0;
  heapClassInst.heapFloat[(r0 + 13)] = Float32(f7);
  r1 = Int64(heapClassInst.heap32[(fp + 5)]);
  heapClassInst.heapFloat[(r0 + 14)] = Float32(f5);
  r1 = r1 >> 2;
  heapClassInst.heap32[(r0 + 15)] = 0;
  f9 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f10 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f11 = Float64(heapClassInst.heapFloat[(r1)]);
  f10 = f10 * f6;
  f11 = f11 * f4;
  f9 = f9 * f2;
  heapClassInst.heapFloat[(r0 + 16)] = Float32(f11);
  f1 = f8 * f1;
  f3 = f7 * f3;
  f4 = f11 * f4;
  f6 = f10 * f6;
  heapClassInst.heapFloat[(r0 + 17)] = Float32(f10);
  f1 = f1 + f3;
  f0 = f5 * f0;
  f3 = f4 + f6;
  f2 = f9 * f2;
  heapClassInst.heapFloat[(r0 + 18)] = Float32(f9);
  f0 = f1 + f0;
  f1 = f3 + f2;
  f0 = f0 + f1;
  heapClassInst.heap32[(r0 + 19)] = 0;
  f1 = 0.0;
  heapClassInst.heapFloat[(r0 + 20)] = Float32(f0);
  if (f0 > f1) 
  {
    return;
  }
  else {
    r0 = _E2_str846;
    r1 = _E2_str947;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = 70;
    _assert(i7);
  }
}

@OverflowWrapping
func _Z21btAdjustAngleToLimitsfff(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var f0: Float64 = 0.0
  var f1: Float64 = 0.0
  var f2: Float64 = 0.0
  var f3: Float64 = 0.0
  var f4: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  f0 = Float64(heapClassInst.heapFloat[(fp + 1)]);
  f1 = Float64(heapClassInst.heapFloat[(fp + 2)]);
  f2 = Float64(heapClassInst.heapFloat[(fp)]);
  do {
    if (!(f0 >= f1)) 
    {
      if (f2 >= f0) 
      {
        if (f2 <= f1) 
        {
          break 
        }
        else {
          f1 = f2 - f1;
          heapClassInst.heapFloat[(g0)] = Float32(f1);
          heapClassInst.heap32[(g0 + 1)] = 1086918619;
          fmodf(i7);
          f1 = commonVariable.f_g0;
          f3 = -3.1415927410125732;
          if (f1 >= f3) 
          {
            f4 = 3.1415927410125732;
            if (f1 > f4) 
            {
              f4 = -6.2831854820251465;
              f1 = f1 + f4;
            }
          }
          else {
            f4 = 6.2831854820251465;
            f1 = f1 + f4;
          }
          f4 = 0.0;
          if (f1 < f4) 
          {
            f1 = -f1;
          }
          f0 = f2 - f0;
          heapClassInst.heapFloat[(g0)] = Float32(f0);
          heapClassInst.heap32[(g0 + 1)] = 1086918619;
          fmodf(i7);
          f0 = commonVariable.f_g0;
          if (f0 >= f3) 
          {
            f3 = 3.1415927410125732;
            if (f0 > f3) 
            {
              f3 = -6.2831854820251465;
              f0 = f0 + f3;
            }
          }
          else {
            f3 = 6.2831854820251465;
            f0 = f0 + f3;
          }
          if (f0 < f4) 
          {
            f0 = -f0;
          }
          if (f0 >= f1) 
          {
            break 
          }
          else {
            f0 = -6.2831854820251465;
            f2 = f2 + f0;
          }
        }
      }
      else {
        f0 = f0 - f2;
        heapClassInst.heapFloat[(g0)] = Float32(f0);
        heapClassInst.heap32[(g0 + 1)] = 1086918619;
        fmodf(i7);
        f0 = commonVariable.f_g0;
        f3 = -3.1415927410125732;
        if (f0 >= f3) 
        {
          f4 = 3.1415927410125732;
          if (f0 > f4) 
          {
            f4 = -6.2831854820251465;
            f0 = f0 + f4;
          }
        }
        else {
          f4 = 6.2831854820251465;
          f0 = f0 + f4;
        }
        f4 = 0.0;
        if (f0 < f4) 
        {
          f0 = -f0;
        }
        f1 = f1 - f2;
        heapClassInst.heapFloat[(g0)] = Float32(f1);
        heapClassInst.heap32[(g0 + 1)] = 1086918619;
        fmodf(i7);
        f1 = commonVariable.f_g0;
        if (f1 >= f3) 
        {
          f3 = 3.1415927410125732;
          if (f1 > f3) 
          {
            f3 = -6.2831854820251465;
            f1 = f1 + f3;
          }
        }
        else {
          f3 = 6.2831854820251465;
          f1 = f1 + f3;
        }
        if (f1 < f4) 
        {
          f1 = -f1;
        }
        if (!(f0 < f1)) 
        {
          f0 = 6.2831854820251465;
          f0 = f2 + f0;
          commonVariable.f_g0 = f0;
          return;
        }
      }
    }
  } while (false);
  commonVariable.f_g0 = f2;
  return;
}

@OverflowWrapping
func _ZNK17btHingeConstraint28calculateSerializeBufferSizeEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = 212;
  commonVariable.r_g0 = r0;
  return;
}

@OverflowWrapping
func _ZNK17btHingeConstraint9serializeEPvP12btSerializer(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  heapClassInst.heap32[(g0 + 2)] = Int32(r2);
  r1 = r1 >> 2;
  r2 = r0 >> 2;
  _ZNK17btTypedConstraint9serializeEPvP12btSerializer(i7);
  heapClassInst.heap32[(r1 + 11)] = heapClassInst.heap32[(r2 + 135)];
  heapClassInst.heap32[(r1 + 12)] = heapClassInst.heap32[(r2 + 136)];
  heapClassInst.heap32[(r1 + 13)] = heapClassInst.heap32[(r2 + 137)];
  heapClassInst.heap32[(r1 + 14)] = heapClassInst.heap32[(r2 + 138)];
  heapClassInst.heap32[(r1 + 15)] = heapClassInst.heap32[(r2 + 139)];
  heapClassInst.heap32[(r1 + 16)] = heapClassInst.heap32[(r2 + 140)];
  heapClassInst.heap32[(r1 + 17)] = heapClassInst.heap32[(r2 + 141)];
  heapClassInst.heap32[(r1 + 18)] = heapClassInst.heap32[(r2 + 142)];
  heapClassInst.heap32[(r1 + 19)] = heapClassInst.heap32[(r2 + 143)];
  heapClassInst.heap32[(r1 + 20)] = heapClassInst.heap32[(r2 + 144)];
  heapClassInst.heap32[(r1 + 21)] = heapClassInst.heap32[(r2 + 145)];
  heapClassInst.heap32[(r1 + 22)] = heapClassInst.heap32[(r2 + 146)];
  heapClassInst.heap32[(r1 + 23)] = heapClassInst.heap32[(r2 + 147)];
  heapClassInst.heap32[(r1 + 24)] = heapClassInst.heap32[(r2 + 148)];
  heapClassInst.heap32[(r1 + 25)] = heapClassInst.heap32[(r2 + 149)];
  heapClassInst.heap32[(r1 + 26)] = heapClassInst.heap32[(r2 + 150)];
  heapClassInst.heap32[(r1 + 27)] = heapClassInst.heap32[(r2 + 151)];
  heapClassInst.heap32[(r1 + 28)] = heapClassInst.heap32[(r2 + 152)];
  heapClassInst.heap32[(r1 + 29)] = heapClassInst.heap32[(r2 + 153)];
  heapClassInst.heap32[(r1 + 30)] = heapClassInst.heap32[(r2 + 154)];
  heapClassInst.heap32[(r1 + 31)] = heapClassInst.heap32[(r2 + 155)];
  heapClassInst.heap32[(r1 + 32)] = heapClassInst.heap32[(r2 + 156)];
  heapClassInst.heap32[(r1 + 33)] = heapClassInst.heap32[(r2 + 157)];
  heapClassInst.heap32[(r1 + 34)] = heapClassInst.heap32[(r2 + 158)];
  heapClassInst.heap32[(r1 + 35)] = heapClassInst.heap32[(r2 + 159)];
  heapClassInst.heap32[(r1 + 36)] = heapClassInst.heap32[(r2 + 160)];
  heapClassInst.heap32[(r1 + 37)] = heapClassInst.heap32[(r2 + 161)];
  heapClassInst.heap32[(r1 + 38)] = heapClassInst.heap32[(r2 + 162)];
  heapClassInst.heap32[(r1 + 39)] = heapClassInst.heap32[(r2 + 163)];
  heapClassInst.heap32[(r1 + 40)] = heapClassInst.heap32[(r2 + 164)];
  heapClassInst.heap32[(r1 + 41)] = heapClassInst.heap32[(r2 + 165)];
  heapClassInst.heap32[(r1 + 42)] = heapClassInst.heap32[(r2 + 166)];
  r3 = Int64(heapClassInst.heapU8[r0 + 720]);
  heapClassInst.heap32[(r1 + 44)] = Int32(r3);
  r3 = Int64(heapClassInst.heapU8[r0 + 721]);
  heapClassInst.heap32[(r1 + 45)] = Int32(r3);
  heapClassInst.heap32[(r1 + 47)] = heapClassInst.heap32[(r2 + 168)];
  heapClassInst.heap32[(r1 + 46)] = heapClassInst.heap32[(r2 + 167)];
  r0 = Int64(heapClassInst.heapU8[r0 + 725]);
  heapClassInst.heap32[(r1 + 43)] = Int32(r0);
  heapClassInst.heap32[(r1 + 48)] = heapClassInst.heap32[(r2 + 172)];
  heapClassInst.heap32[(r1 + 49)] = heapClassInst.heap32[(r2 + 173)];
  heapClassInst.heap32[(r1 + 50)] = heapClassInst.heap32[(r2 + 169)];
  heapClassInst.heap32[(r1 + 51)] = heapClassInst.heap32[(r2 + 170)];
  heapClassInst.heap32[(r1 + 52)] = heapClassInst.heap32[(r2 + 171)];
  r0 = _E2_str29;
  commonVariable.r_g0 = r0;
  return;
}

@OverflowWrapping
func _ZN17btHingeConstraintD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV17btHingeConstraint;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

@OverflowWrapping
func _ZN17btHingeConstraintD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV17btHingeConstraint;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

@OverflowWrapping
func _ZN17btHingeConstraint13buildJacobianEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  var __label__ = 0;
  i7 = sp + (-552); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heapU8[r0 + 723]);
  if (!(r1 == 0)) 
  {
    r1 = r0 >> 2;
    heapClassInst.heap32[(r1 + 7)] = 0;
    heapClassInst.heap32[(r1 + 182)] = 0;
    r2 = Int64(heapClassInst.heapU8[r0 + 720]);
    if (!(r2 != 0)) 
    {
      r2 = Int64(heapClassInst.heap32[(r1 + 6)]);
      r3 = Int64(heapClassInst.heap32[(r1 + 5)]);
      r2 = r2 >> 2;
      r3 = r3 >> 2;
      f0 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
      f1 = Float64(heapClassInst.heapFloat[(r1 + 163)]);
      f2 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
      f3 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
      f4 = Float64(heapClassInst.heapFloat[(r1 + 164)]);
      f5 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
      f6 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
      f7 = Float64(heapClassInst.heapFloat[(r1 + 147)]);
      f8 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
      f9 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
      f10 = Float64(heapClassInst.heapFloat[(r1 + 148)]);
      f11 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
      f12 = Float64(heapClassInst.heapFloat[(r2 + 9)]);
      f13 = Float64(heapClassInst.heapFloat[(r2 + 10)]);
      f14 = Float64(heapClassInst.heapFloat[(r3 + 9)]);
      f15 = Float64(heapClassInst.heapFloat[(r3 + 10)]);
      f0 = f0 * f1;
      f3 = f3 * f4;
      f16 = Float64(heapClassInst.heapFloat[(r2 + 7)]);
      f17 = Float64(heapClassInst.heapFloat[(r1 + 165)]);
      f18 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
      f6 = f6 * f7;
      f9 = f9 * f10;
      f19 = Float64(heapClassInst.heapFloat[(r3 + 7)]);
      f20 = Float64(heapClassInst.heapFloat[(r1 + 149)]);
      f21 = Float64(heapClassInst.heapFloat[(r3 + 3)]);
      f2 = f2 * f1;
      f5 = f5 * f4;
      f8 = f8 * f7;
      f11 = f11 * f10;
      f22 = Float64(heapClassInst.heapFloat[(r2 + 11)]);
      f23 = Float64(heapClassInst.heapFloat[(r3 + 11)]);
      f1 = f12 * f1;
      f4 = f13 * f4;
      f7 = f14 * f7;
      f10 = f15 * f10;
      f0 = f0 + f3;
      f3 = f16 * f17;
      f6 = f6 + f9;
      f9 = f19 * f20;
      f2 = f2 + f5;
      f5 = f18 * f17;
      f8 = f8 + f11;
      f11 = f21 * f20;
      f1 = f1 + f4;
      f4 = f22 * f17;
      f7 = f7 + f10;
      f10 = f23 * f20;
      f0 = f0 + f3;
      f3 = Float64(heapClassInst.heapFloat[(r2 + 14)]);
      f6 = f6 + f9;
      f9 = Float64(heapClassInst.heapFloat[(r3 + 14)]);
      f2 = f2 + f5;
      f5 = Float64(heapClassInst.heapFloat[(r2 + 13)]);
      f8 = f8 + f11;
      f11 = Float64(heapClassInst.heapFloat[(r3 + 13)]);
      f0 = f0 + f3;
      f3 = f6 + f9;
      f2 = f2 + f5;
      f5 = f8 + f11;
      f1 = f1 + f4;
      f4 = Float64(heapClassInst.heapFloat[(r2 + 15)]);
      f6 = f7 + f10;
      f7 = Float64(heapClassInst.heapFloat[(r3 + 15)]);
      f8 = f0 - f3;
      f9 = f2 - f5;
      f1 = f1 + f4;
      f4 = f6 + f7;
      f6 = f1 - f4;
      f7 = f9 * f9;
      f10 = f8 * f8;
      f7 = f7 + f10;
      f10 = f6 * f6;
      f7 = f7 + f10;
      f10 = 1.1920928955078125e-007;
      if (f7 > f10) 
      {
        heapClassInst.heapFloat[(g0)] = Float32(f7);
        f10 = 1.0;
        sqrtf(i7);
        f11 = f10 / commonVariable.f_g0;
        r2 = sp + (-512);
        f7 = f9 * f11;
        f8 = f8 * f11;
        r3 = r2 >> 2;
        heapClassInst.heapFloat[(fp + (-128))] = Float32(f7);
        f6 = f6 * f11;
        heapClassInst.heapFloat[(r3 + 1)] = Float32(f8);
        r2 = (r2 + 8) | 0;
        heapClassInst.heapFloat[(r3 + 2)] = Float32(f6);
        heapClassInst.heap32[(r3 + 3)] = 0;
        f9 = 0.0;
        if (f6 < f9) 
        {
          f9 = -f6;
        }
        else {
          f9 = f6;
        }
        f11 = 0.70710676908493042;
        if (f9 > f11) 
        {
          f7 = f8 * f8;
          f8 = f6 * f6;
          f7 = f7 + f8;
          heapClassInst.heapFloat[(g0)] = Float32(f7);
          sqrtf(i7);
          heapClassInst.heap32[(r3 + 4)] = 0;
          f6 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
          f8 = f10 / commonVariable.f_g0;
          f6 = -f6;
          f6 = f8 * f6;
          heapClassInst.heapFloat[(r3 + 5)] = Float32(f6);
          f9 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
          f9 = f9 * f8;
          f7 = f7 * f8;
          heapClassInst.heapFloat[(r3 + 6)] = Float32(f9);
          heapClassInst.heapFloat[(r3 + 8)] = Float32(f7);
          f7 = Float64(heapClassInst.heapFloat[(fp + (-128))]);
          f8 = -f7;
          f8 = f9 * f8;
          f7 = f7 * f6;
          heapClassInst.heapFloat[(r3 + 9)] = Float32(f8);
          heapClassInst.heapFloat[(r3 + 10)] = Float32(f7);
          __label__ = 10;
        }
        else {
          __label__ = 9;
        }
      }
      else {
        r2 = sp + (-512);
        r3 = r2 >> 2;
        heapClassInst.heap32[(fp + (-128))] = 1065353216;
        heapClassInst.heap32[(r3 + 1)] = 0;
        r2 = (r2 + 8) | 0;
        f7 = 1.0;
        f8 = 0.0;
        heapClassInst.heap32[(r3 + 2)] = 0;
        heapClassInst.heap32[(r3 + 3)] = 0;
        __label__ = 9;
      }
      if (__label__ == 9) {
        f6 = f7 * f7;
        f7 = f8 * f8;
        f6 = f6 + f7;
        r3 = sp + (-512);
        heapClassInst.heapFloat[(g0)] = Float32(f6);
        r3 = r3 >> 2;
        sqrtf(i7);
        f8 = 1.0
        f9 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
        f7 = f8 / commonVariable.f_g0;
        f8 = -f9;
        f8 = f7 * f8;
        heapClassInst.heapFloat[(r3 + 4)] = Float32(f8);
        f9 = Float64(heapClassInst.heapFloat[(fp + (-128))]);
        f9 = f9 * f7;
        heapClassInst.heapFloat[(r3 + 5)] = Float32(f9);
        r2 = r2 >> 2;
        heapClassInst.heap32[(r3 + 6)] = 0;
        f10 = Float64(heapClassInst.heapFloat[(r2)]);
        f11 = -f10;
        f9 = f9 * f11;
        f8 = f10 * f8;
        heapClassInst.heapFloat[(r3 + 8)] = Float32(f9);
        f6 = f6 * f7;
        heapClassInst.heapFloat[(r3 + 9)] = Float32(f8);
        heapClassInst.heapFloat[(r3 + 10)] = Float32(f6);
      }
      r2 = (r0 + 36) | 0;
      r3 = 0;
      while (true) {
        r4 = Int64(heapClassInst.heap32[(r1 + 5)]);
        r5 = r4 >> 2;
        r6 = sp + (-416);
        r7 = r6 >> 2;
        heapClassInst.heap32[(fp + (-104))] = heapClassInst.heap32[(r5 + 1)];
        heapClassInst.heap32[(r7 + 1)] = heapClassInst.heap32[(r5 + 5)];
        heapClassInst.heap32[(r7 + 2)] = heapClassInst.heap32[(r5 + 9)];
        heapClassInst.heap32[(r7 + 3)] = 0;
        heapClassInst.heap32[(r7 + 4)] = heapClassInst.heap32[(r5 + 2)];
        heapClassInst.heap32[(r7 + 5)] = heapClassInst.heap32[(r5 + 6)];
        heapClassInst.heap32[(r7 + 6)] = heapClassInst.heap32[(r5 + 10)];
        heapClassInst.heap32[(r7 + 7)] = 0;
        heapClassInst.heap32[(r7 + 8)] = heapClassInst.heap32[(r5 + 3)];
        heapClassInst.heap32[(r7 + 9)] = heapClassInst.heap32[(r5 + 7)];
        heapClassInst.heap32[(r7 + 10)] = heapClassInst.heap32[(r5 + 11)];
        heapClassInst.heap32[(r7 + 11)] = 0;
        r7 = Int64(heapClassInst.heap32[(r1 + 6)]);
        r8 = sp + (-368);
        r9 = r7 >> 2;
        r10 = r8 >> 2;
        heapClassInst.heap32[(fp + (-92))] = heapClassInst.heap32[(r9 + 1)];
        heapClassInst.heap32[(r10 + 1)] = heapClassInst.heap32[(r9 + 5)];
        heapClassInst.heap32[(r10 + 2)] = heapClassInst.heap32[(r9 + 9)];
        heapClassInst.heap32[(r10 + 3)] = 0;
        heapClassInst.heap32[(r10 + 4)] = heapClassInst.heap32[(r9 + 2)];
        heapClassInst.heap32[(r10 + 5)] = heapClassInst.heap32[(r9 + 6)];
        heapClassInst.heap32[(r10 + 6)] = heapClassInst.heap32[(r9 + 10)];
        heapClassInst.heap32[(r10 + 7)] = 0;
        heapClassInst.heap32[(r10 + 8)] = heapClassInst.heap32[(r9 + 3)];
        heapClassInst.heap32[(r10 + 9)] = heapClassInst.heap32[(r9 + 7)];
        heapClassInst.heap32[(r10 + 10)] = heapClassInst.heap32[(r9 + 11)];
        heapClassInst.heap32[(r10 + 11)] = 0;
        f6 = Float64(heapClassInst.heapFloat[(r5 + 13)]);
        f7 = Float64(heapClassInst.heapFloat[(r5 + 15)]);
        f8 = Float64(heapClassInst.heapFloat[(r5 + 14)]);
        r10 = sp + (-320);
        f6 = f5 - f6;
        r11 = r10 >> 2;
        f8 = f3 - f8;
        heapClassInst.heapFloat[(fp + (-80))] = Float32(f6);
        f6 = f4 - f7;
        heapClassInst.heapFloat[(r11 + 1)] = Float32(f8);
        heapClassInst.heapFloat[(r11 + 2)] = Float32(f6);
        heapClassInst.heap32[(r11 + 3)] = 0;
        f6 = Float64(heapClassInst.heapFloat[(r9 + 13)]);
        f7 = Float64(heapClassInst.heapFloat[(r9 + 15)]);
        f8 = Float64(heapClassInst.heapFloat[(r9 + 14)]);
        r11 = sp + (-304);
        f6 = f2 - f6;
        r12 = r11 >> 2;
        f8 = f0 - f8;
        heapClassInst.heapFloat[(fp + (-76))] = Float32(f6);
        f6 = f1 - f7;
        heapClassInst.heapFloat[(r12 + 1)] = Float32(f8);
        heapClassInst.heapFloat[(r12 + 2)] = Float32(f6);
        heapClassInst.heap32[(r12 + 3)] = 0;
        f6 = Float64(heapClassInst.heapFloat[(r9 + 84)]);
        f7 = Float64(heapClassInst.heapFloat[(r5 + 84)]);
        r5 = sp + (-512);
        r5 = (r5 + r3) | 0;
        r4 = (r4 + 388) | 0;
        r7 = (r7 + 388) | 0;
        heapClassInst.heap32[(g0)] = Int32(r2);
        heapClassInst.heap32[(g0 + 1)] = Int32(r6);
        heapClassInst.heap32[(g0 + 2)] = Int32(r8);
        heapClassInst.heap32[(g0 + 3)] = Int32(r10);
        heapClassInst.heap32[(g0 + 4)] = Int32(r11);
        heapClassInst.heap32[(g0 + 5)] = Int32(r5);
        heapClassInst.heap32[(g0 + 6)] = Int32(r4);
        heapClassInst.heapFloat[(g0 + 7)] = Float32(f7);
        heapClassInst.heap32[(g0 + 8)] = Int32(r7);
        heapClassInst.heapFloat[(g0 + 9)] = Float32(f6);
        r3 = (r3 + 16) | 0;
        r2 = (r2 + 84) | 0;
        _ZN15btJacobianEntryC2ERK11btMatrix3x3S2_RK9btVector3S5_S5_S5_fS5_f(i7);
        if (!(r3 != 48)) 
        {
          break 
        }
      }
    }
    f0 = Float64(heapClassInst.heapFloat[(r1 + 145)]);
    f1 = Float64(heapClassInst.heapFloat[(r1 + 137)]);
    f2 = Float64(heapClassInst.heapFloat[(r1 + 141)]);
    f3 = 0.0;
    if (f0 < f3) 
    {
      f4 = -f0;
    }
    else {
      f4 = f0;
    }
    f5 = 0.70710676908493042;
    if (f4 <= f5) 
    {
      f4 = f1 * f1;
      f6 = f2 * f2;
      f5 = f4 + f6;
      heapClassInst.heapFloat[(g0)] = Float32(f5);
      f4 = 1.0;
      sqrtf(i7);
      f7 = f4 / commonVariable.f_g0;
      f2 = -f2;
      f4 = f7 * f2;
      f6 = f1 * f7;
      f1 = -f0;
      f2 = f6 * f1;
      f0 = f0 * f4;
      f1 = f5 * f7;
    }
    else {
      f3 = f2 * f2;
      f4 = f0 * f0;
      f4 = f3 + f4;
      heapClassInst.heapFloat[(g0)] = Float32(f4);
      f3 = 1.0;
      sqrtf(i7);
      f5 = f3 / commonVariable.f_g0;
      f0 = -f0;
      f6 = f5 * f0;
      f3 = f2 * f5;
      f0 = -f1;
      f2 = f4 * f5;
      f0 = f3 * f0;
      f1 = f1 * f6;
      f4 = 0.0;
    }
    r2 = Int64(heapClassInst.heap32[(r1 + 5)]);
    r3 = r2 >> 2;
    f5 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
    f7 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
    f8 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
    f9 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
    f10 = Float64(heapClassInst.heapFloat[(r3 + 3)]);
    f11 = f7 * f4;
    f12 = f5 * f6;
    f13 = Float64(heapClassInst.heapFloat[(r3 + 11)]);
    f14 = Float64(heapClassInst.heapFloat[(r3 + 7)]);
    f15 = Float64(heapClassInst.heapFloat[(r3 + 10)]);
    f16 = Float64(heapClassInst.heapFloat[(r3 + 9)]);
    f17 = f9 * f4;
    f18 = f8 * f6;
    f11 = f11 + f12;
    f12 = f10 * f3;
    r3 = sp + (-432);
    f4 = f16 * f4;
    f6 = f15 * f6;
    f17 = f17 + f18;
    f18 = f14 * f3;
    f11 = f11 + f12;
    r4 = r3 >> 2;
    f4 = f4 + f6;
    f3 = f13 * f3;
    f6 = f17 + f18;
    heapClassInst.heapFloat[(fp + (-108))] = Float32(f11);
    f11 = f7 * f2;
    f12 = f5 * f0;
    f3 = f4 + f3;
    heapClassInst.heapFloat[(r4 + 1)] = Float32(f6);
    heapClassInst.heapFloat[(r4 + 2)] = Float32(f3);
    f3 = f9 * f2;
    f4 = f8 * f0;
    f6 = f11 + f12;
    f11 = f10 * f1;
    r5 = sp + (-448);
    f2 = f16 * f2;
    f0 = f15 * f0;
    f3 = f3 + f4;
    f4 = f14 * f1;
    f6 = f6 + f11;
    heapClassInst.heap32[(r4 + 3)] = 0;
    r4 = r5 >> 2;
    f0 = f2 + f0;
    f1 = f13 * f1;
    f2 = f3 + f4;
    heapClassInst.heapFloat[(fp + (-112))] = Float32(f6);
    f0 = f0 + f1;
    heapClassInst.heapFloat[(r4 + 1)] = Float32(f2);
    heapClassInst.heapFloat[(r4 + 2)] = Float32(f0);
    heapClassInst.heap32[(r4 + 3)] = 0;
    f0 = Float64(heapClassInst.heapFloat[(r1 + 137)]);
    f1 = Float64(heapClassInst.heapFloat[(r1 + 141)]);
    f2 = Float64(heapClassInst.heapFloat[(r1 + 145)]);
    f3 = f7 * f0;
    f4 = f5 * f1;
    f6 = f9 * f0;
    f11 = f8 * f1;
    f3 = f3 + f4;
    f4 = f10 * f2;
    r4 = sp + (-464);
    f0 = f16 * f0;
    f1 = f15 * f1;
    f6 = f6 + f11;
    f11 = f14 * f2;
    f3 = f3 + f4;
    r6 = r4 >> 2;
    f0 = f0 + f1;
    f1 = f13 * f2;
    f2 = f6 + f11;
    heapClassInst.heapFloat[(fp + (-116))] = Float32(f3);
    f0 = f0 + f1;
    heapClassInst.heapFloat[(r6 + 1)] = Float32(f2);
    heapClassInst.heapFloat[(r6 + 2)] = Float32(f0);
    r7 = sp + (-288);
    heapClassInst.heap32[(r6 + 3)] = 0;
    r6 = r7 >> 2;
    heapClassInst.heapFloat[(fp + (-72))] = Float32(f7);
    heapClassInst.heapFloat[(r6 + 1)] = Float32(f9);
    heapClassInst.heapFloat[(r6 + 2)] = Float32(f16);
    heapClassInst.heap32[(r6 + 3)] = 0;
    heapClassInst.heapFloat[(r6 + 4)] = Float32(f5);
    heapClassInst.heapFloat[(r6 + 5)] = Float32(f8);
    heapClassInst.heapFloat[(r6 + 6)] = Float32(f15);
    heapClassInst.heap32[(r6 + 7)] = 0;
    heapClassInst.heapFloat[(r6 + 8)] = Float32(f10);
    heapClassInst.heapFloat[(r6 + 9)] = Float32(f14);
    heapClassInst.heapFloat[(r6 + 10)] = Float32(f13);
    heapClassInst.heap32[(r6 + 11)] = 0;
    r6 = Int64(heapClassInst.heap32[(r1 + 6)]);
    r8 = sp + (-240);
    r9 = r6 >> 2;
    r10 = r8 >> 2;
    heapClassInst.heap32[(fp + (-60))] = heapClassInst.heap32[(r9 + 1)];
    heapClassInst.heap32[(r10 + 1)] = heapClassInst.heap32[(r9 + 5)];
    heapClassInst.heap32[(r10 + 2)] = heapClassInst.heap32[(r9 + 9)];
    heapClassInst.heap32[(r10 + 3)] = 0;
    heapClassInst.heap32[(r10 + 4)] = heapClassInst.heap32[(r9 + 2)];
    heapClassInst.heap32[(r10 + 5)] = heapClassInst.heap32[(r9 + 6)];
    heapClassInst.heap32[(r10 + 6)] = heapClassInst.heap32[(r9 + 10)];
    heapClassInst.heap32[(r10 + 7)] = 0;
    heapClassInst.heap32[(r10 + 8)] = heapClassInst.heap32[(r9 + 3)];
    heapClassInst.heap32[(r10 + 9)] = heapClassInst.heap32[(r9 + 7)];
    heapClassInst.heap32[(r10 + 10)] = heapClassInst.heap32[(r9 + 11)];
    heapClassInst.heap32[(r10 + 11)] = 0;
    r9 = (r0 + 288) | 0;
    r2 = (r2 + 388) | 0;
    r6 = (r6 + 388) | 0;
    heapClassInst.heap32[(g0)] = Int32(r9);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    heapClassInst.heap32[(g0 + 2)] = Int32(r7);
    heapClassInst.heap32[(g0 + 3)] = Int32(r8);
    heapClassInst.heap32[(g0 + 4)] = Int32(r2);
    heapClassInst.heap32[(g0 + 5)] = Int32(r6);
    _ZN15btJacobianEntryC2ERK9btVector3RK11btMatrix3x3S5_S2_S2_(i7);
    r2 = Int64(heapClassInst.heap32[(r1 + 5)]);
    r3 = sp + (-192);
    r6 = r2 >> 2;
    r7 = r3 >> 2;
    heapClassInst.heap32[(fp + (-48))] = heapClassInst.heap32[(r6 + 1)];
    heapClassInst.heap32[(r7 + 1)] = heapClassInst.heap32[(r6 + 5)];
    heapClassInst.heap32[(r7 + 2)] = heapClassInst.heap32[(r6 + 9)];
    heapClassInst.heap32[(r7 + 3)] = 0;
    heapClassInst.heap32[(r7 + 4)] = heapClassInst.heap32[(r6 + 2)];
    heapClassInst.heap32[(r7 + 5)] = heapClassInst.heap32[(r6 + 6)];
    heapClassInst.heap32[(r7 + 6)] = heapClassInst.heap32[(r6 + 10)];
    heapClassInst.heap32[(r7 + 7)] = 0;
    heapClassInst.heap32[(r7 + 8)] = heapClassInst.heap32[(r6 + 3)];
    heapClassInst.heap32[(r7 + 9)] = heapClassInst.heap32[(r6 + 7)];
    heapClassInst.heap32[(r7 + 10)] = heapClassInst.heap32[(r6 + 11)];
    heapClassInst.heap32[(r7 + 11)] = 0;
    r6 = Int64(heapClassInst.heap32[(r1 + 6)]);
    r7 = sp + (-144);
    r8 = r6 >> 2;
    r9 = r7 >> 2;
    heapClassInst.heap32[(fp + (-36))] = heapClassInst.heap32[(r8 + 1)];
    heapClassInst.heap32[(r9 + 1)] = heapClassInst.heap32[(r8 + 5)];
    heapClassInst.heap32[(r9 + 2)] = heapClassInst.heap32[(r8 + 9)];
    heapClassInst.heap32[(r9 + 3)] = 0;
    heapClassInst.heap32[(r9 + 4)] = heapClassInst.heap32[(r8 + 2)];
    heapClassInst.heap32[(r9 + 5)] = heapClassInst.heap32[(r8 + 6)];
    heapClassInst.heap32[(r9 + 6)] = heapClassInst.heap32[(r8 + 10)];
    heapClassInst.heap32[(r9 + 7)] = 0;
    heapClassInst.heap32[(r9 + 8)] = heapClassInst.heap32[(r8 + 3)];
    heapClassInst.heap32[(r9 + 9)] = heapClassInst.heap32[(r8 + 7)];
    heapClassInst.heap32[(r9 + 10)] = heapClassInst.heap32[(r8 + 11)];
    heapClassInst.heap32[(r9 + 11)] = 0;
    r8 = (r0 + 372) | 0;
    r2 = (r2 + 388) | 0;
    r6 = (r6 + 388) | 0;
    heapClassInst.heap32[(g0)] = Int32(r8);
    heapClassInst.heap32[(g0 + 1)] = Int32(r5);
    heapClassInst.heap32[(g0 + 2)] = Int32(r3);
    heapClassInst.heap32[(g0 + 3)] = Int32(r7);
    heapClassInst.heap32[(g0 + 4)] = Int32(r2);
    heapClassInst.heap32[(g0 + 5)] = Int32(r6);
    _ZN15btJacobianEntryC2ERK9btVector3RK11btMatrix3x3S5_S2_S2_(i7);
    r2 = Int64(heapClassInst.heap32[(r1 + 5)]);
    r3 = sp + (-96);
    r5 = r2 >> 2;
    r6 = r3 >> 2;
    heapClassInst.heap32[(fp + (-24))] = heapClassInst.heap32[(r5 + 1)];
    heapClassInst.heap32[(r6 + 1)] = heapClassInst.heap32[(r5 + 5)];
    heapClassInst.heap32[(r6 + 2)] = heapClassInst.heap32[(r5 + 9)];
    heapClassInst.heap32[(r6 + 3)] = 0;
    heapClassInst.heap32[(r6 + 4)] = heapClassInst.heap32[(r5 + 2)];
    heapClassInst.heap32[(r6 + 5)] = heapClassInst.heap32[(r5 + 6)];
    heapClassInst.heap32[(r6 + 6)] = heapClassInst.heap32[(r5 + 10)];
    heapClassInst.heap32[(r6 + 7)] = 0;
    heapClassInst.heap32[(r6 + 8)] = heapClassInst.heap32[(r5 + 3)];
    heapClassInst.heap32[(r6 + 9)] = heapClassInst.heap32[(r5 + 7)];
    heapClassInst.heap32[(r6 + 10)] = heapClassInst.heap32[(r5 + 11)];
    heapClassInst.heap32[(r6 + 11)] = 0;
    r5 = Int64(heapClassInst.heap32[(r1 + 6)]);
    r6 = sp + (-48);
    r7 = r5 >> 2;
    r8 = r6 >> 2;
    heapClassInst.heap32[(fp + (-12))] = heapClassInst.heap32[(r7 + 1)];
    heapClassInst.heap32[(r8 + 1)] = heapClassInst.heap32[(r7 + 5)];
    heapClassInst.heap32[(r8 + 2)] = heapClassInst.heap32[(r7 + 9)];
    heapClassInst.heap32[(r8 + 3)] = 0;
    heapClassInst.heap32[(r8 + 4)] = heapClassInst.heap32[(r7 + 2)];
    heapClassInst.heap32[(r8 + 5)] = heapClassInst.heap32[(r7 + 6)];
    heapClassInst.heap32[(r8 + 6)] = heapClassInst.heap32[(r7 + 10)];
    heapClassInst.heap32[(r8 + 7)] = 0;
    heapClassInst.heap32[(r8 + 8)] = heapClassInst.heap32[(r7 + 3)];
    heapClassInst.heap32[(r8 + 9)] = heapClassInst.heap32[(r7 + 7)];
    heapClassInst.heap32[(r8 + 10)] = heapClassInst.heap32[(r7 + 11)];
    heapClassInst.heap32[(r8 + 11)] = 0;
    r7 = (r0 + 456) | 0;
    r2 = (r2 + 388) | 0;
    r5 = (r5 + 388) | 0;
    heapClassInst.heap32[(g0)] = Int32(r7);
    heapClassInst.heap32[(g0 + 1)] = Int32(r4);
    heapClassInst.heap32[(g0 + 2)] = Int32(r3);
    heapClassInst.heap32[(g0 + 3)] = Int32(r6);
    heapClassInst.heap32[(g0 + 4)] = Int32(r2);
    heapClassInst.heap32[(g0 + 5)] = Int32(r5);
    _ZN15btJacobianEntryC2ERK9btVector3RK11btMatrix3x3S5_S2_S2_(i7);
    heapClassInst.heap32[(r1 + 177)] = 0;
    r2 = Int64(heapClassInst.heap32[(r1 + 6)]);
    r3 = Int64(heapClassInst.heap32[(r1 + 5)]);
    r3 = (r3 + 4) | 0;
    r2 = (r2 + 4) | 0;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    heapClassInst.heap32[(g0 + 2)] = Int32(r2);
    _ZN17btHingeConstraint13getHingeAngleERK11btTransformS2_(i7);
    f0 = commonVariable.f_g0;
    heapClassInst.heapFloat[(r1 + 178)] = Float32(f0);
    heapClassInst.heap32[(r1 + 176)] = 0;
    r2 = 0;
    heapClassInst.heap32[(r1 + 175)] = 0;
    heapClassInst.heap8[r0 + 722] = Int8(r2);
    f1 = Float64(heapClassInst.heapFloat[(r1 + 172)]);
    f2 = Float64(heapClassInst.heapFloat[(r1 + 173)]);
    if (!(f1 > f2)) 
    {
      heapClassInst.heapFloat[(g0)] = Float32(f0);
      heapClassInst.heapFloat[(g0 + 1)] = Float32(f1);
      heapClassInst.heapFloat[(g0 + 2)] = Float32(f2);
      _Z21btAdjustAngleToLimitsfff(i7);
      f0 = commonVariable.f_g0;
      heapClassInst.heapFloat[(r1 + 178)] = Float32(f0);
      f1 = Float64(heapClassInst.heapFloat[(r1 + 172)]);
      if (f0 > f1) 
      {
        f1 = Float64(heapClassInst.heapFloat[(r1 + 173)]);
        if (!(f0 < f1)) 
        {
          f0 = f1 - f0;
          heapClassInst.heapFloat[(r1 + 176)] = Float32(f0);
          r2 = 1;
          heapClassInst.heap32[(r1 + 175)] = ( -1082130432);
          heapClassInst.heap8[r0 + 722] = Int8(r2);
        }
      }
      else {
        f0 = f1 - f0;
        heapClassInst.heapFloat[(r1 + 176)] = Float32(f0);
        r2 = 1;
        heapClassInst.heap32[(r1 + 175)] = 1065353216;
        heapClassInst.heap8[r0 + 722] = Int8(r2);
      }
    }
    r0 = Int64(heapClassInst.heap32[(r1 + 5)]);
    r0 = r0 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r1 + 137)]);
    f1 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
    f2 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
    f3 = Float64(heapClassInst.heapFloat[(r1 + 141)]);
    f4 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
    f5 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
    f6 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
    f7 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
    r2 = Int64(heapClassInst.heap32[(r1 + 6)]);
    f2 = f2 * f0;
    f5 = f5 * f3;
    f1 = f1 * f0;
    f4 = f4 * f3;
    f8 = Float64(heapClassInst.heapFloat[(r1 + 145)]);
    f9 = Float64(heapClassInst.heapFloat[(r0 + 7)]);
    f10 = Float64(heapClassInst.heapFloat[(r0 + 3)]);
    r2 = r2 >> 2;
    f11 = Float64(heapClassInst.heapFloat[(r0 + 11)]);
    f0 = f6 * f0;
    f3 = f7 * f3;
    f2 = f2 + f5;
    f5 = f10 * f8;
    f1 = f1 + f4;
    f4 = f9 * f8;
    f0 = f0 + f3;
    f3 = f11 * f8;
    f2 = f2 + f5;
    f5 = Float64(heapClassInst.heapFloat[(r0 + 65)]);
    f6 = Float64(heapClassInst.heapFloat[(r0 + 64)]);
    f7 = Float64(heapClassInst.heapFloat[(r2 + 65)]);
    f8 = Float64(heapClassInst.heapFloat[(r2 + 64)]);
    f1 = f1 + f4;
    f4 = Float64(heapClassInst.heapFloat[(r0 + 69)]);
    f9 = Float64(heapClassInst.heapFloat[(r0 + 68)]);
    f10 = Float64(heapClassInst.heapFloat[(r2 + 69)]);
    f11 = Float64(heapClassInst.heapFloat[(r2 + 68)]);
    f12 = Float64(heapClassInst.heapFloat[(r0 + 66)]);
    f13 = Float64(heapClassInst.heapFloat[(r0 + 70)]);
    f14 = Float64(heapClassInst.heapFloat[(r2 + 66)]);
    f15 = Float64(heapClassInst.heapFloat[(r2 + 70)]);
    f6 = f6 * f2;
    f9 = f9 * f1;
    f5 = f5 * f2;
    f4 = f4 * f1;
    f8 = f8 * f2;
    f11 = f11 * f1;
    f7 = f7 * f2;
    f10 = f10 * f1;
    f0 = f0 + f3;
    f3 = Float64(heapClassInst.heapFloat[(r0 + 73)]);
    f16 = Float64(heapClassInst.heapFloat[(r0 + 72)]);
    f17 = Float64(heapClassInst.heapFloat[(r2 + 73)]);
    f18 = Float64(heapClassInst.heapFloat[(r2 + 72)]);
    f19 = Float64(heapClassInst.heapFloat[(r0 + 74)]);
    f20 = Float64(heapClassInst.heapFloat[(r2 + 74)]);
    f6 = f6 + f9;
    f9 = f16 * f0;
    f4 = f5 + f4;
    f3 = f3 * f0;
    f5 = f12 * f2;
    f12 = f13 * f1;
    f8 = f8 + f11;
    f11 = f18 * f0;
    f7 = f7 + f10;
    f10 = f17 * f0;
    f13 = f14 * f2;
    f14 = f15 * f1;
    f6 = f6 + f9;
    f3 = f4 + f3;
    f4 = f8 + f11;
    f7 = f7 + f10;
    f5 = f5 + f12;
    f8 = f19 * f0;
    f9 = f13 + f14;
    f10 = f20 * f0;
    f5 = f5 + f8;
    f8 = f9 + f10;
    f6 = f2 * f6;
    f3 = f1 * f3;
    f2 = f2 * f4;
    f1 = f1 * f7;
    f3 = f6 + f3;
    f4 = f0 * f5;
    f1 = f2 + f1;
    f0 = f0 * f8;
    f2 = f3 + f4;
    f0 = f1 + f0;
    f1 = 1.0
    f0 = f2 + f0;
    f0 = f1 / f0;
    heapClassInst.heapFloat[(r1 + 174)] = Float32(f0);
  }
  return;
}

@OverflowWrapping
func _ZN17btHingeConstraint8getInfo1EPN17btTypedConstraint17btConstraintInfo1E(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var f0: Float64 = 0.0
  var f1: Float64 = 0.0
  var f2: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = Int64(heapClassInst.heapU8[r0 + 723]);
  if (r2 == 0) 
  {
    r1 = r1 >> 2;
    heapClassInst.heap32[(r1)] = 5;
    heapClassInst.heap32[(r1 + 1)] = 1;
    r2 = r0 >> 2;
    r3 = Int64(heapClassInst.heap32[(r2 + 6)]);
    r4 = Int64(heapClassInst.heap32[(r2 + 5)]);
    r4 = (r4 + 4) | 0;
    r3 = (r3 + 4) | 0;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r4);
    heapClassInst.heap32[(g0 + 2)] = Int32(r3);
    _ZN17btHingeConstraint13getHingeAngleERK11btTransformS2_(i7);
    f0 = commonVariable.f_g0;
    heapClassInst.heapFloat[(r2 + 178)] = Float32(f0);
    heapClassInst.heap32[(r2 + 176)] = 0;
    r3 = 0;
    heapClassInst.heap32[(r2 + 175)] = 0;
    heapClassInst.heap8[r0 + 722] = Int8(r3);
    f1 = Float64(heapClassInst.heapFloat[(r2 + 172)]);
    f2 = Float64(heapClassInst.heapFloat[(r2 + 173)]);
    if (f1 > f2) 
    {
      __label__ = 8;
    }
    else {
      heapClassInst.heapFloat[(g0)] = Float32(f0);
      heapClassInst.heapFloat[(g0 + 1)] = Float32(f1);
      heapClassInst.heapFloat[(g0 + 2)] = Float32(f2);
      _Z21btAdjustAngleToLimitsfff(i7);
      f0 = commonVariable.f_g0;
      heapClassInst.heapFloat[(r2 + 178)] = Float32(f0);
      f1 = Float64(heapClassInst.heapFloat[(r2 + 172)]);
      if (f0 > f1) 
      {
        f1 = Float64(heapClassInst.heapFloat[(r2 + 173)]);
        if (f0 < f1) 
        {
          r2 = Int64(heapClassInst.heapU8[r0 + 722]);
          if (r2 != 0) 
          {
            __label__ = 10;
          }
          else {
            __label__ = 8;
          }
        }
        else {
          f0 = f1 - f0;
          heapClassInst.heapFloat[(r2 + 176)] = Float32(f0);
          r3 = 1;
          heapClassInst.heap32[(r2 + 175)] = ( -1082130432);
          heapClassInst.heap8[r0 + 722] = Int8(r3);
          __label__ = 10;
        }
      }
      else {
        f0 = f1 - f0;
        heapClassInst.heapFloat[(r2 + 176)] = Float32(f0);
        r3 = 1;
        heapClassInst.heap32[(r2 + 175)] = 1065353216;
        heapClassInst.heap8[r0 + 722] = Int8(r3);
        __label__ = 10;
      }
    }
    if (__label__ == 8) {
      r0 = Int64(heapClassInst.heapU8[r0 + 721]);
      if (!(r0 != 0)) 
      {
        return;
      }
    }
    r0 = Int64(heapClassInst.heap32[(r1)]);
    r0 = (r0 + 1) | 0;
    heapClassInst.heap32[(r1)] = Int32(r0);
    r0 = Int64(heapClassInst.heap32[(r1 + 1)]);
    r0 = (r0 + (-1)) | 0;
    heapClassInst.heap32[(r1 + 1)] = Int32(r0);
    return;
  }
  else {
    r0 = r1 >> 2;
    heapClassInst.heap32[(r0)] = 0;
    heapClassInst.heap32[(r0 + 1)] = 0;
    return;
  }
}

@OverflowWrapping
func _ZN17btHingeConstraint8getInfo2EPN17btTypedConstraint17btConstraintInfo2E(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
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
  i7 = sp + (-136); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  r3 = Int64(heapClassInst.heap32[(r1 + 6)]);
  r4 = Int64(heapClassInst.heap32[(r1 + 5)]);
  r5 = Int64(heapClassInst.heapU8[r0 + 723]);
  r6 = Int64(heapClassInst.heapU8[r0 + 724]);
  do {
    if (r6 == 0) 
    {
      r5 = r5 & 255;
      if (r5 == 0) 
      {
        r4 = r4 >> 2;
        r3 = r3 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r1 + 147)]);
        f1 = Float64(heapClassInst.heapFloat[(r4 + 9)]);
        f2 = Float64(heapClassInst.heapFloat[(r4 + 5)]);
        f3 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
        f4 = Float64(heapClassInst.heapFloat[(r1 + 148)]);
        f5 = Float64(heapClassInst.heapFloat[(r4 + 10)]);
        f6 = Float64(heapClassInst.heapFloat[(r4 + 6)]);
        f7 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
        f8 = Float64(heapClassInst.heapFloat[(r1 + 163)]);
        f9 = Float64(heapClassInst.heapFloat[(r3 + 9)]);
        heapClassInst.heapFloat[(fp + (-3))] = Float32(f9);
        f10 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
        heapClassInst.heapFloat[(fp + (-2))] = Float32(f10);
        f11 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
        heapClassInst.heapFloat[(fp + (-1))] = Float32(f11);
        f12 = Float64(heapClassInst.heapFloat[(r1 + 164)]);
        f13 = Float64(heapClassInst.heapFloat[(r3 + 10)]);
        f14 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
        f9 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
        heapClassInst.heapFloat[(fp + (-7))] = Float32(f9);
        f10 = Float64(heapClassInst.heapFloat[(r1 + 137)]);
        f11 = Float64(heapClassInst.heapFloat[(r1 + 141)]);
        f15 = Float64(heapClassInst.heapFloat[(r1 + 136)]);
        f16 = Float64(heapClassInst.heapFloat[(r1 + 140)]);
        f17 = Float64(heapClassInst.heapFloat[(r1 + 135)]);
        f18 = Float64(heapClassInst.heapFloat[(r1 + 139)]);
        f19 = Float64(heapClassInst.heapFloat[(r1 + 153)]);
        f20 = Float64(heapClassInst.heapFloat[(r1 + 157)]);
        f21 = f1 * f0;
        f22 = f5 * f4;
        f23 = f2 * f0;
        f24 = f6 * f4;
        f0 = f3 * f0;
        f4 = f7 * f4;
        f25 = Float64(heapClassInst.heapFloat[(r1 + 149)]);
        f26 = Float64(heapClassInst.heapFloat[(r4 + 11)]);
        f27 = Float64(heapClassInst.heapFloat[(r4 + 7)]);
        f28 = Float64(heapClassInst.heapFloat[(r4 + 3)]);
        f9 = Float64(heapClassInst.heapFloat[(fp + (-3))]);
        f29 = f9 * f8;
        heapClassInst.heapFloat[(fp + (-8))] = Float32(f29);
        f30 = f13 * f12;
        heapClassInst.heapFloat[(fp + (-10))] = Float32(f30);
        f9 = Float64(heapClassInst.heapFloat[(fp + (-2))]);
        f9 = f9 * f8;
        heapClassInst.heapFloat[(fp + (-9))] = Float32(f9);
        f9 = f14 * f12;
        heapClassInst.heapFloat[(fp + (-12))] = Float32(f9);
        f9 = Float64(heapClassInst.heapFloat[(fp + (-1))]);
        f8 = f9 * f8;
        heapClassInst.heapFloat[(fp + (-11))] = Float32(f8);
        f9 = Float64(heapClassInst.heapFloat[(fp + (-7))]);
        f12 = f9 * f12;
        heapClassInst.heapFloat[(fp + (-13))] = Float32(f12);
        f8 = Float64(heapClassInst.heapFloat[(r1 + 165)]);
        f9 = Float64(heapClassInst.heapFloat[(r3 + 11)]);
        heapClassInst.heapFloat[(fp + (-4))] = Float32(f9);
        f9 = Float64(heapClassInst.heapFloat[(r3 + 7)]);
        heapClassInst.heapFloat[(fp + (-6))] = Float32(f9);
        f9 = Float64(heapClassInst.heapFloat[(r3 + 3)]);
        heapClassInst.heapFloat[(fp + (-5))] = Float32(f9);
        f9 = Float64(heapClassInst.heapFloat[(r1 + 145)]);
        f12 = Float64(heapClassInst.heapFloat[(r1 + 144)]);
        f29 = Float64(heapClassInst.heapFloat[(r1 + 143)]);
        f30 = Float64(heapClassInst.heapFloat[(r1 + 161)]);
        f21 = f21 + f22;
        heapClassInst.heapFloat[(fp + (-15))] = Float32(f21);
        f22 = f26 * f25;
        f21 = f23 + f24;
        heapClassInst.heapFloat[(fp + (-16))] = Float32(f21);
        f23 = f27 * f25;
        f0 = f0 + f4;
        heapClassInst.heapFloat[(fp + (-14))] = Float32(f0);
        f0 = f28 * f25;
        heapClassInst.heapFloat[(fp + (-23))] = Float32(f0);
        f0 = f10 * f1;
        heapClassInst.heapFloat[(fp + (-24))] = Float32(f0);
        f4 = f11 * f5;
        f21 = f15 * f1;
        heapClassInst.heapFloat[(fp + (-18))] = Float32(f21);
        f24 = f16 * f5;
        f1 = f17 * f1;
        heapClassInst.heapFloat[(fp + (-20))] = Float32(f1);
        f5 = f18 * f5;
        f25 = f10 * f2;
        heapClassInst.heapFloat[(fp + (-17))] = Float32(f25);
        f0 = f11 * f6;
        f1 = f15 * f2;
        heapClassInst.heapFloat[(fp + (-19))] = Float32(f1);
        f1 = f16 * f6;
        heapClassInst.heapFloat[(fp + (-28))] = Float32(f1);
        f2 = f17 * f2;
        heapClassInst.heapFloat[(fp + (-21))] = Float32(f2);
        f1 = f18 * f6;
        heapClassInst.heapFloat[(fp + (-29))] = Float32(f1);
        f2 = f10 * f3;
        heapClassInst.heapFloat[(fp + (-25))] = Float32(f2);
        f6 = f11 * f7;
        f10 = f15 * f3;
        heapClassInst.heapFloat[(fp + (-26))] = Float32(f10);
        f11 = f16 * f7;
        f3 = f17 * f3;
        heapClassInst.heapFloat[(fp + (-22))] = Float32(f3);
        f7 = f18 * f7;
        f15 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
        f16 = Float64(heapClassInst.heapFloat[(fp + (-10))]);
        f15 = f15 + f16;
        heapClassInst.heapFloat[(fp + (-27))] = Float32(f15);
        f16 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
        f17 = f16 * f8;
        f18 = Float64(heapClassInst.heapFloat[(fp + (-9))]);
        f21 = Float64(heapClassInst.heapFloat[(fp + (-12))]);
        f18 = f18 + f21;
        heapClassInst.heapFloat[(fp + (-8))] = Float32(f18);
        f21 = Float64(heapClassInst.heapFloat[(fp + (-6))]);
        f25 = f21 * f8;
        f1 = Float64(heapClassInst.heapFloat[(fp + (-11))]);
        f2 = Float64(heapClassInst.heapFloat[(fp + (-13))]);
        f1 = f1 + f2;
        heapClassInst.heapFloat[(fp + (-9))] = Float32(f1);
        f2 = Float64(heapClassInst.heapFloat[(fp + (-5))]);
        f1 = f2 * f8;
        heapClassInst.heapFloat[(fp + (-11))] = Float32(f1);
        f2 = Float64(heapClassInst.heapFloat[(fp + (-3))]);
        f2 = f19 * f2;
        heapClassInst.heapFloat[(fp + (-3))] = Float32(f2);
        f1 = f20 * f13;
        heapClassInst.heapFloat[(fp + (-12))] = Float32(f1);
        f2 = Float64(heapClassInst.heapFloat[(fp + (-2))]);
        f2 = f19 * f2;
        heapClassInst.heapFloat[(fp + (-10))] = Float32(f2);
        f1 = f20 * f14;
        heapClassInst.heapFloat[(fp + (-13))] = Float32(f1);
        f2 = Float64(heapClassInst.heapFloat[(fp + (-1))]);
        f2 = f19 * f2;
        heapClassInst.heapFloat[(fp + (-2))] = Float32(f2);
        f3 = Float64(heapClassInst.heapFloat[(fp + (-7))]);
        f1 = f20 * f3;
        heapClassInst.heapFloat[(fp + (-30))] = Float32(f1);
        r5 = r2 >> 2;
        f2 = Float64(heapClassInst.heapFloat[(r4 + 15)]);
        f3 = Float64(heapClassInst.heapFloat[(fp + (-15))]);
        f3 = f3 + f22;
        heapClassInst.heapFloat[(fp + (-7))] = Float32(f3);
        f8 = Float64(heapClassInst.heapFloat[(r4 + 14)]);
        f10 = Float64(heapClassInst.heapFloat[(fp + (-16))]);
        f1 = f10 + f23;
        heapClassInst.heapFloat[(fp + (-15))] = Float32(f1);
        f1 = Float64(heapClassInst.heapFloat[(r4 + 13)]);
        heapClassInst.heapFloat[(fp + (-1))] = Float32(f1);
        f3 = Float64(heapClassInst.heapFloat[(fp + (-14))]);
        f10 = Float64(heapClassInst.heapFloat[(fp + (-23))]);
        f3 = f3 + f10;
        heapClassInst.heapFloat[(fp + (-16))] = Float32(f3);
        f10 = Float64(heapClassInst.heapFloat[(fp + (-24))]);
        f4 = f10 + f4;
        heapClassInst.heapFloat[(fp + (-14))] = Float32(f4);
        f1 = f9 * f26;
        heapClassInst.heapFloat[(fp + (-23))] = Float32(f1);
        f3 = Float64(heapClassInst.heapFloat[(fp + (-18))]);
        f1 = f3 + f24;
        heapClassInst.heapFloat[(fp + (-18))] = Float32(f1);
        f3 = f12 * f26;
        f4 = Float64(heapClassInst.heapFloat[(fp + (-20))]);
        f4 = f4 + f5;
        f5 = f29 * f26;
        f10 = Float64(heapClassInst.heapFloat[(fp + (-17))]);
        f0 = f10 + f0;
        f10 = f9 * f27;
        f13 = Float64(heapClassInst.heapFloat[(fp + (-19))]);
        f14 = Float64(heapClassInst.heapFloat[(fp + (-28))]);
        f13 = f13 + f14;
        f14 = f12 * f27;
        f15 = Float64(heapClassInst.heapFloat[(fp + (-21))]);
        f16 = Float64(heapClassInst.heapFloat[(fp + (-29))]);
        f15 = f15 + f16;
        f16 = f29 * f27;
        f18 = Float64(heapClassInst.heapFloat[(fp + (-25))]);
        f6 = f18 + f6;
        f9 = f9 * f28;
        f18 = Float64(heapClassInst.heapFloat[(fp + (-26))]);
        f11 = f18 + f11;
        f12 = f12 * f28;
        f18 = Float64(heapClassInst.heapFloat[(fp + (-22))]);
        f7 = f18 + f7;
        f18 = f29 * f28;
        f19 = Float64(heapClassInst.heapFloat[(fp + (-27))]);
        f17 = f19 + f17;
        f19 = Float64(heapClassInst.heapFloat[(r3 + 15)]);
        f20 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
        f20 = f20 + f25;
        f21 = Float64(heapClassInst.heapFloat[(r3 + 14)]);
        f22 = Float64(heapClassInst.heapFloat[(fp + (-9))]);
        f23 = Float64(heapClassInst.heapFloat[(fp + (-11))]);
        f22 = f22 + f23;
        f23 = Float64(heapClassInst.heapFloat[(r3 + 13)]);
        f24 = Float64(heapClassInst.heapFloat[(fp + (-3))]);
        f25 = Float64(heapClassInst.heapFloat[(fp + (-12))]);
        f24 = f24 + f25;
        f25 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
        f25 = f30 * f25;
        f26 = Float64(heapClassInst.heapFloat[(fp + (-10))]);
        f27 = Float64(heapClassInst.heapFloat[(fp + (-13))]);
        f26 = f26 + f27;
        f27 = Float64(heapClassInst.heapFloat[(fp + (-6))]);
        f27 = f30 * f27;
        f28 = Float64(heapClassInst.heapFloat[(fp + (-2))]);
        f29 = Float64(heapClassInst.heapFloat[(fp + (-30))]);
        f28 = f28 + f29;
        f29 = Float64(heapClassInst.heapFloat[(fp + (-5))]);
        f29 = f30 * f29;
        r6 = Int64(heapClassInst.heap32[(r5 + 6)]);
        f30 = Float64(heapClassInst.heapFloat[(fp + (-7))]);
        f30 = f30 + f2;
        heapClassInst.heapFloat[(fp + (-2))] = Float32(f30);
        f30 = Float64(heapClassInst.heapFloat[(fp + (-15))]);
        f30 = f30 + f8;
        heapClassInst.heapFloat[(fp + (-3))] = Float32(f30);
        f30 = Float64(heapClassInst.heapFloat[(fp + (-16))]);
        f1 = Float64(heapClassInst.heapFloat[(fp + (-1))]);
        f1 = f30 + f1;
        heapClassInst.heapFloat[(fp + (-4))] = Float32(f1);
        f1 = Float64(heapClassInst.heapFloat[(fp + (-14))]);
        f30 = Float64(heapClassInst.heapFloat[(fp + (-23))]);
        f1 = f1 + f30;
        f30 = Float64(heapClassInst.heapFloat[(fp + (-18))]);
        f3 = f30 + f3;
        f4 = f4 + f5;
        f0 = f0 + f10;
        f5 = f13 + f14;
        f10 = f15 + f16;
        f6 = f6 + f9;
        f9 = f11 + f12;
        f7 = f7 + f18;
        f11 = f17 + f19;
        f12 = f20 + f21;
        f13 = f22 + f23;
        f14 = f24 + f25;
        f15 = f26 + f27;
        f16 = f28 + f29;
        r7 = Int64(heapClassInst.heapU8[r0 + 720]);
        if (r7 == 0) 
        {
          r7 = Int64(heapClassInst.heap32[(r5 + 2)]);
          r7 = r7 >> 2;
          heapClassInst.heap32[(r7)] = 1065353216;
          r7 = r6 << 2;
          r8 = Int64(heapClassInst.heap32[(r5 + 2)]);
          r7 = (r7 + r8) | 0;
          r7 = r7 >> 2;
          heapClassInst.heap32[(r7 + 1)] = 1065353216;
          r7 = r6 << 3;
          r8 = Int64(heapClassInst.heap32[(r5 + 2)]);
          r7 = (r7 + r8) | 0;
          r7 = r7 >> 2;
          heapClassInst.heap32[(r7 + 2)] = 1065353216;
          f2 = Float64(heapClassInst.heapFloat[(r4 + 15)]);
          f8 = Float64(heapClassInst.heapFloat[(r4 + 14)]);
          f17 = Float64(heapClassInst.heapFloat[(r4 + 13)]);
          heapClassInst.heapFloat[(fp + (-1))] = Float32(f17);
        }
        r7 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r8 = r7 >> 2;
        f17 = Float64(heapClassInst.heapFloat[(fp + (-3))]);
        f8 = f17 - f8;
        f17 = Float64(heapClassInst.heapFloat[(fp + (-2))]);
        f2 = f17 - f2;
        heapClassInst.heap32[(r8)] = 0;
        r9 = (r6 + 1) | 0;
        r10 = r6 << 2;
        f17 = -f8;
        heapClassInst.heapFloat[(r8 + 1)] = Float32(f2);
        r11 = (r6 + 2) | 0;
        r9 = r9 << 2;
        r12 = (r7 + r10) | 0;
        heapClassInst.heapFloat[(r8 + 2)] = Float32(f17);
        r13 = (r6 + 3) | 0;
        r11 = r11 << 2;
        r14 = (r7 + r9) | 0;
        r12 = r12 >> 2;
        f2 = -f2;
        heapClassInst.heap32[(r8 + 3)] = 0;
        r8 = r13 << 2;
        r13 = (r7 + r11) | 0;
        r14 = r14 >> 2;
        heapClassInst.heapFloat[(r12)] = Float32(f2);
        r12 = r6 << 3;
        r15 = (r7 + r8) | 0;
        f17 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
        f2 = Float64(heapClassInst.heapFloat[(fp + (-1))]);
        f2 = f17 - f2;
        r13 = r13 >> 2;
        heapClassInst.heap32[(r14)] = 0;
        r14 = r12 | 4;
        r16 = (r7 + r12) | 0;
        r15 = r15 >> 2;
        heapClassInst.heapFloat[(r13)] = Float32(f2);
        r13 = (r12 + 8) | 0;
        r17 = (r7 + r14) | 0;
        r16 = r16 >> 2;
        heapClassInst.heap32[(r15)] = 0;
        r15 = (r12 + 12) | 0;
        r18 = (r7 + r13) | 0;
        r17 = r17 >> 2;
        f2 = -f2;
        heapClassInst.heapFloat[(r16)] = Float32(f8);
        r7 = (r7 + r15) | 0;
        r16 = r18 >> 2;
        heapClassInst.heapFloat[(r17)] = Float32(f2);
        r7 = r7 >> 2;
        heapClassInst.heap32[(r16)] = 0;
        heapClassInst.heap32[(r7)] = 0;
        r7 = Int64(heapClassInst.heap32[(r5 + 5)]);
        f2 = Float64(heapClassInst.heapFloat[(r3 + 15)]);
        f8 = Float64(heapClassInst.heapFloat[(r3 + 14)]);
        f17 = Float64(heapClassInst.heapFloat[(r3 + 13)]);
        f2 = f11 - f2;
        r16 = r7 >> 2;
        f18 = -f2;
        heapClassInst.heap32[(r16)] = 0;
        f8 = f12 - f8;
        heapClassInst.heapFloat[(r16 + 1)] = Float32(f18);
        r17 = (r7 + r10) | 0;
        heapClassInst.heapFloat[(r16 + 2)] = Float32(f8);
        r9 = (r7 + r9) | 0;
        r17 = r17 >> 2;
        heapClassInst.heap32[(r16 + 3)] = 0;
        f17 = f13 - f17;
        r11 = (r7 + r11) | 0;
        r9 = r9 >> 2;
        heapClassInst.heapFloat[(r17)] = Float32(f2);
        r8 = (r7 + r8) | 0;
        r11 = r11 >> 2;
        f2 = -f17;
        heapClassInst.heap32[(r9)] = 0;
        r9 = (r7 + r12) | 0;
        r8 = r8 >> 2;
        heapClassInst.heapFloat[(r11)] = Float32(f2);
        r11 = (r7 + r14) | 0;
        r9 = r9 >> 2;
        f2 = -f8;
        heapClassInst.heap32[(r8)] = 0;
        r8 = (r7 + r13) | 0;
        r11 = r11 >> 2;
        heapClassInst.heapFloat[(r9)] = Float32(f2);
        r7 = (r7 + r15) | 0;
        r8 = r8 >> 2;
        heapClassInst.heapFloat[(r11)] = Float32(f17);
        r7 = r7 >> 2;
        heapClassInst.heap32[(r8)] = 0;
        heapClassInst.heap32[(r7)] = 0;
        f2 = Float64(heapClassInst.heapFloat[(r5)]);
        f8 = Float64(heapClassInst.heapFloat[(r5 + 1)]);
        f2 = f2 * f8;
        r7 = Int64(heapClassInst.heapU8[r0 + 720]);
        if (!(r7 != 0)) 
        {
          r6 = r6 << 1;
          r7 = Int64(heapClassInst.heap32[(r5 + 7)]);
          f8 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
          f8 = f13 - f8;
          r7 = r7 >> 2;
          f8 = f8 * f2;
          heapClassInst.heapFloat[(r7)] = Float32(f8);
          r7 = Int64(heapClassInst.heap32[(r5 + 7)]);
          r7 = (r7 + r10) | 0;
          f8 = Float64(heapClassInst.heapFloat[(fp + (-3))]);
          f8 = f12 - f8;
          r7 = r7 >> 2;
          f8 = f8 * f2;
          heapClassInst.heapFloat[(r7)] = Float32(f8);
          r6 = r6 << 2;
          r7 = Int64(heapClassInst.heap32[(r5 + 7)]);
          r6 = (r7 + r6) | 0;
          f8 = Float64(heapClassInst.heapFloat[(fp + (-2))]);
          f8 = f11 - f8;
          r6 = r6 >> 2;
          f8 = f8 * f2;
          heapClassInst.heapFloat[(r6)] = Float32(f8);
        }
        r2 = (r2 + 4) | 0;
        r6 = Int64(heapClassInst.heap32[(r5 + 6)]);
        r7 = (r6 * 3) | 0;
        r8 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r9 = r7 << 2;
        r8 = (r8 + r9) | 0;
        r8 = r8 >> 2;
        r10 = (r7 + 1) | 0;
        heapClassInst.heapFloat[(r8)] = Float32(f7);
        r8 = r10 << 2;
        r10 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r10 = (r10 + r8) | 0;
        r10 = r10 >> 2;
        r7 = (r7 + 2) | 0;
        heapClassInst.heapFloat[(r10)] = Float32(f10);
        r7 = r7 << 2;
        r10 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r10 = (r10 + r7) | 0;
        r10 = r10 >> 2;
        heapClassInst.heapFloat[(r10)] = Float32(f4);
        r6 = r6 << 4;
        r10 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r10 = (r10 + r6) | 0;
        r10 = r10 >> 2;
        heapClassInst.heapFloat[(r10)] = Float32(f9);
        r10 = r6 | 4;
        r11 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r11 = (r11 + r10) | 0;
        r11 = r11 >> 2;
        heapClassInst.heapFloat[(r11)] = Float32(f5);
        r11 = r6 | 8;
        r12 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r12 = (r12 + r11) | 0;
        r12 = r12 >> 2;
        heapClassInst.heapFloat[(r12)] = Float32(f3);
        r12 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r12 = (r12 + r9) | 0;
        r12 = r12 >> 2;
        f8 = -f7;
        heapClassInst.heapFloat[(r12)] = Float32(f8);
        r12 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r8 = (r12 + r8) | 0;
        r8 = r8 >> 2;
        f8 = -f10;
        heapClassInst.heapFloat[(r8)] = Float32(f8);
        r8 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r7 = (r8 + r7) | 0;
        r7 = r7 >> 2;
        f8 = -f4;
        heapClassInst.heapFloat[(r7)] = Float32(f8);
        r7 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r7 = (r7 + r6) | 0;
        r7 = r7 >> 2;
        f8 = -f9;
        heapClassInst.heapFloat[(r7)] = Float32(f8);
        r7 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r7 = (r7 + r10) | 0;
        r7 = r7 >> 2;
        f8 = -f5;
        heapClassInst.heapFloat[(r7)] = Float32(f8);
        r7 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r7 = (r7 + r11) | 0;
        f8 = f0 * f14;
        f11 = f1 * f15;
        f12 = f1 * f16;
        f13 = f6 * f14;
        f8 = f8 - f11;
        f11 = f12 - f13;
        f12 = f6 * f15;
        f13 = f0 * f16;
        r7 = r7 >> 2;
        f14 = -f3;
        f12 = f12 - f13;
        heapClassInst.heapFloat[(r7)] = Float32(f14);
        f7 = f8 * f7;
        f10 = f11 * f10;
        r7 = Int64(heapClassInst.heap32[(r5 + 7)]);
        f7 = f7 + f10;
        f4 = f12 * f4;
        r7 = (r7 + r9) | 0;
        f4 = f7 + f4;
        r7 = r7 >> 2;
        f4 = f4 * f2;
        heapClassInst.heapFloat[(r7)] = Float32(f4);
        f4 = f8 * f9;
        f5 = f11 * f5;
        r7 = Int64(heapClassInst.heap32[(r5 + 7)]);
        f4 = f4 + f5;
        f3 = f12 * f3;
        r6 = (r7 + r6) | 0;
        f3 = f4 + f3;
        r6 = r6 >> 2;
        f2 = f3 * f2;
        heapClassInst.heapFloat[(r6)] = Float32(f2);
        r6 = Int64(heapClassInst.heapU8[r0 + 722]);
        if (r6 != 0) 
        {
          f2 = Float64(heapClassInst.heapFloat[(r1 + 176)]);
          f3 = Float64(heapClassInst.heapFloat[(r1 + 179)]);
          f2 = f2 * f3;
          f3 = 0.0;
          r6 = 1;
          r7 = 2;
          r6 = if (f2 > f3) {r6} else {r7};
        }
        else {
          f2 = 0.0;
          r6 = 0;
        }
        r7 = Int64(heapClassInst.heapU8[r0 + 721]);
        r8 = 0;
        r9 = if (r7 != r8) {1} else {0};
        r9 = r9 & 1;
        r9 = r9 | r6;
        if (r9 == 0) 
        {
          __label__ = 54;
          break 
        }
        else {
          r9 = Int64(heapClassInst.heap32[(r5 + 6)]);
          r9 = (r9 * 5) | 0;
          r10 = Int64(heapClassInst.heap32[(r5 + 3)]);
          r11 = r9 << 2;
          r10 = (r10 + r11) | 0;
          r10 = r10 >> 2;
          r12 = (r9 + 1) | 0;
          heapClassInst.heapFloat[(r10)] = Float32(f6);
          r10 = r12 << 2;
          r12 = Int64(heapClassInst.heap32[(r5 + 3)]);
          r12 = (r12 + r10) | 0;
          r12 = r12 >> 2;
          r9 = (r9 + 2) | 0;
          heapClassInst.heapFloat[(r12)] = Float32(f0);
          r9 = r9 << 2;
          r12 = Int64(heapClassInst.heap32[(r5 + 3)]);
          r12 = (r12 + r9) | 0;
          r12 = r12 >> 2;
          heapClassInst.heapFloat[(r12)] = Float32(f1);
          r12 = Int64(heapClassInst.heap32[(r5 + 5)]);
          r12 = (r12 + r11) | 0;
          r12 = r12 >> 2;
          f3 = -f6;
          heapClassInst.heapFloat[(r12)] = Float32(f3);
          r12 = Int64(heapClassInst.heap32[(r5 + 5)]);
          r10 = (r12 + r10) | 0;
          r10 = r10 >> 2;
          f3 = -f0;
          heapClassInst.heapFloat[(r10)] = Float32(f3);
          r10 = Int64(heapClassInst.heap32[(r5 + 5)]);
          r9 = (r10 + r9) | 0;
          r9 = r9 >> 2;
          f3 = -f1;
          heapClassInst.heapFloat[(r9)] = Float32(f3);
          r9 = Int64(heapClassInst.heap32[(r5 + 7)]);
          r9 = (r9 + r11) | 0;
          f3 = Float64(heapClassInst.heapFloat[(r1 + 172)]);
          f4 = Float64(heapClassInst.heapFloat[(r1 + 173)]);
          r9 = r9 >> 2;
          heapClassInst.heap32[(r9)] = 0;
          r9 = if (r6 != r8) {1} else {0};
          r10 = if (f3 == f4) {1} else {0};
          r12 = Int64(heapClassInst.heap32[(r1 + 183)]);
          r9 = r9 & r10;
          r10 = r12 & 2;
          if (r10 != 0) 
          {
            r2 = (r0 + 744) | 0;
          }
          r2 = r2 >> 2;
          f5 = Float64(heapClassInst.heapFloat[(r2)]);
          r2 = if (r7 == r8) {1} else {0};
          r2 = r9 | r2;
          if (!(r2 != 0)) 
          {
            r2 = r12 & 4;
            if (!(r2 == 0)) 
            {
              r2 = Int64(heapClassInst.heap32[(r5 + 8)]);
              r2 = (r2 + r11) | 0;
              r2 = r2 >> 2;
              heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r1 + 184)];
            }
            f7 = 1.0
            f8 = 0.0
            f9 = Float64(heapClassInst.heapFloat[(r1 + 167)]);
            do {
              if (f3 < f4) 
              {
                f10 = Float64(heapClassInst.heapFloat[(r1 + 178)]);
                f11 = Float64(heapClassInst.heapFloat[(r5)]);
                f11 = f11 * f5;
                f11 = f9 / f11;
                if (f11 >= f8) 
                {
                  if (f11 > f8) 
                  {
                    if (!(f10 > f4)) 
                    {
                      f8 = f4 - f11;
                      if (!(f8 >= f10)) 
                      {
                        f7 = f4 - f10;
                        f8 = f7 / f11;
                        break 
                      }
                    }
                    f8 = 0.0;
                    f8 = if (f10 > f4) {f8} else {f7};
                  }
                  else {
                    break 
                  }
                }
                else {
                  if (!(f10 < f3)) 
                  {
                    f8 = f3 - f11;
                    if (!(f8 <= f10)) 
                    {
                      f7 = f3 - f10;
                      f8 = f7 / f11;
                      break 
                    }
                  }
                  f8 = 0.0;
                  f8 = if (f10 < f3) {f8} else {f7};
                }
              }
              else {
                f8 = if (f3 > f4) {f7} else {f8};
              }
            } while (false);
            r2 = Int64(heapClassInst.heap32[(r5 + 7)]);
            r2 = (r2 + r11) | 0;
            r2 = r2 >> 2;
            f7 = f9 * f8;
            f8 = Float64(heapClassInst.heapFloat[(r1 + 179)]);
            f9 = Float64(heapClassInst.heapFloat[(r2)]);
            f7 = f7 * f8;
            f7 = f9 + f7;
            heapClassInst.heapFloat[(r2)] = Float32(f7);
            r2 = Int64(heapClassInst.heap32[(r5 + 9)]);
            f7 = Float64(heapClassInst.heapFloat[(r1 + 168)]);
            r2 = (r2 + r11) | 0;
            r2 = r2 >> 2;
            f7 = -f7;
            heapClassInst.heapFloat[(r2)] = Float32(f7);
            r2 = Int64(heapClassInst.heap32[(r5 + 10)]);
            r2 = (r2 + r11) | 0;
            r2 = r2 >> 2;
            heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r1 + 168)];
          }
          if (r6 == 0) 
          {
            __label__ = 54;
            break 
          }
          else {
            r2 = Int64(heapClassInst.heap32[(r5 + 7)]);
            r2 = (r2 + r11) | 0;
            f7 = Float64(heapClassInst.heapFloat[(r5)]);
            r2 = r2 >> 2;
            f5 = f7 * f5;
            f7 = Float64(heapClassInst.heapFloat[(r2)]);
            f2 = f5 * f2;
            f2 = f7 + f2;
            heapClassInst.heapFloat[(r2)] = Float32(f2);
            r0 = Int64(heapClassInst.heapU8[r0 + 732]);
            r0 = r0 & 1;
            if (!(r0 == 0)) 
            {
              r0 = Int64(heapClassInst.heap32[(r5 + 8)]);
              r0 = (r0 + r11) | 0;
              r0 = r0 >> 2;
              heapClassInst.heap32[(r0)] = heapClassInst.heap32[(r1 + 185)];
            }
            if (f3 != f4) 
            {
              r0 = Int64(heapClassInst.heap32[(r5 + 9)]);
              if (r6 != 1) 
              {
                r0 = (r0 + r11) | 0;
                r0 = r0 >> 2;
                heapClassInst.heap32[(r0)] = ( -8388609);
                r0 = Int64(heapClassInst.heap32[(r5 + 10)]);
                r0 = (r0 + r11) | 0;
                r0 = r0 >> 2;
                heapClassInst.heap32[(r0)] = 0;
              }
              else {
                r0 = (r0 + r11) | 0;
                r0 = r0 >> 2;
                heapClassInst.heap32[(r0)] = 0;
                r0 = Int64(heapClassInst.heap32[(r5 + 10)]);
                r0 = (r0 + r11) | 0;
                r0 = r0 >> 2;
                heapClassInst.heap32[(r0)] = 2139095039;
              }
            }
            else {
              r0 = Int64(heapClassInst.heap32[(r5 + 9)]);
              r0 = (r0 + r11) | 0;
              r0 = r0 >> 2;
              heapClassInst.heap32[(r0)] = ( -8388609);
              r0 = Int64(heapClassInst.heap32[(r5 + 10)]);
              r0 = (r0 + r11) | 0;
              r0 = r0 >> 2;
              heapClassInst.heap32[(r0)] = 2139095039;
            }
            f2 = Float64(heapClassInst.heapFloat[(r1 + 171)]);
            f3 = 0.0;
            if (f2 <= f3) 
            {
              __label__ = 53;
              break 
            }
            else {
              f4 = Float64(heapClassInst.heapFloat[(r4 + 80)]);
              f5 = Float64(heapClassInst.heapFloat[(r3 + 80)]);
              f7 = Float64(heapClassInst.heapFloat[(r4 + 81)]);
              f8 = Float64(heapClassInst.heapFloat[(r3 + 81)]);
              f4 = f4 * f6;
              f7 = f7 * f0;
              f9 = Float64(heapClassInst.heapFloat[(r4 + 82)]);
              f10 = Float64(heapClassInst.heapFloat[(r3 + 82)]);
              f5 = f5 * f6;
              f0 = f8 * f0;
              f4 = f4 + f7;
              f6 = f9 * f1;
              f0 = f5 + f0;
              f1 = f10 * f1;
              f4 = f4 + f6;
              f0 = f0 + f1;
              f0 = f4 - f0;
              if (r6 != 1) 
              {
                if (f0 <= f3) 
                {
                  __label__ = 53;
                  break 
                }
                else {
                  r0 = Int64(heapClassInst.heap32[(r5 + 7)]);
                  f1 = -f2;
                  r0 = (r0 + r11) | 0;
                  f0 = f0 * f1;
                  r0 = r0 >> 2;
                  f1 = Float64(heapClassInst.heapFloat[(r0)]);
                  if (f1 <= f0) 
                  {
                    __label__ = 53;
                    break 
                  }
                  else {
                    heapClassInst.heapFloat[(r0)] = Float32(f0);
                    __label__ = 53;
                    break 
                  }
                }
              }
              else {
                if (f0 >= f3) 
                {
                  __label__ = 53;
                  break 
                }
                else {
                  r0 = Int64(heapClassInst.heap32[(r5 + 7)]);
                  f2 = -f2;
                  r0 = (r0 + r11) | 0;
                  f0 = f0 * f2;
                  r0 = r0 >> 2;
                  f2 = Float64(heapClassInst.heapFloat[(r0)]);
                  if (f2 >= f0) 
                  {
                    __label__ = 53;
                    break 
                  }
                  else {
                    heapClassInst.heapFloat[(r0)] = Float32(f0);
                    __label__ = 53;
                    break 
                  }
                }
              }
            }
          }
        }
      }
      else {
        r0 = _E2_str1149;
        r1 = _E2_str231;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 331;
        _assert(i7);
      }
    }
    else {
      r5 = r5 & 255;
      if (r5 == 0) 
      {
        r4 = r4 >> 2;
        r3 = r3 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r3 + 9)]);
        heapClassInst.heapFloat[(fp + (-5))] = Float32(f0);
        f1 = Float64(heapClassInst.heapFloat[(r1 + 163)]);
        f0 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
        heapClassInst.heapFloat[(fp + (-6))] = Float32(f0);
        f2 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
        heapClassInst.heapFloat[(fp + (-4))] = Float32(f2);
        f0 = Float64(heapClassInst.heapFloat[(r3 + 10)]);
        heapClassInst.heapFloat[(fp + (-7))] = Float32(f0);
        f2 = Float64(heapClassInst.heapFloat[(r1 + 164)]);
        f0 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
        heapClassInst.heapFloat[(fp + (-8))] = Float32(f0);
        f3 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
        heapClassInst.heapFloat[(fp + (-9))] = Float32(f3);
        f4 = Float64(heapClassInst.heapFloat[(r4 + 9)]);
        f5 = Float64(heapClassInst.heapFloat[(r1 + 147)]);
        f6 = Float64(heapClassInst.heapFloat[(r4 + 5)]);
        f7 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
        f8 = Float64(heapClassInst.heapFloat[(r4 + 10)]);
        f9 = Float64(heapClassInst.heapFloat[(r1 + 148)]);
        f10 = Float64(heapClassInst.heapFloat[(r4 + 6)]);
        f11 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
        f0 = Float64(heapClassInst.heapFloat[(fp + (-5))]);
        f12 = f0 * f1;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-7))]);
        f13 = f0 * f2;
        f14 = Float64(heapClassInst.heapFloat[(r3 + 11)]);
        heapClassInst.heapFloat[(fp + (-2))] = Float32(f14);
        f15 = Float64(heapClassInst.heapFloat[(r1 + 165)]);
        f16 = Float64(heapClassInst.heapFloat[(r3 + 7)]);
        heapClassInst.heapFloat[(fp + (-3))] = Float32(f16);
        f17 = Float64(heapClassInst.heapFloat[(r3 + 3)]);
        heapClassInst.heapFloat[(fp + (-1))] = Float32(f17);
        f18 = f4 * f5;
        f19 = f8 * f9;
        f20 = Float64(heapClassInst.heapFloat[(r4 + 11)]);
        f21 = Float64(heapClassInst.heapFloat[(r1 + 149)]);
        f22 = Float64(heapClassInst.heapFloat[(r4 + 7)]);
        f23 = Float64(heapClassInst.heapFloat[(r4 + 3)]);
        f0 = Float64(heapClassInst.heapFloat[(fp + (-6))]);
        f24 = f0 * f1;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
        f25 = f0 * f2;
        f26 = f6 * f5;
        f27 = f10 * f9;
        f28 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
        f1 = f28 * f1;
        f2 = f3 * f2;
        f5 = f7 * f5;
        f9 = f11 * f9;
        f29 = Float64(heapClassInst.heapFloat[(r1 + 137)]);
        f30 = Float64(heapClassInst.heapFloat[(r1 + 141)]);
        f0 = Float64(heapClassInst.heapFloat[(r1 + 136)]);
        f3 = Float64(heapClassInst.heapFloat[(r1 + 140)]);
        f14 = Float64(heapClassInst.heapFloat[(r1 + 153)]);
        f16 = Float64(heapClassInst.heapFloat[(r1 + 157)]);
        f12 = f12 + f13;
        heapClassInst.heapFloat[(fp + (-14))] = Float32(f12);
        f13 = Float64(heapClassInst.heapFloat[(fp + (-2))]);
        f17 = f13 * f15;
        f18 = f18 + f19;
        f19 = f20 * f21;
        f24 = f24 + f25;
        f25 = Float64(heapClassInst.heapFloat[(fp + (-3))]);
        f28 = f25 * f15;
        f26 = f26 + f27;
        f27 = f22 * f21;
        f1 = f1 + f2;
        heapClassInst.heapFloat[(fp + (-10))] = Float32(f1);
        f2 = Float64(heapClassInst.heapFloat[(fp + (-1))]);
        f15 = f2 * f15;
        f5 = f5 + f9;
        heapClassInst.heapFloat[(fp + (-12))] = Float32(f5);
        f9 = f23 * f21;
        f21 = Float64(heapClassInst.heapFloat[(r1 + 145)]);
        f1 = Float64(heapClassInst.heapFloat[(r1 + 144)]);
        f2 = Float64(heapClassInst.heapFloat[(r1 + 161)]);
        f5 = Float64(heapClassInst.heapFloat[(r3 + 84)]);
        f12 = Float64(heapClassInst.heapFloat[(r4 + 84)]);
        f13 = 1.1920928955078125e-007;
        heapClassInst.heapFloat[(fp + (-11))] = Float32(f13);
        f25 = f29 * f4;
        heapClassInst.heapFloat[(fp + (-13))] = Float32(f25);
        f25 = f30 * f8;
        f4 = f0 * f4;
        heapClassInst.heapFloat[(fp + (-16))] = Float32(f4);
        f8 = f3 * f8;
        f4 = f29 * f6;
        heapClassInst.heapFloat[(fp + (-15))] = Float32(f4);
        f4 = f30 * f10;
        f6 = f0 * f6;
        heapClassInst.heapFloat[(fp + (-18))] = Float32(f6);
        f10 = f3 * f10;
        f29 = f29 * f7;
        f30 = f30 * f11;
        f0 = f0 * f7;
        heapClassInst.heapFloat[(fp + (-17))] = Float32(f0);
        f3 = f3 * f11;
        f7 = Float64(heapClassInst.heapFloat[(fp + (-5))]);
        f0 = f14 * f7;
        heapClassInst.heapFloat[(fp + (-19))] = Float32(f0);
        f6 = Float64(heapClassInst.heapFloat[(fp + (-7))]);
        f6 = f16 * f6;
        f7 = Float64(heapClassInst.heapFloat[(fp + (-6))]);
        f7 = f14 * f7;
        heapClassInst.heapFloat[(fp + (-5))] = Float32(f7);
        f11 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
        f11 = f16 * f11;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
        f0 = f14 * f0;
        heapClassInst.heapFloat[(fp + (-4))] = Float32(f0);
        f14 = Float64(heapClassInst.heapFloat[(fp + (-9))]);
        f14 = f16 * f14;
        f16 = Float64(heapClassInst.heapFloat[(fp + (-14))]);
        f16 = f16 + f17;
        f17 = Float64(heapClassInst.heapFloat[(r3 + 15)]);
        f18 = f18 + f19;
        f19 = Float64(heapClassInst.heapFloat[(r4 + 15)]);
        f24 = f24 + f28;
        f28 = Float64(heapClassInst.heapFloat[(r3 + 14)]);
        f26 = f26 + f27;
        f27 = Float64(heapClassInst.heapFloat[(r4 + 14)]);
        f0 = Float64(heapClassInst.heapFloat[(fp + (-10))]);
        f0 = f0 + f15;
        f15 = Float64(heapClassInst.heapFloat[(r3 + 13)]);
        f7 = Float64(heapClassInst.heapFloat[(fp + (-12))]);
        f7 = f7 + f9;
        f9 = Float64(heapClassInst.heapFloat[(r4 + 13)]);
        r5 = r2 >> 2;
        f16 = f16 + f17;
        f17 = f18 + f19;
        f18 = f24 + f28;
        f19 = f26 + f27;
        f0 = f0 + f15;
        f7 = f7 + f9;
        f9 = Float64(heapClassInst.heapFloat[(fp + (-13))]);
        f9 = f9 + f25;
        f15 = f21 * f20;
        f24 = Float64(heapClassInst.heapFloat[(fp + (-16))]);
        f8 = f24 + f8;
        f20 = f1 * f20;
        f24 = Float64(heapClassInst.heapFloat[(fp + (-15))]);
        f4 = f24 + f4;
        f24 = f21 * f22;
        f25 = Float64(heapClassInst.heapFloat[(fp + (-18))]);
        f10 = f25 + f10;
        f22 = f1 * f22;
        f25 = f29 + f30;
        f21 = f21 * f23;
        f26 = Float64(heapClassInst.heapFloat[(fp + (-17))]);
        f3 = f26 + f3;
        f1 = f1 * f23;
        f23 = Float64(heapClassInst.heapFloat[(fp + (-19))]);
        f6 = f23 + f6;
        f23 = Float64(heapClassInst.heapFloat[(fp + (-2))]);
        f23 = f2 * f23;
        f26 = Float64(heapClassInst.heapFloat[(fp + (-5))]);
        f11 = f26 + f11;
        f26 = Float64(heapClassInst.heapFloat[(fp + (-3))]);
        f26 = f2 * f26;
        f27 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
        f14 = f27 + f14;
        f27 = Float64(heapClassInst.heapFloat[(fp + (-1))]);
        f2 = f2 * f27;
        r6 = if (f12 < f13) {1} else {0};
        r7 = if (f5 < f13) {1} else {0};
        f12 = f12 + f5;
        r8 = Int64(heapClassInst.heap32[(r5 + 6)]);
        f9 = f9 + f15;
        heapClassInst.heapFloat[(fp + (-3))] = Float32(f9);
        f8 = f8 + f20;
        f4 = f4 + f24;
        heapClassInst.heapFloat[(fp + (-2))] = Float32(f4);
        f4 = f10 + f22;
        f9 = f25 + f21;
        heapClassInst.heapFloat[(fp + (-4))] = Float32(f9);
        f1 = f3 + f1;
        f3 = f6 + f23;
        heapClassInst.heapFloat[(fp + (-7))] = Float32(f3);
        f3 = f11 + f26;
        heapClassInst.heapFloat[(fp + (-6))] = Float32(f3);
        f2 = f14 + f2;
        heapClassInst.heapFloat[(fp + (-5))] = Float32(f2);
        f2 = f16 - f17;
        heapClassInst.heapFloat[(fp + (-8))] = Float32(f2);
        f2 = f18 - f19;
        heapClassInst.heapFloat[(fp + (-9))] = Float32(f2);
        f2 = f0 - f7;
        heapClassInst.heapFloat[(fp + (-10))] = Float32(f2);
        r6 = r6 | r7;
        f2 = 0.0;
        if (f12 > f2) 
        {
          f5 = f5 / f12;
        }
        else {
          f5 = 0.5;
        }
        f3 = 1.0;
        heapClassInst.heapFloat[(fp + (-1))] = Float32(f3);
        f6 = f3 - f5;
        f9 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
        f9 = f9 * f5;
        f10 = Float64(heapClassInst.heapFloat[(fp + (-5))]);
        f10 = f10 * f6;
        f11 = Float64(heapClassInst.heapFloat[(fp + (-2))]);
        f11 = f11 * f5;
        f12 = Float64(heapClassInst.heapFloat[(fp + (-6))]);
        f12 = f12 * f6;
        f9 = f9 + f10;
        f10 = f11 + f12;
        f11 = Float64(heapClassInst.heapFloat[(fp + (-3))]);
        f11 = f11 * f5;
        f12 = Float64(heapClassInst.heapFloat[(fp + (-7))]);
        f12 = f12 * f6;
        f11 = f11 + f12;
        f12 = f9 * f9;
        f13 = f10 * f10;
        f12 = f12 + f13;
        f13 = f11 * f11;
        f12 = f12 + f13;
        heapClassInst.heapFloat[(g0)] = Float32(f12);
        sqrtf(i7);
        f3 = f3 / commonVariable.f_g0;
        f12 = Float64(heapClassInst.heapFloat[(r3 + 13)]);
        f13 = Float64(heapClassInst.heapFloat[(r3 + 14)]);
        f14 = Float64(heapClassInst.heapFloat[(r4 + 13)]);
        f15 = Float64(heapClassInst.heapFloat[(r4 + 14)]);
        f9 = f9 * f3;
        f0 = f0 - f12;
        f7 = f7 - f14;
        f10 = f10 * f3;
        f12 = f18 - f13;
        f13 = f19 - f15;
        f14 = Float64(heapClassInst.heapFloat[(r3 + 15)]);
        f15 = Float64(heapClassInst.heapFloat[(r4 + 15)]);
        f3 = f11 * f3;
        f11 = f16 - f14;
        f14 = f17 - f15;
        f15 = f0 * f9;
        f16 = f12 * f10;
        f17 = f7 * f9;
        f18 = f13 * f10;
        f15 = f15 + f16;
        f16 = f11 * f3;
        f17 = f17 + f18;
        f18 = f14 * f3;
        f15 = f15 + f16;
        f16 = f17 + f18;
        f17 = f10 * f15;
        f18 = f10 * f16;
        f19 = f9 * f15;
        f20 = f9 * f16;
        f15 = f3 * f15;
        f16 = f3 * f16;
        f12 = f12 - f17;
        f13 = f13 - f18;
        f0 = f0 - f19;
        f7 = f7 - f20;
        f11 = f11 - f15;
        f14 = f14 - f16;
        f21 = f12 * f5;
        f22 = f13 * f6;
        f23 = f0 * f5;
        f24 = f7 * f6;
        f21 = f21 + f22;
        f22 = f23 + f24;
        f23 = f11 * f5;
        f24 = f14 * f6;
        f15 = f16 - f15;
        f16 = f18 - f17;
        f17 = f20 - f19;
        f18 = f23 + f24;
        f19 = f22 * f22;
        f20 = f21 * f21;
        f23 = f15 * f5;
        f24 = f16 * f5;
        f25 = f17 * f5;
        f15 = f15 * f6;
        f16 = f16 * f6;
        f17 = f17 * f6;
        f19 = f19 + f20;
        f20 = f18 * f18;
        f19 = f19 + f20;
        r7 = r8 << 1;
        f14 = f14 + f23;
        f13 = f13 + f24;
        f7 = f7 + f25;
        f11 = f11 - f15;
        f12 = f12 - f16;
        f0 = f0 - f17;
        f15 = Float64(heapClassInst.heapFloat[(fp + (-11))]);
        if (f19 > f15) 
        {
          heapClassInst.heapFloat[(g0)] = Float32(f19);
          sqrtf(i7);
          f4 = Float64(heapClassInst.heapFloat[(fp + (-1))]);
          f8 = f4 / commonVariable.f_g0;
          f1 = f22 * f8;
          f4 = f21 * f8;
          f8 = f18 * f8;
        }
        r9 = Int64(heapClassInst.heap32[(r5 + 3)]);
        f15 = f13 * f8;
        f16 = f14 * f4;
        r9 = r9 >> 2;
        f15 = f15 - f16;
        heapClassInst.heapFloat[(r9)] = Float32(f15);
        r9 = Int64(heapClassInst.heap32[(r5 + 3)]);
        f15 = f14 * f1;
        f16 = f7 * f8;
        r9 = r9 >> 2;
        f15 = f15 - f16;
        heapClassInst.heapFloat[(r9 + 1)] = Float32(f15);
        r9 = Int64(heapClassInst.heap32[(r5 + 3)]);
        f15 = f7 * f4;
        f16 = f13 * f1;
        r9 = r9 >> 2;
        f15 = f15 - f16;
        heapClassInst.heapFloat[(r9 + 2)] = Float32(f15);
        f15 = f12 * f8;
        f16 = f11 * f4;
        f15 = f15 - f16;
        r9 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r9 = r9 >> 2;
        f15 = -f15;
        heapClassInst.heapFloat[(r9)] = Float32(f15);
        f15 = f11 * f1;
        f16 = f0 * f8;
        f15 = f15 - f16;
        r9 = Int64(heapClassInst.heap32[(r5 + 5)]);
        f16 = f10 * f8;
        f17 = f3 * f4;
        f18 = f9 * f4;
        f19 = f10 * f1;
        f20 = f3 * f1;
        f21 = f9 * f8;
        r9 = r9 >> 2;
        f15 = -f15;
        f16 = f16 - f17;
        f17 = f18 - f19;
        f18 = f20 - f21;
        heapClassInst.heapFloat[(r9 + 1)] = Float32(f15);
        f15 = f0 * f4;
        f19 = f12 * f1;
        f15 = f15 - f19;
        r9 = Int64(heapClassInst.heap32[(r5 + 5)]);
        f19 = f7 * f18;
        f20 = f13 * f16;
        f21 = f14 * f16;
        f22 = f7 * f17;
        f23 = f13 * f17;
        f24 = f14 * f18;
        f25 = f0 * f18;
        f26 = f12 * f16;
        f27 = f11 * f16;
        f28 = f0 * f17;
        f29 = f12 * f17;
        f30 = f11 * f18;
        f19 = f19 - f20;
        f20 = f21 - f22;
        f21 = f23 - f24;
        f22 = f25 - f26;
        f23 = f27 - f28;
        f24 = f29 - f30;
        r9 = r9 >> 2;
        f15 = -f15;
        heapClassInst.heapFloat[(r9 + 2)] = Float32(f15);
        if (r6 != 0) 
        {
          r9 = Int64(heapClassInst.heapU8[r0 + 722]);
          if (!(r9 == 0)) 
          {
            f24 = f24 * f6;
            f23 = f23 * f6;
            f22 = f22 * f6;
            f21 = f21 * f5;
            f20 = f20 * f5;
            f19 = f19 * f5;
          }
        }
        r9 = r8 << 2;
        r10 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r10 = (r10 + r9) | 0;
        r10 = r10 >> 2;
        r11 = (r8 + 1) | 0;
        heapClassInst.heapFloat[(r10)] = Float32(f21);
        r10 = r11 << 2;
        r11 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r11 = (r11 + r10) | 0;
        r11 = r11 >> 2;
        r12 = (r8 + 2) | 0;
        heapClassInst.heapFloat[(r11)] = Float32(f20);
        r11 = r12 << 2;
        r12 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r12 = (r12 + r11) | 0;
        r12 = r12 >> 2;
        heapClassInst.heapFloat[(r12)] = Float32(f19);
        r12 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r12 = (r12 + r9) | 0;
        r12 = r12 >> 2;
        f15 = -f24;
        heapClassInst.heapFloat[(r12)] = Float32(f15);
        r12 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r10 = (r12 + r10) | 0;
        r10 = r10 >> 2;
        f15 = -f23;
        heapClassInst.heapFloat[(r10)] = Float32(f15);
        r10 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r10 = (r10 + r11) | 0;
        f15 = f7 * f10;
        f19 = f13 * f9;
        f20 = f14 * f9;
        f7 = f7 * f3;
        f13 = f13 * f3;
        f14 = f14 * f10;
        f21 = f0 * f10;
        f23 = f12 * f9;
        f24 = f11 * f9;
        f0 = f0 * f3;
        f12 = f12 * f3;
        f11 = f11 * f10;
        f15 = f15 - f19;
        f7 = f20 - f7;
        f13 = f13 - f14;
        f14 = f21 - f23;
        f0 = f24 - f0;
        f11 = f12 - f11;
        r10 = r10 >> 2;
        f12 = -f22;
        heapClassInst.heapFloat[(r10)] = Float32(f12);
        if (r6 != 0) 
        {
          f11 = f11 * f6;
          f0 = f0 * f6;
          f14 = f14 * f6;
          f13 = f13 * f5;
          f7 = f7 * f5;
          f15 = f15 * f5;
        }
        r6 = r7 << 2;
        r10 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r10 = (r10 + r6) | 0;
        r10 = r10 >> 2;
        r11 = r7 | 1;
        heapClassInst.heapFloat[(r10)] = Float32(f13);
        r10 = r11 << 2;
        r11 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r11 = (r11 + r10) | 0;
        r11 = r11 >> 2;
        r7 = (r7 + 2) | 0;
        heapClassInst.heapFloat[(r11)] = Float32(f7);
        r7 = r7 << 2;
        r11 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r11 = (r11 + r7) | 0;
        r11 = r11 >> 2;
        heapClassInst.heapFloat[(r11)] = Float32(f15);
        r11 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r11 = (r11 + r6) | 0;
        r11 = r11 >> 2;
        f5 = -f11;
        heapClassInst.heapFloat[(r11)] = Float32(f5);
        r11 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r11 = (r11 + r10) | 0;
        r11 = r11 >> 2;
        f0 = -f0;
        heapClassInst.heapFloat[(r11)] = Float32(f0);
        r11 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r7 = (r11 + r7) | 0;
        r7 = r7 >> 2;
        f0 = -f14;
        heapClassInst.heapFloat[(r7)] = Float32(f0);
        r7 = Int64(heapClassInst.heapU8[r0 + 720]);
        if (!(r7 != 0)) 
        {
          f0 = Float64(heapClassInst.heapFloat[(r5)]);
          f5 = Float64(heapClassInst.heapFloat[(r5 + 1)]);
          f0 = f0 * f5;
          r7 = Int64(heapClassInst.heap32[(r5 + 2)]);
          r7 = r7 >> 2;
          heapClassInst.heapFloat[(r7)] = Float32(f1);
          r7 = Int64(heapClassInst.heap32[(r5 + 2)]);
          r7 = r7 >> 2;
          heapClassInst.heapFloat[(r7 + 1)] = Float32(f4);
          r7 = Int64(heapClassInst.heap32[(r5 + 2)]);
          r7 = r7 >> 2;
          heapClassInst.heapFloat[(r7 + 2)] = Float32(f8);
          r7 = Int64(heapClassInst.heap32[(r5 + 2)]);
          r7 = (r7 + r9) | 0;
          r7 = r7 >> 2;
          heapClassInst.heapFloat[(r7)] = Float32(f16);
          r7 = Int64(heapClassInst.heap32[(r5 + 2)]);
          r7 = (r7 + r9) | 0;
          r7 = r7 >> 2;
          heapClassInst.heapFloat[(r7 + 1)] = Float32(f18);
          r7 = Int64(heapClassInst.heap32[(r5 + 2)]);
          r7 = (r7 + r9) | 0;
          r7 = r7 >> 2;
          heapClassInst.heapFloat[(r7 + 2)] = Float32(f17);
          r7 = Int64(heapClassInst.heap32[(r5 + 2)]);
          r7 = (r7 + r6) | 0;
          r7 = r7 >> 2;
          heapClassInst.heapFloat[(r7)] = Float32(f9);
          r7 = Int64(heapClassInst.heap32[(r5 + 2)]);
          r7 = (r7 + r10) | 0;
          r7 = r7 >> 2;
          heapClassInst.heapFloat[(r7)] = Float32(f10);
          r7 = Int64(heapClassInst.heap32[(r5 + 2)]);
          r7 = (r7 + r6) | 0;
          r7 = r7 >> 2;
          f5 = Float64(heapClassInst.heapFloat[(fp + (-10))]);
          f6 = f1 * f5;
          f7 = Float64(heapClassInst.heapFloat[(fp + (-9))]);
          f11 = f4 * f7;
          heapClassInst.heapFloat[(r7 + 2)] = Float32(f3);
          f6 = f6 + f11;
          f11 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
          f12 = f8 * f11;
          r7 = Int64(heapClassInst.heap32[(r5 + 7)]);
          f6 = f6 + f12;
          r7 = r7 >> 2;
          f6 = f6 * f0;
          heapClassInst.heapFloat[(r7)] = Float32(f6);
          f6 = f16 * f5;
          f12 = f18 * f7;
          r7 = Int64(heapClassInst.heap32[(r5 + 7)]);
          f6 = f6 + f12;
          f12 = f17 * f11;
          r7 = (r7 + r9) | 0;
          f6 = f6 + f12;
          r7 = r7 >> 2;
          f6 = f6 * f0;
          heapClassInst.heapFloat[(r7)] = Float32(f6);
          f5 = f9 * f5;
          f6 = f10 * f7;
          r7 = Int64(heapClassInst.heap32[(r5 + 7)]);
          f5 = f5 + f6;
          f6 = f3 * f11;
          r6 = (r7 + r6) | 0;
          f5 = f5 + f6;
          r6 = r6 >> 2;
          f0 = f5 * f0;
          heapClassInst.heapFloat[(r6)] = Float32(f0);
        }
        r2 = (r2 + 4) | 0;
        r6 = (r8 * 3) | 0;
        r7 = r6 << 2;
        r9 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r9 = (r9 + r7) | 0;
        r9 = r9 >> 2;
        r10 = (r6 + 1) | 0;
        heapClassInst.heapFloat[(r9)] = Float32(f1);
        r9 = r10 << 2;
        r10 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r10 = (r10 + r9) | 0;
        r10 = r10 >> 2;
        r6 = (r6 + 2) | 0;
        heapClassInst.heapFloat[(r10)] = Float32(f4);
        r6 = r6 << 2;
        r10 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r10 = (r10 + r6) | 0;
        r10 = r10 >> 2;
        heapClassInst.heapFloat[(r10)] = Float32(f8);
        r8 = r8 << 4;
        r10 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r10 = (r10 + r8) | 0;
        r10 = r10 >> 2;
        heapClassInst.heapFloat[(r10)] = Float32(f16);
        r10 = r8 | 4;
        r11 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r11 = (r11 + r10) | 0;
        r11 = r11 >> 2;
        heapClassInst.heapFloat[(r11)] = Float32(f18);
        r11 = r8 | 8;
        r12 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r12 = (r12 + r11) | 0;
        r12 = r12 >> 2;
        heapClassInst.heapFloat[(r12)] = Float32(f17);
        r12 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r12 = (r12 + r7) | 0;
        r12 = r12 >> 2;
        f0 = -f1;
        heapClassInst.heapFloat[(r12)] = Float32(f0);
        r12 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r9 = (r12 + r9) | 0;
        r9 = r9 >> 2;
        f0 = -f4;
        heapClassInst.heapFloat[(r9)] = Float32(f0);
        r9 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r6 = (r9 + r6) | 0;
        r6 = r6 >> 2;
        f0 = -f8;
        heapClassInst.heapFloat[(r6)] = Float32(f0);
        r6 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r6 = (r6 + r8) | 0;
        r6 = r6 >> 2;
        f0 = -f16;
        heapClassInst.heapFloat[(r6)] = Float32(f0);
        r6 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r6 = (r6 + r10) | 0;
        r6 = r6 >> 2;
        f0 = -f18;
        heapClassInst.heapFloat[(r6)] = Float32(f0);
        r6 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r6 = (r6 + r11) | 0;
        f5 = Float64(heapClassInst.heapFloat[(fp + (-7))]);
        f0 = Float64(heapClassInst.heapFloat[(fp + (-2))]);
        f6 = f0 * f5;
        f11 = Float64(heapClassInst.heapFloat[(fp + (-6))]);
        f7 = Float64(heapClassInst.heapFloat[(fp + (-3))]);
        f12 = f7 * f11;
        f13 = Float64(heapClassInst.heapFloat[(fp + (-5))]);
        f7 = f7 * f13;
        f14 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
        f5 = f14 * f5;
        f6 = f6 - f12;
        f5 = f7 - f5;
        f7 = f14 * f11;
        f0 = f0 * f13;
        r6 = r6 >> 2;
        f11 = -f17;
        heapClassInst.heapFloat[(r6)] = Float32(f11);
        f0 = f7 - f0;
        f1 = f6 * f1;
        f4 = f5 * f4;
        r6 = Int64(heapClassInst.heap32[(r5 + 7)]);
        f1 = f1 + f4;
        f4 = f0 * f8;
        f7 = Float64(heapClassInst.heapFloat[(r5)]);
        f8 = Float64(heapClassInst.heapFloat[(r5 + 1)]);
        r6 = (r6 + r7) | 0;
        f1 = f1 + f4;
        f4 = f7 * f8;
        r6 = r6 >> 2;
        f1 = f1 * f4;
        heapClassInst.heapFloat[(r6)] = Float32(f1);
        f1 = f6 * f16;
        f5 = f5 * f18;
        r6 = Int64(heapClassInst.heap32[(r5 + 7)]);
        f1 = f1 + f5;
        f0 = f0 * f17;
        r6 = (r6 + r8) | 0;
        f0 = f1 + f0;
        r6 = r6 >> 2;
        f0 = f0 * f4;
        heapClassInst.heapFloat[(r6)] = Float32(f0);
        r6 = Int64(heapClassInst.heapU8[r0 + 722]);
        if (r6 != 0) 
        {
          f0 = Float64(heapClassInst.heapFloat[(r1 + 176)]);
          f1 = Float64(heapClassInst.heapFloat[(r1 + 179)]);
          f0 = f0 * f1;
          r6 = 1;
          r7 = 2;
          r6 = if (f0 > f2) {r6} else {r7};
        }
        else {
          f0 = 0.0;
          r6 = 0;
        }
        r7 = Int64(heapClassInst.heapU8[r0 + 721]);
        r8 = 0;
        r9 = if (r7 != r8) {1} else {0};
        r9 = r9 & 1;
        r9 = r9 | r6;
        if (r9 == 0) 
        {
          __label__ = 54;
        }
        else {
          r9 = Int64(heapClassInst.heap32[(r5 + 6)]);
          r9 = (r9 * 5) | 0;
          r10 = Int64(heapClassInst.heap32[(r5 + 3)]);
          r11 = r9 << 2;
          r10 = (r10 + r11) | 0;
          r10 = r10 >> 2;
          r12 = (r9 + 1) | 0;
          heapClassInst.heapFloat[(r10)] = Float32(f9);
          r10 = r12 << 2;
          r12 = Int64(heapClassInst.heap32[(r5 + 3)]);
          r12 = (r12 + r10) | 0;
          r12 = r12 >> 2;
          r9 = (r9 + 2) | 0;
          heapClassInst.heapFloat[(r12)] = Float32(f10);
          r9 = r9 << 2;
          r12 = Int64(heapClassInst.heap32[(r5 + 3)]);
          r12 = (r12 + r9) | 0;
          r12 = r12 >> 2;
          heapClassInst.heapFloat[(r12)] = Float32(f3);
          r12 = Int64(heapClassInst.heap32[(r5 + 5)]);
          r12 = (r12 + r11) | 0;
          r12 = r12 >> 2;
          f1 = -f9;
          heapClassInst.heapFloat[(r12)] = Float32(f1);
          r12 = Int64(heapClassInst.heap32[(r5 + 5)]);
          r10 = (r12 + r10) | 0;
          r10 = r10 >> 2;
          f1 = -f10;
          heapClassInst.heapFloat[(r10)] = Float32(f1);
          r10 = Int64(heapClassInst.heap32[(r5 + 5)]);
          r9 = (r10 + r9) | 0;
          r9 = r9 >> 2;
          f1 = -f3;
          heapClassInst.heapFloat[(r9)] = Float32(f1);
          r9 = Int64(heapClassInst.heap32[(r5 + 7)]);
          r9 = (r9 + r11) | 0;
          f1 = Float64(heapClassInst.heapFloat[(r1 + 172)]);
          f4 = Float64(heapClassInst.heapFloat[(r1 + 173)]);
          r9 = r9 >> 2;
          heapClassInst.heap32[(r9)] = 0;
          r9 = if (r6 != r8) {1} else {0};
          r10 = if (f1 == f4) {1} else {0};
          r12 = Int64(heapClassInst.heap32[(r1 + 183)]);
          r9 = r9 & r10;
          r10 = r12 & 2;
          if (r10 != 0) 
          {
            r2 = (r0 + 744) | 0;
          }
          r2 = r2 >> 2;
          f5 = Float64(heapClassInst.heapFloat[(r2)]);
          r2 = if (r7 == r8) {1} else {0};
          r2 = r9 | r2;
          if (!(r2 != 0)) 
          {
            r2 = r12 & 4;
            if (!(r2 == 0)) 
            {
              r2 = Int64(heapClassInst.heap32[(r5 + 8)]);
              r2 = (r2 + r11) | 0;
              r2 = r2 >> 2;
              heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r1 + 184)];
            }
            f6 = Float64(heapClassInst.heapFloat[(r1 + 167)]);
            do {
              if (f1 < f4) 
              {
                f7 = Float64(heapClassInst.heapFloat[(r1 + 178)]);
                f8 = Float64(heapClassInst.heapFloat[(r5)]);
                f8 = f8 * f5;
                f8 = f6 / f8;
                if (f8 >= f2) 
                {
                  if (f8 > f2) 
                  {
                    if (!(f7 > f4)) 
                    {
                      f2 = f4 - f8;
                      if (!(f2 >= f7)) 
                      {
                        f2 = f4 - f7;
                        f2 = f2 / f8;
                        break 
                      }
                    }
                    f2 = 0.0;
                    f8 = Float64(heapClassInst.heapFloat[(fp + (-1))]);
                    f2 = if (f7 > f4) {f2} else {f8};
                  }
                  else {
                    break 
                  }
                }
                else {
                  if (!(f7 < f1)) 
                  {
                    f2 = f1 - f8;
                    if (!(f2 <= f7)) 
                    {
                      f2 = f1 - f7;
                      f2 = f2 / f8;
                      break 
                    }
                  }
                  f2 = 0.0;
                  f8 = Float64(heapClassInst.heapFloat[(fp + (-1))]);
                  f2 = if (f7 < f1) {f2} else {f8};
                }
              }
              else {
                f7 = Float64(heapClassInst.heapFloat[(fp + (-1))]);
                f2 = if (f1 > f4) {f7} else {f2};
              }
            } while (false);
            r2 = Int64(heapClassInst.heap32[(r5 + 7)]);
            r2 = (r2 + r11) | 0;
            r2 = r2 >> 2;
            f2 = f6 * f2;
            f6 = Float64(heapClassInst.heapFloat[(r1 + 179)]);
            f7 = Float64(heapClassInst.heapFloat[(r2)]);
            f2 = f2 * f6;
            f2 = f7 + f2;
            heapClassInst.heapFloat[(r2)] = Float32(f2);
            r2 = Int64(heapClassInst.heap32[(r5 + 9)]);
            f2 = Float64(heapClassInst.heapFloat[(r1 + 168)]);
            r2 = (r2 + r11) | 0;
            r2 = r2 >> 2;
            f2 = -f2;
            heapClassInst.heapFloat[(r2)] = Float32(f2);
            r2 = Int64(heapClassInst.heap32[(r5 + 10)]);
            r2 = (r2 + r11) | 0;
            r2 = r2 >> 2;
            heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r1 + 168)];
          }
          if (r6 == 0) 
          {
            __label__ = 54;
          }
          else {
            r2 = Int64(heapClassInst.heap32[(r5 + 7)]);
            r2 = (r2 + r11) | 0;
            f2 = Float64(heapClassInst.heapFloat[(r5)]);
            r2 = r2 >> 2;
            f2 = f2 * f5;
            f5 = Float64(heapClassInst.heapFloat[(r2)]);
            f0 = f2 * f0;
            f0 = f5 + f0;
            heapClassInst.heapFloat[(r2)] = Float32(f0);
            r0 = Int64(heapClassInst.heapU8[r0 + 732]);
            r0 = r0 & 1;
            if (!(r0 == 0)) 
            {
              r0 = Int64(heapClassInst.heap32[(r5 + 8)]);
              r0 = (r0 + r11) | 0;
              r0 = r0 >> 2;
              heapClassInst.heap32[(r0)] = heapClassInst.heap32[(r1 + 185)];
            }
            if (f1 != f4) 
            {
              r0 = Int64(heapClassInst.heap32[(r5 + 9)]);
              if (r6 != 1) 
              {
                r0 = (r0 + r11) | 0;
                r0 = r0 >> 2;
                heapClassInst.heap32[(r0)] = ( -8388609);
                r0 = Int64(heapClassInst.heap32[(r5 + 10)]);
                r0 = (r0 + r11) | 0;
                r0 = r0 >> 2;
                heapClassInst.heap32[(r0)] = 0;
              }
              else {
                r0 = (r0 + r11) | 0;
                r0 = r0 >> 2;
                heapClassInst.heap32[(r0)] = 0;
                r0 = Int64(heapClassInst.heap32[(r5 + 10)]);
                r0 = (r0 + r11) | 0;
                r0 = r0 >> 2;
                heapClassInst.heap32[(r0)] = 2139095039;
              }
            }
            else {
              r0 = Int64(heapClassInst.heap32[(r5 + 9)]);
              r0 = (r0 + r11) | 0;
              r0 = r0 >> 2;
              heapClassInst.heap32[(r0)] = ( -8388609);
              r0 = Int64(heapClassInst.heap32[(r5 + 10)]);
              r0 = (r0 + r11) | 0;
              r0 = r0 >> 2;
              heapClassInst.heap32[(r0)] = 2139095039;
            }
            f0 = Float64(heapClassInst.heapFloat[(r1 + 171)]);
            f1 = 0.0
            if (f0 <= f1) 
            {
              __label__ = 53;
            }
            else {
              f2 = Float64(heapClassInst.heapFloat[(r4 + 80)]);
              f4 = Float64(heapClassInst.heapFloat[(r3 + 80)]);
              f5 = Float64(heapClassInst.heapFloat[(r4 + 81)]);
              f6 = Float64(heapClassInst.heapFloat[(r3 + 81)]);
              f2 = f2 * f9;
              f5 = f5 * f10;
              f7 = Float64(heapClassInst.heapFloat[(r4 + 82)]);
              f8 = Float64(heapClassInst.heapFloat[(r3 + 82)]);
              f4 = f4 * f9;
              f6 = f6 * f10;
              f2 = f2 + f5;
              f5 = f7 * f3;
              f4 = f4 + f6;
              f3 = f8 * f3;
              f2 = f2 + f5;
              f3 = f4 + f3;
              f2 = f2 - f3;
              if (r6 != 1) 
              {
                if (f2 <= f1) 
                {
                  __label__ = 53;
                }
                else {
                  r0 = Int64(heapClassInst.heap32[(r5 + 7)]);
                  f0 = -f0;
                  r0 = (r0 + r11) | 0;
                  f0 = f2 * f0;
                  r0 = r0 >> 2;
                  f1 = Float64(heapClassInst.heapFloat[(r0)]);
                  if (f1 <= f0) 
                  {
                    __label__ = 53;
                  }
                  else {
                    heapClassInst.heapFloat[(r0)] = Float32(f0);
                    __label__ = 53;
                  }
                }
              }
              else {
                if (f2 >= f1) 
                {
                  __label__ = 53;
                }
                else {
                  r0 = Int64(heapClassInst.heap32[(r5 + 7)]);
                  f0 = -f0;
                  r0 = (r0 + r11) | 0;
                  f0 = f2 * f0;
                  r0 = r0 >> 2;
                  f1 = Float64(heapClassInst.heapFloat[(r0)]);
                  if (f1 >= f0) 
                  {
                    __label__ = 53;
                  }
                  else {
                    heapClassInst.heapFloat[(r0)] = Float32(f0);
                    __label__ = 53;
                  }
                }
              }
            }
          }
        }
      }
      else {
        r0 = _E2_str1149;
        r1 = _E2_str231;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 682;
        _assert(i7);
      }
    }
  } while (false);
  if (__label__ == 53) {
    r0 = Int64(heapClassInst.heap32[(r5 + 7)]);
    r0 = (r0 + r11) | 0;
    r0 = r0 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r0)]);
    f1 = Float64(heapClassInst.heapFloat[(r1 + 170)]);
    f0 = f0 * f1;
    heapClassInst.heapFloat[(r0)] = Float32(f0);
  }
  return;
}

@OverflowWrapping
func _ZN17btHingeConstraint8setParamEifi(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var f0: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 3)]);
  if (!(r0 == ( -1))) 
  {
    if (r0 != 5) 
    {
      r0 = _E2_str10;
      r1 = _E2_str231;
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      heapClassInst.heap32[(g0 + 2)] = 969;
      _assert(i7);
    }
  }
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  f0 = Float64(heapClassInst.heapFloat[(fp + 2)]);
  if (r1 == 4) 
  {
    r0 = r0 >> 2;
    heapClassInst.heapFloat[(r0 + 185)] = Float32(f0);
    r1 = Int64(heapClassInst.heap32[(r0 + 183)]);
    r1 = r1 | 1;
    heapClassInst.heap32[(r0 + 183)] = Int32(r1);
    return;
  }
  else {
    if (r1 == 3) 
    {
      r0 = r0 >> 2;
      heapClassInst.heapFloat[(r0 + 184)] = Float32(f0);
      r1 = Int64(heapClassInst.heap32[(r0 + 183)]);
      r1 = r1 | 4;
      heapClassInst.heap32[(r0 + 183)] = Int32(r1);
      return;
    }
    else {
      if (r1 != 2) 
      {
        r0 = _E2_str10;
        r1 = _E2_str231;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 964;
        _assert(i7);
      }
      else {
        r0 = r0 >> 2;
        heapClassInst.heapFloat[(r0 + 186)] = Float32(f0);
        r1 = Int64(heapClassInst.heap32[(r0 + 183)]);
        r1 = r1 | 2;
        heapClassInst.heap32[(r0 + 183)] = Int32(r1);
        return;
      }
    }
  }
}

@OverflowWrapping
func _ZNK17btHingeConstraint8getParamEii(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var f0: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  if (!(r0 == ( -1))) 
  {
    if (r0 != 5) 
    {
      r0 = _E2_str10;
      r1 = _E2_str231;
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      heapClassInst.heap32[(g0 + 2)] = 999;
      _assert(i7);
    }
  }
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  if (r1 == 4) 
  {
    r1 = Int64(heapClassInst.heapU8[r0 + 732]);
    r1 = r1 & 1;
    if (r1 != 0) 
    {
      r0 = (r0 + 740) | 0;
    }
    else {
      r0 = _E2_str332;
      r1 = _E2_str231;
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      heapClassInst.heap32[(g0 + 2)] = 986;
      _assert(i7);
    }
  }
  else {
    if (r1 == 3) 
    {
      r1 = Int64(heapClassInst.heapU8[r0 + 732]);
      r1 = r1 & 4;
      if (r1 != 0) 
      {
        r0 = (r0 + 736) | 0;
      }
      else {
        r0 = _E2_str433;
        r1 = _E2_str231;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 990;
        _assert(i7);
      }
    }
    else {
      if (r1 != 2) 
      {
        r0 = _E2_str10;
        r1 = _E2_str231;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 994;
        _assert(i7);
      }
      else {
        r1 = Int64(heapClassInst.heapU8[r0 + 732]);
        r1 = r1 & 2;
        if (r1 != 0) 
        {
          r0 = (r0 + 744) | 0;
        }
        else {
          r0 = _E2_str130;
          r1 = _E2_str231;
          heapClassInst.heap32[(g0)] = Int32(r0);
          heapClassInst.heap32[(g0 + 1)] = Int32(r1);
          heapClassInst.heap32[(g0 + 2)] = 982;
          _assert(i7);
        }
      }
    }
  }
  r0 = r0 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r0)]);
  commonVariable.f_g0 = f0;
  return;
}

@OverflowWrapping
func _ZN17btHingeConstraint13getHingeAngleERK11btTransformS2_(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
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
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  r2 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = r1 >> 2;
  r2 = r2 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r2 + 135)]);
  f1 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
  f2 = Float64(heapClassInst.heapFloat[(r0)]);
  f3 = Float64(heapClassInst.heapFloat[(r2 + 136)]);
  f4 = Float64(heapClassInst.heapFloat[(r2 + 139)]);
  f5 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
  f6 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f7 = Float64(heapClassInst.heapFloat[(r2 + 140)]);
  f8 = Float64(heapClassInst.heapFloat[(r2 + 152)]);
  f9 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
  f10 = Float64(heapClassInst.heapFloat[(r1)]);
  f11 = Float64(heapClassInst.heapFloat[(r2 + 156)]);
  f12 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
  f13 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f14 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
  f15 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
  f16 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
  f17 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
  f18 = f2 * f0;
  f19 = f6 * f4;
  f20 = f1 * f0;
  f21 = f5 * f4;
  f10 = f10 * f8;
  f13 = f13 * f11;
  f2 = f2 * f3;
  f6 = f6 * f7;
  f9 = f9 * f8;
  f12 = f12 * f11;
  f1 = f1 * f3;
  f5 = f5 * f7;
  f22 = Float64(heapClassInst.heapFloat[(r2 + 143)]);
  f23 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
  f24 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f25 = Float64(heapClassInst.heapFloat[(r2 + 144)]);
  f26 = Float64(heapClassInst.heapFloat[(r2 + 160)]);
  f27 = Float64(heapClassInst.heapFloat[(r1 + 6)]);
  f28 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f29 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
  f30 = Float64(heapClassInst.heapFloat[(r1 + 10)]);
  f18 = f18 + f19;
  f19 = f24 * f22;
  f20 = f20 + f21;
  f21 = f23 * f22;
  f0 = f14 * f0;
  f4 = f15 * f4;
  f10 = f10 + f13;
  f13 = f28 * f26;
  f2 = f2 + f6;
  f6 = f24 * f25;
  f9 = f9 + f12;
  f12 = f27 * f26;
  f1 = f1 + f5;
  f5 = f23 * f25;
  f8 = f16 * f8;
  f11 = f17 * f11;
  f3 = f14 * f3;
  f7 = f15 * f7;
  f14 = f18 + f19;
  f10 = f10 + f13;
  f2 = f2 + f6;
  f6 = f20 + f21;
  f9 = f9 + f12;
  f1 = f1 + f5;
  f0 = f0 + f4;
  f4 = f29 * f22;
  f5 = f8 + f11;
  f8 = f30 * f26;
  f3 = f3 + f7;
  f7 = f29 * f25;
  f11 = f10 * f14;
  f6 = f9 * f6;
  f0 = f0 + f4;
  f4 = f5 + f8;
  f3 = f3 + f7;
  f2 = f10 * f2;
  f1 = f9 * f1;
  f5 = f11 + f6;
  f0 = f4 * f0;
  f1 = f2 + f1;
  f2 = f4 * f3;
  f0 = f5 + f0;
  f1 = f1 + f2;
  heapClassInst.heapFloat[(g0)] = Float32(f0);
  heapClassInst.heapFloat[(g0 + 1)] = Float32(f1);
  atan2f(i7);
  f1 = Float64(heapClassInst.heapFloat[(r2 + 179)]);
  f0 = f1 * commonVariable.f_g0;
  commonVariable.f_g0 = f0;
  return;
}

@OverflowWrapping
func _ZN18btConstraintSolver12prepareSolveEii(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  return;
}

@OverflowWrapping
func _ZN18btConstraintSolver9allSolvedERK19btContactSolverInfoP12btIDebugDrawP12btStackAlloc(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  return;
}

@OverflowWrapping
func _ZN35btSequentialImpulseConstraintSolver33resolveSingleConstraintRowGenericER11btRigidBodyS1_RK18btSolverConstraint(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
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
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = r1 >> 2;
  r0 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = r2 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
  f1 = Float64(heapClassInst.heapFloat[(r0 + 126)]);
  f2 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
  f3 = Float64(heapClassInst.heapFloat[(r0 + 127)]);
  f4 = Float64(heapClassInst.heapFloat[(r1)]);
  f5 = Float64(heapClassInst.heapFloat[(r0 + 130)]);
  f6 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f7 = Float64(heapClassInst.heapFloat[(r0 + 131)]);
  f8 = Float64(heapClassInst.heapFloat[(r2 + 126)]);
  f9 = Float64(heapClassInst.heapFloat[(r2 + 127)]);
  f10 = Float64(heapClassInst.heapFloat[(r1 + 6)]);
  f11 = Float64(heapClassInst.heapFloat[(r0 + 128)]);
  f1 = f0 * f1;
  f3 = f2 * f3;
  f4 = f4 * f5;
  f5 = f6 * f7;
  f6 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f7 = Float64(heapClassInst.heapFloat[(r0 + 132)]);
  f12 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
  f13 = Float64(heapClassInst.heapFloat[(r2 + 130)]);
  f14 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
  f15 = Float64(heapClassInst.heapFloat[(r2 + 131)]);
  f16 = Float64(heapClassInst.heapFloat[(r2 + 128)]);
  f1 = f1 + f3;
  f3 = f10 * f11;
  f4 = f4 + f5;
  f5 = f6 * f7;
  f6 = f12 * f13;
  f7 = f14 * f15;
  f11 = Float64(heapClassInst.heapFloat[(r1 + 10)]);
  f12 = Float64(heapClassInst.heapFloat[(r2 + 132)]);
  f8 = f0 * f8;
  f9 = f2 * f9;
  f13 = Float64(heapClassInst.heapFloat[(r1 + 21)]);
  f14 = Float64(heapClassInst.heapFloat[(r1 + 30)]);
  f1 = f1 + f3;
  f3 = f4 + f5;
  f4 = f6 + f7;
  f5 = f11 * f12;
  f6 = f8 + f9;
  f7 = f10 * f16;
  f8 = Float64(heapClassInst.heapFloat[(r1 + 29)]);
  f9 = f13 * f14;
  f1 = f1 + f3;
  f3 = Float64(heapClassInst.heapFloat[(r1 + 23)]);
  f4 = f4 + f5;
  f5 = f6 + f7;
  f4 = f4 - f5;
  f5 = f8 - f9;
  f1 = f3 * f1;
  f1 = f5 - f1;
  f3 = f3 * f4;
  f1 = f1 - f3;
  f3 = Float64(heapClassInst.heapFloat[(r1 + 31)]);
  f4 = f13 + f1;
  if (f3 <= f4) 
  {
    f3 = Float64(heapClassInst.heapFloat[(r1 + 32)]);
    if (f3 >= f4) 
    {
      heapClassInst.heapFloat[(r1 + 21)] = Float32(f4);
    }
    else {
      f1 = f3 - f13;
      heapClassInst.heapFloat[(r1 + 21)] = Float32(f3);
    }
  }
  else {
    f1 = f3 - f13;
    heapClassInst.heapFloat[(r1 + 21)] = Float32(f3);
  }
  f3 = Float64(heapClassInst.heapFloat[(r0 + 84)]);
  f4 = 0.0;
  if (!(f3 == f4)) 
  {
    f3 = Float64(heapClassInst.heapFloat[(r0 + 138)]);
    f0 = f0 * f3;
    f0 = f0 * f1;
    f3 = Float64(heapClassInst.heapFloat[(r0 + 126)]);
    f5 = Float64(heapClassInst.heapFloat[(r0 + 139)]);
    f6 = Float64(heapClassInst.heapFloat[(r0 + 140)]);
    f0 = f3 + f0;
    f2 = f2 * f5;
    heapClassInst.heapFloat[(r0 + 126)] = Float32(f0);
    f0 = f2 * f1;
    f2 = Float64(heapClassInst.heapFloat[(r0 + 127)]);
    f0 = f2 + f0;
    f2 = f10 * f6;
    heapClassInst.heapFloat[(r0 + 127)] = Float32(f0);
    f0 = f2 * f1;
    f2 = Float64(heapClassInst.heapFloat[(r0 + 128)]);
    f0 = f2 + f0;
    heapClassInst.heapFloat[(r0 + 128)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(r0 + 134)]);
    f0 = f0 * f1;
    f2 = Float64(heapClassInst.heapFloat[(r1 + 12)]);
    f3 = Float64(heapClassInst.heapFloat[(r0 + 136)]);
    f5 = Float64(heapClassInst.heapFloat[(r0 + 135)]);
    f0 = f2 * f0;
    f2 = Float64(heapClassInst.heapFloat[(r0 + 130)]);
    f6 = Float64(heapClassInst.heapFloat[(r1 + 14)]);
    f7 = Float64(heapClassInst.heapFloat[(r1 + 13)]);
    f0 = f2 + f0;
    f2 = f5 * f1;
    heapClassInst.heapFloat[(r0 + 130)] = Float32(f0);
    f0 = f7 * f2;
    f2 = Float64(heapClassInst.heapFloat[(r0 + 131)]);
    f0 = f2 + f0;
    f2 = f3 * f1;
    heapClassInst.heapFloat[(r0 + 131)] = Float32(f0);
    f0 = f6 * f2;
    f2 = Float64(heapClassInst.heapFloat[(r0 + 132)]);
    f0 = f2 + f0;
    heapClassInst.heapFloat[(r0 + 132)] = Float32(f0);
  }
  f0 = Float64(heapClassInst.heapFloat[(r2 + 84)]);
  if (!(f0 == f4)) 
  {
    f0 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
    f2 = Float64(heapClassInst.heapFloat[(r2 + 138)]);
    f0 = f2 * f0;
    f0 = f0 * f1;
    f2 = Float64(heapClassInst.heapFloat[(r2 + 126)]);
    f3 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
    f4 = Float64(heapClassInst.heapFloat[(r2 + 139)]);
    f5 = Float64(heapClassInst.heapFloat[(r1 + 6)]);
    f6 = Float64(heapClassInst.heapFloat[(r2 + 140)]);
    f0 = f2 - f0;
    f2 = f4 * f3;
    heapClassInst.heapFloat[(r2 + 126)] = Float32(f0);
    f0 = f2 * f1;
    f2 = Float64(heapClassInst.heapFloat[(r2 + 127)]);
    f0 = f2 - f0;
    f2 = f6 * f5;
    heapClassInst.heapFloat[(r2 + 127)] = Float32(f0);
    f0 = f2 * f1;
    f2 = Float64(heapClassInst.heapFloat[(r2 + 128)]);
    f0 = f2 - f0;
    heapClassInst.heapFloat[(r2 + 128)] = Float32(f0);
    f0 = Float64(heapClassInst.heapFloat[(r2 + 134)]);
    f0 = f0 * f1;
    f2 = Float64(heapClassInst.heapFloat[(r1 + 16)]);
    f3 = Float64(heapClassInst.heapFloat[(r2 + 136)]);
    f4 = Float64(heapClassInst.heapFloat[(r2 + 135)]);
    f0 = f2 * f0;
    f2 = Float64(heapClassInst.heapFloat[(r2 + 130)]);
    f5 = Float64(heapClassInst.heapFloat[(r1 + 18)]);
    f6 = Float64(heapClassInst.heapFloat[(r1 + 17)]);
    f0 = f2 + f0;
    f2 = f4 * f1;
    heapClassInst.heapFloat[(r2 + 130)] = Float32(f0);
    f0 = f6 * f2;
    f2 = Float64(heapClassInst.heapFloat[(r2 + 131)]);
    f0 = f2 + f0;
    f1 = f3 * f1;
    heapClassInst.heapFloat[(r2 + 131)] = Float32(f0);
    f0 = f5 * f1;
    f1 = Float64(heapClassInst.heapFloat[(r2 + 132)]);
    f0 = f1 + f0;
    heapClassInst.heapFloat[(r2 + 132)] = Float32(f0);
  }
  return;
}

