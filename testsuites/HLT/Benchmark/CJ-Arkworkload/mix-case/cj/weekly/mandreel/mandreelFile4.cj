/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


func memset(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  if (!(r0 == 0))
  {
    r2 = Int64(heapClassInst.heap32[(fp + 1)]);
    r3 = r1;
    while (true) {
      r0 = (r0 + (-1)) | 0;
      r4 = (r3 + 1) | 0;
      heapClassInst.heap8[r3] = Int8(r2);
      r3 = r4;
      if (r0 != 0)
      {
        continue
      }
      else {
        break
      }
    }
  }
  commonVariable.r_g0 = r1;
  return;
}

func _ZN28btCompoundCollisionAlgorithmD0Ev(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV28btCompoundCollisionAlgorithm;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r1 = Int64(heapClassInst.heap32[(r2 + 3)]);
  if (!(r1 < 1))
  {
    r3 = 0;
    while (true) {
      r4 = Int64(heapClassInst.heap32[(r2 + 5)]);
      r5 = r3 << 2;
      r4 = (r4 + r5) | 0;
      r4 = r4 >> 2;
      r4 = Int64(heapClassInst.heap32[(r4)]);
      if (!(r4 == 0))
      {
        r6 = r4 >> 2;
        r6 = Int64(heapClassInst.heap32[(r6)]);
        r6 = r6 >> 2;
        r6 = Int64(heapClassInst.heap32[(r6)]);
        heapClassInst.heap32[(g0)] = Int32(r4);
        __FUNCTION_TABLE__[(r6) >> 2](i7);
        r4 = Int64(heapClassInst.heap32[(r2 + 1)]);
        r6 = r4 >> 2;
        r7 = Int64(heapClassInst.heap32[(r2 + 5)]);
        r5 = (r7 + r5) | 0;
        r6 = Int64(heapClassInst.heap32[(r6)]);
        r6 = r6 >> 2;
        r5 = r5 >> 2;
        r6 = Int64(heapClassInst.heap32[(r6 + 13)]);
        r5 = Int64(heapClassInst.heap32[(r5)]);
        heapClassInst.heap32[(g0)] = Int32(r4);
        heapClassInst.heap32[(g0 + 1)] = Int32(r5);
        __FUNCTION_TABLE__[(r6) >> 2](i7);
      }
      r3 = (r3 + 1) | 0;
      if (r1 != r3)
      {
        continue
      }
      else {
        break
      }
    }
  }
  r1 = Int64(heapClassInst.heap32[(r2 + 5)]);
  if (!(r1 == 0))
  {
    r3 = Int64(heapClassInst.heapU8[r0 + 24]);
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
    heapClassInst.heap32[(r2 + 5)] = 0;
  }
  r1 = 1;
  heapClassInst.heap8[r0 + 24] = Int8(r1);
  heapClassInst.heap32[(r2 + 5)] = 0;
  r1 = _ZTV30btActivatingCollisionAlgorithm;
  heapClassInst.heap32[(r2 + 3)] = 0;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2 + 4)] = 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN28btCompoundCollisionAlgorithmD1Ev(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV28btCompoundCollisionAlgorithm;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r1 = Int64(heapClassInst.heap32[(r2 + 3)]);
  if (!(r1 < 1))
  {
    r3 = 0;
    while (true) {
      r4 = Int64(heapClassInst.heap32[(r2 + 5)]);
      r5 = r3 << 2;
      r4 = (r4 + r5) | 0;
      r4 = r4 >> 2;
      r4 = Int64(heapClassInst.heap32[(r4)]);
      if (!(r4 == 0))
      {
        r6 = r4 >> 2;
        r6 = Int64(heapClassInst.heap32[(r6)]);
        r6 = r6 >> 2;
        r6 = Int64(heapClassInst.heap32[(r6)]);
        heapClassInst.heap32[(g0)] = Int32(r4);
        __FUNCTION_TABLE__[(r6) >> 2](i7);
        r4 = Int64(heapClassInst.heap32[(r2 + 1)]);
        r6 = r4 >> 2;
        r7 = Int64(heapClassInst.heap32[(r2 + 5)]);
        r5 = (r7 + r5) | 0;
        r6 = Int64(heapClassInst.heap32[(r6)]);
        r6 = r6 >> 2;
        r5 = r5 >> 2;
        r6 = Int64(heapClassInst.heap32[(r6 + 13)]);
        r5 = Int64(heapClassInst.heap32[(r5)]);
        heapClassInst.heap32[(g0)] = Int32(r4);
        heapClassInst.heap32[(g0 + 1)] = Int32(r5);
        __FUNCTION_TABLE__[(r6) >> 2](i7);
      }
      r3 = (r3 + 1) | 0;
      if (r1 != r3)
      {
        continue
      }
      else {
        break
      }
    }
  }
  r1 = Int64(heapClassInst.heap32[(r2 + 5)]);
  if (!(r1 == 0))
  {
    r3 = Int64(heapClassInst.heapU8[r0 + 24]);
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
    heapClassInst.heap32[(r2 + 5)] = 0;
  }
  r1 = 1;
  heapClassInst.heap8[r0 + 24] = Int8(r1);
  heapClassInst.heap32[(r2 + 5)] = 0;
  r0 = _ZTV30btActivatingCollisionAlgorithm;
  heapClassInst.heap32[(r2 + 3)] = 0;
  r0 = (r0 + 8) | 0;
  heapClassInst.heap32[(r2 + 4)] = 0;
  heapClassInst.heap32[(r2)] = Int32(r0);
  return;
}

func _ZNK21btConvexInternalShape15getLocalScalingEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = (r0 + 12) | 0;
  commonVariable.r_g0 = r0;
  return;
}

func _ZN21btConvexInternalShape9setMarginEf(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  heapClassInst.heap32[(r0 + 11)] = heapClassInst.heap32[(fp + 1)];
  return;
}

func _ZNK21btConvexInternalShape9getMarginEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var f0: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r0 + 11)]);
  commonVariable.f_g0 = f0;
  return;
}

func _ZNK21btConvexInternalShape28calculateSerializeBufferSizeEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = 52;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK15btTriangleShape14getNumVerticesEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = 3;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK15btTriangleShape9getVertexEiR9btVector3(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 << 4;
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  r0 = (r1 + r0) | 0;
  r1 = r2 >> 2;
  r0 = r0 >> 2;
  heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r0 + 13)];
  heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r0 + 14)];
  heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r0 + 15)];
  heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r0 + 16)];
  return;
}

func _ZNK15btTriangleShape11getNumEdgesEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = 3;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK15btTriangleShape7getEdgeEiR9btVector3S1_(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-16);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 24)]);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
  heapClassInst.heap32[(g0 + 2)] = Int32(r4);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 24)]);
  r2 = (r3 + 1) | 0;
  r2 = (r2 % 3) | 0;
  r3 = Int64(heapClassInst.heap32[(fp + 3)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  heapClassInst.heap32[(g0 + 2)] = Int32(r3);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  return;
}

func _ZNK15btTriangleShape7getAabbERK11btTransformR9btVector3S4_(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-16);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 18)]);
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  r3 = Int64(heapClassInst.heap32[(fp + 2)]);
  r4 = Int64(heapClassInst.heap32[(fp + 3)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  heapClassInst.heap32[(g0 + 2)] = Int32(r3);
  heapClassInst.heap32[(g0 + 3)] = Int32(r4);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  return;
}


func _ZNK15btTriangleShape37localGetSupportingVertexWithoutMarginERK9btVector3(sp: Int64) : Unit
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
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  r2 = r0 >> 2;
  r1 = r1 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r2 + 13)]);
  f1 = Float64(heapClassInst.heapFloat[(r1)]);
  f2 = Float64(heapClassInst.heapFloat[(r2 + 17)]);
  f3 = Float64(heapClassInst.heapFloat[(r2 + 21)]);
  f4 = Float64(heapClassInst.heapFloat[(r2 + 14)]);
  f5 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f6 = Float64(heapClassInst.heapFloat[(r2 + 18)]);
  f7 = Float64(heapClassInst.heapFloat[(r2 + 22)]);
  f0 = f1 * f0;
  f4 = f5 * f4;
  f8 = Float64(heapClassInst.heapFloat[(r2 + 15)]);
  f9 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f10 = Float64(heapClassInst.heapFloat[(r2 + 19)]);
  f11 = Float64(heapClassInst.heapFloat[(r2 + 23)]);
  f2 = f1 * f2;
  f6 = f5 * f6;
  f1 = f1 * f3;
  f3 = f5 * f7;
  f0 = f0 + f4;
  f4 = f9 * f8;
  f2 = f2 + f6;
  f5 = f9 * f10;
  f1 = f1 + f3;
  f3 = f9 * f11;
  f0 = f0 + f4;
  f2 = f2 + f5;
  r1 = Int64(heapClassInst.heap32[(fp)]);
  f1 = f1 + f3;
  if (f0 >= f2) {
    r2 = 2;
    r3 = 0;
    if(f0 >= f1) {
      r2 = r3
    }
  } else {
    r2 = 2;
    r3 = 1;
    if(f2 >= f1){
      r2 = r3
    }

  }
  r2 = r2 << 4;
  r0 = (r0 + r2) | 0;
  r1 = r1 >> 2;
  r0 = r0 >> 2;
  heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r0 + 13)];
  heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r0 + 14)];
  heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r0 + 15)];
  heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r0 + 16)];
  return;
}

func GetSupportingVertexWithoutMargin(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp + 3)]);
  if (!(r0 < 1)) {
    r1 = Int64(heapClassInst.heap32[(fp)]);
    r2 = Int64(heapClassInst.heap32[(fp + 1)]);
    r3 = Int64(heapClassInst.heap32[(fp + 2)]);
    r2 = (r2 + 8) | 0;
    r3 = (r3 + 12) | 0;
    while (true) {
      r4 = r1 >> 2;
      r5 = r2 >> 2;
      f0 = Float64(heapClassInst.heapFloat[(r4 + 13)]);
      f1 = Float64(heapClassInst.heapFloat[(r5 + (-2))]);
      f2 = Float64(heapClassInst.heapFloat[(r4 + 17)]);
      f3 = Float64(heapClassInst.heapFloat[(r4 + 21)]);
      f4 = Float64(heapClassInst.heapFloat[(r4 + 14)]);
      f5 = Float64(heapClassInst.heapFloat[(r5 + (-1))]);
      f6 = Float64(heapClassInst.heapFloat[(r4 + 18)]);
      f7 = Float64(heapClassInst.heapFloat[(r4 + 22)]);
      f0 = f1 * f0;
      f4 = f5 * f4;
      f8 = Float64(heapClassInst.heapFloat[(r4 + 15)]);
      f9 = Float64(heapClassInst.heapFloat[(r5)]);
      f10 = Float64(heapClassInst.heapFloat[(r4 + 19)]);
      f11 = Float64(heapClassInst.heapFloat[(r4 + 23)]);
      f2 = f1 * f2;
      f6 = f5 * f6;
      f1 = f1 * f3;
      f3 = f5 * f7;
      f0 = f0 + f4;
      f4 = f9 * f8;
      f2 = f2 + f6;
      f5 = f9 * f10;
      f1 = f1 + f3;
      f3 = f9 * f11;
      f0 = f0 + f4;
      f2 = f2 + f5;
      f1 = f1 + f3;
      if (f0 >= f2) {
        r4 = 2;
        r5 = 0;
        if(f0 >= f1){
          r4 = r5
        }
      } else {
        r4 = 2;
        r5 = 1;
        if(f2 >= f1){
          r4 = r5
        }
      }
      r4 = r4 << 4;
      r4 = (r1 + r4) | 0;
      r5 = r3 >> 2;
      r4 = r4 >> 2;
      heapClassInst.heap32[(r5 + (-3))] = heapClassInst.heap32[(r4 + 13)];
      heapClassInst.heap32[(r5 + (-2))] = heapClassInst.heap32[(r4 + 14)];
      r0 = (r0 + (-1)) | 0;
      r2 = (r2 + 16) | 0;
      r3 = (r3 + 16) | 0;
      heapClassInst.heap32[(r5 + (-1))] = heapClassInst.heap32[(r4 + 15)];
      heapClassInst.heap32[(r5)] = heapClassInst.heap32[(r4 + 16)];
      if (r0 != 0) {
        continue
      } else {
        break
      }
    }
  }
  return;
}

func _ZNK15btTriangleShape8getPlaneER9btVector3S1_i(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-16);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 28)]);
  r2 = Int64(heapClassInst.heap32[(fp + 3)]);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  heapClassInst.heap32[(g0 + 2)] = Int32(r3);
  heapClassInst.heap32[(g0 + 3)] = Int32(r4);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  return;
}

func _ZNK15btTriangleShape12getNumPlanesEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = 1;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK15btTriangleShape7getNameEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = _E2_str109;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK15btTriangleShape36getNumPreferredPenetrationDirectionsEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = 2;
  commonVariable.r_g0 = r0;
  return;
}

func _ZN24btConvexTriangleCallbackD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV24btConvexTriangleCallback;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  r1 = Int64(heapClassInst.heap32[(r0 + 12)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 5)]);
  r3 = Int64(heapClassInst.heap32[(r0 + 16)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r0 + 12)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 4)]);
  r3 = Int64(heapClassInst.heap32[(r0 + 16)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
  r1 = _ZTV18btTriangleCallback;
  r1 = (r1 + 8) | 0;
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN24btConvexTriangleCallbackD0Ev(sp: Int64) : Unit
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
  r1 = _ZTV24btConvexTriangleCallback;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r1 = Int64(heapClassInst.heap32[(r2 + 12)]);
  r3 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3 + 5)]);
  r4 = Int64(heapClassInst.heap32[(r2 + 16)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(r4);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r2 + 12)]);
  r3 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3 + 4)]);
  r4 = Int64(heapClassInst.heap32[(r2 + 16)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(r4);
  r1 = _ZTV18btTriangleCallback;
  r1 = (r1 + 8) | 0;
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN24btConvexTriangleCallback15processTriangleEP9btVector3ii(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-240);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 13)]);
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  r3 = Int64(heapClassInst.heap32[(r0 + 12)]);
  r4 = Int64(heapClassInst.heap32[(r0 + 2)]);
  if (!(r1 == 0))
  {
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1 + 5)]);
    if (!(r1 == 0))
    {
      r5 = r1 >> 2;
      r5 = Int64(heapClassInst.heap32[(r5)]);
      r5 = r5 >> 2;
      r5 = Int64(heapClassInst.heap32[(r5 + 12)]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      __FUNCTION_TABLE__[(r5) >> 2](i7);
      r1 = commonVariable.r_g0 & 1;
      if (!(r1 == 0))
      {
        r1 = sp + (-112);
        r5 = r1 >> 2;
        heapClassInst.heap32[(fp + (-28))] = 1065353216;
        heapClassInst.heap32[(r5 + 1)] = 1065353216;
        heapClassInst.heap32[(r5 + 2)] = 0;
        heapClassInst.heap32[(r5 + 3)] = 0;
        r5 = Int64(heapClassInst.heap32[(r0 + 13)]);
        r5 = r5 >> 2;
        r6 = r4 >> 2;
        r7 = r2 >> 2;
        r8 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r8 = r8 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r7 + 4)]);
        f1 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
        f2 = Float64(heapClassInst.heapFloat[(r7 + 5)]);
        f3 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
        r8 = Int64(heapClassInst.heap32[(r8)]);
        f4 = Float64(heapClassInst.heapFloat[(r6 + 5)]);
        f5 = Float64(heapClassInst.heapFloat[(r6 + 6)]);
        f1 = f1 * f0;
        f3 = f3 * f2;
        f6 = Float64(heapClassInst.heapFloat[(r7 + 6)]);
        f7 = Float64(heapClassInst.heapFloat[(r6 + 3)]);
        r8 = r8 >> 2;
        f8 = Float64(heapClassInst.heapFloat[(r6 + 9)]);
        f9 = Float64(heapClassInst.heapFloat[(r6 + 10)]);
        f10 = Float64(heapClassInst.heapFloat[(r6 + 7)]);
        f4 = f4 * f0;
        f5 = f5 * f2;
        f1 = f1 + f3;
        f3 = f7 * f6;
        f7 = Float64(heapClassInst.heapFloat[(r6 + 11)]);
        r8 = Int64(heapClassInst.heap32[(r8 + 2)]);
        f0 = f8 * f0;
        f2 = f9 * f2;
        f4 = f4 + f5;
        f5 = f10 * f6;
        f1 = f1 + f3;
        f3 = Float64(heapClassInst.heapFloat[(r6 + 13)]);
        f8 = Float64(heapClassInst.heapFloat[(r6 + 15)]);
        f9 = Float64(heapClassInst.heapFloat[(r6 + 14)]);
        r9 = sp + (-96);
        f4 = f4 + f5;
        f0 = f0 + f2;
        f2 = f7 * f6;
        f1 = f1 + f3;
        f0 = f0 + f2;
        r10 = r9 >> 2;
        f2 = f4 + f9;
        heapClassInst.heapFloat[(fp + (-24))] = Float32(f1);
        f0 = f0 + f8;
        heapClassInst.heapFloat[(r10 + 1)] = Float32(f2);
        heapClassInst.heapFloat[(r10 + 2)] = Float32(f0);
        heapClassInst.heap32[(r10 + 3)] = 0;
        f0 = Float64(heapClassInst.heapFloat[(r7)]);
        f1 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
        f2 = Float64(heapClassInst.heapFloat[(r7 + 1)]);
        f3 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
        f4 = Float64(heapClassInst.heapFloat[(r6 + 5)]);
        f5 = Float64(heapClassInst.heapFloat[(r6 + 6)]);
        f1 = f1 * f0;
        f3 = f3 * f2;
        f6 = Float64(heapClassInst.heapFloat[(r7 + 2)]);
        f7 = Float64(heapClassInst.heapFloat[(r6 + 3)]);
        f8 = Float64(heapClassInst.heapFloat[(r6 + 9)]);
        f9 = Float64(heapClassInst.heapFloat[(r6 + 10)]);
        f10 = Float64(heapClassInst.heapFloat[(r6 + 7)]);
        f4 = f4 * f0;
        f5 = f5 * f2;
        f1 = f1 + f3;
        f3 = f7 * f6;
        f7 = Float64(heapClassInst.heapFloat[(r6 + 11)]);
        f0 = f8 * f0;
        f2 = f9 * f2;
        f4 = f4 + f5;
        f5 = f10 * f6;
        f1 = f1 + f3;
        f3 = Float64(heapClassInst.heapFloat[(r6 + 13)]);
        f8 = Float64(heapClassInst.heapFloat[(r6 + 15)]);
        f9 = Float64(heapClassInst.heapFloat[(r6 + 14)]);
        r10 = sp + (-80);
        f4 = f4 + f5;
        f0 = f0 + f2;
        f2 = f7 * f6;
        f1 = f1 + f3;
        f0 = f0 + f2;
        r11 = r10 >> 2;
        f2 = f4 + f9;
        heapClassInst.heapFloat[(fp + (-20))] = Float32(f1);
        f0 = f0 + f8;
        heapClassInst.heapFloat[(r11 + 1)] = Float32(f2);
        heapClassInst.heapFloat[(r11 + 2)] = Float32(f0);
        heapClassInst.heap32[(r11 + 3)] = 0;
        r5 = Int64(heapClassInst.heap32[(r5 + 5)]);
        heapClassInst.heap32[(g0)] = Int32(r5);
        heapClassInst.heap32[(g0 + 1)] = Int32(r10);
        heapClassInst.heap32[(g0 + 2)] = Int32(r9);
        heapClassInst.heap32[(g0 + 3)] = Int32(r1);
        __FUNCTION_TABLE__[(r8) >> 2](i7);
        r5 = Int64(heapClassInst.heap32[(r0 + 13)]);
        r5 = r5 >> 2;
        r8 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r8 = r8 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r7 + 8)]);
        f1 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
        f2 = Float64(heapClassInst.heapFloat[(r7 + 9)]);
        f3 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
        r8 = Int64(heapClassInst.heap32[(r8)]);
        f4 = Float64(heapClassInst.heapFloat[(r6 + 5)]);
        f5 = Float64(heapClassInst.heapFloat[(r6 + 6)]);
        f1 = f1 * f0;
        f3 = f3 * f2;
        f6 = Float64(heapClassInst.heapFloat[(r7 + 10)]);
        f7 = Float64(heapClassInst.heapFloat[(r6 + 3)]);
        r8 = r8 >> 2;
        f8 = Float64(heapClassInst.heapFloat[(r6 + 9)]);
        f9 = Float64(heapClassInst.heapFloat[(r6 + 10)]);
        f10 = Float64(heapClassInst.heapFloat[(r6 + 7)]);
        f4 = f4 * f0;
        f5 = f5 * f2;
        f1 = f1 + f3;
        f3 = f7 * f6;
        f7 = Float64(heapClassInst.heapFloat[(r6 + 11)]);
        r8 = Int64(heapClassInst.heap32[(r8 + 2)]);
        f0 = f8 * f0;
        f2 = f9 * f2;
        f4 = f4 + f5;
        f5 = f10 * f6;
        f1 = f1 + f3;
        f3 = Float64(heapClassInst.heapFloat[(r6 + 13)]);
        f8 = Float64(heapClassInst.heapFloat[(r6 + 15)]);
        f9 = Float64(heapClassInst.heapFloat[(r6 + 14)]);
        r9 = sp + (-64);
        f4 = f4 + f5;
        f0 = f0 + f2;
        f2 = f7 * f6;
        f1 = f1 + f3;
        f0 = f0 + f2;
        r10 = r9 >> 2;
        f2 = f4 + f9;
        heapClassInst.heapFloat[(fp + (-16))] = Float32(f1);
        f0 = f0 + f8;
        heapClassInst.heapFloat[(r10 + 1)] = Float32(f2);
        heapClassInst.heapFloat[(r10 + 2)] = Float32(f0);
        heapClassInst.heap32[(r10 + 3)] = 0;
        f0 = Float64(heapClassInst.heapFloat[(r7 + 4)]);
        f1 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
        f2 = Float64(heapClassInst.heapFloat[(r7 + 5)]);
        f3 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
        f4 = Float64(heapClassInst.heapFloat[(r6 + 5)]);
        f5 = Float64(heapClassInst.heapFloat[(r6 + 6)]);
        f1 = f1 * f0;
        f3 = f3 * f2;
        f6 = Float64(heapClassInst.heapFloat[(r7 + 6)]);
        f7 = Float64(heapClassInst.heapFloat[(r6 + 3)]);
        f8 = Float64(heapClassInst.heapFloat[(r6 + 9)]);
        f9 = Float64(heapClassInst.heapFloat[(r6 + 10)]);
        f10 = Float64(heapClassInst.heapFloat[(r6 + 7)]);
        f4 = f4 * f0;
        f5 = f5 * f2;
        f1 = f1 + f3;
        f3 = f7 * f6;
        f7 = Float64(heapClassInst.heapFloat[(r6 + 11)]);
        f0 = f8 * f0;
        f2 = f9 * f2;
        f4 = f4 + f5;
        f5 = f10 * f6;
        f1 = f1 + f3;
        f3 = Float64(heapClassInst.heapFloat[(r6 + 13)]);
        f8 = Float64(heapClassInst.heapFloat[(r6 + 15)]);
        f9 = Float64(heapClassInst.heapFloat[(r6 + 14)]);
        r10 = sp + (-48);
        f4 = f4 + f5;
        f0 = f0 + f2;
        f2 = f7 * f6;
        f1 = f1 + f3;
        f0 = f0 + f2;
        r11 = r10 >> 2;
        f2 = f4 + f9;
        heapClassInst.heapFloat[(fp + (-12))] = Float32(f1);
        f0 = f0 + f8;
        heapClassInst.heapFloat[(r11 + 1)] = Float32(f2);
        heapClassInst.heapFloat[(r11 + 2)] = Float32(f0);
        heapClassInst.heap32[(r11 + 3)] = 0;
        r5 = Int64(heapClassInst.heap32[(r5 + 5)]);
        heapClassInst.heap32[(g0)] = Int32(r5);
        heapClassInst.heap32[(g0 + 1)] = Int32(r10);
        heapClassInst.heap32[(g0 + 2)] = Int32(r9);
        heapClassInst.heap32[(g0 + 3)] = Int32(r1);
        __FUNCTION_TABLE__[(r8) >> 2](i7);
        r5 = Int64(heapClassInst.heap32[(r0 + 13)]);
        r5 = r5 >> 2;
        r8 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r8 = r8 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r7)]);
        f1 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
        f2 = Float64(heapClassInst.heapFloat[(r7 + 1)]);
        f3 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
        r8 = Int64(heapClassInst.heap32[(r8)]);
        f4 = Float64(heapClassInst.heapFloat[(r6 + 5)]);
        f5 = Float64(heapClassInst.heapFloat[(r6 + 6)]);
        f1 = f1 * f0;
        f3 = f3 * f2;
        f6 = Float64(heapClassInst.heapFloat[(r7 + 2)]);
        f7 = Float64(heapClassInst.heapFloat[(r6 + 3)]);
        r8 = r8 >> 2;
        f8 = Float64(heapClassInst.heapFloat[(r6 + 9)]);
        f9 = Float64(heapClassInst.heapFloat[(r6 + 10)]);
        f10 = Float64(heapClassInst.heapFloat[(r6 + 7)]);
        f4 = f4 * f0;
        f5 = f5 * f2;
        f1 = f1 + f3;
        f3 = f7 * f6;
        f7 = Float64(heapClassInst.heapFloat[(r6 + 11)]);
        r8 = Int64(heapClassInst.heap32[(r8 + 2)]);
        f0 = f8 * f0;
        f2 = f9 * f2;
        f4 = f4 + f5;
        f5 = f10 * f6;
        f1 = f1 + f3;
        f3 = Float64(heapClassInst.heapFloat[(r6 + 13)]);
        f8 = Float64(heapClassInst.heapFloat[(r6 + 15)]);
        f9 = Float64(heapClassInst.heapFloat[(r6 + 14)]);
        r9 = sp + (-32);
        f4 = f4 + f5;
        f0 = f0 + f2;
        f2 = f7 * f6;
        f1 = f1 + f3;
        f0 = f0 + f2;
        r10 = r9 >> 2;
        f2 = f4 + f9;
        heapClassInst.heapFloat[(fp + (-8))] = Float32(f1);
        f0 = f0 + f8;
        heapClassInst.heapFloat[(r10 + 1)] = Float32(f2);
        heapClassInst.heapFloat[(r10 + 2)] = Float32(f0);
        heapClassInst.heap32[(r10 + 3)] = 0;
        f0 = Float64(heapClassInst.heapFloat[(r7 + 8)]);
        f1 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
        f2 = Float64(heapClassInst.heapFloat[(r7 + 9)]);
        f3 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
        f4 = Float64(heapClassInst.heapFloat[(r6 + 5)]);
        f5 = Float64(heapClassInst.heapFloat[(r6 + 6)]);
        f1 = f1 * f0;
        f3 = f3 * f2;
        f6 = Float64(heapClassInst.heapFloat[(r7 + 10)]);
        f7 = Float64(heapClassInst.heapFloat[(r6 + 3)]);
        f8 = Float64(heapClassInst.heapFloat[(r6 + 9)]);
        f9 = Float64(heapClassInst.heapFloat[(r6 + 10)]);
        f10 = Float64(heapClassInst.heapFloat[(r6 + 7)]);
        f4 = f4 * f0;
        f5 = f5 * f2;
        f1 = f1 + f3;
        f3 = f7 * f6;
        f7 = Float64(heapClassInst.heapFloat[(r6 + 11)]);
        f0 = f8 * f0;
        f2 = f9 * f2;
        f4 = f4 + f5;
        f5 = f10 * f6;
        f1 = f1 + f3;
        f3 = Float64(heapClassInst.heapFloat[(r6 + 13)]);
        f8 = Float64(heapClassInst.heapFloat[(r6 + 15)]);
        f9 = Float64(heapClassInst.heapFloat[(r6 + 14)]);
        r6 = sp + (-16);
        f4 = f4 + f5;
        f0 = f0 + f2;
        f2 = f7 * f6;
        f1 = f1 + f3;
        f0 = f0 + f2;
        r7 = r6 >> 2;
        f2 = f4 + f9;
        heapClassInst.heapFloat[(fp + (-4))] = Float32(f1);
        f0 = f0 + f8;
        heapClassInst.heapFloat[(r7 + 1)] = Float32(f2);
        heapClassInst.heapFloat[(r7 + 2)] = Float32(f0);
        heapClassInst.heap32[(r7 + 3)] = 0;
        r5 = Int64(heapClassInst.heap32[(r5 + 5)]);
        heapClassInst.heap32[(g0)] = Int32(r5);
        heapClassInst.heap32[(g0 + 1)] = Int32(r6);
        heapClassInst.heap32[(g0 + 2)] = Int32(r9);
        heapClassInst.heap32[(g0 + 3)] = Int32(r1);
        __FUNCTION_TABLE__[(r8) >> 2](i7);
      }
    }
  }
  r1 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 48)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 1)]);
  if (!(r1 > 19))
  {
    r1 = Int64(heapClassInst.heap32[(fp + 2)]);
    r5 = Int64(heapClassInst.heap32[(fp + 3)]);
    r6 = sp + (-216);
    r7 = r6 >> 2;
    heapClassInst.heap32[(r7 + 2)] = 0;
    heapClassInst.heap32[(r7 + 3)] = 1065353216;
    heapClassInst.heap32[(r7 + 4)] = 1065353216;
    r8 = _ZTV15btTriangleShape;
    heapClassInst.heap32[(r7 + 5)] = 1065353216;
    r8 = (r8 + 8) | 0;
    heapClassInst.heap32[(r7 + 6)] = 0;
    heapClassInst.heap32[(fp + (-54))] = Int32(r8);
    r2 = r2 >> 2;
    heapClassInst.heap32[(r7 + 1)] = 1;
    heapClassInst.heap32[(r7 + 13)] = heapClassInst.heap32[(r2)];
    heapClassInst.heap32[(r7 + 14)] = heapClassInst.heap32[(r2 + 1)];
    heapClassInst.heap32[(r7 + 15)] = heapClassInst.heap32[(r2 + 2)];
    heapClassInst.heap32[(r7 + 16)] = heapClassInst.heap32[(r2 + 3)];
    heapClassInst.heap32[(r7 + 17)] = heapClassInst.heap32[(r2 + 4)];
    heapClassInst.heap32[(r7 + 18)] = heapClassInst.heap32[(r2 + 5)];
    heapClassInst.heap32[(r7 + 19)] = heapClassInst.heap32[(r2 + 6)];
    heapClassInst.heap32[(r7 + 20)] = heapClassInst.heap32[(r2 + 7)];
    heapClassInst.heap32[(r7 + 21)] = heapClassInst.heap32[(r2 + 8)];
    heapClassInst.heap32[(r7 + 22)] = heapClassInst.heap32[(r2 + 9)];
    heapClassInst.heap32[(r7 + 23)] = heapClassInst.heap32[(r2 + 10)];
    heapClassInst.heap32[(r7 + 24)] = heapClassInst.heap32[(r2 + 11)];
    r2 = r4 >> 2;
    heapClassInst.heap32[(r7 + 11)] = heapClassInst.heap32[(r0 + 14)];
    r4 = Int64(heapClassInst.heap32[(r2 + 48)]);
    heapClassInst.heap32[(r2 + 48)] = Int32(r6);
    r6 = r3 >> 2;
    r7 = Int64(heapClassInst.heap32[(r6)]);
    r7 = r7 >> 2;
    r7 = Int64(heapClassInst.heap32[(r7 + 2)]);
    r8 = Int64(heapClassInst.heap32[(r0 + 16)]);
    r9 = Int64(heapClassInst.heap32[(r0 + 2)]);
    r10 = Int64(heapClassInst.heap32[(r0 + 1)]);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0 + 1)] = Int32(r10);
    heapClassInst.heap32[(g0 + 2)] = Int32(r9);
    heapClassInst.heap32[(g0 + 3)] = Int32(r8);
    __FUNCTION_TABLE__[(r7) >> 2](i7);
    r7 = commonVariable.r_g0;
    r8 = Int64(heapClassInst.heap32[(r0 + 11)]);
    r9 = r8 >> 2;
    r10 = Int64(heapClassInst.heap32[(r9)]);
    r9 = Int64(heapClassInst.heap32[(r9 + 34)]);
    r11 = Int64(heapClassInst.heap32[(r0 + 2)]);
    if (r9 != r11)
    {
      r9 = r10 >> 2;
      r9 = Int64(heapClassInst.heap32[(r9 + 3)]);
      heapClassInst.heap32[(g0)] = Int32(r8);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      heapClassInst.heap32[(g0 + 2)] = Int32(r5);
      __FUNCTION_TABLE__[(r9) >> 2](i7);
    }
    else {
      r10 = r10 >> 2;
      r10 = Int64(heapClassInst.heap32[(r10 + 2)]);
      heapClassInst.heap32[(g0)] = Int32(r8);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      heapClassInst.heap32[(g0 + 2)] = Int32(r5);
      __FUNCTION_TABLE__[(r10) >> 2](i7);
    }
    r1 = r7 >> 2;
    r5 = Int64(heapClassInst.heap32[(r1)]);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5 + 2)]);
    r8 = Int64(heapClassInst.heap32[(r0 + 11)]);
    r9 = Int64(heapClassInst.heap32[(r0 + 13)]);
    r10 = Int64(heapClassInst.heap32[(r0 + 2)]);
    r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
    heapClassInst.heap32[(g0)] = Int32(r7);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    heapClassInst.heap32[(g0 + 2)] = Int32(r10);
    heapClassInst.heap32[(g0 + 3)] = Int32(r9);
    heapClassInst.heap32[(g0 + 4)] = Int32(r8);
    __FUNCTION_TABLE__[(r5) >> 2](i7);
    r0 = Int64(heapClassInst.heap32[(r1)]);
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0)]);
    heapClassInst.heap32[(g0)] = Int32(r7);
    __FUNCTION_TABLE__[(r0) >> 2](i7);
    r0 = Int64(heapClassInst.heap32[(r6)]);
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0 + 13)]);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0 + 1)] = Int32(r7);
    __FUNCTION_TABLE__[(r0) >> 2](i7);
    heapClassInst.heap32[(r2 + 48)] = Int32(r4);
  }
  return;
}

func _ZZN33btConvexConcaveCollisionAlgorithm21calculateTimeOfImpactEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResultEN31LocalTriangleSphereCastCallbackD1Ev(sp: Int64) : Unit
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

func _ZZN33btConvexConcaveCollisionAlgorithm21calculateTimeOfImpactEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResultEN31LocalTriangleSphereCastCallbackD0Ev(sp: Int64) : Unit
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

func _ZZN33btConvexConcaveCollisionAlgorithm21calculateTimeOfImpactEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResultEN31LocalTriangleSphereCastCallback15processTriangleEP9btVector3ii(sp: Int64) : Unit
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
  var f0: Float64 = 0.0
  var f1: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-800);
  var g0 = i7 >> 2;
  r0 = sp + (-64);
  r1 = r0 >> 2;
  heapClassInst.heap32[(fp + (-16))] = 1065353216;
  heapClassInst.heap32[(r1 + 1)] = 0;
  heapClassInst.heap32[(r1 + 2)] = 0;
  heapClassInst.heap32[(r1 + 3)] = 0;
  heapClassInst.heap32[(r1 + 4)] = 0;
  heapClassInst.heap32[(r1 + 5)] = 1065353216;
  heapClassInst.heap32[(r1 + 6)] = 0;
  heapClassInst.heap32[(r1 + 7)] = 0;
  heapClassInst.heap32[(r1 + 8)] = 0;
  heapClassInst.heap32[(r1 + 9)] = 0;
  heapClassInst.heap32[(r1 + 10)] = 1065353216;
  heapClassInst.heap32[(r1 + 11)] = 0;
  heapClassInst.heap32[(r1 + 12)] = 0;
  heapClassInst.heap32[(r1 + 13)] = 0;
  r2 = _ZTVN12btConvexCast10CastResultE;
  heapClassInst.heap32[(r1 + 14)] = 0;
  r3 = sp + (-240);
  r2 = (r2 + 8) | 0;
  heapClassInst.heap32[(r1 + 15)] = 0;
  r1 = r3 >> 2;
  heapClassInst.heap32[(fp + (-60))] = Int32(r2);
  r2 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heap32[(r1 + 42)] = 0;
  r4 = r2 >> 2;
  heapClassInst.heap32[(r1 + 43)] = 0;
  r5 = sp + (-296);
  heapClassInst.heap32[(r1 + 41)] = heapClassInst.heap32[(r4 + 50)];
  r6 = r5 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r4 + 49)]);
  heapClassInst.heap32[(r6 + 2)] = 0;
  heapClassInst.heap32[(r6 + 3)] = 1065353216;
  heapClassInst.heap32[(r6 + 4)] = 1065353216;
  r7 = _ZTV13btSphereShape;
  heapClassInst.heap32[(r6 + 5)] = 1065353216;
  r7 = (r7 + 8) | 0;
  heapClassInst.heap32[(r6 + 6)] = 0;
  heapClassInst.heap32[(fp + (-74))] = Int32(r7);
  heapClassInst.heap32[(r6 + 1)] = 8;
  r7 = sp + (-400);
  heapClassInst.heapFloat[(r6 + 7)] = Float32(f0);
  r8 = r7 >> 2;
  heapClassInst.heapFloat[(r6 + 11)] = Float32(f0);
  heapClassInst.heap32[(r8 + 2)] = 0;
  heapClassInst.heap32[(r8 + 3)] = 1065353216;
  heapClassInst.heap32[(r8 + 4)] = 1065353216;
  heapClassInst.heap32[(r8 + 5)] = 1065353216;
  r6 = _ZTV15btTriangleShape;
  heapClassInst.heap32[(r8 + 6)] = 0;
  r6 = (r6 + 8) | 0;
  heapClassInst.heap32[(r8 + 11)] = 1025758986;
  r9 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heap32[(fp + (-100))] = Int32(r6);
  r6 = r9 >> 2;
  heapClassInst.heap32[(r8 + 1)] = 1;
  heapClassInst.heap32[(r8 + 13)] = heapClassInst.heap32[(r6)];
  heapClassInst.heap32[(r8 + 14)] = heapClassInst.heap32[(r6 + 1)];
  heapClassInst.heap32[(r8 + 15)] = heapClassInst.heap32[(r6 + 2)];
  heapClassInst.heap32[(r8 + 16)] = heapClassInst.heap32[(r6 + 3)];
  heapClassInst.heap32[(r8 + 17)] = heapClassInst.heap32[(r6 + 4)];
  heapClassInst.heap32[(r8 + 18)] = heapClassInst.heap32[(r6 + 5)];
  heapClassInst.heap32[(r8 + 19)] = heapClassInst.heap32[(r6 + 6)];
  heapClassInst.heap32[(r8 + 20)] = heapClassInst.heap32[(r6 + 7)];
  heapClassInst.heap32[(r8 + 21)] = heapClassInst.heap32[(r6 + 8)];
  heapClassInst.heap32[(r8 + 22)] = heapClassInst.heap32[(r6 + 9)];
  r9 = sp + (-760);
  heapClassInst.heap32[(r8 + 23)] = heapClassInst.heap32[(r6 + 10)];
  r10 = r9 >> 2;
  heapClassInst.heap32[(r8 + 24)] = heapClassInst.heap32[(r6 + 11)];
  r6 = _ZTV22btSubsimplexConvexCast;
  r8 = 0;
  heapClassInst.heap32[(r10 + 77)] = 953267991;
  r10 = sp + (-776);
  r6 = (r6 + 8) | 0;
  heapClassInst.heap8[sp + (-428)] = Int8(r8);
  r8 = r10 >> 2;
  heapClassInst.heap32[(fp + (-194))] = Int32(r6);
  heapClassInst.heap32[(r8 + 1)] = Int32(r9);
  heapClassInst.heap32[(r8 + 2)] = Int32(r5);
  heapClassInst.heap32[(r8 + 3)] = Int32(r7);
  r5 = (r2 + 4) | 0;
  r2 = (r2 + 68) | 0;
  heapClassInst.heap32[(g0)] = Int32(r10);
  heapClassInst.heap32[(g0 + 1)] = Int32(r5);
  heapClassInst.heap32[(g0 + 2)] = Int32(r2);
  heapClassInst.heap32[(g0 + 3)] = Int32(r0);
  heapClassInst.heap32[(g0 + 4)] = Int32(r0);
  heapClassInst.heap32[(g0 + 5)] = Int32(r3);
  _ZN22btSubsimplexConvexCast16calcTimeOfImpactERK11btTransformS2_S2_S2_RN12btConvexCast10CastResultE(i7);
  r0 = commonVariable.r_g0;
  if (!(r0 == 0))
  {
    f0 = Float64(heapClassInst.heapFloat[(r1 + 41)]);
    f1 = Float64(heapClassInst.heapFloat[(r4 + 50)]);
    if (!(f1 <= f0))
    {
      heapClassInst.heapFloat[(r4 + 50)] = Float32(f0);
    }
  }
  return;
}

func _ZN15btTriangleShapeD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV13btConvexShape;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN15btTriangleShapeD0Ev(sp: Int64) : Unit
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
  r1 = _ZTV13btConvexShape;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
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

func _ZNK15btTriangleShape21calculateLocalInertiaEfR9btVector3(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-16);
  var g0 = i7 >> 2;
  r0 = _E2_str10;
  r1 = _E2_str3112;
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  heapClassInst.heap32[(g0 + 2)] = 125;
  _assert(i7);
}

func _ZNK21btConvexInternalShape9serializeEPvP12btSerializer(sp: Int64) : Unit
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
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 10)]);
  r3 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = commonVariable.r_g0;
  r4 = Int64(heapClassInst.heap32[(r1)]);
  r4 = r4 >> 2;
  r4 = Int64(heapClassInst.heap32[(r4 + 7)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  r5 = Int64(heapClassInst.heap32[(fp + 1)]);
  __FUNCTION_TABLE__[(r4) >> 2](i7);
  r4 = commonVariable.r_g0;
  r5 = r5 >> 2;
  heapClassInst.heap32[(r5)] = Int32(r4);
  if (!(r4 == 0))
  {
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1 + 12)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
    __FUNCTION_TABLE__[(r1) >> 2](i7);
  }
  r0 = r3 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 1)]);
  heapClassInst.heap32[(r5 + 1)] = Int32(r1);
  heapClassInst.heap32[(r5 + 7)] = heapClassInst.heap32[(r0 + 7)];
  heapClassInst.heap32[(r5 + 8)] = heapClassInst.heap32[(r0 + 8)];
  heapClassInst.heap32[(r5 + 9)] = heapClassInst.heap32[(r0 + 9)];
  heapClassInst.heap32[(r5 + 10)] = heapClassInst.heap32[(r0 + 10)];
  heapClassInst.heap32[(r5 + 3)] = heapClassInst.heap32[(r0 + 3)];
  heapClassInst.heap32[(r5 + 4)] = heapClassInst.heap32[(r0 + 4)];
  heapClassInst.heap32[(r5 + 5)] = heapClassInst.heap32[(r0 + 5)];
  heapClassInst.heap32[(r5 + 6)] = heapClassInst.heap32[(r0 + 6)];
  heapClassInst.heap32[(r5 + 11)] = heapClassInst.heap32[(r0 + 11)];
  r0 = _E2_str1110;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK15btTriangleShape32getPreferredPenetrationDirectionEiR9btVector3(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r0 + 23)]);
  f1 = Float64(heapClassInst.heapFloat[(r0 + 15)]);
  f2 = Float64(heapClassInst.heapFloat[(r0 + 19)]);
  f3 = Float64(heapClassInst.heapFloat[(r0 + 22)]);
  f4 = Float64(heapClassInst.heapFloat[(r0 + 14)]);
  f5 = Float64(heapClassInst.heapFloat[(r0 + 18)]);
  f5 = f5 - f4;
  f0 = f0 - f1;
  f1 = f2 - f1;
  f2 = f3 - f4;
  f3 = Float64(heapClassInst.heapFloat[(r0 + 21)]);
  f4 = Float64(heapClassInst.heapFloat[(r0 + 13)]);
  f6 = Float64(heapClassInst.heapFloat[(r0 + 17)]);
  f3 = f3 - f4;
  f4 = f6 - f4;
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  f6 = f5 * f0;
  f7 = f1 * f2;
  f6 = f6 - f7;
  f1 = f1 * f3;
  f0 = f4 * f0;
  r0 = r0 >> 2;
  f0 = f1 - f0;
  heapClassInst.heapFloat[(r0)] = Float32(f6);
  f1 = f4 * f2;
  f2 = f5 * f3;
  f1 = f1 - f2;
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f0);
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f1);
  f2 = f6 * f6;
  f0 = f0 * f0;
  heapClassInst.heap32[(r0 + 3)] = 0;
  f0 = f2 + f0;
  f1 = f1 * f1;
  f0 = f0 + f1;
  heapClassInst.heapFloat[(g0)] = Float32(f0);
  sqrtf(i7);
  f1 = 1.0;
  f0 = f1 / commonVariable.f_g0;
  f1 = Float64(heapClassInst.heapFloat[(r0)]);
  f1 = f1 * f0;
  heapClassInst.heapFloat[(r0)] = Float32(f1);
  f2 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f2 = f2 * f0;
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f2);
  f3 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f0 = f3 * f0;
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  if (!(r1 == 0))
  {
    f1 = -f1;
    f2 = -f2;
    heapClassInst.heapFloat[(r0)] = Float32(f1);
    f0 = -f0;
    heapClassInst.heapFloat[(r0 + 1)] = Float32(f2);
    heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
  }
  return;
}

func _ZNK15btTriangleShape8isInsideERK9btVector3f(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-48);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r1 + 19)]);
  f1 = Float64(heapClassInst.heapFloat[(r1 + 15)]);
  f2 = Float64(heapClassInst.heapFloat[(r1 + 23)]);
  f3 = Float64(heapClassInst.heapFloat[(r1 + 17)]);
  f4 = Float64(heapClassInst.heapFloat[(r1 + 13)]);
  f5 = Float64(heapClassInst.heapFloat[(r1 + 21)]);
  f6 = Float64(heapClassInst.heapFloat[(r1 + 22)]);
  f7 = Float64(heapClassInst.heapFloat[(r1 + 14)]);
  f8 = Float64(heapClassInst.heapFloat[(r1 + 18)]);
  f0 = f0 - f1;
  f6 = f6 - f7;
  f3 = f3 - f4;
  f1 = f2 - f1;
  f2 = f8 - f7;
  f4 = f5 - f4;
  f5 = f2 * f1;
  f7 = f0 * f6;
  f0 = f0 * f4;
  f1 = f3 * f1;
  f5 = f5 - f7;
  f0 = f0 - f1;
  f1 = f3 * f6;
  f2 = f2 * f4;
  f1 = f1 - f2;
  f2 = f5 * f5;
  f3 = f0 * f0;
  f2 = f2 + f3;
  f3 = f1 * f1;
  f2 = f2 + f3;
  heapClassInst.heapFloat[(g0)] = Float32(f2);
  sqrtf(i7);
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  f3 = 1.0;
  r2 = r2 >> 2;
  f2 = f3 / commonVariable.f_g0;
  f4 = f5 * f2;
  f5 = Float64(heapClassInst.heapFloat[(r2)]);
  f6 = Float64(heapClassInst.heapFloat[(r1 + 13)]);
  f0 = f0 * f2;
  f7 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
  f8 = Float64(heapClassInst.heapFloat[(r1 + 14)]);
  f1 = f1 * f2;
  f2 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
  f9 = Float64(heapClassInst.heapFloat[(r1 + 15)]);
  f5 = f5 * f4;
  f7 = f7 * f0;
  f6 = f6 * f4;
  f8 = f8 * f0;
  f5 = f5 + f7;
  f2 = f2 * f1;
  f6 = f6 + f8;
  f7 = f9 * f1;
  f8 = Float64(heapClassInst.heapFloat[(fp + 2)]);
  f2 = f5 + f2;
  f5 = f6 + f7;
  f2 = f2 - f5;
  f5 = -f8;
  do {
    if (f2 < f5)
    {
      __label__ = 2;
    }
    else {
      if (f2 <= f8)
      {
        r3 = 0;
        while (true) {
          if (r3 < 3)
          {
            r4 = Int64(heapClassInst.heap32[(r1)]);
            r4 = r4 >> 2;
            r4 = Int64(heapClassInst.heap32[(r4 + 23)]);
            r5 = sp + (-32);
            r6 = sp + (-16);
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r3);
            heapClassInst.heap32[(g0 + 2)] = Int32(r6);
            heapClassInst.heap32[(g0 + 3)] = Int32(r5);
            __FUNCTION_TABLE__[(r4) >> 2](i7);
            r4 = r5 >> 2;
            r5 = r6 >> 2;
            f2 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
            f6 = Float64(heapClassInst.heapFloat[(r5 + 2)]);
            f7 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
            f8 = Float64(heapClassInst.heapFloat[(r5 + 1)]);
            f9 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
            f10 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
            f2 = f2 - f6;
            f6 = f9 - f10;
            f7 = f7 - f8;
            f8 = f7 * f1;
            f9 = f2 * f0;
            f2 = f2 * f4;
            f10 = f6 * f1;
            f8 = f8 - f9;
            f2 = f2 - f10;
            f6 = f6 * f0;
            f7 = f7 * f4;
            f6 = f6 - f7;
            f7 = f8 * f8;
            f9 = f2 * f2;
            f7 = f7 + f9;
            f9 = f6 * f6;
            f7 = f7 + f9;
            heapClassInst.heapFloat[(g0)] = Float32(f7);
            sqrtf(i7);
            f7 = f3 / commonVariable.f_g0;
            f9 = Float64(heapClassInst.heapFloat[(r2)]);
            f8 = f8 * f7;
            f10 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
            f11 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
            f2 = f2 * f7;
            f12 = Float64(heapClassInst.heapFloat[(r5 + 1)]);
            f9 = f9 * f8;
            f11 = f11 * f2;
            f13 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
            f6 = f6 * f7;
            f7 = Float64(heapClassInst.heapFloat[(r5 + 2)]);
            f8 = f10 * f8;
            f2 = f12 * f2;
            f9 = f9 + f11;
            f10 = f13 * f6;
            f2 = f8 + f2;
            f6 = f7 * f6;
            f7 = f9 + f10;
            f2 = f2 + f6;
            f2 = f7 - f2;
            if (f2 < f5)
            {
              __label__ = 2;
              break
            }
            else {
              r3 = (r3 + 1) | 0;
            }
          }
          else {
            break
          }
        }
        r0 = 1;
        __label__ = 8;
      }
      else {
        __label__ = 2;
      }
    }
  } while (false);
  if (__label__ == 2) {
    r0 = 0;
  }
  r0 = r0 & 255;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK15btTriangleShape16getPlaneEquationEiR9btVector3S1_(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r0 + 23)]);
  f1 = Float64(heapClassInst.heapFloat[(r0 + 15)]);
  f2 = Float64(heapClassInst.heapFloat[(r0 + 19)]);
  f3 = Float64(heapClassInst.heapFloat[(r0 + 22)]);
  f4 = Float64(heapClassInst.heapFloat[(r0 + 14)]);
  f5 = Float64(heapClassInst.heapFloat[(r0 + 18)]);
  f5 = f5 - f4;
  f0 = f0 - f1;
  f1 = f2 - f1;
  f2 = f3 - f4;
  f3 = Float64(heapClassInst.heapFloat[(r0 + 21)]);
  f4 = Float64(heapClassInst.heapFloat[(r0 + 13)]);
  f6 = Float64(heapClassInst.heapFloat[(r0 + 17)]);
  f3 = f3 - f4;
  f4 = f6 - f4;
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  f6 = f5 * f0;
  f7 = f1 * f2;
  f6 = f6 - f7;
  r1 = r1 >> 2;
  f1 = f1 * f3;
  f0 = f4 * f0;
  f0 = f1 - f0;
  heapClassInst.heapFloat[(r1)] = Float32(f6);
  f1 = f4 * f2;
  f2 = f5 * f3;
  f1 = f1 - f2;
  heapClassInst.heapFloat[(r1 + 1)] = Float32(f0);
  heapClassInst.heapFloat[(r1 + 2)] = Float32(f1);
  f2 = f6 * f6;
  f0 = f0 * f0;
  heapClassInst.heap32[(r1 + 3)] = 0;
  f0 = f2 + f0;
  f1 = f1 * f1;
  f0 = f0 + f1;
  heapClassInst.heapFloat[(g0)] = Float32(f0);
  sqrtf(i7);
  f1 = 1.0;
  f0 = f1 / commonVariable.f_g0;
  f1 = Float64(heapClassInst.heapFloat[(r1)]);
  f1 = f1 * f0;
  heapClassInst.heapFloat[(r1)] = Float32(f1);
  f1 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f1 = f1 * f0;
  heapClassInst.heapFloat[(r1 + 1)] = Float32(f1);
  f1 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  r2 = Int64(heapClassInst.heap32[(fp + 3)]);
  f0 = f1 * f0;
  r2 = r2 >> 2;
  heapClassInst.heapFloat[(r1 + 2)] = Float32(f0);
  heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r0 + 13)];
  heapClassInst.heap32[(r2 + 1)] = heapClassInst.heap32[(r0 + 14)];
  heapClassInst.heap32[(r2 + 2)] = heapClassInst.heap32[(r0 + 15)];
  heapClassInst.heap32[(r2 + 3)] = heapClassInst.heap32[(r0 + 16)];
  return;
}

func _ZN33btConvexConcaveCollisionAlgorithm21calculateTimeOfImpactEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResult(sp: Int64) : Unit
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
  i7 = sp + (-440);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = Int64(heapClassInst.heapU8[r0 + 8]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  if(r0 == 0){
    r3 = r1
  }else{
    r3 = r2
  }
  r3 = r3 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r3 + 30)]);
  f1 = Float64(heapClassInst.heapFloat[(r3 + 14)]);
  f2 = Float64(heapClassInst.heapFloat[(r3 + 29)]);
  f3 = Float64(heapClassInst.heapFloat[(r3 + 13)]);
  f4 = f2 - f3;
  f5 = f0 - f1;
  f6 = Float64(heapClassInst.heapFloat[(r3 + 31)]);
  f7 = Float64(heapClassInst.heapFloat[(r3 + 15)]);
  f8 = f6 - f7;
  f4 = f4 * f4;
  f5 = f5 * f5;
  f9 = Float64(heapClassInst.heapFloat[(r3 + 62)]);
  f4 = f4 + f5;
  f5 = f8 * f8;
  f8 = f9 * f9;
  f4 = f4 + f5;
  if (!(f8 > f4))
  {
    if(r0 == 0){
      r0 = r2
    }else{
      r0 = r1
    }
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0 + 48)]);
    r2 = r1 >> 2;
    r4 = Int64(heapClassInst.heap32[(r2 + 1)]);
    r4 = (r4 + (-21)) | 0;
    if (!(`UIntNative`(r4) > `UIntNative`(8)))
    {
      f4 = Float64(heapClassInst.heapFloat[(r0 + 13)]);
      f5 = Float64(heapClassInst.heapFloat[(r0 + 3)]);
      f8 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
      f4 = -f4;
      f9 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
      f10 = Float64(heapClassInst.heapFloat[(r0 + 7)]);
      f11 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
      f12 = Float64(heapClassInst.heapFloat[(r0 + 14)]);
      f13 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
      f14 = Float64(heapClassInst.heapFloat[(r3 + 3)]);
      f15 = Float64(heapClassInst.heapFloat[(r3 + 7)]);
      f16 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
      f17 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
      f18 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
      f19 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
      f20 = Float64(heapClassInst.heapFloat[(r3 + 19)]);
      heapClassInst.heapFloat[(fp + (-63))] = Float32(f20);
      f21 = Float64(heapClassInst.heapFloat[(r3 + 23)]);
      f22 = Float64(heapClassInst.heapFloat[(r3 + 18)]);
      f23 = Float64(heapClassInst.heapFloat[(r3 + 22)]);
      f24 = Float64(heapClassInst.heapFloat[(r3 + 17)]);
      f25 = Float64(heapClassInst.heapFloat[(r3 + 21)]);
      f26 = f5 * f3;
      heapClassInst.heapFloat[(fp + (-65))] = Float32(f26);
      f27 = f10 * f1;
      f28 = f8 * f3;
      heapClassInst.heapFloat[(fp + (-66))] = Float32(f28);
      f29 = f11 * f1;
      f3 = f9 * f3;
      heapClassInst.heapFloat[(fp + (-64))] = Float32(f3);
      f1 = f13 * f1;
      f30 = Float64(heapClassInst.heapFloat[(r0 + 11)]);
      f3 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
      f20 = Float64(heapClassInst.heapFloat[(r0 + 15)]);
      f26 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
      f28 = f5 * f2;
      heapClassInst.heapFloat[(fp + (-67))] = Float32(f28);
      f28 = f10 * f0;
      heapClassInst.heapFloat[(fp + (-69))] = Float32(f28);
      f28 = f5 * f4;
      heapClassInst.heapFloat[(fp + (-68))] = Float32(f28);
      f28 = f10 * f12;
      heapClassInst.heapFloat[(fp + (-71))] = Float32(f28);
      f28 = f8 * f2;
      heapClassInst.heapFloat[(fp + (-70))] = Float32(f28);
      f28 = f11 * f0;
      heapClassInst.heapFloat[(fp + (-73))] = Float32(f28);
      f28 = f8 * f4;
      heapClassInst.heapFloat[(fp + (-72))] = Float32(f28);
      f28 = f11 * f12;
      heapClassInst.heapFloat[(fp + (-78))] = Float32(f28);
      f2 = f9 * f2;
      heapClassInst.heapFloat[(fp + (-74))] = Float32(f2);
      f0 = f13 * f0;
      heapClassInst.heapFloat[(fp + (-76))] = Float32(f0);
      f4 = f9 * f4;
      heapClassInst.heapFloat[(fp + (-75))] = Float32(f4);
      f12 = f13 * f12;
      heapClassInst.heapFloat[(fp + (-77))] = Float32(f12);
      f0 = Float64(heapClassInst.heapFloat[(r3 + 11)]);
      f2 = Float64(heapClassInst.heapFloat[(r3 + 10)]);
      f4 = Float64(heapClassInst.heapFloat[(r3 + 9)]);
      f12 = Float64(heapClassInst.heapFloat[(r3 + 27)]);
      f28 = Float64(heapClassInst.heapFloat[(r3 + 26)]);
      heapClassInst.heapFloat[(fp + (-62))] = Float32(f28);
      f28 = Float64(heapClassInst.heapFloat[(r3 + 25)]);
      heapClassInst.heapFloat[(fp + (-61))] = Float32(f28);
      f28 = Float64(heapClassInst.heapFloat[(fp + (-65))]);
      f27 = f28 + f27;
      heapClassInst.heapFloat[(fp + (-65))] = Float32(f27);
      f27 = f30 * f7;
      heapClassInst.heapFloat[(fp + (-99))] = Float32(f27);
      f28 = Float64(heapClassInst.heapFloat[(fp + (-66))]);
      f28 = f28 + f29;
      heapClassInst.heapFloat[(fp + (-66))] = Float32(f28);
      f29 = f3 * f7;
      heapClassInst.heapFloat[(fp + (-98))] = Float32(f29);
      f27 = Float64(heapClassInst.heapFloat[(fp + (-64))]);
      f1 = f27 + f1;
      heapClassInst.heapFloat[(fp + (-80))] = Float32(f1);
      f7 = f26 * f7;
      heapClassInst.heapFloat[(fp + (-97))] = Float32(f7);
      f27 = f14 * f5;
      heapClassInst.heapFloat[(fp + (-64))] = Float32(f27);
      f1 = f15 * f10;
      heapClassInst.heapFloat[(fp + (-82))] = Float32(f1);
      f1 = f16 * f5;
      heapClassInst.heapFloat[(fp + (-79))] = Float32(f1);
      f1 = f17 * f10;
      heapClassInst.heapFloat[(fp + (-84))] = Float32(f1);
      f1 = f18 * f5;
      heapClassInst.heapFloat[(fp + (-81))] = Float32(f1);
      f1 = f19 * f10;
      heapClassInst.heapFloat[(fp + (-86))] = Float32(f1);
      f1 = f14 * f8;
      heapClassInst.heapFloat[(fp + (-83))] = Float32(f1);
      f1 = f15 * f11;
      heapClassInst.heapFloat[(fp + (-88))] = Float32(f1);
      f1 = f16 * f8;
      heapClassInst.heapFloat[(fp + (-85))] = Float32(f1);
      f1 = f17 * f11;
      heapClassInst.heapFloat[(fp + (-92))] = Float32(f1);
      f1 = f18 * f8;
      heapClassInst.heapFloat[(fp + (-87))] = Float32(f1);
      f1 = f19 * f11;
      heapClassInst.heapFloat[(fp + (-93))] = Float32(f1);
      f14 = f14 * f9;
      heapClassInst.heapFloat[(fp + (-89))] = Float32(f14);
      f15 = f15 * f13;
      heapClassInst.heapFloat[(fp + (-94))] = Float32(f15);
      f16 = f16 * f9;
      heapClassInst.heapFloat[(fp + (-90))] = Float32(f16);
      f17 = f17 * f13;
      heapClassInst.heapFloat[(fp + (-95))] = Float32(f17);
      f18 = f18 * f9;
      heapClassInst.heapFloat[(fp + (-91))] = Float32(f18);
      f19 = f19 * f13;
      heapClassInst.heapFloat[(fp + (-96))] = Float32(f19);
      f1 = Float64(heapClassInst.heapFloat[(fp + (-67))]);
      f7 = Float64(heapClassInst.heapFloat[(fp + (-69))]);
      f1 = f1 + f7;
      f7 = f30 * f6;
      f14 = Float64(heapClassInst.heapFloat[(fp + (-68))]);
      f15 = Float64(heapClassInst.heapFloat[(fp + (-71))]);
      f14 = f14 - f15;
      f15 = f30 * f20;
      f16 = Float64(heapClassInst.heapFloat[(fp + (-70))]);
      f17 = Float64(heapClassInst.heapFloat[(fp + (-73))]);
      f16 = f16 + f17;
      f17 = f3 * f6;
      f18 = Float64(heapClassInst.heapFloat[(fp + (-72))]);
      f19 = Float64(heapClassInst.heapFloat[(fp + (-78))]);
      f18 = f18 - f19;
      f19 = f3 * f20;
      f27 = Float64(heapClassInst.heapFloat[(fp + (-74))]);
      f28 = Float64(heapClassInst.heapFloat[(fp + (-76))]);
      f27 = f27 + f28;
      f6 = f26 * f6;
      f28 = Float64(heapClassInst.heapFloat[(fp + (-75))]);
      f29 = Float64(heapClassInst.heapFloat[(fp + (-77))]);
      f28 = f28 - f29;
      f20 = f26 * f20;
      f29 = Float64(heapClassInst.heapFloat[(fp + (-63))]);
      f29 = f29 * f5;
      heapClassInst.heapFloat[(fp + (-67))] = Float32(f29);
      f29 = f21 * f10;
      heapClassInst.heapFloat[(fp + (-69))] = Float32(f29);
      f29 = f22 * f5;
      heapClassInst.heapFloat[(fp + (-68))] = Float32(f29);
      f29 = f23 * f10;
      f5 = f24 * f5;
      heapClassInst.heapFloat[(fp + (-70))] = Float32(f5);
      f5 = f25 * f10;
      heapClassInst.heapFloat[(fp + (-101))] = Float32(f5);
      f10 = Float64(heapClassInst.heapFloat[(fp + (-63))]);
      f5 = f10 * f8;
      heapClassInst.heapFloat[(fp + (-71))] = Float32(f5);
      f5 = f21 * f11;
      heapClassInst.heapFloat[(fp + (-73))] = Float32(f5);
      f5 = f22 * f8;
      heapClassInst.heapFloat[(fp + (-72))] = Float32(f5);
      f5 = f23 * f11;
      heapClassInst.heapFloat[(fp + (-100))] = Float32(f5);
      f8 = f24 * f8;
      heapClassInst.heapFloat[(fp + (-74))] = Float32(f8);
      f5 = f25 * f11;
      heapClassInst.heapFloat[(fp + (-102))] = Float32(f5);
      f8 = f10 * f9;
      heapClassInst.heapFloat[(fp + (-75))] = Float32(f8);
      f5 = f21 * f13;
      heapClassInst.heapFloat[(fp + (-103))] = Float32(f5);
      f8 = f22 * f9;
      heapClassInst.heapFloat[(fp + (-78))] = Float32(f8);
      f5 = f23 * f13;
      heapClassInst.heapFloat[(fp + (-104))] = Float32(f5);
      f8 = f24 * f9;
      heapClassInst.heapFloat[(fp + (-76))] = Float32(f8);
      f5 = f25 * f13;
      heapClassInst.heapFloat[(fp + (-105))] = Float32(f5);
      f8 = Float64(heapClassInst.heapFloat[(fp + (-65))]);
      f9 = Float64(heapClassInst.heapFloat[(fp + (-99))]);
      f8 = f8 + f9;
      heapClassInst.heapFloat[(fp + (-77))] = Float32(f8);
      f9 = f14 - f15;
      f1 = f1 + f7;
      heapClassInst.heapFloat[(fp + (-63))] = Float32(f1);
      f7 = Float64(heapClassInst.heapFloat[(fp + (-66))]);
      f10 = Float64(heapClassInst.heapFloat[(fp + (-98))]);
      f7 = f7 + f10;
      heapClassInst.heapFloat[(fp + (-98))] = Float32(f7);
      f10 = f18 - f19;
      f11 = f16 + f17;
      heapClassInst.heapFloat[(fp + (-65))] = Float32(f11);
      f13 = Float64(heapClassInst.heapFloat[(fp + (-80))]);
      f14 = Float64(heapClassInst.heapFloat[(fp + (-97))]);
      f1 = f13 + f14;
      heapClassInst.heapFloat[(fp + (-80))] = Float32(f1);
      f5 = f28 - f20;
      f6 = f27 + f6;
      heapClassInst.heapFloat[(fp + (-66))] = Float32(f6);
      f7 = Float64(heapClassInst.heapFloat[(fp + (-64))]);
      f8 = Float64(heapClassInst.heapFloat[(fp + (-82))]);
      f1 = f7 + f8;
      heapClassInst.heapFloat[(fp + (-64))] = Float32(f1);
      f1 = f0 * f30;
      heapClassInst.heapFloat[(fp + (-82))] = Float32(f1);
      f6 = Float64(heapClassInst.heapFloat[(fp + (-79))]);
      f7 = Float64(heapClassInst.heapFloat[(fp + (-84))]);
      f1 = f6 + f7;
      heapClassInst.heapFloat[(fp + (-79))] = Float32(f1);
      f1 = f2 * f30;
      heapClassInst.heapFloat[(fp + (-84))] = Float32(f1);
      f6 = Float64(heapClassInst.heapFloat[(fp + (-81))]);
      f7 = Float64(heapClassInst.heapFloat[(fp + (-86))]);
      f1 = f6 + f7;
      heapClassInst.heapFloat[(fp + (-81))] = Float32(f1);
      f1 = f4 * f30;
      heapClassInst.heapFloat[(fp + (-86))] = Float32(f1);
      f6 = Float64(heapClassInst.heapFloat[(fp + (-83))]);
      f7 = Float64(heapClassInst.heapFloat[(fp + (-88))]);
      f1 = f6 + f7;
      heapClassInst.heapFloat[(fp + (-83))] = Float32(f1);
      f1 = f0 * f3;
      heapClassInst.heapFloat[(fp + (-88))] = Float32(f1);
      f6 = Float64(heapClassInst.heapFloat[(fp + (-85))]);
      f7 = Float64(heapClassInst.heapFloat[(fp + (-92))]);
      f1 = f6 + f7;
      heapClassInst.heapFloat[(fp + (-85))] = Float32(f1);
      f1 = f2 * f3;
      heapClassInst.heapFloat[(fp + (-92))] = Float32(f1);
      f6 = Float64(heapClassInst.heapFloat[(fp + (-87))]);
      f7 = Float64(heapClassInst.heapFloat[(fp + (-93))]);
      f1 = f6 + f7;
      heapClassInst.heapFloat[(fp + (-87))] = Float32(f1);
      f1 = f4 * f3;
      heapClassInst.heapFloat[(fp + (-93))] = Float32(f1);
      f6 = Float64(heapClassInst.heapFloat[(fp + (-89))]);
      f7 = Float64(heapClassInst.heapFloat[(fp + (-94))]);
      f1 = f6 + f7;
      heapClassInst.heapFloat[(fp + (-89))] = Float32(f1);
      f0 = f0 * f26;
      f6 = Float64(heapClassInst.heapFloat[(fp + (-90))]);
      f7 = Float64(heapClassInst.heapFloat[(fp + (-95))]);
      f6 = f6 + f7;
      f2 = f2 * f26;
      f7 = Float64(heapClassInst.heapFloat[(fp + (-91))]);
      f8 = Float64(heapClassInst.heapFloat[(fp + (-96))]);
      f7 = f7 + f8;
      f4 = f4 * f26;
      f8 = Float64(heapClassInst.heapFloat[(fp + (-67))]);
      f11 = Float64(heapClassInst.heapFloat[(fp + (-69))]);
      f8 = f8 + f11;
      f11 = f12 * f30;
      f13 = Float64(heapClassInst.heapFloat[(fp + (-68))]);
      f13 = f13 + f29;
      f28 = Float64(heapClassInst.heapFloat[(fp + (-62))]);
      f14 = f28 * f30;
      f15 = Float64(heapClassInst.heapFloat[(fp + (-70))]);
      f16 = Float64(heapClassInst.heapFloat[(fp + (-101))]);
      f15 = f15 + f16;
      f28 = Float64(heapClassInst.heapFloat[(fp + (-61))]);
      f16 = f28 * f30;
      f17 = Float64(heapClassInst.heapFloat[(fp + (-71))]);
      f18 = Float64(heapClassInst.heapFloat[(fp + (-73))]);
      f17 = f17 + f18;
      f18 = f12 * f3;
      f19 = Float64(heapClassInst.heapFloat[(fp + (-72))]);
      f20 = Float64(heapClassInst.heapFloat[(fp + (-100))]);
      f19 = f19 + f20;
      f28 = Float64(heapClassInst.heapFloat[(fp + (-62))]);
      f20 = f28 * f3;
      f21 = Float64(heapClassInst.heapFloat[(fp + (-74))]);
      f22 = Float64(heapClassInst.heapFloat[(fp + (-102))]);
      f21 = f21 + f22;
      f28 = Float64(heapClassInst.heapFloat[(fp + (-61))]);
      f3 = f28 * f3;
      f22 = Float64(heapClassInst.heapFloat[(fp + (-75))]);
      f23 = Float64(heapClassInst.heapFloat[(fp + (-103))]);
      f22 = f22 + f23;
      f12 = f12 * f26;
      f23 = Float64(heapClassInst.heapFloat[(fp + (-78))]);
      f24 = Float64(heapClassInst.heapFloat[(fp + (-104))]);
      f23 = f23 + f24;
      f28 = Float64(heapClassInst.heapFloat[(fp + (-62))]);
      f24 = f28 * f26;
      f25 = Float64(heapClassInst.heapFloat[(fp + (-76))]);
      f27 = Float64(heapClassInst.heapFloat[(fp + (-105))]);
      f25 = f25 + f27;
      f28 = Float64(heapClassInst.heapFloat[(fp + (-61))]);
      f26 = f28 * f26;
      f27 = Float64(heapClassInst.heapFloat[(fp + (-77))]);
      f27 = f27 + f9;
      f28 = Float64(heapClassInst.heapFloat[(fp + (-98))]);
      f28 = f28 + f10;
      f29 = Float64(heapClassInst.heapFloat[(fp + (-80))]);
      f29 = f29 + f5;
      f30 = Float64(heapClassInst.heapFloat[(fp + (-64))]);
      f1 = Float64(heapClassInst.heapFloat[(fp + (-82))]);
      f1 = f30 + f1;
      heapClassInst.heapFloat[(fp + (-61))] = Float32(f1);
      f1 = Float64(heapClassInst.heapFloat[(fp + (-79))]);
      f30 = Float64(heapClassInst.heapFloat[(fp + (-84))]);
      f1 = f1 + f30;
      heapClassInst.heapFloat[(fp + (-62))] = Float32(f1);
      f1 = Float64(heapClassInst.heapFloat[(fp + (-81))]);
      f30 = Float64(heapClassInst.heapFloat[(fp + (-86))]);
      f1 = f1 + f30;
      heapClassInst.heapFloat[(fp + (-64))] = Float32(f1);
      f1 = Float64(heapClassInst.heapFloat[(fp + (-83))]);
      f30 = Float64(heapClassInst.heapFloat[(fp + (-88))]);
      f1 = f1 + f30;
      heapClassInst.heapFloat[(fp + (-67))] = Float32(f1);
      f1 = Float64(heapClassInst.heapFloat[(fp + (-85))]);
      f30 = Float64(heapClassInst.heapFloat[(fp + (-92))]);
      f1 = f1 + f30;
      heapClassInst.heapFloat[(fp + (-68))] = Float32(f1);
      f1 = Float64(heapClassInst.heapFloat[(fp + (-87))]);
      f30 = Float64(heapClassInst.heapFloat[(fp + (-93))]);
      f1 = f1 + f30;
      f30 = Float64(heapClassInst.heapFloat[(fp + (-89))]);
      f0 = f30 + f0;
      f2 = f6 + f2;
      f4 = f7 + f4;
      f6 = Float64(heapClassInst.heapFloat[(fp + (-63))]);
      f6 = f6 + f9;
      f7 = Float64(heapClassInst.heapFloat[(fp + (-65))]);
      f7 = f7 + f10;
      f9 = Float64(heapClassInst.heapFloat[(fp + (-66))]);
      f5 = f9 + f5;
      f8 = f8 + f11;
      f9 = f13 + f14;
      f10 = f15 + f16;
      f11 = f17 + f18;
      f13 = f19 + f20;
      f3 = f21 + f3;
      f12 = f22 + f12;
      f14 = f23 + f24;
      f15 = f25 + f26;
      r0 = sp + (-16);
      r4 = r0 >> 2;
      heapClassInst.heapFloat[(fp + (-4))] = Float32(f29);
      heapClassInst.heapFloat[(r4 + 1)] = Float32(f28);
      heapClassInst.heapFloat[(r4 + 2)] = Float32(f27);
      heapClassInst.heap32[(r4 + 3)] = 0;
      if (f5 < f29)
      {
        heapClassInst.heapFloat[(fp + (-4))] = Float32(f5);
        f16 = f5;
      }
      else {
        f16 = f29;
      }
      if (f7 < f28)
      {
        heapClassInst.heapFloat[(r4 + 1)] = Float32(f7);
        f17 = f7;
      }
      else {
        f17 = f28;
      }
      if (f6 < f27)
      {
        heapClassInst.heapFloat[(r4 + 2)] = Float32(f6);
        f18 = f6;
      }
      else {
        f18 = f27;
      }
      r5 = sp + (-32);
      r6 = r5 >> 2;
      heapClassInst.heapFloat[(fp + (-8))] = Float32(f29);
      heapClassInst.heapFloat[(r6 + 1)] = Float32(f28);
      heapClassInst.heapFloat[(r6 + 2)] = Float32(f27);
      heapClassInst.heap32[(r6 + 3)] = 0;
      if (f29 < f5)
      {
        heapClassInst.heapFloat[(fp + (-8))] = Float32(f5);
        f19 = f5;
      }
      else {
        f19 = f29;
      }
      if (f28 < f7)
      {
        heapClassInst.heapFloat[(r6 + 1)] = Float32(f7);
        f20 = f7;
      }
      else {
        f20 = f28;
      }
      if (f27 < f6)
      {
        heapClassInst.heapFloat[(r6 + 2)] = Float32(f6);
        f21 = f6;
      }
      else {
        f21 = f27;
      }
      f22 = Float64(heapClassInst.heapFloat[(r3 + 61)]);
      f16 = f16 - f22;
      f17 = f17 - f22;
      heapClassInst.heapFloat[(fp + (-4))] = Float32(f16);
      f16 = f18 - f22;
      heapClassInst.heapFloat[(r4 + 1)] = Float32(f17);
      f17 = f19 + f22;
      heapClassInst.heapFloat[(r4 + 2)] = Float32(f16);
      f16 = f20 + f22;
      heapClassInst.heapFloat[(fp + (-8))] = Float32(f17);
      r4 = _ZTVZN33btConvexConcaveCollisionAlgorithm21calculateTimeOfImpactEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResultE31LocalTriangleSphereCastCallback;
      f17 = f21 + f22;
      heapClassInst.heapFloat[(r6 + 1)] = Float32(f16);
      r7 = sp + (-240);
      r4 = (r4 + 8) | 0;
      heapClassInst.heapFloat[(r6 + 2)] = Float32(f17);
      r6 = r7 >> 2;
      heapClassInst.heap32[(fp + (-60))] = Int32(r4);
      heapClassInst.heapFloat[(r6 + 1)] = Float32(f4);
      heapClassInst.heapFloat[(r6 + 2)] = Float32(f2);
      heapClassInst.heapFloat[(r6 + 3)] = Float32(f0);
      heapClassInst.heap32[(r6 + 4)] = 0;
      heapClassInst.heapFloat[(r6 + 5)] = Float32(f1);
      f0 = Float64(heapClassInst.heapFloat[(fp + (-68))]);
      heapClassInst.heapFloat[(r6 + 6)] = Float32(f0);
      f0 = Float64(heapClassInst.heapFloat[(fp + (-67))]);
      heapClassInst.heapFloat[(r6 + 7)] = Float32(f0);
      heapClassInst.heap32[(r6 + 8)] = 0;
      f0 = Float64(heapClassInst.heapFloat[(fp + (-64))]);
      heapClassInst.heapFloat[(r6 + 9)] = Float32(f0);
      f0 = Float64(heapClassInst.heapFloat[(fp + (-62))]);
      heapClassInst.heapFloat[(r6 + 10)] = Float32(f0);
      f0 = Float64(heapClassInst.heapFloat[(fp + (-61))]);
      heapClassInst.heapFloat[(r6 + 11)] = Float32(f0);
      heapClassInst.heap32[(r6 + 12)] = 0;
      heapClassInst.heapFloat[(r6 + 13)] = Float32(f29);
      heapClassInst.heapFloat[(r6 + 14)] = Float32(f28);
      heapClassInst.heapFloat[(r6 + 15)] = Float32(f27);
      heapClassInst.heap32[(r6 + 16)] = 0;
      heapClassInst.heapFloat[(r6 + 17)] = Float32(f15);
      heapClassInst.heapFloat[(r6 + 18)] = Float32(f14);
      heapClassInst.heapFloat[(r6 + 19)] = Float32(f12);
      heapClassInst.heap32[(r6 + 20)] = 0;
      heapClassInst.heapFloat[(r6 + 21)] = Float32(f3);
      heapClassInst.heapFloat[(r6 + 22)] = Float32(f13);
      heapClassInst.heapFloat[(r6 + 23)] = Float32(f11);
      heapClassInst.heap32[(r6 + 24)] = 0;
      heapClassInst.heapFloat[(r6 + 25)] = Float32(f10);
      heapClassInst.heapFloat[(r6 + 26)] = Float32(f9);
      heapClassInst.heapFloat[(r6 + 27)] = Float32(f8);
      heapClassInst.heap32[(r6 + 28)] = 0;
      heapClassInst.heapFloat[(r6 + 29)] = Float32(f5);
      heapClassInst.heapFloat[(r6 + 30)] = Float32(f7);
      heapClassInst.heapFloat[(r6 + 31)] = Float32(f6);
      heapClassInst.heap32[(r6 + 32)] = 0;
      heapClassInst.heapFloat[(r6 + 49)] = Float32(f22);
      heapClassInst.heap32[(r6 + 50)] = heapClassInst.heap32[(r3 + 60)];
      if (!(r1 == 0))
      {
        r2 = Int64(heapClassInst.heap32[(r2)]);
        r2 = r2 >> 2;
        r2 = Int64(heapClassInst.heap32[(r2 + 15)]);
        heapClassInst.heap32[(g0)] = Int32(r1);
        heapClassInst.heap32[(g0 + 1)] = Int32(r7);
        heapClassInst.heap32[(g0 + 2)] = Int32(r0);
        heapClassInst.heap32[(g0 + 3)] = Int32(r5);
        __FUNCTION_TABLE__[(r2) >> 2](i7);
        f0 = Float64(heapClassInst.heapFloat[(r6 + 50)]);
        f1 = Float64(heapClassInst.heapFloat[(r3 + 60)]);
        if (!(f0 >= f1))
        {
          heapClassInst.heapFloat[(r3 + 60)] = Float32(f0);
          commonVariable.f_g0 = f0;
          return;
        }
      }
    }
  }
  f0 = 1.0;
  commonVariable.f_g0 = f0;
  return;
}

func _ZN33btConvexConcaveCollisionAlgorithm16processCollisionEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResult(sp: Int64) : Unit
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
  var f24: Float64 = 0.0
  var f25: Float64 = 0.0
  var f26: Float64 = 0.0
  var f27: Float64 = 0.0
  var f28: Float64 = 0.0
  var f29: Float64 = 0.0
  var f30: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-80);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heapU8[r0 + 8]);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  if(r1 == 0){
    r4 = r2
  }else{
    r4 = r3
  }
  r5 = r4 >> 2;
  r5 = Int64(heapClassInst.heap32[(r5 + 48)]);
  r6 = r5 >> 2;
  r7 = Int64(heapClassInst.heap32[(r6 + 1)]);
  r7 = (r7 + (-21)) | 0;
  if (!(`UIntNative`(r7) > `UIntNative`(8)))
  {
    if(r1 == 0){
      r1 = r3
    }else{
      r1 = r2
    }
    r2 = r1 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2 + 48)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2 + 1)]);
    if (!(r2 > 19))
    {
      r2 = Int64(heapClassInst.heap32[(fp + 3)]);
      r3 = Int64(heapClassInst.heap32[(fp + 4)]);
      r7 = Int64(heapClassInst.heap32[(r6)]);
      r7 = r7 >> 2;
      r7 = Int64(heapClassInst.heap32[(r7 + 11)]);
      heapClassInst.heap32[(g0)] = Int32(r5);
      r8 = r0 >> 2;
      __FUNCTION_TABLE__[(r7) >> 2](i7);
      f0 = commonVariable.f_g0;
      r7 = r3 >> 2;
      r9 = Int64(heapClassInst.heap32[(r8 + 19)]);
      heapClassInst.heap32[(r7 + 1)] = Int32(r9);
      heapClassInst.heap32[(r8 + 16)] = Int32(r2);
      heapClassInst.heapFloat[(r8 + 17)] = Float32(f0);
      heapClassInst.heap32[(r8 + 14)] = Int32(r3);
      r2 = Int64(heapClassInst.heap32[(r8 + 4)]);
      r9 = Int64(heapClassInst.heap32[(r8 + 5)]);
      r9 = r9 >> 2;
      r2 = r2 >> 2;
      f1 = Float64(heapClassInst.heapFloat[(r9 + 1)]);
      f2 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
      f3 = Float64(heapClassInst.heapFloat[(r9 + 5)]);
      f4 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
      f5 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
      f6 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
      f7 = f2 * f1;
      f8 = f4 * f3;
      f9 = Float64(heapClassInst.heapFloat[(r9 + 9)]);
      f10 = Float64(heapClassInst.heapFloat[(r2 + 9)]);
      f11 = Float64(heapClassInst.heapFloat[(r9 + 2)]);
      f12 = Float64(heapClassInst.heapFloat[(r9 + 6)]);
      f13 = Float64(heapClassInst.heapFloat[(r9 + 3)]);
      f14 = Float64(heapClassInst.heapFloat[(r2 + 13)]);
      f15 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
      f16 = Float64(heapClassInst.heapFloat[(r9 + 7)]);
      f17 = Float64(heapClassInst.heapFloat[(r9 + 14)]);
      f18 = Float64(heapClassInst.heapFloat[(r2 + 14)]);
      f19 = Float64(heapClassInst.heapFloat[(r2 + 7)]);
      f20 = Float64(heapClassInst.heapFloat[(r9 + 10)]);
      f21 = Float64(heapClassInst.heapFloat[(r9 + 15)]);
      f22 = Float64(heapClassInst.heapFloat[(r9 + 11)]);
      f23 = Float64(heapClassInst.heapFloat[(r2 + 15)]);
      f24 = Float64(heapClassInst.heapFloat[(r2 + 11)]);
      f25 = Float64(heapClassInst.heapFloat[(r2 + 10)]);
      f26 = Float64(heapClassInst.heapFloat[(r9 + 13)]);
      f27 = f5 * f1;
      f28 = f6 * f3;
      f7 = f7 + f8;
      f8 = f10 * f9;
      r9 = sp + (-64);
      f29 = f15 * f1;
      f30 = f19 * f3;
      f27 = f27 + f28;
      f28 = f25 * f9;
      f7 = f7 + f8;
      r10 = r9 >> 2;
      f8 = f29 + f30;
      f29 = f24 * f9;
      f27 = f27 + f28;
      heapClassInst.heapFloat[(fp + (-16))] = Float32(f7);
      f7 = f2 * f11;
      f28 = f4 * f12;
      f8 = f8 + f29;
      heapClassInst.heapFloat[(r10 + 1)] = Float32(f27);
      heapClassInst.heapFloat[(r10 + 2)] = Float32(f8);
      f8 = f5 * f11;
      f27 = f6 * f12;
      f7 = f7 + f28;
      f28 = f10 * f20;
      f29 = f15 * f11;
      f30 = f19 * f12;
      f8 = f8 + f27;
      f27 = f25 * f20;
      f7 = f7 + f28;
      heapClassInst.heap32[(r10 + 3)] = 0;
      f28 = f29 + f30;
      f29 = f24 * f20;
      f8 = f8 + f27;
      heapClassInst.heapFloat[(r10 + 4)] = Float32(f7);
      f2 = f2 * f13;
      f4 = f4 * f16;
      f7 = f28 + f29;
      heapClassInst.heapFloat[(r10 + 5)] = Float32(f8);
      heapClassInst.heapFloat[(r10 + 6)] = Float32(f7);
      f5 = f5 * f13;
      f6 = f6 * f16;
      f2 = f2 + f4;
      f4 = f10 * f22;
      f7 = -f26;
      f8 = f15 * f13;
      f10 = f19 * f16;
      f5 = f5 + f6;
      f6 = f25 * f22;
      f2 = f2 + f4;
      heapClassInst.heap32[(r10 + 7)] = 0;
      f4 = f1 * f14;
      f15 = f3 * f18;
      f1 = f1 * f7;
      f3 = f3 * f17;
      f8 = f8 + f10;
      f10 = f24 * f22;
      f5 = f5 + f6;
      heapClassInst.heapFloat[(r10 + 8)] = Float32(f2);
      f2 = f11 * f14;
      f6 = f12 * f18;
      f11 = f11 * f7;
      f12 = f12 * f17;
      f4 = f4 + f15;
      f15 = f9 * f23;
      f1 = f1 - f3;
      f3 = f9 * f21;
      f8 = f8 + f10;
      heapClassInst.heapFloat[(r10 + 9)] = Float32(f5);
      heapClassInst.heapFloat[(r10 + 10)] = Float32(f8);
      f5 = f13 * f14;
      f8 = f16 * f18;
      f7 = f13 * f7;
      f9 = f16 * f17;
      f2 = f2 + f6;
      f6 = f20 * f23;
      f10 = f11 - f12;
      f11 = f20 * f21;
      f4 = f4 + f15;
      f1 = f1 - f3;
      f3 = f5 + f8;
      f5 = f22 * f23;
      f7 = f7 - f9;
      f8 = f22 * f21;
      f2 = f2 + f6;
      f6 = f10 - f11;
      f1 = f4 + f1;
      heapClassInst.heap32[(r10 + 11)] = 0;
      f3 = f3 + f5;
      f4 = f7 - f8;
      f2 = f2 + f6;
      heapClassInst.heapFloat[(r10 + 12)] = Float32(f1);
      f1 = f3 + f4;
      heapClassInst.heapFloat[(r10 + 13)] = Float32(f2);
      heapClassInst.heapFloat[(r10 + 14)] = Float32(f1);
      heapClassInst.heap32[(r10 + 15)] = 0;
      r2 = Int64(heapClassInst.heap32[(r2 + 48)]);
      r10 = r2 >> 2;
      r10 = Int64(heapClassInst.heap32[(r10)]);
      r10 = r10 >> 2;
      r10 = Int64(heapClassInst.heap32[(r10 + 2)]);
      r11 = (r0 + 40) | 0;
      r12 = (r0 + 24) | 0;
      heapClassInst.heap32[(g0)] = Int32(r2);
      heapClassInst.heap32[(g0 + 1)] = Int32(r9);
      heapClassInst.heap32[(g0 + 2)] = Int32(r12);
      heapClassInst.heap32[(g0 + 3)] = Int32(r11);
      __FUNCTION_TABLE__[(r10) >> 2](i7);
      f1 = Float64(heapClassInst.heapFloat[(r8 + 10)]);
      f1 = f1 + f0;
      heapClassInst.heapFloat[(r8 + 10)] = Float32(f1);
      f1 = Float64(heapClassInst.heapFloat[(r8 + 11)]);
      f1 = f1 + f0;
      heapClassInst.heapFloat[(r8 + 11)] = Float32(f1);
      f1 = Float64(heapClassInst.heapFloat[(r8 + 12)]);
      f1 = f1 + f0;
      heapClassInst.heapFloat[(r8 + 12)] = Float32(f1);
      f1 = Float64(heapClassInst.heapFloat[(r8 + 6)]);
      f1 = f1 - f0;
      heapClassInst.heapFloat[(r8 + 6)] = Float32(f1);
      f1 = Float64(heapClassInst.heapFloat[(r8 + 7)]);
      f1 = f1 - f0;
      heapClassInst.heapFloat[(r8 + 7)] = Float32(f1);
      f1 = Float64(heapClassInst.heapFloat[(r8 + 8)]);
      f0 = f1 - f0;
      heapClassInst.heapFloat[(r8 + 8)] = Float32(f0);
      r2 = Int64(heapClassInst.heap32[(r8 + 19)]);
      r2 = r2 >> 2;
      heapClassInst.heap32[(r2 + 277)] = Int32(r1);
      heapClassInst.heap32[(r2 + 278)] = Int32(r4);
      r1 = Int64(heapClassInst.heap32[(r6)]);
      r1 = r1 >> 2;
      r1 = Int64(heapClassInst.heap32[(r1 + 15)]);
      r0 = (r0 + 12) | 0;
      heapClassInst.heap32[(g0)] = Int32(r5);
      heapClassInst.heap32[(g0 + 1)] = Int32(r0);
      heapClassInst.heap32[(g0 + 2)] = Int32(r12);
      heapClassInst.heap32[(g0 + 3)] = Int32(r11);
      __FUNCTION_TABLE__[(r1) >> 2](i7);
      r0 = Int64(heapClassInst.heap32[(r7 + 1)]);
      if (r0 != 0)
      {
        r1 = r0 >> 2;
        r2 = Int64(heapClassInst.heap32[(r1 + 279)]);
        if (!(r2 == 0))
        {
          r1 = Int64(heapClassInst.heap32[(r1 + 277)]);
          r2 = Int64(heapClassInst.heap32[(r7 + 34)]);
          if (r1 == r2)
          {
            r1 = (r3 + 8) | 0;
            r2 = (r3 + 72) | 0;
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r1);
            heapClassInst.heap32[(g0 + 2)] = Int32(r2);
            _ZN20btPersistentManifold20refreshContactPointsERK11btTransformS2_(i7);
          }
          else {
            r1 = (r3 + 72) | 0;
            r3 = (r3 + 8) | 0;
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r1);
            heapClassInst.heap32[(g0 + 2)] = Int32(r3);
            _ZN20btPersistentManifold20refreshContactPointsERK11btTransformS2_(i7);
            return;
          }
        }
      }
      else {
        r0 = _E2_str59;
        r3 = _E2_str160;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r3);
        heapClassInst.heap32[(g0 + 2)] = 101;
        _assert(i7);
      }
    }
  }
  return;
}

func _ZN33btConvexConcaveCollisionAlgorithm22getAllContactManifoldsER20btAlignedObjectArrayIP20btPersistentManifoldE(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 19)]);
  if (!(r1 == 0))
  {
    r2 = Int64(heapClassInst.heap32[(fp + 1)]);
    r3 = r2 >> 2;
    r4 = Int64(heapClassInst.heap32[(r3 + 2)]);
    r5 = Int64(heapClassInst.heap32[(r3 + 1)]);
    if (r4 == r5)
    {
      r6 = 1;
      r7 = r5 << 1;
      r7 = if (r5 == 0) {r6}  else {r7}
      if (!(r4 >= r7))
      {
        if (r7 != 0)
        {
          r1 = gNumAlignedAllocs;
          r1 = r1 >> 2;
          r4 = Int64(heapClassInst.heap32[(r1)]);
          r8 = r7 << 2;
          r4 = (r4 + 1) | 0;
          r8 = r8 | 3;
          heapClassInst.heap32[(r1)] = Int32(r4);
          r1 = (r8 + 16) | 0;
          heapClassInst.heap32[(g0)] = Int32(r1);
          mallocNew(i7);
          r1 = commonVariable.r_g0;
          if (r1 != 0)
          {
            r4 = 0;
            r8 = (r1 + 4) | 0;
            r4 = (r4 - r8) | 0;
            r4 = r4 & 15;
            r4 = (r1 + r4) | 0;
            r8 = (r4 + 4) | 0;
            r4 = r4 >> 2;
            heapClassInst.heap32[(r4)] = Int32(r1);
            r1 = r8;
          }
        }
        else {
          r1 = 0;
        }
        r4 = (r2 + 12) | 0;
        if (r5 < 1)
        {
          r8 = r4 >> 2;
          r9 = Int64(heapClassInst.heap32[(r8)]);
        }
        else {
          r8 = 0;
          while (true) {
            r9 = r4 >> 2;
            r9 = Int64(heapClassInst.heap32[(r9)]);
            r10 = r8 << 2;
            r11 = (r9 + r10) | 0;
            r11 = r11 >> 2;
            r10 = (r1 + r10) | 0;
            r11 = Int64(heapClassInst.heap32[(r11)]);
            r8 = (r8 + 1) | 0;
            r10 = r10 >> 2;
            heapClassInst.heap32[(r10)] = Int32(r11);
            if (!(r5 != r8))
            {
              break
            }
          }
          r4 = (r2 + 12) | 0;
        }
        if (r9 != 0)
        {
          r8 = Int64(heapClassInst.heapU8[r2 + 16]);
          if (r8 != 0)
          {
            r5 = gNumAlignedFree;
            r5 = r5 >> 2;
            r8 = Int64(heapClassInst.heap32[(r5)]);
            r8 = (r8 + 1) | 0;
            r9 = r9 >> 2;
            heapClassInst.heap32[(r5)] = Int32(r8);
            r5 = Int64(heapClassInst.heap32[(r9 + (-1))]);
            heapClassInst.heap32[(g0)] = Int32(r5);
            free(i7);
            r5 = Int64(heapClassInst.heap32[(r3 + 1)]);
          }
          r8 = r4 >> 2;
          heapClassInst.heap32[(r8)] = 0;
        }
        r4 = r4 >> 2;
        heapClassInst.heap8[r2 + 16] = Int8(r6);
        heapClassInst.heap32[(r4)] = Int32(r1);
        heapClassInst.heap32[(r3 + 2)] = Int32(r7);
        r1 = Int64(heapClassInst.heap32[(r0 + 19)]);
      }
    }
    r0 = r5 << 2;
    r2 = Int64(heapClassInst.heap32[(r3 + 3)]);
    r0 = (r2 + r0) | 0;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r0)] = Int32(r1);
    r0 = Int64(heapClassInst.heap32[(r3 + 1)]);
    r0 = (r0 + 1) | 0;
    heapClassInst.heap32[(r3 + 1)] = Int32(r0);
  }
  return;
}

func _ZN33btConvexConcaveCollisionAlgorithmD0Ev(sp: Int64) : Unit
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
  r1 = _ZTV33btConvexConcaveCollisionAlgorithm;
  r2 = _ZTV24btConvexTriangleCallback;
  r1 = (r1 + 8) | 0;
  r3 = r0 >> 2;
  r2 = (r2 + 8) | 0;
  heapClassInst.heap32[(r3)] = Int32(r1);
  heapClassInst.heap32[(r3 + 3)] = Int32(r2);
  r1 = Int64(heapClassInst.heap32[(r3 + 15)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 5)]);
  r4 = Int64(heapClassInst.heap32[(r3 + 19)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(r4);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r3 + 15)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 4)]);
  r4 = Int64(heapClassInst.heap32[(r3 + 19)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(r4);
  r1 = _ZTV18btTriangleCallback;
  r4 = _ZTV30btActivatingCollisionAlgorithm;
  r1 = (r1 + 8) | 0;
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = (r4 + 8) | 0;
  heapClassInst.heap32[(r3 + 3)] = Int32(r1);
  heapClassInst.heap32[(r3)] = Int32(r2);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN33btConvexConcaveCollisionAlgorithmD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV33btConvexConcaveCollisionAlgorithm;
  r2 = _ZTV24btConvexTriangleCallback;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  r2 = (r2 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  heapClassInst.heap32[(r0 + 3)] = Int32(r2);
  r1 = Int64(heapClassInst.heap32[(r0 + 15)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 5)]);
  r3 = Int64(heapClassInst.heap32[(r0 + 19)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r0 + 15)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 4)]);
  r3 = Int64(heapClassInst.heap32[(r0 + 19)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
  r1 = _ZTV18btTriangleCallback;
  r3 = _ZTV30btActivatingCollisionAlgorithm;
  r1 = (r1 + 8) | 0;
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = (r3 + 8) | 0;
  heapClassInst.heap32[(r0 + 3)] = Int32(r1);
  heapClassInst.heap32[(r0)] = Int32(r2);
  return;
}

func _ZN23btConvexConvexAlgorithm10CreateFuncD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVN23btConvexConvexAlgorithm10CreateFuncE;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN23btConvexConvexAlgorithm10CreateFuncD0Ev(sp: Int64) : Unit
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
  r1 = _ZTVN23btConvexConvexAlgorithm10CreateFuncE;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN23btConvexConvexAlgorithm10CreateFunc24CreateCollisionAlgorithmER36btCollisionAlgorithmConstructionInfoP17btCollisionObjectS4_(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 12)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = 36;
  r1 = Int64(heapClassInst.heap32[(fp)]);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r1 = r1 >> 2;
  r3 = _ZTV20btCollisionAlgorithm;
  r4 = Int64(heapClassInst.heap32[(r1 + 5)]);
  r5 = Int64(heapClassInst.heap32[(r1 + 4)]);
  r6 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r7 = Int64(heapClassInst.heap32[(r1 + 2)]);
  r1 = Int64(heapClassInst.heap32[(r1 + 3)]);
  r8 = commonVariable.r_g0 >> 2;
  r3 = (r3 + 8) | 0;
  heapClassInst.heap32[(r8)] = Int32(r3);
  r0 = Int64(heapClassInst.heap32[(r0)]);
  r3 = _ZTV23btConvexConvexAlgorithm;
  r3 = (r3 + 8) | 0;
  heapClassInst.heap32[(r8 + 1)] = Int32(r0);
  heapClassInst.heap32[(r8)] = Int32(r3);
  heapClassInst.heap32[(r8 + 2)] = Int32(r1);
  r0 = 0;
  heapClassInst.heap32[(r8 + 3)] = Int32(r7);
  heapClassInst.heap8[commonVariable.r_g0 + 16] = Int8(r0);
  heapClassInst.heap32[(r8 + 5)] = Int32(r6);
  heapClassInst.heap8[commonVariable.r_g0 + 24] = Int8(r0);
  heapClassInst.heap32[(r8 + 7)] = Int32(r5);
  heapClassInst.heap32[(r8 + 8)] = Int32(r4);
  return;
}

func _ZN24btPerturbedContactResultD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV24btPerturbedContactResult;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN24btPerturbedContactResultD0Ev(sp: Int64) : Unit
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
  r1 = _ZTV24btPerturbedContactResult;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN24btPerturbedContactResult15addContactPointERK9btVector3S2_f(sp: Int64) : Unit
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
  i7 = sp + (-104);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  r2 = r2 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  heapClassInst.heapFloat[(fp + (-5))] = Float32(f0);
  f1 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  heapClassInst.heapFloat[(fp + (-6))] = Float32(f1);
  f2 = Float64(heapClassInst.heapFloat[(fp + 3)]);
  f3 = Float64(heapClassInst.heapFloat[(r1)]);
  heapClassInst.heapFloat[(fp + (-7))] = Float32(f3);
  f4 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
  heapClassInst.heapFloat[(fp + (-11))] = Float32(f4);
  f0 = f0 * f2;
  f5 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
  heapClassInst.heapFloat[(fp + (-12))] = Float32(f5);
  f1 = f1 * f2;
  f6 = Float64(heapClassInst.heapFloat[(r2)]);
  heapClassInst.heapFloat[(fp + (-13))] = Float32(f6);
  f2 = f3 * f2;
  r1 = Int64(heapClassInst.heap32[(fp)]);
  f0 = f4 + f0;
  heapClassInst.heapFloat[(fp + (-8))] = Float32(f0);
  f0 = f5 + f1;
  heapClassInst.heapFloat[(fp + (-9))] = Float32(f0);
  f0 = f6 + f2;
  heapClassInst.heapFloat[(fp + (-10))] = Float32(f0);
  r2 = Int64(heapClassInst.heapU8[r1 + 356]);
  if (r2 == 0)
  {
    r2 = r1 >> 2;
    f3 = Float64(heapClassInst.heapFloat[(r2 + 69)]);
    f3 = -f3;
    f0 = Float64(heapClassInst.heapFloat[(r2 + 57)]);
    f1 = Float64(heapClassInst.heapFloat[(r2 + 58)]);
    f2 = Float64(heapClassInst.heapFloat[(r2 + 61)]);
    f4 = Float64(heapClassInst.heapFloat[(r2 + 70)]);
    f5 = Float64(heapClassInst.heapFloat[(r2 + 62)]);
    f6 = Float64(heapClassInst.heapFloat[(r2 + 77)]);
    f7 = Float64(heapClassInst.heapFloat[(r2 + 78)]);
    f8 = Float64(heapClassInst.heapFloat[(r2 + 73)]);
    f9 = Float64(heapClassInst.heapFloat[(r2 + 65)]);
    f10 = Float64(heapClassInst.heapFloat[(r2 + 74)]);
    f11 = Float64(heapClassInst.heapFloat[(r2 + 66)]);
    f12 = Float64(heapClassInst.heapFloat[(r2 + 71)]);
    f13 = Float64(heapClassInst.heapFloat[(r2 + 59)]);
    f14 = Float64(heapClassInst.heapFloat[(r2 + 63)]);
    f15 = f0 * f3;
    f16 = f2 * f4;
    f17 = f1 * f3;
    f18 = f5 * f4;
    f19 = Float64(heapClassInst.heapFloat[(r2 + 81)]);
    f20 = Float64(heapClassInst.heapFloat[(r2 + 82)]);
    f21 = Float64(heapClassInst.heapFloat[(r2 + 79)]);
    f22 = Float64(heapClassInst.heapFloat[(r2 + 67)]);
    f23 = Float64(heapClassInst.heapFloat[(r2 + 75)]);
    f24 = f0 * f6;
    f25 = f1 * f7;
    f26 = f2 * f6;
    f27 = f5 * f7;
    f28 = f0 * f8;
    heapClassInst.heapFloat[(fp + (-14))] = Float32(f28);
    f28 = f1 * f10;
    heapClassInst.heapFloat[(fp + (-15))] = Float32(f28);
    f29 = f2 * f8;
    f28 = f5 * f10;
    f15 = f15 - f16;
    f16 = f9 * f12;
    f17 = f17 - f18;
    f18 = f11 * f12;
    f3 = f13 * f3;
    heapClassInst.heapFloat[(fp + (-16))] = Float32(f3);
    f3 = f14 * f4;
    heapClassInst.heapFloat[(fp + (-20))] = Float32(f3);
    f4 = f15 - f16;
    f15 = f17 - f18;
    f16 = Float64(heapClassInst.heapFloat[(r2 + 83)]);
    f0 = f0 * f19;
    f1 = f1 * f20;
    f2 = f2 * f19;
    f5 = f5 * f20;
    f17 = f24 + f25;
    heapClassInst.heapFloat[(fp + (-17))] = Float32(f17);
    f3 = f13 * f21;
    heapClassInst.heapFloat[(fp + (-21))] = Float32(f3);
    f17 = f26 + f27;
    heapClassInst.heapFloat[(fp + (-18))] = Float32(f17);
    f18 = f14 * f21;
    f24 = f9 * f6;
    heapClassInst.heapFloat[(fp + (-19))] = Float32(f24);
    f25 = f11 * f7;
    f26 = Float64(heapClassInst.heapFloat[(fp + (-14))]);
    f27 = Float64(heapClassInst.heapFloat[(fp + (-15))]);
    f26 = f26 + f27;
    f27 = f13 * f23;
    f28 = f29 + f28;
    f29 = f14 * f23;
    f30 = f9 * f8;
    f3 = f11 * f10;
    f17 = Float64(heapClassInst.heapFloat[(fp + (-16))]);
    f24 = Float64(heapClassInst.heapFloat[(fp + (-20))]);
    f17 = f17 - f24;
    f12 = f22 * f12;
    f12 = f17 - f12;
    f0 = f0 + f1;
    f1 = f13 * f16;
    f2 = f2 + f5;
    f5 = f14 * f16;
    f9 = f9 * f19;
    f11 = f11 * f20;
    f17 = Float64(heapClassInst.heapFloat[(fp + (-17))]);
    f13 = Float64(heapClassInst.heapFloat[(fp + (-21))]);
    f13 = f17 + f13;
    f14 = f26 + f27;
    f17 = Float64(heapClassInst.heapFloat[(fp + (-18))]);
    f17 = f17 + f18;
    f18 = f28 + f29;
    f24 = Float64(heapClassInst.heapFloat[(fp + (-19))]);
    f24 = f24 + f25;
    f25 = f22 * f21;
    f6 = f6 * f4;
    f7 = f7 * f15;
    f3 = f30 + f3;
    f26 = f22 * f23;
    f8 = f8 * f4;
    f10 = f10 * f15;
    f0 = f0 + f1;
    f1 = f2 + f5;
    f2 = f9 + f11;
    f5 = f22 * f16;
    f4 = f19 * f4;
    f9 = f20 * f15;
    f11 = Float64(heapClassInst.heapFloat[(fp + (-13))]);
    f13 = f13 * f11;
    f15 = Float64(heapClassInst.heapFloat[(fp + (-12))]);
    f17 = f17 * f15;
    f19 = f24 + f25;
    f3 = f3 + f26;
    f6 = f6 + f7;
    f7 = f21 * f12;
    f14 = f14 * f11;
    f18 = f18 * f15;
    f8 = f8 + f10;
    f10 = f23 * f12;
    f2 = f2 + f5;
    f0 = f0 * f11;
    f1 = f1 * f15;
    f4 = f4 + f9;
    f5 = f16 * f12;
    f9 = f13 + f17;
    f11 = Float64(heapClassInst.heapFloat[(fp + (-11))]);
    f12 = f19 * f11;
    f6 = f6 + f7;
    f7 = Float64(heapClassInst.heapFloat[(r2 + 86)]);
    f13 = f14 + f18;
    f3 = f3 * f11;
    f8 = f8 + f10;
    f10 = Float64(heapClassInst.heapFloat[(r2 + 85)]);
    f14 = Float64(heapClassInst.heapFloat[(r2 + 87)]);
    f4 = f4 + f5;
    f0 = f0 + f1;
    f1 = f2 * f11;
    f2 = f9 + f12;
    f5 = f6 + f7;
    f3 = f13 + f3;
    f6 = f8 + f10;
    f3 = f3 + f6;
    f2 = f2 + f5;
    f0 = f0 + f1;
    f1 = f4 + f14;
    r2 = sp + (-16);
    f4 = Float64(heapClassInst.heapFloat[(fp + (-10))]);
    f4 = f4 - f3;
    f5 = Float64(heapClassInst.heapFloat[(fp + (-9))]);
    f5 = f5 - f2;
    f0 = f0 + f1;
    f1 = Float64(heapClassInst.heapFloat[(fp + (-7))]);
    f1 = f4 * f1;
    f4 = Float64(heapClassInst.heapFloat[(fp + (-6))]);
    f4 = f5 * f4;
    f5 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
    f5 = f5 - f0;
    r2 = r2 >> 2;
    heapClassInst.heapFloat[(fp + (-4))] = Float32(f3);
    heapClassInst.heapFloat[(r2 + 1)] = Float32(f2);
    f3 = f1 + f4;
    f1 = Float64(heapClassInst.heapFloat[(fp + (-5))]);
    f1 = f5 * f1;
    f3 = f3 + f1;
    heapClassInst.heapFloat[(r2 + 2)] = Float32(f0);
    heapClassInst.heap32[(r2 + 3)] = 0;
  }
  else {
    r2 = r1 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r2 + 53)]);
    f0 = -f0;
    f1 = Float64(heapClassInst.heapFloat[(r2 + 41)]);
    f2 = Float64(heapClassInst.heapFloat[(r2 + 42)]);
    f3 = Float64(heapClassInst.heapFloat[(r2 + 45)]);
    f4 = Float64(heapClassInst.heapFloat[(r2 + 54)]);
    f5 = Float64(heapClassInst.heapFloat[(r2 + 46)]);
    f6 = Float64(heapClassInst.heapFloat[(r2 + 77)]);
    f7 = Float64(heapClassInst.heapFloat[(r2 + 78)]);
    f8 = Float64(heapClassInst.heapFloat[(r2 + 73)]);
    f9 = Float64(heapClassInst.heapFloat[(r2 + 49)]);
    f10 = Float64(heapClassInst.heapFloat[(r2 + 74)]);
    f11 = Float64(heapClassInst.heapFloat[(r2 + 50)]);
    f12 = Float64(heapClassInst.heapFloat[(r2 + 55)]);
    f13 = Float64(heapClassInst.heapFloat[(r2 + 43)]);
    f14 = Float64(heapClassInst.heapFloat[(r2 + 47)]);
    f15 = f1 * f0;
    f16 = f3 * f4;
    f17 = f2 * f0;
    f18 = f5 * f4;
    f19 = Float64(heapClassInst.heapFloat[(r2 + 81)]);
    f20 = Float64(heapClassInst.heapFloat[(r2 + 82)]);
    f21 = Float64(heapClassInst.heapFloat[(r2 + 79)]);
    f22 = Float64(heapClassInst.heapFloat[(r2 + 51)]);
    f23 = Float64(heapClassInst.heapFloat[(r2 + 75)]);
    f24 = f1 * f8;
    f25 = f2 * f10;
    f26 = f3 * f8;
    f27 = f5 * f10;
    f28 = f1 * f6;
    heapClassInst.heapFloat[(fp + (-14))] = Float32(f28);
    f29 = f2 * f7;
    f30 = f3 * f6;
    f28 = f5 * f7;
    f15 = f15 - f16;
    f16 = f9 * f12;
    f17 = f17 - f18;
    f18 = f11 * f12;
    f0 = f13 * f0;
    heapClassInst.heapFloat[(fp + (-15))] = Float32(f0);
    f0 = f14 * f4;
    heapClassInst.heapFloat[(fp + (-16))] = Float32(f0);
    f4 = f15 - f16;
    f15 = f17 - f18;
    f16 = Float64(heapClassInst.heapFloat[(r2 + 83)]);
    f0 = f24 + f25;
    heapClassInst.heapFloat[(fp + (-17))] = Float32(f0);
    f17 = f13 * f23;
    f0 = f26 + f27;
    heapClassInst.heapFloat[(fp + (-18))] = Float32(f0);
    f18 = f14 * f23;
    f24 = f9 * f8;
    f25 = f11 * f10;
    f26 = Float64(heapClassInst.heapFloat[(fp + (-14))]);
    f26 = f26 + f29;
    f27 = f13 * f21;
    f28 = f30 + f28;
    f29 = f14 * f21;
    f30 = f9 * f6;
    f0 = f11 * f7;
    f1 = f1 * f19;
    heapClassInst.heapFloat[(fp + (-14))] = Float32(f1);
    f2 = f2 * f20;
    f1 = f3 * f19;
    heapClassInst.heapFloat[(fp + (-19))] = Float32(f1);
    f3 = f5 * f20;
    f5 = Float64(heapClassInst.heapFloat[(fp + (-15))]);
    f1 = Float64(heapClassInst.heapFloat[(fp + (-16))]);
    f1 = f5 - f1;
    f5 = f22 * f12;
    f1 = f1 - f5;
    f5 = Float64(heapClassInst.heapFloat[(fp + (-17))]);
    f5 = f5 + f17;
    f12 = f26 + f27;
    f17 = Float64(heapClassInst.heapFloat[(fp + (-18))]);
    f17 = f17 + f18;
    f18 = f28 + f29;
    f24 = f24 + f25;
    f25 = f22 * f23;
    f8 = f8 * f4;
    f10 = f10 * f15;
    f0 = f30 + f0;
    f26 = f22 * f21;
    f6 = f6 * f4;
    f7 = f7 * f15;
    f27 = Float64(heapClassInst.heapFloat[(fp + (-14))]);
    f2 = f27 + f2;
    f13 = f13 * f16;
    f27 = Float64(heapClassInst.heapFloat[(fp + (-19))]);
    f3 = f27 + f3;
    f14 = f14 * f16;
    f9 = f9 * f19;
    f11 = f11 * f20;
    f2 = f2 + f13;
    f3 = f3 + f14;
    f13 = Float64(heapClassInst.heapFloat[(fp + (-10))]);
    f5 = f5 * f13;
    f14 = Float64(heapClassInst.heapFloat[(fp + (-9))]);
    f17 = f17 * f14;
    f24 = f24 + f25;
    f0 = f0 + f26;
    f8 = f8 + f10;
    f10 = f23 * f1;
    f12 = f12 * f13;
    f18 = f18 * f14;
    f6 = f6 + f7;
    f7 = f21 * f1;
    f9 = f9 + f11;
    f11 = f22 * f16;
    f4 = f19 * f4;
    f15 = f20 * f15;
    f9 = f9 + f11;
    f5 = f5 + f17;
    f11 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
    f17 = f24 * f11;
    f8 = f8 + f10;
    f10 = Float64(heapClassInst.heapFloat[(r2 + 85)]);
    f12 = f12 + f18;
    f0 = f0 * f11;
    f6 = f6 + f7;
    f7 = Float64(heapClassInst.heapFloat[(r2 + 86)]);
    f2 = f2 * f13;
    f3 = f3 * f14;
    f4 = f4 + f15;
    f1 = f16 * f1;
    f13 = Float64(heapClassInst.heapFloat[(r2 + 87)]);
    f1 = f4 + f1;
    f4 = f5 + f17;
    f5 = f8 + f10;
    f0 = f12 + f0;
    f6 = f6 + f7;
    f2 = f2 + f3;
    f3 = f9 * f11;
    f4 = f4 + f5;
    f0 = f0 + f6;
    f2 = f2 + f3;
    f1 = f1 + f13;
    f3 = Float64(heapClassInst.heapFloat[(fp + (-13))]);
    f3 = f4 - f3;
    f5 = Float64(heapClassInst.heapFloat[(fp + (-12))]);
    f5 = f0 - f5;
    f1 = f2 + f1;
    f2 = Float64(heapClassInst.heapFloat[(fp + (-7))]);
    f3 = f3 * f2;
    f6 = Float64(heapClassInst.heapFloat[(fp + (-6))]);
    f5 = f5 * f6;
    f7 = Float64(heapClassInst.heapFloat[(fp + (-11))]);
    f7 = f1 - f7;
    f3 = f3 + f5;
    f5 = Float64(heapClassInst.heapFloat[(fp + (-5))]);
    f7 = f7 * f5;
    f3 = f3 + f7;
    f2 = f2 * f3;
    r2 = sp + (-16);
    f6 = f6 * f3;
    f2 = f4 + f2;
    f4 = f5 * f3;
    r2 = r2 >> 2;
    f0 = f0 + f6;
    heapClassInst.heapFloat[(fp + (-4))] = Float32(f2);
    f1 = f1 + f4;
    heapClassInst.heapFloat[(r2 + 1)] = Float32(f0);
    heapClassInst.heapFloat[(r2 + 2)] = Float32(f1);
    heapClassInst.heap32[(r2 + 3)] = 0;
  }
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 40)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 4)]);
  r3 = sp + (-16);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  heapClassInst.heap32[(g0 + 2)] = Int32(r3);
  heapClassInst.heapFloat[(g0 + 3)] = Float32(f3);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  return;
}

func _ZN23btConvexConvexAlgorithm22getAllContactManifoldsER20btAlignedObjectArrayIP20btPersistentManifoldE(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1 + 5)]);
  if (!(r2 == 0))
  {
    r0 = Int64(heapClassInst.heapU8[r0 + 16]);
    if (!(r0 == 0))
    {
      r0 = Int64(heapClassInst.heap32[(fp + 1)]);
      r3 = r0 >> 2;
      r4 = Int64(heapClassInst.heap32[(r3 + 2)]);
      r5 = Int64(heapClassInst.heap32[(r3 + 1)]);
      if (r4 == r5)
      {
        r6 = 1;
        r7 = r5 << 1;
        r7 = if (r5 == 0) {r6}  else {r7}
        if (!(r4 >= r7))
        {
          if (r7 != 0)
          {
            r2 = gNumAlignedAllocs;
            r2 = r2 >> 2;
            r4 = Int64(heapClassInst.heap32[(r2)]);
            r8 = r7 << 2;
            r4 = (r4 + 1) | 0;
            r8 = r8 | 3;
            heapClassInst.heap32[(r2)] = Int32(r4);
            r2 = (r8 + 16) | 0;
            heapClassInst.heap32[(g0)] = Int32(r2);
            mallocNew(i7);
            r2 = commonVariable.r_g0;
            if (r2 != 0)
            {
              r4 = 0;
              r8 = (r2 + 4) | 0;
              r4 = (r4 - r8) | 0;
              r4 = r4 & 15;
              r4 = (r2 + r4) | 0;
              r8 = (r4 + 4) | 0;
              r4 = r4 >> 2;
              heapClassInst.heap32[(r4)] = Int32(r2);
              r2 = r8;
            }
          }
          else {
            r2 = 0;
          }
          r4 = (r0 + 12) | 0;
          if (r5 < 1)
          {
            r8 = r4 >> 2;
            r9 = Int64(heapClassInst.heap32[(r8)]);
          }
          else {
            r8 = 0;
            while (true) {
              r9 = r4 >> 2;
              r9 = Int64(heapClassInst.heap32[(r9)]);
              r10 = r8 << 2;
              r11 = (r9 + r10) | 0;
              r11 = r11 >> 2;
              r10 = (r2 + r10) | 0;
              r11 = Int64(heapClassInst.heap32[(r11)]);
              r8 = (r8 + 1) | 0;
              r10 = r10 >> 2;
              heapClassInst.heap32[(r10)] = Int32(r11);
              if (!(r5 != r8))
              {
                break
              }
            }
            r4 = (r0 + 12) | 0;
          }
          if (r9 != 0)
          {
            r8 = Int64(heapClassInst.heapU8[r0 + 16]);
            if (r8 != 0)
            {
              r5 = gNumAlignedFree;
              r5 = r5 >> 2;
              r8 = Int64(heapClassInst.heap32[(r5)]);
              r8 = (r8 + 1) | 0;
              r9 = r9 >> 2;
              heapClassInst.heap32[(r5)] = Int32(r8);
              r5 = Int64(heapClassInst.heap32[(r9 + (-1))]);
              heapClassInst.heap32[(g0)] = Int32(r5);
              free(i7);
              r5 = Int64(heapClassInst.heap32[(r3 + 1)]);
            }
            r8 = r4 >> 2;
            heapClassInst.heap32[(r8)] = 0;
          }
          r4 = r4 >> 2;
          heapClassInst.heap8[r0 + 16] = Int8(r6);
          heapClassInst.heap32[(r4)] = Int32(r2);
          heapClassInst.heap32[(r3 + 2)] = Int32(r7);
          r2 = Int64(heapClassInst.heap32[(r1 + 5)]);
        }
      }
      r0 = r5 << 2;
      r1 = Int64(heapClassInst.heap32[(r3 + 3)]);
      r0 = (r1 + r0) | 0;
      r0 = r0 >> 2;
      heapClassInst.heap32[(r0)] = Int32(r2);
      r0 = Int64(heapClassInst.heap32[(r3 + 1)]);
      r0 = (r0 + 1) | 0;
      heapClassInst.heap32[(r3 + 1)] = Int32(r0);
    }
  }
  return;
}

func _ZN23btConvexConvexAlgorithm21calculateTimeOfImpactEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResult(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-1240);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  r3 = r2 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r1 + 29)]);
  f1 = Float64(heapClassInst.heapFloat[(r1 + 13)]);
  f2 = Float64(heapClassInst.heapFloat[(r1 + 30)]);
  f3 = Float64(heapClassInst.heapFloat[(r1 + 14)]);
  f0 = f0 - f1;
  f1 = f2 - f3;
  f2 = Float64(heapClassInst.heapFloat[(r1 + 31)]);
  f3 = Float64(heapClassInst.heapFloat[(r1 + 15)]);
  f2 = f2 - f3;
  f0 = f0 * f0;
  f1 = f1 * f1;
  f3 = Float64(heapClassInst.heapFloat[(r1 + 62)]);
  f0 = f0 + f1;
  f1 = f2 * f2;
  f2 = f3 * f3;
  f0 = f0 + f1;
  if (!(f2 <= f0))
  {
    f0 = Float64(heapClassInst.heapFloat[(r3 + 31)]);
    f1 = Float64(heapClassInst.heapFloat[(r3 + 15)]);
    f2 = Float64(heapClassInst.heapFloat[(r3 + 30)]);
    f3 = Float64(heapClassInst.heapFloat[(r3 + 14)]);
    f4 = Float64(heapClassInst.heapFloat[(r3 + 29)]);
    f5 = Float64(heapClassInst.heapFloat[(r3 + 13)]);
    f0 = f0 - f1;
    f1 = f2 - f3;
    f2 = f4 - f5;
    f2 = f2 * f2;
    f1 = f1 * f1;
    f3 = Float64(heapClassInst.heapFloat[(r3 + 62)]);
    f1 = f2 + f1;
    f0 = f0 * f0;
    f2 = f3 * f3;
    f0 = f1 + f0;
    if (f2 > f0)
    {
      f0 = 1.0;
      commonVariable.f_g0 = f0;
      return;
    }
  }
  r4 = sp + (-56);
  r5 = Int64(heapClassInst.heap32[(r1 + 48)]);
  f0 = Float64(heapClassInst.heapFloat[(r3 + 61)]);
  r6 = r4 >> 2;
  heapClassInst.heap32[(r6 + 2)] = 0;
  heapClassInst.heap32[(r6 + 3)] = 1065353216;
  heapClassInst.heap32[(r6 + 4)] = 1065353216;
  r7 = _ZTV13btSphereShape;
  heapClassInst.heap32[(r6 + 5)] = 1065353216;
  r7 = (r7 + 8) | 0;
  heapClassInst.heap32[(r6 + 6)] = 0;
  heapClassInst.heap32[(fp + (-14))] = Int32(r7);
  heapClassInst.heap32[(r6 + 1)] = 8;
  r8 = _ZTVN12btConvexCast10CastResultE;
  heapClassInst.heapFloat[(r6 + 7)] = Float32(f0);
  r9 = sp + (-232);
  r8 = (r8 + 8) | 0;
  heapClassInst.heapFloat[(r6 + 11)] = Float32(f0);
  r6 = r9 >> 2;
  heapClassInst.heap32[(fp + (-58))] = Int32(r8);
  heapClassInst.heap32[(r6 + 41)] = 1566444395;
  r10 = sp + (-592);
  heapClassInst.heap32[(r6 + 42)] = 0;
  r11 = r10 >> 2;
  heapClassInst.heap32[(r6 + 43)] = 0;
  r12 = _ZTV15btGjkConvexCast;
  r13 = 0;
  heapClassInst.heap32[(r11 + 77)] = 953267991;
  r11 = sp + (-608);
  r12 = (r12 + 8) | 0;
  heapClassInst.heap8[sp + (-260)] = Int8(r13);
  r13 = r11 >> 2;
  heapClassInst.heap32[(fp + (-152))] = Int32(r12);
  heapClassInst.heap32[(r13 + 1)] = Int32(r10);
  heapClassInst.heap32[(r13 + 2)] = Int32(r5);
  heapClassInst.heap32[(r13 + 3)] = Int32(r4);
  r4 = (r2 + 68) | 0;
  r2 = (r2 + 4) | 0;
  r5 = (r0 + 68) | 0;
  r0 = (r0 + 4) | 0;
  heapClassInst.heap32[(g0)] = Int32(r11);
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  heapClassInst.heap32[(g0 + 2)] = Int32(r5);
  heapClassInst.heap32[(g0 + 3)] = Int32(r2);
  heapClassInst.heap32[(g0 + 4)] = Int32(r4);
  heapClassInst.heap32[(g0 + 5)] = Int32(r9);
  _ZN15btGjkConvexCast16calcTimeOfImpactERK11btTransformS2_S2_S2_RN12btConvexCast10CastResultE(i7);
  r9 = commonVariable.r_g0;
  if (r9 != 0)
  {
    f0 = Float64(heapClassInst.heapFloat[(r6 + 41)]);
    f1 = Float64(heapClassInst.heapFloat[(r1 + 60)]);
    if (!(f1 <= f0))
    {
      heapClassInst.heapFloat[(r1 + 60)] = Float32(f0);
    }
    f1 = Float64(heapClassInst.heapFloat[(r3 + 60)]);
    if (!(f1 <= f0))
    {
      heapClassInst.heapFloat[(r3 + 60)] = Float32(f0);
    }
    f1 = 1.0;
    if (f0 >= f1)
    {
      __label__ = 3;
    }
    else {
      __label__ = 9;
    }
  }
  else {
    __label__ = 3;
  }
  if (__label__ == 3) {
    f0 = 1.0;
  }
  r6 = _ZTV12btConvexCast;
  r9 = _ZTV13btConvexShape;
  r6 = (r6 + 8) | 0;
  r9 = (r9 + 8) | 0;
  heapClassInst.heap32[(fp + (-152))] = Int32(r6);
  heapClassInst.heap32[(fp + (-14))] = Int32(r9);
  r6 = sp + (-664);
  r9 = Int64(heapClassInst.heap32[(r3 + 48)]);
  f1 = Float64(heapClassInst.heapFloat[(r1 + 61)]);
  r10 = r6 >> 2;
  heapClassInst.heap32[(r10 + 2)] = 0;
  heapClassInst.heap32[(r10 + 3)] = 1065353216;
  heapClassInst.heap32[(r10 + 4)] = 1065353216;
  heapClassInst.heap32[(r10 + 5)] = 1065353216;
  heapClassInst.heap32[(r10 + 6)] = 0;
  heapClassInst.heap32[(fp + (-166))] = Int32(r7);
  heapClassInst.heap32[(r10 + 1)] = 8;
  heapClassInst.heapFloat[(r10 + 7)] = Float32(f1);
  r7 = sp + (-840);
  heapClassInst.heapFloat[(r10 + 11)] = Float32(f1);
  r10 = r7 >> 2;
  heapClassInst.heap32[(fp + (-210))] = Int32(r8);
  heapClassInst.heap32[(r10 + 41)] = 1566444395;
  r8 = sp + (-1200);
  heapClassInst.heap32[(r10 + 42)] = 0;
  r11 = r8 >> 2;
  heapClassInst.heap32[(r10 + 43)] = 0;
  heapClassInst.heap32[(r11 + 77)] = 953267991;
  r11 = Int64(heapClassInst.heapU8[sp + (-868)]);
  r11 = r11 & 240;
  r13 = sp + (-1216);
  heapClassInst.heap8[sp + (-868)] = Int8(r11);
  r11 = r13 >> 2;
  heapClassInst.heap32[(fp + (-304))] = Int32(r12);
  heapClassInst.heap32[(r11 + 1)] = Int32(r8);
  heapClassInst.heap32[(r11 + 2)] = Int32(r6);
  heapClassInst.heap32[(r11 + 3)] = Int32(r9);
  heapClassInst.heap32[(g0)] = Int32(r13);
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  heapClassInst.heap32[(g0 + 2)] = Int32(r5);
  heapClassInst.heap32[(g0 + 3)] = Int32(r2);
  heapClassInst.heap32[(g0 + 4)] = Int32(r4);
  heapClassInst.heap32[(g0 + 5)] = Int32(r7);
  _ZN15btGjkConvexCast16calcTimeOfImpactERK11btTransformS2_S2_S2_RN12btConvexCast10CastResultE(i7);
  r0 = commonVariable.r_g0;
  if (!(r0 == 0))
  {
    f1 = Float64(heapClassInst.heapFloat[(r10 + 41)]);
    f2 = Float64(heapClassInst.heapFloat[(r1 + 60)]);
    if (!(f2 <= f1))
    {
      heapClassInst.heapFloat[(r1 + 60)] = Float32(f1);
    }
    f2 = Float64(heapClassInst.heapFloat[(r3 + 60)]);
    if (!(f2 <= f1))
    {
      heapClassInst.heapFloat[(r3 + 60)] = Float32(f1);
    }
    if(f1 < f0){
      f0 = f1
    }
  }
  commonVariable.f_g0 = f0;
  return;
}

func _ZN23btConvexConvexAlgorithm16processCollisionEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResult(sp: Int64) : Unit
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
  i7 = sp + (-816);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1 + 5)]);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  r5 = Int64(heapClassInst.heap32[(fp + 3)]);
  r6 = Int64(heapClassInst.heap32[(fp + 4)]);
  if (r2 == 0)
  {
    r2 = Int64(heapClassInst.heap32[(r1 + 1)]);
    r7 = r2 >> 2;
    r7 = Int64(heapClassInst.heap32[(r7)]);
    r7 = r7 >> 2;
    r7 = Int64(heapClassInst.heap32[(r7 + 3)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    heapClassInst.heap32[(g0 + 2)] = Int32(r4);
    __FUNCTION_TABLE__[(r7) >> 2](i7);
    r2 = commonVariable.r_g0;
    r7 = 1;
    heapClassInst.heap32[(r1 + 5)] = Int32(r2);
    heapClassInst.heap8[r0 + 16] = Int8(r7);
  }
  r7 = r6 >> 2;
  r8 = r3 >> 2;
  heapClassInst.heap32[(r7 + 1)] = Int32(r2);
  r2 = r4 >> 2;
  r9 = Int64(heapClassInst.heap32[(r8 + 48)]);
  r10 = Int64(heapClassInst.heap32[(r2 + 48)]);
  r11 = r9 >> 2;
  r12 = Int64(heapClassInst.heap32[(r11 + 1)]);
  if (r12 != 10)
  {
    __label__ = 4;
  }
  else {
    r12 = r10 >> 2;
    r13 = Int64(heapClassInst.heap32[(r12 + 1)]);
    if (r13 == 10)
    {
      r0 = Int64(heapClassInst.heap32[(r11)]);
      r0 = r0 >> 2;
      r0 = Int64(heapClassInst.heap32[(r0 + 7)]);
      heapClassInst.heap32[(g0)] = Int32(r9);
      __FUNCTION_TABLE__[(r0) >> 2](i7);
      r0 = Int64(heapClassInst.heap32[(r12)]);
      r0 = r0 >> 2;
      r0 = Int64(heapClassInst.heap32[(r0 + 7)]);
      heapClassInst.heap32[(g0)] = Int32(r10);
      __FUNCTION_TABLE__[(r0) >> 2](i7);
      r0 = Int64(heapClassInst.heap32[(r11 + 13)]);
      r5 = Int64(heapClassInst.heap32[(r12 + 13)]);
      r11 = r5 << 2;
      r12 = r0 << 2;
      r3 = (r3 + r12) | 0;
      r4 = (r4 + r11) | 0;
      r3 = r3 >> 2;
      r4 = r4 >> 2;
      r5 = (r5 + 2) | 0;
      r0 = (r0 + 2) | 0;
      f0 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
      f1 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
      f2 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
      f3 = Float64(heapClassInst.heapFloat[(r4 + 5)]);
      r5 = (r5 % 3) | 0;
      r0 = (r0 % 3) | 0;
      f4 = Float64(heapClassInst.heapFloat[(r3 + 9)]);
      f5 = Float64(heapClassInst.heapFloat[(r4 + 9)]);
      f6 = f0 * f1;
      f7 = f2 * f3;
      f8 = Float64(heapClassInst.heapFloat[(r2 + 13)]);
      f9 = Float64(heapClassInst.heapFloat[(r8 + 13)]);
      f10 = Float64(heapClassInst.heapFloat[(r2 + 14)]);
      f11 = Float64(heapClassInst.heapFloat[(r8 + 14)]);
      f8 = f8 - f9;
      f9 = f10 - f11;
      r3 = (r10 + 28) | 0;
      r4 = r5 << 2;
      r5 = (r9 + 28) | 0;
      r0 = r0 << 2;
      f6 = f6 + f7;
      f7 = f4 * f5;
      f10 = Float64(heapClassInst.heapFloat[(r2 + 15)]);
      f11 = Float64(heapClassInst.heapFloat[(r8 + 15)]);
      f10 = f10 - f11;
      f6 = f6 + f7;
      r1 = Int64(heapClassInst.heap32[(r1 + 5)]);
      r4 = (r3 + r4) | 0;
      r3 = (r3 + r11) | 0;
      r0 = (r5 + r0) | 0;
      r5 = (r5 + r12) | 0;
      f7 = f0 * f8;
      f11 = f2 * f9;
      f12 = f1 * f8;
      f13 = f3 * f9;
      r1 = r1 >> 2;
      r4 = r4 >> 2;
      r3 = r3 >> 2;
      r0 = r0 >> 2;
      r5 = r5 >> 2;
      f14 = 1.0;
      f15 = f6 * f6;
      f7 = f7 + f11;
      f11 = f4 * f10;
      f12 = f12 + f13;
      f13 = f5 * f10;
      f15 = f14 - f15;
      f16 = Float64(heapClassInst.heapFloat[(r1 + 280)]);
      f17 = Float64(heapClassInst.heapFloat[(r4)]);
      f18 = Float64(heapClassInst.heapFloat[(r3)]);
      f19 = Float64(heapClassInst.heapFloat[(r0)]);
      f20 = Float64(heapClassInst.heapFloat[(r5)]);
      f7 = f7 + f11;
      f11 = f12 + f13;
      f12 = 0.0;
      if (f15 != f12)
      {
        f13 = f11 * f6;
        f13 = f7 - f13;
        f13 = f13 / f15;
        f15 = -f20;
        if (f13 >= f15)
        {
          if (f13 > f20)
          {
            f15 = f20;
          }
          else {
            f15 = f13;
          }
        }
      }
      else {
        f15 = 0.0;
      }
      f13 = f15 * f6;
      f11 = f13 - f11;
      f13 = -f18;
      if (f11 >= f13)
      {
        if (f11 > f18)
        {
          f13 = f6 * f18;
          f6 = f13 + f7;
          f15 = -f20;
          if (f6 >= f15)
          {
            if (f6 > f20)
            {
              f13 = f18;
              f15 = f20;
            }
            else {
              f13 = f18;
              f15 = f6;
            }
          }
          else {
            f13 = f18;
          }
        }
        else {
          f13 = f11;
        }
      }
      else {
        f6 = f6 * f13;
        f6 = f6 + f7;
        f15 = -f20;
        if (f6 >= f15)
        {
          if (f6 > f20)
          {
            f15 = f20;
          }
          else {
            f15 = f6;
          }
        }
      }
      f6 = f0 * f15;
      f7 = f2 * f15;
      f1 = f1 * f13;
      f6 = f8 - f6;
      f3 = f3 * f13;
      f7 = f9 - f7;
      f8 = f4 * f15;
      f6 = f6 + f1;
      f7 = f7 + f3;
      f5 = f5 * f13;
      f8 = f10 - f8;
      f8 = f8 + f5;
      f9 = f6 * f6;
      f10 = f7 * f7;
      f9 = f9 + f10;
      f10 = f8 * f8;
      f9 = f9 + f10;
      heapClassInst.heapFloat[(g0)] = Float32(f9);
      sqrtf(i7);
      f10 = commonVariable.f_g0 - f19;
      f10 = f10 - f17;
      if (!(f10 > f16))
      {
        f11 = 1.4210854715202004e-014;
        if (f9 > f11)
        {
          heapClassInst.heapFloat[(g0)] = Float32(f9);
          f0 = ( -1.0);
          sqrtf(i7);
          f0 = f0 / commonVariable.f_g0;
          f9 = f6 * f0;
          r0 = sp + (-16);
          f6 = f7 * f0;
          r0 = r0 >> 2;
          heapClassInst.heapFloat[(fp + (-4))] = Float32(f9);
          f12 = f8 * f0;
          heapClassInst.heapFloat[(r0 + 1)] = Float32(f6);
          heapClassInst.heapFloat[(r0 + 2)] = Float32(f12);
          heapClassInst.heap32[(r0 + 3)] = 0;
        }
        else {
          if (f4 < f12)
          {
            f6 = -f4;
          }
          else {
            f6 = f4;
          }
          f7 = 0.70710676908493042;
          if (f6 <= f7)
          {
            f6 = f0 * f0;
            f9 = f2 * f2;
            f6 = f6 + f9;
            heapClassInst.heapFloat[(g0)] = Float32(f6);
            sqrtf(i7);
            f6 = f14 / commonVariable.f_g0;
            f9 = -f2;
            f9 = f6 * f9;
            r0 = sp + (-16);
            f6 = f0 * f6;
            r0 = r0 >> 2;
            heapClassInst.heapFloat[(fp + (-4))] = Float32(f9);
            heapClassInst.heapFloat[(r0 + 1)] = Float32(f6);
            heapClassInst.heap32[(r0 + 2)] = 0;
          }
          else {
            f0 = f2 * f2;
            f6 = f4 * f4;
            f0 = f0 + f6;
            heapClassInst.heapFloat[(g0)] = Float32(f0);
            sqrtf(i7);
            r0 = sp + (-16);
            f0 = f14 / commonVariable.f_g0;
            f6 = -f4;
            f6 = f0 * f6;
            r0 = r0 >> 2;
            heapClassInst.heap32[(fp + (-4))] = 0;
            f9 = 0.0;
            f12 = f2 * f0;
            heapClassInst.heapFloat[(r0 + 1)] = Float32(f6);
            heapClassInst.heapFloat[(r0 + 2)] = Float32(f12);
          }
        }
        f0 = Float64(heapClassInst.heapFloat[(r2 + 13)]);
        f2 = Float64(heapClassInst.heapFloat[(r2 + 14)]);
        f4 = Float64(heapClassInst.heapFloat[(r2 + 15)]);
        f0 = f0 + f1;
        f1 = f9 * f17;
        r0 = sp + (-32);
        f2 = f2 + f3;
        f3 = f6 * f17;
        f0 = f0 + f1;
        r0 = r0 >> 2;
        f1 = f4 + f5;
        f4 = f12 * f17;
        f2 = f2 + f3;
        heapClassInst.heapFloat[(fp + (-8))] = Float32(f0);
        f0 = f1 + f4;
        heapClassInst.heapFloat[(r0 + 1)] = Float32(f2);
        heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
        heapClassInst.heap32[(r0 + 3)] = 0;
      }
      if (!(f10 >= f16))
      {
        r0 = sp + (-16);
        r1 = r0 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
        f1 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
        f2 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
        f0 = f0 * f0;
        f1 = f1 * f1;
        f0 = f0 + f1;
        f1 = f2 * f2;
        f0 = f0 + f1;
        f1 = 1.4210854715202004e-014;
        if (f0 >= f1)
        {
          r1 = Int64(heapClassInst.heap32[(r7)]);
          r1 = r1 >> 2;
          r1 = Int64(heapClassInst.heap32[(r1 + 4)]);
          r2 = sp + (-32);
          heapClassInst.heap32[(g0)] = Int32(r6);
          heapClassInst.heap32[(g0 + 1)] = Int32(r0);
          heapClassInst.heap32[(g0 + 2)] = Int32(r2);
          heapClassInst.heapFloat[(g0 + 3)] = Float32(f10);
          __FUNCTION_TABLE__[(r1) >> 2](i7);
        }
        else {
          r0 = _E2_str4119;
          r1 = _E2_str5120;
          heapClassInst.heap32[(g0)] = Int32(r0);
          heapClassInst.heap32[(g0 + 1)] = Int32(r1);
          heapClassInst.heap32[(g0 + 2)] = 325;
          _assert(i7);
        }
      }
      r0 = Int64(heapClassInst.heap32[(r7 + 1)]);
      if (r0 != 0)
      {
        r1 = r0 >> 2;
        r2 = Int64(heapClassInst.heap32[(r1 + 279)]);
        if (r2 == 0)
        {
          __label__ = 44;
        }
        else {
          r1 = Int64(heapClassInst.heap32[(r1 + 277)]);
          r2 = Int64(heapClassInst.heap32[(r7 + 34)]);
          if (r1 == r2)
          {
            __label__ = 43;
          }
          else {
            r1 = (r6 + 72) | 0;
            r2 = (r6 + 8) | 0;
            __label__ = 42;
          }
        }
      }
      else {
        r0 = _E2_str59;
        r1 = _E2_str160;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 101;
        _assert(i7);
      }
    }
    else {
      __label__ = 4;
    }
  }
  if (__label__ == 4) {
    r3 = sp + (-168);
    r4 = r3 >> 2;
    heapClassInst.heap32[(r4 + 32)] = 1566444395;
    heapClassInst.heap32[(r4 + 33)] = 0;
    r12 = _ZTV17btGjkPairDetector;
    r13 = Int64(heapClassInst.heap32[(r1 + 2)]);
    r14 = Int64(heapClassInst.heap32[(r1 + 3)]);
    r15 = sp + (-248);
    r12 = (r12 + 8) | 0;
    heapClassInst.heap32[(fp + (-62))] = Int32(r12);
    r12 = r15 >> 2;
    heapClassInst.heap32[(r12 + 1)] = 0;
    heapClassInst.heap32[(r12 + 2)] = 1065353216;
    heapClassInst.heap32[(r12 + 3)] = 0;
    heapClassInst.heap32[(r12 + 4)] = 0;
    heapClassInst.heap32[(r12 + 5)] = Int32(r14);
    heapClassInst.heap32[(r12 + 6)] = Int32(r13);
    heapClassInst.heap32[(r12 + 7)] = Int32(r9);
    heapClassInst.heap32[(r12 + 8)] = Int32(r10);
    r13 = Int64(heapClassInst.heap32[(r11 + 1)]);
    heapClassInst.heap32[(r12 + 9)] = Int32(r13);
    r13 = r10 >> 2;
    r14 = Int64(heapClassInst.heap32[(r13 + 1)]);
    heapClassInst.heap32[(r12 + 10)] = Int32(r14);
    r14 = Int64(heapClassInst.heap32[(r11)]);
    r14 = r14 >> 2;
    r14 = Int64(heapClassInst.heap32[(r14 + 11)]);
    heapClassInst.heap32[(g0)] = Int32(r9);
    __FUNCTION_TABLE__[(r14) >> 2](i7);
    heapClassInst.heapFloat[(r12 + 11)] = Float32(commonVariable.f_g0);
    r14 = Int64(heapClassInst.heap32[(r13)]);
    r14 = r14 >> 2;
    r14 = Int64(heapClassInst.heap32[(r14 + 11)]);
    heapClassInst.heap32[(g0)] = Int32(r10);
    __FUNCTION_TABLE__[(r14) >> 2](i7);
    r14 = 0;
    heapClassInst.heapFloat[(r12 + 12)] = Float32(commonVariable.f_g0);
    heapClassInst.heap8[sp + (-196)] = Int8(r14);
    heapClassInst.heap32[(r12 + 15)] = ( -1);
    heapClassInst.heap32[(r12 + 18)] = 1;
    heapClassInst.heap32[(r12 + 7)] = Int32(r9);
    heapClassInst.heap32[(r12 + 8)] = Int32(r10);
    r16 = Int64(heapClassInst.heap32[(r11)]);
    r16 = r16 >> 2;
    r17 = Int64(heapClassInst.heapU8[r5 + 40]);
    r16 = Int64(heapClassInst.heap32[(r16 + 11)]);
    heapClassInst.heap32[(g0)] = Int32(r9);
    __FUNCTION_TABLE__[(r16) >> 2](i7);
    f0 = commonVariable.f_g0;
    r16 = Int64(heapClassInst.heap32[(r13)]);
    r16 = r16 >> 2;
    r16 = Int64(heapClassInst.heap32[(r16 + 11)]);
    heapClassInst.heap32[(g0)] = Int32(r10);
    __FUNCTION_TABLE__[(r16) >> 2](i7);
    f0 = f0 + commonVariable.f_g0;
    r16 = Int64(heapClassInst.heap32[(r1 + 5)]);
    if (r17 == 0)
    {
      r16 = (r16 + 1120) | 0;
    }
    else {
      r16 = (r16 + 1124) | 0;
    }
    r16 = r16 >> 2;
    f1 = Float64(heapClassInst.heapFloat[(r16)]);
    f0 = f0 + f1;
    f0 = f0 * f0;
    r5 = r5 >> 2;
    heapClassInst.heapFloat[(r4 + 32)] = Float32(f0);
    r16 = Int64(heapClassInst.heap32[(r5 + 11)]);
    heapClassInst.heap32[(r4 + 33)] = Int32(r16);
    heapClassInst.heap32[(fp + (-42))] = heapClassInst.heap32[(r8 + 1)];
    heapClassInst.heap32[(r4 + 1)] = heapClassInst.heap32[(r8 + 2)];
    heapClassInst.heap32[(r4 + 2)] = heapClassInst.heap32[(r8 + 3)];
    heapClassInst.heap32[(r4 + 3)] = heapClassInst.heap32[(r8 + 4)];
    heapClassInst.heap32[(r4 + 4)] = heapClassInst.heap32[(r8 + 5)];
    heapClassInst.heap32[(r4 + 5)] = heapClassInst.heap32[(r8 + 6)];
    heapClassInst.heap32[(r4 + 6)] = heapClassInst.heap32[(r8 + 7)];
    heapClassInst.heap32[(r4 + 7)] = heapClassInst.heap32[(r8 + 8)];
    heapClassInst.heap32[(r4 + 8)] = heapClassInst.heap32[(r8 + 9)];
    heapClassInst.heap32[(r4 + 9)] = heapClassInst.heap32[(r8 + 10)];
    heapClassInst.heap32[(r4 + 10)] = heapClassInst.heap32[(r8 + 11)];
    heapClassInst.heap32[(r4 + 11)] = heapClassInst.heap32[(r8 + 12)];
    heapClassInst.heap32[(r4 + 12)] = heapClassInst.heap32[(r8 + 13)];
    heapClassInst.heap32[(r4 + 13)] = heapClassInst.heap32[(r8 + 14)];
    heapClassInst.heap32[(r4 + 14)] = heapClassInst.heap32[(r8 + 15)];
    heapClassInst.heap32[(r4 + 15)] = heapClassInst.heap32[(r8 + 16)];
    heapClassInst.heap32[(r4 + 16)] = heapClassInst.heap32[(r2 + 1)];
    heapClassInst.heap32[(r4 + 17)] = heapClassInst.heap32[(r2 + 2)];
    heapClassInst.heap32[(r4 + 18)] = heapClassInst.heap32[(r2 + 3)];
    heapClassInst.heap32[(r4 + 19)] = heapClassInst.heap32[(r2 + 4)];
    heapClassInst.heap32[(r4 + 20)] = heapClassInst.heap32[(r2 + 5)];
    heapClassInst.heap32[(r4 + 21)] = heapClassInst.heap32[(r2 + 6)];
    heapClassInst.heap32[(r4 + 22)] = heapClassInst.heap32[(r2 + 7)];
    heapClassInst.heap32[(r4 + 23)] = heapClassInst.heap32[(r2 + 8)];
    heapClassInst.heap32[(r4 + 24)] = heapClassInst.heap32[(r2 + 9)];
    heapClassInst.heap32[(r4 + 25)] = heapClassInst.heap32[(r2 + 10)];
    heapClassInst.heap32[(r4 + 26)] = heapClassInst.heap32[(r2 + 11)];
    heapClassInst.heap32[(r4 + 27)] = heapClassInst.heap32[(r2 + 12)];
    heapClassInst.heap32[(r4 + 28)] = heapClassInst.heap32[(r2 + 13)];
    heapClassInst.heap32[(r4 + 29)] = heapClassInst.heap32[(r2 + 14)];
    heapClassInst.heap32[(r4 + 30)] = heapClassInst.heap32[(r2 + 15)];
    heapClassInst.heap32[(r4 + 31)] = heapClassInst.heap32[(r2 + 16)];
    r16 = Int64(heapClassInst.heap32[(r5 + 5)]);
    heapClassInst.heap32[(g0)] = Int32(r15);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    heapClassInst.heap32[(g0 + 2)] = Int32(r6);
    heapClassInst.heap32[(g0 + 3)] = Int32(r16);
    heapClassInst.heap32[(g0 + 4)] = 0;
    _ZN17btGjkPairDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb(i7);
    r16 = Int64(heapClassInst.heap32[(r1 + 7)]);
    do {
      if (!(r16 == 0))
      {
        r16 = Int64(heapClassInst.heap32[(r7 + 1)]);
        r16 = r16 >> 2;
        r16 = Int64(heapClassInst.heap32[(r16 + 279)]);
        r17 = Int64(heapClassInst.heap32[(r1 + 8)]);
        if (!(r16 >= r17))
        {
          f0 = Float64(heapClassInst.heapFloat[(r12 + 1)]);
          f1 = Float64(heapClassInst.heapFloat[(r12 + 2)]);
          f2 = Float64(heapClassInst.heapFloat[(r12 + 3)]);
          f0 = f0 * f0;
          f1 = f1 * f1;
          f0 = f0 + f1;
          f1 = f2 * f2;
          f0 = f0 + f1;
          heapClassInst.heapFloat[(g0)] = Float32(f0);
          sqrtf(i7);
          f1 = 1.0;
          heapClassInst.heapFloat[(fp + (-169))] = Float32(f1);
          f2 = Float64(heapClassInst.heapFloat[(r12 + 3)]);
          f0 = f1 / commonVariable.f_g0;
          f1 = Float64(heapClassInst.heapFloat[(r12 + 2)]);
          f3 = Float64(heapClassInst.heapFloat[(r12 + 1)]);
          f2 = f2 * f0;
          heapClassInst.heapFloat[(fp + (-171))] = Float32(f2);
          f1 = f1 * f0;
          heapClassInst.heapFloat[(fp + (-170))] = Float32(f1);
          f0 = f3 * f0;
          heapClassInst.heapFloat[(fp + (-174))] = Float32(f0);
          f0 = 0.0;
          heapClassInst.heapFloat[(fp + (-175))] = Float32(f0);
          if (f2 < f0)
          {
            f0 = f2;
            f0 = -f0;
          }
          else {
            f0 = Float64(heapClassInst.heapFloat[(fp + (-171))]);
          }
          f1 = 0.70710676908493042;
          if (f0 <= f1)
          {
            f0 = Float64(heapClassInst.heapFloat[(fp + (-174))]);
            f1 = f0 * f0;
            f2 = Float64(heapClassInst.heapFloat[(fp + (-170))]);
            f3 = f2 * f2;
            f1 = f1 + f3;
            heapClassInst.heapFloat[(g0)] = Float32(f1);
            sqrtf(i7);
            f3 = Float64(heapClassInst.heapFloat[(fp + (-169))]);
            f1 = f3 / commonVariable.f_g0;
            f2 = -f2;
            f2 = f1 * f2;
            heapClassInst.heapFloat[(fp + (-173))] = Float32(f2);
            f0 = f0 * f1;
            heapClassInst.heapFloat[(fp + (-172))] = Float32(f0);
          }
          else {
            f0 = Float64(heapClassInst.heapFloat[(fp + (-170))]);
            f1 = f0 * f0;
            f2 = Float64(heapClassInst.heapFloat[(fp + (-171))]);
            f3 = f2 * f2;
            f1 = f1 + f3;
            heapClassInst.heapFloat[(g0)] = Float32(f1);
            sqrtf(i7);
            f3 = Float64(heapClassInst.heapFloat[(fp + (-169))]);
            f1 = f3 / commonVariable.f_g0;
            f2 = -f2;
            f2 = f1 * f2;
            heapClassInst.heapFloat[(fp + (-172))] = Float32(f2);
            f0 = f0 * f1;
            heapClassInst.heapFloat[(fp + (-175))] = Float32(f0);
            f0 = 0.0;
            heapClassInst.heapFloat[(fp + (-173))] = Float32(f0);
          }
          r11 = Int64(heapClassInst.heap32[(r11)]);
          r11 = r11 >> 2;
          r11 = Int64(heapClassInst.heap32[(r11 + 4)]);
          heapClassInst.heap32[(g0)] = Int32(r9);
          __FUNCTION_TABLE__[(r11) >> 2](i7);
          f0 = commonVariable.f_g0;
          heapClassInst.heapFloat[(fp + (-194))] = Float32(f0);
          r9 = Int64(heapClassInst.heap32[(r13)]);
          r9 = r9 >> 2;
          r9 = Int64(heapClassInst.heap32[(r9 + 4)]);
          heapClassInst.heap32[(g0)] = Int32(r10);
          __FUNCTION_TABLE__[(r9) >> 2](i7);
          f1 = commonVariable.f_g0;
          heapClassInst.heapFloat[(fp + (-195))] = Float32(f1);
          r9 = if (f0 < f1) {1} else {0};
          f2 = 0.019999999552965164;
          f3 = if (f0 < f1) {f0} else {f1};
          r9 = r9 & 1;
          f2 = f2 / f3;
          if (f0 >= f1)
          {
            f0 = Float64(heapClassInst.heapFloat[(r4 + 16)]);
            heapClassInst.heapFloat[(fp + (-176))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 17)]);
            heapClassInst.heapFloat[(fp + (-177))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 18)]);
            heapClassInst.heapFloat[(fp + (-178))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 19)]);
            heapClassInst.heapFloat[(fp + (-179))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 20)]);
            heapClassInst.heapFloat[(fp + (-180))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 21)]);
            heapClassInst.heapFloat[(fp + (-181))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 22)]);
            heapClassInst.heapFloat[(fp + (-182))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 23)]);
            heapClassInst.heapFloat[(fp + (-183))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 24)]);
            heapClassInst.heapFloat[(fp + (-184))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 25)]);
            heapClassInst.heapFloat[(fp + (-185))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 26)]);
            heapClassInst.heapFloat[(fp + (-186))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 27)]);
            heapClassInst.heapFloat[(fp + (-187))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 28)]);
            heapClassInst.heapFloat[(fp + (-188))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 29)]);
            heapClassInst.heapFloat[(fp + (-189))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 30)]);
            heapClassInst.heapFloat[(fp + (-190))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 31)]);
            heapClassInst.heapFloat[(fp + (-191))] = Float32(f0);
          }
          else {
            f0 = Float64(heapClassInst.heapFloat[(fp + (-42))]);
            heapClassInst.heapFloat[(fp + (-176))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
            heapClassInst.heapFloat[(fp + (-177))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
            heapClassInst.heapFloat[(fp + (-178))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 3)]);
            heapClassInst.heapFloat[(fp + (-179))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 4)]);
            heapClassInst.heapFloat[(fp + (-180))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 5)]);
            heapClassInst.heapFloat[(fp + (-181))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 6)]);
            heapClassInst.heapFloat[(fp + (-182))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 7)]);
            heapClassInst.heapFloat[(fp + (-183))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 8)]);
            heapClassInst.heapFloat[(fp + (-184))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 9)]);
            heapClassInst.heapFloat[(fp + (-185))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 10)]);
            heapClassInst.heapFloat[(fp + (-186))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 11)]);
            heapClassInst.heapFloat[(fp + (-187))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 12)]);
            heapClassInst.heapFloat[(fp + (-188))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 13)]);
            heapClassInst.heapFloat[(fp + (-189))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 14)]);
            heapClassInst.heapFloat[(fp + (-190))] = Float32(f0);
            f0 = Float64(heapClassInst.heapFloat[(r4 + 15)]);
            heapClassInst.heapFloat[(fp + (-191))] = Float32(f0);
          }
          f0 = Float64(heapClassInst.heapFloat[(fp + (-173))]);
          f0 = f0 * f0;
          f1 = Float64(heapClassInst.heapFloat[(fp + (-172))]);
          f1 = f1 * f1;
          f3 = 0.5;
          heapClassInst.heapFloat[(fp + (-193))] = Float32(f3);
          f4 = Float64(heapClassInst.heapFloat[(fp + (-174))]);
          f4 = f4 * f4;
          f5 = Float64(heapClassInst.heapFloat[(fp + (-170))]);
          f5 = f5 * f5;
          f0 = f0 + f1;
          f1 = Float64(heapClassInst.heapFloat[(fp + (-175))]);
          f1 = f1 * f1;
          f6 = 0.39269909262657166;
          f7 = 0.19634954631328583;
          f3 = f2 * f3;
          f4 = f4 + f5;
          f5 = Float64(heapClassInst.heapFloat[(fp + (-171))]);
          f5 = f5 * f5;
          f0 = f0 + f1;
          heapClassInst.heapFloat[(fp + (-196))] = Float32(f0);
          f0 = if (f2 > f6) {f7} else {f3};
          heapClassInst.heapFloat[(fp + (-197))] = Float32(f0);
          f0 = f4 + f5;
          heapClassInst.heapFloat[(fp + (-192))] = Float32(f0);
          while (true) {
            r10 = Int64(heapClassInst.heap32[(r1 + 7)]);
            if (r10 > r14)
            {
              f0 = 1.1920928955078125e-007;
              f1 = Float64(heapClassInst.heapFloat[(fp + (-196))]);
              if (!(f1 <= f0))
              {
                f0 = f1;
                heapClassInst.heapFloat[(g0)] = Float32(f0);
                sqrtf(i7);
                f0 = commonVariable.f_g0;
                f1 = 0.0;
                if (f0 != f1)
                {
                  f2 = Float64(heapClassInst.heapFloat[(fp + (-197))]);
                  heapClassInst.heapFloat[(g0)] = Float32(f2);
                  sinf(i7);
                  f3 = commonVariable.f_g0;
                  heapClassInst.heapFloat[(g0)] = Float32(f2);
                  cosf(i7);
                  f2 = commonVariable.f_g0;
                  r10 = Int64(heapClassInst.heap32[(r1 + 7)]);
                  f4 = Float64(heapClassInst.heapFloat[(fp + (-192))]);
                  heapClassInst.heapFloat[(g0)] = Float32(f4);
                  sqrtf(i7);
                  f4 = commonVariable.f_g0;
                  if (f4 != f1)
                  {
                    f0 = f3 / f0;
                    f3 = Float64(heapClassInst.heapFloat[(fp + (-175))]);
                    f3 = f3 * f0;
                    f5 = Float64(heapClassInst.heapFloat[(fp + (-172))]);
                    f5 = f5 * f0;
                    f6 = Float64(heapClassInst.heapFloat[(fp + (-173))]);
                    f0 = f6 * f0;
                    f6 = 6.2831854820251465;
                    f7 = Float64(r10);
                    f8 = Float64(r14);
                    f6 = f6 / f7;
                    f6 = f8 * f6;
                    f7 = Float64(heapClassInst.heapFloat[(fp + (-193))]);
                    f6 = f6 * f7;
                    heapClassInst.heapFloat[(g0)] = Float32(f6);
                    sinf(i7);
                    heapClassInst.heapFloat[(g0)] = Float32(f6);
                    f4 = commonVariable.f_g0 / f4;
                    f6 = Float64(heapClassInst.heapFloat[(fp + (-171))]);
                    f6 = f6 * f4;
                    f7 = Float64(heapClassInst.heapFloat[(fp + (-170))]);
                    f7 = f7 * f4;
                    f8 = Float64(heapClassInst.heapFloat[(fp + (-174))]);
                    f4 = f8 * f4;
                    cosf(i7);
                    f8 = commonVariable.f_g0;
                    f10 = Float64(heapClassInst.heapFloat[(fp + (-195))]);
                    f9 = Float64(heapClassInst.heapFloat[(fp + (-194))]);
                    if (f9 >= f10)
                    {
                      f9 = Float64(heapClassInst.heapFloat[(r8 + 1)]);
                      heapClassInst.heapFloat[(fp + (-155))] = Float32(f9);
                      heapClassInst.heapFloat[(fp + (-42))] = Float32(f9);
                      f9 = Float64(heapClassInst.heapFloat[(r8 + 2)]);
                      heapClassInst.heapFloat[(fp + (-156))] = Float32(f9);
                      heapClassInst.heapFloat[(r4 + 1)] = Float32(f9);
                      f9 = Float64(heapClassInst.heapFloat[(r8 + 3)]);
                      heapClassInst.heapFloat[(fp + (-157))] = Float32(f9);
                      heapClassInst.heapFloat[(r4 + 2)] = Float32(f9);
                      f9 = Float64(heapClassInst.heapFloat[(r8 + 4)]);
                      heapClassInst.heapFloat[(fp + (-163))] = Float32(f9);
                      heapClassInst.heapFloat[(r4 + 3)] = Float32(f9);
                      f9 = Float64(heapClassInst.heapFloat[(r8 + 5)]);
                      heapClassInst.heapFloat[(fp + (-158))] = Float32(f9);
                      heapClassInst.heapFloat[(r4 + 4)] = Float32(f9);
                      f9 = Float64(heapClassInst.heapFloat[(r8 + 6)]);
                      heapClassInst.heapFloat[(fp + (-159))] = Float32(f9);
                      heapClassInst.heapFloat[(r4 + 5)] = Float32(f9);
                      f9 = Float64(heapClassInst.heapFloat[(r8 + 7)]);
                      heapClassInst.heapFloat[(fp + (-160))] = Float32(f9);
                      heapClassInst.heapFloat[(r4 + 6)] = Float32(f9);
                      f9 = Float64(heapClassInst.heapFloat[(r8 + 8)]);
                      heapClassInst.heapFloat[(fp + (-162))] = Float32(f9);
                      heapClassInst.heapFloat[(r4 + 7)] = Float32(f9);
                      f9 = Float64(heapClassInst.heapFloat[(r8 + 9)]);
                      heapClassInst.heapFloat[(fp + (-161))] = Float32(f9);
                      f10 = f8 * f2;
                      f11 = f0 * f4;
                      f12 = f8 * f0;
                      f13 = f2 * f4;
                      f14 = f8 * f5;
                      f15 = f2 * f7;
                      heapClassInst.heapFloat[(r4 + 8)] = Float32(f9);
                      f9 = f10 + f11;
                      f10 = f5 * f7;
                      f11 = f8 * f3;
                      f2 = f2 * f6;
                      f12 = f12 - f13;
                      f13 = f3 * f7;
                      f14 = f14 - f15;
                      f15 = f0 * f6;
                      f16 = Float64(heapClassInst.heapFloat[(r8 + 10)]);
                      heapClassInst.heapFloat[(fp + (-164))] = Float32(f16);
                      f9 = f9 + f10;
                      f10 = f3 * f6;
                      f2 = f11 - f2;
                      f11 = f5 * f4;
                      f12 = f12 - f13;
                      f5 = f5 * f6;
                      f13 = f14 - f15;
                      f3 = f3 * f4;
                      f9 = f9 + f10;
                      f5 = f12 + f5;
                      f3 = f13 + f3;
                      heapClassInst.heapFloat[(r4 + 9)] = Float32(f16);
                      f2 = f2 - f11;
                      f0 = f0 * f7;
                      f0 = f2 + f0;
                      f2 = Float64(heapClassInst.heapFloat[(r8 + 11)]);
                      heapClassInst.heapFloat[(fp + (-166))] = Float32(f2);
                      f10 = f9 * f7;
                      f11 = f3 * f8;
                      f12 = f9 * f4;
                      f13 = f5 * f8;
                      heapClassInst.heapFloat[(r4 + 10)] = Float32(f2);
                      f2 = f10 + f11;
                      f10 = f0 * f4;
                      f11 = f12 + f13;
                      f12 = f3 * f6;
                      f13 = f9 * f6;
                      f14 = f0 * f8;
                      f17 = Float64(heapClassInst.heapFloat[(r8 + 12)]);
                      f8 = f9 * f8;
                      f9 = f5 * f4;
                      f2 = f2 + f10;
                      f10 = f5 * f6;
                      f11 = f11 + f12;
                      f12 = f0 * f7;
                      f13 = f13 + f14;
                      f5 = f5 * f7;
                      f10 = f2 - f10;
                      f2 = f11 - f12;
                      heapClassInst.heapFloat[(r4 + 11)] = Float32(f17);
                      f8 = f8 - f9;
                      f7 = f3 * f7;
                      f5 = f13 + f5;
                      f3 = f3 * f4;
                      f4 = Float64(heapClassInst.heapFloat[(r8 + 13)]);
                      heapClassInst.heapFloat[(fp + (-165))] = Float32(f4);
                      f3 = f5 - f3;
                      f5 = f8 - f7;
                      f0 = f0 * f6;
                      f6 = f2 * f2;
                      f7 = f10 * f10;
                      f5 = f5 - f0;
                      heapClassInst.heapFloat[(r4 + 12)] = Float32(f4);
                      f0 = f6 + f7;
                      f4 = f3 * f3;
                      f6 = Float64(heapClassInst.heapFloat[(r8 + 14)]);
                      heapClassInst.heapFloat[(fp + (-167))] = Float32(f6);
                      f0 = f0 + f4;
                      f4 = f5 * f5;
                      heapClassInst.heapFloat[(r4 + 13)] = Float32(f6);
                      f6 = 2.0;
                      f0 = f0 + f4;
                      f0 = f6 / f0;
                      f4 = Float64(heapClassInst.heapFloat[(r8 + 15)]);
                      heapClassInst.heapFloat[(fp + (-168))] = Float32(f4);
                      f6 = f3 * f0;
                      f7 = f10 * f0;
                      heapClassInst.heapFloat[(r4 + 14)] = Float32(f4);
                      f16 = Float64(heapClassInst.heapFloat[(r8 + 16)]);
                      f4 = f10 * f7;
                      f3 = f3 * f6;
                      f8 = f4 + f3;
                      f9 = f2 * f7;
                      f11 = f5 * f6;
                      heapClassInst.heapFloat[(r4 + 15)] = Float32(f16);
                      f12 = Float64(heapClassInst.heapFloat[(fp + (-169))]);
                      f8 = f12 - f8;
                      f13 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
                      f14 = f9 - f11;
                      f15 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
                      f18 = f2 * f6;
                      f7 = f5 * f7;
                      f19 = f2 * f0;
                      f20 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
                      f21 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
                      f0 = f13 * f8;
                      f22 = f15 * f14;
                      f23 = f18 + f7;
                      f24 = Float64(heapClassInst.heapFloat[(r2 + 9)]);
                      f25 = f2 * f19;
                      f26 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
                      f27 = Float64(heapClassInst.heapFloat[(r2 + 7)]);
                      f28 = Float64(heapClassInst.heapFloat[(r2 + 11)]);
                      f29 = Float64(heapClassInst.heapFloat[(r2 + 10)]);
                      f2 = f20 * f8;
                      f30 = f21 * f14;
                      f0 = f0 + f22;
                      f22 = f24 * f23;
                      f3 = f25 + f3;
                      f0 = f0 + f22;
                      f8 = f26 * f8;
                      f14 = f27 * f14;
                      f2 = f2 + f30;
                      f22 = f29 * f23;
                      f9 = f9 + f11;
                      f11 = f12 - f3;
                      f2 = f2 + f22;
                      heapClassInst.heapFloat[(r4 + 16)] = Float32(f0);
                      f6 = f10 * f6;
                      f10 = f5 * f19;
                      f3 = f8 + f14;
                      f5 = f28 * f23;
                      f8 = f6 - f10;
                      f3 = f3 + f5;
                      heapClassInst.heapFloat[(r4 + 17)] = Float32(f2);
                      f5 = f13 * f9;
                      f14 = f15 * f11;
                      heapClassInst.heapFloat[(r4 + 18)] = Float32(f3);
                      f19 = f20 * f9;
                      f22 = f21 * f11;
                      f5 = f5 + f14;
                      f14 = f24 * f8;
                      f5 = f5 + f14;
                      heapClassInst.heap32[(r4 + 19)] = 0;
                      f9 = f26 * f9;
                      f11 = f27 * f11;
                      f14 = f19 + f22;
                      f19 = f29 * f8;
                      f18 = f18 - f7;
                      f10 = f6 + f10;
                      f4 = f25 + f4;
                      f6 = f14 + f19;
                      heapClassInst.heapFloat[(r4 + 20)] = Float32(f5);
                      f7 = f9 + f11;
                      f8 = f28 * f8;
                      f4 = f12 - f4;
                      f7 = f7 + f8;
                      heapClassInst.heapFloat[(r4 + 21)] = Float32(f6);
                      f8 = f13 * f18;
                      f9 = f15 * f10;
                      heapClassInst.heapFloat[(r4 + 22)] = Float32(f7);
                      f11 = f20 * f18;
                      f12 = f21 * f10;
                      f8 = f8 + f9;
                      f9 = f24 * f4;
                      f9 = f8 + f9;
                      heapClassInst.heap32[(r4 + 23)] = 0;
                      f8 = f26 * f18;
                      f13 = f27 * f10;
                      f10 = f11 + f12;
                      f11 = f29 * f4;
                      f10 = f10 + f11;
                      heapClassInst.heapFloat[(r4 + 24)] = Float32(f9);
                      f8 = f8 + f13;
                      f4 = f28 * f4;
                      f11 = f8 + f4;
                      heapClassInst.heapFloat[(r4 + 25)] = Float32(f10);
                      heapClassInst.heapFloat[(r4 + 26)] = Float32(f11);
                      heapClassInst.heap32[(r4 + 27)] = 0;
                      f12 = Float64(heapClassInst.heapFloat[(r4 + 28)]);
                      f13 = Float64(heapClassInst.heapFloat[(r4 + 29)]);
                      f14 = Float64(heapClassInst.heapFloat[(r4 + 30)]);
                      f15 = Float64(heapClassInst.heapFloat[(r4 + 31)]);
                      f8 = f1;
                      f4 = f1;
                    }
                    else {
                      f1 = f8 * f2;
                      f9 = f0 * f4;
                      f10 = f8 * f0;
                      f11 = f2 * f4;
                      f12 = f8 * f5;
                      f13 = f2 * f7;
                      f1 = f1 + f9;
                      f9 = f5 * f7;
                      f14 = f8 * f3;
                      f2 = f2 * f6;
                      f10 = f10 - f11;
                      f11 = f3 * f7;
                      f12 = f12 - f13;
                      f13 = f0 * f6;
                      f1 = f1 + f9;
                      f9 = f3 * f6;
                      f2 = f14 - f2;
                      f14 = f5 * f4;
                      f10 = f10 - f11;
                      f5 = f5 * f6;
                      f11 = f12 - f13;
                      f3 = f3 * f4;
                      f1 = f1 + f9;
                      f5 = f10 + f5;
                      f3 = f11 + f3;
                      f2 = f2 - f14;
                      f0 = f0 * f7;
                      f0 = f2 + f0;
                      f2 = f1 * f7;
                      f9 = f3 * f8;
                      f10 = f1 * f4;
                      f11 = f5 * f8;
                      f2 = f2 + f9;
                      f9 = f0 * f4;
                      f10 = f10 + f11;
                      f11 = f3 * f6;
                      f12 = f1 * f6;
                      f13 = f0 * f8;
                      f1 = f1 * f8;
                      f8 = f5 * f4;
                      f2 = f2 + f9;
                      f9 = f5 * f6;
                      f10 = f10 + f11;
                      f11 = f0 * f7;
                      f12 = f12 + f13;
                      f5 = f5 * f7;
                      f2 = f2 - f9;
                      f9 = f10 - f11;
                      f1 = f1 - f8;
                      f7 = f3 * f7;
                      f5 = f12 + f5;
                      f3 = f3 * f4;
                      f3 = f5 - f3;
                      f1 = f1 - f7;
                      f0 = f0 * f6;
                      f4 = f9 * f9;
                      f5 = f2 * f2;
                      f0 = f1 - f0;
                      f1 = f4 + f5;
                      f4 = f3 * f3;
                      f1 = f1 + f4;
                      f4 = f0 * f0;
                      f5 = 2.0;
                      f1 = f1 + f4;
                      f1 = f5 / f1;
                      f4 = f3 * f1;
                      f5 = f2 * f1;
                      f6 = f2 * f5;
                      f3 = f3 * f4;
                      f7 = f6 + f3;
                      f8 = f9 * f5;
                      f10 = f0 * f4;
                      f11 = Float64(heapClassInst.heapFloat[(fp + (-169))]);
                      f7 = f11 - f7;
                      f12 = Float64(heapClassInst.heapFloat[(r8 + 1)]);
                      f13 = f8 - f10;
                      f14 = Float64(heapClassInst.heapFloat[(r8 + 5)]);
                      f15 = f9 * f4;
                      f5 = f0 * f5;
                      f1 = f9 * f1;
                      f16 = Float64(heapClassInst.heapFloat[(r8 + 2)]);
                      f17 = Float64(heapClassInst.heapFloat[(r8 + 6)]);
                      f18 = f12 * f7;
                      f19 = f14 * f13;
                      f20 = f15 + f5;
                      f21 = Float64(heapClassInst.heapFloat[(r8 + 9)]);
                      f9 = f9 * f1;
                      f22 = Float64(heapClassInst.heapFloat[(r8 + 3)]);
                      f23 = Float64(heapClassInst.heapFloat[(r8 + 7)]);
                      f24 = Float64(heapClassInst.heapFloat[(r8 + 11)]);
                      f25 = Float64(heapClassInst.heapFloat[(r8 + 10)]);
                      f26 = f16 * f7;
                      f27 = f17 * f13;
                      f18 = f18 + f19;
                      f19 = f21 * f20;
                      f3 = f9 + f3;
                      f18 = f18 + f19;
                      heapClassInst.heapFloat[(fp + (-155))] = Float32(f18);
                      f7 = f22 * f7;
                      f13 = f23 * f13;
                      f19 = f26 + f27;
                      f26 = f25 * f20;
                      f8 = f8 + f10;
                      f3 = f11 - f3;
                      f10 = f19 + f26;
                      heapClassInst.heapFloat[(fp + (-156))] = Float32(f10);
                      heapClassInst.heapFloat[(fp + (-42))] = Float32(f18);
                      f2 = f2 * f4;
                      f0 = f0 * f1;
                      f1 = f7 + f13;
                      f4 = f24 * f20;
                      f7 = f2 - f0;
                      f1 = f1 + f4;
                      heapClassInst.heapFloat[(fp + (-157))] = Float32(f1);
                      heapClassInst.heapFloat[(r4 + 1)] = Float32(f10);
                      f4 = f12 * f8;
                      f10 = f14 * f3;
                      heapClassInst.heapFloat[(r4 + 2)] = Float32(f1);
                      f1 = f16 * f8;
                      f13 = f17 * f3;
                      f4 = f4 + f10;
                      f10 = f21 * f7;
                      f4 = f4 + f10;
                      heapClassInst.heapFloat[(fp + (-158))] = Float32(f4);
                      heapClassInst.heap32[(r4 + 3)] = 0;
                      f8 = f22 * f8;
                      f3 = f23 * f3;
                      f1 = f1 + f13;
                      f10 = f25 * f7;
                      f5 = f15 - f5;
                      f0 = f2 + f0;
                      f2 = f9 + f6;
                      f1 = f1 + f10;
                      heapClassInst.heapFloat[(fp + (-159))] = Float32(f1);
                      heapClassInst.heapFloat[(r4 + 4)] = Float32(f4);
                      f3 = f8 + f3;
                      f4 = f24 * f7;
                      f2 = f11 - f2;
                      f3 = f3 + f4;
                      heapClassInst.heapFloat[(fp + (-160))] = Float32(f3);
                      heapClassInst.heapFloat[(r4 + 5)] = Float32(f1);
                      f1 = f12 * f5;
                      f4 = f14 * f0;
                      heapClassInst.heapFloat[(r4 + 6)] = Float32(f3);
                      f3 = f16 * f5;
                      f6 = f17 * f0;
                      f1 = f1 + f4;
                      f4 = f21 * f2;
                      f1 = f1 + f4;
                      heapClassInst.heapFloat[(fp + (-161))] = Float32(f1);
                      heapClassInst.heap32[(r4 + 7)] = 0;
                      f4 = f22 * f5;
                      f0 = f23 * f0;
                      f3 = f3 + f6;
                      f5 = f25 * f2;
                      f3 = f3 + f5;
                      heapClassInst.heapFloat[(fp + (-164))] = Float32(f3);
                      heapClassInst.heapFloat[(r4 + 8)] = Float32(f1);
                      f0 = f4 + f0;
                      f1 = f24 * f2;
                      f0 = f0 + f1;
                      heapClassInst.heapFloat[(fp + (-166))] = Float32(f0);
                      heapClassInst.heapFloat[(r4 + 9)] = Float32(f3);
                      heapClassInst.heapFloat[(r4 + 10)] = Float32(f0);
                      heapClassInst.heap32[(r4 + 11)] = 0;
                      f0 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
                      heapClassInst.heapFloat[(r4 + 16)] = Float32(f0);
                      f2 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
                      heapClassInst.heapFloat[(r4 + 17)] = Float32(f2);
                      f3 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
                      heapClassInst.heapFloat[(r4 + 18)] = Float32(f3);
                      f4 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
                      heapClassInst.heapFloat[(r4 + 19)] = Float32(f4);
                      f5 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
                      heapClassInst.heapFloat[(r4 + 20)] = Float32(f5);
                      f6 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
                      heapClassInst.heapFloat[(r4 + 21)] = Float32(f6);
                      f7 = Float64(heapClassInst.heapFloat[(r2 + 7)]);
                      heapClassInst.heapFloat[(r4 + 22)] = Float32(f7);
                      f8 = Float64(heapClassInst.heapFloat[(r2 + 8)]);
                      heapClassInst.heapFloat[(r4 + 23)] = Float32(f8);
                      f9 = Float64(heapClassInst.heapFloat[(r2 + 9)]);
                      heapClassInst.heapFloat[(r4 + 24)] = Float32(f9);
                      f10 = Float64(heapClassInst.heapFloat[(r2 + 10)]);
                      heapClassInst.heapFloat[(r4 + 25)] = Float32(f10);
                      f11 = Float64(heapClassInst.heapFloat[(r2 + 11)]);
                      heapClassInst.heapFloat[(r4 + 26)] = Float32(f11);
                      f1 = Float64(heapClassInst.heapFloat[(r2 + 12)]);
                      heapClassInst.heapFloat[(r4 + 27)] = Float32(f1);
                      f12 = Float64(heapClassInst.heapFloat[(r2 + 13)]);
                      heapClassInst.heapFloat[(r4 + 28)] = Float32(f12);
                      f13 = Float64(heapClassInst.heapFloat[(r2 + 14)]);
                      heapClassInst.heapFloat[(r4 + 29)] = Float32(f13);
                      f14 = Float64(heapClassInst.heapFloat[(r2 + 15)]);
                      heapClassInst.heapFloat[(r4 + 30)] = Float32(f14);
                      f15 = Float64(heapClassInst.heapFloat[(r2 + 16)]);
                      heapClassInst.heapFloat[(r4 + 31)] = Float32(f15);
                      f16 = Float64(heapClassInst.heapFloat[(r4 + 12)]);
                      heapClassInst.heapFloat[(fp + (-165))] = Float32(f16);
                      f16 = Float64(heapClassInst.heapFloat[(r4 + 13)]);
                      heapClassInst.heapFloat[(fp + (-167))] = Float32(f16);
                      f16 = Float64(heapClassInst.heapFloat[(r4 + 14)]);
                      heapClassInst.heapFloat[(fp + (-168))] = Float32(f16);
                      f16 = Float64(heapClassInst.heapFloat[(r4 + 15)]);
                      f17 = 0.0;
                      heapClassInst.heapFloat[(fp + (-162))] = Float32(f17);
                      heapClassInst.heapFloat[(fp + (-163))] = Float32(f17);
                    }
                    r10 = _ZTV24btPerturbedContactResult;
                    r11 = sp + (-616);
                    r12 = Int64(heapClassInst.heap32[(r5 + 5)]);
                    r10 = (r10 + 8) | 0;
                    r13 = r11 >> 2;
                    heapClassInst.heap32[(fp + (-154))] = Int32(r10);
                    heapClassInst.heap32[(r13 + 40)] = Int32(r6);
                    f18 = Float64(heapClassInst.heapFloat[(fp + (-155))]);
                    heapClassInst.heapFloat[(r13 + 41)] = Float32(f18);
                    f18 = Float64(heapClassInst.heapFloat[(fp + (-156))]);
                    heapClassInst.heapFloat[(r13 + 42)] = Float32(f18);
                    f18 = Float64(heapClassInst.heapFloat[(fp + (-157))]);
                    heapClassInst.heapFloat[(r13 + 43)] = Float32(f18);
                    f22 = Float64(heapClassInst.heapFloat[(fp + (-163))]);
                    heapClassInst.heapFloat[(r13 + 44)] = Float32(f22);
                    f18 = Float64(heapClassInst.heapFloat[(fp + (-158))]);
                    heapClassInst.heapFloat[(r13 + 45)] = Float32(f18);
                    f18 = Float64(heapClassInst.heapFloat[(fp + (-159))]);
                    heapClassInst.heapFloat[(r13 + 46)] = Float32(f18);
                    f18 = Float64(heapClassInst.heapFloat[(fp + (-160))]);
                    heapClassInst.heapFloat[(r13 + 47)] = Float32(f18);
                    f22 = Float64(heapClassInst.heapFloat[(fp + (-162))]);
                    heapClassInst.heapFloat[(r13 + 48)] = Float32(f22);
                    f18 = Float64(heapClassInst.heapFloat[(fp + (-161))]);
                    heapClassInst.heapFloat[(r13 + 49)] = Float32(f18);
                    f18 = Float64(heapClassInst.heapFloat[(fp + (-164))]);
                    heapClassInst.heapFloat[(r13 + 50)] = Float32(f18);
                    f18 = Float64(heapClassInst.heapFloat[(fp + (-166))]);
                    heapClassInst.heapFloat[(r13 + 51)] = Float32(f18);
                    heapClassInst.heapFloat[(r13 + 52)] = Float32(f17);
                    f17 = Float64(heapClassInst.heapFloat[(fp + (-165))]);
                    heapClassInst.heapFloat[(r13 + 53)] = Float32(f17);
                    f17 = Float64(heapClassInst.heapFloat[(fp + (-167))]);
                    heapClassInst.heapFloat[(r13 + 54)] = Float32(f17);
                    f17 = Float64(heapClassInst.heapFloat[(fp + (-168))]);
                    heapClassInst.heapFloat[(r13 + 55)] = Float32(f17);
                    heapClassInst.heapFloat[(r13 + 56)] = Float32(f16);
                    heapClassInst.heapFloat[(r13 + 57)] = Float32(f0);
                    heapClassInst.heapFloat[(r13 + 58)] = Float32(f2);
                    heapClassInst.heapFloat[(r13 + 59)] = Float32(f3);
                    heapClassInst.heapFloat[(r13 + 60)] = Float32(f4);
                    heapClassInst.heapFloat[(r13 + 61)] = Float32(f5);
                    heapClassInst.heapFloat[(r13 + 62)] = Float32(f6);
                    heapClassInst.heapFloat[(r13 + 63)] = Float32(f7);
                    heapClassInst.heapFloat[(r13 + 64)] = Float32(f8);
                    heapClassInst.heapFloat[(r13 + 65)] = Float32(f9);
                    heapClassInst.heapFloat[(r13 + 66)] = Float32(f10);
                    heapClassInst.heapFloat[(r13 + 67)] = Float32(f11);
                    heapClassInst.heapFloat[(r13 + 68)] = Float32(f1);
                    heapClassInst.heapFloat[(r13 + 69)] = Float32(f12);
                    heapClassInst.heapFloat[(r13 + 70)] = Float32(f13);
                    heapClassInst.heapFloat[(r13 + 71)] = Float32(f14);
                    heapClassInst.heapFloat[(r13 + 72)] = Float32(f15);
                    f0 = Float64(heapClassInst.heapFloat[(fp + (-176))]);
                    heapClassInst.heapFloat[(r13 + 73)] = Float32(f0);
                    f0 = Float64(heapClassInst.heapFloat[(fp + (-177))]);
                    heapClassInst.heapFloat[(r13 + 74)] = Float32(f0);
                    f0 = Float64(heapClassInst.heapFloat[(fp + (-178))]);
                    heapClassInst.heapFloat[(r13 + 75)] = Float32(f0);
                    f0 = Float64(heapClassInst.heapFloat[(fp + (-179))]);
                    heapClassInst.heapFloat[(r13 + 76)] = Float32(f0);
                    f0 = Float64(heapClassInst.heapFloat[(fp + (-180))]);
                    heapClassInst.heapFloat[(r13 + 77)] = Float32(f0);
                    f0 = Float64(heapClassInst.heapFloat[(fp + (-181))]);
                    heapClassInst.heapFloat[(r13 + 78)] = Float32(f0);
                    f0 = Float64(heapClassInst.heapFloat[(fp + (-182))]);
                    heapClassInst.heapFloat[(r13 + 79)] = Float32(f0);
                    f0 = Float64(heapClassInst.heapFloat[(fp + (-183))]);
                    heapClassInst.heapFloat[(r13 + 80)] = Float32(f0);
                    f0 = Float64(heapClassInst.heapFloat[(fp + (-184))]);
                    heapClassInst.heapFloat[(r13 + 81)] = Float32(f0);
                    f0 = Float64(heapClassInst.heapFloat[(fp + (-185))]);
                    heapClassInst.heapFloat[(r13 + 82)] = Float32(f0);
                    f0 = Float64(heapClassInst.heapFloat[(fp + (-186))]);
                    heapClassInst.heapFloat[(r13 + 83)] = Float32(f0);
                    f0 = Float64(heapClassInst.heapFloat[(fp + (-187))]);
                    heapClassInst.heapFloat[(r13 + 84)] = Float32(f0);
                    f0 = Float64(heapClassInst.heapFloat[(fp + (-188))]);
                    heapClassInst.heapFloat[(r13 + 85)] = Float32(f0);
                    f0 = Float64(heapClassInst.heapFloat[(fp + (-189))]);
                    heapClassInst.heapFloat[(r13 + 86)] = Float32(f0);
                    f0 = Float64(heapClassInst.heapFloat[(fp + (-190))]);
                    heapClassInst.heapFloat[(r13 + 87)] = Float32(f0);
                    f0 = Float64(heapClassInst.heapFloat[(fp + (-191))]);
                    heapClassInst.heapFloat[(r13 + 88)] = Float32(f0);
                    heapClassInst.heap8[sp + (-260)] = Int8(r9);
                    heapClassInst.heap32[(r13 + 90)] = Int32(r12);
                    heapClassInst.heap32[(g0)] = Int32(r15);
                    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
                    heapClassInst.heap32[(g0 + 2)] = Int32(r11);
                    heapClassInst.heap32[(g0 + 3)] = Int32(r12);
                    heapClassInst.heap32[(g0 + 4)] = 0;
                    _ZN17btGjkPairDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb(i7);
                  }
                  else {
                    break
                  }
                }
                else {
                  break
                }
              }
              r14 = (r14 + 1) | 0;
            }
            else {
              break
            }
          }
          r0 = _E2_str115;
          r1 = _E2_str685;
          heapClassInst.heap32[(g0)] = Int32(r0);
          heapClassInst.heap32[(g0 + 1)] = Int32(r1);
          heapClassInst.heap32[(g0 + 2)] = 61;
          _assert(i7);
        }
      }
    } while (false);
    r0 = Int64(heapClassInst.heapU8[r0 + 16]);
    if (r0 == 0)
    {
      __label__ = 44;
    }
    else {
      r0 = Int64(heapClassInst.heap32[(r7 + 1)]);
      if (r0 != 0)
      {
        r1 = r0 >> 2;
        r2 = Int64(heapClassInst.heap32[(r1 + 279)]);
        if (r2 == 0)
        {
          __label__ = 44;
        }
        else {
          r1 = Int64(heapClassInst.heap32[(r1 + 277)]);
          r2 = Int64(heapClassInst.heap32[(r7 + 34)]);
          if (r1 == r2)
          {
            __label__ = 43;
          }
          else {
            r1 = (r6 + 72) | 0;
            r6 = (r6 + 8) | 0;
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r1);
            heapClassInst.heap32[(g0 + 2)] = Int32(r6);
            _ZN20btPersistentManifold20refreshContactPointsERK11btTransformS2_(i7);
            return;
          }
        }
      }
      else {
        r0 = _E2_str59;
        r6 = _E2_str160;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r6);
        heapClassInst.heap32[(g0 + 2)] = 101;
        _assert(i7);
      }
    }
  }
  match (__label__) {
    case 44 =>
      return;
    case 43 =>
      r1 = (r6 + 8) | 0;
      r2 = (r6 + 72) | 0;
    case _ =>
      println("break 5131");
  }
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  heapClassInst.heap32[(g0 + 2)] = Int32(r2);
  _ZN20btPersistentManifold20refreshContactPointsERK11btTransformS2_(i7);
  return;
}

func _ZN23btConvexConvexAlgorithmD0Ev(sp: Int64) : Unit
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
  r1 = _ZTV23btConvexConvexAlgorithm;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r1 = Int64(heapClassInst.heapU8[r0 + 16]);
  if (!(r1 == 0))
  {
    r1 = Int64(heapClassInst.heap32[(r2 + 5)]);
    if (!(r1 == 0))
    {
      r3 = Int64(heapClassInst.heap32[(r2 + 1)]);
      r4 = r3 >> 2;
      r4 = Int64(heapClassInst.heap32[(r4)]);
      r4 = r4 >> 2;
      r4 = Int64(heapClassInst.heap32[(r4 + 4)]);
      heapClassInst.heap32[(g0)] = Int32(r3);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      __FUNCTION_TABLE__[(r4) >> 2](i7);
    }
  }
  r1 = _ZTV30btActivatingCollisionAlgorithm;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN23btConvexConvexAlgorithmD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV23btConvexConvexAlgorithm;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r0 = Int64(heapClassInst.heapU8[r0 + 16]);
  if (!(r0 == 0))
  {
    r0 = Int64(heapClassInst.heap32[(r2 + 5)]);
    if (!(r0 == 0))
    {
      r1 = Int64(heapClassInst.heap32[(r2 + 1)]);
      r3 = r1 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3)]);
      r3 = r3 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3 + 4)]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      heapClassInst.heap32[(g0 + 1)] = Int32(r0);
      __FUNCTION_TABLE__[(r3) >> 2](i7);
    }
  }
  r0 = _ZTV30btActivatingCollisionAlgorithm;
  r0 = (r0 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r0);
  return;
}

func _ZN31btConvexPlaneCollisionAlgorithm21calculateTimeOfImpactEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResult(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var f0: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  f0 = 1.0;
  commonVariable.f_g0 = f0;
  return;
}

func _ZN31btConvexPlaneCollisionAlgorithm22getAllContactManifoldsER20btAlignedObjectArrayIP20btPersistentManifoldE(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1 + 3)]);
  if (!(r2 == 0))
  {
    r0 = Int64(heapClassInst.heapU8[r0 + 8]);
    if (!(r0 == 0))
    {
      r0 = Int64(heapClassInst.heap32[(fp + 1)]);
      r3 = r0 >> 2;
      r4 = Int64(heapClassInst.heap32[(r3 + 2)]);
      r5 = Int64(heapClassInst.heap32[(r3 + 1)]);
      if (r4 == r5)
      {
        r6 = 1;
        r7 = r5 << 1;
        r7 = if (r5 == 0) {r6}  else {r7}
        if (!(r4 >= r7))
        {
          if (r7 != 0)
          {
            r2 = gNumAlignedAllocs;
            r2 = r2 >> 2;
            r4 = Int64(heapClassInst.heap32[(r2)]);
            r8 = r7 << 2;
            r4 = (r4 + 1) | 0;
            r8 = r8 | 3;
            heapClassInst.heap32[(r2)] = Int32(r4);
            r2 = (r8 + 16) | 0;
            heapClassInst.heap32[(g0)] = Int32(r2);
            mallocNew(i7);
            r2 = commonVariable.r_g0;
            if (r2 != 0)
            {
              r4 = 0;
              r8 = (r2 + 4) | 0;
              r4 = (r4 - r8) | 0;
              r4 = r4 & 15;
              r4 = (r2 + r4) | 0;
              r8 = (r4 + 4) | 0;
              r4 = r4 >> 2;
              heapClassInst.heap32[(r4)] = Int32(r2);
              r2 = r8;
            }
          }
          else {
            r2 = 0;
          }
          r4 = (r0 + 12) | 0;
          if (r5 < 1)
          {
            r8 = r4 >> 2;
            r9 = Int64(heapClassInst.heap32[(r8)]);
          }
          else {
            r8 = 0;
            while (true) {
              r9 = r4 >> 2;
              r9 = Int64(heapClassInst.heap32[(r9)]);
              r10 = r8 << 2;
              r11 = (r9 + r10) | 0;
              r11 = r11 >> 2;
              r10 = (r2 + r10) | 0;
              r11 = Int64(heapClassInst.heap32[(r11)]);
              r8 = (r8 + 1) | 0;
              r10 = r10 >> 2;
              heapClassInst.heap32[(r10)] = Int32(r11);
              if (!(r5 != r8))
              {
                break
              }
            }
            r4 = (r0 + 12) | 0;
          }
          if (r9 != 0)
          {
            r8 = Int64(heapClassInst.heapU8[r0 + 16]);
            if (r8 != 0)
            {
              r5 = gNumAlignedFree;
              r5 = r5 >> 2;
              r8 = Int64(heapClassInst.heap32[(r5)]);
              r8 = (r8 + 1) | 0;
              r9 = r9 >> 2;
              heapClassInst.heap32[(r5)] = Int32(r8);
              r5 = Int64(heapClassInst.heap32[(r9 + (-1))]);
              heapClassInst.heap32[(g0)] = Int32(r5);
              free(i7);
              r5 = Int64(heapClassInst.heap32[(r3 + 1)]);
            }
            r8 = r4 >> 2;
            heapClassInst.heap32[(r8)] = 0;
          }
          r4 = r4 >> 2;
          heapClassInst.heap8[r0 + 16] = Int8(r6);
          heapClassInst.heap32[(r4)] = Int32(r2);
          heapClassInst.heap32[(r3 + 2)] = Int32(r7);
          r2 = Int64(heapClassInst.heap32[(r1 + 3)]);
        }
      }
      r0 = r5 << 2;
      r1 = Int64(heapClassInst.heap32[(r3 + 3)]);
      r0 = (r1 + r0) | 0;
      r0 = r0 >> 2;
      heapClassInst.heap32[(r0)] = Int32(r2);
      r0 = Int64(heapClassInst.heap32[(r3 + 1)]);
      r0 = (r0 + 1) | 0;
      heapClassInst.heap32[(r3 + 1)] = Int32(r0);
    }
  }
  return;
}

func _ZN31btConvexPlaneCollisionAlgorithm20collideSingleContactERK12btQuaternionP17btCollisionObjectS4_RK16btDispatcherInfoP16btManifoldResult(sp: Int64) : Unit
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
  var f25: Float64 = 0.0
  var f26: Float64 = 0.0
  var f27: Float64 = 0.0
  var f28: Float64 = 0.0
  var f29: Float64 = 0.0
  var f30: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-136);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r0)]);
  f1 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f2 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f3 = f0 * f0;
  f4 = f1 * f1;
  f5 = Float64(heapClassInst.heapFloat[(r0 + 3)]);
  f3 = f3 + f4;
  f4 = f2 * f2;
  f3 = f3 + f4;
  f4 = f5 * f5;
  f6 = 2.0;
  f3 = f3 + f4;
  f3 = f6 / f3;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  f4 = f2 * f3;
  f6 = f1 * f3;
  r1 = Int64(heapClassInst.heapU8[r0 + 16]);
  r2 = Int64(heapClassInst.heap32[(fp + 3)]);
  r3 = Int64(heapClassInst.heap32[(fp + 2)]);
  f3 = f0 * f3;
  r4 = if (r1 == 0) {r3} else {r2};
  f7 = f1 * f6;
  f2 = f2 * f4;
  r4 = r4 >> 2;
  f8 = f0 * f3;
  f9 = 1.0;
  f10 = f7 + f2;
  f11 = f0 * f6;
  f12 = f5 * f4;
  f2 = f8 + f2;
  f10 = f9 - f10;
  f13 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
  heapClassInst.heapFloat[(fp + (-17))] = Float32(f13);
  f13 = Float64(heapClassInst.heapFloat[(r4 + 5)]);
  heapClassInst.heapFloat[(fp + (-18))] = Float32(f13);
  f14 = f11 + f12;
  f13 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
  heapClassInst.heapFloat[(fp + (-19))] = Float32(f13);
  f13 = Float64(heapClassInst.heapFloat[(r4 + 6)]);
  heapClassInst.heapFloat[(fp + (-20))] = Float32(f13);
  f0 = f0 * f4;
  f6 = f5 * f6;
  f11 = f11 - f12;
  f2 = f9 - f2;
  f12 = Float64(heapClassInst.heapFloat[(r4 + 9)]);
  heapClassInst.heapFloat[(fp + (-24))] = Float32(f12);
  f15 = Float64(heapClassInst.heapFloat[(r4 + 10)]);
  heapClassInst.heapFloat[(fp + (-25))] = Float32(f15);
  r1 = if (r1 == 0) {r2} else {r3};
  f1 = f1 * f4;
  f3 = f5 * f3;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-17))]);
  f4 = f10 * f13;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-19))]);
  f5 = f14 * f13;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-18))]);
  f16 = f10 * f13;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-20))]);
  f17 = f14 * f13;
  f18 = f0 - f6;
  f19 = Float64(heapClassInst.heapFloat[(r4 + 3)]);
  heapClassInst.heapFloat[(fp + (-26))] = Float32(f19);
  f20 = Float64(heapClassInst.heapFloat[(r4 + 7)]);
  heapClassInst.heapFloat[(fp + (-27))] = Float32(f20);
  r1 = r1 >> 2;
  f0 = f0 + f6;
  f6 = f1 - f3;
  f1 = f1 + f3;
  f3 = Float64(heapClassInst.heapFloat[(r4 + 11)]);
  heapClassInst.heapFloat[(fp + (-21))] = Float32(f3);
  f7 = f8 + f7;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-17))]);
  f8 = f11 * f13;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-19))]);
  f21 = f2 * f13;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-18))]);
  f22 = f11 * f13;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-20))]);
  f23 = f2 * f13;
  f4 = f4 + f5;
  f5 = f18 * f19;
  f16 = f16 + f17;
  f17 = f18 * f20;
  f10 = f10 * f12;
  f14 = f14 * f15;
  f7 = f9 - f7;
  f9 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f24 = Float64(heapClassInst.heapFloat[(r1 + 6)]);
  f25 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f26 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
  f4 = f4 + f5;
  f5 = f16 + f17;
  r2 = Int64(heapClassInst.heap32[(r1 + 48)]);
  f13 = Float64(heapClassInst.heapFloat[(fp + (-17))]);
  f16 = f0 * f13;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-19))]);
  f17 = f6 * f13;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-18))]);
  f27 = f0 * f13;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-20))]);
  f28 = f6 * f13;
  f8 = f8 + f21;
  f21 = f1 * f19;
  f22 = f22 + f23;
  f23 = f1 * f20;
  f11 = f11 * f12;
  f2 = f2 * f15;
  f10 = f10 + f14;
  f14 = f18 * f3;
  f18 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
  f29 = Float64(heapClassInst.heapFloat[(r1 + 7)]);
  f8 = f8 + f21;
  f21 = f22 + f23;
  f22 = Float64(heapClassInst.heapFloat[(r1 + 10)]);
  f23 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
  r2 = r2 >> 2;
  f10 = f10 + f14;
  r3 = Int64(heapClassInst.heap32[(r4 + 48)]);
  f14 = f16 + f17;
  f16 = f7 * f19;
  f17 = f27 + f28;
  f27 = f7 * f20;
  f0 = f0 * f12;
  f6 = f6 * f15;
  f2 = f11 + f2;
  f1 = f1 * f3;
  f11 = f25 * f4;
  f28 = f26 * f5;
  f30 = f9 * f4;
  f3 = f24 * f5;
  f12 = Float64(heapClassInst.heapFloat[(r1 + 11)]);
  f14 = f14 + f16;
  f16 = f17 + f27;
  f1 = f2 + f1;
  r5 = r3 >> 2;
  f2 = Float64(heapClassInst.heapFloat[(r2 + 12)]);
  f0 = f0 + f6;
  f6 = Float64(heapClassInst.heapFloat[(fp + (-21))]);
  f7 = f7 * f6;
  f17 = f25 * f8;
  f27 = f26 * f21;
  f6 = f9 * f8;
  f13 = f24 * f21;
  f11 = f11 + f28;
  f28 = f23 * f10;
  f3 = f30 + f3;
  f30 = f22 * f10;
  f4 = f18 * f4;
  f5 = f29 * f5;
  f0 = f0 + f7;
  r5 = Int64(heapClassInst.heap32[(r5)]);
  f7 = f25 * f14;
  f15 = f26 * f16;
  f19 = f9 * f14;
  f20 = f24 * f16;
  f17 = f17 + f27;
  f27 = f23 * f1;
  f6 = f6 + f13;
  f13 = f22 * f1;
  f8 = f18 * f8;
  f21 = f29 * f21;
  f11 = f11 + f28;
  f2 = -f2;
  f3 = f3 + f30;
  f28 = Float64(heapClassInst.heapFloat[(r2 + 13)]);
  f4 = f4 + f5;
  f5 = f12 * f10;
  r5 = r5 >> 2;
  f10 = f17 + f27;
  f6 = f6 + f13;
  f7 = f7 + f15;
  f13 = f23 * f0;
  f15 = f19 + f20;
  f17 = f22 * f0;
  f14 = f18 * f14;
  f16 = f29 * f16;
  f8 = f8 + f21;
  f1 = f12 * f1;
  f11 = f11 * f2;
  f3 = f3 * f28;
  f4 = f4 + f5;
  f5 = Float64(heapClassInst.heapFloat[(r2 + 14)]);
  f19 = Float64(heapClassInst.heapFloat[(r4 + 13)]);
  heapClassInst.heapFloat[(fp + (-22))] = Float32(f19);
  f19 = Float64(heapClassInst.heapFloat[(r4 + 14)]);
  heapClassInst.heapFloat[(fp + (-23))] = Float32(f19);
  f20 = Float64(heapClassInst.heapFloat[(r4 + 15)]);
  heapClassInst.heapFloat[(fp + (-28))] = Float32(f20);
  f21 = Float64(heapClassInst.heapFloat[(r1 + 14)]);
  f27 = Float64(heapClassInst.heapFloat[(r1 + 15)]);
  heapClassInst.heapFloat[(fp + (-29))] = Float32(f27);
  f7 = f7 + f13;
  f13 = f15 + f17;
  f1 = f8 + f1;
  f8 = Float64(heapClassInst.heapFloat[(r1 + 13)]);
  r4 = Int64(heapClassInst.heap32[(r5 + 15)]);
  f14 = f14 + f16;
  f0 = f12 * f0;
  f10 = f10 * f2;
  f6 = f6 * f28;
  f3 = f11 - f3;
  f4 = f4 * f5;
  r5 = sp + (-16);
  f0 = f14 + f0;
  f2 = f7 * f2;
  f7 = f13 * f28;
  f6 = f10 - f6;
  f1 = f1 * f5;
  f3 = f3 - f4;
  r6 = r5 >> 2;
  f2 = f2 - f7;
  f0 = f0 * f5;
  f1 = f6 - f1;
  heapClassInst.heapFloat[(fp + (-4))] = Float32(f3);
  f0 = f2 - f0;
  heapClassInst.heapFloat[(r6 + 1)] = Float32(f1);
  heapClassInst.heapFloat[(r6 + 2)] = Float32(f0);
  heapClassInst.heap32[(r6 + 3)] = 0;
  r6 = sp + (-32);
  heapClassInst.heap32[(g0)] = Int32(r6);
  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
  heapClassInst.heap32[(g0 + 2)] = Int32(r5);
  f13 = Float64(heapClassInst.heapFloat[(fp + (-17))]);
  f0 = f13 * f9;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-18))]);
  f1 = f13 * f24;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-19))]);
  f2 = f13 * f9;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-20))]);
  f3 = f13 * f24;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-17))]);
  f4 = f13 * f25;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-18))]);
  f5 = f13 * f26;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-19))]);
  f6 = f13 * f25;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-20))]);
  f7 = f13 * f26;
  __FUNCTION_TABLE__[(r4) >> 2](i7);
  f8 = -f8;
  r3 = r6 >> 2;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-17))]);
  f10 = f13 * f18;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-18))]);
  f11 = f13 * f29;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-19))]);
  f13 = f13 * f18;
  f14 = Float64(heapClassInst.heapFloat[(fp + (-20))]);
  f14 = f14 * f29;
  f0 = f0 + f1;
  f1 = Float64(heapClassInst.heapFloat[(fp + (-24))]);
  f15 = f1 * f22;
  f2 = f2 + f3;
  f3 = Float64(heapClassInst.heapFloat[(fp + (-25))]);
  f16 = f3 * f22;
  f19 = Float64(heapClassInst.heapFloat[(fp + (-26))]);
  f17 = f19 * f9;
  f20 = Float64(heapClassInst.heapFloat[(fp + (-27))]);
  f28 = f20 * f24;
  f4 = f4 + f5;
  f5 = f1 * f23;
  f6 = f6 + f7;
  f7 = f3 * f23;
  f30 = f19 * f25;
  f1 = f20 * f26;
  f10 = f10 + f11;
  f11 = Float64(heapClassInst.heapFloat[(fp + (-24))]);
  f11 = f11 * f12;
  f13 = f13 + f14;
  f3 = f3 * f12;
  f14 = f19 * f18;
  f19 = f20 * f29;
  f0 = f0 + f15;
  f15 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
  f4 = f4 + f5;
  f2 = f2 + f16;
  f5 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
  f6 = f6 + f7;
  f7 = f17 + f28;
  f16 = Float64(heapClassInst.heapFloat[(fp + (-21))]);
  f17 = f16 * f22;
  f20 = Float64(heapClassInst.heapFloat[(fp + (-22))]);
  f28 = f9 * f20;
  f16 = Float64(heapClassInst.heapFloat[(fp + (-23))]);
  f16 = f24 * f16;
  f9 = f9 * f8;
  f24 = f24 * f21;
  f1 = f30 + f1;
  f30 = Float64(heapClassInst.heapFloat[(fp + (-21))]);
  f20 = f30 * f23;
  f27 = Float64(heapClassInst.heapFloat[(fp + (-22))]);
  f27 = f25 * f27;
  f30 = Float64(heapClassInst.heapFloat[(fp + (-23))]);
  f30 = f26 * f30;
  f25 = f25 * f8;
  f26 = f26 * f21;
  f10 = f10 + f11;
  f3 = f13 + f3;
  f11 = f14 + f19;
  f13 = Float64(heapClassInst.heapFloat[(fp + (-21))]);
  f13 = f13 * f12;
  f14 = Float64(heapClassInst.heapFloat[(fp + (-22))]);
  f14 = f18 * f14;
  f19 = Float64(heapClassInst.heapFloat[(fp + (-23))]);
  f19 = f29 * f19;
  f8 = f18 * f8;
  f18 = f29 * f21;
  f0 = f0 * f15;
  f2 = f2 * f5;
  f7 = f7 + f17;
  f17 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
  f1 = f1 + f20;
  f16 = f28 + f16;
  f20 = Float64(heapClassInst.heapFloat[(fp + (-28))]);
  f21 = f22 * f20;
  f9 = f9 - f24;
  f24 = Float64(heapClassInst.heapFloat[(fp + (-29))]);
  f22 = f22 * f24;
  f4 = f4 * f15;
  f6 = f6 * f5;
  f27 = f27 + f30;
  f28 = f23 * f20;
  f25 = f25 - f26;
  f23 = f23 * f24;
  f11 = f11 + f13;
  f10 = f10 * f15;
  f3 = f3 * f5;
  f5 = f14 + f19;
  f13 = f12 * f20;
  f8 = f8 - f18;
  f12 = f12 * f24;
  f0 = f0 + f2;
  f2 = f7 * f17;
  f7 = f16 + f21;
  f9 = f9 - f22;
  f4 = f4 + f6;
  f1 = f1 * f17;
  f6 = f27 + f28;
  f14 = f25 - f23;
  f3 = f10 + f3;
  f10 = f11 * f17;
  f5 = f5 + f13;
  f8 = f8 - f12;
  f0 = f0 + f2;
  f2 = f7 + f9;
  f1 = f4 + f1;
  f4 = f6 + f14;
  f3 = f3 + f10;
  f5 = f5 + f8;
  f0 = f0 + f2;
  f2 = Float64(heapClassInst.heapFloat[(r2 + 13)]);
  f1 = f1 + f4;
  f4 = Float64(heapClassInst.heapFloat[(r2 + 12)]);
  f6 = f4 * f1;
  f7 = f2 * f0;
  f3 = f3 + f5;
  f5 = Float64(heapClassInst.heapFloat[(r2 + 14)]);
  r0 = r0 >> 2;
  f6 = f6 + f7;
  f7 = f5 * f3;
  r0 = Int64(heapClassInst.heap32[(r0 + 3)]);
  f6 = f6 + f7;
  f7 = Float64(heapClassInst.heapFloat[(r2 + 16)]);
  f6 = f6 - f7;
  r3 = r0 >> 2;
  r4 = Int64(heapClassInst.heap32[(fp + 4)]);
  f7 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
  f8 = Float64(heapClassInst.heapFloat[(r1 + 10)]);
  f9 = Float64(heapClassInst.heapFloat[(r1 + 11)]);
  f10 = Float64(heapClassInst.heapFloat[(r1 + 15)]);
  f11 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
  f12 = Float64(heapClassInst.heapFloat[(r1 + 6)]);
  f13 = Float64(heapClassInst.heapFloat[(r1 + 7)]);
  f14 = Float64(heapClassInst.heapFloat[(r1 + 14)]);
  f15 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f16 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f17 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
  f18 = Float64(heapClassInst.heapFloat[(r1 + 13)]);
  f19 = Float64(heapClassInst.heapFloat[(r3 + 280)]);
  r3 = r4 >> 2;
  heapClassInst.heap32[(r3 + 1)] = Int32(r0);
  if (!(f19 <= f6))
  {
    f5 = f5 * f6;
    f2 = f2 * f6;
    f4 = f4 * f6;
    f3 = f3 - f5;
    f0 = f0 - f2;
    f1 = f1 - f4;
    f2 = Float64(heapClassInst.heapFloat[(r2 + 12)]);
    f4 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
    f5 = Float64(heapClassInst.heapFloat[(r2 + 13)]);
    f19 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
    f20 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
    f21 = Float64(heapClassInst.heapFloat[(r1 + 6)]);
    f4 = f4 * f2;
    f19 = f19 * f5;
    f22 = Float64(heapClassInst.heapFloat[(r2 + 14)]);
    f23 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
    f24 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
    f25 = Float64(heapClassInst.heapFloat[(r1 + 10)]);
    f26 = Float64(heapClassInst.heapFloat[(r1 + 11)]);
    f27 = Float64(heapClassInst.heapFloat[(r1 + 7)]);
    f20 = f20 * f2;
    f21 = f21 * f5;
    f4 = f4 + f19;
    f19 = f23 * f22;
    r0 = sp + (-48);
    f2 = f24 * f2;
    f5 = f25 * f5;
    f20 = f20 + f21;
    f21 = f27 * f22;
    f4 = f4 + f19;
    f15 = f15 * f1;
    f16 = f16 * f0;
    r1 = r0 >> 2;
    f2 = f2 + f5;
    f5 = f26 * f22;
    f19 = f20 + f21;
    heapClassInst.heapFloat[(fp + (-12))] = Float32(f4);
    f4 = f11 * f1;
    f11 = f12 * f0;
    f12 = f15 + f16;
    f15 = f17 * f3;
    f2 = f2 + f5;
    heapClassInst.heapFloat[(r1 + 1)] = Float32(f19);
    heapClassInst.heapFloat[(r1 + 2)] = Float32(f2);
    f1 = f7 * f1;
    f0 = f8 * f0;
    f2 = f4 + f11;
    f4 = f13 * f3;
    f5 = f12 + f15;
    r2 = sp + (-64);
    f0 = f1 + f0;
    f1 = f9 * f3;
    f2 = f2 + f4;
    f3 = f5 + f18;
    heapClassInst.heap32[(r1 + 3)] = 0;
    r1 = r2 >> 2;
    f0 = f0 + f1;
    f1 = f2 + f14;
    heapClassInst.heapFloat[(fp + (-16))] = Float32(f3);
    f0 = f0 + f10;
    heapClassInst.heapFloat[(r1 + 1)] = Float32(f1);
    heapClassInst.heapFloat[(r1 + 2)] = Float32(f0);
    heapClassInst.heap32[(r1 + 3)] = 0;
    r1 = Int64(heapClassInst.heap32[(r3)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1 + 4)]);
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    heapClassInst.heap32[(g0 + 2)] = Int32(r2);
    heapClassInst.heapFloat[(g0 + 3)] = Float32(f6);
    __FUNCTION_TABLE__[(r1) >> 2](i7);
  }
  return;
}

func _ZN31btConvexPlaneCollisionAlgorithm16processCollisionEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResult(sp: Int64) : Unit
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
  var f13: Float64 = 0.0
  var f14: Float64 = 0.0
  var f15: Float64 = 0.0
  var f16: Float64 = 0.0
  var f17: Float64 = 0.0
  var f18: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-56);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1 + 3)]);
  if (!(r2 == 0))
  {
    r2 = Int64(heapClassInst.heap32[(fp + 1)]);
    r3 = Int64(heapClassInst.heap32[(fp + 2)]);
    r4 = Int64(heapClassInst.heap32[(fp + 4)]);
    r5 = Int64(heapClassInst.heapU8[r0 + 16]);
    r6 = if (r5 == 0) {r2} else {r3};
    r5 = if (r5 == 0) {r3} else {r2};
    r6 = r6 >> 2;
    r5 = r5 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6 + 48)]);
    r5 = Int64(heapClassInst.heap32[(r5 + 48)]);
    r7 = sp + (-32);
    r8 = r7 >> 2;
    heapClassInst.heap32[(fp + (-8))] = 0;
    heapClassInst.heap32[(r8 + 1)] = 0;
    heapClassInst.heap32[(r8 + 2)] = 0;
    heapClassInst.heap32[(r8 + 3)] = 1065353216;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r7);
    heapClassInst.heap32[(g0 + 2)] = Int32(r2);
    heapClassInst.heap32[(g0 + 3)] = Int32(r3);
    heapClassInst.heap32[(g0 + 4)] = Int32(r4);
    r7 = r4 >> 2;
    _ZN31btConvexPlaneCollisionAlgorithm20collideSingleContactERK12btQuaternionP17btCollisionObjectS4_RK16btDispatcherInfoP16btManifoldResult(i7);
    r8 = Int64(heapClassInst.heap32[(r7 + 1)]);
    r8 = r8 >> 2;
    r8 = Int64(heapClassInst.heap32[(r8 + 279)]);
    r9 = Int64(heapClassInst.heap32[(r1 + 6)]);
    do {
      if (!(r8 >= r9))
      {
        r5 = r5 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r5 + 14)]);
        f1 = 0.0;
        if (f0 < f1)
        {
          f2 = -f0;
        }
        else {
          f2 = f0;
        }
        f3 = 0.70710676908493042;
        if (f2 <= f3)
        {
          f0 = Float64(heapClassInst.heapFloat[(r5 + 12)]);
          f2 = Float64(heapClassInst.heapFloat[(r5 + 13)]);
          f0 = f0 * f0;
          f2 = f2 * f2;
          f0 = f0 + f2;
          heapClassInst.heapFloat[(g0)] = Float32(f0);
          sqrtf(i7);
          f2 = Float64(heapClassInst.heapFloat[(r5 + 13)]);
          f3 = 1.0;
          f2 = -f2;
          f0 = f3 / commonVariable.f_g0;
          f4 = Float64(heapClassInst.heapFloat[(r5 + 12)]);
          f3 = f0 * f2;
          f2 = f4 * f0;
          f0 = f1;
        }
        else {
          f2 = Float64(heapClassInst.heapFloat[(r5 + 13)]);
          f2 = f2 * f2;
          f0 = f0 * f0;
          f0 = f2 + f0;
          heapClassInst.heapFloat[(g0)] = Float32(f0);
          sqrtf(i7);
          f2 = Float64(heapClassInst.heapFloat[(r5 + 14)]);
          f3 = 1.0;
          f2 = -f2;
          f0 = f3 / commonVariable.f_g0;
          f3 = Float64(heapClassInst.heapFloat[(r5 + 13)]);
          f2 = f0 * f2;
          f0 = f3 * f0;
          f3 = 0.0;
        }
        r8 = r6 >> 2;
        r8 = Int64(heapClassInst.heap32[(r8)]);
        r8 = r8 >> 2;
        r8 = Int64(heapClassInst.heap32[(r8 + 4)]);
        heapClassInst.heap32[(g0)] = Int32(r6);
        f4 = f3 * f3;
        f5 = f2 * f2;
        __FUNCTION_TABLE__[(r8) >> 2](i7);
        f6 = commonVariable.f_g0;
        f4 = f4 + f5;
        f5 = f0 * f0;
        f4 = f4 + f5;
        heapClassInst.heapFloat[(g0)] = Float32(f4);
        sqrtf(i7);
        f4 = commonVariable.f_g0;
        if (f4 != f1)
        {
          f1 = 0.019999999552965164;
          f1 = f1 / f6;
          f5 = 0.5;
          f6 = 0.39269909262657166;
          f7 = 0.19634954631328583;
          f8 = f1 * f5;
          f1 = if (f1 > f6) {f7} else {f8};
          heapClassInst.heapFloat[(g0)] = Float32(f1);
          sinf(i7);
          heapClassInst.heapFloat[(g0)] = Float32(f1);
          f1 = commonVariable.f_g0 / f4;
          f0 = f0 * f1;
          f2 = f2 * f1;
          f1 = f3 * f1;
          r6 = 0;
          cosf(i7);
          f3 = commonVariable.f_g0;
          while (true) {
            r8 = Int64(heapClassInst.heap32[(r1 + 5)]);
            if (r8 > r6)
            {
              f4 = Float64(heapClassInst.heapFloat[(r5 + 12)]);
              f6 = Float64(heapClassInst.heapFloat[(r5 + 13)]);
              f7 = Float64(heapClassInst.heapFloat[(r5 + 14)]);
              f4 = f4 * f4;
              f6 = f6 * f6;
              f4 = f4 + f6;
              f6 = f7 * f7;
              f4 = f4 + f6;
              heapClassInst.heapFloat[(g0)] = Float32(f4);
              sqrtf(i7);
              f4 = commonVariable.f_g0;
              f6 = 0.0;
              if (f4 != f6)
              {
                f6 = 6.2831854820251465;
                f7 = Float64(r8);
                f8 = Float64(r6);
                f6 = f6 / f7;
                f6 = f8 * f6;
                f6 = f6 * f5;
                heapClassInst.heapFloat[(g0)] = Float32(f6);
                sinf(i7);
                f7 = commonVariable.f_g0;
                heapClassInst.heapFloat[(g0)] = Float32(f6);
                cosf(i7);
                f4 = f7 / f4;
                f7 = Float64(heapClassInst.heapFloat[(r5 + 12)]);
                f7 = f7 * f4;
                f8 = Float64(heapClassInst.heapFloat[(r5 + 13)]);
                f8 = f8 * f4;
                f9 = Float64(heapClassInst.heapFloat[(r5 + 14)]);
                f10 = commonVariable.f_g0 * f3;
                f11 = f1 * f7;
                f12 = commonVariable.f_g0 * f1;
                f13 = f3 * f7;
                f4 = f9 * f4;
                f9 = f10 + f11;
                f10 = f2 * f8;
                f11 = f12 - f13;
                f12 = f0 * f8;
                f13 = commonVariable.f_g0 * f2;
                f14 = f3 * f8;
                f9 = f9 + f10;
                f10 = f0 * f4;
                f11 = f11 - f12;
                f12 = f2 * f4;
                f13 = f13 - f14;
                f14 = f1 * f4;
                f15 = commonVariable.f_g0 * f0;
                f16 = f3 * f4;
                f9 = f9 + f10;
                f10 = f11 + f12;
                f11 = f13 - f14;
                f12 = f0 * f7;
                f13 = f15 - f16;
                f14 = f2 * f7;
                f11 = f11 + f12;
                f12 = f9 * f7;
                f15 = f10 * commonVariable.f_g0;
                f13 = f13 - f14;
                f14 = f1 * f8;
                f13 = f13 + f14;
                f14 = f9 * f8;
                f16 = f11 * commonVariable.f_g0;
                f12 = f12 + f15;
                f15 = f11 * f4;
                f17 = f9 * f4;
                f18 = f13 * commonVariable.f_g0;
                f14 = f14 + f16;
                f16 = f13 * f7;
                f12 = f12 + f15;
                f15 = f13 * f8;
                r8 = sp + (-16);
                f6 = f9 * commonVariable.f_g0;
                f9 = f10 * f7;
                f17 = f17 + f18;
                f18 = f10 * f8;
                f14 = f14 + f16;
                f10 = f10 * f4;
                f12 = f12 - f15;
                r9 = r8 >> 2;
                f6 = f6 - f9;
                f8 = f11 * f8;
                f9 = f17 + f18;
                f7 = f11 * f7;
                f10 = f14 - f10;
                heapClassInst.heapFloat[(fp + (-4))] = Float32(f12);
                f6 = f6 - f8;
                f4 = f13 * f4;
                f7 = f9 - f7;
                heapClassInst.heapFloat[(r9 + 1)] = Float32(f10);
                f4 = f6 - f4;
                heapClassInst.heapFloat[(r9 + 2)] = Float32(f7);
                heapClassInst.heapFloat[(r9 + 3)] = Float32(f4);
                heapClassInst.heap32[(g0)] = Int32(r0);
                heapClassInst.heap32[(g0 + 1)] = Int32(r8);
                heapClassInst.heap32[(g0 + 2)] = Int32(r2);
                heapClassInst.heap32[(g0 + 3)] = Int32(r3);
                heapClassInst.heap32[(g0 + 4)] = Int32(r4);
                r6 = (r6 + 1) | 0;
                _ZN31btConvexPlaneCollisionAlgorithm20collideSingleContactERK12btQuaternionP17btCollisionObjectS4_RK16btDispatcherInfoP16btManifoldResult(i7);
              }
              else {
                break
              }
            }
            else {
              break
            }
          }
        }
        r0 = _E2_str115;
        r1 = _E2_str685;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 61;
        _assert(i7);
      }
    } while (false);
    r0 = Int64(heapClassInst.heapU8[r0 + 8]);
    if (!(r0 == 0))
    {
      r0 = Int64(heapClassInst.heap32[(r1 + 3)]);
      r0 = r0 >> 2;
      r0 = Int64(heapClassInst.heap32[(r0 + 279)]);
      if (!(r0 == 0))
      {
        r0 = Int64(heapClassInst.heap32[(r7 + 1)]);
        if (r0 != 0)
        {
          r1 = r0 >> 2;
          r2 = Int64(heapClassInst.heap32[(r1 + 279)]);
          if (!(r2 == 0))
          {
            r1 = Int64(heapClassInst.heap32[(r1 + 277)]);
            r2 = Int64(heapClassInst.heap32[(r7 + 34)]);
            if (r1 == r2)
            {
              r1 = (r4 + 8) | 0;
              r2 = (r4 + 72) | 0;
              heapClassInst.heap32[(g0)] = Int32(r0);
              heapClassInst.heap32[(g0 + 1)] = Int32(r1);
              heapClassInst.heap32[(g0 + 2)] = Int32(r2);
              _ZN20btPersistentManifold20refreshContactPointsERK11btTransformS2_(i7);
            }
            else {
              r1 = (r4 + 72) | 0;
              r4 = (r4 + 8) | 0;
              heapClassInst.heap32[(g0)] = Int32(r0);
              heapClassInst.heap32[(g0 + 1)] = Int32(r1);
              heapClassInst.heap32[(g0 + 2)] = Int32(r4);
              _ZN20btPersistentManifold20refreshContactPointsERK11btTransformS2_(i7);
              return;
            }
          }
        }
        else {
          r0 = _E2_str59;
          r4 = _E2_str160;
          heapClassInst.heap32[(g0)] = Int32(r0);
          heapClassInst.heap32[(g0 + 1)] = Int32(r4);
          heapClassInst.heap32[(g0 + 2)] = 101;
          _assert(i7);
        }
      }
    }
  }
  return;
}

func _ZN31btConvexPlaneCollisionAlgorithmD0Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV31btConvexPlaneCollisionAlgorithm;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r1 = Int64(heapClassInst.heapU8[r0 + 8]);
  if (!(r1 == 0))
  {
    r1 = Int64(heapClassInst.heap32[(r2 + 3)]);
    if (!(r1 == 0))
    {
      r2 = Int64(heapClassInst.heap32[(r2 + 1)]);
      r3 = r2 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3)]);
      r3 = r3 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3 + 4)]);
      heapClassInst.heap32[(g0)] = Int32(r2);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      __FUNCTION_TABLE__[(r3) >> 2](i7);
    }
  }
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN31btConvexPlaneCollisionAlgorithmD1Ev(sp: Int64) : Unit
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
  r1 = _ZTV31btConvexPlaneCollisionAlgorithm;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r0 = Int64(heapClassInst.heapU8[r0 + 8]);
  if (!(r0 == 0))
  {
    r0 = Int64(heapClassInst.heap32[(r2 + 3)]);
    if (!(r0 == 0))
    {
      r1 = Int64(heapClassInst.heap32[(r2 + 1)]);
      r2 = r1 >> 2;
      r2 = Int64(heapClassInst.heap32[(r2)]);
      r2 = r2 >> 2;
      r2 = Int64(heapClassInst.heap32[(r2 + 4)]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      heapClassInst.heap32[(g0 + 1)] = Int32(r0);
      __FUNCTION_TABLE__[(r2) >> 2](i7);
    }
  }
  return;
}

func _ZN31btDefaultCollisionConfiguration25getPersistentManifoldPoolEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 4)]);
  commonVariable.r_g0 = r0;
  return;
}

func _ZN31btDefaultCollisionConfiguration25getCollisionAlgorithmPoolEv(sp: Int64) : Unit
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

func _ZN31btDefaultCollisionConfiguration17getStackAllocatorEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 2)]);
  commonVariable.r_g0 = r0;
  return;
}

func _ZN31btDefaultCollisionConfiguration16getSimplexSolverEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 8)]);
  commonVariable.r_g0 = r0;
  return;
}

func _ZN31btConvexPlaneCollisionAlgorithm10CreateFuncD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVN31btConvexPlaneCollisionAlgorithm10CreateFuncE;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN31btConvexPlaneCollisionAlgorithm10CreateFuncD0Ev(sp: Int64) : Unit
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
  r1 = _ZTVN31btConvexPlaneCollisionAlgorithm10CreateFuncE;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN31btConvexPlaneCollisionAlgorithm10CreateFunc24CreateCollisionAlgorithmER36btCollisionAlgorithmConstructionInfoP17btCollisionObjectS4_(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-16);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 12)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = 28;
  r1 = Int64(heapClassInst.heap32[(fp)]);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = commonVariable.r_g0;
  r3 = r1 >> 2;
  r4 = _ZTV20btCollisionAlgorithm;
  r5 = Int64(heapClassInst.heap32[(r3 + 3)]);
  r3 = Int64(heapClassInst.heap32[(r3 + 2)]);
  r1 = Int64(heapClassInst.heapU8[r1 + 4]);
  r6 = r2 >> 2;
  r4 = (r4 + 8) | 0;
  heapClassInst.heap32[(r6)] = Int32(r4);
  r0 = Int64(heapClassInst.heap32[(r0)]);
  r4 = _ZTV31btConvexPlaneCollisionAlgorithm;
  r4 = (r4 + 8) | 0;
  heapClassInst.heap32[(r6 + 1)] = Int32(r0);
  r7 = 0;
  heapClassInst.heap32[(r6)] = Int32(r4);
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  r8 = Int64(heapClassInst.heap32[(fp + 3)]);
  heapClassInst.heap8[r2 + 8] = Int8(r7);
  heapClassInst.heap32[(r6 + 3)] = 0;
  if (r1 != 0)
  {
    r1 = 1;
    r6 = r2 >> 2;
    heapClassInst.heap8[r2 + 16] = Int8(r1);
    heapClassInst.heap32[(r6 + 5)] = Int32(r3);
    r3 = r0 >> 2;
    heapClassInst.heap32[(r6 + 6)] = Int32(r5);
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3 + 6)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r8);
    heapClassInst.heap32[(g0 + 2)] = Int32(r4);
    __FUNCTION_TABLE__[(r3) >> 2](i7);
    r0 = commonVariable.r_g0;
    if (!(r0 == 0))
    {
      r0 = Int64(heapClassInst.heap32[(r6 + 1)]);
      r3 = r0 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3)]);
      r3 = r3 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3 + 3)]);
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r8);
      heapClassInst.heap32[(g0 + 2)] = Int32(r4);
      __FUNCTION_TABLE__[(r3) >> 2](i7);
      heapClassInst.heap32[(r6 + 3)] = Int32(commonVariable.r_g0);
      heapClassInst.heap8[r2 + 8] = Int8(r1);
    }
  }
  else {
    r1 = r2 >> 2;
    heapClassInst.heap8[r2 + 16] = Int8(r7);
    heapClassInst.heap32[(r1 + 5)] = Int32(r3);
    r3 = r0 >> 2;
    heapClassInst.heap32[(r1 + 6)] = Int32(r5);
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3 + 6)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r4);
    heapClassInst.heap32[(g0 + 2)] = Int32(r8);
    __FUNCTION_TABLE__[(r3) >> 2](i7);
    r0 = commonVariable.r_g0;
    if (!(r0 == 0))
    {
      r0 = Int64(heapClassInst.heap32[(r1 + 1)]);
      r3 = r0 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3)]);
      r3 = r3 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3 + 3)]);
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r4);
      heapClassInst.heap32[(g0 + 2)] = Int32(r8);
      __FUNCTION_TABLE__[(r3) >> 2](i7);
      r3 = 1;
      heapClassInst.heap32[(r1 + 3)] = Int32(commonVariable.r_g0);
      heapClassInst.heap8[r2 + 8] = Int8(r3);
    }
  }
  commonVariable.r_g0 = r2;
  return;
}

func _ZN33btConvexConcaveCollisionAlgorithm10CreateFuncD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVN33btConvexConcaveCollisionAlgorithm10CreateFuncE;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN33btConvexConcaveCollisionAlgorithm10CreateFuncD0Ev(sp: Int64) : Unit
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
  r1 = _ZTVN33btConvexConcaveCollisionAlgorithm10CreateFuncE;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN33btConvexConcaveCollisionAlgorithm10CreateFunc24CreateCollisionAlgorithmER36btCollisionAlgorithmConstructionInfoP17btCollisionObjectS4_(sp: Int64) : Unit
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
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 12)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = 80;
  r1 = _ZTV20btCollisionAlgorithm;
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = commonVariable.r_g0;
  r1 = (r1 + 8) | 0;
  r3 = r2 >> 2;
  heapClassInst.heap32[(r3)] = Int32(r1);
  r1 = Int64(heapClassInst.heap32[(r0)]);
  r4 = _ZTV33btConvexConcaveCollisionAlgorithm;
  r4 = (r4 + 8) | 0;
  heapClassInst.heap32[(r3 + 1)] = Int32(r1);
  r1 = 0;
  heapClassInst.heap32[(r3)] = Int32(r4);
  heapClassInst.heap8[r2 + 8] = Int8(r1);
  r1 = _ZTV24btConvexTriangleCallback;
  r0 = Int64(heapClassInst.heap32[(r0)]);
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r3 + 3)] = Int32(r1);
  heapClassInst.heap32[(r3 + 15)] = Int32(r0);
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(r3 + 16)] = 0;
  r4 = Int64(heapClassInst.heap32[(fp + 3)]);
  heapClassInst.heap32[(r3 + 4)] = Int32(r1);
  r5 = r0 >> 2;
  heapClassInst.heap32[(r3 + 5)] = Int32(r4);
  r5 = Int64(heapClassInst.heap32[(r5)]);
  r5 = r5 >> 2;
  r5 = Int64(heapClassInst.heap32[(r5 + 3)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  heapClassInst.heap32[(g0 + 2)] = Int32(r4);
  __FUNCTION_TABLE__[(r5) >> 2](i7);
  heapClassInst.heap32[(r3 + 19)] = Int32(commonVariable.r_g0);
  r1 = Int64(heapClassInst.heap32[(r3 + 15)]);
  r3 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3 + 5)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(commonVariable.r_g0);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  commonVariable.r_g0 = r2;
  return;
}

func _ZN33btConvexConcaveCollisionAlgorithm17SwappedCreateFuncD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVN33btConvexConcaveCollisionAlgorithm17SwappedCreateFuncE;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN33btConvexConcaveCollisionAlgorithm17SwappedCreateFuncD0Ev(sp: Int64) : Unit
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
  r1 = _ZTVN33btConvexConcaveCollisionAlgorithm17SwappedCreateFuncE;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN33btConvexConcaveCollisionAlgorithm17SwappedCreateFunc24CreateCollisionAlgorithmER36btCollisionAlgorithmConstructionInfoP17btCollisionObjectS4_(sp: Int64) : Unit
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
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 12)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = 80;
  r1 = _ZTV20btCollisionAlgorithm;
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = commonVariable.r_g0;
  r1 = (r1 + 8) | 0;
  r3 = r2 >> 2;
  heapClassInst.heap32[(r3)] = Int32(r1);
  r1 = Int64(heapClassInst.heap32[(r0)]);
  r4 = _ZTV33btConvexConcaveCollisionAlgorithm;
  r4 = (r4 + 8) | 0;
  heapClassInst.heap32[(r3 + 1)] = Int32(r1);
  r1 = 1;
  heapClassInst.heap32[(r3)] = Int32(r4);
  heapClassInst.heap8[r2 + 8] = Int8(r1);
  r1 = _ZTV24btConvexTriangleCallback;
  r0 = Int64(heapClassInst.heap32[(r0)]);
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r3 + 3)] = Int32(r1);
  heapClassInst.heap32[(r3 + 15)] = Int32(r0);
  r1 = Int64(heapClassInst.heap32[(fp + 3)]);
  heapClassInst.heap32[(r3 + 16)] = 0;
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(r3 + 4)] = Int32(r1);
  r5 = r0 >> 2;
  heapClassInst.heap32[(r3 + 5)] = Int32(r4);
  r5 = Int64(heapClassInst.heap32[(r5)]);
  r5 = r5 >> 2;
  r5 = Int64(heapClassInst.heap32[(r5 + 3)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  heapClassInst.heap32[(g0 + 2)] = Int32(r4);
  __FUNCTION_TABLE__[(r5) >> 2](i7);
  heapClassInst.heap32[(r3 + 19)] = Int32(commonVariable.r_g0);
  r1 = Int64(heapClassInst.heap32[(r3 + 15)]);
  r3 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3 + 5)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(commonVariable.r_g0);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  commonVariable.r_g0 = r2;
  return;
}

func _ZN28btCompoundCollisionAlgorithm10CreateFuncD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVN28btCompoundCollisionAlgorithm10CreateFuncE;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN28btCompoundCollisionAlgorithm10CreateFuncD0Ev(sp: Int64) : Unit
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
  r1 = _ZTVN28btCompoundCollisionAlgorithm10CreateFuncE;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN28btCompoundCollisionAlgorithm10CreateFunc24CreateCollisionAlgorithmER36btCollisionAlgorithmConstructionInfoP17btCollisionObjectS4_(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-16);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 12)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = 44;
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r1 = commonVariable.r_g0;
  r2 = _ZTV20btCollisionAlgorithm;
  r3 = r1 >> 2;
  r2 = (r2 + 8) | 0;
  heapClassInst.heap32[(r3)] = Int32(r2);
  r2 = Int64(heapClassInst.heap32[(r0)]);
  r4 = _ZTV28btCompoundCollisionAlgorithm;
  r4 = (r4 + 8) | 0;
  heapClassInst.heap32[(r3 + 1)] = Int32(r2);
  r2 = 1;
  heapClassInst.heap32[(r3)] = Int32(r4);
  heapClassInst.heap8[r1 + 24] = Int8(r2);
  heapClassInst.heap32[(r3 + 5)] = 0;
  heapClassInst.heap32[(r3 + 3)] = 0;
  r2 = 0;
  heapClassInst.heap32[(r3 + 4)] = 0;
  heapClassInst.heap8[r1 + 28] = Int8(r2);
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(r3 + 8)] = Int32(r0);
  r0 = r4 >> 2;
  heapClassInst.heap8[r1 + 36] = Int8(r2);
  r0 = Int64(heapClassInst.heap32[(r0 + 48)]);
  r0 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r0 + 1)]);
  if (r2 == 31)
  {
    r2 = Int64(heapClassInst.heap32[(fp + 3)]);
    r3 = r1 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0 + 17)]);
    heapClassInst.heap32[(r3 + 10)] = Int32(r0);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0 + 1)] = Int32(r4);
    heapClassInst.heap32[(g0 + 2)] = Int32(r2);
    _ZN28btCompoundCollisionAlgorithm26preallocateChildAlgorithmsEP17btCollisionObjectS1_(i7);
    commonVariable.r_g0 = r1;
    return;
  }
  else {
    r0 = _E2_str99;
    r1 = _E2_str1100;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = 32;
    _assert(i7);
  }
}

func _ZN28btCompoundCollisionAlgorithm17SwappedCreateFuncD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVN28btCompoundCollisionAlgorithm17SwappedCreateFuncE;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN28btCompoundCollisionAlgorithm17SwappedCreateFuncD0Ev(sp: Int64) : Unit
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
  r1 = _ZTVN28btCompoundCollisionAlgorithm17SwappedCreateFuncE;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN28btCompoundCollisionAlgorithm17SwappedCreateFunc24CreateCollisionAlgorithmER36btCollisionAlgorithmConstructionInfoP17btCollisionObjectS4_(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-16);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 12)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = 44;
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r1 = commonVariable.r_g0;
  r2 = _ZTV20btCollisionAlgorithm;
  r3 = r1 >> 2;
  r2 = (r2 + 8) | 0;
  heapClassInst.heap32[(r3)] = Int32(r2);
  r2 = Int64(heapClassInst.heap32[(r0)]);
  r4 = _ZTV28btCompoundCollisionAlgorithm;
  r4 = (r4 + 8) | 0;
  heapClassInst.heap32[(r3 + 1)] = Int32(r2);
  r2 = 1;
  heapClassInst.heap32[(r3)] = Int32(r4);
  heapClassInst.heap8[r1 + 24] = Int8(r2);
  heapClassInst.heap32[(r3 + 5)] = 0;
  heapClassInst.heap32[(r3 + 3)] = 0;
  heapClassInst.heap32[(r3 + 4)] = 0;
  heapClassInst.heap8[r1 + 28] = Int8(r2);
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r2 = Int64(heapClassInst.heap32[(fp + 3)]);
  r4 = 0;
  heapClassInst.heap32[(r3 + 8)] = Int32(r0);
  r0 = r2 >> 2;
  heapClassInst.heap8[r1 + 36] = Int8(r4);
  r0 = Int64(heapClassInst.heap32[(r0 + 48)]);
  r0 = r0 >> 2;
  r3 = Int64(heapClassInst.heap32[(r0 + 1)]);
  if (r3 == 31)
  {
    r3 = Int64(heapClassInst.heap32[(fp + 2)]);
    r4 = r1 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0 + 17)]);
    heapClassInst.heap32[(r4 + 10)] = Int32(r0);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    heapClassInst.heap32[(g0 + 2)] = Int32(r2);
    _ZN28btCompoundCollisionAlgorithm26preallocateChildAlgorithmsEP17btCollisionObjectS1_(i7);
    commonVariable.r_g0 = r1;
    return;
  }
  else {
    r0 = _E2_str99;
    r1 = _E2_str1100;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = 32;
    _assert(i7);
  }
}

func _ZN16btEmptyAlgorithm10CreateFuncD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVN16btEmptyAlgorithm10CreateFuncE;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN16btEmptyAlgorithm10CreateFuncD0Ev(sp: Int64) : Unit
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
  r1 = _ZTVN16btEmptyAlgorithm10CreateFuncE;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN16btEmptyAlgorithm10CreateFunc24CreateCollisionAlgorithmER36btCollisionAlgorithmConstructionInfoP17btCollisionObjectS4_(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 12)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = 8;
  r1 = _ZTV20btCollisionAlgorithm;
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r3 = commonVariable.r_g0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r3)] = Int32(r1);
  r0 = Int64(heapClassInst.heap32[(r0)]);
  r1 = _ZTV16btEmptyAlgorithm;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r3 + 1)] = Int32(r0);
  heapClassInst.heap32[(r3)] = Int32(r1);
  return;
}

func _ZN32btSphereSphereCollisionAlgorithm10CreateFuncD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVN32btSphereSphereCollisionAlgorithm10CreateFuncE;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN32btSphereSphereCollisionAlgorithm10CreateFuncD0Ev(sp: Int64) : Unit
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
  r1 = _ZTVN32btSphereSphereCollisionAlgorithm10CreateFuncE;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN32btSphereSphereCollisionAlgorithm10CreateFunc24CreateCollisionAlgorithmER36btCollisionAlgorithmConstructionInfoP17btCollisionObjectS4_(sp: Int64) : Unit
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
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 12)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = 16;
  r1 = _ZTV20btCollisionAlgorithm;
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = commonVariable.r_g0;
  r3 = r2 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r3)] = Int32(r1);
  r0 = Int64(heapClassInst.heap32[(r0)]);
  r1 = _ZTV32btSphereSphereCollisionAlgorithm;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r3 + 1)] = Int32(r0);
  r4 = 0;
  heapClassInst.heap32[(r3)] = Int32(r1);
  heapClassInst.heap8[r2 + 8] = Int8(r4);
  r1 = r0 >> 2;
  heapClassInst.heap32[(r3 + 3)] = 0;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 3)]);
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  r5 = Int64(heapClassInst.heap32[(fp + 3)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r4);
  heapClassInst.heap32[(g0 + 2)] = Int32(r5);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r1 = 1;
  heapClassInst.heap32[(r3 + 3)] = Int32(commonVariable.r_g0);
  heapClassInst.heap8[r2 + 8] = Int8(r1);
  commonVariable.r_g0 = r2;
  return;
}

func _ZN34btSphereTriangleCollisionAlgorithm10CreateFuncD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVN34btSphereTriangleCollisionAlgorithm10CreateFuncE;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN34btSphereTriangleCollisionAlgorithm10CreateFuncD0Ev(sp: Int64) : Unit
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
  r1 = _ZTVN34btSphereTriangleCollisionAlgorithm10CreateFuncE;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN34btSphereTriangleCollisionAlgorithm10CreateFunc24CreateCollisionAlgorithmER36btCollisionAlgorithmConstructionInfoP17btCollisionObjectS4_(sp: Int64) : Unit
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
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 12)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = 20;
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r1 = commonVariable.r_g0;
  r2 = Int64(heapClassInst.heap32[(fp)]);
  r3 = _ZTV20btCollisionAlgorithm;
  r4 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r2 = Int64(heapClassInst.heapU8[r2 + 4]);
  r5 = r1 >> 2;
  r3 = (r3 + 8) | 0;
  heapClassInst.heap32[(r5)] = Int32(r3);
  r0 = Int64(heapClassInst.heap32[(r0)]);
  r3 = _ZTV34btSphereTriangleCollisionAlgorithm;
  r3 = (r3 + 8) | 0;
  heapClassInst.heap32[(r5 + 1)] = Int32(r0);
  r6 = 0;
  heapClassInst.heap32[(r5)] = Int32(r3);
  heapClassInst.heap8[r1 + 8] = Int8(r6);
  heapClassInst.heap32[(r5 + 3)] = Int32(r4);
  heapClassInst.heap8[r1 + 16] = Int8(r2);
  if (!(r4 != 0))
  {
    r2 = Int64(heapClassInst.heap32[(fp + 2)]);
    r3 = Int64(heapClassInst.heap32[(fp + 3)]);
    r4 = r0 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4 + 3)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
    heapClassInst.heap32[(g0 + 2)] = Int32(r3);
    r0 = r1 >> 2;
    __FUNCTION_TABLE__[(r4) >> 2](i7);
    r3 = 1;
    heapClassInst.heap32[(r0 + 3)] = Int32(commonVariable.r_g0);
    heapClassInst.heap8[r1 + 8] = Int8(r3);
  }
  commonVariable.r_g0 = r1;
  return;
}

func _ZN26btBoxBoxCollisionAlgorithm10CreateFuncD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVN26btBoxBoxCollisionAlgorithm10CreateFuncE;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN26btBoxBoxCollisionAlgorithm10CreateFuncD0Ev(sp: Int64) : Unit
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
  r1 = _ZTVN26btBoxBoxCollisionAlgorithm10CreateFuncE;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN26btBoxBoxCollisionAlgorithm10CreateFunc24CreateCollisionAlgorithmER36btCollisionAlgorithmConstructionInfoP17btCollisionObjectS4_(sp: Int64) : Unit
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
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 12)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = 16;
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r1 = commonVariable.r_g0;
  r2 = _ZTV20btCollisionAlgorithm;
  r3 = r1 >> 2;
  r2 = (r2 + 8) | 0;
  heapClassInst.heap32[(r3)] = Int32(r2);
  r0 = Int64(heapClassInst.heap32[(r0)]);
  r2 = _ZTV26btBoxBoxCollisionAlgorithm;
  r2 = (r2 + 8) | 0;
  heapClassInst.heap32[(r3 + 1)] = Int32(r0);
  r4 = 0;
  heapClassInst.heap32[(r3)] = Int32(r2);
  heapClassInst.heap8[r1 + 8] = Int8(r4);
  r2 = r0 >> 2;
  heapClassInst.heap32[(r3 + 3)] = 0;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 6)]);
  r3 = Int64(heapClassInst.heap32[(fp + 2)]);
  r4 = Int64(heapClassInst.heap32[(fp + 3)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
  heapClassInst.heap32[(g0 + 2)] = Int32(r4);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r0 = commonVariable.r_g0;
  if (!(r0 == 0))
  {
    r0 = r1 >> 2;
    r2 = Int64(heapClassInst.heap32[(r0 + 1)]);
    r5 = r2 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5)]);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5 + 3)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    heapClassInst.heap32[(g0 + 2)] = Int32(r4);
    __FUNCTION_TABLE__[(r5) >> 2](i7);
    r3 = 1;
    heapClassInst.heap32[(r0 + 3)] = Int32(commonVariable.r_g0);
    heapClassInst.heap8[r1 + 8] = Int8(r3);
  }
  commonVariable.r_g0 = r1;
  return;
}

func _ZN31btDefaultCollisionConfiguration31getCollisionAlgorithmCreateFuncEii(sp: Int64) : Unit
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
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  if (r0 != 8)
  {
    __label__ = 3;
  }
  else {
    if (r2 != 8)
    {
      __label__ = 3;
    }
    else {
      r0 = (r1 + 64) | 0;
      __label__ = 30;
    }
  }
  do {
    if (__label__ == 3) {
      if (!(r0 != 8))
      {
        if (!(r2 != 1))
        {
          r0 = (r1 + 72) | 0;
          break
        }
      }
      if (!(r0 != 1))
      {
        if (!(r2 != 8))
        {
          r0 = (r1 + 76) | 0;
          break
        }
      }
      r3 = r2 | r0;
      if (r3 != 0)
      {
        if (!(r0 > 19))
        {
          if (!(r2 != 28))
          {
            r0 = (r1 + 84) | 0;
            break
          }
        }
        if (!(r2 > 19))
        {
          if (!(r0 != 28))
          {
            r0 = (r1 + 80) | 0;
            break
          }
        }
        do {
          if (r0 > 19)
          {
            if (r2 < 20)
            {
              r3 = (r0 + (-21)) | 0;
              if (`UIntNative`(r3) < `UIntNative`(9))
              {
                r0 = (r1 + 48) | 0;
                break
              }
            }
            if (r0 == 31)
            {
              r0 = (r1 + 52) | 0;
              break
            }
            else {
              break
            }
          }
          else {
            if (r2 > 19)
            {
              r0 = (r2 + (-21)) | 0;
              if (`UIntNative`(r0) < `UIntNative`(9))
              {
                r0 = (r1 + 44) | 0;
                break
              }
            }
            else {
              r0 = (r1 + 40) | 0;
              break
            }
          }
        } while (false);
        if (r2 != 31)
        {
          r0 = (r1 + 60) | 0;
        }
        else {
          r0 = (r1 + 56) | 0;
        }
      }
      else {
        r0 = (r1 + 68) | 0;
      }
    }
  } while (false);
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0)]);
  commonVariable.r_g0 = r0;
  return;
}

func _ZN31btDefaultCollisionConfigurationD0Ev(sp: Int64) : Unit
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
  r1 = _ZTV31btDefaultCollisionConfiguration;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r1 = Int64(heapClassInst.heapU8[r0 + 12]);
  do {
    if (!(r1 == 0))
    {
      r1 = Int64(heapClassInst.heap32[(r2 + 2)]);
      r3 = r1 >> 2;
      r4 = Int64(heapClassInst.heap32[(r3 + 2)]);
      if (r4 == 0)
      {
        r1 = Int64(heapClassInst.heapU8[r1 + 16]);
        if (!(r1 != 0))
        {
          r1 = Int64(heapClassInst.heap32[(r3)]);
          if (!(r1 == 0))
          {
            r4 = gNumAlignedFree;
            r4 = r4 >> 2;
            r5 = Int64(heapClassInst.heap32[(r4)]);
            r5 = (r5 + 1) | 0;
            r1 = r1 >> 2;
            heapClassInst.heap32[(r4)] = Int32(r5);
            r1 = Int64(heapClassInst.heap32[(r1 + (-1))]);
            heapClassInst.heap32[(g0)] = Int32(r1);
            free(i7);
          }
        }
        heapClassInst.heap32[(r3)] = 0;
        heapClassInst.heap32[(r3 + 2)] = 0;
        r1 = Int64(heapClassInst.heap32[(r2 + 2)]);
        r3 = r1 >> 2;
        r4 = Int64(heapClassInst.heap32[(r3 + 2)]);
        if (r4 == 0)
        {
          r1 = Int64(heapClassInst.heapU8[r1 + 16]);
          if (!(r1 != 0))
          {
            r1 = Int64(heapClassInst.heap32[(r3)]);
            if (!(r1 == 0))
            {
              r4 = gNumAlignedFree;
              r4 = r4 >> 2;
              r5 = Int64(heapClassInst.heap32[(r4)]);
              r5 = (r5 + 1) | 0;
              r1 = r1 >> 2;
              heapClassInst.heap32[(r4)] = Int32(r5);
              r1 = Int64(heapClassInst.heap32[(r1 + (-1))]);
              heapClassInst.heap32[(g0)] = Int32(r1);
              free(i7);
            }
          }
          heapClassInst.heap32[(r3)] = 0;
          heapClassInst.heap32[(r3 + 2)] = 0;
          r1 = Int64(heapClassInst.heap32[(r2 + 2)]);
          if (r1 == 0)
          {
            break
          }
          else {
            r3 = gNumAlignedFree;
            r3 = r3 >> 2;
            r4 = Int64(heapClassInst.heap32[(r3)]);
            r4 = (r4 + 1) | 0;
            r1 = r1 >> 2;
            heapClassInst.heap32[(r3)] = Int32(r4);
            r1 = Int64(heapClassInst.heap32[(r1 + (-1))]);
            heapClassInst.heap32[(g0)] = Int32(r1);
            free(i7);
            break
          }
        }
      }
      r0 = _E2_str128;
      r1 = _E2_str1129;
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      heapClassInst.heap32[(g0 + 2)] = 49;
      _assert(i7);
    }
  } while (false);
  r1 = Int64(heapClassInst.heapU8[r0 + 28]);
  if (!(r1 == 0))
  {
    r1 = Int64(heapClassInst.heap32[(r2 + 6)]);
    r3 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3 + 4)]);
    if (r3 != 0)
    {
      r1 = gNumAlignedFree;
      r1 = r1 >> 2;
      r4 = Int64(heapClassInst.heap32[(r1)]);
      r4 = (r4 + 1) | 0;
      r3 = r3 >> 2;
      heapClassInst.heap32[(r1)] = Int32(r4);
      r1 = Int64(heapClassInst.heap32[(r3 + (-1))]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      free(i7);
      r1 = Int64(heapClassInst.heap32[(r2 + 6)]);
    }
    if (!(r1 == 0))
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
  }
  r1 = Int64(heapClassInst.heapU8[r0 + 20]);
  if (!(r1 == 0))
  {
    r1 = Int64(heapClassInst.heap32[(r2 + 4)]);
    r3 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3 + 4)]);
    if (r3 != 0)
    {
      r1 = gNumAlignedFree;
      r1 = r1 >> 2;
      r4 = Int64(heapClassInst.heap32[(r1)]);
      r4 = (r4 + 1) | 0;
      r3 = r3 >> 2;
      heapClassInst.heap32[(r1)] = Int32(r4);
      r1 = Int64(heapClassInst.heap32[(r3 + (-1))]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      free(i7);
      r1 = Int64(heapClassInst.heap32[(r2 + 4)]);
    }
    if (!(r1 == 0))
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
  }
  r1 = Int64(heapClassInst.heap32[(r2 + 10)]);
  r3 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r2 + 10)]);
  if (!(r1 == 0))
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
  r1 = Int64(heapClassInst.heap32[(r2 + 11)]);
  r3 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r2 + 11)]);
  if (!(r1 == 0))
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
  r1 = Int64(heapClassInst.heap32[(r2 + 12)]);
  r3 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r2 + 12)]);
  if (!(r1 == 0))
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
  r1 = Int64(heapClassInst.heap32[(r2 + 13)]);
  r3 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r2 + 13)]);
  if (!(r1 == 0))
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
  r1 = Int64(heapClassInst.heap32[(r2 + 14)]);
  r3 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r2 + 14)]);
  if (!(r1 == 0))
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
  r1 = Int64(heapClassInst.heap32[(r2 + 15)]);
  r3 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r2 + 15)]);
  if (!(r1 == 0))
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
  r1 = Int64(heapClassInst.heap32[(r2 + 16)]);
  r3 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r2 + 16)]);
  if (!(r1 == 0))
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
  r1 = Int64(heapClassInst.heap32[(r2 + 18)]);
  r3 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r2 + 18)]);
  if (!(r1 == 0))
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
  r1 = Int64(heapClassInst.heap32[(r2 + 19)]);
  r3 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r2 + 19)]);
  if (!(r1 == 0))
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
  r1 = Int64(heapClassInst.heap32[(r2 + 17)]);
  r3 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r2 + 17)]);
  if (!(r1 == 0))
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
  r1 = Int64(heapClassInst.heap32[(r2 + 21)]);
  r3 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r2 + 21)]);
  if (!(r1 == 0))
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
  r1 = Int64(heapClassInst.heap32[(r2 + 20)]);
  r3 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r2 + 20)]);
  if (!(r1 == 0))
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
  r1 = Int64(heapClassInst.heap32[(r2 + 8)]);
  if (!(r1 == 0))
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
  r1 = Int64(heapClassInst.heap32[(r2 + 9)]);
  r3 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r2 + 9)]);
  if (!(r1 == 0))
  {
    r2 = gNumAlignedFree;
    r2 = r2 >> 2;
    r3 = Int64(heapClassInst.heap32[(r2)]);
    r3 = (r3 + 1) | 0;
    r1 = r1 >> 2;
    heapClassInst.heap32[(r2)] = Int32(r3);
    r1 = Int64(heapClassInst.heap32[(r1 + (-1))]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    free(i7);
  }
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN31btDefaultCollisionConfigurationD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZN31btDefaultCollisionConfigurationD2Ev(i7);
  return;
}

func _ZN31btDefaultCollisionConfigurationD2Ev(sp: Int64) : Unit
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
  r1 = _ZTV31btDefaultCollisionConfiguration;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r1 = Int64(heapClassInst.heapU8[r0 + 12]);
  do {
    if (!(r1 == 0))
    {
      r1 = Int64(heapClassInst.heap32[(r2 + 2)]);
      r3 = r1 >> 2;
      r4 = Int64(heapClassInst.heap32[(r3 + 2)]);
      if (r4 == 0)
      {
        r1 = Int64(heapClassInst.heapU8[r1 + 16]);
        if (!(r1 != 0))
        {
          r1 = Int64(heapClassInst.heap32[(r3)]);
          if (!(r1 == 0))
          {
            r4 = gNumAlignedFree;
            r4 = r4 >> 2;
            r5 = Int64(heapClassInst.heap32[(r4)]);
            r5 = (r5 + 1) | 0;
            r1 = r1 >> 2;
            heapClassInst.heap32[(r4)] = Int32(r5);
            r1 = Int64(heapClassInst.heap32[(r1 + (-1))]);
            heapClassInst.heap32[(g0)] = Int32(r1);
            free(i7);
          }
        }
        heapClassInst.heap32[(r3)] = 0;
        heapClassInst.heap32[(r3 + 2)] = 0;
        r1 = Int64(heapClassInst.heap32[(r2 + 2)]);
        r3 = r1 >> 2;
        r4 = Int64(heapClassInst.heap32[(r3 + 2)]);
        if (r4 == 0)
        {
          r1 = Int64(heapClassInst.heapU8[r1 + 16]);
          if (!(r1 != 0))
          {
            r1 = Int64(heapClassInst.heap32[(r3)]);
            if (!(r1 == 0))
            {
              r4 = gNumAlignedFree;
              r4 = r4 >> 2;
              r5 = Int64(heapClassInst.heap32[(r4)]);
              r5 = (r5 + 1) | 0;
              r1 = r1 >> 2;
              heapClassInst.heap32[(r4)] = Int32(r5);
              r1 = Int64(heapClassInst.heap32[(r1 + (-1))]);
              heapClassInst.heap32[(g0)] = Int32(r1);
              free(i7);
            }
          }
          heapClassInst.heap32[(r3)] = 0;
          heapClassInst.heap32[(r3 + 2)] = 0;
          r1 = Int64(heapClassInst.heap32[(r2 + 2)]);
          if (r1 == 0)
          {
            break
          }
          else {
            r3 = gNumAlignedFree;
            r3 = r3 >> 2;
            r4 = Int64(heapClassInst.heap32[(r3)]);
            r4 = (r4 + 1) | 0;
            r1 = r1 >> 2;
            heapClassInst.heap32[(r3)] = Int32(r4);
            r1 = Int64(heapClassInst.heap32[(r1 + (-1))]);
            heapClassInst.heap32[(g0)] = Int32(r1);
            free(i7);
            break
          }
        }
      }
      r0 = _E2_str128;
      r1 = _E2_str1129;
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      heapClassInst.heap32[(g0 + 2)] = 49;
      _assert(i7);
    }
  } while (false);
  r1 = Int64(heapClassInst.heapU8[r0 + 28]);
  if (!(r1 == 0))
  {
    r1 = Int64(heapClassInst.heap32[(r2 + 6)]);
    r3 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3 + 4)]);
    if (r3 != 0)
    {
      r1 = gNumAlignedFree;
      r1 = r1 >> 2;
      r4 = Int64(heapClassInst.heap32[(r1)]);
      r4 = (r4 + 1) | 0;
      r3 = r3 >> 2;
      heapClassInst.heap32[(r1)] = Int32(r4);
      r1 = Int64(heapClassInst.heap32[(r3 + (-1))]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      free(i7);
      r1 = Int64(heapClassInst.heap32[(r2 + 6)]);
    }
    if (!(r1 == 0))
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
  }
  r0 = Int64(heapClassInst.heapU8[r0 + 20]);
  if (!(r0 == 0))
  {
    r0 = Int64(heapClassInst.heap32[(r2 + 4)]);
    r1 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1 + 4)]);
    if (r1 != 0)
    {
      r0 = gNumAlignedFree;
      r0 = r0 >> 2;
      r3 = Int64(heapClassInst.heap32[(r0)]);
      r3 = (r3 + 1) | 0;
      r1 = r1 >> 2;
      heapClassInst.heap32[(r0)] = Int32(r3);
      r0 = Int64(heapClassInst.heap32[(r1 + (-1))]);
      heapClassInst.heap32[(g0)] = Int32(r0);
      free(i7);
      r0 = Int64(heapClassInst.heap32[(r2 + 4)]);
    }
    if (!(r0 == 0))
    {
      r1 = gNumAlignedFree;
      r1 = r1 >> 2;
      r3 = Int64(heapClassInst.heap32[(r1)]);
      r3 = (r3 + 1) | 0;
      r0 = r0 >> 2;
      heapClassInst.heap32[(r1)] = Int32(r3);
      r0 = Int64(heapClassInst.heap32[(r0 + (-1))]);
      heapClassInst.heap32[(g0)] = Int32(r0);
      free(i7);
    }
  }
  r0 = Int64(heapClassInst.heap32[(r2 + 10)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = Int64(heapClassInst.heap32[(r2 + 10)]);
  if (!(r0 == 0))
  {
    r1 = gNumAlignedFree;
    r1 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = (r3 + 1) | 0;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r3);
    r0 = Int64(heapClassInst.heap32[(r0 + (-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
  }
  r0 = Int64(heapClassInst.heap32[(r2 + 11)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = Int64(heapClassInst.heap32[(r2 + 11)]);
  if (!(r0 == 0))
  {
    r1 = gNumAlignedFree;
    r1 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = (r3 + 1) | 0;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r3);
    r0 = Int64(heapClassInst.heap32[(r0 + (-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
  }
  r0 = Int64(heapClassInst.heap32[(r2 + 12)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = Int64(heapClassInst.heap32[(r2 + 12)]);
  if (!(r0 == 0))
  {
    r1 = gNumAlignedFree;
    r1 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = (r3 + 1) | 0;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r3);
    r0 = Int64(heapClassInst.heap32[(r0 + (-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
  }
  r0 = Int64(heapClassInst.heap32[(r2 + 13)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = Int64(heapClassInst.heap32[(r2 + 13)]);
  if (!(r0 == 0))
  {
    r1 = gNumAlignedFree;
    r1 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = (r3 + 1) | 0;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r3);
    r0 = Int64(heapClassInst.heap32[(r0 + (-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
  }
  r0 = Int64(heapClassInst.heap32[(r2 + 14)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = Int64(heapClassInst.heap32[(r2 + 14)]);
  if (!(r0 == 0))
  {
    r1 = gNumAlignedFree;
    r1 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = (r3 + 1) | 0;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r3);
    r0 = Int64(heapClassInst.heap32[(r0 + (-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
  }
  r0 = Int64(heapClassInst.heap32[(r2 + 15)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = Int64(heapClassInst.heap32[(r2 + 15)]);
  if (!(r0 == 0))
  {
    r1 = gNumAlignedFree;
    r1 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = (r3 + 1) | 0;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r3);
    r0 = Int64(heapClassInst.heap32[(r0 + (-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
  }
  r0 = Int64(heapClassInst.heap32[(r2 + 16)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = Int64(heapClassInst.heap32[(r2 + 16)]);
  if (!(r0 == 0))
  {
    r1 = gNumAlignedFree;
    r1 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = (r3 + 1) | 0;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r3);
    r0 = Int64(heapClassInst.heap32[(r0 + (-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
  }
  r0 = Int64(heapClassInst.heap32[(r2 + 18)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = Int64(heapClassInst.heap32[(r2 + 18)]);
  if (!(r0 == 0))
  {
    r1 = gNumAlignedFree;
    r1 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = (r3 + 1) | 0;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r3);
    r0 = Int64(heapClassInst.heap32[(r0 + (-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
  }
  r0 = Int64(heapClassInst.heap32[(r2 + 19)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = Int64(heapClassInst.heap32[(r2 + 19)]);
  if (!(r0 == 0))
  {
    r1 = gNumAlignedFree;
    r1 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = (r3 + 1) | 0;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r3);
    r0 = Int64(heapClassInst.heap32[(r0 + (-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
  }
  r0 = Int64(heapClassInst.heap32[(r2 + 17)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = Int64(heapClassInst.heap32[(r2 + 17)]);
  if (!(r0 == 0))
  {
    r1 = gNumAlignedFree;
    r1 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = (r3 + 1) | 0;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r3);
    r0 = Int64(heapClassInst.heap32[(r0 + (-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
  }
  r0 = Int64(heapClassInst.heap32[(r2 + 21)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = Int64(heapClassInst.heap32[(r2 + 21)]);
  if (!(r0 == 0))
  {
    r1 = gNumAlignedFree;
    r1 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = (r3 + 1) | 0;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r3);
    r0 = Int64(heapClassInst.heap32[(r0 + (-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
  }
  r0 = Int64(heapClassInst.heap32[(r2 + 20)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = Int64(heapClassInst.heap32[(r2 + 20)]);
  if (!(r0 == 0))
  {
    r1 = gNumAlignedFree;
    r1 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = (r3 + 1) | 0;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r3);
    r0 = Int64(heapClassInst.heap32[(r0 + (-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
  }
  r0 = Int64(heapClassInst.heap32[(r2 + 8)]);
  if (!(r0 == 0))
  {
    r1 = gNumAlignedFree;
    r1 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = (r3 + 1) | 0;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r3);
    r0 = Int64(heapClassInst.heap32[(r0 + (-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
  }
  r0 = Int64(heapClassInst.heap32[(r2 + 9)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = Int64(heapClassInst.heap32[(r2 + 9)]);
  if (!(r0 == 0))
  {
    r1 = gNumAlignedFree;
    r1 = r1 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1)]);
    r2 = (r2 + 1) | 0;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r1)] = Int32(r2);
    r0 = Int64(heapClassInst.heap32[(r0 + (-1))]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    free(i7);
  }
  return;
}

func _ZN16btEmptyAlgorithm22getAllContactManifoldsER20btAlignedObjectArrayIP20btPersistentManifoldE(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  return;
}

func _ZN16btEmptyAlgorithm16processCollisionEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResult(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  return;
}

func _ZN16btEmptyAlgorithm21calculateTimeOfImpactEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResult(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var f0: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  f0 = 1.0;
  commonVariable.f_g0 = f0;
  return;
}

func _ZN16btEmptyAlgorithmD0Ev(sp: Int64) : Unit
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
  r1 = _ZTV16btEmptyAlgorithm;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN16btEmptyAlgorithmD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV16btEmptyAlgorithm;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN16btManifoldResultD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV16btManifoldResult;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN16btManifoldResultD0Ev(sp: Int64) : Unit
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
  r1 = _ZTV16btManifoldResult;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN16btManifoldResult15addContactPointERK9btVector3S2_f(sp: Int64) : Unit
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
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 1)]);
  if (r1 != 0)
  {
    f0 = Float64(heapClassInst.heapFloat[(fp + 3)]);
    r2 = r1 >> 2;
    f1 = Float64(heapClassInst.heapFloat[(r2 + 280)]);
    if (!(f1 < f0))
    {
      r3 = Int64(heapClassInst.heap32[(fp + 1)]);
      r4 = Int64(heapClassInst.heap32[(fp + 2)]);
      r3 = r3 >> 2;
      r4 = r4 >> 2;
      f1 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
      heapClassInst.heapFloat[(fp + (-71))] = Float32(f1);
      f2 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
      f3 = Float64(heapClassInst.heapFloat[(r3)]);
      f4 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
      f1 = f1 * f0;
      f5 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
      f6 = f2 * f0;
      f7 = Float64(heapClassInst.heapFloat[(r4)]);
      f8 = f3 * f0;
      r5 = Int64(heapClassInst.heap32[(r2 + 277)]);
      r6 = Int64(heapClassInst.heap32[(r0 + 34)]);
      f1 = f4 + f1;
      f6 = f5 + f6;
      f8 = f7 + f8;
      if (r5 == r6)
      {
        f9 = Float64(heapClassInst.heapFloat[(r0 + 14)]);
        f10 = Float64(heapClassInst.heapFloat[(r0 + 15)]);
        f11 = Float64(heapClassInst.heapFloat[(r0 + 30)]);
        f13 = Float64(heapClassInst.heapFloat[(r0 + 31)]);
        f14 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
        f9 = f8 - f9;
        f15 = Float64(heapClassInst.heapFloat[(r0 + 3)]);
        f12 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
        f16 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
        f10 = f6 - f10;
        f17 = Float64(heapClassInst.heapFloat[(r0 + 7)]);
        f18 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
        f19 = Float64(heapClassInst.heapFloat[(r0 + 16)]);
        f20 = Float64(heapClassInst.heapFloat[(r0 + 20)]);
        f11 = f7 - f11;
        f21 = Float64(heapClassInst.heapFloat[(r0 + 19)]);
        f22 = Float64(heapClassInst.heapFloat[(r0 + 18)]);
        f23 = Float64(heapClassInst.heapFloat[(r0 + 24)]);
        f13 = f5 - f13;
        f24 = Float64(heapClassInst.heapFloat[(r0 + 23)]);
        f25 = Float64(heapClassInst.heapFloat[(r0 + 22)]);
        f26 = Float64(heapClassInst.heapFloat[(r0 + 32)]);
        f14 = f14 * f9;
        f16 = f16 * f10;
        f27 = Float64(heapClassInst.heapFloat[(r0 + 12)]);
        f19 = f1 - f19;
        f28 = Float64(heapClassInst.heapFloat[(r0 + 11)]);
        f29 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
        f15 = f15 * f9;
        f17 = f17 * f10;
        f9 = f12 * f9;
        f10 = f18 * f10;
        f12 = f20 * f11;
        f18 = f23 * f13;
        f20 = Float64(heapClassInst.heapFloat[(r0 + 28)]);
        f23 = f4 - f26;
        f26 = Float64(heapClassInst.heapFloat[(r0 + 27)]);
        f30 = Float64(heapClassInst.heapFloat[(r0 + 26)]);
        f21 = f21 * f11;
        f24 = f24 * f13;
        f11 = f22 * f11;
        f13 = f25 * f13;
        f14 = f14 + f16;
        f16 = f27 * f19;
        f15 = f15 + f17;
        f17 = f28 * f19;
        f9 = f9 + f10;
        f10 = f29 * f19;
        f12 = f12 + f18;
        f18 = f20 * f23;
        f19 = f21 + f24;
        f20 = f26 * f23;
        f11 = f11 + f13;
        f21 = f30 * f23;
        f13 = f14 + f16;
        f14 = f15 + f17;
        f9 = f9 + f10;
        f10 = f12 + f18;
        f15 = f19 + f20;
        f11 = f11 + f21;
      }
      else {
        f9 = Float64(heapClassInst.heapFloat[(r0 + 30)]);
        f10 = Float64(heapClassInst.heapFloat[(r0 + 31)]);
        f11 = Float64(heapClassInst.heapFloat[(r0 + 14)]);
        f12 = Float64(heapClassInst.heapFloat[(r0 + 15)]);
        f13 = Float64(heapClassInst.heapFloat[(r0 + 20)]);
        f9 = f8 - f9;
        f14 = Float64(heapClassInst.heapFloat[(r0 + 19)]);
        f15 = Float64(heapClassInst.heapFloat[(r0 + 18)]);
        f16 = Float64(heapClassInst.heapFloat[(r0 + 24)]);
        f10 = f6 - f10;
        f17 = Float64(heapClassInst.heapFloat[(r0 + 23)]);
        f18 = Float64(heapClassInst.heapFloat[(r0 + 22)]);
        f19 = Float64(heapClassInst.heapFloat[(r0 + 32)]);
        f20 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
        f11 = f7 - f11;
        f21 = Float64(heapClassInst.heapFloat[(r0 + 3)]);
        f22 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
        f23 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
        f12 = f5 - f12;
        f24 = Float64(heapClassInst.heapFloat[(r0 + 7)]);
        f25 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
        f26 = Float64(heapClassInst.heapFloat[(r0 + 16)]);
        f13 = f13 * f9;
        f16 = f16 * f10;
        f27 = Float64(heapClassInst.heapFloat[(r0 + 28)]);
        f19 = f1 - f19;
        f28 = Float64(heapClassInst.heapFloat[(r0 + 27)]);
        f29 = Float64(heapClassInst.heapFloat[(r0 + 26)]);
        f14 = f14 * f9;
        f17 = f17 * f10;
        f9 = f15 * f9;
        f10 = f18 * f10;
        f15 = f20 * f11;
        f18 = f23 * f12;
        f20 = Float64(heapClassInst.heapFloat[(r0 + 12)]);
        f23 = f4 - f26;
        f26 = Float64(heapClassInst.heapFloat[(r0 + 11)]);
        f30 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
        f21 = f21 * f11;
        f24 = f24 * f12;
        f11 = f22 * f11;
        f12 = f25 * f12;
        f13 = f13 + f16;
        f16 = f27 * f19;
        f14 = f14 + f17;
        f17 = f28 * f19;
        f9 = f9 + f10;
        f10 = f29 * f19;
        f15 = f15 + f18;
        f18 = f20 * f23;
        f19 = f21 + f24;
        f20 = f26 * f23;
        f11 = f11 + f12;
        f12 = f30 * f23;
        f13 = f13 + f16;
        f14 = f14 + f17;
        f9 = f9 + f10;
        f10 = f15 + f18;
        f15 = f19 + f20;
        f11 = f11 + f12;
      }
      r7 = sp + (-280);
      r8 = r7 >> 2;
      heapClassInst.heapFloat[(fp + (-70))] = Float32(f9);
      heapClassInst.heapFloat[(r8 + 1)] = Float32(f14);
      heapClassInst.heapFloat[(r8 + 2)] = Float32(f13);
      heapClassInst.heap32[(r8 + 3)] = 0;
      heapClassInst.heapFloat[(r8 + 4)] = Float32(f11);
      heapClassInst.heapFloat[(r8 + 5)] = Float32(f15);
      heapClassInst.heapFloat[(r8 + 6)] = Float32(f10);
      heapClassInst.heap32[(r8 + 7)] = 0;
      heapClassInst.heapFloat[(r8 + 16)] = Float32(f3);
      heapClassInst.heapFloat[(r8 + 17)] = Float32(f2);
      f2 = Float64(heapClassInst.heapFloat[(fp + (-71))]);
      heapClassInst.heapFloat[(r8 + 18)] = Float32(f2);
      heapClassInst.heap32[(r8 + 19)] = heapClassInst.heap32[(r3 + 3)];
      heapClassInst.heapFloat[(r8 + 20)] = Float32(f0);
      heapClassInst.heap32[(r8 + 21)] = 0;
      heapClassInst.heap32[(r8 + 22)] = 0;
      heapClassInst.heap32[(r8 + 27)] = 0;
      r3 = 0;
      heapClassInst.heap32[(r8 + 28)] = 0;
      heapClassInst.heap8[sp + (-164)] = Int8(r3);
      heapClassInst.heap32[(r8 + 30)] = 0;
      heapClassInst.heap32[(r8 + 31)] = 0;
      heapClassInst.heap32[(r8 + 32)] = 0;
      heapClassInst.heap32[(r8 + 33)] = 0;
      heapClassInst.heap32[(r8 + 34)] = 0;
      heapClassInst.heap32[(r8 + 35)] = 0;
      heapClassInst.heap32[(r8 + 36)] = 0;
      heapClassInst.heap32[(r8 + 52)] = 0;
      heapClassInst.heap32[(r8 + 60)] = 0;
      heapClassInst.heap32[(r8 + 68)] = 0;
      heapClassInst.heapFloat[(r8 + 12)] = Float32(f8);
      heapClassInst.heapFloat[(r8 + 13)] = Float32(f6);
      heapClassInst.heapFloat[(r8 + 14)] = Float32(f1);
      heapClassInst.heap32[(r8 + 15)] = 0;
      heapClassInst.heapFloat[(r8 + 8)] = Float32(f7);
      heapClassInst.heapFloat[(r8 + 9)] = Float32(f5);
      heapClassInst.heapFloat[(r8 + 10)] = Float32(f4);
      heapClassInst.heap32[(r8 + 11)] = heapClassInst.heap32[(r4 + 3)];
      r4 = Int64(heapClassInst.heap32[(r2 + 279)]);
      do {
        if (r4 > 0)
        {
          f1 = Float64(heapClassInst.heapFloat[(r2 + 280)]);
          f1 = f1 * f1;
          r10 = 0;
          r9 = ( -1);
          while (true) {
            r11 = (r10 * 69) | 0;
            r11 = r11 << 2;
            r11 = (r1 + r11) | 0;
            r11 = r11 >> 2;
            f2 = Float64(heapClassInst.heapFloat[(r11 + 1)]);
            f3 = Float64(heapClassInst.heapFloat[(r11 + 2)]);
            f2 = f2 - f9;
            f3 = f3 - f14;
            f4 = Float64(heapClassInst.heapFloat[(r11 + 3)]);
            f4 = f4 - f13;
            f2 = f2 * f2;
            f3 = f3 * f3;
            f2 = f2 + f3;
            f3 = f4 * f4;
            f2 = f2 + f3;
            r11 = (r10 + 1) | 0;
            r9 = if (f2 < f1) {r10} else {r9};
            f1 = if (f2 < f1) {f2} else {f1};
            r10 = r11;
            if (!(r4 != r11))
            {
              break
            }
          }
        }
        else {
          r9 = ( -1);
        }
      } while (false);
      r4 = Int64(heapClassInst.heap32[(r0 + 35)]);
      r4 = r4 >> 2;
      r10 = r6 >> 2;
      f1 = Float64(heapClassInst.heapFloat[(r10 + 56)]);
      f2 = Float64(heapClassInst.heapFloat[(r4 + 56)]);
      f1 = f1 * f2;
      f2 = -10.0;
      f1 = if (f1 < f2) {f2} else {f1};
      f2 = 10.0;
      f1 = if (f1 > f2) {f2} else {f1};
      heapClassInst.heapFloat[(r8 + 21)] = Float32(f1);
      f1 = Float64(heapClassInst.heapFloat[(r10 + 57)]);
      f2 = Float64(heapClassInst.heapFloat[(r4 + 57)]);
      f1 = f1 * f2;
      heapClassInst.heapFloat[(r8 + 22)] = Float32(f1);
      if (r5 == r6)
      {
        r4 = Int64(heapClassInst.heap32[(r0 + 36)]);
        heapClassInst.heap32[(r8 + 23)] = Int32(r4);
        r4 = Int64(heapClassInst.heap32[(r0 + 37)]);
        heapClassInst.heap32[(r8 + 24)] = Int32(r4);
        r4 = Int64(heapClassInst.heap32[(r0 + 38)]);
        heapClassInst.heap32[(r8 + 25)] = Int32(r4);
        r0 = Int64(heapClassInst.heap32[(r0 + 39)]);
        heapClassInst.heap32[(r8 + 26)] = Int32(r0);
      }
      else {
        r4 = Int64(heapClassInst.heap32[(r0 + 37)]);
        heapClassInst.heap32[(r8 + 23)] = Int32(r4);
        r4 = Int64(heapClassInst.heap32[(r0 + 36)]);
        heapClassInst.heap32[(r8 + 24)] = Int32(r4);
        r4 = Int64(heapClassInst.heap32[(r0 + 39)]);
        heapClassInst.heap32[(r8 + 25)] = Int32(r4);
        r0 = Int64(heapClassInst.heap32[(r0 + 38)]);
        heapClassInst.heap32[(r8 + 26)] = Int32(r0);
      }
      f1 = Float64(heapClassInst.heapFloat[(r2 + 280)]);
      if (r9 < 0)
      {
        if (f1 >= f0)
        {
          r0 = Int64(heapClassInst.heap32[(r2 + 279)]);
          if (r0 != 4)
          {
            r4 = (r0 + 1) | 0;
            heapClassInst.heap32[(r2 + 279)] = Int32(r4);
          }
          else {
            f1 = Float64(heapClassInst.heapFloat[(r2 + 21)]);
            r0 = ( -1);
            f2 = Float64(heapClassInst.heapFloat[(r2 + 90)]);
            f3 = if (f1 < f0) {f1} else {f0};
            r4 = 1;
            f4 = Float64(heapClassInst.heapFloat[(r2 + 159)]);
            f5 = if (f2 < f3) {f2} else {f3};
            r5 = 2;
            f6 = Float64(heapClassInst.heapFloat[(r2 + 228)]);
            f7 = if (f4 < f5) {f4} else {f5};
            if (f6 >= f7)
            {
              r6 = if (f1 >= f0) {r0} else {r3};
              r6 = if (f2 < f3) {r4} else {r6};
              r6 = if (f4 < f5) {r5} else {r6};
              if (r6 == 0)
              {
                f0 = Float64(heapClassInst.heapFloat[(r2 + 210)]);
                f1 = Float64(heapClassInst.heapFloat[(r2 + 141)]);
                f2 = Float64(heapClassInst.heapFloat[(r2 + 209)]);
                f3 = Float64(heapClassInst.heapFloat[(r2 + 140)]);
                f4 = Float64(heapClassInst.heapFloat[(r2 + 208)]);
                f5 = Float64(heapClassInst.heapFloat[(r2 + 139)]);
                f6 = Float64(heapClassInst.heapFloat[(r2 + 72)]);
                f7 = Float64(heapClassInst.heapFloat[(r2 + 71)]);
                f8 = Float64(heapClassInst.heapFloat[(r2 + 70)]);
                f10 = 0.0;
                r6 = r3;
                __label__ = 28;
              }
              else {
                __label__ = 26;
              }
            }
            else {
              r6 = 3;
              __label__ = 26;
            }
            if (__label__ == 26) {
              f6 = Float64(heapClassInst.heapFloat[(r2 + 72)]);
              f0 = Float64(heapClassInst.heapFloat[(r2 + 210)]);
              f1 = Float64(heapClassInst.heapFloat[(r2 + 141)]);
              f8 = Float64(heapClassInst.heapFloat[(r2 + 70)]);
              f2 = Float64(heapClassInst.heapFloat[(r2 + 209)]);
              f3 = Float64(heapClassInst.heapFloat[(r2 + 140)]);
              f7 = Float64(heapClassInst.heapFloat[(r2 + 71)]);
              f4 = Float64(heapClassInst.heapFloat[(r2 + 208)]);
              f5 = Float64(heapClassInst.heapFloat[(r2 + 139)]);
              f10 = f13 - f6;
              f11 = f2 - f3;
              f12 = f9 - f8;
              f15 = f0 - f1;
              f16 = f14 - f7;
              f17 = f4 - f5;
              f18 = f16 * f15;
              f19 = f10 * f11;
              f10 = f10 * f17;
              f15 = f12 * f15;
              f18 = f18 - f19;
              f10 = f10 - f15;
              f11 = f12 * f11;
              f12 = f16 * f17;
              f11 = f11 - f12;
              f12 = f18 * f18;
              f10 = f10 * f10;
              f10 = f12 + f10;
              f11 = f11 * f11;
              f10 = f10 + f11;
              if (r6 == 1)
              {
                f11 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
                f12 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
                f15 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
                f16 = 0.0
                r6 = r4;
                __label__ = 30
              }
              else {
                __label__ = 28
              }
            }
            if (__label__ == 28) {
              f11 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
              f15 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
              f12 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
              f16 = f13 - f11;
              f17 = f2 - f3;
              f18 = f9 - f15;
              f19 = f0 - f1;
              f20 = f14 - f12;
              f21 = f4 - f5;
              f22 = f20 * f19;
              f23 = f16 * f17;
              f16 = f16 * f21;
              f19 = f18 * f19;
              f22 = f22 - f23;
              f16 = f16 - f19;
              f17 = f18 * f17;
              f18 = f20 * f21;
              f17 = f17 - f18;
              f18 = f22 * f22;
              f16 = f16 * f16;
              f16 = f18 + f16;
              f17 = f17 * f17;
              f16 = f16 + f17;
              if (r6 == 2)
              {
                f0 = 0.0;
                __label__ = 32;
              }
              else {
                __label__ = 30;
              }
            }
            if (__label__ == 30) {
              f17 = f13 - f11;
              f2 = f2 - f7;
              f18 = f9 - f15;
              f0 = f0 - f6;
              f19 = f14 - f12;
              f4 = f4 - f8;
              f20 = f19 * f0;
              f21 = f17 * f2;
              f17 = f17 * f4;
              f0 = f18 * f0;
              f20 = f20 - f21;
              f0 = f17 - f0;
              f2 = f18 * f2;
              f4 = f19 * f4;
              f2 = f2 - f4;
              f4 = f20 * f20;
              f0 = f0 * f0;
              f0 = f4 + f0;
              f2 = f2 * f2;
              f0 = f0 + f2;
              if (r6 == 3)
              {
                f1 = 0.0;
                __label__ = 34;
              }
              else {
                __label__ = 32;
              }
            }
            if (__label__ == 32) {
              f2 = f13 - f11;
              f3 = f3 - f7;
              f4 = f9 - f15;
              f1 = f1 - f6;
              f6 = f14 - f12;
              f5 = f5 - f8;
              f7 = f6 * f1;
              f8 = f2 * f3;
              f2 = f2 * f5;
              f1 = f4 * f1;
              f7 = f7 - f8;
              f1 = f2 - f1;
              f2 = f4 * f3;
              f3 = f6 * f5;
              f2 = f2 - f3;
              f3 = f7 * f7;
              f1 = f1 * f1;
              f1 = f3 + f1;
              f2 = f2 * f2;
              f1 = f1 + f2;
              f2 = 0.0;
              if (f1 < f2)
              {
                f1 = -f1;
              }
            }
            f2 = 0.0;
            if (f0 < f2)
            {
              f0 = -f0;
            }
            if (f16 < f2)
            {
              f16 = -f16;
            }
            if (f10 < f2)
            {
              f10 = -f10;
            }
            f2 = ( -999999984306749440.0);
            r2 = 0;
            f3 = if (f10 > f2) {f10} else {f2};
            r0 = if (f10 <= f2) {r0} else {r2};
            f2 = if (f16 > f3) {f16} else {f3};
            r0 = if (f16 > f3) {r4} else {r0};
            f3 = if (f0 > f2) {f0} else {f2};
            r2 = 3;
            r0 = if (f0 > f2) {r5} else {r0};
            r0 = if (f1 > f3) {r2} else {r0};
          }
          r0 = if (r0 < 0) {r3} else {r0};
          r0 = (r0 * 276) | 0;
          r0 = (r1 + r0) | 0;
          r1 = r0 >> 2;
          r1 = Int64(heapClassInst.heap32[(r1 + 28)]);
          if (r1 == 0)
          {
            r0 = (r0 + 4) | 0;
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r7);
            heapClassInst.heap32[(g0 + 2)] = 276;
            memcpy(i7);
          }
          else {
            r0 = _E2_str4438;
            r7 = _E2_str3437;
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r7);
            heapClassInst.heap32[(g0 + 2)] = 190;
            _assert(i7);
          }
        }
        else {
          r1 = _E2_str2149;
          r2 = _E2_str3437;
          heapClassInst.heap32[(g0)] = Int32(r1);
          heapClassInst.heap32[(g0 + 1)] = Int32(r2);
          heapClassInst.heap32[(g0 + 2)] = 168;
          _assert(i7);
        }
      }
      else {
        if (f1 >= f0)
        {
          r2 = (r9 * 276) | 0;
          r1 = (r1 + r2) | 0;
          r2 = r1 >> 2;
          r3 = Int64(heapClassInst.heap32[(r2 + 37)]);
          if (r3 > ( -1))
          {
            f0 = Float64(heapClassInst.heapFloat[(r2 + 53)]);
            f1 = Float64(heapClassInst.heapFloat[(r2 + 61)]);
            f9 = Float64(heapClassInst.heapFloat[(r2 + 69)]);
            r0 = Int64(heapClassInst.heap32[(r2 + 28)]);
            r1 = (r1 + 4) | 0;
            heapClassInst.heap32[(g0)] = Int32(r1);
            heapClassInst.heap32[(g0 + 1)] = Int32(r7);
            heapClassInst.heap32[(g0 + 2)] = 276;
            memcpy(i7);
            heapClassInst.heap32[(r2 + 28)] = Int32(r0);
            heapClassInst.heapFloat[(r2 + 29)] = Float32(f0);
            heapClassInst.heapFloat[(r2 + 31)] = Float32(f1);
            heapClassInst.heapFloat[(r2 + 32)] = Float32(f9);
            heapClassInst.heapFloat[(r2 + 53)] = Float32(f0);
            heapClassInst.heapFloat[(r2 + 61)] = Float32(f1);
            heapClassInst.heapFloat[(r2 + 69)] = Float32(f9);
            heapClassInst.heap32[(r2 + 37)] = Int32(r3);
            return;
          }
          else {
            r1 = _E2_str3150;
            r2 = _E2_str483;
            heapClassInst.heap32[(g0)] = Int32(r1);
            heapClassInst.heap32[(g0 + 1)] = Int32(r2);
            heapClassInst.heap32[(g0 + 2)] = 177;
            _assert(i7);
          }
        }
        else {
          r1 = _E2_str2149;
          r2 = _E2_str483;
          heapClassInst.heap32[(g0)] = Int32(r1);
          heapClassInst.heap32[(g0 + 1)] = Int32(r2);
          heapClassInst.heap32[(g0 + 2)] = 165;
          _assert(i7);
        }
      }
    }
    return;
  }
  else {
    r0 = _E2_str59;
    r1 = _E2_str5152;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = 64;
    _assert(i7);
  }
}

func _ZN25btSimulationIslandManager26storeIslandActivationStateEP16btCollisionWorld(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 2)]);
  if (!(r1 < 1))
  {
    r1 = Int64(heapClassInst.heap32[(fp)]);
    r2 = 0;
    r3 = r2;
    while (true) {
      r4 = Int64(heapClassInst.heap32[(r0 + 4)]);
      r5 = r2 << 2;
      r4 = (r4 + r5) | 0;
      r4 = r4 >> 2;
      r4 = Int64(heapClassInst.heap32[(r4)]);
      r5 = (r2 + 1) | 0;
      r6 = Int64(heapClassInst.heapU8[r4 + 204]);
      r6 = r6 & 3;
      if (r6 != 0)
      {
        r2 = r4 >> 2;
        heapClassInst.heap32[(r2 + 52)] = ( -1);
        heapClassInst.heap32[(r2 + 53)] = ( -2);
      }
      else {
        r6 = r1 >> 2;
        r7 = Int64(heapClassInst.heap32[(r6 + 4)]);
        r8 = r3 << 3;
        r9 = (r7 + r8) | 0;
        r9 = r9 >> 2;
        r9 = Int64(heapClassInst.heap32[(r9)]);
        if (r9 == r3)
        {
          r10 = r3;
        }
        else {
          r10 = r3;
          while (true) {
            r9 = r9 << 3;
            r10 = r10 << 3;
            r9 = (r7 + r9) | 0;
            r7 = (r7 + r10) | 0;
            r9 = r9 >> 2;
            r7 = r7 >> 2;
            r10 = Int64(heapClassInst.heap32[(r9)]);
            heapClassInst.heap32[(r7)] = Int32(r10);
            r10 = Int64(heapClassInst.heap32[(r9)]);
            r7 = Int64(heapClassInst.heap32[(r6 + 4)]);
            r9 = r10 << 3;
            r9 = (r7 + r9) | 0;
            r9 = r9 >> 2;
            r9 = Int64(heapClassInst.heap32[(r9)]);
            if (!(r9 != r10))
            {
              break
            }
          }
        }
        r4 = r4 >> 2;
        heapClassInst.heap32[(r4 + 52)] = Int32(r10);
        r6 = Int64(heapClassInst.heap32[(r6 + 4)]);
        r6 = (r6 + r8) | 0;
        r6 = r6 >> 2;
        r3 = (r3 + 1) | 0;
        heapClassInst.heap32[(r6 + 1)] = Int32(r2);
        heapClassInst.heap32[(r4 + 53)] = ( -1);
      }
      r4 = Int64(heapClassInst.heap32[(r0 + 2)]);
      r2 = r5;
      if (r4 > r5)
      {
        continue
      }
      else {
        break
      }
    }
  }
  return;
}

func _ZN20btAlignedObjectArrayIP20btPersistentManifoldE17quickSortInternalI33btPersistentManifoldSortPredicateEEvT_ii(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-16);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = (r0 + r1) | 0;
  r3 = r2 >> 31;
  r4 = Int64(heapClassInst.heap32[(fp)]);
  r2 = (r2 + r3) | 0;
  r3 = r4 >> 2;
  r2 = r2 & 2147483646;
  r5 = Int64(heapClassInst.heap32[(r3 + 3)]);
  r2 = r2 << 1;
  r2 = (r5 + r2) | 0;
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r5 = r1;
  r6 = r0;
  while (true) {
    r7 = r2 >> 2;
    r8 = Int64(heapClassInst.heap32[(r7 + 277)]);
    r8 = r8 >> 2;
    r9 = Int64(heapClassInst.heap32[(r3 + 3)]);
    r8 = Int64(heapClassInst.heap32[(r8 + 52)]);
    while (true) {
      r10 = r5 << 2;
      r10 = (r9 + r10) | 0;
      r10 = r10 >> 2;
      r11 = Int64(heapClassInst.heap32[(r10)]);
      r12 = r11 >> 2;
      r13 = Int64(heapClassInst.heap32[(r12 + 277)]);
      r13 = r13 >> 2;
      r13 = Int64(heapClassInst.heap32[(r13 + 52)]);
      if (r13 < 0)
      {
        r13 = Int64(heapClassInst.heap32[(r12 + 278)]);
        r13 = r13 >> 2;
        r13 = Int64(heapClassInst.heap32[(r13 + 52)]);
      }
      if (r8 < 0)
      {
        r12 = Int64(heapClassInst.heap32[(r7 + 278)]);
        r12 = r12 >> 2;
        r12 = Int64(heapClassInst.heap32[(r12 + 52)]);
      }
      else {
        r12 = r8;
      }
      if (r13 < r12)
      {
        r5 = (r5 + 1) | 0;
        continue
      }
      else {
        break
      }
    }
    while (true) {
      r12 = r6 << 2;
      r13 = (r9 + r12) | 0;
      r13 = r13 >> 2;
      r13 = Int64(heapClassInst.heap32[(r13)]);
      if (r8 < 0)
      {
        r14 = Int64(heapClassInst.heap32[(r7 + 278)]);
        r14 = r14 >> 2;
        r14 = Int64(heapClassInst.heap32[(r14 + 52)]);
      }
      else {
        r14 = r8;
      }
      r15 = r13 >> 2;
      r16 = Int64(heapClassInst.heap32[(r15 + 277)]);
      r16 = r16 >> 2;
      r16 = Int64(heapClassInst.heap32[(r16 + 52)]);
      if (r16 < 0)
      {
        r16 = Int64(heapClassInst.heap32[(r15 + 278)]);
        r16 = r16 >> 2;
        r16 = Int64(heapClassInst.heap32[(r16 + 52)]);
      }
      if (r14 < r16)
      {
        r6 = (r6 + (-1)) | 0;
        continue
      }
      else {
        break
      }
    }
    if (r5 <= r6)
    {
      heapClassInst.heap32[(r10)] = Int32(r13);
      r7 = Int64(heapClassInst.heap32[(r3 + 3)]);
      r7 = (r7 + r12) | 0;
      r5 = (r5 + 1) | 0;
      r6 = (r6 + (-1)) | 0;
      r7 = r7 >> 2;
      heapClassInst.heap32[(r7)] = Int32(r11);
    }
    if (r5 <= r6)
    {
      continue
    }
    else {
      break
    }
  }
  if (!(r6 <= r1))
  {
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = Int32(r6);
    _ZN20btAlignedObjectArrayIP20btPersistentManifoldE17quickSortInternalI33btPersistentManifoldSortPredicateEEvT_ii(i7);
  }
  if (!(r5 >= r0))
  {
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0 + 1)] = Int32(r5);
    heapClassInst.heap32[(g0 + 2)] = Int32(r0);
    _ZN20btAlignedObjectArrayIP20btPersistentManifoldE17quickSortInternalI33btPersistentManifoldSortPredicateEEvT_ii(i7);
  }
  return;
}

func _ZN25btSimulationIslandManager21updateActivationStateEP16btCollisionWorldP12btDispatcher(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r0 + 2)]);
  do {
    if (r2 > 0)
    {
      r3 = 0;
      r2 = r3;
      while (true) {
        r4 = Int64(heapClassInst.heap32[(r0 + 4)]);
        r5 = r3 << 2;
        r4 = (r4 + r5) | 0;
        r4 = r4 >> 2;
        r4 = Int64(heapClassInst.heap32[(r4)]);
        r3 = (r3 + 1) | 0;
        r5 = Int64(heapClassInst.heapU8[r4 + 204]);
        r5 = r5 & 3;
        if (r5 == 0)
        {
          r5 = (r2 + 1) | 0;
          r6 = r4 >> 2;
          heapClassInst.heap32[(r6 + 52)] = Int32(r2);
          r2 = r5;
        }
        r4 = r4 >> 2;
        heapClassInst.heap32[(r4 + 53)] = ( -1);
        heapClassInst.heap32[(r4 + 60)] = 1065353216;
        r4 = Int64(heapClassInst.heap32[(r0 + 2)]);
        if (r4 > r3)
        {
          continue
        }
        else {
          break
        }
      }
    }
    else {
      r2 = 0;
    }
  } while (false);
  r3 = r1 >> 2;
  r4 = Int64(heapClassInst.heap32[(r3 + 2)]);
  do {
    if (!(r4 > r2))
    {
      if (!(r4 >= r2))
      {
        r5 = Int64(heapClassInst.heap32[(r3 + 3)]);
        if (!(r5 >= r2))
        {
          if (r2 != 0)
          {
            r5 = gNumAlignedAllocs;
            r5 = r5 >> 2;
            r6 = Int64(heapClassInst.heap32[(r5)]);
            r7 = r2 << 3;
            r6 = (r6 + 1) | 0;
            r7 = r7 | 3;
            heapClassInst.heap32[(r5)] = Int32(r6);
            r5 = (r7 + 16) | 0;
            heapClassInst.heap32[(g0)] = Int32(r5);
            mallocNew(i7);
            r5 = commonVariable.r_g0;
            if (r5 != 0)
            {
              r6 = 0;
              r7 = (r5 + 4) | 0;
              r6 = (r6 - r7) | 0;
              r6 = r6 & 15;
              r6 = (r5 + r6) | 0;
              r7 = (r6 + 4) | 0;
              r6 = r6 >> 2;
              heapClassInst.heap32[(r6)] = Int32(r5);
              r5 = r7;
            }
          }
          else {
            r5 = 0;
          }
          r6 = (r1 + 16) | 0;
          if (r4 < 1)
          {
            r7 = r6 >> 2;
            r8 = Int64(heapClassInst.heap32[(r7)]);
          }
          else {
            r7 = 0;
            while (true) {
              r8 = r6 >> 2;
              r8 = Int64(heapClassInst.heap32[(r8)]);
              r9 = r7 << 3;
              r10 = (r8 + r9) | 0;
              r10 = r10 >> 2;
              r9 = (r5 + r9) | 0;
              r11 = Int64(heapClassInst.heap32[(r10 + 1)]);
              r10 = Int64(heapClassInst.heap32[(r10)]);
              r9 = r9 >> 2;
              r7 = (r7 + 1) | 0;
              heapClassInst.heap32[(r9)] = Int32(r10);
              heapClassInst.heap32[(r9 + 1)] = Int32(r11);
              if (!(r4 != r7))
              {
                break
              }
            }
            r6 = (r1 + 16) | 0;
          }
          if (!(r8 == 0))
          {
            r7 = Int64(heapClassInst.heapU8[r1 + 20]);
            if (!(r7 == 0))
            {
              r7 = gNumAlignedFree;
              r7 = r7 >> 2;
              r9 = Int64(heapClassInst.heap32[(r7)]);
              r9 = (r9 + 1) | 0;
              r8 = r8 >> 2;
              heapClassInst.heap32[(r7)] = Int32(r9);
              r7 = Int64(heapClassInst.heap32[(r8 + (-1))]);
              heapClassInst.heap32[(g0)] = Int32(r7);
              free(i7);
            }
            r7 = r6 >> 2;
            heapClassInst.heap32[(r7)] = 0;
          }
          r7 = 1;
          r6 = r6 >> 2;
          heapClassInst.heap8[r1 + 20] = Int8(r7);
          heapClassInst.heap32[(r6)] = Int32(r5);
          heapClassInst.heap32[(r3 + 3)] = Int32(r2);
          if (r4 >= r2)
          {
            break
          }
        }
        while (true) {
          r1 = r4 << 3;
          r5 = Int64(heapClassInst.heap32[(r3 + 4)]);
          r1 = (r5 + r1) | 0;
          r1 = r1 >> 2;
          r4 = (r4 + 1) | 0;
          heapClassInst.heap32[(r1)] = 0;
          heapClassInst.heap32[(r1 + 1)] = 0;
          if (r2 != r4)
          {
            continue
          }
          else {
            break
          }
        }
      }
    }
  } while (false);
  heapClassInst.heap32[(r3 + 2)] = Int32(r2);
  do {
    if (!(r2 < 1))
    {
      r1 = 0;
      while (true) {
        r4 = r1 << 3;
        r5 = Int64(heapClassInst.heap32[(r3 + 4)]);
        r5 = (r5 + r4) | 0;
        r5 = r5 >> 2;
        heapClassInst.heap32[(r5)] = Int32(r1);
        r5 = Int64(heapClassInst.heap32[(r3 + 4)]);
        r4 = (r5 + r4) | 0;
        r1 = (r1 + 1) | 0;
        r4 = r4 >> 2;
        heapClassInst.heap32[(r4 + 1)] = 1;
        if (r2 != r1)
        {
          continue
        }
        else {
          break
        }
      }
    }
  } while (false);
  r0 = Int64(heapClassInst.heap32[(r0 + 20)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 9)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = commonVariable.r_g0;
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 9)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = commonVariable.r_g0;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 5)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = commonVariable.r_g0;
  do {
    if (!(r2 < 1))
    {
      r0 = (r0 + 4) | 0;
      while (true) {
        r1 = r0 >> 2;
        r4 = Int64(heapClassInst.heap32[(r1 + (-1))]);
        r4 = r4 >> 2;
        r4 = Int64(heapClassInst.heap32[(r4)]);
        if (!(r4 == 0))
        {
          r1 = Int64(heapClassInst.heap32[(r1)]);
          r1 = r1 >> 2;
          r1 = Int64(heapClassInst.heap32[(r1)]);
          if (!(r1 == 0))
          {
            r4 = r4 >> 2;
            r5 = Int64(heapClassInst.heap32[(r4 + 51)]);
            r5 = r5 & 7;
            if (!(r5 != 0))
            {
              r5 = Int64(heapClassInst.heapU8[r1 + 204]);
              r5 = r5 & 7;
              if (!(r5 != 0))
              {
                r4 = Int64(heapClassInst.heap32[(r4 + 52)]);
                r5 = Int64(heapClassInst.heap32[(r3 + 4)]);
                r6 = r4 << 3;
                r6 = (r5 + r6) | 0;
                r6 = r6 >> 2;
                r1 = r1 >> 2;
                r6 = Int64(heapClassInst.heap32[(r6)]);
                r1 = Int64(heapClassInst.heap32[(r1 + 52)]);
                if (!(r6 == r4))
                {
                  while (true) {
                    r6 = r6 << 3;
                    r4 = r4 << 3;
                    r6 = (r5 + r6) | 0;
                    r4 = (r5 + r4) | 0;
                    r5 = r6 >> 2;
                    r4 = r4 >> 2;
                    r6 = Int64(heapClassInst.heap32[(r5)]);
                    heapClassInst.heap32[(r4)] = Int32(r6);
                    r4 = Int64(heapClassInst.heap32[(r5)]);
                    r5 = Int64(heapClassInst.heap32[(r3 + 4)]);
                    r6 = r4 << 3;
                    r6 = (r5 + r6) | 0;
                    r6 = r6 >> 2;
                    r6 = Int64(heapClassInst.heap32[(r6)]);
                    if (!(r6 != r4))
                    {
                      break
                    }
                  }
                }
                r6 = r1 << 3;
                r6 = (r5 + r6) | 0;
                r6 = r6 >> 2;
                r6 = Int64(heapClassInst.heap32[(r6)]);
                do {
                  if (!(r6 == r1))
                  {
                    while (true) {
                      r6 = r6 << 3;
                      r1 = r1 << 3;
                      r6 = (r5 + r6) | 0;
                      r1 = (r5 + r1) | 0;
                      r5 = r6 >> 2;
                      r1 = r1 >> 2;
                      r6 = Int64(heapClassInst.heap32[(r5)]);
                      heapClassInst.heap32[(r1)] = Int32(r6);
                      r1 = Int64(heapClassInst.heap32[(r5)]);
                      r5 = Int64(heapClassInst.heap32[(r3 + 4)]);
                      r6 = r1 << 3;
                      r6 = (r5 + r6) | 0;
                      r6 = r6 >> 2;
                      r6 = Int64(heapClassInst.heap32[(r6)]);
                      if (!(r6 != r1))
                      {
                        break
                      }
                    }
                  }
                } while (false);
                if (!(r4 == r1))
                {
                  r4 = r4 << 3;
                  r5 = (r5 + r4) | 0;
                  r5 = r5 >> 2;
                  heapClassInst.heap32[(r5)] = Int32(r1);
                  r5 = Int64(heapClassInst.heap32[(r3 + 4)]);
                  r1 = r1 << 3;
                  r1 = (r5 + r1) | 0;
                  r4 = (r5 + r4) | 0;
                  r1 = r1 >> 2;
                  r4 = r4 >> 2;
                  r5 = Int64(heapClassInst.heap32[(r1 + 1)]);
                  r4 = Int64(heapClassInst.heap32[(r4 + 1)]);
                  r4 = (r4 + r5) | 0;
                  heapClassInst.heap32[(r1 + 1)] = Int32(r4);
                }
              }
            }
          }
        }
        r2 = (r2 + (-1)) | 0;
        r0 = (r0 + 16) | 0;
        if (r2 != 0)
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

func _ZN25btSimulationIslandManagerD0Ev(sp: Int64) : Unit
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
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV25btSimulationIslandManager;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r1 = Int64(heapClassInst.heap32[(r2 + 14)]);
  if (!(r1 == 0))
  {
    r3 = Int64(heapClassInst.heapU8[r0 + 60]);
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
    heapClassInst.heap32[(r2 + 14)] = 0;
  }
  r1 = 1;
  heapClassInst.heap8[r0 + 60] = Int8(r1);
  heapClassInst.heap32[(r2 + 14)] = 0;
  heapClassInst.heap32[(r2 + 12)] = 0;
  heapClassInst.heap32[(r2 + 13)] = 0;
  r3 = Int64(heapClassInst.heap32[(r2 + 9)]);
  if (!(r3 == 0))
  {
    r4 = Int64(heapClassInst.heapU8[r0 + 40]);
    if (!(r4 == 0))
    {
      r4 = gNumAlignedFree;
      r4 = r4 >> 2;
      r5 = Int64(heapClassInst.heap32[(r4)]);
      r5 = (r5 + 1) | 0;
      r3 = r3 >> 2;
      heapClassInst.heap32[(r4)] = Int32(r5);
      r3 = Int64(heapClassInst.heap32[(r3 + (-1))]);
      heapClassInst.heap32[(g0)] = Int32(r3);
      free(i7);
    }
    heapClassInst.heap32[(r2 + 9)] = 0;
  }
  heapClassInst.heap8[r0 + 40] = Int8(r1);
  heapClassInst.heap32[(r2 + 9)] = 0;
  heapClassInst.heap32[(r2 + 7)] = 0;
  heapClassInst.heap32[(r2 + 8)] = 0;
  r3 = Int64(heapClassInst.heap32[(r2 + 4)]);
  if (!(r3 == 0))
  {
    r4 = Int64(heapClassInst.heapU8[r0 + 20]);
    if (!(r4 == 0))
    {
      r4 = gNumAlignedFree;
      r4 = r4 >> 2;
      r5 = Int64(heapClassInst.heap32[(r4)]);
      r5 = (r5 + 1) | 0;
      r3 = r3 >> 2;
      heapClassInst.heap32[(r4)] = Int32(r5);
      r3 = Int64(heapClassInst.heap32[(r3 + (-1))]);
      heapClassInst.heap32[(g0)] = Int32(r3);
      free(i7);
    }
    heapClassInst.heap32[(r2 + 4)] = 0;
  }
  heapClassInst.heap8[r0 + 20] = Int8(r1);
  heapClassInst.heap32[(r2 + 4)] = 0;
  heapClassInst.heap32[(r2 + 2)] = 0;
  heapClassInst.heap32[(r2 + 3)] = 0;
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN25btSimulationIslandManagerD1Ev(sp: Int64) : Unit
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
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV25btSimulationIslandManager;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r1 = Int64(heapClassInst.heap32[(r2 + 14)]);
  if (!(r1 == 0))
  {
    r3 = Int64(heapClassInst.heapU8[r0 + 60]);
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
    heapClassInst.heap32[(r2 + 14)] = 0;
  }
  r1 = 1;
  heapClassInst.heap8[r0 + 60] = Int8(r1);
  heapClassInst.heap32[(r2 + 14)] = 0;
  heapClassInst.heap32[(r2 + 12)] = 0;
  heapClassInst.heap32[(r2 + 13)] = 0;
  r3 = Int64(heapClassInst.heap32[(r2 + 9)]);
  if (!(r3 == 0))
  {
    r4 = Int64(heapClassInst.heapU8[r0 + 40]);
    if (!(r4 == 0))
    {
      r4 = gNumAlignedFree;
      r4 = r4 >> 2;
      r5 = Int64(heapClassInst.heap32[(r4)]);
      r5 = (r5 + 1) | 0;
      r3 = r3 >> 2;
      heapClassInst.heap32[(r4)] = Int32(r5);
      r3 = Int64(heapClassInst.heap32[(r3 + (-1))]);
      heapClassInst.heap32[(g0)] = Int32(r3);
      free(i7);
    }
    heapClassInst.heap32[(r2 + 9)] = 0;
  }
  heapClassInst.heap8[r0 + 40] = Int8(r1);
  heapClassInst.heap32[(r2 + 9)] = 0;
  heapClassInst.heap32[(r2 + 7)] = 0;
  heapClassInst.heap32[(r2 + 8)] = 0;
  r3 = Int64(heapClassInst.heap32[(r2 + 4)]);
  if (!(r3 == 0))
  {
    r4 = Int64(heapClassInst.heapU8[r0 + 20]);
    if (!(r4 == 0))
    {
      r4 = gNumAlignedFree;
      r4 = r4 >> 2;
      r5 = Int64(heapClassInst.heap32[(r4)]);
      r5 = (r5 + 1) | 0;
      r3 = r3 >> 2;
      heapClassInst.heap32[(r4)] = Int32(r5);
      r3 = Int64(heapClassInst.heap32[(r3 + (-1))]);
      heapClassInst.heap32[(g0)] = Int32(r3);
      free(i7);
    }
    heapClassInst.heap32[(r2 + 4)] = 0;
  }
  heapClassInst.heap8[r0 + 20] = Int8(r1);
  heapClassInst.heap32[(r2 + 4)] = 0;
  heapClassInst.heap32[(r2 + 2)] = 0;
  heapClassInst.heap32[(r2 + 3)] = 0;
  return;
}

func _ZN32btSphereSphereCollisionAlgorithm21calculateTimeOfImpactEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResult(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var f0: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + 0;
  var g0 = i7 >> 2;
  f0 = 1.0;
  commonVariable.f_g0 = f0;
  return;
}

func _ZN32btSphereSphereCollisionAlgorithm22getAllContactManifoldsER20btAlignedObjectArrayIP20btPersistentManifoldE(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-8);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1 + 3)]);
  if (!(r2 == 0))
  {
    r0 = Int64(heapClassInst.heapU8[r0 + 8]);
    if (!(r0 == 0))
    {
      r0 = Int64(heapClassInst.heap32[(fp + 1)]);
      r3 = r0 >> 2;
      r4 = Int64(heapClassInst.heap32[(r3 + 2)]);
      r5 = Int64(heapClassInst.heap32[(r3 + 1)]);
      if (r4 == r5)
      {
        r6 = 1;
        r7 = r5 << 1;
        r7 = if (r5 == 0) {r6}  else {r7}
        if (!(r4 >= r7))
        {
          if (r7 != 0)
          {
            r2 = gNumAlignedAllocs;
            r2 = r2 >> 2;
            r4 = Int64(heapClassInst.heap32[(r2)]);
            r8 = r7 << 2;
            r4 = (r4 + 1) | 0;
            r8 = r8 | 3;
            heapClassInst.heap32[(r2)] = Int32(r4);
            r2 = (r8 + 16) | 0;
            heapClassInst.heap32[(g0)] = Int32(r2);
            mallocNew(i7);
            r2 = commonVariable.r_g0;
            if (r2 != 0)
            {
              r4 = 0;
              r8 = (r2 + 4) | 0;
              r4 = (r4 - r8) | 0;
              r4 = r4 & 15;
              r4 = (r2 + r4) | 0;
              r8 = (r4 + 4) | 0;
              r4 = r4 >> 2;
              heapClassInst.heap32[(r4)] = Int32(r2);
              r2 = r8;
            }
          }
          else {
            r2 = 0;
          }
          r4 = (r0 + 12) | 0;
          if (r5 < 1)
          {
            r8 = r4 >> 2;
            r9 = Int64(heapClassInst.heap32[(r8)]);
          }
          else {
            r8 = 0;
            while (true) {
              r9 = r4 >> 2;
              r9 = Int64(heapClassInst.heap32[(r9)]);
              r10 = r8 << 2;
              r11 = (r9 + r10) | 0;
              r11 = r11 >> 2;
              r10 = (r2 + r10) | 0;
              r11 = Int64(heapClassInst.heap32[(r11)]);
              r8 = (r8 + 1) | 0;
              r10 = r10 >> 2;
              heapClassInst.heap32[(r10)] = Int32(r11);
              if (!(r5 != r8))
              {
                break
              }
            }
            r4 = (r0 + 12) | 0;
          }
          if (r9 != 0)
          {
            r8 = Int64(heapClassInst.heapU8[r0 + 16]);
            if (r8 != 0)
            {
              r5 = gNumAlignedFree;
              r5 = r5 >> 2;
              r8 = Int64(heapClassInst.heap32[(r5)]);
              r8 = (r8 + 1) | 0;
              r9 = r9 >> 2;
              heapClassInst.heap32[(r5)] = Int32(r8);
              r5 = Int64(heapClassInst.heap32[(r9 + (-1))]);
              heapClassInst.heap32[(g0)] = Int32(r5);
              free(i7);
              r5 = Int64(heapClassInst.heap32[(r3 + 1)]);
            }
            r8 = r4 >> 2;
            heapClassInst.heap32[(r8)] = 0;
          }
          r4 = r4 >> 2;
          heapClassInst.heap8[r0 + 16] = Int8(r6);
          heapClassInst.heap32[(r4)] = Int32(r2);
          heapClassInst.heap32[(r3 + 2)] = Int32(r7);
          r2 = Int64(heapClassInst.heap32[(r1 + 3)]);
        }
      }
      r0 = r5 << 2;
      r1 = Int64(heapClassInst.heap32[(r3 + 3)]);
      r0 = (r1 + r0) | 0;
      r0 = r0 >> 2;
      heapClassInst.heap32[(r0)] = Int32(r2);
      r0 = Int64(heapClassInst.heap32[(r3 + 1)]);
      r0 = (r0 + 1) | 0;
      heapClassInst.heap32[(r3 + 1)] = Int32(r0);
    }
  }
  return;
}

func _ZN32btSphereSphereCollisionAlgorithm16processCollisionEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResult(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-48);
  var g0 = i7 >> 2;
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 3)]);
  do {
    if (!(r0 == 0))
    {
      r1 = Int64(heapClassInst.heap32[(fp + 1)]);
      r2 = Int64(heapClassInst.heap32[(fp + 2)]);
      r3 = Int64(heapClassInst.heap32[(fp + 4)]);
      r4 = r3 >> 2;
      r1 = r1 >> 2;
      heapClassInst.heap32[(r4 + 1)] = Int32(r0);
      r0 = r2 >> 2;
      f0 = Float64(heapClassInst.heapFloat[(r1 + 14)]);
      f1 = Float64(heapClassInst.heapFloat[(r0 + 14)]);
      f2 = Float64(heapClassInst.heapFloat[(r1 + 13)]);
      f3 = Float64(heapClassInst.heapFloat[(r0 + 13)]);
      f0 = f0 - f1;
      f1 = f2 - f3;
      f2 = Float64(heapClassInst.heapFloat[(r1 + 15)]);
      f3 = Float64(heapClassInst.heapFloat[(r0 + 15)]);
      f2 = f2 - f3;
      r1 = Int64(heapClassInst.heap32[(r1 + 48)]);
      r2 = Int64(heapClassInst.heap32[(r0 + 48)]);
      f3 = f1 * f1;
      f4 = f0 * f0;
      f3 = f3 + f4;
      f4 = f2 * f2;
      f3 = f3 + f4;
      heapClassInst.heapFloat[(g0)] = Float32(f3);
      sqrtf(i7);
      f3 = commonVariable.f_g0;
      r1 = r1 >> 2;
      r2 = r2 >> 2;
      f4 = Float64(heapClassInst.heapFloat[(r1 + 7)]);
      f5 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
      f6 = Float64(heapClassInst.heapFloat[(r2 + 7)]);
      f7 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
      f6 = f6 * f7;
      f4 = f4 * f5;
      f4 = f4 + f6;
      do {
        if (f4 >= f3)
        {
          r1 = sp + (-16);
          r2 = r1 >> 2;
          heapClassInst.heap32[(fp + (-4))] = 1065353216;
          heapClassInst.heap32[(r2 + 1)] = 0;
          f4 = f3 - f4;
          heapClassInst.heap32[(r2 + 2)] = 0;
          heapClassInst.heap32[(r2 + 3)] = 0;
          f5 = 1.1920928955078125e-007;
          if (f3 > f5)
          {
            f5 = 1.0
            f3 = f5 / f3;
            f1 = f1 * f3;
            f0 = f0 * f3;
            heapClassInst.heapFloat[(fp + (-4))] = Float32(f1);
            f2 = f2 * f3;
            heapClassInst.heapFloat[(r2 + 1)] = Float32(f0);
            heapClassInst.heapFloat[(r2 + 2)] = Float32(f2);
            heapClassInst.heap32[(r2 + 3)] = 0;
          }
          else {
            f1 = 1.0
            f0 = 0.0
            f2 = f0;
          }
          f1 = f1 * f6;
          f3 = Float64(heapClassInst.heapFloat[(r0 + 13)]);
          f5 = Float64(heapClassInst.heapFloat[(r0 + 15)]);
          f7 = Float64(heapClassInst.heapFloat[(r0 + 14)]);
          r0 = sp + (-32);
          f0 = f0 * f6;
          f1 = f3 + f1;
          f2 = f2 * f6;
          r2 = r0 >> 2;
          f0 = f7 + f0;
          heapClassInst.heapFloat[(fp + (-8))] = Float32(f1);
          f1 = f5 + f2;
          heapClassInst.heapFloat[(r2 + 1)] = Float32(f0);
          heapClassInst.heapFloat[(r2 + 2)] = Float32(f1);
          heapClassInst.heap32[(r2 + 3)] = 0;
          r2 = Int64(heapClassInst.heap32[(r4)]);
          r2 = r2 >> 2;
          r2 = Int64(heapClassInst.heap32[(r2 + 4)]);
          heapClassInst.heap32[(g0)] = Int32(r3);
          heapClassInst.heap32[(g0 + 1)] = Int32(r1);
          heapClassInst.heap32[(g0 + 2)] = Int32(r0);
          heapClassInst.heapFloat[(g0 + 3)] = Float32(f4);
          __FUNCTION_TABLE__[(r2) >> 2](i7);
          r0 = Int64(heapClassInst.heap32[(r4 + 1)]);
          if (r0 != 0)
          {
            r1 = r0 >> 2;
            r2 = Int64(heapClassInst.heap32[(r1 + 279)]);
            if (r2 == 0)
            {
              break
            }
            else {
              r1 = Int64(heapClassInst.heap32[(r1 + 277)]);
              r2 = Int64(heapClassInst.heap32[(r4 + 34)]);
              if (r1 == r2)
              {
                r1 = (r3 + 8) | 0;
                r2 = (r3 + 72) | 0;
                heapClassInst.heap32[(g0)] = Int32(r0);
                heapClassInst.heap32[(g0 + 1)] = Int32(r1);
                heapClassInst.heap32[(g0 + 2)] = Int32(r2);
                _ZN20btPersistentManifold20refreshContactPointsERK11btTransformS2_(i7);
                return;
              }
              else {
                r1 = (r3 + 72) | 0;
                r3 = (r3 + 8) | 0;
                heapClassInst.heap32[(g0)] = Int32(r0);
                heapClassInst.heap32[(g0 + 1)] = Int32(r1);
                __label__ = 8;
                break
              }
            }
          }
          else {
            __label__ = 3;
          }
        }
        else {
          r0 = Int64(heapClassInst.heap32[(r4 + 1)]);
          if (r0 != 0)
          {
            r1 = r0 >> 2;
            r2 = Int64(heapClassInst.heap32[(r1 + 279)]);
            if (r2 == 0)
            {
              break
            }
            else {
              r1 = Int64(heapClassInst.heap32[(r1 + 277)]);
              r4 = Int64(heapClassInst.heap32[(r4 + 34)]);
              if (r1 == r4)
              {
                r4 = (r3 + 8) | 0;
                r3 = (r3 + 72) | 0;
              }
              else {
                r4 = (r3 + 72) | 0;
                r3 = (r3 + 8) | 0;
              }
              heapClassInst.heap32[(g0)] = Int32(r0);
              heapClassInst.heap32[(g0 + 1)] = Int32(r4);
              __label__ = 8;
            }
          }
          else {
            __label__ = 3;
          }
        }
      } while (false);
      match (__label__) {
        case 8  =>
          heapClassInst.heap32[(g0 + 2)] = Int32(r3);
          _ZN20btPersistentManifold20refreshContactPointsERK11btTransformS2_(i7);
          return;
        case 3  =>
          r0 = _E2_str59;
          r3 = _E2_str160;
          heapClassInst.heap32[(g0)] = Int32(r0);
          heapClassInst.heap32[(g0 + 1)] = Int32(r3);
          heapClassInst.heap32[(g0 + 2)] = 101;
          _assert(i7);
        case _ =>
          println("break 10091")
      }
    }
  } while (false);
  return;
}

func _ZN32btSphereSphereCollisionAlgorithmD0Ev(sp: Int64)
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
  r1 = _ZTV32btSphereSphereCollisionAlgorithm;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r1 = Int64(heapClassInst.heapU8[r0 + 8]);
  if (!(r1 == 0)) 
  {
    r1 = Int64(heapClassInst.heap32[(r2 + 3)]);
    if (!(r1 == 0)) 
    {
      r3 = Int64(heapClassInst.heap32[(r2 + 1)]);
      r4 = r3 >> 2;
      r4 = Int64(heapClassInst.heap32[(r4)]);
      r4 = r4 >> 2;
      r4 = Int64(heapClassInst.heap32[(r4 + 4)]);
      heapClassInst.heap32[(g0)] = Int32(r3);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      __FUNCTION_TABLE__[(r4) >> 2](i7);
    }
  }
  r1 = _ZTV30btActivatingCollisionAlgorithm;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN32btSphereSphereCollisionAlgorithmD1Ev(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV32btSphereSphereCollisionAlgorithm;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r0 = Int64(heapClassInst.heapU8[r0 + 8]);
  if (!(r0 == 0)) 
  {
    r0 = Int64(heapClassInst.heap32[(r2 + 3)]);
    if (!(r0 == 0)) 
    {
      r1 = Int64(heapClassInst.heap32[(r2 + 1)]);
      r3 = r1 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3)]);
      r3 = r3 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3 + 4)]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      heapClassInst.heap32[(g0 + 1)] = Int32(r0);
      __FUNCTION_TABLE__[(r3) >> 2](i7);
    }
  }
  r0 = _ZTV30btActivatingCollisionAlgorithm;
  r0 = (r0 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r0);
  return;
}

func _ZN34btSphereTriangleCollisionAlgorithm21calculateTimeOfImpactEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResult(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var f0: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  f0 = 1.0;
  commonVariable.f_g0 = f0;
  return;
}

func _ZN34btSphereTriangleCollisionAlgorithm22getAllContactManifoldsER20btAlignedObjectArrayIP20btPersistentManifoldE(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1 + 3)]);
  if (!(r2 == 0)) 
  {
    r0 = Int64(heapClassInst.heapU8[r0 + 8]);
    if (!(r0 == 0)) 
    {
      r0 = Int64(heapClassInst.heap32[(fp + 1)]);
      r3 = r0 >> 2;
      r4 = Int64(heapClassInst.heap32[(r3 + 2)]);
      r5 = Int64(heapClassInst.heap32[(r3 + 1)]);
      if (r4 == r5) 
      {
        r6 = 1;
        r7 = r5 << 1;
        r7 = if (r5 == 0) {r6}  else {r7}
        if (!(r4 >= r7)) 
        {
          if (r7 != 0) 
          {
            r2 = gNumAlignedAllocs;
            r2 = r2 >> 2;
            r4 = Int64(heapClassInst.heap32[(r2)]);
            r8 = r7 << 2;
            r4 = (r4 + 1) | 0;
            r8 = r8 | 3;
            heapClassInst.heap32[(r2)] = Int32(r4);
            r2 = (r8 + 16) | 0;
            heapClassInst.heap32[(g0)] = Int32(r2);
            mallocNew(i7);
            r2 = commonVariable.r_g0;
            if (r2 != 0) 
            {
              r4 = 0;
              r8 = (r2 + 4) | 0;
              r4 = (r4 - r8) | 0;
              r4 = r4 & 15;
              r4 = (r2 + r4) | 0;
              r8 = (r4 + 4) | 0;
              r4 = r4 >> 2;
              heapClassInst.heap32[(r4)] = Int32(r2);
              r2 = r8;
            }
          }
          else {
            r2 = 0;
          }
          r4 = (r0 + 12) | 0;
          if (r5 < 1) 
          {
            r8 = r4 >> 2;
            r9 = Int64(heapClassInst.heap32[(r8)]);
          }
          else {
            r8 = 0;
            /*repeat_15: */
            while (true) {
              r9 = r4 >> 2;
              r9 = Int64(heapClassInst.heap32[(r9)]);
              r10 = r8 << 2;
              r11 = (r9 + r10) | 0;
              r11 = r11 >> 2;
              r10 = (r2 + r10) | 0;
              r11 = Int64(heapClassInst.heap32[(r11)]);
              r8 = (r8 + 1) | 0;
              r10 = r10 >> 2;
              heapClassInst.heap32[(r10)] = Int32(r11);
              if (!(r5 != r8)) 
              {
                break //repeat_15;
              }
            }
            r4 = (r0 + 12) | 0;
          }
          if (r9 != 0) 
          {
            r8 = Int64(heapClassInst.heapU8[r0 + 16]);
            if (r8 != 0) 
            {
              r5 = gNumAlignedFree;
              r5 = r5 >> 2;
              r8 = Int64(heapClassInst.heap32[(r5)]);
              r8 = (r8 + 1) | 0;
              r9 = r9 >> 2;
              heapClassInst.heap32[(r5)] = Int32(r8);
              r5 = Int64(heapClassInst.heap32[(r9 + (-1))]);
              heapClassInst.heap32[(g0)] = Int32(r5);
              free(i7);
              r5 = Int64(heapClassInst.heap32[(r3 + 1)]);
            }
            r8 = r4 >> 2;
            heapClassInst.heap32[(r8)] = 0;
          }
          r4 = r4 >> 2;
          heapClassInst.heap8[r0 + 16] = Int8(r6);
          heapClassInst.heap32[(r4)] = Int32(r2);
          heapClassInst.heap32[(r3 + 2)] = Int32(r7);
          r2 = Int64(heapClassInst.heap32[(r1 + 3)]);
        }
      }
      r0 = r5 << 2;
      r1 = Int64(heapClassInst.heap32[(r3 + 3)]);
      r0 = (r1 + r0) | 0;
      r0 = r0 >> 2;
      heapClassInst.heap32[(r0)] = Int32(r2);
      r0 = Int64(heapClassInst.heap32[(r3 + 1)]);
      r0 = (r0 + 1) | 0;
      heapClassInst.heap32[(r3 + 1)] = Int32(r0);
    }
  }
  return;
}

func _ZN34btSphereTriangleCollisionAlgorithm16processCollisionEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResult(sp: Int64)
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
  var f0: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-176); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1 + 3)]);
  if (!(r2 == 0)) 
  {
    r3 = Int64(heapClassInst.heap32[(fp + 1)]);
    r4 = Int64(heapClassInst.heap32[(fp + 2)]);
    r5 = Int64(heapClassInst.heap32[(fp + 3)]);
    r6 = Int64(heapClassInst.heap32[(fp + 4)]);
    r7 = Int64(heapClassInst.heapU8[r0 + 16]);
    r8 = if (r7 == 0) {r4} else {r3};
    r3 = if (r7 == 0) {r3} else {r4};
    r4 = r8 >> 2;
    r3 = r3 >> 2;
    r7 = Int64(heapClassInst.heap32[(r4 + 48)]);
    r8 = Int64(heapClassInst.heap32[(r3 + 48)]);
    r9 = r6 >> 2;
    heapClassInst.heap32[(r9 + 1)] = Int32(r2);
    r1 = Int64(heapClassInst.heap32[(r1 + 3)]);
    r1 = r1 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r1 + 280)]);
    r1 = _ZTV22SphereTriangleDetector;
    r2 = sp + (-16);
    r1 = (r1 + 8) | 0;
    r10 = r2 >> 2;
    heapClassInst.heap32[(fp + (-4))] = Int32(r1);
    heapClassInst.heap32[(r10 + 1)] = Int32(r8);
    r1 = sp + (-152);
    heapClassInst.heap32[(r10 + 2)] = Int32(r7);
    r7 = r1 >> 2;
    heapClassInst.heapFloat[(r10 + 3)] = Float32(f0);
    heapClassInst.heap32[(r7 + 33)] = 0;
    heapClassInst.heap32[(r7 + 32)] = 1566444395;
    heapClassInst.heap32[(fp + (-38))] = heapClassInst.heap32[(r3 + 1)];
    heapClassInst.heap32[(r7 + 1)] = heapClassInst.heap32[(r3 + 2)];
    heapClassInst.heap32[(r7 + 2)] = heapClassInst.heap32[(r3 + 3)];
    heapClassInst.heap32[(r7 + 3)] = heapClassInst.heap32[(r3 + 4)];
    heapClassInst.heap32[(r7 + 4)] = heapClassInst.heap32[(r3 + 5)];
    heapClassInst.heap32[(r7 + 5)] = heapClassInst.heap32[(r3 + 6)];
    heapClassInst.heap32[(r7 + 6)] = heapClassInst.heap32[(r3 + 7)];
    heapClassInst.heap32[(r7 + 7)] = heapClassInst.heap32[(r3 + 8)];
    heapClassInst.heap32[(r7 + 8)] = heapClassInst.heap32[(r3 + 9)];
    heapClassInst.heap32[(r7 + 9)] = heapClassInst.heap32[(r3 + 10)];
    heapClassInst.heap32[(r7 + 10)] = heapClassInst.heap32[(r3 + 11)];
    heapClassInst.heap32[(r7 + 11)] = heapClassInst.heap32[(r3 + 12)];
    heapClassInst.heap32[(r7 + 12)] = heapClassInst.heap32[(r3 + 13)];
    heapClassInst.heap32[(r7 + 13)] = heapClassInst.heap32[(r3 + 14)];
    heapClassInst.heap32[(r7 + 14)] = heapClassInst.heap32[(r3 + 15)];
    heapClassInst.heap32[(r7 + 15)] = heapClassInst.heap32[(r3 + 16)];
    heapClassInst.heap32[(r7 + 16)] = heapClassInst.heap32[(r4 + 1)];
    heapClassInst.heap32[(r7 + 17)] = heapClassInst.heap32[(r4 + 2)];
    heapClassInst.heap32[(r7 + 18)] = heapClassInst.heap32[(r4 + 3)];
    heapClassInst.heap32[(r7 + 19)] = heapClassInst.heap32[(r4 + 4)];
    heapClassInst.heap32[(r7 + 20)] = heapClassInst.heap32[(r4 + 5)];
    heapClassInst.heap32[(r7 + 21)] = heapClassInst.heap32[(r4 + 6)];
    heapClassInst.heap32[(r7 + 22)] = heapClassInst.heap32[(r4 + 7)];
    heapClassInst.heap32[(r7 + 23)] = heapClassInst.heap32[(r4 + 8)];
    heapClassInst.heap32[(r7 + 24)] = heapClassInst.heap32[(r4 + 9)];
    heapClassInst.heap32[(r7 + 25)] = heapClassInst.heap32[(r4 + 10)];
    heapClassInst.heap32[(r7 + 26)] = heapClassInst.heap32[(r4 + 11)];
    heapClassInst.heap32[(r7 + 27)] = heapClassInst.heap32[(r4 + 12)];
    heapClassInst.heap32[(r7 + 28)] = heapClassInst.heap32[(r4 + 13)];
    heapClassInst.heap32[(r7 + 29)] = heapClassInst.heap32[(r4 + 14)];
    heapClassInst.heap32[(r7 + 30)] = heapClassInst.heap32[(r4 + 15)];
    heapClassInst.heap32[(r7 + 31)] = heapClassInst.heap32[(r4 + 16)];
    r3 = r5 >> 2;
    r4 = Int64(heapClassInst.heapU8[r0 + 16]);
    r3 = Int64(heapClassInst.heap32[(r3 + 5)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = Int32(r6);
    heapClassInst.heap32[(g0 + 3)] = Int32(r3);
    heapClassInst.heap32[(g0 + 4)] = Int32(r4);
    _ZN22SphereTriangleDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb(i7);
    r0 = Int64(heapClassInst.heapU8[r0 + 8]);
    if (!(r0 == 0)) 
    {
      r0 = Int64(heapClassInst.heap32[(r9 + 1)]);
      if (r0 != 0) 
      {
        r1 = r0 >> 2;
        r2 = Int64(heapClassInst.heap32[(r1 + 279)]);
        if (!(r2 == 0)) 
        {
          r1 = Int64(heapClassInst.heap32[(r1 + 277)]);
          r2 = Int64(heapClassInst.heap32[(r9 + 34)]);
          if (r1 == r2) 
          {
            r1 = (r6 + 8) | 0;
            r2 = (r6 + 72) | 0;
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r1);
            heapClassInst.heap32[(g0 + 2)] = Int32(r2);
            _ZN20btPersistentManifold20refreshContactPointsERK11btTransformS2_(i7);
          }
          else {
            r1 = (r6 + 72) | 0;
            r6 = (r6 + 8) | 0;
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r1);
            heapClassInst.heap32[(g0 + 2)] = Int32(r6);
            _ZN20btPersistentManifold20refreshContactPointsERK11btTransformS2_(i7);
            return;
          }
        }
      }
      else {
        r0 = _E2_str59; 
        r6 = _E2_str160;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r6);
        heapClassInst.heap32[(g0 + 2)] = 101;
        _assert(i7);
      }
    }
  }
  return;
}

func _ZN34btSphereTriangleCollisionAlgorithmD0Ev(sp: Int64)
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
  r1 = _ZTV34btSphereTriangleCollisionAlgorithm;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r1 = Int64(heapClassInst.heapU8[r0 + 8]);
  if (!(r1 == 0)) 
  {
    r1 = Int64(heapClassInst.heap32[(r2 + 3)]);
    if (!(r1 == 0)) 
    {
      r3 = Int64(heapClassInst.heap32[(r2 + 1)]);
      r4 = r3 >> 2;
      r4 = Int64(heapClassInst.heap32[(r4)]);
      r4 = r4 >> 2;
      r4 = Int64(heapClassInst.heap32[(r4 + 4)]);
      heapClassInst.heap32[(g0)] = Int32(r3);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      __FUNCTION_TABLE__[(r4) >> 2](i7);
    }
  }
  r1 = _ZTV30btActivatingCollisionAlgorithm;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN34btSphereTriangleCollisionAlgorithmD1Ev(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV34btSphereTriangleCollisionAlgorithm;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r0 = Int64(heapClassInst.heapU8[r0 + 8]);
  if (!(r0 == 0)) 
  {
    r0 = Int64(heapClassInst.heap32[(r2 + 3)]);
    if (!(r0 == 0)) 
    {
      r1 = Int64(heapClassInst.heap32[(r2 + 1)]);
      r3 = r1 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3)]);
      r3 = r3 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3 + 4)]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      heapClassInst.heap32[(g0 + 1)] = Int32(r0);
      __FUNCTION_TABLE__[(r3) >> 2](i7);
    }
  }
  r0 = _ZTV30btActivatingCollisionAlgorithm;
  r0 = (r0 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r0);
  return;
}

func _ZN20btAlignedObjectArrayI9btElementE17quickSortInternalI31btUnionFindElementSortPredicateEEvT_ii(sp: Int64): Unit
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
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = (r0 + r1) | 0;
  r3 = r2 >> 31;
  r4 = Int64(heapClassInst.heap32[(fp)]);
  r2 = (r2 + r3) | 0;
  r3 = r4 >> 2;
  r2 = r2 & 1073741822;
  r5 = Int64(heapClassInst.heap32[(r3 + 3)]);
  r2 = r2 << 2;
  r2 = (r5 + r2) | 0;
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r5 = r1;
  r6 = r0;
  /*repeat_1: */
  while (true) {
    r7 = Int64(heapClassInst.heap32[(r3 + 3)]);
    r8 = r5 << 3;
    r8 = (r7 + r8) | 0;
    r8 = r8 >> 2;
    r8 = Int64(heapClassInst.heap32[(r8)]);
    if (r8 < r2) 
    {
      // repeat_4: 
      while(true){
          while (true) {
            r8 = r5 << 3;
            r8 = (r7 + r8) | 0;
            r8 = r8 >> 2;
            r8 = Int64(heapClassInst.heap32[(r8 + 2)]);
            r5 = (r5 + 1) | 0;
            if (r8 < r2) 
            {
              continue //repeat_4;
            }
            else {
              break //repeat_4;
            }
          }
          break
      }
    }
    r9 = r6 << 3;
    r9 = (r7 + r9) | 0;
    r9 = r9 >> 2;
    r9 = Int64(heapClassInst.heap32[(r9)]);
    // repeat_7
    while(true){
        do {
          if (r2 < r9) 
          {
            // repeat_8: 
            while (true) {
              r9 = r6 << 3;
              r9 = (r7 + r9) | 0;
              r9 = r9 >> 2;
              r9 = Int64(heapClassInst.heap32[(r9 + (-2))]);
              r6 = (r6 + (-1)) | 0;
              if (r2 < r9) 
              {
                continue // repeat_8;
              }
              else {
                break //repeat_7;
              }
            }
          }
        } while (false);
        break
    }
    if (r5 <= r6) 
    {
      r10 = r5 << 3;
      r11 = r6 << 3;
      r10 = (r7 + r10) | 0;
      r7 = (r7 + r11) | 0;
      r10 = r10 >> 2;
      r7 = r7 >> 2;
      r12 = Int64(heapClassInst.heap32[(r10 + 1)]);
      r7 = Int64(heapClassInst.heap32[(r7 + 1)]);
      heapClassInst.heap32[(r10)] = Int32(r9);
      heapClassInst.heap32[(r10 + 1)] = Int32(r7);
      r7 = Int64(heapClassInst.heap32[(r3 + 3)]);
      r7 = (r7 + r11) | 0;
      r7 = r7 >> 2;
      r5 = (r5 + 1) | 0;
      r6 = (r6 + (-1)) | 0;
      heapClassInst.heap32[(r7)] = Int32(r8);
      heapClassInst.heap32[(r7 + 1)] = Int32(r12);
    }
    if (r5 <= r6) 
    {
      continue // repeat_1;
    }
    else {
      break // repeat_1;
    }
  }
  if (!(r6 <= r1)) 
  {
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = Int32(r6);
    _ZN20btAlignedObjectArrayI9btElementE17quickSortInternalI31btUnionFindElementSortPredicateEEvT_ii(i7);
  }
  if (!(r5 >= r0)) 
  {
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0 + 1)] = Int32(r5);
    heapClassInst.heap32[(g0 + 2)] = Int32(r0);
    _ZN20btAlignedObjectArrayI9btElementE17quickSortInternalI31btUnionFindElementSortPredicateEEvT_ii(i7);
  }
  return;
}

func _ZN22SphereTriangleDetectorD1Ev(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV22SphereTriangleDetector;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN22SphereTriangleDetectorD0Ev(sp: Int64)
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
  r1 = _ZTV22SphereTriangleDetector;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN22SphereTriangleDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb(sp: Int64)
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
  i7 = sp + (-144); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 2)]);
  r1 = r1 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r1 + 19)]);
  f1 = Float64(heapClassInst.heapFloat[(r1 + 15)]);
  f2 = Float64(heapClassInst.heapFloat[(r1 + 23)]);
  f3 = Float64(heapClassInst.heapFloat[(r1 + 17)]);
  f4 = Float64(heapClassInst.heapFloat[(r1 + 13)]);
  f5 = Float64(heapClassInst.heapFloat[(r1 + 21)]);
  f6 = Float64(heapClassInst.heapFloat[(r1 + 22)]);
  f7 = Float64(heapClassInst.heapFloat[(r1 + 14)]);
  f8 = Float64(heapClassInst.heapFloat[(r1 + 18)]);
  f0 = f0 - f1;
  f6 = f6 - f7;
  f3 = f3 - f4;
  f1 = f2 - f1;
  f2 = f8 - f7;
  f4 = f5 - f4;
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  r3 = Int64(heapClassInst.heap32[(r0 + 1)]);
  f5 = f2 * f1;
  f7 = f0 * f6;
  f0 = f0 * f4;
  f1 = f3 * f1;
  r2 = r2 >> 2;
  r3 = r3 >> 2;
  f5 = f5 - f7;
  f0 = f0 - f1;
  f1 = f3 * f6;
  f2 = f2 * f4;
  f3 = Float64(heapClassInst.heapFloat[(r0 + 3)]);
  f1 = f1 - f2;
  f2 = f5 * f5;
  f4 = f0 * f0;
  f6 = Float64(heapClassInst.heapFloat[(r3 + 7)]);
  f7 = Float64(heapClassInst.heapFloat[(r3 + 3)]);
  f8 = Float64(heapClassInst.heapFloat[(r2 + 18)]);
  f9 = Float64(heapClassInst.heapFloat[(r2 + 22)]);
  f10 = Float64(heapClassInst.heapFloat[(r2 + 26)]);
  f11 = Float64(heapClassInst.heapFloat[(r2 + 17)]);
  f12 = Float64(heapClassInst.heapFloat[(r2 + 21)]);
  f13 = Float64(heapClassInst.heapFloat[(r2 + 25)]);
  f14 = Float64(heapClassInst.heapFloat[(r2 + 16)]);
  f15 = Float64(heapClassInst.heapFloat[(r2 + 12)]);
  f16 = Float64(heapClassInst.heapFloat[(r2 + 28)]);
  f17 = Float64(heapClassInst.heapFloat[(r2 + 20)]);
  f18 = Float64(heapClassInst.heapFloat[(r2 + 13)]);
  f19 = Float64(heapClassInst.heapFloat[(r2 + 29)]);
  f20 = Float64(heapClassInst.heapFloat[(r2 + 24)]);
  f21 = Float64(heapClassInst.heapFloat[(r2 + 14)]);
  f22 = Float64(heapClassInst.heapFloat[(r2 + 30)]);
  f2 = f2 + f4;
  f4 = f1 * f1;
  f15 = f15 - f16;
  f16 = f18 - f19;
  f2 = f2 + f4;
  f4 = f21 - f22;
  heapClassInst.heapFloat[(g0)] = Float32(f2);
  f2 = f11 * f15;
  f11 = f12 * f16;
  f12 = f14 * f15;
  f14 = f17 * f16;
  sqrtf(i7);
  f18 = 1.0;
  heapClassInst.heapFloat[(fp + (-25))] = Float32(f18);
  f8 = f8 * f15;
  f9 = f9 * f16;
  f2 = f2 + f11;
  f11 = f13 * f4;
  f12 = f12 + f14;
  f13 = f20 * f4;
  f14 = f18 / commonVariable.f_g0;
  f2 = f2 + f11;
  f11 = Float64(heapClassInst.heapFloat[(r1 + 14)]);
  f12 = f12 + f13;
  f13 = Float64(heapClassInst.heapFloat[(r1 + 13)]);
  f8 = f8 + f9;
  f4 = f10 * f4;
  f5 = f5 * f14;
  f9 = f12 - f13;
  heapClassInst.heapFloat[(fp + (-28))] = Float32(f9);
  f0 = f0 * f14;
  f10 = f2 - f11;
  heapClassInst.heapFloat[(fp + (-29))] = Float32(f10);
  f4 = f8 + f4;
  f8 = Float64(heapClassInst.heapFloat[(r1 + 15)]);
  f1 = f1 * f14;
  f14 = f4 - f8;
  heapClassInst.heapFloat[(fp + (-27))] = Float32(f14);
  f9 = f9 * f5;
  f10 = f10 * f0;
  f9 = f9 + f10;
  f10 = f14 * f1;
  f9 = f9 + f10;
  r3 = Int64(heapClassInst.heap32[(fp + 2)]);
  r4 = Int64(heapClassInst.heap32[(fp + 4)]);
  f6 = f6 * f7;
  heapClassInst.heapFloat[(fp + (-26))] = Float32(f6);
  f6 = 0.0;
  if (f9 < f6) 
  {
    f9 = -f9;
    f5 = -f5;
    f0 = -f0;
    f1 = -f1;
  }
  f7 = Float64(heapClassInst.heapFloat[(fp + (-26))]);
  if (f9 < f7) 
  {
    __label__ = 4;
  }
  else {
    f7 = f5 * f6;
    f10 = f0 * f6;
    f7 = f7 + f10;
    f10 = f1 * f6;
    f7 = f7 + f10;
    if (f7 >= f6) 
    {
      __label__ = 29;
    }
    else {
      __label__ = 4;
    }
  }
  // repeat_6: 
  do {
    if (__label__ == 4) {
      f7 = Float64(heapClassInst.heapFloat[(fp + (-26))]);
      f3 = f7 + f3;
      heapClassInst.heapFloat[(fp + (-30))] = Float32(f3);
      if (!(f3 <= f9)) 
      {
        f3 = Float64(heapClassInst.heapFloat[(r1 + 19)]);
        f7 = Float64(heapClassInst.heapFloat[(r1 + 23)]);
        f10 = Float64(heapClassInst.heapFloat[(r1 + 17)]);
        f14 = Float64(heapClassInst.heapFloat[(r1 + 21)]);
        f15 = Float64(heapClassInst.heapFloat[(r1 + 18)]);
        f16 = Float64(heapClassInst.heapFloat[(r1 + 22)]);
        f17 = f7 - f3;
        f18 = f14 - f10;
        f19 = f3 - f8;
        f8 = f8 - f7;
        f20 = f16 - f15;
        f21 = f10 - f13;
        f22 = f15 - f11;
        f13 = f13 - f14;
        f11 = f11 - f16;
        f23 = f20 * f1;
        f24 = f17 * f0;
        f17 = f17 * f5;
        f25 = f18 * f1;
        f26 = f22 * f1;
        f27 = f19 * f0;
        f19 = f19 * f5;
        f28 = f21 * f1;
        f29 = f11 * f1;
        f30 = f8 * f0;
        f8 = f8 * f5;
        heapClassInst.heapFloat[(fp + (-31))] = Float32(f8);
        f8 = f13 * f1;
        f23 = f23 - f24;
        f10 = f12 - f10;
        f17 = f17 - f25;
        f15 = f2 - f15;
        f18 = f18 * f0;
        f20 = f20 * f5;
        f24 = f26 - f27;
        f19 = f19 - f28;
        f21 = f21 * f0;
        f22 = f22 * f5;
        f25 = f29 - f30;
        f14 = f12 - f14;
        f26 = Float64(heapClassInst.heapFloat[(fp + (-31))]);
        f8 = f26 - f8;
        f16 = f2 - f16;
        f13 = f13 * f0;
        f11 = f11 * f5;
        f10 = f23 * f10;
        f15 = f17 * f15;
        f17 = f18 - f20;
        f3 = f4 - f3;
        f18 = Float64(heapClassInst.heapFloat[(fp + (-28))]);
        f18 = f24 * f18;
        f20 = Float64(heapClassInst.heapFloat[(fp + (-29))]);
        f19 = f19 * f20;
        f20 = f21 - f22;
        f14 = f25 * f14;
        f8 = f8 * f16;
        f11 = f13 - f11;
        f7 = f4 - f7;
        f10 = f10 + f15;
        f3 = f17 * f3;
        f13 = f18 + f19;
        f15 = Float64(heapClassInst.heapFloat[(fp + (-27))]);
        f15 = f20 * f15;
        f8 = f14 + f8;
        f7 = f11 * f7;
        f3 = f10 + f3;
        f10 = f13 + f15;
        f7 = f8 + f7;
        if (f3 <= f6) 
        {
          __label__ = 8;
        }
        else {
          f8 = 0.0;
          if (f10 <= f8) 
          {
            __label__ = 8;
          }
          else {
            if (f7 > f8) 
            {
              __label__ = 11;
            }
            else {
              __label__ = 8;
            }
          }
        }
        // repeat_12: 
        do {
          if (__label__ == 8) {
            if (!(f10 > f6)) 
            {
              if (!(f3 > f6)) 
              {
                if (!(f7 > f6)) 
                {
                  __label__ = 11;
                  break // repeat_12;
                }
              }
            }
            r1 = Int64(heapClassInst.heap32[(r0 + 2)]);
            r5 = r1 >> 2;
            r5 = Int64(heapClassInst.heap32[(r5)]);
            r5 = r5 >> 2;
            r5 = Int64(heapClassInst.heap32[(r5 + 22)]);
            heapClassInst.heap32[(g0)] = Int32(r1);
            __FUNCTION_TABLE__[(r5) >> 2](i7);
            r1 = commonVariable.r_g0;
            if (r1 < 1) 
            {
              break // repeat_6;
            }
            else {
              f0 = Float64(heapClassInst.heapFloat[(fp + (-30))]);
              f5 = f0 * f0;
              r1 = 0;
              r5 = r1;
              // repeat_19: 
              while (true) {
                r6 = Int64(heapClassInst.heap32[(r0 + 2)]);
                r7 = r6 >> 2;
                r7 = Int64(heapClassInst.heap32[(r7)]);
                r7 = r7 >> 2;
                r7 = Int64(heapClassInst.heap32[(r7 + 23)]);
                r8 = sp + (-32);
                r9 = sp + (-16);
                heapClassInst.heap32[(g0)] = Int32(r6);
                heapClassInst.heap32[(g0 + 1)] = Int32(r1);
                heapClassInst.heap32[(g0 + 2)] = Int32(r9);
                heapClassInst.heap32[(g0 + 3)] = Int32(r8);
                __FUNCTION_TABLE__[(r7) >> 2](i7);
                r6 = r8 >> 2;
                r7 = r9 >> 2;
                f7 = Float64(heapClassInst.heapFloat[(r7 + 1)]);
                f8 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
                f9 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
                f10 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
                f11 = f2 - f7;
                f8 = f8 - f7;
                f13 = f12 - f9;
                f10 = f10 - f9;
                f14 = Float64(heapClassInst.heapFloat[(r7 + 2)]);
                f15 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
                f16 = f4 - f14;
                f15 = f15 - f14;
                f17 = f10 * f13;
                f18 = f8 * f11;
                f17 = f17 + f18;
                f18 = f15 * f16;
                f17 = f17 + f18;
                r1 = (r1 + 1) | 0;
                if (f17 > f6) 
                {
                  f18 = f10 * f10;
                  f19 = f8 * f8;
                  f18 = f18 + f19;
                  f19 = f15 * f15;
                  f18 = f18 + f19;
                  if (f17 >= f18) 
                  {
                    f13 = f13 - f10;
                    f11 = f11 - f8;
                    f16 = f16 - f15;
                    f17 = Float64(heapClassInst.heapFloat[(fp + (-25))]);
                  }
                  else {
                    f17 = f17 / f18;
                    f18 = f10 * f17;
                    f19 = f8 * f17;
                    f20 = f15 * f17;
                    f13 = f13 - f18;
                    f11 = f11 - f19;
                    f16 = f16 - f20;
                  }
                }
                else {
                  f17 = f6;
                }
                f13 = f13 * f13;
                f11 = f11 * f11;
                f11 = f13 + f11;
                f13 = f16 * f16;
                f11 = f11 + f13;
                if (f11 < f5) 
                {
                  f0 = f10 * f17;
                  f3 = f8 * f17;
                  f8 = f15 * f17;
                  f1 = f9 + f0;
                  f0 = f7 + f3;
                  f3 = f14 + f8;
                  r5 = 1;
                }
                r6 = Int64(heapClassInst.heap32[(r0 + 2)]);
                r7 = r6 >> 2;
                r7 = Int64(heapClassInst.heap32[(r7)]);
                r7 = r7 >> 2;
                r7 = Int64(heapClassInst.heap32[(r7 + 22)]);
                heapClassInst.heap32[(g0)] = Int32(r6);
                __FUNCTION_TABLE__[(r7) >> 2](i7);
                r6 = commonVariable.r_g0;
                if (!(r6 > r1)) 
                {
                  break // repeat_19;
                }
              }
              r0 = r5 & 255;
              if (r0 == 0) 
              {
                break // repeat_6;
              }
              else {
                __label__ = 23;
              }
            }
          }
        } while (false);
        if (__label__ == 11) {
          f6 = f1 * f9;
          f0 = f0 * f9;
          f1 = f5 * f9;
          f3 = f4 - f6;
          f0 = f2 - f0;
          f1 = f12 - f1;
        }
        f2 = f2 - f0;
        f5 = f12 - f1;
        f4 = f4 - f3;
        f6 = f5 * f5;
        f7 = f2 * f2;
        f6 = f6 + f7;
        f7 = f4 * f4;
        f6 = f6 + f7;
        f7 = Float64(heapClassInst.heapFloat[(fp + (-26))]);
        f7 = f7 * f7;
        if (f7 <= f6) 
        {
          f6 = 0.0;
          f5 = f5 * f6;
          f2 = f2 * f6;
          f2 = f5 + f2;
          f4 = f4 * f6;
          f2 = f2 + f4;
          if (f2 >= f6) 
          {
            break // repeat_6;
          }
        }
        else {
          heapClassInst.heapFloat[(g0)] = Float32(f6);
          sqrtf(i7);
          f7 = commonVariable.f_g0;
          heapClassInst.heapFloat[(g0)] = Float32(f6);
          f6 = 1.0;
          sqrtf(i7);
          f9 = Float64(heapClassInst.heapFloat[(fp + (-26))]);
          f7 = f9 - f7;
          f6 = f6 / commonVariable.f_g0;
          f5 = f5 * f6;
          f2 = f2 * f6;
          f4 = f4 * f6;
          f6 = -f7;
        }
        if (r4 == 0) 
        {
          r0 = r3 >> 2;
          f7 = Float64(heapClassInst.heapFloat[(r2 + 16)]);
          f8 = Float64(heapClassInst.heapFloat[(r2 + 17)]);
          r0 = Int64(heapClassInst.heap32[(r0)]);
          f9 = Float64(heapClassInst.heapFloat[(r2 + 20)]);
          f10 = Float64(heapClassInst.heapFloat[(r2 + 21)]);
          f11 = f7 * f1;
          f12 = f8 * f0;
          f13 = Float64(heapClassInst.heapFloat[(r2 + 18)]);
          r0 = r0 >> 2;
          f14 = Float64(heapClassInst.heapFloat[(r2 + 24)]);
          f15 = Float64(heapClassInst.heapFloat[(r2 + 25)]);
          f16 = Float64(heapClassInst.heapFloat[(r2 + 22)]);
          f17 = f9 * f1;
          f18 = f10 * f0;
          f11 = f11 + f12;
          f12 = f13 * f3;
          f19 = Float64(heapClassInst.heapFloat[(r2 + 26)]);
          r0 = Int64(heapClassInst.heap32[(r0 + 4)]);
          f1 = f14 * f1;
          f0 = f15 * f0;
          f17 = f17 + f18;
          f18 = f16 * f3;
          f11 = f11 + f12;
          f12 = Float64(heapClassInst.heapFloat[(r2 + 28)]);
          f20 = Float64(heapClassInst.heapFloat[(r2 + 30)]);
          f21 = Float64(heapClassInst.heapFloat[(r2 + 29)]);
          r1 = sp + (-64);
          f17 = f17 + f18;
          f0 = f1 + f0;
          f1 = f19 * f3;
          f3 = f11 + f12;
          f0 = f0 + f1;
          r2 = r1 >> 2;
          f1 = f17 + f21;
          heapClassInst.heapFloat[(fp + (-16))] = Float32(f3);
          f3 = f7 * f5;
          f7 = f8 * f2;
          f0 = f0 + f20;
          heapClassInst.heapFloat[(r2 + 1)] = Float32(f1);
          heapClassInst.heapFloat[(r2 + 2)] = Float32(f0);
          f0 = f9 * f5;
          f1 = f10 * f2;
          f3 = f3 + f7;
          f7 = f13 * f4;
          r4 = sp + (-48);
          f5 = f14 * f5;
          f2 = f15 * f2;
          f0 = f0 + f1;
          f1 = f16 * f4;
          f3 = f3 + f7;
          heapClassInst.heap32[(r2 + 3)] = 0;
          r2 = r4 >> 2;
          f2 = f5 + f2;
          f4 = f19 * f4;
          f0 = f0 + f1;
          heapClassInst.heapFloat[(fp + (-12))] = Float32(f3);
          f1 = f2 + f4;
          heapClassInst.heapFloat[(r2 + 1)] = Float32(f0);
          heapClassInst.heapFloat[(r2 + 2)] = Float32(f1);
          heapClassInst.heap32[(r2 + 3)] = 0;
          heapClassInst.heap32[(g0)] = Int32(r3);
          heapClassInst.heap32[(g0 + 1)] = Int32(r4);
          heapClassInst.heap32[(g0 + 2)] = Int32(r1);
          heapClassInst.heapFloat[(g0 + 3)] = Float32(f6);
          __FUNCTION_TABLE__[(r0) >> 2](i7);
        }
        else {
          f7 = Float64(heapClassInst.heapFloat[(r2 + 16)]);
          f8 = Float64(heapClassInst.heapFloat[(r2 + 17)]);
          f9 = Float64(heapClassInst.heapFloat[(r2 + 20)]);
          f10 = Float64(heapClassInst.heapFloat[(r2 + 21)]);
          f11 = f7 * f5;
          f12 = f8 * f2;
          f13 = Float64(heapClassInst.heapFloat[(r2 + 18)]);
          f14 = Float64(heapClassInst.heapFloat[(r2 + 24)]);
          f15 = Float64(heapClassInst.heapFloat[(r2 + 25)]);
          f16 = Float64(heapClassInst.heapFloat[(r2 + 22)]);
          f17 = f9 * f5;
          f18 = f10 * f2;
          f11 = f11 + f12;
          f12 = f13 * f4;
          f19 = Float64(heapClassInst.heapFloat[(r2 + 26)]);
          f11 = f11 + f12;
          f5 = f14 * f5;
          f2 = f15 * f2;
          f12 = f17 + f18;
          f17 = f16 * f4;
          r0 = sp + (-80);
          f12 = f12 + f17;
          f2 = f5 + f2;
          f4 = f19 * f4;
          f5 = -f11;
          f2 = f2 + f4;
          r1 = r0 >> 2;
          f4 = -f12;
          heapClassInst.heapFloat[(fp + (-20))] = Float32(f5);
          f5 = -f2;
          heapClassInst.heapFloat[(r1 + 1)] = Float32(f4);
          heapClassInst.heapFloat[(r1 + 2)] = Float32(f5);
          f4 = f7 * f1;
          f5 = f8 * f0;
          heapClassInst.heap32[(r1 + 3)] = 0;
          f7 = f9 * f1;
          f8 = f10 * f0;
          f4 = f4 + f5;
          f5 = f13 * f3;
          f1 = f14 * f1;
          f0 = f15 * f0;
          f7 = f7 + f8;
          f8 = f16 * f3;
          f4 = f4 + f5;
          f5 = Float64(heapClassInst.heapFloat[(r2 + 28)]);
          f0 = f1 + f0;
          f1 = f19 * f3;
          f3 = f7 + f8;
          f7 = Float64(heapClassInst.heapFloat[(r2 + 29)]);
          f8 = Float64(heapClassInst.heapFloat[(r2 + 30)]);
          f4 = f4 + f5;
          f5 = f11 * f6;
          r2 = sp + (-96);
          f0 = f0 + f1;
          f1 = f3 + f7;
          f3 = f12 * f6;
          f4 = f4 + f5;
          r1 = r2 >> 2;
          f0 = f0 + f8;
          f2 = f2 * f6;
          f1 = f1 + f3;
          heapClassInst.heapFloat[(fp + (-24))] = Float32(f4);
          f0 = f0 + f2;
          heapClassInst.heapFloat[(r1 + 1)] = Float32(f1);
          heapClassInst.heapFloat[(r1 + 2)] = Float32(f0);
          r4 = r3 >> 2;
          heapClassInst.heap32[(r1 + 3)] = 0;
          r1 = Int64(heapClassInst.heap32[(r4)]);
          r1 = r1 >> 2;
          r1 = Int64(heapClassInst.heap32[(r1 + 4)]);
          heapClassInst.heap32[(g0)] = Int32(r3);
          heapClassInst.heap32[(g0 + 1)] = Int32(r0);
          heapClassInst.heap32[(g0 + 2)] = Int32(r2);
          heapClassInst.heapFloat[(g0 + 3)] = Float32(f6);
          __FUNCTION_TABLE__[(r1) >> 2](i7);
          return;
        }
      }
    }
  } while (false);
  return;
}

func _ZNK10btBoxShape7getAabbERK11btTransformR9btVector3S4_(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var f1: Float64 = 0.0
  var f2: Float64 = 0.0
  var f3: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-32); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f1 = Float64(heapClassInst.heapFloat[(r1 + 7)]);
  f2 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
  f3 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  r2 = Int64(heapClassInst.heap32[(fp + 3)]);
  heapClassInst.heapFloat[(g0)] = Float32(f1);
  heapClassInst.heapFloat[(g0 + 1)] = Float32(f2);
  heapClassInst.heapFloat[(g0 + 2)] = Float32(f3);
  heapClassInst.heapFloat[(g0 + 3)] = Float32(commonVariable.f_g0);
  heapClassInst.heap32[(g0 + 4)] = Int32(r0);
  heapClassInst.heap32[(g0 + 5)] = Int32(r1);
  heapClassInst.heap32[(g0 + 6)] = Int32(r2);
  _Z15btTransformAabbRK9btVector3fRK11btTransformRS_S5_(i7);
  return;
}

func _Z15btTransformAabbRK9btVector3fRK11btTransformRS_S5_(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 4)]);
  r0 = r0 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(fp + 2)]);
  f1 = Float64(heapClassInst.heapFloat[(fp + 3)]);
  f2 = Float64(heapClassInst.heapFloat[(fp + 1)]);
  f3 = Float64(heapClassInst.heapFloat[(fp)]);
  f4 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
  r1 = Int64(heapClassInst.heap32[(fp + 5)]);
  r2 = Int64(heapClassInst.heap32[(fp + 6)]);
  f0 = f0 + f1;
  f2 = f2 + f1;
  f1 = f3 + f1;
  f3 = 0.0;
  if (f4 < f3) 
  {
    f4 = -f4;
  }
  f5 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
  if (f5 < f3) 
  {
    f5 = -f5;
  }
  f6 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
  if (f6 < f3) 
  {
    f6 = -f6;
  }
  f7 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
  if (f7 < f3) 
  {
    f7 = -f7;
  }
  f8 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
  if (f8 < f3) 
  {
    f8 = -f8;
  }
  f9 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
  if (f9 < f3) 
  {
    f9 = -f9;
  }
  f10 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  if (f10 < f3) 
  {
    f10 = -f10;
  }
  f11 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  if (f11 < f3) 
  {
    f11 = -f11;
  }
  f12 = Float64(heapClassInst.heapFloat[(r0)]);
  if (f12 < f3) 
  {
    f12 = -f12;
  }
  f3 = f12 * f1;
  f11 = f11 * f2;
  f9 = f9 * f1;
  f8 = f8 * f2;
  f3 = f3 + f11;
  f10 = f10 * f0;
  f1 = f6 * f1;
  f2 = f5 * f2;
  f5 = f9 + f8;
  f6 = f7 * f0;
  f3 = f3 + f10;
  f7 = Float64(heapClassInst.heapFloat[(r0 + 12)]);
  f8 = Float64(heapClassInst.heapFloat[(r0 + 13)]);
  f9 = Float64(heapClassInst.heapFloat[(r0 + 14)]);
  f5 = f5 + f6;
  r0 = r1 >> 2;
  f1 = f1 + f2;
  f0 = f4 * f0;
  f2 = f7 - f3;
  f0 = f1 + f0;
  f1 = f8 - f5;
  heapClassInst.heapFloat[(r0)] = Float32(f2);
  f2 = f9 - f0;
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f1);
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f2);
  r1 = r2 >> 2;
  f1 = f7 + f3;
  heapClassInst.heap32[(r0 + 3)] = 0;
  f2 = f8 + f5;
  heapClassInst.heapFloat[(r1)] = Float32(f1);
  f0 = f9 + f0;
  heapClassInst.heapFloat[(r1 + 1)] = Float32(f2);
  heapClassInst.heapFloat[(r1 + 2)] = Float32(f0);
  heapClassInst.heap32[(r1 + 3)] = 0;
  return;
}

func _ZNK10btBoxShape24localGetSupportingVertexERK9btVector3(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  f0 = Float64(heapClassInst.heapFloat[(r1 + 7)]);
  f1 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
  f2 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f3 = commonVariable.f_g0;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f4 = commonVariable.f_g0;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = r0 >> 2;
  f0 = f0 + commonVariable.f_g0;
  r1 = Int64(heapClassInst.heap32[(fp)]);
  f1 = f1 + f4;
  f4 = 0.0;
  f5 = -f0;
  f6 = Float64(heapClassInst.heapFloat[(r0)]);
  f7 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f8 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f2 = f2 + f3;
  f3 = -f1;
  r0 = r1 >> 2;
  f0 = if (f6 < f4) {f5} else {f0};
  f5 = -f2;
  f1 = if (f8 < f4) {f3} else {f1};
  heapClassInst.heapFloat[(r0)] = Float32(f0);
  f0 = if (f7 < f4) {f5} else {f2};
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f1);
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
  heapClassInst.heap32[(r0 + 3)] = 0;
  return;
}

func _ZNK10btBoxShape37localGetSupportingVertexWithoutMarginERK9btVector3(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = r1 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r0 + 7)]);
  r2 = Int64(heapClassInst.heap32[(fp)]);
  f1 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
  f2 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
  f3 = 0.0;
  f4 = -f0;
  f5 = Float64(heapClassInst.heapFloat[(r1)]);
  f6 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f7 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f8 = -f2;
  r0 = r2 >> 2;
  f0 = if (f5 < f3) {f4} else {f0};
  f4 = -f1;
  f2 = if (f7 < f3) {f8} else {f2};
  heapClassInst.heapFloat[(r0)] = Float32(f0);
  f0 = if (f6 < f3) {f4} else {f1};
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f2);
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
  heapClassInst.heap32[(r0 + 3)] = 0;
  return;
}

func _ZNK10btBoxShape49batchedUnitVectorGetSupportingVertexWithoutMarginEPK9btVector3PS0_i(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 3)]);
  if (!(r0 < 1)) 
  {
    r1 = Int64(heapClassInst.heap32[(fp)]);
    r2 = Int64(heapClassInst.heap32[(fp + 1)]);
    r3 = Int64(heapClassInst.heap32[(fp + 2)]);
    r3 = (r3 + 8) | 0;
    r2 = (r2 + 8) | 0;
    f3 = 0.0;
    // repeat_3: 
    while (true) {
      r4 = r1 >> 2;
      r5 = r2 >> 2;
      f0 = Float64(heapClassInst.heapFloat[(r4 + 7)]);
      f1 = Float64(heapClassInst.heapFloat[(r4 + 9)]);
      f2 = Float64(heapClassInst.heapFloat[(r4 + 8)]);
      f4 = -f0;
      f5 = Float64(heapClassInst.heapFloat[(r5 + (-2))]);
      f6 = Float64(heapClassInst.heapFloat[(r5)]);
      f7 = Float64(heapClassInst.heapFloat[(r5 + (-1))]);
      f8 = -f2;
      r4 = r3 >> 2;
      f0 = if (f5 < f3) {f4} else {f0};
      f4 = -f1;
      f2 = if (f7 < f3) {f8} else {f2};
      heapClassInst.heapFloat[(r4 + (-2))] = Float32(f0);
      f0 = if (f6 < f3) {f4} else {f1};
      heapClassInst.heapFloat[(r4 + (-1))] = Float32(f2);
      r0 = (r0 + (-1)) | 0;
      r3 = (r3 + 16) | 0;
      r2 = (r2 + 16) | 0;
      heapClassInst.heapFloat[(r4)] = Float32(f0);
      heapClassInst.heap32[(r4 + 1)] = 0;
      if (r0 != 0) 
      {
        continue //repeat_3;
      }
      else {
        break //repeat_3;
      }
    }
  }
  return;
}

func _ZN10btBoxShape9setMarginEf(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f0 = commonVariable.f_g0;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f1 = commonVariable.f_g0;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f2 = commonVariable.f_g0;
  f3 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
  f4 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
  f5 = Float64(heapClassInst.heapFloat[(r1 + 7)]);
  heapClassInst.heap32[(r1 + 11)] = heapClassInst.heap32[(fp + 1)];
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
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
  f2 = f5 + f2;
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f1 = f4 + f1;
  f2 = f2 - commonVariable.f_g0;
  f0 = f3 + f0;
  f1 = f1 - f7;
  heapClassInst.heapFloat[(r1 + 7)] = Float32(f2);
  f0 = f0 - f6;
  heapClassInst.heapFloat[(r1 + 8)] = Float32(f1);
  heapClassInst.heapFloat[(r1 + 9)] = Float32(f0);
  heapClassInst.heap32[(r1 + 10)] = 0;
  return;
}

func _ZNK10btBoxShape8getPlaneER9btVector3S1_i(sp: Int64)
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
  i7 = sp + (-64);
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 28)]);
  r3 = sp + (-32);
  r4 = Int64(heapClassInst.heap32[(fp + 3)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
  heapClassInst.heap32[(g0 + 2)] = Int32(r4);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  f0 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
  f1 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
  f2 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
  r2 = r3 >> 2;
  heapClassInst.heapFloat[(r2)] = Float32(f2);
  heapClassInst.heapFloat[(r2 + 1)] = Float32(f1);
  heapClassInst.heapFloat[(r2 + 2)] = Float32(f0);
  heapClassInst.heap32[(r2 + 3)] = 0;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 15)]);
  r2 = sp + (-16);
  f2 = -f2;
  r3 = r2 >> 2;
  f1 = -f1;
  heapClassInst.heapFloat[(fp + (-4))] = Float32(f2);
  f0 = -f0;
  heapClassInst.heapFloat[(r3 + 1)] = Float32(f1);
  heapClassInst.heapFloat[(r3 + 2)] = Float32(f0);
  heapClassInst.heap32[(r3 + 3)] = 0;
  r3 = sp + (-48);
  heapClassInst.heap32[(g0)] = Int32(r3);
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  heapClassInst.heap32[(g0 + 2)] = Int32(r2);
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r0 = r0 >> 2;
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r1 = r3 >> 2;
  heapClassInst.heap32[(r0)] = heapClassInst.heap32[(fp + (-12))];
  heapClassInst.heap32[(r0 + 1)] = heapClassInst.heap32[(r1 + 1)];
  heapClassInst.heap32[(r0 + 2)] = heapClassInst.heap32[(r1 + 2)];
  heapClassInst.heap32[(r0 + 3)] = heapClassInst.heap32[(r1 + 3)];
  return;
}

func _ZNK10btBoxShape12getNumPlanesEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = 6;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK10btBoxShape14getNumVerticesEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = 8;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK10btBoxShape11getNumEdgesEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = 12;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK10btBoxShape9getVertexEiR9btVector3(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = r0 >> 1;
  r2 = Int64(heapClassInst.heap32[(fp)]);
  r2 = r2 >> 2;
  r1 = r1 & 1;
  r3 = r0 >> 2;
  r0 = r0 & 1;
  r4 = 0;
  f0 = 1.0;
  f1 = 0.0;
  r3 = r3 & 1;
  r5 = r1 ^ 1;
  f0 = if (r0 == r4) {f0} else {f1};
  f1 = Float64(heapClassInst.heapFloat[(r2 + 7)]);
  f2 = Float64(r0); 
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r4 = r3 ^ 1;
  f3 = Float64(r5); 
  f4 = Float64(heapClassInst.heapFloat[(r2 + 8)]);
  f5 = Float64(r1); 
  f6 = Float64(heapClassInst.heapFloat[(r2 + 9)]);
  f0 = f1 * f0;
  f1 = f1 * f2;
  f2 = Float64(r4); 
  f7 = Float64(r3); 
  r0 = r0 >> 2;
  f3 = f4 * f3;
  f4 = f4 * f5;
  f0 = f0 - f1;
  f1 = f6 * f2;
  f2 = f6 * f7;
  f3 = f3 - f4;
  heapClassInst.heapFloat[(r0)] = Float32(f0);
  f0 = f1 - f2;
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f3);
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
  heapClassInst.heap32[(r0 + 3)] = 0;
  return;
}

func _ZNK10btBoxShape8isInsideERK9btVector3f(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var f0: Float64 = 0.0
  var f1: Float64 = 0.0
  var f2: Float64 = 0.0
  var f3: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r1 >> 2;
  r0 = r0 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r0)]);
  f1 = Float64(heapClassInst.heapFloat[(fp + 2)]);
  f2 = Float64(heapClassInst.heapFloat[(r1 + 7)]);
  f3 = f2 + f1;
  if (!(f0 > f3)) 
  {
    f2 = -f2;
    f2 = f2 - f1;
    if (!(f0 < f2)) 
    {
      f0 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
      f2 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
      f3 = f0 + f1;
      if (!(f2 > f3)) 
      {
        f0 = -f0;
        f0 = f0 - f1;
        if (!(f2 < f0)) 
        {
          f0 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
          f2 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
          f3 = f0 + f1;
          if (!(f2 > f3)) 
          {
            f0 = -f0;
            f0 = f0 - f1;
            r0 = if (f2 >= f0) {1} else {0};
            r0 = r0 & 1;
            commonVariable.r_g0 = r0;
            return;
          }
        }
      }
    }
  }
  r0 = 0;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK10btBoxShape7getNameEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = _E2_str173;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK10btBoxShape36getNumPreferredPenetrationDirectionsEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = 6;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK10btBoxShape21calculateLocalInertiaEfR9btVector3(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  f0 = Float64(heapClassInst.heapFloat[(r1 + 7)]);
  f1 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
  f2 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f3 = commonVariable.f_g0;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  f1 = f1 + commonVariable.f_g0;
  f2 = f2 + f3;
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  f0 = f0 + commonVariable.f_g0;
  f1 = f1 + f1;
  f2 = f2 + f2;
  f0 = f0 + f0;
  f3 = Float64(heapClassInst.heapFloat[(fp + 1)]);
  f4 = 12.0;
  f1 = f1 * f1;
  f2 = f2 * f2;
  f0 = f0 * f0;
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  f3 = f3 / f4;
  f4 = f1 + f2;
  f2 = f0 + f2;
  r0 = r0 >> 2;
  f4 = f3 * f4;
  f0 = f0 + f1;
  f1 = f3 * f2;
  heapClassInst.heapFloat[(r0)] = Float32(f4);
  f0 = f3 * f0;
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f1);
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
  heapClassInst.heap32[(r0 + 3)] = 0;
  return;
}

func _ZNK10btBoxShape16getPlaneEquationER9btVector4i(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var f0: Float64 = 0.0
  var f1: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  f0 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
  /*repeat_1:*/ 
  do{
    if (r1 > 2) 
    {
      if (r1 == 3) 
      {
        r2 = r2 >> 2;
        heapClassInst.heap32[(r2)] = 0;
        heapClassInst.heap32[(r2 + 1)] = ( -1082130432);
        __label__ = 11;
        break //repeat_1;
      }
      else {
        f0 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
        if (r1 == 4) 
        {
          r2 = r2 >> 2;
          heapClassInst.heap32[(r2)] = 0;
          heapClassInst.heap32[(r2 + 1)] = 0;
          f0 = -f0;
          heapClassInst.heap32[(r2 + 2)] = 1065353216;
          heapClassInst.heapFloat[(r2 + 3)] = Float32(f0);
          return;
        }
        else {
          if (r1 == 5) 
          {
            r0 = r2 >> 2;
            heapClassInst.heap32[(r0)] = 0;
            heapClassInst.heap32[(r0 + 1)] = 0;
            f0 = -f0;
            heapClassInst.heap32[(r0 + 2)] = ( -1082130432);
            heapClassInst.heapFloat[(r0 + 3)] = Float32(f0);
            return;
          }
          else {
            __label__ = 16;
            break //repeat_1;
          }
        }
      }
    }
    else {
      f1 = Float64(heapClassInst.heapFloat[(r0 + 7)]);
      if (r1 == 0) 
      {
        r2 = r2 >> 2;
        heapClassInst.heap32[(r2)] = 1065353216;
      }
      else {
        if (r1 == 1) 
        {
          r2 = r2 >> 2;
          heapClassInst.heap32[(r2)] = ( -1082130432);
        }
        else {
          if (r1 == 2) 
          {
            r2 = r2 >> 2;
            heapClassInst.heap32[(r2)] = 0;
            heapClassInst.heap32[(r2 + 1)] = 1065353216;
            __label__ = 11;
            break //repeat_1;
          }
          else {
            __label__ = 16;
            break //repeat_1;
          }
        }
      }
      heapClassInst.heap32[(r2 + 1)] = 0;
      f0 = -f1;
      __label__ = 12;
    }
  } while (false);
  match (__label__) {
    case 11 =>
      f0 = -f0;
    case 16 =>
      r0 = _E2_str10;
      r1 = _E2_str2175;
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      heapClassInst.heap32[(g0 + 2)] = 182;
      _assert(i7);
    case _ =>
      println("match fail in _ZNK10btBoxShape16getPlaneEquationER9btVector4i")
  }
  heapClassInst.heap32[(r2 + 2)] = 0;
  heapClassInst.heapFloat[(r2 + 3)] = Float32(f0);
  return;
}

func _ZNK10btBoxShape7getEdgeEiR9btVector3S1_(sp: Int64)
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
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  r3 = Int64(heapClassInst.heap32[(fp + 3)]);
  /*repeat_1:*/
  do {
      if (r0 > 5) 
      {
          if (r0 > 8) 
          {
            if (r0 == 9) 
            {
              r0 = 4;
              r4 = 6;
              __label__ = 28;
              break // repeat_1;
            }
            else {
              if (r0 == 10) 
              {
                r0 = 5;
                r4 = 7;
                __label__ = 28;
                break // repeat_1;
              }
              else {
                if (r0 == 11) 
                {
                  r0 = 6;
                  r4 = 7;
                  __label__ = 28;
                  break // repeat_1;
                }
                else {
                  __label__ = 27;
                  break // repeat_1;
                }
              }
            }
          }
          else {
            if (r0 == 6) 
            {
              r0 = 2;
              r4 = 6;
              __label__ = 28;
              break // repeat_1;
            }
            else {
              if (r0 == 7) 
              {
                r0 = 3;
                r4 = 7;
                __label__ = 28;
                break // repeat_1;
              }
              else {
                if (r0 == 8) 
                {
                  r0 = 4;
                  r4 = 5;
                  __label__ = 28;
                  break // repeat_1;
                }
                else {
                  __label__ = 27;
                  break // repeat_1;
                }
              }
            }
          }
      }
      else {
          if (r0 > 2) 
          {
            if (r0 == 3) 
            {
              r0 = 2;
              r4 = 3;
              __label__ = 28;
              break // repeat_1;
            }
            else {
              if (r0 == 4) 
              {
                r0 = 0;
                r4 = 4;
                __label__ = 28;
                break // repeat_1;
              }
              else {
                if (r0 == 5) 
                {
                  r0 = 1;
                  r4 = 5;
                  __label__ = 28;
                  break // repeat_1;
                }
                else {
                  __label__ = 27;
                  break // repeat_1;
                }
              }
            }
          }
          else {
            if (r0 == 0) 
            {
              r0 = 0;
              r4 = 1;
              __label__ = 28;
              break // repeat_1;
            }
            else {
              if (r0 == 1) 
              {
                r0 = 0;
                r4 = 2;
                __label__ = 28;
              }
              else {
                if (r0 == 2) 
                {
                  r0 = 1;
                  r4 = 3;
                  __label__ = 28;
                }
                else {
                  __label__ = 27;
                }
              }
            }
          }
      }
  } while (false);
  match (__label__) {
    case 28  =>
      r5 = r1 >> 2;
      r6 = Int64(heapClassInst.heap32[(r5)]);
      r6 = r6 >> 2;
      r6 = Int64(heapClassInst.heap32[(r6 + 24)]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      heapClassInst.heap32[(g0 + 1)] = Int32(r0);
      heapClassInst.heap32[(g0 + 2)] = Int32(r2);
      __FUNCTION_TABLE__[(r6) >> 2](i7);
      r0 = Int64(heapClassInst.heap32[(r5)]);
      r0 = r0 >> 2;
      r0 = Int64(heapClassInst.heap32[(r0 + 24)]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      heapClassInst.heap32[(g0 + 1)] = Int32(r4);
      heapClassInst.heap32[(g0 + 2)] = Int32(r3);
      __FUNCTION_TABLE__[(r0) >> 2](i7);
      return;
    case 27  =>
      r0 = _E2_str10;
      r1 = _E2_str2175;
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      heapClassInst.heap32[(g0 + 2)] = 246;
      _assert(i7);
    case _ =>
      println("break 12310")
  }
}

func _ZNK10btBoxShape32getPreferredPenetrationDirectionEiR9btVector3(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  /*repeat_1:*/ 
  do {
      if (r0 > 2) 
      {
        if (r0 == 3) 
        {
          r1 = r1 >> 2;
          heapClassInst.heap32[(r1)] = 0;
          heapClassInst.heap32[(r1 + 1)] = ( -1082130432);
          __label__ = 9;
          break //repeat_1;
        }
        else {
          if (r0 == 4) 
          {
            r1 = r1 >> 2;
            heapClassInst.heap32[(r1)] = 0;
            heapClassInst.heap32[(r1 + 1)] = 0;
            heapClassInst.heap32[(r1 + 2)] = 1065353216;
            heapClassInst.heap32[(r1 + 3)] = 0;
            return;
          }
          else {
            if (r0 == 5) 
            {
              r0 = r1 >> 2;
              heapClassInst.heap32[(r0)] = 0;
              heapClassInst.heap32[(r0 + 1)] = 0;
              heapClassInst.heap32[(r0 + 2)] = ( -1082130432);
              heapClassInst.heap32[(r0 + 3)] = 0;
              return;
            }
            else {
              __label__ = 15;
              break // repeat_1;
            }
          }
        }
      }
      else {
        if (r0 == 0) 
        {
          r1 = r1 >> 2;
          heapClassInst.heap32[(r1)] = 1065353216;
        }
        else {
          if (r0 == 1) 
          {
            r1 = r1 >> 2;
            heapClassInst.heap32[(r1)] = ( -1082130432);
          }
          else {
            if (r0 == 2) 
            {
              r1 = r1 >> 2;
              heapClassInst.heap32[(r1)] = 0;
              heapClassInst.heap32[(r1 + 1)] = 1065353216;
              __label__ = 9;
              break //repeat_1;
            }
            else {
              __label__ = 15;
              break //repeat_1;
            }
          }
        }
        heapClassInst.heap32[(r1 + 1)] = 0;
        __label__ = 9;
      }
  } while (false);
  match (__label__) {
    case 9 =>
      heapClassInst.heap32[(r1 + 2)] = 0;
      heapClassInst.heap32[(r1 + 3)] = 0;
      return;
    case 15 =>
      r0 = _E2_str10;
      r1 = _E2_str2175;
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      heapClassInst.heap32[(g0 + 2)] = 309;
      _assert(i7);
      // break;
    case _ =>
      //break
      println("match __label__ faile in _ZNK10btBoxShape32getPreferredPenetrationDirectionEiR9btVector3")
  }
}

func _ZN10btBoxShape15setLocalScalingERK9btVector3(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f0 = commonVariable.f_g0;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f1 = commonVariable.f_g0;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f2 = commonVariable.f_g0;
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  f3 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
  f4 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
  f5 = Float64(heapClassInst.heapFloat[(r1 + 7)]);
  r0 = r0 >> 2;
  f3 = f3 + f0;
  f6 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
  f4 = f4 + f1;
  f7 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
  f5 = f5 + f2;
  f8 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
  f9 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f3 = f3 / f6;
  f4 = f4 / f7;
  f5 = f5 / f8;
  f6 = 0.0;
  if (f9 < f6) 
  {
    f9 = -f9;
  }
  f7 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  if (f7 < f6) 
  {
    f7 = -f7;
  }
  f8 = Float64(heapClassInst.heapFloat[(r0)]);
  if (f8 < f6) 
  {
    f8 = -f8;
  }
  heapClassInst.heapFloat[(r1 + 3)] = Float32(f8);
  heapClassInst.heapFloat[(r1 + 4)] = Float32(f7);
  heapClassInst.heapFloat[(r1 + 5)] = Float32(f9);
  f5 = f5 * f8;
  f4 = f4 * f7;
  f2 = f5 - f2;
  heapClassInst.heap32[(r1 + 6)] = 0;
  f3 = f3 * f9;
  f1 = f4 - f1;
  heapClassInst.heapFloat[(r1 + 7)] = Float32(f2);
  f0 = f3 - f0;
  heapClassInst.heapFloat[(r1 + 8)] = Float32(f1);
  heapClassInst.heapFloat[(r1 + 9)] = Float32(f0);
  heapClassInst.heap32[(r1 + 10)] = 0;
  return;
}

func _ZN10btBoxShapeD0Ev(sp: Int64)
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
  r1 = _ZTV13btConvexShape;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
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

func _ZN10btBoxShapeD1Ev(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV13btConvexShape;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZNK14btConcaveShape9getMarginEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var f0: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r0 + 3)]);
  commonVariable.f_g0 = f0;
  return;
}

func _ZN14btConcaveShape9setMarginEf(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  heapClassInst.heap32[(r0 + 3)] = heapClassInst.heap32[(fp + 1)];
  return;
}

func _ZNK22btBvhTriangleMeshShape7getNameEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = _E2_str181;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK22btBvhTriangleMeshShape28calculateSerializeBufferSizeEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = 60;
  commonVariable.r_g0 = r0;
  return;
}

func _ZZN22btBvhTriangleMeshShape14performRaycastEP18btTriangleCallbackRK9btVector3S4_EN21MyNodeOverlapCallbackD1Ev(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVZN22btBvhTriangleMeshShape14performRaycastEP18btTriangleCallbackRK9btVector3S4_E21MyNodeOverlapCallback;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZZN22btBvhTriangleMeshShape14performRaycastEP18btTriangleCallbackRK9btVector3S4_EN21MyNodeOverlapCallbackD0Ev(sp: Int64)
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
  r1 = _ZTVZN22btBvhTriangleMeshShape14performRaycastEP18btTriangleCallbackRK9btVector3S4_E21MyNodeOverlapCallback;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZZN22btBvhTriangleMeshShape14performRaycastEP18btTriangleCallbackRK9btVector3S4_EN21MyNodeOverlapCallback11processNodeEii(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-120); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 4)]);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  r4 = sp + (-52);
  r5 = sp + (-56);
  r6 = sp + (-60);
  r7 = sp + (-64);
  r8 = sp + (-68);
  r9 = sp + (-72);
  r10 = sp + (-76);
  r11 = sp + (-80);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(r4);
  heapClassInst.heap32[(g0 + 2)] = Int32(r5);
  heapClassInst.heap32[(g0 + 3)] = Int32(r6);
  heapClassInst.heap32[(g0 + 4)] = Int32(r7);
  heapClassInst.heap32[(g0 + 5)] = Int32(r8);
  heapClassInst.heap32[(g0 + 6)] = Int32(r9);
  heapClassInst.heap32[(g0 + 7)] = Int32(r10);
  heapClassInst.heap32[(g0 + 8)] = Int32(r11);
  heapClassInst.heap32[(g0 + 9)] = Int32(r3);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(fp + (-20))]);
  r2 = (r1 + (-2)) | 0;
  if (`UIntNative`(r2) < `UIntNative`(2)) 
  {
    r2 = Int64(heapClassInst.heap32[(fp + 2)]);
    r4 = Int64(heapClassInst.heap32[(fp + (-17))]);
    r5 = Int64(heapClassInst.heap32[(fp + (-18))]);
    r5 = (r5 * r2) | 0;
    r6 = Int64(heapClassInst.heap32[(r0 + 1)]);
    r4 = (r4 + r5) | 0;
    r5 = ( -6);
    // repeat_3: 
    while (true) {
      r7 = 0;
      r8 = r5 << 1;
      r7 = (r7 - r8) | 0;
      if (r1 != 3) 
      {
        r8 = (r4 - r8) | 0;
        r8 = r8 >> 2;
        r8 = Int64(heapClassInst.heap32[(r8 + (-1))]);
      }
      else {
        r8 = (r4 - r5) | 0;
        r8 = Int64(heapClassInst.heapU16[(r8 + (-2)) >> 1]);
      }
      r9 = Int64(heapClassInst.heap32[(fp + (-16))]);
      r10 = Int64(heapClassInst.heap32[(fp + (-13))]);
      r8 = (r9 * r8) | 0;
      r9 = Int64(heapClassInst.heap32[(fp + (-15))]);
      if (r9 != 0) 
      {
        r9 = (r10 + r8) | 0;
        r11 = r6 >> 2;
        f0 = llvm_readDouble((r9 + 16));
        f1 = llvm_readDouble((r9 + 8));
        f2 = llvm_readDouble((r10 + r8));
        f0 = f0 * 1.0; 
        f3 = Float64(heapClassInst.heapFloat[(r11 + 3)]);
        f1 = f1 * 1.0; 
        f4 = Float64(heapClassInst.heapFloat[(r11 + 2)]);
        f2 = f2 * 1.0; 
        f5 = Float64(heapClassInst.heapFloat[(r11 + 1)]);
        f0 = f0 * f3;
        f1 = f1 * f4;
        f2 = f2 * f5;
      }
      else {
        r8 = (r10 + r8) | 0;
        r8 = r8 >> 2;
        r10 = r6 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r8 + 2)]);
        f1 = Float64(heapClassInst.heapFloat[(r10 + 3)]);
        f2 = Float64(heapClassInst.heapFloat[(r8 + 1)]);
        f3 = Float64(heapClassInst.heapFloat[(r10 + 2)]);
        f4 = Float64(heapClassInst.heapFloat[(r8)]);
        f5 = Float64(heapClassInst.heapFloat[(r10 + 1)]);
        f0 = f0 * f1;
        f1 = f2 * f3;
        f2 = f4 * f5;
      }
      r8 = sp + (-48);
      r9 = r7 << 2;
      r10 = r7 << 2;
      r9 = (r8 + r9) | 0;
      r11 = r7 << 2;
      r10 = (r8 + r10) | 0;
      r9 = r9 >> 2;
      r7 = r7 << 2;
      r11 = (r8 + r11) | 0;
      r10 = r10 >> 2;
      heapClassInst.heapFloat[(r9 + (-4))] = Float32(f2);
      r7 = (r8 + r7) | 0;
      r9 = r11 >> 2;
      heapClassInst.heapFloat[(r10 + (-3))] = Float32(f1);
      r5 = (r5 + 2) | 0;
      r7 = r7 >> 2;
      heapClassInst.heapFloat[(r9 + (-2))] = Float32(f0);
      heapClassInst.heap32[(r7 + (-1))] = 0;
      if (!(r5 != 0)) 
      {
        break // repeat_3;
      }
    }
    r1 = Int64(heapClassInst.heap32[(r0 + 2)]);
    r4 = r1 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4 + 2)]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0 + 1)] = Int32(r8);
    heapClassInst.heap32[(g0 + 2)] = Int32(r3);
    heapClassInst.heap32[(g0 + 3)] = Int32(r2);
    __FUNCTION_TABLE__[(r4) >> 2](i7);
    r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
    r1 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1 + 6)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    __FUNCTION_TABLE__[(r1) >> 2](i7);
    return;
  }
  else {
    r0 = _E2_str6187;
    r1 = _E2_str7188;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = 130;
    _assert(i7);
  }
}

func _ZZN22btBvhTriangleMeshShape17performConvexcastEP18btTriangleCallbackRK9btVector3S4_S4_S4_EN21MyNodeOverlapCallbackD1Ev(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVZN22btBvhTriangleMeshShape17performConvexcastEP18btTriangleCallbackRK9btVector3S4_S4_S4_E21MyNodeOverlapCallback;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZZN22btBvhTriangleMeshShape17performConvexcastEP18btTriangleCallbackRK9btVector3S4_S4_S4_EN21MyNodeOverlapCallbackD0Ev(sp: Int64)
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
  r1 = _ZTVZN22btBvhTriangleMeshShape17performConvexcastEP18btTriangleCallbackRK9btVector3S4_S4_S4_E21MyNodeOverlapCallback;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZZN22btBvhTriangleMeshShape17performConvexcastEP18btTriangleCallbackRK9btVector3S4_S4_S4_EN21MyNodeOverlapCallback11processNodeEii(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-120); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 4)]);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  r4 = sp + (-52);
  r5 = sp + (-56);
  r6 = sp + (-60);
  r7 = sp + (-64);
  r8 = sp + (-68);
  r9 = sp + (-72);
  r10 = sp + (-76);
  r11 = sp + (-80);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(r4);
  heapClassInst.heap32[(g0 + 2)] = Int32(r5);
  heapClassInst.heap32[(g0 + 3)] = Int32(r6);
  heapClassInst.heap32[(g0 + 4)] = Int32(r7);
  heapClassInst.heap32[(g0 + 5)] = Int32(r8);
  heapClassInst.heap32[(g0 + 6)] = Int32(r9);
  heapClassInst.heap32[(g0 + 7)] = Int32(r10);
  heapClassInst.heap32[(g0 + 8)] = Int32(r11);
  heapClassInst.heap32[(g0 + 9)] = Int32(r3);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(fp + (-20))]);
  r2 = (r1 + (-2)) | 0;
  if (`UIntNative`(r2) < `UIntNative`(2)) 
  {
    r2 = Int64(heapClassInst.heap32[(fp + 2)]);
    r4 = Int64(heapClassInst.heap32[(fp + (-17))]);
    r5 = Int64(heapClassInst.heap32[(fp + (-18))]);
    r5 = (r5 * r2) | 0;
    r6 = Int64(heapClassInst.heap32[(r0 + 1)]);
    r4 = (r4 + r5) | 0;
    r5 = ( -6);
    // repeat_3: 
    while (true) {
      r7 = 0;
      r8 = r5 << 1;
      r7 = (r7 - r8) | 0;
      if (r1 != 3) 
      {
        r8 = (r4 - r8) | 0;
        r8 = r8 >> 2;
        r8 = Int64(heapClassInst.heap32[(r8 + (-1))]);
      }
      else {
        r8 = (r4 - r5) | 0;
        r8 = Int64(heapClassInst.heapU16[(r8 + (-2)) >> 1]);
      }
      r9 = Int64(heapClassInst.heap32[(fp + (-16))]);
      r10 = Int64(heapClassInst.heap32[(fp + (-13))]);
      r8 = (r9 * r8) | 0;
      r9 = Int64(heapClassInst.heap32[(fp + (-15))]);
      if (r9 != 0) 
      {
        r9 = (r10 + r8) | 0;
        r11 = r6 >> 2;
        f0 = llvm_readDouble((r9 + 16));
        f1 = llvm_readDouble((r9 + 8));
        f2 = llvm_readDouble((r10 + r8));
        f0 = f0 * 1.0; 
        f3 = Float64(heapClassInst.heapFloat[(r11 + 3)]);
        f1 = f1 * 1.0; 
        f4 = Float64(heapClassInst.heapFloat[(r11 + 2)]);
        f2 = f2 * 1.0; 
        f5 = Float64(heapClassInst.heapFloat[(r11 + 1)]);
        f0 = f0 * f3;
        f1 = f1 * f4;
        f2 = f2 * f5;
      }
      else {
        r8 = (r10 + r8) | 0;
        r8 = r8 >> 2;
        r10 = r6 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r8 + 2)]);
        f1 = Float64(heapClassInst.heapFloat[(r10 + 3)]);
        f2 = Float64(heapClassInst.heapFloat[(r8 + 1)]);
        f3 = Float64(heapClassInst.heapFloat[(r10 + 2)]);
        f4 = Float64(heapClassInst.heapFloat[(r8)]);
        f5 = Float64(heapClassInst.heapFloat[(r10 + 1)]);
        f0 = f0 * f1;
        f1 = f2 * f3;
        f2 = f4 * f5;
      }
      r8 = sp + (-48);
      r9 = r7 << 2;
      r10 = r7 << 2;
      r9 = (r8 + r9) | 0;
      r11 = r7 << 2;
      r10 = (r8 + r10) | 0;
      r9 = r9 >> 2;
      r7 = r7 << 2;
      r11 = (r8 + r11) | 0;
      r10 = r10 >> 2;
      heapClassInst.heapFloat[(r9 + (-4))] = Float32(f2);
      r7 = (r8 + r7) | 0;
      r9 = r11 >> 2;
      heapClassInst.heapFloat[(r10 + (-3))] = Float32(f1);
      r5 = (r5 + 2) | 0;
      r7 = r7 >> 2;
      heapClassInst.heapFloat[(r9 + (-2))] = Float32(f0);
      heapClassInst.heap32[(r7 + (-1))] = 0;
      if (!(r5 != 0)) 
      {
        break // repeat_3;
      }
    }
    r1 = Int64(heapClassInst.heap32[(r0 + 2)]);
    r4 = r1 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4 + 2)]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0 + 1)] = Int32(r8);
    heapClassInst.heap32[(g0 + 2)] = Int32(r3);
    heapClassInst.heap32[(g0 + 3)] = Int32(r2);
    __FUNCTION_TABLE__[(r4) >> 2](i7);
    r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
    r1 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1 + 6)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    __FUNCTION_TABLE__[(r1) >> 2](i7);
    return;
  }
  else {
    r0 = _E2_str6187;
    r1 = _E2_str7188;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = 199;
    _assert(i7);
  }
}

func _ZZNK22btBvhTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_EN21MyNodeOverlapCallbackD1Ev(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVZNK22btBvhTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_E21MyNodeOverlapCallback;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZZNK22btBvhTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_EN21MyNodeOverlapCallbackD0Ev(sp: Int64)
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
  r1 = _ZTVZNK22btBvhTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_E21MyNodeOverlapCallback;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZZNK22btBvhTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_EN21MyNodeOverlapCallback11processNodeEii(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-72); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1 + 1)]);
  r3 = r2 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3 + 4)]);
  r4 = Int64(heapClassInst.heap32[(fp + 1)]);
  r5 = sp + (-4);
  r6 = sp + (-8);
  r7 = sp + (-12);
  r8 = sp + (-16);
  r9 = sp + (-20);
  r10 = sp + (-24);
  r11 = sp + (-28);
  r12 = sp + (-32);
  heapClassInst.heap32[(g0)] = Int32(r2);
  heapClassInst.heap32[(g0 + 1)] = Int32(r5);
  heapClassInst.heap32[(g0 + 2)] = Int32(r6);
  heapClassInst.heap32[(g0 + 3)] = Int32(r7);
  heapClassInst.heap32[(g0 + 4)] = Int32(r8);
  heapClassInst.heap32[(g0 + 5)] = Int32(r9);
  heapClassInst.heap32[(g0 + 6)] = Int32(r10);
  heapClassInst.heap32[(g0 + 7)] = Int32(r11);
  heapClassInst.heap32[(g0 + 8)] = Int32(r12);
  heapClassInst.heap32[(g0 + 9)] = Int32(r4);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r2 = Int64(heapClassInst.heap32[(fp + (-8))]);
  r3 = (r2 + (-2)) | 0;
  if (`UIntNative`(r3) < `UIntNative`(2)) 
  {
    r3 = Int64(heapClassInst.heap32[(fp + 2)]);
    r5 = Int64(heapClassInst.heap32[(fp + (-5))]);
    r6 = Int64(heapClassInst.heap32[(fp + (-6))]);
    r6 = (r6 * r3) | 0;
    r5 = (r6 + r5) | 0;
    r6 = Int64(heapClassInst.heap32[(r1 + 1)]);
    r5 = (r5 + 8) | 0;
    r7 = 0;
    r8 = r7;
    /*repeat_3:*/ 
    while (true) {
      r9 = r8 << 1;
      r10 = (r7 - r9) | 0;
      if (r2 != 3) 
      {
        r9 = (r5 - r9) | 0;
        r9 = r9 >> 2;
        r9 = Int64(heapClassInst.heap32[(r9)]);
      }
      else {
        r9 = (r5 - r8) | 0;
        r9 = Int64(heapClassInst.heapU16[(r9 + (-4)) >> 1]);
      }
      r11 = Int64(heapClassInst.heap32[(fp + (-4))]);
      r12 = Int64(heapClassInst.heap32[(fp + (-1))]);
      r9 = (r11 * r9) | 0;
      r11 = Int64(heapClassInst.heap32[(fp + (-3))]);
      if (r11 != 0) 
      {
        r11 = (r12 + r9) | 0;
        r13 = r6 >> 2;
        f0 = llvm_readDouble((r11 + 16));
        f1 = llvm_readDouble((r11 + 8));
        f2 = llvm_readDouble((r12 + r9));
        f0 = f0 * 1.0; 
        f3 = Float64(heapClassInst.heapFloat[(r13 + 3)]);
        f1 = f1 * 1.0; 
        f4 = Float64(heapClassInst.heapFloat[(r13 + 2)]);
        f2 = f2 * 1.0; 
        f5 = Float64(heapClassInst.heapFloat[(r13 + 1)]);
        f0 = f0 * f3;
        f1 = f1 * f4;
        f2 = f2 * f5;
      }
      else {
        r9 = (r12 + r9) | 0;
        r9 = r9 >> 2;
        r12 = r6 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r9 + 2)]);
        f1 = Float64(heapClassInst.heapFloat[(r12 + 3)]);
        f2 = Float64(heapClassInst.heapFloat[(r9 + 1)]);
        f3 = Float64(heapClassInst.heapFloat[(r12 + 2)]);
        f4 = Float64(heapClassInst.heapFloat[(r9)]);
        f5 = Float64(heapClassInst.heapFloat[(r12 + 1)]);
        f0 = f0 * f1;
        f1 = f2 * f3;
        f2 = f4 * f5;
      }
      r9 = r10 << 2;
      r11 = r10 << 2;
      r9 = (r0 + r9) | 0;
      r12 = r10 << 2;
      r11 = (r0 + r11) | 0;
      r9 = r9 >> 2;
      r10 = r10 << 2;
      r12 = (r0 + r12) | 0;
      r11 = r11 >> 2;
      heapClassInst.heapFloat[(r9 + 11)] = Float32(f2);
      r9 = (r0 + r10) | 0;
      r10 = r12 >> 2;
      heapClassInst.heapFloat[(r11 + 12)] = Float32(f1);
      r8 = (r8 + 2) | 0;
      r9 = r9 >> 2;
      heapClassInst.heapFloat[(r10 + 13)] = Float32(f0);
      heapClassInst.heap32[(r9 + 14)] = 0;
      if (!(r8 != 6)) 
      {
        break // repeat_3;
      }
    }
    r2 = Int64(heapClassInst.heap32[(r1 + 2)]);
    r5 = r2 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5)]);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5 + 2)]);
    r0 = (r0 + 12) | 0;
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    heapClassInst.heap32[(g0 + 2)] = Int32(r4);
    heapClassInst.heap32[(g0 + 3)] = Int32(r3);
    __FUNCTION_TABLE__[(r5) >> 2](i7);
    r0 = Int64(heapClassInst.heap32[(r1 + 1)]);
    r1 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1 + 6)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r4);
    __FUNCTION_TABLE__[(r1) >> 2](i7);
    return;
  }
  else {
    r0 = _E2_str6187;
    r1 = _E2_str7188;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = 280;
    _assert(i7);
  }
}

func _ZNK22btBvhTriangleMeshShape18serializeSingleBvhEP12btSerializer(sp: Int64)
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
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 13)]);
  if (!(r1 == 0)) 
  {
    r2 = Int64(heapClassInst.heap32[(fp + 1)]);
    r3 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3 + 3)]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    __FUNCTION_TABLE__[(r3) >> 2](i7);
    r3 = r2 >> 2;
    r4 = Int64(heapClassInst.heap32[(r3)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4 + 4)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0 + 1)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0 + 2)] = 1;
    __FUNCTION_TABLE__[(r4) >> 2](i7);
    r1 = commonVariable.r_g0;
    r4 = Int64(heapClassInst.heap32[(r0 + 13)]);
    r5 = r4 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5)]);
    r5 = r5 >> 2;
    r6 = r1 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5 + 4)]);
    r6 = Int64(heapClassInst.heap32[(r6 + 2)]);
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0 + 1)] = Int32(r6);
    heapClassInst.heap32[(g0 + 2)] = Int32(r2);
    __FUNCTION_TABLE__[(r5) >> 2](i7);
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3 + 5)]);
    r0 = Int64(heapClassInst.heap32[(r0 + 13)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0 + 3)] = 1213612625;
    heapClassInst.heap32[(g0 + 4)] = Int32(r0);
    __FUNCTION_TABLE__[(r3) >> 2](i7);
  }
  return;
}

func _ZNK22btBvhTriangleMeshShape30serializeSingleTriangleInfoMapEP12btSerializer(sp: Int64)
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
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 14)]);
  if (!(r1 == 0)) 
  {
    r2 = Int64(heapClassInst.heap32[(fp + 1)]);
    r3 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3 + 2)]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    __FUNCTION_TABLE__[(r3) >> 2](i7);
    r3 = r2 >> 2;
    r4 = Int64(heapClassInst.heap32[(r3)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4 + 4)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0 + 1)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0 + 2)] = 1;
    __FUNCTION_TABLE__[(r4) >> 2](i7);
    r1 = commonVariable.r_g0;
    r4 = Int64(heapClassInst.heap32[(r0 + 14)]);
    r5 = r4 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5)]);
    r5 = r5 >> 2;
    r6 = r1 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5 + 3)]);
    r6 = Int64(heapClassInst.heap32[(r6 + 2)]);
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0 + 1)] = Int32(r6);
    heapClassInst.heap32[(g0 + 2)] = Int32(r2);
    __FUNCTION_TABLE__[(r5) >> 2](i7);
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3 + 5)]);
    r0 = Int64(heapClassInst.heap32[(r0 + 14)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(g0 + 3)] = 1346456916;
    heapClassInst.heap32[(g0 + 4)] = Int32(r0);
    __FUNCTION_TABLE__[(r3) >> 2](i7);
  }
  return;
}

func _ZNK19btTriangleMeshShape37localGetSupportingVertexWithoutMarginERK9btVector3(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = _E2_str10;
  r1 = _E2_str5186;
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  heapClassInst.heap32[(g0 + 2)] = 43;
  _assert(i7);
}

func _ZNK22btBvhTriangleMeshShape9serializeEPvP12btSerializer(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 10)]);
  r3 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = commonVariable.r_g0;
  r4 = Int64(heapClassInst.heap32[(r1)]);
  r4 = r4 >> 2;
  r4 = Int64(heapClassInst.heap32[(r4 + 7)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  r5 = Int64(heapClassInst.heap32[(fp + 1)]);
  __FUNCTION_TABLE__[(r4) >> 2](i7);
  r4 = commonVariable.r_g0;
  r6 = r5 >> 2;
  heapClassInst.heap32[(r6)] = Int32(r4);
  if (!(r4 == 0)) 
  {
    r4 = Int64(heapClassInst.heap32[(r1)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4 + 12)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
    __FUNCTION_TABLE__[(r4) >> 2](i7);
  }
  r2 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r2 + 1)]);
  heapClassInst.heap32[(r6 + 1)] = Int32(r3);
  r3 = Int64(heapClassInst.heap32[(r2 + 12)]);
  r4 = r3 >> 2;
  r4 = Int64(heapClassInst.heap32[(r4)]);
  r4 = r4 >> 2;
  r4 = Int64(heapClassInst.heap32[(r4 + 14)]);
  r5 = (r5 + 12) | 0;
  heapClassInst.heap32[(g0)] = Int32(r3);
  heapClassInst.heap32[(g0 + 1)] = Int32(r5);
  heapClassInst.heap32[(g0 + 2)] = Int32(r0);
  __FUNCTION_TABLE__[(r4) >> 2](i7);
  heapClassInst.heap32[(r6 + 13)] = heapClassInst.heap32[(r2 + 3)];
  r3 = Int64(heapClassInst.heap32[(r2 + 13)]);
  if (r3 == 0) 
  {
    __label__ = 4;
  }
  else {
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3 + 13)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r3) >> 2](i7);
    r3 = commonVariable.r_g0 & 1;
    if (r3 == 0) 
    {
      r3 = Int64(heapClassInst.heap32[(r1)]);
      r3 = r3 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3 + 6)]);
      r4 = Int64(heapClassInst.heap32[(r2 + 13)]);
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r4);
      __FUNCTION_TABLE__[(r3) >> 2](i7);
      r3 = commonVariable.r_g0;
      if (r3 == 0) 
      {
        r3 = Int64(heapClassInst.heap32[(r1)]);
        r3 = r3 >> 2;
        r3 = Int64(heapClassInst.heap32[(r3 + 7)]);
        r4 = Int64(heapClassInst.heap32[(r2 + 13)]);
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r4);
        __FUNCTION_TABLE__[(r3) >> 2](i7);
        heapClassInst.heap32[(r6 + 10)] = Int32(commonVariable.r_g0);
        heapClassInst.heap32[(r6 + 11)] = 0;
        r3 = Int64(heapClassInst.heap32[(r2 + 13)]);
        r4 = r3 >> 2;
        r4 = Int64(heapClassInst.heap32[(r4)]);
        r4 = r4 >> 2;
        r4 = Int64(heapClassInst.heap32[(r4 + 3)]);
        heapClassInst.heap32[(g0)] = Int32(r3);
        __FUNCTION_TABLE__[(r4) >> 2](i7);
        r4 = Int64(heapClassInst.heap32[(r1)]);
        r4 = r4 >> 2;
        r4 = Int64(heapClassInst.heap32[(r4 + 4)]);
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(commonVariable.r_g0);
        heapClassInst.heap32[(g0 + 2)] = 1;
        __FUNCTION_TABLE__[(r4) >> 2](i7);
        r3 = commonVariable.r_g0;
        r4 = Int64(heapClassInst.heap32[(r2 + 13)]);
        r5 = r4 >> 2;
        r5 = Int64(heapClassInst.heap32[(r5)]);
        r5 = r5 >> 2;
        r7 = r3 >> 2;
        r5 = Int64(heapClassInst.heap32[(r5 + 4)]);
        r7 = Int64(heapClassInst.heap32[(r7 + 2)]);
        heapClassInst.heap32[(g0)] = Int32(r4);
        heapClassInst.heap32[(g0 + 1)] = Int32(r7);
        heapClassInst.heap32[(g0 + 2)] = Int32(r0);
        __FUNCTION_TABLE__[(r5) >> 2](i7);
        r5 = Int64(heapClassInst.heap32[(r1)]);
        r5 = r5 >> 2;
        r5 = Int64(heapClassInst.heap32[(r5 + 5)]);
        r7 = Int64(heapClassInst.heap32[(r2 + 13)]);
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r3);
        heapClassInst.heap32[(g0 + 2)] = Int32(commonVariable.r_g0);
        heapClassInst.heap32[(g0 + 3)] = 1213612625;
        heapClassInst.heap32[(g0 + 4)] = Int32(r7);
        __FUNCTION_TABLE__[(r5) >> 2](i7);
        __label__ = 8;
      }
      else {
        heapClassInst.heap32[(r6 + 10)] = Int32(r3);
        heapClassInst.heap32[(r6 + 11)] = 0;
        __label__ = 8;
      }
    }
    else {
      __label__ = 4;
    }
  }
  if (__label__ == 4) {
    heapClassInst.heap32[(r6 + 10)] = 0;
    heapClassInst.heap32[(r6 + 11)] = 0;
  }
  r3 = Int64(heapClassInst.heap32[(r2 + 14)]);
  if (r3 == 0) 
  {
    __label__ = 10;
  }
  else {
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3 + 13)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r3) >> 2](i7);
    r3 = commonVariable.r_g0 & 2;
    if (r3 == 0) 
    {
      r3 = Int64(heapClassInst.heap32[(r1)]);
      r3 = r3 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3 + 6)]);
      r4 = Int64(heapClassInst.heap32[(r2 + 14)]);
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r4);
      __FUNCTION_TABLE__[(r3) >> 2](i7);
      r3 = commonVariable.r_g0;
      if (r3 == 0) 
      {
        r3 = Int64(heapClassInst.heap32[(r1)]);
        r3 = r3 >> 2;
        r3 = Int64(heapClassInst.heap32[(r3 + 7)]);
        r4 = Int64(heapClassInst.heap32[(r2 + 14)]);
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r4);
        __FUNCTION_TABLE__[(r3) >> 2](i7);
        heapClassInst.heap32[(r6 + 12)] = Int32(commonVariable.r_g0);
        r3 = Int64(heapClassInst.heap32[(r2 + 14)]);
        r4 = r3 >> 2;
        r4 = Int64(heapClassInst.heap32[(r4)]);
        r4 = r4 >> 2;
        r4 = Int64(heapClassInst.heap32[(r4 + 2)]);
        heapClassInst.heap32[(g0)] = Int32(r3);
        __FUNCTION_TABLE__[(r4) >> 2](i7);
        r4 = Int64(heapClassInst.heap32[(r1)]);
        r4 = r4 >> 2;
        r4 = Int64(heapClassInst.heap32[(r4 + 4)]);
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(commonVariable.r_g0);
        heapClassInst.heap32[(g0 + 2)] = 1;
        __FUNCTION_TABLE__[(r4) >> 2](i7);
        r3 = commonVariable.r_g0;
        r4 = Int64(heapClassInst.heap32[(r2 + 14)]);
        r5 = r4 >> 2;
        r5 = Int64(heapClassInst.heap32[(r5)]);
        r5 = r5 >> 2;
        r6 = r3 >> 2;
        r5 = Int64(heapClassInst.heap32[(r5 + 3)]);
        r6 = Int64(heapClassInst.heap32[(r6 + 2)]);
        heapClassInst.heap32[(g0)] = Int32(r4);
        heapClassInst.heap32[(g0 + 1)] = Int32(r6);
        heapClassInst.heap32[(g0 + 2)] = Int32(r0);
        __FUNCTION_TABLE__[(r5) >> 2](i7);
        r1 = Int64(heapClassInst.heap32[(r1)]);
        r1 = r1 >> 2;
        r1 = Int64(heapClassInst.heap32[(r1 + 5)]);
        r2 = Int64(heapClassInst.heap32[(r2 + 14)]);
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r3);
        heapClassInst.heap32[(g0 + 2)] = Int32(commonVariable.r_g0);
        heapClassInst.heap32[(g0 + 3)] = 1346456916;
        heapClassInst.heap32[(g0 + 4)] = Int32(r2);
        __FUNCTION_TABLE__[(r1) >> 2](i7);
        __label__ = 11;
      }
      else {
        heapClassInst.heap32[(r6 + 12)] = Int32(r3);
        __label__ = 11;
      }
    }
    else {
      __label__ = 10;
    }
  }
  if (__label__ == 10) {
    heapClassInst.heap32[(r6 + 12)] = 0;
  }
  r0 = _E2_str8189;
  commonVariable.r_g0 = r0;
  return;
}

func _ZN22btBvhTriangleMeshShape17buildOptimizedBvhEv(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-72); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heapU8[r0 + 61]);
  if (!(r1 == 0)) 
  {
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1 + 13)]);
    r3 = r2 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    __FUNCTION_TABLE__[(r3) >> 2](i7);
    r1 = Int64(heapClassInst.heap32[(r1 + 13)]);
    if (!(r1 == 0)) 
    {
      r2 = gNumAlignedFree;
      r2 = r2 >> 2;
      r3 = Int64(heapClassInst.heap32[(r2)]);
      r3 = (r3 + 1) | 0;
      r1 = r1 >> 2;
      heapClassInst.heap32[(r2)] = Int32(r3);
      r1 = Int64(heapClassInst.heap32[(r1 + (-1))]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      free(i7);
    }
  }
  r1 = gNumAlignedAllocs;
  r1 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = (r2 + 1) | 0;
  heapClassInst.heap32[(r1)] = Int32(r2);
  heapClassInst.heap32[(g0)] = 191;
  mallocNew(i7);
  r2 = commonVariable.r_g0;
  if (r2 != 0) 
  {
    r3 = 0;
    r4 = (r2 + 4) | 0;
    r3 = (r3 - r4) | 0;
    r3 = r3 & 15;
    r3 = (r2 + r3) | 0;
    r4 = (r3 + 4) | 0;
    r3 = r3 >> 2;
    heapClassInst.heap32[(r3)] = Int32(r2);
    r2 = r4;
  }
  r3 = r2 >> 2;
  r4 = 1;
  heapClassInst.heap32[(r3 + 13)] = 277;
  heapClassInst.heap8[r2 + 80] = Int8(r4);
  heapClassInst.heap32[(r3 + 19)] = 0;
  heapClassInst.heap32[(r3 + 17)] = 0;
  heapClassInst.heap32[(r3 + 18)] = 0;
  heapClassInst.heap8[r2 + 100] = Int8(r4);
  heapClassInst.heap32[(r3 + 24)] = 0;
  heapClassInst.heap32[(r3 + 22)] = 0;
  heapClassInst.heap32[(r3 + 23)] = 0;
  heapClassInst.heap8[r2 + 120] = Int8(r4);
  heapClassInst.heap32[(r3 + 29)] = 0;
  heapClassInst.heap32[(r3 + 27)] = 0;
  heapClassInst.heap32[(r3 + 28)] = 0;
  heapClassInst.heap8[r2 + 140] = Int8(r4);
  heapClassInst.heap32[(r3 + 34)] = 0;
  heapClassInst.heap32[(r3 + 32)] = 0;
  heapClassInst.heap32[(r3 + 33)] = 0;
  heapClassInst.heap32[(r3 + 36)] = 0;
  heapClassInst.heap8[r2 + 164] = Int8(r4);
  heapClassInst.heap32[(r3 + 40)] = 0;
  heapClassInst.heap32[(r3 + 38)] = 0;
  heapClassInst.heap32[(r3 + 39)] = 0;
  heapClassInst.heap32[(r3 + 42)] = 0;
  heapClassInst.heap32[(r3 + 1)] = ( -8388609);
  heapClassInst.heap32[(r3 + 2)] = ( -8388609);
  heapClassInst.heap32[(r3 + 3)] = ( -8388609);
  heapClassInst.heap32[(r3 + 4)] = 0;
  heapClassInst.heap32[(r3 + 5)] = 2139095039;
  heapClassInst.heap32[(r3 + 6)] = 2139095039;
  r5 = _ZTV14btOptimizedBvh;
  heapClassInst.heap32[(r3 + 7)] = 2139095039;
  r5 = (r5 + 8) | 0;
  heapClassInst.heap32[(r3 + 8)] = 0;
  r6 = r0 >> 2;
  heapClassInst.heap32[(r3)] = Int32(r5);
  heapClassInst.heap32[(r6 + 13)] = Int32(r2);
  r5 = Int64(heapClassInst.heap32[(r6 + 12)]);
  r7 = Int64(heapClassInst.heapU8[r0 + 60]);
  heapClassInst.heap8[r2 + 60] = Int8(r7);
  if (r7 == 0) 
  {
    r6 = _ZTVZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_E20NodeTriangleCallback;
    r7 = sp + (-24);
    r6 = (r6 + 8) | 0;
    r8 = r7 >> 2;
    r9 = (r2 + 64) | 0;
    heapClassInst.heap32[(fp + (-6))] = Int32(r6);
    r6 = sp + (-40);
    heapClassInst.heap32[(r8 + 1)] = Int32(r9);
    r8 = r6 >> 2;
    heapClassInst.heap32[(fp + (-10))] = ( -581039253);
    heapClassInst.heap32[(r8 + 1)] = ( -581039253);
    heapClassInst.heap32[(r8 + 2)] = ( -581039253);
    r9 = sp + (-56);
    heapClassInst.heap32[(r8 + 3)] = 0;
    r8 = r9 >> 2;
    heapClassInst.heap32[(fp + (-14))] = 1566444395;
    heapClassInst.heap32[(r8 + 1)] = 1566444395;
    heapClassInst.heap32[(r8 + 2)] = 1566444395;
    r10 = r5 >> 2;
    heapClassInst.heap32[(r8 + 3)] = 0;
    r8 = Int64(heapClassInst.heap32[(r10)]);
    r8 = r8 >> 2;
    r8 = Int64(heapClassInst.heap32[(r8 + 2)]);
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0 + 1)] = Int32(r7);
    heapClassInst.heap32[(g0 + 2)] = Int32(r6);
    heapClassInst.heap32[(g0 + 3)] = Int32(r9);
    __FUNCTION_TABLE__[(r8) >> 2](i7);
    r5 = Int64(heapClassInst.heap32[(r3 + 17)]);
    r6 = Int64(heapClassInst.heap32[(r3 + 22)]);
    r7 = r5 << 1;
    if (!(r6 >= r7)) 
    {
      r8 = Int64(heapClassInst.heap32[(r3 + 23)]);
      if (!(r8 >= r7)) 
      {
        if (r7 != 0) 
        {
          r8 = Int64(heapClassInst.heap32[(r1)]);
          r8 = (r8 + 1) | 0;
          r9 = r5 << 7;
          heapClassInst.heap32[(r1)] = Int32(r8);
          r8 = r9 | 19;
          heapClassInst.heap32[(g0)] = Int32(r8);
          mallocNew(i7);
          r8 = commonVariable.r_g0;
          if (r8 != 0) 
          {
            r9 = 0;
            r10 = (r8 + 4) | 0;
            r9 = (r9 - r10) | 0;
            r9 = r9 & 15;
            r9 = (r8 + r9) | 0;
            r10 = (r9 + 4) | 0;
            r9 = r9 >> 2;
            heapClassInst.heap32[(r9)] = Int32(r8);
            r8 = r10;
          }
        }
        else {
          r8 = 0;
        }
        if (!(r6 < 1)) 
        {
          r9 = 0;
          /*repeat_20:*/ 
          while (true) {
            r10 = Int64(heapClassInst.heap32[(r3 + 24)]);
            r11 = (r8 + r9) | 0;
            r10 = (r10 + r9) | 0;
            heapClassInst.heap32[(g0)] = Int32(r11);
            heapClassInst.heap32[(g0 + 1)] = Int32(r10);
            heapClassInst.heap32[(g0 + 2)] = 64;
            r6 = (r6 + (-1)) | 0;
            r9 = (r9 + 64) | 0;
            memcpy(i7);
            if (!(r6 != 0)) 
            {
              break //repeat_20;
            }
          }
        }
        r6 = Int64(heapClassInst.heap32[(r3 + 24)]);
        if (!(r6 == 0)) 
        {
          r9 = Int64(heapClassInst.heapU8[r2 + 100]);
          if (!(r9 == 0)) 
          {
            r9 = gNumAlignedFree;
            r9 = r9 >> 2;
            r10 = Int64(heapClassInst.heap32[(r9)]);
            r10 = (r10 + 1) | 0;
            r6 = r6 >> 2;
            heapClassInst.heap32[(r9)] = Int32(r10);
            r6 = Int64(heapClassInst.heap32[(r6 + (-1))]);
            heapClassInst.heap32[(g0)] = Int32(r6);
            free(i7);
          }
          heapClassInst.heap32[(r3 + 24)] = 0;
        }
        r6 = 1;
        heapClassInst.heap8[r2 + 100] = Int8(r6);
        heapClassInst.heap32[(r3 + 24)] = Int32(r8);
        heapClassInst.heap32[(r3 + 23)] = Int32(r7);
      }
    }
    r6 = _ZTV31btInternalTriangleIndexCallback;
    r6 = (r6 + 8) | 0;
    heapClassInst.heap32[(r3 + 22)] = Int32(r7);
    heapClassInst.heap32[(fp + (-6))] = Int32(r6);
  }
  else {
    r7 = (r2 + 4) | 0;
    r8 = (r2 + 20) | 0;
    f0 = -1.0
    f1 = Float64(heapClassInst.heapFloat[(r6 + 6)]);
    f2 = Float64(heapClassInst.heapFloat[(r6 + 5)]);
    f3 = Float64(heapClassInst.heapFloat[(r6 + 4)]);
    f3 = f3 + f0;
    f2 = f2 + f0;
    heapClassInst.heapFloat[(r3 + 1)] = Float32(f3);
    f0 = f1 + f0;
    heapClassInst.heapFloat[(r3 + 2)] = Float32(f2);
    heapClassInst.heapFloat[(r3 + 3)] = Float32(f0);
    heapClassInst.heap32[(r3 + 4)] = 0;
    f1 = 1.0
    f4 = Float64(heapClassInst.heapFloat[(r6 + 10)]);
    f5 = Float64(heapClassInst.heapFloat[(r6 + 9)]);
    f6 = Float64(heapClassInst.heapFloat[(r6 + 8)]);
    f6 = f6 + f1;
    f5 = f5 + f1;
    heapClassInst.heapFloat[(r3 + 5)] = Float32(f6);
    f1 = f4 + f1;
    heapClassInst.heapFloat[(r3 + 6)] = Float32(f5);
    heapClassInst.heapFloat[(r3 + 7)] = Float32(f1);
    f4 = 65533.0;
    f3 = f6 - f3;
    f2 = f5 - f2;
    f3 = f4 / f3;
    heapClassInst.heap32[(r3 + 8)] = 0;
    f0 = f1 - f0;
    f1 = f4 / f2;
    heapClassInst.heapFloat[(r3 + 9)] = Float32(f3);
    f0 = f4 / f0;
    heapClassInst.heapFloat[(r3 + 10)] = Float32(f1);
    heapClassInst.heapFloat[(r3 + 11)] = Float32(f0);
    r6 = _ZTVZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_E29QuantizedNodeTriangleCallback;
    heapClassInst.heap32[(r3 + 12)] = 0;
    r9 = sp + (-16);
    r6 = (r6 + 8) | 0;
    heapClassInst.heap8[r2 + 60] = Int8(r4);
    r10 = r9 >> 2;
    r11 = (r2 + 104) | 0;
    heapClassInst.heap32[(fp + (-4))] = Int32(r6);
    heapClassInst.heap32[(r10 + 1)] = Int32(r11);
    r6 = r5 >> 2;
    heapClassInst.heap32[(r10 + 2)] = Int32(r2);
    r6 = Int64(heapClassInst.heap32[(r6)]);
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6 + 2)]);
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0 + 1)] = Int32(r9);
    heapClassInst.heap32[(g0 + 2)] = Int32(r7);
    heapClassInst.heap32[(g0 + 3)] = Int32(r8);
    __FUNCTION_TABLE__[(r6) >> 2](i7);
    r5 = Int64(heapClassInst.heap32[(r3 + 27)]);
    r6 = Int64(heapClassInst.heap32[(r3 + 32)]);
    r7 = r5 << 1;
    // repeat_31:
    do {
      if (!(r6 >= r7)) 
      {
        r8 = (r2 + 124) | 0;
        heapClassInst.heap32[(g0)] = Int32(r8);
        heapClassInst.heap32[(g0 + 1)] = Int32(r7);
        r8 = (r7 - r6) | 0;
        r6 = r6 << 4;
        _ZN20btAlignedObjectArrayI18btQuantizedBvhNodeE7reserveEi(i7);
        /*repeat_33: */
        while (true) {
          r9 = Int64(heapClassInst.heap32[(r3 + 34)]);
          r9 = (r9 + r6) | 0;
          r9 = r9 >> 2;
          r8 = (r8 + (-1)) | 0;
          r6 = (r6 + 16) | 0;
          heapClassInst.heap32[(r9)] = 0;
          heapClassInst.heap32[(r9 + 1)] = 0;
          heapClassInst.heap32[(r9 + 2)] = 0;
          heapClassInst.heap32[(r9 + 3)] = 0;
          if (!(r8 != 0)) 
          {
            break // repeat_31;
          }
        }
        break
      }
    } while (false);
    r6 = _ZTV31btInternalTriangleIndexCallback;
    r6 = (r6 + 8) | 0;
    heapClassInst.heap32[(r3 + 32)] = Int32(r7);
    heapClassInst.heap32[(fp + (-4))] = Int32(r6);
  }
  heapClassInst.heap32[(r3 + 14)] = 0;
  heapClassInst.heap32[(g0)] = Int32(r2);
  heapClassInst.heap32[(g0 + 1)] = 0;
  heapClassInst.heap32[(g0 + 2)] = Int32(r5);
  _ZN14btQuantizedBvh9buildTreeEii(i7);
  r5 = Int64(heapClassInst.heapU8[r2 + 60]);
  if (!(r5 == 0)) 
  {
    r5 = Int64(heapClassInst.heap32[(r3 + 38)]);
    if (!(r5 != 0)) 
    {
      r6 = Int64(heapClassInst.heap32[(r3 + 39)]);
      if (r6 != r5) 
      {
        __label__ = 29;
      }
      else {
        if (r6 < 1) 
        {
          r6 = Int64(heapClassInst.heap32[(r1)]);
          r6 = (r6 + 1) | 0;
          heapClassInst.heap32[(r1)] = Int32(r6);
          heapClassInst.heap32[(g0)] = 51;
          mallocNew(i7);
          r1 = commonVariable.r_g0;
          if (r1 != 0) 
          {
            r6 = 0;
            r7 = (r1 + 4) | 0;
            r6 = (r6 - r7) | 0;
            r6 = r6 & 15;
            r6 = (r1 + r6) | 0;
            r7 = (r6 + 4) | 0;
            r6 = r6 >> 2;
            heapClassInst.heap32[(r6)] = Int32(r1);
            r1 = r7;
          }
          r6 = Int64(heapClassInst.heap32[(r3 + 40)]);
          if (!(r6 == 0)) 
          {
            r7 = Int64(heapClassInst.heapU8[r2 + 164]);
            if (!(r7 == 0)) 
            {
              r7 = gNumAlignedFree;
              r7 = r7 >> 2;
              r8 = Int64(heapClassInst.heap32[(r7)]);
              r8 = (r8 + 1) | 0;
              r6 = r6 >> 2;
              heapClassInst.heap32[(r7)] = Int32(r8);
              r6 = Int64(heapClassInst.heap32[(r6 + (-1))]);
              heapClassInst.heap32[(g0)] = Int32(r6);
              free(i7);
            }
            heapClassInst.heap32[(r3 + 40)] = 0;
          }
          r6 = 1;
          heapClassInst.heap8[r2 + 164] = Int8(r6);
          heapClassInst.heap32[(r3 + 40)] = Int32(r1);
          heapClassInst.heap32[(r3 + 39)] = 1;
          r6 = Int64(heapClassInst.heap32[(r3 + 38)]);
          r6 = (r6 + 1) | 0;
          __label__ = 37;
        }
        else {
          __label__ = 29;
        }
      }
      if (__label__ == 29) {
        r1 = Int64(heapClassInst.heap32[(r3 + 40)]);
        r6 = r4;
      }
      heapClassInst.heap32[(r3 + 38)] = Int32(r6);
      r6 = Int64(heapClassInst.heap32[(r3 + 34)]);
      r7 = Int64(heapClassInst.heapU16[(r6) >> 1]);
      r5 = r5 << 5;
      heapClassInst.heap16[(r1 + r5) >> 1] = Int16(r7);
      r1 = (r1 + r5) | 0;
      r5 = Int64(heapClassInst.heapU16[(r6 + 2) >> 1]);
      heapClassInst.heap16[(r1 + 2) >> 1] = Int16(r5);
      r5 = Int64(heapClassInst.heapU16[(r6 + 4) >> 1]);
      heapClassInst.heap16[(r1 + 4) >> 1] = Int16(r5);
      r5 = Int64(heapClassInst.heapU16[(r6 + 6) >> 1]);
      heapClassInst.heap16[(r1 + 6) >> 1] = Int16(r5);
      r5 = Int64(heapClassInst.heapU16[(r6 + 8) >> 1]);
      heapClassInst.heap16[(r1 + 8) >> 1] = Int16(r5);
      r5 = Int64(heapClassInst.heapU16[(r6 + 10) >> 1]);
      r6 = r1 >> 2;
      heapClassInst.heap16[(r1 + 10) >> 1] = Int16(r5);
      heapClassInst.heap32[(r6 + 3)] = 0;
      r1 = Int64(heapClassInst.heap32[(r3 + 34)]);
      r1 = r1 >> 2;
      r1 = Int64(heapClassInst.heap32[(r1 + 3)]);
      r5 = 0;
      r5 = (r5 - r1) | 0;
      r1 = if (r1 < 0) {r5} else {r4};
      heapClassInst.heap32[(r6 + 4)] = Int32(r1);
    }
  }
  r1 = Int64(heapClassInst.heap32[(r3 + 38)]);
  heapClassInst.heap32[(r3 + 42)] = Int32(r1);
  r1 = Int64(heapClassInst.heap32[(r3 + 29)]);
  if (!(r1 == 0)) 
  {
    r4 = Int64(heapClassInst.heapU8[r2 + 120]);
    if (!(r4 == 0)) 
    {
      r4 = gNumAlignedFree;
      r4 = r4 >> 2;
      r5 = Int64(heapClassInst.heap32[(r4)]);
      r5 = (r5 + 1) | 0;
      r1 = r1 >> 2;
      heapClassInst.heap32[(r4)] = Int32(r5);
      r1 = Int64(heapClassInst.heap32[(r1 + (-1))]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      free(i7);
    }
    heapClassInst.heap32[(r3 + 29)] = 0;
  }
  r1 = 1;
  heapClassInst.heap8[r2 + 120] = Int8(r1);
  heapClassInst.heap32[(r3 + 29)] = 0;
  heapClassInst.heap32[(r3 + 27)] = 0;
  heapClassInst.heap32[(r3 + 28)] = 0;
  r4 = Int64(heapClassInst.heap32[(r3 + 19)]);
  if (!(r4 == 0)) 
  {
    r5 = Int64(heapClassInst.heapU8[r2 + 80]);
    if (!(r5 == 0)) 
    {
      r5 = gNumAlignedFree;
      r5 = r5 >> 2;
      r6 = Int64(heapClassInst.heap32[(r5)]);
      r6 = (r6 + 1) | 0;
      r4 = r4 >> 2;
      heapClassInst.heap32[(r5)] = Int32(r6);
      r4 = Int64(heapClassInst.heap32[(r4 + (-1))]);
      heapClassInst.heap32[(g0)] = Int32(r4);
      free(i7);
    }
    heapClassInst.heap32[(r3 + 19)] = 0;
  }
  heapClassInst.heap8[r2 + 80] = Int8(r1);
  heapClassInst.heap32[(r3 + 19)] = 0;
  heapClassInst.heap32[(r3 + 17)] = 0;
  heapClassInst.heap32[(r3 + 18)] = 0;
  heapClassInst.heap8[r0 + 61] = Int8(r1);
  return;
}

func _ZN22btBvhTriangleMeshShape15setLocalScalingERK9btVector3(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 7)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = commonVariable.r_g0 >> 2;
  r3 = r3 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r3)]);
  f1 = Float64(heapClassInst.heapFloat[(r2)]);
  f2 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
  f3 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
  f1 = f1 - f0;
  f2 = f2 - f3;
  f3 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
  f4 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
  f3 = f3 - f4;
  f1 = f1 * f1;
  f2 = f2 * f2;
  f1 = f1 + f2;
  f2 = f3 * f3;
  f1 = f1 + f2;
  f2 = 1.1920928955078125e-007;
  if (!(f1 <= f2)) 
  {
    r1 = Int64(heapClassInst.heap32[(r1 + 12)]);
    r1 = r1 >> 2;
    heapClassInst.heapFloat[(r1 + 1)] = Float32(f0);
    heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r3 + 1)];
    heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r3 + 2)];
    heapClassInst.heap32[(r1 + 4)] = heapClassInst.heap32[(r3 + 3)];
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZN19btTriangleMeshShape15recalcLocalAabbEv(i7);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZN22btBvhTriangleMeshShape17buildOptimizedBvhEv(i7);
  }
  return;
}

func _ZNK22btBvhTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-80); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = _ZTVZNK22btBvhTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_E21MyNodeOverlapCallback;
  r2 = sp + (-64);
  r3 = Int64(heapClassInst.heap32[(r0 + 12)]);
  r1 = (r1 + 8) | 0;
  r4 = r2 >> 2;
  heapClassInst.heap32[(fp + (-16))] = Int32(r1);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heap32[(r4 + 1)] = Int32(r3);
  heapClassInst.heap32[(r4 + 2)] = Int32(r1);
  r0 = Int64(heapClassInst.heap32[(r0 + 13)]);
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  r3 = Int64(heapClassInst.heap32[(fp + 3)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  heapClassInst.heap32[(g0 + 2)] = Int32(r1);
  heapClassInst.heap32[(g0 + 3)] = Int32(r3);
  _ZNK14btQuantizedBvh26reportAabbOverlappingNodexEP21btNodeOverlapCallbackRK9btVector3S4_(i7);
  return;
}

func _ZN22btBvhTriangleMeshShapeD0Ev(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV22btBvhTriangleMeshShape;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r1 = Int64(heapClassInst.heapU8[r0 + 61]);
  if (r1 == 0) 
  {
    __label__ = 3;
  }
  else {
    r1 = Int64(heapClassInst.heap32[(r2 + 13)]);
    r3 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    __FUNCTION_TABLE__[(r3) >> 2](i7);
    r1 = Int64(heapClassInst.heap32[(r2 + 13)]);
    if (r1 == 0) 
    {
      __label__ = 3;
    }
    else {
      r0 = gNumAlignedFree;
      r0 = r0 >> 2;
      r3 = Int64(heapClassInst.heap32[(r0)]);
      r3 = (r3 + 1) | 0;
      r1 = r1 >> 2;
      heapClassInst.heap32[(r0)] = Int32(r3);
      r0 = Int64(heapClassInst.heap32[(r1 + (-1))]);
      r1 = _ZTV14btConcaveShape;
      heapClassInst.heap32[(g0)] = Int32(r0);
      r0 = (r1 + 8) | 0;
      free(i7);
      heapClassInst.heap32[(r2)] = Int32(r0);
      __label__ = 4;
    }
  }
  if (__label__ == 3) {
    r1 = _ZTV14btConcaveShape;
    r1 = (r1 + 8) | 0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    if (r0 == 0) 
    {
      __label__ = 5;
    }
    else {
      __label__ = 4;
    }
  }
  if (__label__ == 4) {
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

func _ZN22btBvhTriangleMeshShapeD1Ev(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV22btBvhTriangleMeshShape;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r0 = Int64(heapClassInst.heapU8[r0 + 61]);
  if (!(r0 == 0)) 
  {
    r0 = Int64(heapClassInst.heap32[(r2 + 13)]);
    r1 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __FUNCTION_TABLE__[(r1) >> 2](i7);
    r0 = Int64(heapClassInst.heap32[(r2 + 13)]);
    if (!(r0 == 0)) 
    {
      r1 = gNumAlignedFree;
      r1 = r1 >> 2;
      r3 = Int64(heapClassInst.heap32[(r1)]);
      r3 = (r3 + 1) | 0;
      r0 = r0 >> 2;
      heapClassInst.heap32[(r1)] = Int32(r3);
      r0 = Int64(heapClassInst.heap32[(r0 + (-1))]);
      heapClassInst.heap32[(g0)] = Int32(r0);
      free(i7);
    }
  }
  r0 = _ZTV14btConcaveShape;
  r0 = (r0 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r0);
  return;
}

func _ZNK21btConvexInternalShape36getNumPreferredPenetrationDirectionsEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = 0;
  commonVariable.r_g0 = r0;
  return;
}

func _ZN14btCapsuleShape9setMarginEf(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f0 = commonVariable.f_g0;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f1 = commonVariable.f_g0;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f2 = commonVariable.f_g0;
  f3 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
  f4 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
  f5 = Float64(heapClassInst.heapFloat[(r1 + 7)]);
  heapClassInst.heap32[(r1 + 11)] = heapClassInst.heap32[(fp + 1)];
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
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
  f2 = f5 + f2;
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f1 = f4 + f1;
  f2 = f2 - commonVariable.f_g0;
  f0 = f3 + f0;
  f1 = f1 - f7;
  heapClassInst.heapFloat[(r1 + 7)] = Float32(f2);
  f0 = f0 - f6;
  heapClassInst.heapFloat[(r1 + 8)] = Float32(f1);
  heapClassInst.heapFloat[(r1 + 9)] = Float32(f0);
  heapClassInst.heap32[(r1 + 10)] = 0;
  return;
}

func _ZNK14btCapsuleShape7getNameEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = _E2_str194;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK14btCapsuleShape7getAabbERK11btTransformR9btVector3S4_(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1 + 13)]);
  r3 = (r2 + 2) | 0;
  r3 = (r3 % 3) | 0;
  r4 = (r0 + 28) | 0;
  r3 = r3 << 2;
  r3 = (r4 + r3) | 0;
  r3 = r3 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r3)]);
  r3 = sp + (-16);
  r5 = r3 >> 2;
  heapClassInst.heapFloat[(fp + (-4))] = Float32(f0);
  r2 = r2 << 2;
  heapClassInst.heapFloat[(r5 + 1)] = Float32(f0);
  r4 = (r4 + r2) | 0;
  heapClassInst.heapFloat[(r5 + 2)] = Float32(f0);
  r4 = r4 >> 2;
  heapClassInst.heap32[(r5 + 3)] = 0;
  r2 = (r3 + r2) | 0;
  f1 = Float64(heapClassInst.heapFloat[(r4)]);
  r2 = r2 >> 2;
  f0 = f0 + f1;
  heapClassInst.heapFloat[(r2)] = Float32(f0);
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f0 = commonVariable.f_g0;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f1 = commonVariable.f_g0;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  f3 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
  f2 = f3 + commonVariable.f_g0;
  heapClassInst.heapFloat[(fp + (-4))] = Float32(f2);
  f3 = Float64(heapClassInst.heapFloat[(r5 + 1)]);
  f1 = f3 + f1;
  heapClassInst.heapFloat[(r5 + 1)] = Float32(f1);
  f3 = Float64(heapClassInst.heapFloat[(r5 + 2)]);
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  f0 = f3 + f0;
  r0 = r0 >> 2;
  heapClassInst.heapFloat[(r5 + 2)] = Float32(f0);
  f3 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  r2 = Int64(heapClassInst.heap32[(fp + 3)]);
  f4 = 0.0;
  if (f3 < f4) 
  {
    f3 = -f3;
  }
  f5 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
  if (f5 < f4) 
  {
    f5 = -f5;
  }
  f6 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
  if (f6 < f4) 
  {
    f6 = -f6;
  }
  f7 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
  if (f7 < f4) 
  {
    f7 = -f7;
  }
  f8 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
  if (f8 < f4) 
  {
    f8 = -f8;
  }
  f9 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
  if (f9 < f4) 
  {
    f9 = -f9;
  }
  f10 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  if (f10 < f4) 
  {
    f10 = -f10;
  }
  f11 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  if (f11 < f4) 
  {
    f11 = -f11;
  }
  f12 = Float64(heapClassInst.heapFloat[(r0)]);
  if (f12 < f4) 
  {
    f12 = -f12;
  }
  f4 = f12 * f2;
  f11 = f11 * f1;
  f9 = f9 * f2;
  f8 = f8 * f1;
  f4 = f4 + f11;
  f10 = f10 * f0;
  f2 = f6 * f2;
  f1 = f5 * f1;
  f5 = f9 + f8;
  f6 = f7 * f0;
  f4 = f4 + f10;
  f7 = Float64(heapClassInst.heapFloat[(r0 + 12)]);
  f8 = Float64(heapClassInst.heapFloat[(r0 + 13)]);
  f9 = Float64(heapClassInst.heapFloat[(r0 + 14)]);
  f5 = f5 + f6;
  r0 = r1 >> 2;
  f1 = f2 + f1;
  f0 = f3 * f0;
  f2 = f7 - f4;
  f0 = f1 + f0;
  f1 = f8 - f5;
  heapClassInst.heapFloat[(r0)] = Float32(f2);
  f2 = f9 - f0;
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f1);
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f2);
  r1 = r2 >> 2;
  f1 = f7 + f4;
  heapClassInst.heap32[(r0 + 3)] = 0;
  f2 = f8 + f5;
  heapClassInst.heapFloat[(r1)] = Float32(f1);
  f0 = f9 + f0;
  heapClassInst.heapFloat[(r1 + 1)] = Float32(f2);
  heapClassInst.heapFloat[(r1 + 2)] = Float32(f0);
  heapClassInst.heap32[(r1 + 3)] = 0;
  return;
}

func _ZNK14btCapsuleShape28calculateSerializeBufferSizeEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = 60;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK14btCapsuleShape49batchedUnitVectorGetSupportingVertexWithoutMarginEPK9btVector3PS0_i(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-40); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 3)]);
  if (!(r0 < 1)) 
  {
    r1 = Int64(heapClassInst.heap32[(fp)]);
    r2 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(r2 + 13)]);
    r4 = (r3 + 2) | 0;
    r4 = (r4 % 3) | 0;
    r4 = r4 << 2;
    r4 = (r1 + r4) | 0;
    r4 = r4 >> 2;
    r5 = Int64(heapClassInst.heap32[(fp + 1)]);
    r6 = Int64(heapClassInst.heap32[(fp + 2)]);
    f0 = Float64(heapClassInst.heapFloat[(r4 + 7)]);
    r0 = (r0 + (-1)) | 0;
    r4 = (r5 + 8) | 0;
    r5 = (r6 + 8) | 0;
    /*repeat_3:*/ 
    while (true) {
      r6 = sp + (-16);
      heapClassInst.heap32[(fp + (-4))] = 0;
      r7 = r6 >> 2;
      r3 = r3 << 2;
      heapClassInst.heap32[(r7 + 1)] = 0;
      r6 = (r6 + r3) | 0;
      r3 = (r1 + r3) | 0;
      heapClassInst.heap32[(r7 + 2)] = 0;
      r6 = r6 >> 2;
      r3 = r3 >> 2;
      heapClassInst.heap32[(r7 + 3)] = 0;
      heapClassInst.heap32[(r6)] = heapClassInst.heap32[(r3 + 7)];
      r3 = Int64(heapClassInst.heap32[(r2)]);
      r3 = r3 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3 + 11)]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      __FUNCTION_TABLE__[(r3) >> 2](i7);
      r3 = r4 >> 2;
      f2 = Float64(heapClassInst.heapFloat[(r3 + (-1))]);
      f3 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
      f4 = Float64(heapClassInst.heapFloat[(r3 + (-2))]);
      f5 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
      f6 = Float64(heapClassInst.heapFloat[(r3)]);
      f7 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
      f3 = f2 * f3;
      f5 = f4 * f5;
      f7 = f6 * f7;
      f8 = Float64(heapClassInst.heapFloat[(r7 + 1)]);
      f3 = f3 * f0;
      f9 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
      f5 = f5 * f0;
      f10 = Float64(heapClassInst.heapFloat[(r7 + 2)]);
      f7 = f7 * f0;
      f3 = f8 + f3;
      f8 = f2 * commonVariable.f_g0;
      f5 = f9 + f5;
      f9 = f4 * commonVariable.f_g0;
      f3 = f3 - f8;
      f5 = f5 - f9;
      f7 = f10 + f7;
      f1 = f6 * commonVariable.f_g0;
      f1 = f7 - f1;
      f4 = f4 * f5;
      f2 = f2 * f3;
      f2 = f4 + f2;
      f4 = f6 * f1;
      f2 = f2 + f4;
      f4 = ( -999999984306749440.0);
      if (f2 > f4) 
      {
        r6 = r5 >> 2;
        heapClassInst.heapFloat[(r6 + (-2))] = Float32(f5);
        heapClassInst.heapFloat[(r6 + (-1))] = Float32(f3);
        heapClassInst.heapFloat[(r6)] = Float32(f1);
        heapClassInst.heap32[(r6 + 1)] = 0;
        f4 = f2;
      }
      r6 = sp + (-32);
      heapClassInst.heap32[(fp + (-8))] = 0;
      r7 = r6 >> 2;
      heapClassInst.heap32[(r7 + 1)] = 0;
      heapClassInst.heap32[(r7 + 2)] = 0;
      heapClassInst.heap32[(r7 + 3)] = 0;
      r8 = Int64(heapClassInst.heap32[(r2 + 13)]);
      r8 = r8 << 2;
      r9 = (r1 + r8) | 0;
      r9 = r9 >> 2;
      f1 = Float64(heapClassInst.heapFloat[(r9 + 7)]);
      r6 = (r6 + r8) | 0;
      r6 = r6 >> 2;
      f1 = -f1;
      heapClassInst.heapFloat[(r6)] = Float32(f1);
      r6 = Int64(heapClassInst.heap32[(r2)]);
      r6 = r6 >> 2;
      r6 = Int64(heapClassInst.heap32[(r6 + 11)]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      __FUNCTION_TABLE__[(r6) >> 2](i7);
      f2 = Float64(heapClassInst.heapFloat[(r3 + (-1))]);
      f3 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
      f5 = Float64(heapClassInst.heapFloat[(r3 + (-2))]);
      f6 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
      f7 = Float64(heapClassInst.heapFloat[(r3)]);
      f8 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
      f3 = f2 * f3;
      f6 = f5 * f6;
      f8 = f7 * f8;
      f9 = Float64(heapClassInst.heapFloat[(r7 + 1)]);
      f3 = f3 * f0;
      f10 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
      f6 = f6 * f0;
      f11 = Float64(heapClassInst.heapFloat[(r7 + 2)]);
      f8 = f8 * f0;
      f3 = f9 + f3;
      f9 = f2 * commonVariable.f_g0;
      f6 = f10 + f6;
      f10 = f5 * commonVariable.f_g0;
      f3 = f3 - f9;
      f6 = f6 - f10;
      f8 = f11 + f8;
      f1 = f7 * commonVariable.f_g0;
      f1 = f8 - f1;
      f5 = f5 * f6;
      f2 = f2 * f3;
      f2 = f5 + f2;
      f5 = f7 * f1;
      f2 = f2 + f5;
      if (!(f2 <= f4)) 
      {
        r3 = r5 >> 2;
        heapClassInst.heapFloat[(r3 + (-2))] = Float32(f6);
        heapClassInst.heapFloat[(r3 + (-1))] = Float32(f3);
        heapClassInst.heapFloat[(r3)] = Float32(f1);
        heapClassInst.heap32[(r3 + 1)] = 0;
      }
      if (r0 == 0) 
      {
        break // repeat_3;
      }
      else {
        r3 = Int64(heapClassInst.heap32[(r2 + 13)]);
        r0 = (r0 + (-1)) | 0;
        r4 = (r4 + 16) | 0;
        r5 = (r5 + 16) | 0;
        continue // repeat_3;
      }
    }
  }
  return;
}

func _ZNK14btCapsuleShape21calculateLocalInertiaEfR9btVector3(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 13)]);
  r2 = (r1 + 2) | 0;
  r2 = (r2 % 3) | 0;
  r0 = (r0 + 28) | 0;
  r2 = r2 << 2;
  r2 = (r0 + r2) | 0;
  r2 = r2 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r2)]);
  r2 = sp + (-16);
  r3 = r2 >> 2;
  heapClassInst.heapFloat[(fp + (-4))] = Float32(f0);
  r1 = r1 << 2;
  heapClassInst.heapFloat[(r3 + 1)] = Float32(f0);
  r2 = (r2 + r1) | 0;
  r0 = (r0 + r1) | 0;
  heapClassInst.heapFloat[(r3 + 2)] = Float32(f0);
  r1 = r2 >> 2;
  heapClassInst.heap32[(r3 + 3)] = 0;
  r0 = r0 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r1)]);
  f1 = Float64(heapClassInst.heapFloat[(r0)]);
  f0 = f0 + f1;
  heapClassInst.heapFloat[(r1)] = Float32(f0);
  f0 = 0.039999999105930328;
  f1 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
  f2 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
  f3 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
  f1 = f1 + f0;
  f2 = f2 + f0;
  f0 = f3 + f0;
  f1 = f1 + f1;
  f2 = f2 + f2;
  f0 = f0 + f0;
  f1 = f1 * f1;
  f2 = f2 * f2;
  f3 = Float64(heapClassInst.heapFloat[(fp + 1)]);
  f4 = 0.083333328366279602;
  f0 = f0 * f0;
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  f5 = f1 + f2;
  f3 = f3 * f4;
  f2 = f0 + f2;
  r0 = r0 >> 2;
  f4 = f5 * f3;
  f0 = f0 + f1;
  f1 = f2 * f3;
  heapClassInst.heapFloat[(r0)] = Float32(f4);
  f0 = f0 * f3;
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f1);
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
  return;
}

func _ZNK21btConvexInternalShape32getPreferredPenetrationDirectionEiR9btVector3(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = _E2_str10;
  r1 = _E2_str4198;
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  heapClassInst.heap32[(g0 + 2)] = 110;
  _assert(i7);
}

func _ZNK14btCapsuleShape9serializeEPvP12btSerializer(sp: Int64)
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
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 10)]);
  r3 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = commonVariable.r_g0;
  r4 = Int64(heapClassInst.heap32[(r1)]);
  r4 = r4 >> 2;
  r4 = Int64(heapClassInst.heap32[(r4 + 7)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  r5 = Int64(heapClassInst.heap32[(fp + 1)]);
  __FUNCTION_TABLE__[(r4) >> 2](i7);
  r4 = commonVariable.r_g0;
  r5 = r5 >> 2;
  heapClassInst.heap32[(r5)] = Int32(r4);
  if (!(r4 == 0)) 
  {
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1 + 12)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
    __FUNCTION_TABLE__[(r1) >> 2](i7);
  }
  r0 = r3 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 1)]);
  heapClassInst.heap32[(r5 + 1)] = Int32(r1);
  heapClassInst.heap32[(r5 + 7)] = heapClassInst.heap32[(r0 + 7)];
  heapClassInst.heap32[(r5 + 8)] = heapClassInst.heap32[(r0 + 8)];
  heapClassInst.heap32[(r5 + 9)] = heapClassInst.heap32[(r0 + 9)];
  heapClassInst.heap32[(r5 + 10)] = heapClassInst.heap32[(r0 + 10)];
  heapClassInst.heap32[(r5 + 3)] = heapClassInst.heap32[(r0 + 3)];
  heapClassInst.heap32[(r5 + 4)] = heapClassInst.heap32[(r0 + 4)];
  heapClassInst.heap32[(r5 + 5)] = heapClassInst.heap32[(r0 + 5)];
  heapClassInst.heap32[(r5 + 6)] = heapClassInst.heap32[(r0 + 6)];
  heapClassInst.heap32[(r5 + 11)] = heapClassInst.heap32[(r0 + 11)];
  r0 = Int64(heapClassInst.heap32[(r0 + 13)]);
  heapClassInst.heap32[(r5 + 13)] = Int32(r0);
  r0 = _E2_str6199;
  commonVariable.r_g0 = r0;
  return;
}

func _ZN14btCapsuleShape15setLocalScalingERK9btVector3(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f0 = commonVariable.f_g0;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f1 = commonVariable.f_g0;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f2 = commonVariable.f_g0;
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  f3 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
  f4 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
  f5 = Float64(heapClassInst.heapFloat[(r1 + 7)]);
  r0 = r0 >> 2;
  f3 = f3 + f0;
  f6 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
  f4 = f4 + f1;
  f7 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
  f5 = f5 + f2;
  f8 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
  f9 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f3 = f3 / f6;
  f4 = f4 / f7;
  f5 = f5 / f8;
  f6 = 0.0;
  if (f9 < f6) 
  {
    f9 = -f9;
  }
  f7 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  if (f7 < f6) 
  {
    f7 = -f7;
  }
  f8 = Float64(heapClassInst.heapFloat[(r0)]);
  if (f8 < f6) 
  {
    f8 = -f8;
  }
  heapClassInst.heapFloat[(r1 + 3)] = Float32(f8);
  heapClassInst.heapFloat[(r1 + 4)] = Float32(f7);
  heapClassInst.heapFloat[(r1 + 5)] = Float32(f9);
  f5 = f5 * f8;
  f4 = f4 * f7;
  f2 = f5 - f2;
  heapClassInst.heap32[(r1 + 6)] = 0;
  f3 = f3 * f9;
  f1 = f4 - f1;
  heapClassInst.heapFloat[(r1 + 7)] = Float32(f2);
  f0 = f3 - f0;
  heapClassInst.heapFloat[(r1 + 8)] = Float32(f1);
  heapClassInst.heapFloat[(r1 + 9)] = Float32(f0);
  heapClassInst.heap32[(r1 + 10)] = 0;
  return;
}

func _ZN14btCapsuleShapeD0Ev(sp: Int64)
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
  r1 = _ZTV13btConvexShape;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
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

func _ZN14btCapsuleShapeD1Ev(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV13btConvexShape;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZNK14btCapsuleShape37localGetSupportingVertexWithoutMarginERK9btVector3(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-40); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  heapClassInst.heap32[(r0)] = 0;
  heapClassInst.heap32[(r0 + 1)] = 0;
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(r0 + 2)] = 0;
  r1 = r1 >> 2;
  heapClassInst.heap32[(r0 + 3)] = 0;
  f0 = Float64(heapClassInst.heapFloat[(r1)]);
  f1 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f2 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f3 = f0 * f0;
  f4 = f1 * f1;
  f3 = f3 + f4;
  f4 = f2 * f2;
  f3 = f3 + f4;
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  f4 = 9.9999997473787516e-005;
  if (f3 >= f4) 
  {
    heapClassInst.heapFloat[(g0)] = Float32(f3);
    f3 = 1.0;
    sqrtf(i7);
    f3 = f3 / commonVariable.f_g0;
    f0 = f0 * f3;
    f1 = f1 * f3;
    f2 = f2 * f3;
  }
  else {
    f0 = 1.0;
    f1 = 0.0;
    f2 = f1;
  }
  r2 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r2 + 13)]);
  r4 = (r3 + 2) | 0;
  r4 = (r4 % 3) | 0;
  r5 = (r1 + 28) | 0;
  r4 = r4 << 2;
  r4 = (r5 + r4) | 0;
  r4 = r4 >> 2;
  f3 = Float64(heapClassInst.heapFloat[(r4)]);
  r4 = sp + (-16);
  heapClassInst.heap32[(fp + (-4))] = 0;
  r6 = r4 >> 2;
  r3 = r3 << 2;
  heapClassInst.heap32[(r6 + 1)] = 0;
  r4 = (r4 + r3) | 0;
  r3 = (r5 + r3) | 0;
  heapClassInst.heap32[(r6 + 2)] = 0;
  r4 = r4 >> 2;
  r3 = r3 >> 2;
  heapClassInst.heap32[(r6 + 3)] = 0;
  heapClassInst.heap32[(r4)] = heapClassInst.heap32[(r3)];
  r3 = Int64(heapClassInst.heap32[(r2)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  f5 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
  f6 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
  f7 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
  f5 = f1 * f5;
  f6 = f0 * f6;
  f7 = f2 * f7;
  f8 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
  f5 = f5 * f3;
  f9 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
  f6 = f6 * f3;
  f10 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
  f7 = f7 * f3;
  f5 = f8 + f5;
  f8 = f1 * commonVariable.f_g0;
  f6 = f9 + f6;
  f9 = f0 * commonVariable.f_g0;
  f5 = f5 - f8;
  f6 = f6 - f9;
  f7 = f10 + f7;
  f4 = f2 * commonVariable.f_g0;
  f4 = f7 - f4;
  f7 = f0 * f6;
  f8 = f1 * f5;
  f7 = f7 + f8;
  f8 = f2 * f4;
  f7 = f7 + f8;
  f8 = ( -999999984306749440.0);
  if (f7 > f8) 
  {
    heapClassInst.heapFloat[(r0)] = Float32(f6);
    heapClassInst.heapFloat[(r0 + 1)] = Float32(f5);
    heapClassInst.heapFloat[(r0 + 2)] = Float32(f4);
    heapClassInst.heap32[(r0 + 3)] = 0;
    f8 = f7;
  }
  r3 = sp + (-32);
  heapClassInst.heap32[(fp + (-8))] = 0;
  r4 = r3 >> 2;
  heapClassInst.heap32[(r4 + 1)] = 0;
  heapClassInst.heap32[(r4 + 2)] = 0;
  heapClassInst.heap32[(r4 + 3)] = 0;
  r5 = Int64(heapClassInst.heap32[(r2 + 13)]);
  r5 = r5 << 2;
  r6 = (r1 + r5) | 0;
  r6 = r6 >> 2;
  f4 = Float64(heapClassInst.heapFloat[(r6 + 7)]);
  r3 = (r3 + r5) | 0;
  r3 = r3 >> 2;
  f4 = -f4;
  heapClassInst.heapFloat[(r3)] = Float32(f4);
  r3 = Int64(heapClassInst.heap32[(r2)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  f5 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
  f6 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
  f7 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
  f5 = f1 * f5;
  f6 = f0 * f6;
  f7 = f2 * f7;
  f9 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
  f5 = f5 * f3;
  f10 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
  f6 = f6 * f3;
  f11 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
  f3 = f7 * f3;
  f5 = f9 + f5;
  f7 = f1 * commonVariable.f_g0;
  f6 = f10 + f6;
  f9 = f0 * commonVariable.f_g0;
  f5 = f5 - f7;
  f6 = f6 - f9;
  f3 = f11 + f3;
  f4 = f2 * commonVariable.f_g0;
  f3 = f3 - f4;
  f0 = f0 * f6;
  f1 = f1 * f5;
  f0 = f0 + f1;
  f1 = f2 * f3;
  f0 = f0 + f1;
  if (!(f0 <= f8)) 
  {
    heapClassInst.heapFloat[(r0)] = Float32(f6);
    heapClassInst.heapFloat[(r0 + 1)] = Float32(f5);
    heapClassInst.heapFloat[(r0 + 2)] = Float32(f3);
    heapClassInst.heap32[(r0 + 3)] = 0;
  }
  return;
}

func _ZNK16btCollisionShape28calculateSerializeBufferSizeEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = 12;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK16btCollisionShape27getContactBreakingThresholdEf(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var f0: Float64 = 0.0
  var f1: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 4)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  f1 = Float64(heapClassInst.heapFloat[(fp + 1)]);
  f0 = commonVariable.f_g0 * f1;
  commonVariable.f_g0 = f0;
  return;
}

func _ZNK16btCollisionShape9serializeEPvP12btSerializer(sp: Int64)
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
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 10)]);
  r3 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = commonVariable.r_g0;
  r4 = Int64(heapClassInst.heap32[(r1)]);
  r4 = r4 >> 2;
  r4 = Int64(heapClassInst.heap32[(r4 + 7)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  r5 = Int64(heapClassInst.heap32[(fp + 1)]);
  __FUNCTION_TABLE__[(r4) >> 2](i7);
  r4 = commonVariable.r_g0;
  r5 = r5 >> 2;
  heapClassInst.heap32[(r5)] = Int32(r4);
  if (!(r4 == 0)) 
  {
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1 + 12)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
    __FUNCTION_TABLE__[(r1) >> 2](i7);
  }
  r0 = r3 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  heapClassInst.heap32[(r5 + 1)] = Int32(r0);
  r0 = _E2_str200;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK16btCollisionShape20serializeSingleShapeEP12btSerializer(sp: Int64)
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
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 12)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r4 = r3 >> 2;
  r5 = Int64(heapClassInst.heap32[(r4)]);
  r5 = r5 >> 2;
  r5 = Int64(heapClassInst.heap32[(r5 + 4)]);
  heapClassInst.heap32[(g0)] = Int32(r3);
  heapClassInst.heap32[(g0 + 1)] = Int32(commonVariable.r_g0);
  heapClassInst.heap32[(g0 + 2)] = 1;
  __FUNCTION_TABLE__[(r5) >> 2](i7);
  r2 = commonVariable.r_g0;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r5 = r2 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 13)]);
  r5 = Int64(heapClassInst.heap32[(r5 + 2)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r5);
  heapClassInst.heap32[(g0 + 2)] = Int32(r3);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r4 = Int64(heapClassInst.heap32[(r4)]);
  r4 = r4 >> 2;
  r4 = Int64(heapClassInst.heap32[(r4 + 5)]);
  heapClassInst.heap32[(g0)] = Int32(r3);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  heapClassInst.heap32[(g0 + 2)] = Int32(commonVariable.r_g0);
  heapClassInst.heap32[(g0 + 3)] = 1346455635;
  heapClassInst.heap32[(g0 + 4)] = Int32(r0);
  __FUNCTION_TABLE__[(r4) >> 2](i7);
  return;
}

func _ZNK16btCollisionShape17getBoundingSphereER9btVector3Rf(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-112); 
  var g0 = i7 >> 2; 
  r0 = sp + (-64);
  r1 = r0 >> 2;
  heapClassInst.heap32[(fp + (-16))] = 1065353216;
  heapClassInst.heap32[(r1 + 1)] = 0;
  heapClassInst.heap32[(r1 + 2)] = 0;
  heapClassInst.heap32[(r1 + 3)] = 0;
  heapClassInst.heap32[(r1 + 4)] = 0;
  heapClassInst.heap32[(r1 + 5)] = 1065353216;
  heapClassInst.heap32[(r1 + 6)] = 0;
  heapClassInst.heap32[(r1 + 7)] = 0;
  heapClassInst.heap32[(r1 + 8)] = 0;
  heapClassInst.heap32[(r1 + 9)] = 0;
  heapClassInst.heap32[(r1 + 10)] = 1065353216;
  heapClassInst.heap32[(r1 + 11)] = 0;
  heapClassInst.heap32[(r1 + 12)] = 0;
  heapClassInst.heap32[(r1 + 13)] = 0;
  r2 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heap32[(r1 + 14)] = 0;
  r3 = r2 >> 2;
  heapClassInst.heap32[(r1 + 15)] = 0;
  r1 = Int64(heapClassInst.heap32[(r3)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 2)]);
  r3 = sp + (-96);
  r4 = sp + (-80);
  heapClassInst.heap32[(g0)] = Int32(r2);
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  heapClassInst.heap32[(g0 + 2)] = Int32(r4);
  heapClassInst.heap32[(g0 + 3)] = Int32(r3);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = r3 >> 2;
  r1 = r4 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f1 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f2 = Float64(heapClassInst.heapFloat[(fp + (-24))]);
  f3 = Float64(heapClassInst.heapFloat[(fp + (-20))]);
  f2 = f2 - f3;
  f0 = f0 - f1;
  f1 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f3 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f1 = f1 - f3;
  f2 = f2 * f2;
  f0 = f0 * f0;
  f0 = f2 + f0;
  f1 = f1 * f1;
  f0 = f0 + f1;
  heapClassInst.heapFloat[(g0)] = Float32(f0);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  f0 = 0.5;
  sqrtf(i7);
  r2 = r2 >> 2;
  f1 = commonVariable.f_g0 * f0;
  heapClassInst.heapFloat[(r2)] = Float32(f1);
  f1 = Float64(heapClassInst.heapFloat[(fp + (-20))]);
  f2 = Float64(heapClassInst.heapFloat[(fp + (-24))]);
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  f1 = f1 + f2;
  f2 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f3 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f4 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f5 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f4 = f4 + f5;
  r0 = r2 >> 2;
  f1 = f1 * f0;
  f2 = f2 + f3;
  f3 = f4 * f0;
  heapClassInst.heapFloat[(r0)] = Float32(f1);
  f0 = f2 * f0;
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f3);
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
  heapClassInst.heap32[(r0 + 3)] = 0;
  return;
}

func _ZNK16btCollisionShape20getAngularMotionDiscEv(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-40); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 3)]);
  r2 = sp + (-16);
  r3 = sp + (-20);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  heapClassInst.heap32[(g0 + 2)] = Int32(r3);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = r2 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
  f1 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f2 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f0 = f0 * f0;
  f1 = f1 * f1;
  f0 = f0 + f1;
  f1 = f2 * f2;
  f0 = f0 + f1;
  heapClassInst.heapFloat[(g0)] = Float32(f0);
  sqrtf(i7);
  f1 = Float64(heapClassInst.heapFloat[(fp + (-5))]);
  f0 = commonVariable.f_g0 + f1;
  commonVariable.f_g0 = f0;
  return;
}

func _ZNK16btCollisionShape21calculateTemporalAabbERK11btTransformRK9btVector3S5_fRS3_S6_(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 2)]);
  r3 = Int64(heapClassInst.heap32[(fp + 5)]);
  r4 = Int64(heapClassInst.heap32[(fp + 4)]);
  r5 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r5);
  heapClassInst.heap32[(g0 + 2)] = Int32(r4);
  heapClassInst.heap32[(g0 + 3)] = Int32(r3);
  r5 = Int64(heapClassInst.heap32[(fp + 2)]);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = r3 >> 2;
  r3 = r4 >> 2;
  r4 = r5 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r4)]);
  r5 = Int64(heapClassInst.heap32[(fp + 3)]);
  f1 = Float64(heapClassInst.heapFloat[(r2)]);
  f2 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
  f3 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
  f4 = Float64(heapClassInst.heapFloat[(r3)]);
  f5 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
  f6 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
  f7 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
  f8 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
  f9 = 0.0;
  if (f0 <= f9) 
  {
    f4 = f0 + f4;
  }
  else {
    f1 = f0 + f1;
  }
  if (f8 <= f9) 
  {
    f5 = f8 + f5;
  }
  else {
    f2 = f8 + f2;
  }
  if (f7 <= f9) 
  {
    f6 = f7 + f6;
  }
  else {
    f3 = f7 + f3;
  }
  r4 = r5 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r4)]);
  f7 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
  f8 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
  f0 = f0 * f0;
  f7 = f7 * f7;
  f0 = f0 + f7;
  f7 = f8 * f8;
  f0 = f0 + f7;
  heapClassInst.heapFloat[(g0)] = Float32(f0);
  sqrtf(i7);
  f0 = commonVariable.f_g0;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 4)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  heapClassInst.heapFloat[(r3)] = Float32(f4);
  heapClassInst.heapFloat[(r3 + 1)] = Float32(f5);
  heapClassInst.heapFloat[(r3 + 2)] = Float32(f6);
  heapClassInst.heap32[(r3 + 3)] = 0;
  heapClassInst.heapFloat[(r2)] = Float32(f1);
  heapClassInst.heapFloat[(r2 + 1)] = Float32(f2);
  heapClassInst.heapFloat[(r2 + 2)] = Float32(f3);
  heapClassInst.heap32[(r2 + 3)] = 0;
  f0 = f0 * commonVariable.f_g0;
  f1 = Float64(heapClassInst.heapFloat[(r3)]);
  f1 = f1 - f0;
  heapClassInst.heapFloat[(r3)] = Float32(f1);
  f1 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
  f1 = f1 - f0;
  heapClassInst.heapFloat[(r3 + 1)] = Float32(f1);
  f1 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
  f1 = f1 - f0;
  heapClassInst.heapFloat[(r3 + 2)] = Float32(f1);
  f1 = Float64(heapClassInst.heapFloat[(r2)]);
  f1 = f1 + f0;
  heapClassInst.heapFloat[(r2)] = Float32(f1);
  f1 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
  f1 = f1 + f0;
  heapClassInst.heapFloat[(r2 + 1)] = Float32(f1);
  f1 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
  f0 = f1 + f0;
  heapClassInst.heapFloat[(r2 + 2)] = Float32(f0);
  return;
}

func _ZN14btConcaveShapeD1Ev(sp: Int64)
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

func _ZN14btConcaveShapeD0Ev(sp: Int64)
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

func _ZNK17btConvexHullShape7getNameEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = _E2_str219;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK17btConvexHullShape28calculateSerializeBufferSizeEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = 68;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK17btConvexHullShape12getNumPlanesEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = 0;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK17btConvexHullShape9getVertexEiR9btVector3(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = Int64(heapClassInst.heap32[(r0 + 25)]);
  r1 = r1 << 4;
  r1 = (r2 + r1) | 0;
  r1 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  f0 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f1 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
  f2 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f3 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
  f4 = Float64(heapClassInst.heapFloat[(r1)]);
  f5 = Float64(heapClassInst.heapFloat[(r0 + 3)]);
  r0 = r2 >> 2;
  f4 = f4 * f5;
  f2 = f2 * f3;
  heapClassInst.heapFloat[(r0)] = Float32(f4);
  f0 = f0 * f1;
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f2);
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
  heapClassInst.heap32[(r0 + 3)] = 0;
  return;
}

func _ZNK17btConvexHullShape7getEdgeEiR9btVector3S1_(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = Int64(heapClassInst.heap32[(r0 + 23)]);
  r3 = (r1 % r2) | 0;
  r4 = Int64(heapClassInst.heap32[(r0 + 25)]);
  r3 = r3 << 4;
  r3 = (r4 + r3) | 0;
  r3 = r3 >> 2;
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  f0 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
  f1 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
  f2 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
  f3 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
  f4 = Float64(heapClassInst.heapFloat[(r3)]);
  f5 = Float64(heapClassInst.heapFloat[(r0 + 3)]);
  r3 = r4 >> 2;
  f4 = f4 * f5;
  f2 = f2 * f3;
  heapClassInst.heapFloat[(r3)] = Float32(f4);
  f0 = f0 * f1;
  heapClassInst.heapFloat[(r3 + 1)] = Float32(f2);
  r1 = (r1 + 1) | 0;
  heapClassInst.heapFloat[(r3 + 2)] = Float32(f0);
  heapClassInst.heap32[(r3 + 3)] = 0;
  r1 = (r1 % r2) | 0;
  r2 = Int64(heapClassInst.heap32[(r0 + 25)]);
  r1 = r1 << 4;
  r1 = (r2 + r1) | 0;
  r1 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(fp + 3)]);
  f0 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f1 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
  f2 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f3 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
  f4 = Float64(heapClassInst.heapFloat[(r1)]);
  f5 = Float64(heapClassInst.heapFloat[(r0 + 3)]);
  r0 = r2 >> 2;
  f4 = f4 * f5;
  f2 = f2 * f3;
  heapClassInst.heapFloat[(r0)] = Float32(f4);
  f0 = f0 * f1;
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f2);
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
  heapClassInst.heap32[(r0 + 3)] = 0;
  return;
}

func _ZNK17btConvexHullShape11getNumEdgesEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 23)]);
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK17btConvexHullShape14getNumVerticesEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 23)]);
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK17btConvexHullShape49batchedUnitVectorGetSupportingVertexWithoutMarginEPK9btVector3PS0_i(sp: Int64)
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
  var f2: Float64 = 0.0
  var f3: Float64 = 0.0
  var f4: Float64 = 0.0
  var f5: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 3)]);
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  if (!(r0 < 1)) 
  {
    r2 = (r1 + 12) | 0;
    r3 = r0;
    /*repeat_3: */
    while (true) {
      r3 = (r3 + (-1)) | 0;
      r4 = (r2 + 16) | 0;
      r2 = r2 >> 2;
      heapClassInst.heap32[(r2)] = ( -581039253);
      r2 = r4;
      if (r3 != 0) 
      {
        continue //repeat_3;
      }
      else {
        break // repeat_3;
      }
    }
  }
  r2 = Int64(heapClassInst.heap32[(fp)]);
  r2 = r2 >> 2;
  r3 = Int64(heapClassInst.heap32[(r2 + 23)]);
  /*repeat_6: */
  do {
    if (!(r3 < 1)) 
    {
      r3 = Int64(heapClassInst.heap32[(fp + 1)]);
      r1 = (r1 + 8) | 0;
      r3 = (r3 + 8) | 0;
      r4 = 0;
      /*repeat_8:*/ 
      while (true) {
        if (!(r0 < 1)) 
        {
          r5 = Int64(heapClassInst.heap32[(r2 + 25)]);
          r6 = r4 << 4;
          r5 = (r5 + r6) | 0;
          r5 = r5 >> 2;
          f0 = Float64(heapClassInst.heapFloat[(r5 + 2)]);
          f1 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
          f2 = Float64(heapClassInst.heapFloat[(r5 + 1)]);
          f3 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
          f4 = Float64(heapClassInst.heapFloat[(r5)]);
          f5 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
          f0 = f0 * f1;
          f1 = f2 * f3;
          f2 = f4 * f5;
          r5 = r3;
          r6 = r1;
          r7 = r0;
          /*repeat_12: */
          while (true) {
            r8 = r5 >> 2;
            f3 = Float64(heapClassInst.heapFloat[(r8 + (-2))]);
            f4 = Float64(heapClassInst.heapFloat[(r8 + (-1))]);
            f3 = f3 * f2;
            f4 = f4 * f1;
            f5 = Float64(heapClassInst.heapFloat[(r8)]);
            f3 = f3 + f4;
            f4 = f5 * f0;
            r8 = r6 >> 2;
            f3 = f3 + f4;
            f4 = Float64(heapClassInst.heapFloat[(r8 + 1)]);
            if (!(f4 >= f3)) 
            {
              heapClassInst.heapFloat[(r8 + (-2))] = Float32(f2);
              heapClassInst.heapFloat[(r8 + (-1))] = Float32(f1);
              heapClassInst.heapFloat[(r8)] = Float32(f0);
              heapClassInst.heapFloat[(r8 + 1)] = Float32(f3);
            }
            r7 = (r7 + (-1)) | 0;
            r6 = (r6 + 16) | 0;
            r5 = (r5 + 16) | 0;
            if (!(r7 != 0)) 
            {
              break //repeat_12;
            }
          }
        }
        r4 = (r4 + 1) | 0;
        r5 = Int64(heapClassInst.heap32[(r2 + 23)]);
        if (r5 > r4) 
        {
          continue //repeat_8;
        }
        else {
          break //repeat_6;
        }
      }
    }
  } while (false);
  return;
}

func _ZNK17btConvexHullShape37localGetSupportingVertexWithoutMarginERK9btVector3(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  heapClassInst.heap32[(r0)] = 0;
  heapClassInst.heap32[(r0 + 1)] = 0;
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heap32[(r0 + 2)] = 0;
  r1 = r1 >> 2;
  heapClassInst.heap32[(r0 + 3)] = 0;
  r2 = Int64(heapClassInst.heap32[(r1 + 23)]);
  if (!(r2 < 1)) 
  {
    r3 = Int64(heapClassInst.heap32[(fp + 2)]);
    r3 = r3 >> 2;
    r4 = Int64(heapClassInst.heap32[(r1 + 25)]);
    f0 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
    f1 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
    f2 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
    f3 = Float64(heapClassInst.heapFloat[(r3)]);
    f4 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
    f5 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
    r1 = 0;
    f6 = ( -999999984306749440.0);
    // repeat_3: 
    while (true) {
      r3 = r1 << 4;
      r3 = (r4 + r3) | 0;
      r3 = r3 >> 2;
      f7 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
      f8 = Float64(heapClassInst.heapFloat[(r3)]);
      f7 = f7 * f1;
      f8 = f8 * f2;
      f9 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
      f9 = f9 * f0;
      f10 = f3 * f8;
      f11 = f4 * f7;
      f10 = f10 + f11;
      f11 = f5 * f9;
      f10 = f10 + f11;
      if (f10 > f6) 
      {
        heapClassInst.heapFloat[(r0)] = Float32(f8);
        heapClassInst.heapFloat[(r0 + 1)] = Float32(f7);
        heapClassInst.heapFloat[(r0 + 2)] = Float32(f9);
        heapClassInst.heap32[(r0 + 3)] = 0;
        f6 = f10;
      }
      r1 = (r1 + 1) | 0;
      if (r1 < r2) 
      {
        continue // repeat_3;
      }
      else {
        break // repeat_3;
      }
    }
  }
  return;
}

func _ZNK17btConvexHullShape8isInsideERK9btVector3f(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = _E2_str10;
  r1 = _E2_str3222;
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  heapClassInst.heap32[(g0 + 2)] = 173;
  _assert(i7);
}

func _ZNK17btConvexHullShape8getPlaneER9btVector3S1_i(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = _E2_str10;
  r1 = _E2_str3222;
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  heapClassInst.heap32[(g0 + 2)] = 167;
  _assert(i7);
}

func _ZN17btConvexHullShapeD0Ev(sp: Int64)
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
  r1 = _ZTV17btConvexHullShape;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r1 = Int64(heapClassInst.heap32[(r2 + 25)]);
  if (!(r1 == 0)) 
  {
    r3 = Int64(heapClassInst.heapU8[r0 + 104]);
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
    heapClassInst.heap32[(r2 + 25)] = 0;
  }
  r1 = 1;
  heapClassInst.heap8[r0 + 104] = Int8(r1);
  heapClassInst.heap32[(r2 + 25)] = 0;
  r1 = _ZTV13btConvexShape;
  heapClassInst.heap32[(r2 + 23)] = 0;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2 + 24)] = 0;
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

func _ZN17btConvexHullShapeD1Ev(sp: Int64)
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
  r1 = _ZTV17btConvexHullShape;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  r1 = Int64(heapClassInst.heap32[(r2 + 25)]);
  if (!(r1 == 0)) 
  {
    r3 = Int64(heapClassInst.heapU8[r0 + 104]);
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
    heapClassInst.heap32[(r2 + 25)] = 0;
  }
  r1 = 1;
  heapClassInst.heap8[r0 + 104] = Int8(r1);
  heapClassInst.heap32[(r2 + 25)] = 0;
  r0 = _ZTV13btConvexShape;
  heapClassInst.heap32[(r2 + 23)] = 0;
  r0 = (r0 + 8) | 0;
  heapClassInst.heap32[(r2 + 24)] = 0;
  heapClassInst.heap32[(r2)] = Int32(r0);
  return;
}

func _ZN17btConvexHullShape15setLocalScalingERK9btVector3(sp: Int64)
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
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = r0 >> 2;
  r1 = r1 >> 2;
  heapClassInst.heap32[(r2 + 3)] = heapClassInst.heap32[(r1)];
  heapClassInst.heap32[(r2 + 4)] = heapClassInst.heap32[(r1 + 1)];
  heapClassInst.heap32[(r2 + 5)] = heapClassInst.heap32[(r1 + 2)];
  heapClassInst.heap32[(r2 + 6)] = heapClassInst.heap32[(r1 + 3)];
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZN34btPolyhedralConvexAabbCachingShape15recalcLocalAabbEv(i7);
  return;
}

func _ZNK17btConvexHullShape9serializeEPvP12btSerializer(sp: Int64)
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
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 10)]);
  r3 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = commonVariable.r_g0;
  r4 = Int64(heapClassInst.heap32[(r1)]);
  r4 = r4 >> 2;
  r4 = Int64(heapClassInst.heap32[(r4 + 7)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  r5 = Int64(heapClassInst.heap32[(fp + 1)]);
  __FUNCTION_TABLE__[(r4) >> 2](i7);
  r4 = commonVariable.r_g0;
  r5 = r5 >> 2;
  heapClassInst.heap32[(r5)] = Int32(r4);
  if (!(r4 == 0)) 
  {
    r4 = Int64(heapClassInst.heap32[(r1)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4 + 12)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
    __FUNCTION_TABLE__[(r4) >> 2](i7);
  }
  r2 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r2 + 1)]);
  heapClassInst.heap32[(r5 + 1)] = Int32(r3);
  heapClassInst.heap32[(r5 + 7)] = heapClassInst.heap32[(r2 + 7)];
  heapClassInst.heap32[(r5 + 8)] = heapClassInst.heap32[(r2 + 8)];
  heapClassInst.heap32[(r5 + 9)] = heapClassInst.heap32[(r2 + 9)];
  heapClassInst.heap32[(r5 + 10)] = heapClassInst.heap32[(r2 + 10)];
  heapClassInst.heap32[(r5 + 3)] = heapClassInst.heap32[(r2 + 3)];
  heapClassInst.heap32[(r5 + 4)] = heapClassInst.heap32[(r2 + 4)];
  heapClassInst.heap32[(r5 + 5)] = heapClassInst.heap32[(r2 + 5)];
  heapClassInst.heap32[(r5 + 6)] = heapClassInst.heap32[(r2 + 6)];
  heapClassInst.heap32[(r5 + 11)] = heapClassInst.heap32[(r2 + 11)];
  r3 = Int64(heapClassInst.heap32[(r2 + 23)]);
  heapClassInst.heap32[(r5 + 15)] = Int32(r3);
  if (r3 == 0) 
  {
    heapClassInst.heap32[(r5 + 13)] = 0;
    heapClassInst.heap32[(r5 + 14)] = 0;
    r0 = _E2_str6224;
    commonVariable.r_g0 = r0;
    return;
  }
  else {
    r4 = Int64(heapClassInst.heap32[(r1)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4 + 7)]);
    r6 = Int64(heapClassInst.heap32[(r2 + 25)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r6);
    __FUNCTION_TABLE__[(r4) >> 2](i7);
    heapClassInst.heap32[(r5 + 13)] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(r5 + 14)] = 0;
    r5 = Int64(heapClassInst.heap32[(r1)]);
    r5 = r5 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5 + 4)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = 16;
    heapClassInst.heap32[(g0 + 2)] = Int32(r3);
    __FUNCTION_TABLE__[(r5) >> 2](i7);
    r5 = commonVariable.r_g0;
    if (!(r3 < 1)) 
    {
      r4 = r5 >> 2;
      r4 = Int64(heapClassInst.heap32[(r4 + 2)]);
      r6 = 0;
      // repeat_9: 
      while (true) {
        r7 = r6 << 4;
        r8 = Int64(heapClassInst.heap32[(r2 + 25)]);
        r9 = (r4 + r7) | 0;
        r7 = (r8 + r7) | 0;
        r8 = r9 >> 2;
        r7 = r7 >> 2;
        heapClassInst.heap32[(r8)] = heapClassInst.heap32[(r7)];
        heapClassInst.heap32[(r8 + 1)] = heapClassInst.heap32[(r7 + 1)];
        r6 = (r6 + 1) | 0;
        heapClassInst.heap32[(r8 + 2)] = heapClassInst.heap32[(r7 + 2)];
        heapClassInst.heap32[(r8 + 3)] = heapClassInst.heap32[(r7 + 3)];
        if (!(r3 != r6)) 
        {
          break // repeat_9;
        }
      }
    }
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1 + 5)]);
    r2 = Int64(heapClassInst.heap32[(r2 + 25)]);
    r3 = _E2_str5223;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r5);
    heapClassInst.heap32[(g0 + 2)] = Int32(r3);
    heapClassInst.heap32[(g0 + 3)] = 1497453121;
    heapClassInst.heap32[(g0 + 4)] = Int32(r2);
    __FUNCTION_TABLE__[(r1) >> 2](i7);
    r5 = _E2_str6224;
    commonVariable.r_g0 = r5;
    return;
  }
}

func _ZNK17btConvexHullShape24localGetSupportingVertexERK9btVector3(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 16)]);
  r3 = Int64(heapClassInst.heap32[(fp)]);
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(g0)] = Int32(r3);
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  heapClassInst.heap32[(g0 + 2)] = Int32(r4);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f0 = commonVariable.f_g0;
  f1 = 0.0;
  if (!(f0 == f1)) 
  {
    r2 = r4 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r2)]);
    f1 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
    f2 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
    f3 = f0 * f0;
    f4 = f1 * f1;
    f3 = f3 + f4;
    f4 = f2 * f2;
    f3 = f3 + f4;
    f4 = 1.4210854715202004e-014;
    f5 = ( -1.0);
    f0 = if (f3 < f4) {f5} else {f0};
    f1 = if (f3 < f4) {f5} else {f1};
    f2 = if (f3 < f4) {f5} else {f2};
    f3 = f0 * f0;
    f4 = f1 * f1;
    f3 = f3 + f4;
    f4 = f2 * f2;
    f3 = f3 + f4;
    heapClassInst.heapFloat[(g0)] = Float32(f3);
    sqrtf(i7);
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1 + 11)]);
    f4 = 1.0;
    f3 = f4 / commonVariable.f_g0;
    heapClassInst.heap32[(g0)] = Int32(r0);
    r0 = r3 >> 2;
    __FUNCTION_TABLE__[(r1) >> 2](i7);
    f0 = f0 * f3;
    f0 = f0 * commonVariable.f_g0;
    f5 = Float64(heapClassInst.heapFloat[(r0)]);
    f0 = f5 + f0;
    f1 = f1 * f3;
    heapClassInst.heapFloat[(r0)] = Float32(f0);
    f0 = f1 * commonVariable.f_g0;
    f1 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
    f0 = f1 + f0;
    f1 = f2 * f3;
    heapClassInst.heapFloat[(r0 + 1)] = Float32(f0);
    f0 = f1 * commonVariable.f_g0;
    f1 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
    f0 = f1 + f0;
    heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
  }
  return;
}

func _ZN17btConvexHullShape8addPointERK9btVector3(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1 + 24)]);
  r3 = Int64(heapClassInst.heap32[(r1 + 23)]);
  r4 = Int64(heapClassInst.heap32[(fp + 1)]);
  if (r2 == r3) 
  {
    r5 = 1;
    r6 = r3 << 1;
    r6 = if (r3 == 0) {r5} else {r6};
    if (!(r2 >= r6)) 
    {
      if (r6 != 0) 
      {
        r2 = gNumAlignedAllocs;
        r2 = r2 >> 2;
        r7 = Int64(heapClassInst.heap32[(r2)]);
        r8 = r6 << 4;
        r7 = (r7 + 1) | 0;
        r8 = r8 | 3;
        heapClassInst.heap32[(r2)] = Int32(r7);
        r2 = (r8 + 16) | 0;
        heapClassInst.heap32[(g0)] = Int32(r2);
        mallocNew(i7);
        r2 = commonVariable.r_g0;
        if (r2 != 0) 
        {
          r7 = 0;
          r8 = (r2 + 4) | 0;
          r7 = (r7 - r8) | 0;
          r7 = r7 & 15;
          r7 = (r2 + r7) | 0;
          r8 = (r7 + 4) | 0;
          r7 = r7 >> 2;
          heapClassInst.heap32[(r7)] = Int32(r2);
          r2 = r8;
        }
      }
      else {
        r2 = 0;
      }
      r7 = (r0 + 100) | 0;
      if (r3 < 1) 
      {
        r8 = r7 >> 2;
        r9 = Int64(heapClassInst.heap32[(r8)]);
      }
      else {
        r8 = 0;
        // repeat_12: 
        while (true) {
          r9 = r7 >> 2;
          r9 = Int64(heapClassInst.heap32[(r9)]);
          r10 = r8 << 4;
          r11 = (r2 + r10) | 0;
          r10 = (r9 + r10) | 0;
          r11 = r11 >> 2;
          r10 = r10 >> 2;
          heapClassInst.heap32[(r11)] = heapClassInst.heap32[(r10)];
          heapClassInst.heap32[(r11 + 1)] = heapClassInst.heap32[(r10 + 1)];
          r8 = (r8 + 1) | 0;
          heapClassInst.heap32[(r11 + 2)] = heapClassInst.heap32[(r10 + 2)];
          heapClassInst.heap32[(r11 + 3)] = heapClassInst.heap32[(r10 + 3)];
          if (!(r3 != r8)) 
          {
            break // repeat_12;
          }
        }
        r7 = (r0 + 100) | 0;
      }
      if (r9 != 0) 
      {
        r8 = Int64(heapClassInst.heapU8[r0 + 104]);
        if (r8 != 0) 
        {
          r3 = gNumAlignedFree;
          r3 = r3 >> 2;
          r8 = Int64(heapClassInst.heap32[(r3)]);
          r8 = (r8 + 1) | 0;
          r9 = r9 >> 2;
          heapClassInst.heap32[(r3)] = Int32(r8);
          r3 = Int64(heapClassInst.heap32[(r9 + (-1))]);
          heapClassInst.heap32[(g0)] = Int32(r3);
          free(i7);
          r3 = Int64(heapClassInst.heap32[(r1 + 23)]);
        }
        r8 = r7 >> 2;
        heapClassInst.heap32[(r8)] = 0;
      }
      r7 = r7 >> 2;
      heapClassInst.heap8[r0 + 104] = Int8(r5);
      heapClassInst.heap32[(r7)] = Int32(r2);
      heapClassInst.heap32[(r1 + 24)] = Int32(r6);
    }
  }
  r2 = r3 << 4;
  r3 = Int64(heapClassInst.heap32[(r1 + 25)]);
  r2 = (r3 + r2) | 0;
  r2 = r2 >> 2;
  r3 = r4 >> 2;
  heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r3)];
  heapClassInst.heap32[(r2 + 1)] = heapClassInst.heap32[(r3 + 1)];
  heapClassInst.heap32[(r2 + 2)] = heapClassInst.heap32[(r3 + 2)];
  heapClassInst.heap32[(r2 + 3)] = heapClassInst.heap32[(r3 + 3)];
  r2 = Int64(heapClassInst.heap32[(r1 + 23)]);
  r2 = (r2 + 1) | 0;
  heapClassInst.heap32[(r1 + 23)] = Int32(r2);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZN34btPolyhedralConvexAabbCachingShape15recalcLocalAabbEv(i7);
  return;
}

func _ZN20btAlignedObjectArrayI9btVector3E6resizeEiRKS0_(sp: Int64)
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
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1 + 1)]);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  // repeat_1: 
  do {
    if (!(r2 > r3)) 
    {
      if (!(r2 >= r3)) 
      {
        r4 = Int64(heapClassInst.heap32[(r1 + 2)]);
        if (!(r4 >= r3)) 
        {
          if (r3 != 0) 
          {
            r4 = gNumAlignedAllocs;
            r4 = r4 >> 2;
            r5 = Int64(heapClassInst.heap32[(r4)]);
            r6 = r3 << 4;
            r5 = (r5 + 1) | 0;
            r6 = r6 | 3;
            heapClassInst.heap32[(r4)] = Int32(r5);
            r4 = (r6 + 16) | 0;
            heapClassInst.heap32[(g0)] = Int32(r4);
            mallocNew(i7);
            r4 = commonVariable.r_g0;
            if (r4 != 0) 
            {
              r5 = 0;
              r6 = (r4 + 4) | 0;
              r5 = (r5 - r6) | 0;
              r5 = r5 & 15;
              r5 = (r4 + r5) | 0;
              r6 = (r5 + 4) | 0;
              r5 = r5 >> 2;
              heapClassInst.heap32[(r5)] = Int32(r4);
              r4 = r6;
            }
          }
          else {
            r4 = 0;
          }
          r5 = (r0 + 12) | 0;
          if (r2 < 1) 
          {
            r6 = r5 >> 2;
            r7 = Int64(heapClassInst.heap32[(r6)]);
          }
          else {
            r6 = 0;
            // repeat_14: 
            while (true) {
              r7 = r5 >> 2;
              r7 = Int64(heapClassInst.heap32[(r7)]);
              r8 = r6 << 4;
              r9 = (r4 + r8) | 0;
              r8 = (r7 + r8) | 0;
              r9 = r9 >> 2;
              r8 = r8 >> 2;
              heapClassInst.heap32[(r9)] = heapClassInst.heap32[(r8)];
              heapClassInst.heap32[(r9 + 1)] = heapClassInst.heap32[(r8 + 1)];
              r6 = (r6 + 1) | 0;
              heapClassInst.heap32[(r9 + 2)] = heapClassInst.heap32[(r8 + 2)];
              heapClassInst.heap32[(r9 + 3)] = heapClassInst.heap32[(r8 + 3)];
              if (!(r2 != r6)) 
              {
                break // repeat_14;
              }
            }
            r5 = (r0 + 12) | 0;
          }
          if (!(r7 == 0)) 
          {
            r6 = Int64(heapClassInst.heapU8[r0 + 16]);
            if (!(r6 == 0)) 
            {
              r6 = gNumAlignedFree;
              r6 = r6 >> 2;
              r8 = Int64(heapClassInst.heap32[(r6)]);
              r8 = (r8 + 1) | 0;
              r7 = r7 >> 2;
              heapClassInst.heap32[(r6)] = Int32(r8);
              r6 = Int64(heapClassInst.heap32[(r7 + (-1))]);
              heapClassInst.heap32[(g0)] = Int32(r6);
              free(i7);
            }
            r6 = r5 >> 2;
            heapClassInst.heap32[(r6)] = 0;
          }
          r6 = 1;
          r5 = r5 >> 2;
          heapClassInst.heap8[r0 + 16] = Int8(r6);
          heapClassInst.heap32[(r5)] = Int32(r4);
          heapClassInst.heap32[(r1 + 2)] = Int32(r3);
          if (r2 >= r3) 
          {
            break // repeat_1;
          }
        }
        r0 = Int64(heapClassInst.heap32[(fp + 2)]);
        // repeat_25: 
        while (true) {
          r4 = r2 << 4;
          r5 = Int64(heapClassInst.heap32[(r1 + 3)]);
          r4 = (r5 + r4) | 0;
          r4 = r4 >> 2;
          r5 = r0 >> 2;
          heapClassInst.heap32[(r4)] = heapClassInst.heap32[(r5)];
          heapClassInst.heap32[(r4 + 1)] = heapClassInst.heap32[(r5 + 1)];
          r2 = (r2 + 1) | 0;
          heapClassInst.heap32[(r4 + 2)] = heapClassInst.heap32[(r5 + 2)];
          heapClassInst.heap32[(r4 + 3)] = heapClassInst.heap32[(r5 + 3)];
          if (r3 != r2) 
          {
            continue // repeat_25;
          }
          else {
            break // repeat_1;
          }
        }
      }
    }
  } while (false);
  heapClassInst.heap32[(r1 + 1)] = Int32(r3);
  return;
}

func _ZN17btConvexHullShapeC1EPKfii(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-32); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  heapClassInst.heap32[(r1 + 2)] = 0;
  heapClassInst.heap32[(r1 + 3)] = 1065353216;
  heapClassInst.heap32[(r1 + 4)] = 1065353216;
  heapClassInst.heap32[(r1 + 5)] = 1065353216;
  heapClassInst.heap32[(r1 + 6)] = 0;
  heapClassInst.heap32[(r1 + 11)] = 1025758986;
  heapClassInst.heap32[(r1 + 13)] = 1065353216;
  heapClassInst.heap32[(r1 + 14)] = 1065353216;
  heapClassInst.heap32[(r1 + 15)] = 1065353216;
  heapClassInst.heap32[(r1 + 16)] = 0;
  heapClassInst.heap32[(r1 + 17)] = ( -1082130432);
  heapClassInst.heap32[(r1 + 18)] = ( -1082130432);
  heapClassInst.heap32[(r1 + 19)] = ( -1082130432);
  r2 = _ZTV17btConvexHullShape;
  r3 = 0;
  heapClassInst.heap32[(r1 + 20)] = 0;
  r2 = (r2 + 8) | 0;
  heapClassInst.heap8[r0 + 84] = Int8(r3);
  r4 = 1;
  heapClassInst.heap32[(r1)] = Int32(r2);
  heapClassInst.heap8[r0 + 104] = Int8(r4);
  heapClassInst.heap32[(r1 + 25)] = 0;
  heapClassInst.heap32[(r1 + 23)] = 0;
  heapClassInst.heap32[(r1 + 24)] = 0;
  heapClassInst.heap32[(r1 + 1)] = 4;
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  r4 = (r0 + 88) | 0;
  r5 = sp + (-16);
  heapClassInst.heap32[(g0)] = Int32(r4);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  heapClassInst.heap32[(g0 + 2)] = Int32(r5);
  _ZN20btAlignedObjectArrayI9btVector3E6resizeEiRKS0_(i7);
  if (!(r2 < 1)) 
  {
    r4 = Int64(heapClassInst.heap32[(fp + 1)]);
    // repeat_3: 
    while (true) {
      r5 = r3 << 4;
      r6 = (r4 + r5) | 0;
      r6 = r6 >> 2;
      r7 = Int64(heapClassInst.heap32[(r1 + 25)]);
      r5 = (r7 + r5) | 0;
      f0 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
      f1 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
      r5 = r5 >> 2;
      heapClassInst.heap32[(r5)] = heapClassInst.heap32[(r6)];
      heapClassInst.heapFloat[(r5 + 1)] = Float32(f1);
      r3 = (r3 + 1) | 0;
      heapClassInst.heapFloat[(r5 + 2)] = Float32(f0);
      heapClassInst.heap32[(r5 + 3)] = 0;
      if (r2 != r3) 
      {
        continue // repeat_3;
      }
      else {
        break // repeat_3;
      }
    }
  }
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZN34btPolyhedralConvexAabbCachingShape15recalcLocalAabbEv(i7);
  return;
}

func _ZN21btConvexInternalShape15setLocalScalingERK9btVector3(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var f0: Float64 = 0.0
  var f1: Float64 = 0.0
  var f2: Float64 = 0.0
  var f3: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  f1 = 0.0;
  if (f0 < f1) 
  {
    f0 = -f0;
  }
  f2 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  if (f2 < f1) 
  {
    f2 = -f2;
  }
  f3 = Float64(heapClassInst.heapFloat[(r0)]);
  if (f3 < f1) 
  {
    f3 = -f3;
  }
  r0 = r1 >> 2;
  heapClassInst.heapFloat[(r0 + 3)] = Float32(f3);
  heapClassInst.heapFloat[(r0 + 4)] = Float32(f2);
  heapClassInst.heapFloat[(r0 + 5)] = Float32(f0);
  heapClassInst.heap32[(r0 + 6)] = 0;
  return;
}

func _ZNK21btConvexInternalShape11getAabbSlowERK11btTransformR9btVector3S4_(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-112); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  r5 = Int64(heapClassInst.heap32[(fp + 3)]);
  r6 = 0;
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f0 = commonVariable.f_g0;
  // repeat_1: 
  while (true) {
    r2 = sp + (-64);
    r7 = r2 >> 2;
    heapClassInst.heap32[(fp + (-16))] = 0;
    heapClassInst.heap32[(r7 + 1)] = 0;
    r8 = r6 << 2;
    r2 = (r2 - r8) | 0;
    heapClassInst.heap32[(r7 + 2)] = 0;
    r2 = r2 >> 2;
    heapClassInst.heap32[(r7 + 3)] = 0;
    heapClassInst.heap32[(r2)] = 1065353216;
    r9 = r3 >> 2;
    r10 = Int64(heapClassInst.heap32[(r1)]);
    f1 = Float64(heapClassInst.heapFloat[(fp + (-16))]);
    f2 = Float64(heapClassInst.heapFloat[(r9)]);
    f3 = Float64(heapClassInst.heapFloat[(r7 + 1)]);
    f4 = Float64(heapClassInst.heapFloat[(r9 + 4)]);
    r10 = r10 >> 2;
    f5 = Float64(heapClassInst.heapFloat[(r9 + 1)]);
    f6 = Float64(heapClassInst.heapFloat[(r9 + 5)]);
    f2 = f2 * f1;
    f4 = f4 * f3;
    f7 = Float64(heapClassInst.heapFloat[(r7 + 2)]);
    f8 = Float64(heapClassInst.heapFloat[(r9 + 8)]);
    f9 = Float64(heapClassInst.heapFloat[(r9 + 2)]);
    f10 = Float64(heapClassInst.heapFloat[(r9 + 6)]);
    f11 = Float64(heapClassInst.heapFloat[(r9 + 10)]);
    f12 = Float64(heapClassInst.heapFloat[(r9 + 9)]);
    r10 = Int64(heapClassInst.heap32[(r10 + 15)]);
    f5 = f5 * f1;
    f6 = f6 * f3;
    f2 = f2 + f4;
    f4 = f8 * f7;
    r11 = sp + (-48);
    f1 = f9 * f1;
    f3 = f10 * f3;
    f5 = f5 + f6;
    f6 = f12 * f7;
    f2 = f2 + f4;
    r12 = r11 >> 2;
    f1 = f1 + f3;
    f3 = f11 * f7;
    f4 = f5 + f6;
    heapClassInst.heapFloat[(fp + (-12))] = Float32(f2);
    f1 = f1 + f3;
    heapClassInst.heapFloat[(r12 + 1)] = Float32(f4);
    heapClassInst.heapFloat[(r12 + 2)] = Float32(f1);
    heapClassInst.heap32[(r12 + 3)] = 0;
    r12 = sp + (-80);
    heapClassInst.heap32[(g0)] = Int32(r12);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    heapClassInst.heap32[(g0 + 2)] = Int32(r11);
    __FUNCTION_TABLE__[(r10) >> 2](i7);
    r10 = r12 >> 2;
    f1 = Float64(heapClassInst.heapFloat[(fp + (-20))]);
    f2 = Float64(heapClassInst.heapFloat[(r9)]);
    f3 = Float64(heapClassInst.heapFloat[(r10 + 1)]);
    f4 = Float64(heapClassInst.heapFloat[(r9 + 1)]);
    f5 = Float64(heapClassInst.heapFloat[(r9 + 4)]);
    f6 = Float64(heapClassInst.heapFloat[(r9 + 5)]);
    f2 = f2 * f1;
    f4 = f4 * f3;
    f7 = Float64(heapClassInst.heapFloat[(r10 + 2)]);
    f8 = Float64(heapClassInst.heapFloat[(r9 + 2)]);
    f9 = Float64(heapClassInst.heapFloat[(r9 + 8)]);
    f10 = Float64(heapClassInst.heapFloat[(r9 + 9)]);
    f11 = Float64(heapClassInst.heapFloat[(r9 + 6)]);
    f5 = f5 * f1;
    f6 = f6 * f3;
    f2 = f2 + f4;
    f4 = f8 * f7;
    f8 = Float64(heapClassInst.heapFloat[(r9 + 10)]);
    f1 = f9 * f1;
    f3 = f10 * f3;
    f5 = f5 + f6;
    f6 = f11 * f7;
    f2 = f2 + f4;
    f4 = Float64(heapClassInst.heapFloat[(r9 + 12)]);
    f9 = Float64(heapClassInst.heapFloat[(r9 + 14)]);
    f10 = Float64(heapClassInst.heapFloat[(r9 + 13)]);
    r10 = sp + (-96);
    f5 = f5 + f6;
    f1 = f1 + f3;
    f3 = f8 * f7;
    f2 = f2 + f4;
    f1 = f1 + f3;
    f3 = f5 + f10;
    heapClassInst.heapFloat[(fp + (-24))] = Float32(f2);
    r11 = r10 >> 2;
    f1 = f1 + f9;
    heapClassInst.heapFloat[(r11 + 1)] = Float32(f3);
    heapClassInst.heapFloat[(r11 + 2)] = Float32(f1);
    r10 = (r10 - r8) | 0;
    heapClassInst.heap32[(r11 + 3)] = 0;
    r10 = r10 >> 2;
    r12 = (r5 - r8) | 0;
    f1 = Float64(heapClassInst.heapFloat[(r10)]);
    r12 = r12 >> 2;
    f1 = f1 + f0;
    heapClassInst.heapFloat[(r12)] = Float32(f1);
    heapClassInst.heap32[(r2)] = ( -1082130432);
    r2 = Int64(heapClassInst.heap32[(r1)]);
    f1 = Float64(heapClassInst.heapFloat[(fp + (-16))]);
    f2 = Float64(heapClassInst.heapFloat[(r9)]);
    f3 = Float64(heapClassInst.heapFloat[(r7 + 1)]);
    f4 = Float64(heapClassInst.heapFloat[(r9 + 4)]);
    r2 = r2 >> 2;
    f5 = Float64(heapClassInst.heapFloat[(r9 + 1)]);
    f6 = Float64(heapClassInst.heapFloat[(r9 + 5)]);
    f2 = f2 * f1;
    f4 = f4 * f3;
    f7 = Float64(heapClassInst.heapFloat[(r7 + 2)]);
    f8 = Float64(heapClassInst.heapFloat[(r9 + 8)]);
    f9 = Float64(heapClassInst.heapFloat[(r9 + 2)]);
    f10 = Float64(heapClassInst.heapFloat[(r9 + 6)]);
    f11 = Float64(heapClassInst.heapFloat[(r9 + 10)]);
    f12 = Float64(heapClassInst.heapFloat[(r9 + 9)]);
    r2 = Int64(heapClassInst.heap32[(r2 + 15)]);
    f5 = f5 * f1;
    f6 = f6 * f3;
    f2 = f2 + f4;
    f4 = f8 * f7;
    r7 = sp + (-16);
    f1 = f9 * f1;
    f3 = f10 * f3;
    f5 = f5 + f6;
    f6 = f12 * f7;
    f2 = f2 + f4;
    r12 = r7 >> 2;
    f1 = f1 + f3;
    f3 = f11 * f7;
    f4 = f5 + f6;
    heapClassInst.heapFloat[(fp + (-4))] = Float32(f2);
    f1 = f1 + f3;
    heapClassInst.heapFloat[(r12 + 1)] = Float32(f4);
    heapClassInst.heapFloat[(r12 + 2)] = Float32(f1);
    heapClassInst.heap32[(r12 + 3)] = 0;
    r12 = sp + (-32);
    heapClassInst.heap32[(g0)] = Int32(r12);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    heapClassInst.heap32[(g0 + 2)] = Int32(r7);
    __FUNCTION_TABLE__[(r2) >> 2](i7);
    r2 = r12 >> 2;
    f1 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
    f2 = Float64(heapClassInst.heapFloat[(r9)]);
    f3 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
    f4 = Float64(heapClassInst.heapFloat[(r9 + 1)]);
    f5 = Float64(heapClassInst.heapFloat[(r9 + 4)]);
    f6 = Float64(heapClassInst.heapFloat[(r9 + 5)]);
    f2 = f2 * f1;
    f4 = f4 * f3;
    f7 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
    f8 = Float64(heapClassInst.heapFloat[(r9 + 2)]);
    f9 = Float64(heapClassInst.heapFloat[(r9 + 8)]);
    f10 = Float64(heapClassInst.heapFloat[(r9 + 9)]);
    f11 = Float64(heapClassInst.heapFloat[(r9 + 6)]);
    f5 = f5 * f1;
    f6 = f6 * f3;
    f2 = f2 + f4;
    f4 = f8 * f7;
    f8 = Float64(heapClassInst.heapFloat[(r9 + 10)]);
    f1 = f9 * f1;
    f3 = f10 * f3;
    f5 = f5 + f6;
    f6 = f11 * f7;
    f2 = f2 + f4;
    f4 = Float64(heapClassInst.heapFloat[(r9 + 12)]);
    f9 = Float64(heapClassInst.heapFloat[(r9 + 14)]);
    f10 = Float64(heapClassInst.heapFloat[(r9 + 13)]);
    f5 = f5 + f6;
    f1 = f1 + f3;
    f3 = f8 * f7;
    f2 = f2 + f4;
    f1 = f1 + f3;
    f3 = f5 + f10;
    heapClassInst.heapFloat[(fp + (-24))] = Float32(f2);
    f1 = f1 + f9;
    heapClassInst.heapFloat[(r11 + 1)] = Float32(f3);
    heapClassInst.heapFloat[(r11 + 2)] = Float32(f1);
    heapClassInst.heap32[(r11 + 3)] = 0;
    r2 = (r4 - r8) | 0;
    f1 = Float64(heapClassInst.heapFloat[(r10)]);
    r6 = (r6 + (-1)) | 0;
    r2 = r2 >> 2;
    f1 = f1 - f0;
    heapClassInst.heapFloat[(r2)] = Float32(f1);
    if (r6 != ( -3)) 
    {
      continue // repeat_1;
    }
    else {
      break // repeat_1;
    }
  }
  return;
}

func _ZNK21btConvexInternalShape24localGetSupportingVertexERK9btVector3(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 16)]);
  r3 = Int64(heapClassInst.heap32[(fp)]);
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(g0)] = Int32(r3);
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  heapClassInst.heap32[(g0 + 2)] = Int32(r4);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f0 = commonVariable.f_g0;
  f1 = 0.0
  if (!(f0 == f1)) 
  {
    r2 = r4 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r2)]);
    f1 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
    f2 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
    f3 = f0 * f0;
    f4 = f1 * f1;
    f3 = f3 + f4;
    f4 = f2 * f2;
    f3 = f3 + f4;
    f4 = 1.4210854715202004e-014;
    f5 = -1.0
    f0 = if (f3 < f4) {f5} else {f0};
    f1 = if (f3 < f4) {f5} else {f1};
    f2 = if (f3 < f4) {f5} else {f2};
    f3 = f0 * f0;
    f4 = f1 * f1;
    f3 = f3 + f4;
    f4 = f2 * f2;
    f3 = f3 + f4;
    heapClassInst.heapFloat[(g0)] = Float32(f3);
    sqrtf(i7);
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1 + 11)]);
    f4 = 1.0;
    f3 = f4 / commonVariable.f_g0;
    heapClassInst.heap32[(g0)] = Int32(r0);
    r0 = r3 >> 2;
    __FUNCTION_TABLE__[(r1) >> 2](i7);
    f0 = f0 * f3;
    f0 = f0 * commonVariable.f_g0;
    f5 = Float64(heapClassInst.heapFloat[(r0)]);
    f0 = f5 + f0;
    f1 = f1 * f3;
    heapClassInst.heapFloat[(r0)] = Float32(f0);
    f0 = f1 * commonVariable.f_g0;
    f1 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
    f0 = f1 + f0;
    f1 = f2 * f3;
    heapClassInst.heapFloat[(r0 + 1)] = Float32(f0);
    f0 = f1 * commonVariable.f_g0;
    f1 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
    f0 = f1 + f0;
    heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
  }
  return;
}

func _ZN13btConvexShapeD1Ev(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV13btConvexShape;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN13btConvexShapeD0Ev(sp: Int64)
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
  r1 = _ZTV13btConvexShape;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
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

func _ZZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_EN20NodeTriangleCallbackD1Ev(sp: Int64)
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

func _ZZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_EN20NodeTriangleCallbackD0Ev(sp: Int64)
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

func _ZZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_EN20NodeTriangleCallback28internalProcessTriangleIndexEPS2_ii(sp: Int64)
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
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r1 >> 2;
  f0 = 999999984306749440.0;
  f1 = Float64(heapClassInst.heapFloat[(r0)]);
  f2 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f3 = ( -999999984306749440.0);
  f4 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f5 = Float64(heapClassInst.heapFloat[(r0 + 3)]);
  f6 = 0.0;
  r1 = Int64(heapClassInst.heap32[(r1 + 1)]);
  f7 = if (f1 < f0) {f1} else {f0};
  f8 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
  f1 = if (f1 > f3) {f1} else {f3};
  f9 = if (f2 < f0) {f2} else {f0};
  f10 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
  f2 = if (f2 > f3) {f2} else {f3};
  f0 = if (f4 < f0) {f4} else {f0};
  f11 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
  f3 = if (f4 > f3) {f4} else {f3};
  f4 = if (f5 < f6) {f5} else {f6};
  f12 = Float64(heapClassInst.heapFloat[(r0 + 7)]);
  f5 = if (f5 > f6) {f5} else {f6};
  r2 = r1 >> 2;
  f6 = if (f8 < f7) {f8} else {f7};
  f7 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
  f1 = if (f1 < f8) {f8} else {f1};
  f8 = if (f10 < f9) {f10} else {f9};
  f9 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
  f2 = if (f2 < f10) {f10} else {f2};
  f0 = if (f11 < f0) {f11} else {f0};
  f10 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
  f3 = if (f3 < f11) {f11} else {f3};
  f4 = if (f12 < f4) {f12} else {f4};
  f11 = Float64(heapClassInst.heapFloat[(r0 + 11)]);
  f5 = if (f5 < f12) {f12} else {f5};
  r0 = Int64(heapClassInst.heap32[(r2 + 2)]);
  r3 = Int64(heapClassInst.heap32[(r2 + 1)]);
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  r5 = Int64(heapClassInst.heap32[(fp + 3)]);
  f6 = if (f7 < f6) {f7} else {f6};
  f8 = if (f9 < f8) {f9} else {f8};
  f0 = if (f10 < f0) {f10} else {f0};
  f4 = if (f11 < f4) {f11} else {f4};
  f1 = if (f1 < f7) {f7} else {f1};
  f2 = if (f2 < f9) {f9} else {f2};
  f3 = if (f3 < f10) {f10} else {f3};
  f5 = if (f5 < f11) {f11} else {f5};
  if (r0 == r3) 
  {
    r6 = 1;
    r7 = r3 << 1;
    r7 = if (r3 == 0) {r6} else {r7};
    if (!(r0 >= r7)) 
    {
      if (r7 != 0) 
      {
        r0 = gNumAlignedAllocs;
        r0 = r0 >> 2;
        r8 = Int64(heapClassInst.heap32[(r0)]);
        r8 = (r8 + 1) | 0;
        r9 = r7 << 6;
        heapClassInst.heap32[(r0)] = Int32(r8);
        r0 = r9 | 19;
        heapClassInst.heap32[(g0)] = Int32(r0);
        mallocNew(i7);
        r0 = commonVariable.r_g0;
        if (r0 != 0) 
        {
          r3 = 0;
          r8 = (r0 + 4) | 0;
          r3 = (r3 - r8) | 0;
          r3 = r3 & 15;
          r3 = (r0 + r3) | 0;
          r8 = r3 >> 2;
          heapClassInst.heap32[(r8)] = Int32(r0);
          r0 = (r3 + 4) | 0;
          r3 = Int64(heapClassInst.heap32[(r2 + 1)]);
        }
      }
      else {
        r0 = 0;
      }
      if (!(r3 < 1)) 
      {
        r8 = 0;
        // repeat_11: 
        while (true) {
          r9 = Int64(heapClassInst.heap32[(r2 + 3)]);
          r10 = (r0 + r8) | 0;
          r9 = (r9 + r8) | 0;
          heapClassInst.heap32[(g0)] = Int32(r10);
          heapClassInst.heap32[(g0 + 1)] = Int32(r9);
          heapClassInst.heap32[(g0 + 2)] = 64;
          r3 = (r3 + (-1)) | 0;
          r8 = (r8 + 64) | 0;
          memcpy(i7);
          if (!(r3 != 0)) 
          {
            break // repeat_11;
          }
        }
      }
      r3 = Int64(heapClassInst.heap32[(r2 + 3)]);
      if (!(r3 == 0)) 
      {
        r8 = Int64(heapClassInst.heapU8[r1 + 16]);
        if (!(r8 == 0)) 
        {
          r8 = gNumAlignedFree;
          r8 = r8 >> 2;
          r9 = Int64(heapClassInst.heap32[(r8)]);
          r9 = (r9 + 1) | 0;
          r3 = r3 >> 2;
          heapClassInst.heap32[(r8)] = Int32(r9);
          r3 = Int64(heapClassInst.heap32[(r3 + (-1))]);
          heapClassInst.heap32[(g0)] = Int32(r3);
          free(i7);
        }
        heapClassInst.heap32[(r2 + 3)] = 0;
      }
      heapClassInst.heap8[r1 + 16] = Int8(r6);
      heapClassInst.heap32[(r2 + 3)] = Int32(r0);
      heapClassInst.heap32[(r2 + 2)] = Int32(r7);
      r3 = Int64(heapClassInst.heap32[(r2 + 1)]);
    }
  }
  r0 = r3 << 6;
  r1 = Int64(heapClassInst.heap32[(r2 + 3)]);
  r0 = (r1 + r0) | 0;
  r0 = r0 >> 2;
  heapClassInst.heapFloat[(r0)] = Float32(f6);
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f8);
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
  heapClassInst.heapFloat[(r0 + 3)] = Float32(f4);
  heapClassInst.heapFloat[(r0 + 4)] = Float32(f1);
  heapClassInst.heapFloat[(r0 + 5)] = Float32(f2);
  heapClassInst.heapFloat[(r0 + 6)] = Float32(f3);
  heapClassInst.heapFloat[(r0 + 7)] = Float32(f5);
  heapClassInst.heap32[(r0 + 8)] = ( -1);
  heapClassInst.heap32[(r0 + 9)] = Int32(r4);
  heapClassInst.heap32[(r0 + 10)] = Int32(r5);
  r0 = Int64(heapClassInst.heap32[(r2 + 1)]);
  r0 = (r0 + 1) | 0;
  heapClassInst.heap32[(r2 + 1)] = Int32(r0);
  return;
}

func _ZZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_EN29QuantizedNodeTriangleCallbackD1Ev(sp: Int64)
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

func _ZZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_EN29QuantizedNodeTriangleCallbackD0Ev(sp: Int64)
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

func _ZZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_EN29QuantizedNodeTriangleCallback28internalProcessTriangleIndexEPS2_ii(sp: Int64)
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
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  if (r0 < 1024) 
  {
    r1 = Int64(heapClassInst.heap32[(fp + 3)]);
    if (r1 < 2097152) 
    {
      if (r1 > ( -1)) 
      {
        r2 = Int64(heapClassInst.heap32[(fp)]);
        r3 = Int64(heapClassInst.heap32[(fp + 1)]);
        r4 = sp + (-32);
        r5 = r4 >> 2;
        heapClassInst.heap32[(fp + (-8))] = 1566444395;
        heapClassInst.heap32[(r5 + 1)] = 1566444395;
        heapClassInst.heap32[(r5 + 2)] = 1566444395;
        r6 = sp + (-48);
        heapClassInst.heap32[(r5 + 3)] = 0;
        r7 = r6 >> 2;
        heapClassInst.heap32[(fp + (-12))] = ( -581039253);
        heapClassInst.heap32[(r7 + 1)] = ( -581039253);
        heapClassInst.heap32[(r7 + 2)] = ( -581039253);
        r3 = r3 >> 2;
        heapClassInst.heap32[(r7 + 3)] = 0;
        f0 = Float64(heapClassInst.heapFloat[(r3)]);
        f1 = 999999984306749440.0;
        if (f0 < f1) 
        {
          heapClassInst.heapFloat[(fp + (-8))] = Float32(f0);
          f2 = f0;
        }
        else {
          f2 = f1;
        }
        f3 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
        if (f3 < f1) 
        {
          heapClassInst.heapFloat[(r5 + 1)] = Float32(f3);
          f1 = f3;
        }
        else {
          f1 = 999999984306749440.0;
        }
        f4 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
        f5 = 999999984306749440.0;
        if (f4 < f5) 
        {
          heapClassInst.heapFloat[(r5 + 2)] = Float32(f4);
          f5 = f4;
        }
        f6 = Float64(heapClassInst.heapFloat[(r3 + 3)]);
        f7 = 0.0;
        if (f6 < f7) 
        {
          heapClassInst.heapFloat[(r5 + 3)] = Float32(f6);
          f7 = f6;
        }
        f8 = ( -999999984306749440.0);
        if (f0 > f8) 
        {
          heapClassInst.heapFloat[(fp + (-12))] = Float32(f0);
        }
        else {
          f0 = f8;
        }
        if (f3 > f8) 
        {
          heapClassInst.heapFloat[(r7 + 1)] = Float32(f3);
        }
        else {
          f3 = ( -999999984306749440.0);
        }
        f8 = ( -999999984306749440.0);
        if (f4 > f8) 
        {
          heapClassInst.heapFloat[(r7 + 2)] = Float32(f4);
          f8 = f4;
        }
        f4 = 0.0;
        if (f6 > f4) 
        {
          heapClassInst.heapFloat[(r7 + 3)] = Float32(f6);
          f4 = f6;
        }
        f6 = Float64(heapClassInst.heapFloat[(r3 + 4)]);
        if (f6 < f2) 
        {
          heapClassInst.heapFloat[(fp + (-8))] = Float32(f6);
          f2 = f6;
        }
        f9 = Float64(heapClassInst.heapFloat[(r3 + 5)]);
        if (f9 < f1) 
        {
          heapClassInst.heapFloat[(r5 + 1)] = Float32(f9);
          f1 = f9;
        }
        f10 = Float64(heapClassInst.heapFloat[(r3 + 6)]);
        if (f10 < f5) 
        {
          heapClassInst.heapFloat[(r5 + 2)] = Float32(f10);
          f5 = f10;
        }
        f11 = Float64(heapClassInst.heapFloat[(r3 + 7)]);
        if (f11 < f7) 
        {
          heapClassInst.heapFloat[(r5 + 3)] = Float32(f11);
          f7 = f11;
        }
        if (f0 < f6) 
        {
          heapClassInst.heapFloat[(fp + (-12))] = Float32(f6);
          f0 = f6;
        }
        if (f3 < f9) 
        {
          heapClassInst.heapFloat[(r7 + 1)] = Float32(f9);
          f3 = f9;
        }
        if (f8 < f10) 
        {
          heapClassInst.heapFloat[(r7 + 2)] = Float32(f10);
          f8 = f10;
        }
        if (f4 < f11) 
        {
          heapClassInst.heapFloat[(r7 + 3)] = Float32(f11);
          f4 = f11;
        }
        f6 = Float64(heapClassInst.heapFloat[(r3 + 8)]);
        if (f6 < f2) 
        {
          heapClassInst.heapFloat[(fp + (-8))] = Float32(f6);
          f2 = f6;
        }
        f9 = Float64(heapClassInst.heapFloat[(r3 + 9)]);
        if (f9 < f1) 
        {
          heapClassInst.heapFloat[(r5 + 1)] = Float32(f9);
          f1 = f9;
        }
        f10 = Float64(heapClassInst.heapFloat[(r3 + 10)]);
        if (f10 < f5) 
        {
          heapClassInst.heapFloat[(r5 + 2)] = Float32(f10);
          f5 = f10;
        }
        f11 = Float64(heapClassInst.heapFloat[(r3 + 11)]);
        if (!(f11 >= f7)) 
        {
          heapClassInst.heapFloat[(r5 + 3)] = Float32(f11);
        }
        if (f0 < f6) 
        {
          heapClassInst.heapFloat[(fp + (-12))] = Float32(f6);
          f0 = f6;
        }
        if (f3 < f9) 
        {
          heapClassInst.heapFloat[(r7 + 1)] = Float32(f9);
          f3 = f9;
        }
        if (f8 < f10) 
        {
          heapClassInst.heapFloat[(r7 + 2)] = Float32(f10);
          f8 = f10;
        }
        if (!(f4 >= f11)) 
        {
          heapClassInst.heapFloat[(r7 + 3)] = Float32(f11);
        }
        f4 = f0 - f2;
        f6 = 0.0020000000949949026;
        if (!(f4 >= f6)) 
        {
          f4 = 0.0010000000474974513;
          f0 = f0 + f4;
          f4 = -0.0010000000474974513;
          f2 = f2 + f4;
          heapClassInst.heapFloat[(fp + (-12))] = Float32(f0);
          heapClassInst.heapFloat[(fp + (-8))] = Float32(f2);
        }
        f0 = f3 - f1;
        if (!(f0 >= f6)) 
        {
          f0 = 0.0010000000474974513;
          f2 = -0.0010000000474974513;
          f0 = f3 + f0;
          f1 = f1 + f2;
          heapClassInst.heapFloat[(r7 + 1)] = Float32(f0);
          heapClassInst.heapFloat[(r5 + 1)] = Float32(f1);
        }
        f0 = f8 - f5;
        if (!(f0 >= f6)) 
        {
          f0 = 0.0010000000474974513;
          f1 = -0.0010000000474974513;
          f0 = f8 + f0;
          f1 = f5 + f1;
          heapClassInst.heapFloat[(r7 + 2)] = Float32(f0);
          heapClassInst.heapFloat[(r5 + 2)] = Float32(f1);
        }
        r2 = r2 >> 2;
        r3 = Int64(heapClassInst.heap32[(r2 + 2)]);
        r5 = sp + (-16);
        heapClassInst.heap32[(g0)] = Int32(r3);
        heapClassInst.heap32[(g0 + 1)] = Int32(r5);
        heapClassInst.heap32[(g0 + 2)] = Int32(r4);
        heapClassInst.heap32[(g0 + 3)] = 0;
        _ZNK14btQuantizedBvh8quantizeEPtRK9btVector3i(i7);
        r3 = Int64(heapClassInst.heap32[(r2 + 2)]);
        r4 = (r5 + 6) | 0;
        heapClassInst.heap32[(g0)] = Int32(r3);
        heapClassInst.heap32[(g0 + 1)] = Int32(r4);
        heapClassInst.heap32[(g0 + 2)] = Int32(r6);
        heapClassInst.heap32[(g0 + 3)] = 1;
        r0 = r0 << 21;
        r0 = r0 | r1;
        _ZNK14btQuantizedBvh8quantizeEPtRK9btVector3i(i7);
        r1 = r5 >> 2;
        heapClassInst.heap32[(r1 + 3)] = Int32(r0);
        r1 = Int64(heapClassInst.heap32[(r2 + 1)]);
        r2 = r1 >> 2;
        r3 = Int64(heapClassInst.heap32[(r2 + 1)]);
        r4 = Int64(heapClassInst.heap32[(r2 + 2)]);
        if (r4 == r3) 
        {
          r4 = 1;
          r5 = r3 << 1;
          r3 = if (r3 == 0) {r4} else {r5};
          heapClassInst.heap32[(g0)] = Int32(r1);
          heapClassInst.heap32[(g0 + 1)] = Int32(r3);
          _ZN20btAlignedObjectArrayI18btQuantizedBvhNodeE7reserveEi(i7);
          r3 = Int64(heapClassInst.heap32[(r2 + 1)]);
        }
        r1 = Int64(heapClassInst.heap32[(r2 + 3)]);
        r4 = Int64(heapClassInst.heapU16[(sp + (-16)) >> 1]);
        r3 = r3 << 4;
        heapClassInst.heap16[(r1 + r3) >> 1] = Int16(r4);
        r1 = (r1 + r3) | 0;
        r3 = Int64(heapClassInst.heapU16[(sp + (-14)) >> 1]);
        heapClassInst.heap16[(r1 + 2) >> 1] = Int16(r3);
        r3 = Int64(heapClassInst.heapU16[(sp + (-12)) >> 1]);
        heapClassInst.heap16[(r1 + 4) >> 1] = Int16(r3);
        r3 = Int64(heapClassInst.heapU16[(sp + (-10)) >> 1]);
        heapClassInst.heap16[(r1 + 6) >> 1] = Int16(r3);
        r3 = Int64(heapClassInst.heapU16[(sp + (-8)) >> 1]);
        heapClassInst.heap16[(r1 + 8) >> 1] = Int16(r3);
        r3 = Int64(heapClassInst.heapU16[(sp + (-6)) >> 1]);
        r4 = r1 >> 2;
        heapClassInst.heap16[(r1 + 10) >> 1] = Int16(r3);
        heapClassInst.heap32[(r4 + 3)] = Int32(r0);
        r0 = Int64(heapClassInst.heap32[(r2 + 1)]);
        r0 = (r0 + 1) | 0;
        heapClassInst.heap32[(r2 + 1)] = Int32(r0);
        return;
      }
      else {
        r0 = _E2_str20316;
        r1 = _E2_str10306;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 103;
        _assert(i7);
      }
    }
    else {
      r0 = _E2_str19315;
      r1 = _E2_str10306;
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      heapClassInst.heap32[(g0 + 2)] = 101;
      _assert(i7);
    }
  }
  else {
    r0 = _E2_str18314;
    r1 = _E2_str10306;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = 100;
    _assert(i7);
  }
}

func _ZNK14btOptimizedBvh16serializeInPlaceEPvjb(sp: Int64)
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
  r3 = Int64(heapClassInst.heap32[(fp + 3)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  heapClassInst.heap32[(g0 + 2)] = Int32(r2);
  heapClassInst.heap32[(g0 + 3)] = Int32(r3);
  _ZNK14btQuantizedBvh9serializeEPvjb(i7);
  r0 = 1;
  commonVariable.r_g0 = r0;
  return;
}

func _ZN14btOptimizedBvhD0Ev(sp: Int64)
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
  r1 = _ZTV14btOptimizedBvh;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZN14btQuantizedBvhD2Ev(i7);
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

func _ZN14btOptimizedBvhD1Ev(sp: Int64)
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
  r1 = _ZTV14btOptimizedBvh;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZN14btQuantizedBvhD2Ev(i7);
  return;
}

func _ZNK23btPolyhedralConvexShape21calculateLocalInertiaEfR9btVector3(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-112); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  r3 = sp + (-64);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f0 = commonVariable.f_g0;
  r2 = r3 >> 2;
  heapClassInst.heap32[(fp + (-16))] = 1065353216;
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
  heapClassInst.heap32[(r2 + 15)] = 0;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 2)]);
  r2 = sp + (-80);
  r4 = sp + (-96);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
  heapClassInst.heap32[(g0 + 2)] = Int32(r2);
  heapClassInst.heap32[(g0 + 3)] = Int32(r4);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = r4 >> 2;
  r1 = r2 >> 2;
  f1 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
  f2 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f3 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
  f4 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f3 = f3 - f4;
  f4 = 0.5;
  f1 = f1 - f2;
  f2 = Float64(heapClassInst.heapFloat[(fp + (-24))]);
  f5 = Float64(heapClassInst.heapFloat[(fp + (-20))]);
  f2 = f2 - f5;
  f3 = f3 * f4;
  f1 = f1 * f4;
  f2 = f2 * f4;
  f3 = f3 + f0;
  f1 = f1 + f0;
  f0 = f2 + f0;
  f2 = f3 + f3;
  f1 = f1 + f1;
  f0 = f0 + f0;
  f2 = f2 * f2;
  f1 = f1 * f1;
  f3 = Float64(heapClassInst.heapFloat[(fp + 1)]);
  f4 = 0.083333328366279602;
  f0 = f0 * f0;
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  f5 = f2 + f1;
  f3 = f3 * f4;
  f1 = f0 + f1;
  r0 = r0 >> 2;
  f4 = f5 * f3;
  f0 = f0 + f2;
  f1 = f1 * f3;
  heapClassInst.heapFloat[(r0)] = Float32(f4);
  f0 = f0 * f3;
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f1);
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
  heapClassInst.heap32[(r0 + 3)] = 0;
  return;
}

func _ZNK34btPolyhedralConvexAabbCachingShape7getAabbERK11btTransformR9btVector3S4_(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var f0: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  f0 = commonVariable.f_g0;
  r1 = Int64(heapClassInst.heapU8[r0 + 84]);
  if (r1 != 0) 
  {
    r1 = Int64(heapClassInst.heap32[(fp + 1)]);
    r2 = Int64(heapClassInst.heap32[(fp + 2)]);
    r3 = Int64(heapClassInst.heap32[(fp + 3)]);
    r4 = (r0 + 52) | 0;
    r0 = (r0 + 68) | 0;
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    heapClassInst.heapFloat[(g0 + 2)] = Float32(f0);
    heapClassInst.heap32[(g0 + 3)] = Int32(r1);
    heapClassInst.heap32[(g0 + 4)] = Int32(r2);
    heapClassInst.heap32[(g0 + 5)] = Int32(r3);
    _Z15btTransformAabbRK9btVector3S1_fRK11btTransformRS_S5_(i7);
    return;
  }
  else {
    r0 = _E2_str6232;
    r1 = _E2_str7331;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = 86;
    _assert(i7);
  }
}

func _ZN34btPolyhedralConvexAabbCachingShape15recalcLocalAabbEv(sp: Int64)
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
  i7 = sp + (-112); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = 1;
  r2 = _ZGVZN34btPolyhedralConvexAabbCachingShape15recalcLocalAabbEvE11_directions;
  heapClassInst.heap8[r0 + 84] = Int8(r1);
  r3 = Int64(heapClassInst.heapU8[r2]);
  if (!(r3 != 0)) 
  {
    r3 = _ZZN34btPolyhedralConvexAabbCachingShape15recalcLocalAabbEvE11_directions;
    r3 = r3 >> 2;
    heapClassInst.heap32[(r3)] = 1065353216;
    heapClassInst.heap32[(r3 + 1)] = 0;
    heapClassInst.heap32[(r3 + 2)] = 0;
    heapClassInst.heap32[(r3 + 3)] = 0;
    heapClassInst.heap32[(r3 + 4)] = 0;
    heapClassInst.heap32[(r3 + 5)] = 1065353216;
    heapClassInst.heap32[(r3 + 6)] = 0;
    heapClassInst.heap32[(r3 + 7)] = 0;
    heapClassInst.heap32[(r3 + 8)] = 0;
    heapClassInst.heap32[(r3 + 9)] = 0;
    heapClassInst.heap32[(r3 + 10)] = 1065353216;
    heapClassInst.heap32[(r3 + 11)] = 0;
    heapClassInst.heap32[(r3 + 12)] = ( -1082130432);
    heapClassInst.heap32[(r3 + 13)] = 0;
    heapClassInst.heap32[(r3 + 14)] = 0;
    heapClassInst.heap32[(r3 + 15)] = 0;
    heapClassInst.heap32[(r3 + 16)] = 0;
    heapClassInst.heap32[(r3 + 17)] = ( -1082130432);
    heapClassInst.heap32[(r3 + 18)] = 0;
    heapClassInst.heap32[(r3 + 19)] = 0;
    heapClassInst.heap32[(r3 + 20)] = 0;
    heapClassInst.heap32[(r3 + 21)] = 0;
    heapClassInst.heap32[(r3 + 22)] = ( -1082130432);
    heapClassInst.heap32[(r3 + 23)] = 0;
    heapClassInst.heap8[r2] = Int8(r1);
  }
  r1 = sp + (-96);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = 0;
  heapClassInst.heap32[(g0 + 2)] = 96;
  r2 = r0 >> 2;
  memset(i7);
  r3 = Int64(heapClassInst.heap32[(r2)]);
  r3 = r3 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3 + 17)]);
  r4 = _ZZN34btPolyhedralConvexAabbCachingShape15recalcLocalAabbEvE11_directions;
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r4);
  heapClassInst.heap32[(g0 + 2)] = Int32(r1);
  heapClassInst.heap32[(g0 + 3)] = 6;
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  f0 = Float64(heapClassInst.heapFloat[(fp + (-24))]);
  f1 = Float64(heapClassInst.heapFloat[(r2 + 11)]);
  f0 = f0 + f1;
  r0 = r1 >> 2;
  heapClassInst.heapFloat[(r2 + 17)] = Float32(f0);
  f0 = Float64(heapClassInst.heapFloat[(r0 + 12)]);
  f0 = f0 - f1;
  heapClassInst.heapFloat[(r2 + 13)] = Float32(f0);
  f0 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
  f0 = f0 + f1;
  heapClassInst.heapFloat[(r2 + 18)] = Float32(f0);
  f0 = Float64(heapClassInst.heapFloat[(r0 + 17)]);
  f0 = f0 - f1;
  heapClassInst.heapFloat[(r2 + 14)] = Float32(f0);
  f0 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
  f0 = f0 + f1;
  heapClassInst.heapFloat[(r2 + 19)] = Float32(f0);
  f0 = Float64(heapClassInst.heapFloat[(r0 + 22)]);
  f0 = f0 - f1;
  heapClassInst.heapFloat[(r2 + 15)] = Float32(f0);
  return;
}

func _ZNK13btSphereShape37localGetSupportingVertexWithoutMarginERK9btVector3(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  heapClassInst.heap32[(r0)] = 0;
  heapClassInst.heap32[(r0 + 1)] = 0;
  heapClassInst.heap32[(r0 + 2)] = 0;
  heapClassInst.heap32[(r0 + 3)] = 0;
  return;
}

func _ZNK13btSphereShape7getNameEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = _E2_str342;
  commonVariable.r_g0 = r0;
  return;
}

func _ZN13btSphereShape9setMarginEf(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  heapClassInst.heap32[(r0 + 11)] = heapClassInst.heap32[(fp + 1)];
  return;
}

func _ZNK13btSphereShape9getMarginEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var f0: Float64 = 0.0
  var f1: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  f0 = Float64(heapClassInst.heapFloat[(r0 + 7)]);
  f1 = Float64(heapClassInst.heapFloat[(r0 + 3)]);
  f0 = f0 * f1;
  commonVariable.f_g0 = f0;
  return;
}

func _ZNK13btSphereShape49batchedUnitVectorGetSupportingVertexWithoutMarginEPK9btVector3PS0_i(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 3)]);
  if (!(r0 < 1)) 
  {
    r1 = Int64(heapClassInst.heap32[(fp + 2)]);
    r1 = (r1 + 8) | 0;
    // repeat_3: 
    while (true) {
      r2 = r1 >> 2;
      heapClassInst.heap32[(r2 + (-2))] = 0;
      heapClassInst.heap32[(r2 + (-1))] = 0;
      r0 = (r0 + (-1)) | 0;
      r1 = (r1 + 16) | 0;
      heapClassInst.heap32[(r2)] = 0;
      heapClassInst.heap32[(r2 + 1)] = 0;
      if (r0 != 0) 
      {
        continue // repeat_3;
      }
      else {
        break // repeat_3;
      }
    }
  }
  return;
}

func _ZNK13btSphereShape7getAabbERK11btTransformR9btVector3S4_(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f0 = commonVariable.f_g0;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  f1 = commonVariable.f_g0;
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 11)]);
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  r0 = r2 >> 2;
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  f3 = Float64(heapClassInst.heapFloat[(r0 + 14)]);
  f4 = Float64(heapClassInst.heapFloat[(r0 + 13)]);
  f5 = Float64(heapClassInst.heapFloat[(r0 + 12)]);
  r1 = r1 >> 2;
  f5 = f5 - commonVariable.f_g0;
  f4 = f4 - f1;
  heapClassInst.heapFloat[(r1)] = Float32(f5);
  f3 = f3 - f0;
  heapClassInst.heapFloat[(r1 + 1)] = Float32(f4);
  heapClassInst.heapFloat[(r1 + 2)] = Float32(f3);
  heapClassInst.heap32[(r1 + 3)] = 0;
  r1 = Int64(heapClassInst.heap32[(fp + 3)]);
  f3 = Float64(heapClassInst.heapFloat[(r0 + 14)]);
  f4 = Float64(heapClassInst.heapFloat[(r0 + 13)]);
  f5 = Float64(heapClassInst.heapFloat[(r0 + 12)]);
  r0 = r1 >> 2;
  f2 = f5 + commonVariable.f_g0;
  f1 = f4 + f1;
  heapClassInst.heapFloat[(r0)] = Float32(f2);
  f0 = f3 + f0;
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f1);
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
  heapClassInst.heap32[(r0 + 3)] = 0;
  return;
}

func _ZNK13btSphereShape21calculateLocalInertiaEfR9btVector3(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var f0: Float64 = 0.0
  var f1: Float64 = 0.0
  var f2: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 11)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 11)]);
  f1 = Float64(heapClassInst.heapFloat[(fp + 1)]);
  f2 = 0.40000000596046448;
  f1 = f1 * f2;
  heapClassInst.heap32[(g0)] = Int32(r0);
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  f0 = f1 * commonVariable.f_g0;
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  r0 = r0 >> 2;
  f0 = f0 * commonVariable.f_g0;
  heapClassInst.heapFloat[(r0)] = Float32(f0);
  heapClassInst.heapFloat[(r0 + 1)] = Float32(f0);
  heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
  heapClassInst.heap32[(r0 + 3)] = 0;
  return;
}

func _ZN13btSphereShapeD0Ev(sp: Int64)
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
  r1 = _ZTV13btConvexShape;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
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

func _ZN13btSphereShapeD1Ev(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTV13btConvexShape;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZNK13btSphereShape24localGetSupportingVertexERK9btVector3(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-32); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 16)]);
  r3 = Int64(heapClassInst.heap32[(fp + 2)]);
  r4 = sp + (-16);
  heapClassInst.heap32[(g0)] = Int32(r4);
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  heapClassInst.heap32[(g0 + 2)] = Int32(r3);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = r4 >> 2;
  r4 = Int64(heapClassInst.heap32[(fp)]);
  f0 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
  f1 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
  f2 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
  r4 = r4 >> 2;
  r3 = r3 >> 2;
  heapClassInst.heap32[(r4 + 3)] = heapClassInst.heap32[(r2 + 3)];
  f3 = Float64(heapClassInst.heapFloat[(r3)]);
  f4 = Float64(heapClassInst.heapFloat[(r3 + 1)]);
  f5 = Float64(heapClassInst.heapFloat[(r3 + 2)]);
  f6 = f3 * f3;
  f7 = f4 * f4;
  f6 = f6 + f7;
  f7 = f5 * f5;
  f6 = f6 + f7;
  f7 = 1.4210854715202004e-014;
  f8 = ( -1.0);
  f3 = if (f6 < f7) {f8} else {f3};
  f4 = if (f6 < f7) {f8} else {f4};
  f5 = if (f6 < f7) {f8} else {f5};
  f6 = f3 * f3;
  f7 = f4 * f4;
  f6 = f6 + f7;
  f7 = f5 * f5;
  f6 = f6 + f7;
  heapClassInst.heapFloat[(g0)] = Float32(f6);
  sqrtf(i7);
  r1 = Int64(heapClassInst.heap32[(r1)]);
  r1 = r1 >> 2;
  r1 = Int64(heapClassInst.heap32[(r1 + 11)]);
  f7 = 1.0;
  f6 = f7 / commonVariable.f_g0;
  heapClassInst.heap32[(g0)] = Int32(r0);
  f3 = f3 * f6;
  __FUNCTION_TABLE__[(r1) >> 2](i7);
  f4 = f4 * f6;
  f3 = f3 * commonVariable.f_g0;
  f5 = f5 * f6;
  f4 = f4 * commonVariable.f_g0;
  f0 = f0 + f3;
  f3 = f5 * commonVariable.f_g0;
  f1 = f1 + f4;
  heapClassInst.heapFloat[(r4)] = Float32(f0);
  f0 = f2 + f3;
  heapClassInst.heapFloat[(r4 + 1)] = Float32(f1);
  heapClassInst.heapFloat[(r4 + 2)] = Float32(f0);
  return;
}

func _ZNK23btStridingMeshInterface14hasPremadeAabbEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = 0;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK23btStridingMeshInterface14setPremadeAabbERK9btVector3S2_(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  return;
}

func _ZNK23btStridingMeshInterface14getPremadeAabbEP9btVector3S1_(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  return;
}

func _ZNK23btStridingMeshInterface28calculateSerializeBufferSizeEv(sp: Int64)
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = 28;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK23btStridingMeshInterface9serializeEPvP12btSerializer(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-72); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 7)]);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = commonVariable.r_g0;
  r3 = r3 >> 2;
  heapClassInst.heap32[(r3 + 5)] = Int32(r2);
  heapClassInst.heap32[(r3)] = 0;
  if (!(r2 == 0)) 
  {
    r4 = Int64(heapClassInst.heap32[(fp + 2)]);
    r5 = r4 >> 2;
    r6 = Int64(heapClassInst.heap32[(r5)]);
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6 + 4)]);
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0 + 1)] = 28;
    heapClassInst.heap32[(g0 + 2)] = Int32(r2);
    __FUNCTION_TABLE__[(r6) >> 2](i7);
    r2 = commonVariable.r_g0;
    r6 = Int64(heapClassInst.heap32[(r5)]);
    r6 = r6 >> 2;
    r7 = r2 >> 2;
    r7 = Int64(heapClassInst.heap32[(r7 + 2)]);
    r6 = Int64(heapClassInst.heap32[(r6 + 7)]);
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0 + 1)] = Int32(r7);
    __FUNCTION_TABLE__[(r6) >> 2](i7);
    heapClassInst.heap32[(r3)] = Int32(commonVariable.r_g0);
    r6 = Int64(heapClassInst.heap32[(r1)]);
    r6 = r6 >> 2;
    r6 = Int64(heapClassInst.heap32[(r6 + 7)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    r8 = 0;
    __FUNCTION_TABLE__[(r6) >> 2](i7);
    r6 = commonVariable.r_g0;
    // repeat_3: 
    while (true) {
      if (r8 < r6) 
      {
        r9 = Int64(heapClassInst.heap32[(r1)]);
        r9 = r9 >> 2;
        r9 = Int64(heapClassInst.heap32[(r9 + 4)]);
        r10 = sp + (-4);
        r11 = sp + (-28);
        r12 = sp + (-16);
        r13 = sp + (-24);
        r14 = sp + (-8);
        r15 = sp + (-12);
        r16 = sp + (-32);
        r17 = sp + (-20);
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r10);
        heapClassInst.heap32[(g0 + 2)] = Int32(r11);
        heapClassInst.heap32[(g0 + 3)] = Int32(r12);
        heapClassInst.heap32[(g0 + 4)] = Int32(r13);
        heapClassInst.heap32[(g0 + 5)] = Int32(r14);
        heapClassInst.heap32[(g0 + 6)] = Int32(r15);
        heapClassInst.heap32[(g0 + 7)] = Int32(r16);
        heapClassInst.heap32[(g0 + 8)] = Int32(r17);
        heapClassInst.heap32[(g0 + 9)] = Int32(r8);
        __FUNCTION_TABLE__[(r9) >> 2](i7);
        r9 = r7 >> 2;
        r10 = Int64(heapClassInst.heap32[(fp + (-8))]);
        heapClassInst.heap32[(r9 + 5)] = Int32(r10);
        r10 = Int64(heapClassInst.heap32[(fp + (-7))]);
        heapClassInst.heap32[(r9 + 6)] = Int32(r10);
        heapClassInst.heap32[(r9 + 4)] = 0;
        heapClassInst.heap32[(r9 + 2)] = 0;
        heapClassInst.heap32[(r9 + 3)] = 0;
        heapClassInst.heap32[(r9)] = 0;
        heapClassInst.heap32[(r9 + 1)] = 0;
        r10 = Int64(heapClassInst.heap32[(fp + (-5))]);
        if (r10 == 3) 
        {
          r10 = Int64(heapClassInst.heap32[(fp + (-8))]);
          if (!(r10 == 0)) 
          {
            r11 = Int64(heapClassInst.heap32[(r5)]);
            r11 = r11 >> 2;
            r11 = Int64(heapClassInst.heap32[(r11 + 4)]);
            heapClassInst.heap32[(g0)] = Int32(r4);
            heapClassInst.heap32[(g0 + 1)] = 8;
            heapClassInst.heap32[(g0 + 2)] = Int32(r10);
            __FUNCTION_TABLE__[(r11) >> 2](i7);
            r10 = commonVariable.r_g0;
            r11 = Int64(heapClassInst.heap32[(r5)]);
            r11 = r11 >> 2;
            r12 = r10 >> 2;
            r12 = Int64(heapClassInst.heap32[(r12 + 2)]);
            r11 = Int64(heapClassInst.heap32[(r11 + 7)]);
            heapClassInst.heap32[(g0)] = Int32(r4);
            heapClassInst.heap32[(g0 + 1)] = Int32(r12);
            __FUNCTION_TABLE__[(r11) >> 2](i7);
            heapClassInst.heap32[(r9 + 3)] = Int32(commonVariable.r_g0);
            r11 = Int64(heapClassInst.heap32[(fp + (-8))]);
            if (!(r11 < 1)) 
            {
              r11 = 0;
              // repeat_11: 
              while (true) {
                r13 = Int64(heapClassInst.heap32[(fp + (-3))]);
                r13 = (r13 * r11) | 0;
                r14 = Int64(heapClassInst.heap32[(fp + (-2))]);
                r15 = Int64(heapClassInst.heapU16[(r14 + r13) >> 1]);
                r16 = r11 << 3;
                r13 = (r14 + r13) | 0;
                heapClassInst.heap16[(r12 + r16) >> 1] = Int16(r15);
                r14 = (r12 + r16) | 0;
                r15 = Int64(heapClassInst.heapU16[(r13 + 2) >> 1]);
                heapClassInst.heap16[(r14 + 2) >> 1] = Int16(r15);
                r13 = Int64(heapClassInst.heapU16[(r13 + 4) >> 1]);
                r11 = (r11 + 1) | 0;
                heapClassInst.heap16[(r14 + 4) >> 1] = Int16(r13);
                r13 = Int64(heapClassInst.heap32[(fp + (-8))]);
                if (!(r11 < r13)) 
                {
                  break // repeat_11;
                }
              }
            }
            r11 = Int64(heapClassInst.heap32[(r5)]);
            r11 = r11 >> 2;
            r12 = r10 >> 2;
            r11 = Int64(heapClassInst.heap32[(r11 + 5)]);
            r12 = Int64(heapClassInst.heap32[(r12 + 2)]);
            r13 = _E2_str1350;
            heapClassInst.heap32[(g0)] = Int32(r4);
            heapClassInst.heap32[(g0 + 1)] = Int32(r10);
            heapClassInst.heap32[(g0 + 2)] = Int32(r13);
            heapClassInst.heap32[(g0 + 3)] = 1497453121;
            heapClassInst.heap32[(g0 + 4)] = Int32(r12);
            __FUNCTION_TABLE__[(r11) >> 2](i7);
          }
        }
        else {
          if (r10 != 2) 
          {
            __label__ = 14;
            break // repeat_3;
          }
          else {
            r10 = Int64(heapClassInst.heap32[(fp + (-8))]);
            r10 = (r10 * 3) | 0;
            if (!(r10 == 0)) 
            {
              r11 = Int64(heapClassInst.heap32[(r5)]);
              r11 = r11 >> 2;
              r11 = Int64(heapClassInst.heap32[(r11 + 4)]);
              heapClassInst.heap32[(g0)] = Int32(r4);
              heapClassInst.heap32[(g0 + 1)] = 4;
              heapClassInst.heap32[(g0 + 2)] = Int32(r10);
              __FUNCTION_TABLE__[(r11) >> 2](i7);
              r10 = commonVariable.r_g0;
              r11 = Int64(heapClassInst.heap32[(r5)]);
              r11 = r11 >> 2;
              r12 = r10 >> 2;
              r12 = Int64(heapClassInst.heap32[(r12 + 2)]);
              r11 = Int64(heapClassInst.heap32[(r11 + 7)]);
              heapClassInst.heap32[(g0)] = Int32(r4);
              heapClassInst.heap32[(g0 + 1)] = Int32(r12);
              __FUNCTION_TABLE__[(r11) >> 2](i7);
              heapClassInst.heap32[(r9 + 2)] = Int32(commonVariable.r_g0);
              r11 = Int64(heapClassInst.heap32[(fp + (-8))]);
              // repeat_17: 
              do {
                if (!(r11 < 1)) 
                {
                  r11 = 0;
                  // repeat_19: 
                  while (true) {
                    r13 = Int64(heapClassInst.heap32[(fp + (-3))]);
                    r13 = (r13 * r11) | 0;
                    r14 = Int64(heapClassInst.heap32[(fp + (-2))]);
                    r15 = (r11 * 3) | 0;
                    r13 = (r14 + r13) | 0;
                    r13 = r13 >> 2;
                    r14 = r15 << 2;
                    r14 = (r12 + r14) | 0;
                    r15 = Int64(heapClassInst.heap32[(r13)]);
                    r14 = r14 >> 2;
                    heapClassInst.heap32[(r14)] = Int32(r15);
                    r15 = Int64(heapClassInst.heap32[(r13 + 1)]);
                    heapClassInst.heap32[(r14 + 1)] = Int32(r15);
                    r13 = Int64(heapClassInst.heap32[(r13 + 2)]);
                    r11 = (r11 + 1) | 0;
                    heapClassInst.heap32[(r14 + 2)] = Int32(r13);
                    r13 = Int64(heapClassInst.heap32[(fp + (-8))]);
                    if (!(r11 < r13)) 
                    {
                      break // repeat_17;
                    }
                  }
                }
              } while (false);
              r11 = Int64(heapClassInst.heap32[(r5)]);
              r11 = r11 >> 2;
              r12 = r10 >> 2;
              r11 = Int64(heapClassInst.heap32[(r11 + 5)]);
              r12 = Int64(heapClassInst.heap32[(r12 + 2)]);
              r13 = _E2_str349;
              heapClassInst.heap32[(g0)] = Int32(r4);
              heapClassInst.heap32[(g0 + 1)] = Int32(r10);
              heapClassInst.heap32[(g0 + 2)] = Int32(r13);
              heapClassInst.heap32[(g0 + 3)] = 1497453121;
              heapClassInst.heap32[(g0 + 4)] = Int32(r12);
              __FUNCTION_TABLE__[(r11) >> 2](i7);
            }
          }
        }
        r10 = Int64(heapClassInst.heap32[(fp + (-4))]);
        // repeat_23: 
        do {
          if (r10 == 1) 
          {
            r10 = Int64(heapClassInst.heap32[(fp + (-7))]);
            if (r10 == 0) 
            {
              break //repeat_23;
            }
            else {
              r11 = Int64(heapClassInst.heap32[(r5)]);
              r11 = r11 >> 2;
              r11 = Int64(heapClassInst.heap32[(r11 + 4)]);
              heapClassInst.heap32[(g0)] = Int32(r4);
              heapClassInst.heap32[(g0 + 1)] = 32;
              heapClassInst.heap32[(g0 + 2)] = Int32(r10);
              __FUNCTION_TABLE__[(r11) >> 2](i7);
              r10 = commonVariable.r_g0;
              r11 = Int64(heapClassInst.heap32[(r5)]);
              r11 = r11 >> 2;
              r12 = r10 >> 2;
              r12 = Int64(heapClassInst.heap32[(r12 + 2)]);
              r11 = Int64(heapClassInst.heap32[(r11 + 7)]);
              heapClassInst.heap32[(g0)] = Int32(r4);
              heapClassInst.heap32[(g0 + 1)] = Int32(r12);
              __FUNCTION_TABLE__[(r11) >> 2](i7);
              heapClassInst.heap32[(r9 + 1)] = Int32(commonVariable.r_g0);
              r9 = Int64(heapClassInst.heap32[(fp + (-7))]);
              // repeat_26: 
              do {
                if (!(r9 < 1)) 
                {
                  r11 = Int64(heapClassInst.heap32[(fp + (-1))]);
                  r13 = Int64(heapClassInst.heap32[(fp + (-6))]);
                  r11 = (r11 + 16) | 0;
                  r14 = 0;
                  // repeat_28: 
                  while (true) {
                    r15 = r14 << 5;
                    r15 = (r12 + r15) | 0;
                    llvm_move_double(r15, r11 + (-16));
                    r14 = (r14 + 1) | 0;
                    r16 = (r11 + r13) | 0;
                    llvm_move_double(r15 + 8, r11 + (-8));
                    llvm_move_double(r15 + 16, r11);
                    r11 = r16;
                    if (!(r14 < r9)) 
                    {
                      break //repeat_26;
                    }
                  }
                }
              } while (false);
              r9 = Int64(heapClassInst.heap32[(r5)]);
              r9 = r9 >> 2;
              r11 = r10 >> 2;
              r9 = Int64(heapClassInst.heap32[(r9 + 5)]);
              r11 = Int64(heapClassInst.heap32[(r11 + 2)]);
              r12 = _E2_str5354;
              heapClassInst.heap32[(g0)] = Int32(r4);
              heapClassInst.heap32[(g0 + 1)] = Int32(r10);
              heapClassInst.heap32[(g0 + 2)] = Int32(r12);
              heapClassInst.heap32[(g0 + 3)] = 1497453121;
              heapClassInst.heap32[(g0 + 4)] = Int32(r11);
              __FUNCTION_TABLE__[(r9) >> 2](i7);
            }
          }
          else {
            if (r10 != 0) 
            {
              if (!(`UIntNative`(r10) < `UIntNative`(2))) 
              {
                __label__ = 28;
                break // repeat_3;
              }
            }
            else {
              r10 = Int64(heapClassInst.heap32[(fp + (-7))]);
              if (!(r10 == 0)) 
              {
                r11 = Int64(heapClassInst.heap32[(r5)]);
                r11 = r11 >> 2;
                r11 = Int64(heapClassInst.heap32[(r11 + 4)]);
                heapClassInst.heap32[(g0)] = Int32(r4);
                heapClassInst.heap32[(g0 + 1)] = 16;
                heapClassInst.heap32[(g0 + 2)] = Int32(r10);
                __FUNCTION_TABLE__[(r11) >> 2](i7);
                r10 = commonVariable.r_g0;
                r11 = Int64(heapClassInst.heap32[(r5)]);
                r11 = r11 >> 2;
                r12 = r10 >> 2;
                r12 = Int64(heapClassInst.heap32[(r12 + 2)]);
                r11 = Int64(heapClassInst.heap32[(r11 + 7)]);
                heapClassInst.heap32[(g0)] = Int32(r4);
                heapClassInst.heap32[(g0 + 1)] = Int32(r12);
                __FUNCTION_TABLE__[(r11) >> 2](i7);
                heapClassInst.heap32[(r9)] = Int32(commonVariable.r_g0);
                r9 = Int64(heapClassInst.heap32[(fp + (-7))]);
                // repeat_36: 
                do {
                  if (!(r9 < 1)) 
                  {
                    r9 = 0;
                    // repeat_38: 
                    while (true) {
                      r11 = Int64(heapClassInst.heap32[(fp + (-6))]);
                      r13 = Int64(heapClassInst.heap32[(fp + (-1))]);
                      r11 = (r11 * r9) | 0;
                      r14 = r9 << 4;
                      r14 = (r12 + r14) | 0;
                      r11 = (r13 + r11) | 0;
                      r13 = r14 >> 2;
                      r11 = r11 >> 2;
                      heapClassInst.heap32[(r13)] = heapClassInst.heap32[(r11)];
                      r9 = (r9 + 1) | 0;
                      heapClassInst.heap32[(r13 + 1)] = heapClassInst.heap32[(r11 + 1)];
                      heapClassInst.heap32[(r13 + 2)] = heapClassInst.heap32[(r11 + 2)];
                      r11 = Int64(heapClassInst.heap32[(fp + (-7))]);
                      if (!(r9 < r11)) 
                      {
                        break // repeat_36;
                      }
                    }
                  }
                } while (false);
                r9 = Int64(heapClassInst.heap32[(r5)]);
                r9 = r9 >> 2;
                r11 = r10 >> 2;
                r9 = Int64(heapClassInst.heap32[(r9 + 5)]);
                r11 = Int64(heapClassInst.heap32[(r11 + 2)]);
                r12 = _E2_str5223;
                heapClassInst.heap32[(g0)] = Int32(r4);
                heapClassInst.heap32[(g0 + 1)] = Int32(r10);
                heapClassInst.heap32[(g0 + 2)] = Int32(r12);
                heapClassInst.heap32[(g0 + 3)] = 1497453121;
                heapClassInst.heap32[(g0 + 4)] = Int32(r11);
                __FUNCTION_TABLE__[(r9) >> 2](i7);
              }
            }
          }
        } while (false);
        r9 = Int64(heapClassInst.heap32[(r1)]);
        r9 = r9 >> 2;
        r9 = Int64(heapClassInst.heap32[(r9 + 6)]);
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r8);
        r8 = (r8 + 1) | 0;
        r7 = (r7 + 28) | 0;
        __FUNCTION_TABLE__[(r9) >> 2](i7);
      }
      else {
        __label__ = 31;
        break // repeat_3;
      }
    }
    match (__label__) {
      case 31 =>
        r0 = Int64(heapClassInst.heap32[(r5)]);
        r0 = r0 >> 2;
        r5 = r2 >> 2;
        r0 = Int64(heapClassInst.heap32[(r0 + 5)]);
        r5 = Int64(heapClassInst.heap32[(r5 + 2)]);
        r6 = _E2_str7356;
        heapClassInst.heap32[(g0)] = Int32(r4);
        heapClassInst.heap32[(g0 + 1)] = Int32(r2);
        heapClassInst.heap32[(g0 + 2)] = Int32(r6);
        heapClassInst.heap32[(g0 + 3)] = 1497453121;
        heapClassInst.heap32[(g0 + 4)] = Int32(r5);
        __FUNCTION_TABLE__[(r0) >> 2](i7);
      case 28 =>
        r0 = _E2_str6355;
        r1 = _E2_str3352;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 319;
        _assert(i7);
      case 14 =>
        r0 = _E2_str10;
        r1 = _E2_str3352;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 271;
        _assert(i7);
      case _ =>
        println("break 18794")
    }
  }
  heapClassInst.heap32[(r3 + 1)] = heapClassInst.heap32[(r1 + 1)];
  heapClassInst.heap32[(r3 + 2)] = heapClassInst.heap32[(r1 + 2)];
  heapClassInst.heap32[(r3 + 3)] = heapClassInst.heap32[(r1 + 3)];
  heapClassInst.heap32[(r3 + 4)] = heapClassInst.heap32[(r1 + 4)];
  r0 = _E2_str8357;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK23btStridingMeshInterface27InternalProcessAllTrianglesEP31btInternalTriangleIndexCallbackRK9btVector3S4_(sp: Int64)
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
  var __label__ = 0;
  i7 = sp + (-120); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 7)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  r2 = commonVariable.r_g0;
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  f0 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
  f1 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
  f2 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
  r4 = 0;
  // repeat_1: 
  while (true) {
    if (r4 < r2) 
    {
      r5 = Int64(heapClassInst.heap32[(r1)]);
      r5 = r5 >> 2;
      r5 = Int64(heapClassInst.heap32[(r5 + 4)]);
      r6 = sp + (-4);
      r7 = sp + (-28);
      r8 = sp + (-16);
      r9 = sp + (-24);
      r10 = sp + (-8);
      r11 = sp + (-12);
      r12 = sp + (-32);
      r13 = sp + (-20);
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r6);
      heapClassInst.heap32[(g0 + 2)] = Int32(r7);
      heapClassInst.heap32[(g0 + 3)] = Int32(r8);
      heapClassInst.heap32[(g0 + 4)] = Int32(r9);
      heapClassInst.heap32[(g0 + 5)] = Int32(r10);
      heapClassInst.heap32[(g0 + 6)] = Int32(r11);
      heapClassInst.heap32[(g0 + 7)] = Int32(r12);
      heapClassInst.heap32[(g0 + 8)] = Int32(r13);
      heapClassInst.heap32[(g0 + 9)] = Int32(r4);
      __FUNCTION_TABLE__[(r5) >> 2](i7);
      r5 = Int64(heapClassInst.heap32[(fp + (-4))]);
      // repeat_4: 
      do {
        if (r5 == 1) 
        {
          r5 = Int64(heapClassInst.heap32[(fp + (-5))]);
          if (r5 == 3) 
          {
            r5 = Int64(heapClassInst.heap32[(fp + (-8))]);
            if (r5 < 1) 
            {
              break //repeat_4;
            }
            else {
              r5 = 0;
              // repeat_9: 
              while (true) {
                r6 = Int64(heapClassInst.heap32[(fp + (-3))]);
                r7 = Int64(heapClassInst.heap32[(fp + (-2))]);
                r6 = (r6 * r5) | 0;
                r8 = Int64(heapClassInst.heapU16[(r7 + r6) >> 1]);
                r9 = Int64(heapClassInst.heap32[(fp + (-6))]);
                r10 = Int64(heapClassInst.heap32[(fp + (-1))]);
                r8 = (r8 * r9) | 0;
                r11 = (r10 + r8) | 0;
                f3 = llvm_readDouble((r10 + r8));
                f4 = llvm_readDouble((r11 + 16));
                f5 = llvm_readDouble((r11 + 8));
                
                r8 = sp + (-80);
                
                f3 = f3 * f0;
                r11 = r8 >> 2;
                
                f5 = f5 * f1;
                heapClassInst.heapFloat[(fp + (-20))] = Float32(f3);
                f3 = f4 * f2;
                heapClassInst.heapFloat[(r11 + 1)] = Float32(f5);
                heapClassInst.heapFloat[(r11 + 2)] = Float32(f3);
                r6 = (r7 + r6) | 0;
                heapClassInst.heap32[(r11 + 3)] = 0;
                r7 = Int64(heapClassInst.heapU16[(r6 + 2) >> 1]);
                r7 = (r7 * r9) | 0;
                r12 = (r10 + r7) | 0;
                f3 = llvm_readDouble((r10 + r7));
                
                f4 = llvm_readDouble((r12 + 16));
                f5 = llvm_readDouble((r12 + 8));
                
                f3 = f3 * f0;
                
                f5 = f5 * f1;
                heapClassInst.heapFloat[(r11 + 4)] = Float32(f3);
                f3 = f4 * f2;
                heapClassInst.heapFloat[(r11 + 5)] = Float32(f5);
                heapClassInst.heapFloat[(r11 + 6)] = Float32(f3);
                heapClassInst.heap32[(r11 + 7)] = 0;
                r6 = Int64(heapClassInst.heapU16[(r6 + 4) >> 1]);
                r6 = (r6 * r9) | 0;
                r7 = (r10 + r6) | 0;
                f3 = llvm_readDouble((r10 + r6));
                
                f4 = llvm_readDouble((r7 + 16));
                f5 = llvm_readDouble((r7 + 8));
                
                f3 = f3 * f0;
                
                f5 = f5 * f1;
                heapClassInst.heapFloat[(r11 + 8)] = Float32(f3);
                f3 = f4 * f2;
                heapClassInst.heapFloat[(r11 + 9)] = Float32(f5);
                heapClassInst.heapFloat[(r11 + 10)] = Float32(f3);
                r6 = r3 >> 2;
                heapClassInst.heap32[(r11 + 11)] = 0;
                r6 = Int64(heapClassInst.heap32[(r6)]);
                r6 = r6 >> 2;
                r6 = Int64(heapClassInst.heap32[(r6 + 2)]);
                heapClassInst.heap32[(g0)] = Int32(r3);
                heapClassInst.heap32[(g0 + 1)] = Int32(r8);
                heapClassInst.heap32[(g0 + 2)] = Int32(r4);
                heapClassInst.heap32[(g0 + 3)] = Int32(r5);
                r5 = (r5 + 1) | 0;
                __FUNCTION_TABLE__[(r6) >> 2](i7);
                r6 = Int64(heapClassInst.heap32[(fp + (-8))]);
                if (r5 < r6) 
                {
                  continue // repeat_9;
                }
                else {
                  break // repeat_4;
                }
              }
            }
          }
          else {
            if (r5 != 2) 
            {
              r5 = (r5 + (-2)) | 0;
              if (!(`UIntNative`(r5) < `UIntNative`(2))) 
              {
                __label__ = 22;
                break //repeat_1;
              }
            }
            else {
              r5 = Int64(heapClassInst.heap32[(fp + (-8))]);
              if (r5 < 1) 
              {
                break //repeat_4;
              }
              else {
                r5 = 0;
                // repeat_16: 
                while (true) {
                  r6 = Int64(heapClassInst.heap32[(fp + (-3))]);
                  r7 = Int64(heapClassInst.heap32[(fp + (-2))]);
                  r6 = (r6 * r5) | 0;
                  r6 = (r7 + r6) | 0;
                  r6 = r6 >> 2;
                  r7 = Int64(heapClassInst.heap32[(r6)]);
                  r8 = Int64(heapClassInst.heap32[(fp + (-6))]);
                  r9 = Int64(heapClassInst.heap32[(fp + (-1))]);
                  r7 = (r8 * r7) | 0;
                  r10 = (r9 + r7) | 0;
                  f3 = llvm_readDouble((r9 + r7));
                  f4 = llvm_readDouble((r10 + 16));
                  f5 = llvm_readDouble((r10 + 8));
                  
                  r7 = sp + (-80);
                  
                  f3 = f3 * f0;
                  r10 = r7 >> 2;
                  
                  f5 = f5 * f1;
                  heapClassInst.heapFloat[(fp + (-20))] = Float32(f3);
                  f3 = f4 * f2;
                  heapClassInst.heapFloat[(r10 + 1)] = Float32(f5);
                  heapClassInst.heapFloat[(r10 + 2)] = Float32(f3);
                  heapClassInst.heap32[(r10 + 3)] = 0;
                  r11 = Int64(heapClassInst.heap32[(r6 + 1)]);
                  r11 = (r8 * r11) | 0;
                  r12 = (r9 + r11) | 0;
                  f3 = llvm_readDouble((r9 + r11));
                  
                  f4 = llvm_readDouble((r12 + 16));
                  f5 = llvm_readDouble((r12 + 8));
                  
                  f3 = f3 * f0;
                  
                  f5 = f5 * f1;
                  heapClassInst.heapFloat[(r10 + 4)] = Float32(f3);
                  f3 = f4 * f2;
                  heapClassInst.heapFloat[(r10 + 5)] = Float32(f5);
                  heapClassInst.heapFloat[(r10 + 6)] = Float32(f3);
                  heapClassInst.heap32[(r10 + 7)] = 0;
                  r6 = Int64(heapClassInst.heap32[(r6 + 2)]);
                  r6 = (r8 * r6) | 0;
                  r8 = (r9 + r6) | 0;
                  f3 = llvm_readDouble((r9 + r6));
                  
                  f4 = llvm_readDouble((r8 + 16));
                  f5 = llvm_readDouble((r8 + 8));
                  
                  f3 = f3 * f0;
                  
                  f5 = f5 * f1;
                  heapClassInst.heapFloat[(r10 + 8)] = Float32(f3);
                  f3 = f4 * f2;
                  heapClassInst.heapFloat[(r10 + 9)] = Float32(f5);
                  heapClassInst.heapFloat[(r10 + 10)] = Float32(f3);
                  r6 = r3 >> 2;
                  heapClassInst.heap32[(r10 + 11)] = 0;
                  r6 = Int64(heapClassInst.heap32[(r6)]);
                  r6 = r6 >> 2;
                  r6 = Int64(heapClassInst.heap32[(r6 + 2)]);
                  heapClassInst.heap32[(g0)] = Int32(r3);
                  heapClassInst.heap32[(g0 + 1)] = Int32(r7);
                  heapClassInst.heap32[(g0 + 2)] = Int32(r4);
                  heapClassInst.heap32[(g0 + 3)] = Int32(r5);
                  r5 = (r5 + 1) | 0;
                  __FUNCTION_TABLE__[(r6) >> 2](i7);
                  r6 = Int64(heapClassInst.heap32[(fp + (-8))]);
                  if (r5 < r6) 
                  {
                    continue // repeat_16;
                  }
                  else {
                    break // repeat_4;
                  }
                }
              }
            }
          }
        }
        else {
          if (r5 != 0) 
          {
            if (!(`UIntNative`(r5) < `UIntNative`(2))) 
            {
              __label__ = 24;
              break // repeat_1;
            }
          }
          else {
            r5 = Int64(heapClassInst.heap32[(fp + (-5))]);
            if (r5 == 3) 
            {
              r5 = Int64(heapClassInst.heap32[(fp + (-8))]);
              if (r5 < 1) 
              {
                break // repeat_4;
              }
              else {
                r5 = 0;
                // repeat_25: 
                while (true) {
                  r6 = Int64(heapClassInst.heap32[(fp + (-3))]);
                  r7 = Int64(heapClassInst.heap32[(fp + (-2))]);
                  r6 = (r6 * r5) | 0;
                  r8 = Int64(heapClassInst.heapU16[(r7 + r6) >> 1]);
                  r9 = Int64(heapClassInst.heap32[(fp + (-6))]);
                  r10 = Int64(heapClassInst.heap32[(fp + (-1))]);
                  r8 = (r8 * r9) | 0;
                  r8 = (r10 + r8) | 0;
                  r8 = r8 >> 2;
                  f3 = Float64(heapClassInst.heapFloat[(r8)]);
                  f4 = Float64(heapClassInst.heapFloat[(r8 + 2)]);
                  f5 = Float64(heapClassInst.heapFloat[(r8 + 1)]);
                  r8 = sp + (-80);
                  f3 = f3 * f0;
                  r11 = r8 >> 2;
                  f5 = f5 * f1;
                  heapClassInst.heapFloat[(fp + (-20))] = Float32(f3);
                  f3 = f4 * f2;
                  heapClassInst.heapFloat[(r11 + 1)] = Float32(f5);
                  heapClassInst.heapFloat[(r11 + 2)] = Float32(f3);
                  r6 = (r7 + r6) | 0;
                  heapClassInst.heap32[(r11 + 3)] = 0;
                  r7 = Int64(heapClassInst.heapU16[(r6 + 2) >> 1]);
                  r7 = (r7 * r9) | 0;
                  r7 = (r10 + r7) | 0;
                  r7 = r7 >> 2;
                  f3 = Float64(heapClassInst.heapFloat[(r7 + 2)]);
                  f4 = Float64(heapClassInst.heapFloat[(r7 + 1)]);
                  f5 = Float64(heapClassInst.heapFloat[(r7)]);
                  f5 = f5 * f0;
                  f4 = f4 * f1;
                  heapClassInst.heapFloat[(r11 + 4)] = Float32(f5);
                  f3 = f3 * f2;
                  heapClassInst.heapFloat[(r11 + 5)] = Float32(f4);
                  heapClassInst.heapFloat[(r11 + 6)] = Float32(f3);
                  heapClassInst.heap32[(r11 + 7)] = 0;
                  r6 = Int64(heapClassInst.heapU16[(r6 + 4) >> 1]);
                  r6 = (r6 * r9) | 0;
                  r6 = (r10 + r6) | 0;
                  r6 = r6 >> 2;
                  f3 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
                  f4 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
                  f5 = Float64(heapClassInst.heapFloat[(r6)]);
                  f5 = f5 * f0;
                  f4 = f4 * f1;
                  heapClassInst.heapFloat[(r11 + 8)] = Float32(f5);
                  f3 = f3 * f2;
                  heapClassInst.heapFloat[(r11 + 9)] = Float32(f4);
                  heapClassInst.heapFloat[(r11 + 10)] = Float32(f3);
                  r6 = r3 >> 2;
                  heapClassInst.heap32[(r11 + 11)] = 0;
                  r6 = Int64(heapClassInst.heap32[(r6)]);
                  r6 = r6 >> 2;
                  r6 = Int64(heapClassInst.heap32[(r6 + 2)]);
                  heapClassInst.heap32[(g0)] = Int32(r3);
                  heapClassInst.heap32[(g0 + 1)] = Int32(r8);
                  heapClassInst.heap32[(g0 + 2)] = Int32(r4);
                  heapClassInst.heap32[(g0 + 3)] = Int32(r5);
                  r5 = (r5 + 1) | 0;
                  __FUNCTION_TABLE__[(r6) >> 2](i7);
                  r6 = Int64(heapClassInst.heap32[(fp + (-8))]);
                  if (r5 < r6) 
                  {
                    continue // repeat_25;
                  }
                  else {
                    break //repeat_4;
                  }
                }
              }
            }
            else {
              if (r5 != 2) 
              {
                r5 = (r5 + (-2)) | 0;
                if (!(`UIntNative`(r5) < `UIntNative`(2))) 
                {
                  __label__ = 12;
                  break // repeat_1;
                }
              }
              else {
                r5 = Int64(heapClassInst.heap32[(fp + (-8))]);
                if (!(r5 < 1)) 
                {
                  r5 = 0;
                  // repeat_32: 
                  while (true) {
                    r6 = Int64(heapClassInst.heap32[(fp + (-3))]);
                    r7 = Int64(heapClassInst.heap32[(fp + (-2))]);
                    r6 = (r6 * r5) | 0;
                    r6 = (r7 + r6) | 0;
                    r6 = r6 >> 2;
                    r7 = Int64(heapClassInst.heap32[(r6)]);
                    r8 = Int64(heapClassInst.heap32[(fp + (-6))]);
                    r9 = Int64(heapClassInst.heap32[(fp + (-1))]);
                    r7 = (r8 * r7) | 0;
                    r7 = (r9 + r7) | 0;
                    r7 = r7 >> 2;
                    f3 = Float64(heapClassInst.heapFloat[(r7)]);
                    f4 = Float64(heapClassInst.heapFloat[(r7 + 2)]);
                    f5 = Float64(heapClassInst.heapFloat[(r7 + 1)]);
                    r7 = sp + (-80);
                    f3 = f3 * f0;
                    r10 = r7 >> 2;
                    f5 = f5 * f1;
                    heapClassInst.heapFloat[(fp + (-20))] = Float32(f3);
                    f3 = f4 * f2;
                    heapClassInst.heapFloat[(r10 + 1)] = Float32(f5);
                    heapClassInst.heapFloat[(r10 + 2)] = Float32(f3);
                    heapClassInst.heap32[(r10 + 3)] = 0;
                    r11 = Int64(heapClassInst.heap32[(r6 + 1)]);
                    r11 = (r8 * r11) | 0;
                    r11 = (r9 + r11) | 0;
                    r11 = r11 >> 2;
                    f3 = Float64(heapClassInst.heapFloat[(r11 + 2)]);
                    f4 = Float64(heapClassInst.heapFloat[(r11 + 1)]);
                    f5 = Float64(heapClassInst.heapFloat[(r11)]);
                    f5 = f5 * f0;
                    f4 = f4 * f1;
                    heapClassInst.heapFloat[(r10 + 4)] = Float32(f5);
                    f3 = f3 * f2;
                    heapClassInst.heapFloat[(r10 + 5)] = Float32(f4);
                    heapClassInst.heapFloat[(r10 + 6)] = Float32(f3);
                    heapClassInst.heap32[(r10 + 7)] = 0;
                    r6 = Int64(heapClassInst.heap32[(r6 + 2)]);
                    r6 = (r8 * r6) | 0;
                    r6 = (r9 + r6) | 0;
                    r6 = r6 >> 2;
                    f3 = Float64(heapClassInst.heapFloat[(r6 + 2)]);
                    f4 = Float64(heapClassInst.heapFloat[(r6 + 1)]);
                    f5 = Float64(heapClassInst.heapFloat[(r6)]);
                    f5 = f5 * f0;
                    f4 = f4 * f1;
                    heapClassInst.heapFloat[(r10 + 8)] = Float32(f5);
                    f3 = f3 * f2;
                    heapClassInst.heapFloat[(r10 + 9)] = Float32(f4);
                    heapClassInst.heapFloat[(r10 + 10)] = Float32(f3);
                    r6 = r3 >> 2;
                    heapClassInst.heap32[(r10 + 11)] = 0;
                    r6 = Int64(heapClassInst.heap32[(r6)]);
                    r6 = r6 >> 2;
                    r6 = Int64(heapClassInst.heap32[(r6 + 2)]);
                    heapClassInst.heap32[(g0)] = Int32(r3);
                    heapClassInst.heap32[(g0 + 1)] = Int32(r7);
                    heapClassInst.heap32[(g0 + 2)] = Int32(r4);
                    heapClassInst.heap32[(g0 + 3)] = Int32(r5);
                    r5 = (r5 + 1) | 0;
                    __FUNCTION_TABLE__[(r6) >> 2](i7);
                    r6 = Int64(heapClassInst.heap32[(fp + (-8))]);
                    if (!(r5 < r6)) 
                    {
                      break //repeat_4;
                    }
                  }
                }
              }
            }
          }
        }
      } while (false);
      r5 = Int64(heapClassInst.heap32[(r1)]);
      r5 = r5 >> 2;
      r5 = Int64(heapClassInst.heap32[(r5 + 6)]);
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r4);
      r4 = (r4 + 1) | 0;
      __FUNCTION_TABLE__[(r5) >> 2](i7);
      continue // repeat_1;
    }
    else {
      __label__ = 27;
      break // repeat_1;
    }
  }
  match (__label__) {
    case 27 =>
      return;
    case 22 =>
      r0 = _E2_str9358;
      r1 = _E2_str3352;
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      heapClassInst.heap32[(g0 + 2)] = 134;
      _assert(i7);
    case 24 =>
      r0 = _E2_str6355;
      r1 = _E2_str3352;
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      heapClassInst.heap32[(g0 + 2)] = 139;
      _assert(i7);
    case 12 =>
      r0 = _E2_str9358;
      r1 = _E2_str3352;
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      heapClassInst.heap32[(g0 + 2)] = 92;
      _assert(i7);
    case _ =>
      println("break 19288")
  }
}