/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*
import std.math.*

func _ZN4__rwL13__rw_vfmtwhatEPcjPKcS0_(sp: Int64) : Unit
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
  i7 = sp + (-48); 
  var g0 = i7 >> 2; 
  r0 = _ZN4__rwL16__rw_what_refcntE;
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0)]);
  r2 = Int64(heapClassInst.heap32[(fp)]);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  r4 = (r1 + 1) | 0;
  heapClassInst.heap32[(r0)] = Int32(r4);
  if (r1 != 0) 
  {
    heapClassInst.heap32[(g0)] = 256;
    _Znaj(i7);
    r1 = commonVariable.r_g0;
    r4 = Int64(heapClassInst.heap32[(r0)]);
    r4 = (r4 + (-1)) | 0;
    heapClassInst.heap32[(r0)] = Int32(r4);
  }
  else {
    r1 = _ZN4__rwL13__rw_what_bufE;
  }
  r4 = 256;
  r12 = swrite_Index.swrite__index__;
  while (true) {
    r5 = sp + (-16);
    heapClassInst.heap32[(fp + (-8))] = Int32(r3);
    r6 = r5 >> 2;
    heapClassInst.heap32[(fp + (-7))] = Int32(r3);
    r7 = (r4 + (-1)) | 0;
    r8 = 0;
    heapClassInst.heap32[(r6 + 1)] = 0;
    r9 = sp + (-24);
    r10 = if (r4 == 0) {r8} else {r7};
    heapClassInst.heap32[(fp + (-4))] = Int32(r1);
    r11 = r9 >> 2;
    heapClassInst.heap32[(r6 + 2)] = Int32(r10);
    heapClassInst.heap32[(r11 + 1)] = Int32(r12);
    heapClassInst.heap32[(fp + (-6))] = Int32(r5);
    heapClassInst.heap32[(g0)] = Int32(r9);
    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
    heapClassInst.heap32[(g0 + 2)] = Int32(r3);
    __v_printf(i7);
    r5 = commonVariable.r_g0;
    do {
      if (!(r1 == 0)) 
      {
        if (!(r4 == 0)) 
        {
          if (!(r5 < 0)) 
          {
            if (!(r4 == ( -1))) 
            {
              if (!(`UIntNative`(r5) < `UIntNative`(r4))) 
              {
                heapClassInst.heap8[r1 + r7] = Int8(r8);
                break 
              }
            }
            heapClassInst.heap8[r1 + r5] = Int8(r8);
          }
        }
      }
    } while (false);
    r5 = if (r5 < 0) {r8} else {r5};
    r5 = if (r7 > r5) {r5} else {r8};
    if (r5 != 0) 
    {
      if (r4 > r5) 
      {
        break 
      }
      else {
        r4 = (r5 + 1) | 0;
      }
    }
    else {
      r4 = r4 << 1;
    }
    r5 = _ZN4__rwL13__rw_what_bufE;
    if (r1 != r5) 
    {
      if (!(r1 == 0)) 
      {
        heapClassInst.heap32[(g0)] = Int32(r1);
        _ZdaPv(i7);
      }
    }
    else {
      r1 = Int64(heapClassInst.heap32[(r0)]);
      r1 = (r1 + (-1)) | 0;
      heapClassInst.heap32[(r0)] = Int32(r1);
    }
    heapClassInst.heap32[(g0)] = Int32(r4);
    _Znaj(i7);
    r1 = commonVariable.r_g0;
    continue 
  }
  commonVariable.r_g0 = r1;
  return;
}

func _ZN4__rw11__rw_locale11_C_get_bodyEPS0_S1_PKciPKNS_10__rw_facetE(sp: Int64) : Unit
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
  i7 = sp + (-304); 
  var g0 = i7 >> 2; 
  r0 = sp + (-264);
  r1 = (r0 + 8) | 0;
  r2 = r0 >> 2;
  heapClassInst.heap32[(fp + (-66))] = 0;
  r3 = 0;
  heapClassInst.heap32[(r2 + 1)] = Int32(r1);
  heapClassInst.heap8[sp + (-256)] = Int8(r3);
  r4 = _E2_str538;
  r5 = _E2_str292167;
  heapClassInst.heap32[(g0)] = Int32(r4);
  heapClassInst.heap32[(g0 + 1)] = Int32(r5);
  heapClassInst.heap32[(g0 + 2)] = 3;
  strncmp(i7);
  r5 = commonVariable.r_g0;
  do {
    if (r5 == 0) 
    {
      r4 = sp + (-288);
      r5 = r4 >> 2;
      heapClassInst.heap32[(fp + (-72))] = 0;
      heapClassInst.heap32[(r5 + 1)] = 0;
      heapClassInst.heap32[(r5 + 2)] = 0;
      heapClassInst.heap32[(r5 + 3)] = 0;
      r6 = 4;
      heapClassInst.heap32[(r5 + 4)] = 0;
      heapClassInst.heap32[(r5 + 5)] = 0;
      while (true) {
        r6 = (r6 + (-4)) | 0;
        if (!(r6 != 0)) 
        {
          break 
        }
      }
      r5 = _E2_str538;
      while (true) {
        r6 = Int64(heapClassInst.heapU8[r5]);
        if (r6 == 0) 
        {
          __label__ = 44;
          break 
        }
        else {
          r6 = r3;
          r7 = r3;
          while (true) {
            r8 = (r5 + r6) | 0;
            r9 = Int64(heapClassInst.heapU8[r5 + r6]);
            if (r9 == 59) 
            {
              __label__ = 16;
              break 
            }
            else {
              if (r9 != 0) 
              {
                r9 = Int64(heapClassInst.heapU8[r8 + 1]);
                if (r9 == 0) 
                {
                  __label__ = 6;
                  break 
                }
                else {
                  if (r9 == 59) 
                  {
                    __label__ = 18;
                    break 
                  }
                  else {
                    r9 = Int64(heapClassInst.heapU8[r8 + 2]);
                    if (r9 == 0) 
                    {
                      __label__ = 6;
                      break 
                    }
                    else {
                      r10 = r7 << 2;
                      if (r9 != 59) 
                      {
                        r8 = Int64(heapClassInst.heapU8[r8 + 3]);
                        if (r8 == 0) 
                        {
                          __label__ = 6;
                          break 
                        }
                        else {
                          if (r8 != 59) 
                          {
                            r7 = (r7 + 1) | 0;
                            r6 = (r6 + 4) | 0;
                          }
                          else {
                            __label__ = 14;
                            break 
                          }
                        }
                      }
                      else {
                        __label__ = 11;
                        break 
                      }
                    }
                  }
                }
              }
              else {
                __label__ = 6;
                break 
              }
            }
          }
          do {
            match (__label__) {
              case 16 =>
                if (r8 == 0) 
                {
                  __label__ = 6;
                  break 
                }
                else {
                  __label__ = 19;
                  break 
                }
                // break;
              case 18 =>
                r8 = (r8 + 1) | 0;
                __label__ = 19;
                // break 
                // break;
              case 14 =>
                r6 = r10 | 3;
                r8 = (r5 + r6) | 0;
                __label__ = 19;
                // break 
                // break;
              case 11 =>
                r6 = r10 | 2;
                r8 = (r5 + r6) | 0;
                __label__ = 19;
            //     break;
            case _ =>
                  break
            }
          } while (false);
          do {
            if (__label__ == 6) {
              r6 = r5;
              while (true) {
                r8 = (r6 + 1) | 0;
                r7 = Int64(heapClassInst.heapU8[r6 + 1]);
                r6 = r8;
                if (!(r7 != 0)) 
                {
                  break 
                }
              }
            }
          } while (false);
          r6 = 0;
          r7 = r6;
          while (true) {
            r9 = (r5 + r6) | 0;
            r10 = Int64(heapClassInst.heapU8[r5 + r6]);
            if (r10 == 61) 
            {
              __label__ = 32;
              break 
            }
            else {
              if (r10 != 0) 
              {
                r10 = Int64(heapClassInst.heapU8[r9 + 1]);
                if (r10 == 0) 
                {
                  __label__ = 22;
                  break 
                }
                else {
                  if (r10 == 61) 
                  {
                    __label__ = 33;
                    break 
                  }
                  else {
                    r10 = Int64(heapClassInst.heapU8[r9 + 2]);
                    if (r10 == 0) 
                    {
                      __label__ = 22;
                      break 
                    }
                    else {
                      r11 = r7 << 2;
                      if (r10 != 61) 
                      {
                        r9 = Int64(heapClassInst.heapU8[r9 + 3]);
                        if (r9 == 0) 
                        {
                          __label__ = 22;
                          break 
                        }
                        else {
                          if (r9 != 61) 
                          {
                            r7 = (r7 + 1) | 0;
                            r6 = (r6 + 4) | 0;
                          }
                          else {
                            __label__ = 30;
                            break 
                          }
                        }
                      }
                      else {
                        __label__ = 27;
                        break 
                      }
                    }
                  }
                }
              }
              else {
                __label__ = 22;
                break 
              }
            }
          }
          match (__label__) {
            case 32 =>
              if (r9 == 0) 
              {
                __label__ = 22;
                // break 
              }
              // break;
            case 33 =>
              r9 = (r9 + 1) | 0;
              // break;
            case 30 =>
              r6 = r11 | 3;
              r9 = (r5 + r6) | 0;
              // break;
            case 27 =>
              r6 = r11 | 2;
              r9 = (r5 + r6) | 0;
            //   break;
            // default:
            //   break
            case _ =>
              println("erroe match")
          }
          r6 = (r9 - r5) | 0;
          r7 = 0;
          while (true) {
            if (r7 != ( -6)) 
            {
              r10 = (r7 * ( -3)) | 0;
              r11 = _ZN4__rw9__rw_catsE;
              r10 = r10 << 2;
              r10 = (r11 + r10) | 0;
              r10 = r10 >> 2;
              r10 = Int64(heapClassInst.heap32[(r10 + 1)]);
              heapClassInst.heap32[(g0)] = Int32(r10);
              heapClassInst.heap32[(g0 + 1)] = Int32(r5);
              heapClassInst.heap32[(g0 + 2)] = Int32(r6);
              strncmp(i7);
              r10 = commonVariable.r_g0;
              if (r10 != 0) 
              {
                r7 = (r7 + (-1)) | 0;
              }
              else {
                __label__ = 36;
                break 
              }
            }
            else {
              __label__ = 40;
              break 
            }
          }
          if (__label__ == 36) {
            r6 = r7 << 2;
            r6 = (r4 - r6) | 0;
            r6 = r6 >> 2;
            r6 = Int64(heapClassInst.heap32[(r6)]);
            if (r6 != 0) 
            {
              __label__ = 22;
              break 
            }
            else {
              r6 = 0;
              r6 = (r6 - r7) | 0;
              r6 = r6 << 2;
              r6 = (r4 + r6) | 0;
              r6 = r6 >> 2;
              r7 = (r9 + 1) | 0;
              heapClassInst.heap32[(r6)] = Int32(r7);
            }
          }
          r6 = Int64(heapClassInst.heapU8[r8]);
          r5 = r8;
          if (r6 == 0) 
          {
            __label__ = 42;
          }
          else {
            r5 = (r8 + 1) | 0;
          }
        }
      }
      match (__label__) {
        case 44 =>
          r3 = 0;
          r5 = r3;
          while (true) {
            if (r5 != ( -6)) 
            {
              r6 = (r3 - r5) | 0;
              r6 = r6 << 2;
              r6 = (r4 + r6) | 0;
              r6 = r6 >> 2;
              r7 = Int64(heapClassInst.heap32[(r6)]);
              if (r7 == 0) 
              {
                r7 = _E2_str538;
                heapClassInst.heap32[(r6)] = Int32(r7);
              }
              r6 = 0;
              r8 = r6;
              while (true) {
                r9 = Int64(heapClassInst.heapU8[r7 + r6]);
                if (r9 == 0) 
                {
                  __label__ = 60;
                  break 
                }
                else {
                  r10 = (r7 + r6) | 0;
                  if (r9 == 59) 
                  {
                    __label__ = 59;
                    break 
                  }
                  else {
                    r9 = Int64(heapClassInst.heapU8[r10 + 1]);
                    if (r9 == 0) 
                    {
                      __label__ = 60;
                      break 
                    }
                    else {
                      if (r9 == 59) 
                      {
                        __label__ = 65;
                        break 
                      }
                      else {
                        r9 = Int64(heapClassInst.heapU8[r10 + 2]);
                        if (r9 == 0) 
                        {
                          __label__ = 60;
                          break 
                        }
                        else {
                          r11 = r8 << 2;
                          if (r9 != 59) 
                          {
                            r10 = Int64(heapClassInst.heapU8[r10 + 3]);
                            if (r10 == 0) 
                            {
                              __label__ = 60;
                              break 
                            }
                            else {
                              if (r10 != 59) 
                              {
                                r8 = (r8 + 1) | 0;
                                r6 = (r6 + 4) | 0;
                              }
                              else {
                                __label__ = 57;
                                break 
                              }
                            }
                          }
                          else {
                            __label__ = 54;
                            break 
                          }
                        }
                      }
                    }
                  }
                }
              }
              do {
                match (__label__) {
                  case 59 =>
                    if (r10 == 0) 
                    {
                      __label__ = 60;
                      // break 
                    }
                    else {
                      __label__ = 66;
                      // break 
                    }
                    // break;
                  case 65 =>
                    r10 = (r10 + 1) | 0;
                    __label__ = 66;
                    // break 
                    // break;
                  case 57 =>
                    r6 = r11 | 3;
                    r10 = (r7 + r6) | 0;
                    __label__ = 66;
                    // break 
                    // break;
                  case 54 =>
                    r6 = r11 | 2;
                    r10 = (r7 + r6) | 0;
                    __label__ = 66;
                  //   break;
                  // default:
                  //   break;
                  case _ =>
                    println("break583")
                }
              } while (false);
              if (__label__ == 60) {
                r10 = Int64(heapClassInst.heapU8[r7]);
                do {
                  if (r10 != 0) 
                  {
                    r6 = (r7 + 1) | 0;
                    r8 = 0;
                    while (true) {
                      r10 = (r8 + 1) | 0;
                      r9 = Int64(heapClassInst.heapU8[r6 + r8]);
                      r8 = r10;
                      if (!(r9 != 0)) 
                      {
                        break 
                      }
                    }
                  }
                  else {
                    r10 = 0;
                  }
                } while (false);
                r10 = (r7 + r10) | 0;
              }
              r6 = (r10 - r7) | 0;
              heapClassInst.heap32[(g0)] = Int32(r0);
              heapClassInst.heap32[(g0 + 1)] = Int32(r7);
              heapClassInst.heap32[(g0 + 2)] = Int32(r6);
              _ZN4__rw14__rw_pod_arrayIcLj256EE6appendEPKcj(i7);
              r6 = _E2_str785;
              heapClassInst.heap32[(g0)] = Int32(r0);
              heapClassInst.heap32[(g0 + 1)] = Int32(r6);
              heapClassInst.heap32[(g0 + 2)] = 1;
              _ZN4__rw14__rw_pod_arrayIcLj256EE6appendEPKcj(i7);
              r5 = (r5 + (-1)) | 0;
            }
            else {
              break 
            }
          }
          r4 = Int64(heapClassInst.heap32[(r2 + 1)]);
          if (r4 == 0) 
          {
            heapClassInst.heap32[(g0)] = 0;
            heapClassInst.heap32[(g0 + 1)] = 0;
            _ZN4__rw11__rw_locale9_C_manageEPS0_PKc(i7);
            r4 = commonVariable.r_g0;
            __label__ = 73;
            break 
          }
          else {
            __label__ = 72;
            break 
          }
          // break;
        case 22 =>
          r4 = 0;
          __label__ = 73;
        //   break;
        // default:
        //   break
        case _ =>
          println("break647")
      }
    }
    else {
      __label__ = 72;
    }
  } while (false);
  if (__label__ == 72) {
    heapClassInst.heap32[(g0)] = 0;
    heapClassInst.heap32[(g0 + 1)] = Int32(r4);
    _ZN4__rw11__rw_locale9_C_manageEPS0_PKc(i7);
    r4 = commonVariable.r_g0;
  }
  r0 = Int64(heapClassInst.heap32[(r2 + 1)]);
  if (!(r0 == r1)) 
  {
    if (!(r0 == 0)) 
    {
      heapClassInst.heap32[(g0)] = Int32(r0);
      _ZdaPv(i7);
    }
  }
  commonVariable.r_g0 = r4;
  return;
}

func _ZN4__rw10__rw_facet9_C_manageEPS0_NS0_13_C_facet_typeEPKcPFS1_jS4_E(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = _ZZN4__rw10__rw_facet9_C_manageEPS0_NS0_13_C_facet_typeEPKcPFS1_jS4_EE12n_std_facets;
  r1 = _ZZN4__rw10__rw_facet9_C_manageEPS0_NS0_13_C_facet_typeEPKcPFS1_jS4_EE10std_facets;
  r0 = r0 >> 2;
  r1 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(fp)]);
  r3 = Int64(heapClassInst.heap32[(r0)]);
  r4 = Int64(heapClassInst.heap32[(r1)]);
  do {
    if (r2 == 0) 
    {
      r5 = Int64(heapClassInst.heap32[(fp + 1)]);
      r2 = Int64(heapClassInst.heap32[(fp + 2)]);
      r6 = Int64(heapClassInst.heap32[(fp + 3)]);
      r7 = _E2_str538;
      r8 = if (r2 == 0) {r7} else {r2};
      r9 = r3;
      while (true) {
        r10 = r9;
        if (r10 == 0) 
        {
          __label__ = 34;
          break 
        }
        else {
          r9 = r10 << 1;
          r11 = r9 & ( -4);
          r12 = (r4 + r11) | 0;
          r9 = r12 >> 2;
          r13 = Int64(heapClassInst.heap32[(r9)]);
          r14 = r13 >> 2;
          r15 = Int64(heapClassInst.heap32[(r14 + 5)]);
          r9 = r10 >> 1;
          if (r15 != r5) 
          {
            r15 = (r15 - r5) | 0;
          }
          else {
            r15 = Int64(heapClassInst.heap32[(r14 + 1)]);
            r15 = if (r15 == 0) {r7} else {r15};
            heapClassInst.heap32[(g0)] = Int32(r8);
            heapClassInst.heap32[(g0 + 1)] = Int32(r15);
            strcmp(i7);
            r15 = commonVariable.r_g0;
          }
          if (r15 < 0) 
          {
            __label__ = 31;
          }
          else {
            if (r15 < 1) 
            {
              __label__ = 32;
              break 
            }
            else {
              r4 = (r11 + r4) | 0;
              r10 = (r10 + (-1)) | 0;
              r4 = (r4 + 4) | 0;
              r9 = (r10 - r9) | 0;
            }
          }
        }
      }
      if (__label__ == 32) {
        if (!(r12 == 0)) 
        {
          r2 = Int64(heapClassInst.heap32[(r14 + 6)]);
          r2 = (r2 + 1) | 0;
          heapClassInst.heap32[(r14 + 6)] = Int32(r2);
          commonVariable.r_g0 = r13;
          return;
        }
      }
      r4 = _ZZN4__rw10__rw_facet9_C_manageEPS0_NS0_13_C_facet_typeEPKcPFS1_jS4_EE17std_facet_bufsize;
      r4 = r4 >> 2;
      r7 = Int64(heapClassInst.heap32[(r4)]);
      if (!(r3 != r7)) 
      {
        r3 = r3 << 3;
        heapClassInst.heap32[(g0)] = Int32(r3);
        _Znaj(i7);
        r3 = commonVariable.r_g0;
        r7 = Int64(heapClassInst.heap32[(r1)]);
        r8 = Int64(heapClassInst.heap32[(r0)]);
        r8 = r8 << 2;
        heapClassInst.heap32[(g0)] = Int32(r3);
        heapClassInst.heap32[(g0 + 1)] = Int32(r7);
        heapClassInst.heap32[(g0 + 2)] = Int32(r8);
        memcpy(i7);
        r8 = _ZZN4__rw10__rw_facet9_C_manageEPS0_NS0_13_C_facet_typeEPKcPFS1_jS4_EE13std_facet_buf;
        if (!(r7 == r8)) 
        {
          if (!(r7 == 0)) 
          {
            heapClassInst.heap32[(g0)] = Int32(r7);
            _ZdaPv(i7);
          }
        }
        heapClassInst.heap32[(r1)] = Int32(r3);
        r3 = Int64(heapClassInst.heap32[(r4)]);
        r3 = r3 << 1;
        heapClassInst.heap32[(r4)] = Int32(r3);
      }
      r3 = r5 & 1;
      r4 = 0;
      r2 = if (r3 == 0) {r2} else {r4};
      heapClassInst.heap32[(g0)] = 1;
      heapClassInst.heap32[(g0 + 1)] = Int32(r2);
      __FUNCTION_TABLE__[(r6) >> 2](i7);
      r2 = commonVariable.r_g0;
      r3 = (r5 + 1) | 0;
      r4 = r3 >> 31;
      r6 = r2 >> 2;
      r3 = (r3 + r4) | 0;
      r4 = Int64(heapClassInst.heap32[(r6 + 7)]);
      r4 = r4 >> 2;
      r3 = r3 >> 1;
      heapClassInst.heap32[(r4)] = Int32(r3);
      r3 = Int64(heapClassInst.heap32[(r6 + 5)]);
      if (!(r3 == r5)) 
      {
        r3 = r2 >> 2;
        heapClassInst.heap32[(r3 + 5)] = Int32(r5);
      }
      r3 = r2 >> 2;
      r4 = Int64(heapClassInst.heap32[(r3 + 6)]);
      if (!(r4 == 1)) 
      {
        heapClassInst.heap32[(r3 + 6)] = 1;
      }
      r3 = Int64(heapClassInst.heap32[(r0)]);
      r1 = Int64(heapClassInst.heap32[(r1)]);
      r4 = r3 << 2;
      r4 = (r1 + r4) | 0;
      r4 = r4 >> 2;
      r5 = (r3 + 1) | 0;
      heapClassInst.heap32[(r4)] = Int32(r2);
      heapClassInst.heap32[(r0)] = Int32(r5);
      r0 = (r3 + (-1)) | 0;
      if (`UIntNative`(r0) < `UIntNative`(2147483645)) 
      {
        r0 = swrite_Index.cmpfacets__index__;
          heapClassInst.heap32[(g0)] = Int32(r1);
          heapClassInst.heap32[(g0 + 1)] = 0;
          heapClassInst.heap32[(g0 + 2)] = Int32(r3);
          heapClassInst.heap32[(g0 + 3)] = Int32(r0);
        quicksort(i7);
      }
    }
    else {
      r5 = r3;
      r6 = r4;
      while (true) {
        r7 = r5;
        if (r7 == 0) 
        {
          __label__ = 23;
          break 
        }
        else {
          r5 = r7 << 1;
          r8 = r5 & ( -4);
          r9 = (r6 + r8) | 0;
          r5 = r9 >> 2;
          r5 = Int64(heapClassInst.heap32[(r5)]);
          r10 = r2 >> 2;
          r11 = r5 >> 2;
          r12 = Int64(heapClassInst.heap32[(r10 + 5)]);
          r13 = Int64(heapClassInst.heap32[(r11 + 5)]);
          r5 = r7 >> 1;
          if (r12 != r13) 
          {
            r12 = (r13 - r12) | 0;
          }
          else {
            r12 = Int64(heapClassInst.heap32[(r11 + 1)]);
            r13 = Int64(heapClassInst.heap32[(r10 + 1)]);
            r10 = _E2_str538;
            r13 = if (r13 == 0) {r10} else {r13};
            r12 = if (r12 == 0) {r10} else {r12};
            heapClassInst.heap32[(g0)] = Int32(r13);
            heapClassInst.heap32[(g0 + 1)] = Int32(r12);
            strcmp(i7);
            r12 = commonVariable.r_g0;
          }
          if (r12 < 0) 
          {
            __label__ = 8;
          }
          else {
            if (r12 < 1) 
            {
              __label__ = 9;
              break 
            }
            else {
              r6 = (r8 + r6) | 0;
              r7 = (r7 + (-1)) | 0;
              r6 = (r6 + 4) | 0;
              r5 = (r7 - r5) | 0;
            }
          }
        }
      }
      if (__label__ == 9) {
        if (!(r9 == 0)) 
        {
          r2 = (r9 - r4) | 0;
          r5 = r2 & ( -4);
          r6 = (r4 + r5) | 0;
          r6 = r6 >> 2;
          r6 = Int64(heapClassInst.heap32[(r6)]);
          r7 = r6 >> 2;
          r8 = Int64(heapClassInst.heap32[(r7 + 6)]);
          r8 = (r8 + (-1)) | 0;
          heapClassInst.heap32[(r7 + 6)] = Int32(r8);
          if (r8 == 0) 
          {
            r2 = r2 >> 2;
            r8 = (r3 + (-1)) | 0;
            heapClassInst.heap32[(r0)] = Int32(r8);
            if (`UIntNative`(r8) > `UIntNative`(207)) 
            {
              __label__ = 17;
            }
            else {
              r0 = _ZZN4__rw10__rw_facet9_C_manageEPS0_NS0_13_C_facet_typeEPKcPFS1_jS4_EE13std_facet_buf;
              if (r4 == r0) 
              {
                __label__ = 17;
              }
              else {
                heapClassInst.heap32[(g0)] = Int32(r0);
                heapClassInst.heap32[(g0 + 1)] = Int32(r4);
                heapClassInst.heap32[(g0 + 2)] = Int32(r5);
                r3 = r2 << 2;
                r5 = (r3 + r4) | 0;
                r2 = (r8 - r2) | 0;
                memcpy(i7);
                r3 = (r0 + r3) | 0;
                r8 = (r5 + 4) | 0;
                r2 = r2 << 2;
                heapClassInst.heap32[(g0)] = Int32(r3);
                heapClassInst.heap32[(g0 + 1)] = Int32(r8);
                heapClassInst.heap32[(g0 + 2)] = Int32(r2);
                memcpy(i7);
                if (!(r4 == 0)) 
                {
                  heapClassInst.heap32[(g0)] = Int32(r4);
                  _ZdaPv(i7);
                }
                heapClassInst.heap32[(r1)] = Int32(r0);
                __label__ = 20;
              }
            }
            do {
              if (__label__ == 17) {
                r0 = (r8 - r2) | 0;
                r0 = r0 << 2;
                if (!(r0 == 0)) 
                {
                  r0 = r3 << 2;
                  r2 = r2 << 2;
                  r0 = (r0 + (-4)) | 0;
                  r1 = (r2 + r4) | 0;
                  r2 = (r0 - r2) | 0;
                  r0 = (r1 + 4) | 0;
                  while (true) {
                    r1 = Int64(heapClassInst.heapU8[r0]);
                    r2 = (r2 + (-1)) | 0;
                    r3 = (r0 + 1) | 0;
                    heapClassInst.heap8[r0 + (-4)] = Int8(r1);
                    r0 = r3;
                    if (!(r2 != 0)) 
                    {
                      break 
                    }
                  }
                }
              }
            } while (false);
            r2 = Int64(heapClassInst.heap32[(r7 + 1)]);
            if (!(r2 == 0)) 
            {
              if (!(r6 == 0)) 
              {
                r2 = Int64(heapClassInst.heap32[(r7)]);
                r2 = r2 >> 2;
                r2 = Int64(heapClassInst.heap32[(r2 + 1)]);
                heapClassInst.heap32[(g0)] = Int32(r6);
                __FUNCTION_TABLE__[(r2) >> 2](i7);
                r2 = 0;
                commonVariable.r_g0 = r2;
                return;
              }
            }
          }
          r2 = 0;
          break 
        }
      }
      r0 = r2 >> 2;
      r1 = Int64(heapClassInst.heap32[(r0 + 6)]);
      r1 = (r1 + (-1)) | 0;
      heapClassInst.heap32[(r0 + 6)] = Int32(r1);
      r0 = 0;
      commonVariable.r_g0 = r0;
      return;
    }
  } while (false);
  commonVariable.r_g0 = r2;
  return;
}

func _ZN4__rw11__rw_localeD2Ev(sp: Int64) : Unit
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
  r2 = Int64(heapClassInst.heap32[(r1 + 38)]);
  r3 = (r0 + 112) | 0;
  if (r2 == r3) 
  {
    __label__ = 2;
  }
  else {
    if (r2 != 0) 
    {
      r3 = 0;
      heapClassInst.heap32[(g0)] = Int32(r2);
      _ZdaPv(i7);
      __label__ = 4;
    }
    else {
      __label__ = 2;
    }
  }
  if (__label__ == 2) {
    r3 = 0;
  }
  while (true) {
    r2 = r3 << 2;
    r2 = (r0 - r2) | 0;
    r2 = r2 >> 2;
    r4 = 0;
    r2 = Int64(heapClassInst.heap32[(r2)]);
    if (!(r2 == 0)) 
    {
      r5 = r2 >> 2;
      r6 = Int64(heapClassInst.heap32[(r5 + 5)]);
      if (r6 == 0) 
      {
        r2 = Int64(heapClassInst.heap32[(r5 + 6)]);
        r2 = (r2 + (-1)) | 0;
        heapClassInst.heap32[(r5 + 6)] = Int32(r2);
        if (!(r2 != 0)) 
        {
          r2 = (r4 - r3) | 0;
          r2 = r2 << 2;
          r2 = (r0 + r2) | 0;
          r2 = r2 >> 2;
          r2 = Int64(heapClassInst.heap32[(r2)]);
          if (!(r2 == 0)) 
          {
            r5 = r2 >> 2;
            r5 = Int64(heapClassInst.heap32[(r5)]);
            r5 = r5 >> 2;
            r5 = Int64(heapClassInst.heap32[(r5 + 1)]);
            heapClassInst.heap32[(g0)] = Int32(r2);
            __FUNCTION_TABLE__[(r5) >> 2](i7);
          }
        }
      }
      else {
        r5 = Int64(heapClassInst.heap32[(r5 + 1)]);
        heapClassInst.heap32[(g0)] = Int32(r2);
        heapClassInst.heap32[(g0 + 1)] = Int32(r6);
        heapClassInst.heap32[(g0 + 2)] = Int32(r5);
        heapClassInst.heap32[(g0 + 3)] = 0;
        _ZN4__rw10__rw_facet9_C_manageEPS0_NS0_13_C_facet_typeEPKcPFS1_jS4_E(i7);
      }
    }
    r3 = (r3 + (-1)) | 0;
    if (r3 != ( -26)) 
    {
      continue 
    }
    else {
      break 
    }
  }
  r0 = Int64(heapClassInst.heap32[(r1 + 26)]);
  r2 = Int64(heapClassInst.heap32[(r1 + 27)]);
  do {
    if (!(r2 == 0)) 
    {
      while (true) {
        r2 = r4 << 2;
        r0 = (r0 + r2) | 0;
        r0 = r0 >> 2;
        r0 = Int64(heapClassInst.heap32[(r0)]);
        r0 = r0 >> 2;
        r3 = Int64(heapClassInst.heap32[(r0 + 6)]);
        r3 = (r3 + (-1)) | 0;
        heapClassInst.heap32[(r0 + 6)] = Int32(r3);
        if (!(r3 != 0)) 
        {
          r0 = Int64(heapClassInst.heap32[(r1 + 26)]);
          r0 = (r0 + r2) | 0;
          r0 = r0 >> 2;
          r0 = Int64(heapClassInst.heap32[(r0)]);
          if (!(r0 == 0)) 
          {
            r2 = r0 >> 2;
            r2 = Int64(heapClassInst.heap32[(r2)]);
            r2 = r2 >> 2;
            r2 = Int64(heapClassInst.heap32[(r2 + 1)]);
            heapClassInst.heap32[(g0)] = Int32(r0);
            __FUNCTION_TABLE__[(r2) >> 2](i7);
          }
        }
        r4 = (r4 + 1) | 0;
        r0 = Int64(heapClassInst.heap32[(r1 + 26)]);
        r2 = Int64(heapClassInst.heap32[(r1 + 27)]);
        if (r4 != r2) 
        {
          continue 
        }
        else {
          break 
        }
      }
    }
  } while (false);
  if (!(r0 == 0)) 
  {
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdaPv(i7);
  }
  return;
}

func _ZN4__rw11__rw_localeC2EPKc(sp: Int64) : Unit
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
  i7 = sp + (-280); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  heapClassInst.heap32[(r1 + 26)] = 0;
  heapClassInst.heap32[(r1 + 27)] = 0;
  heapClassInst.heap32[(r1 + 39)] = 1;
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heap32[(r1 + 40)] = 0;
  heapClassInst.heap32[(r1 + 41)] = 0;
  r3 = Int64(heapClassInst.heapU8[r2]);
  if (r3 == 0) 
  {
    r3 = sp + (-264);
    r4 = 0;
    r5 = r3 >> 2;
    r6 = (r0 + 112) | 0;
    heapClassInst.heap8[sp + (-256)] = Int8(r4);
    heapClassInst.heap32[(r5 + 1)] = Int32(r6);
    heapClassInst.heap32[(fp + (-66))] = 0;
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
    r2 = (r3 + 8) | 0;
    _ZN4__rwL16__rw_expand_nameERNS_14__rw_pod_arrayIcLj256EEEPKc(i7);
    r3 = commonVariable.r_g0;
    heapClassInst.heap32[(r1 + 38)] = Int32(r3);
    heapClassInst.heap32[(r5 + 1)] = Int32(r2);
  }
  else {
    r3 = 1;
    while (true) {
      r4 = (r3 + 1) | 0;
      r5 = Int64(heapClassInst.heapU8[r2 + r3]);
      r3 = r4;
      if (!(r5 != 0)) 
      {
        break 
      }
    }
    if (`UIntNative`(r4) > `UIntNative`(39)) 
    {
      heapClassInst.heap32[(g0)] = Int32(r4);
      _Znaj(i7);
      r3 = commonVariable.r_g0;
    }
    else {
      r3 = (r0 + 112) | 0;
    }
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
    heapClassInst.heap32[(g0 + 2)] = Int32(r4);
    memcpy(i7);
    heapClassInst.heap32[(r1 + 38)] = Int32(r3);
  }
  r2 = 0;
  heapClassInst.heap32[(r1 + 40)] = 67108863;
  heapClassInst.heap32[(r1 + 41)] = 0;
  while (true) {
    r4 = (r3 - r2) | 0;
    r5 = Int64(heapClassInst.heapU8[r4]);
    if (r5 == 0) 
    {
      __label__ = 41;
      break 
    }
    else {
      if (r5 == 59) 
      {
        __label__ = 20;
        break 
      }
      else {
        r5 = Int64(heapClassInst.heapU8[r4 + 1]);
        if (r5 == 0) 
        {
          __label__ = 41;
          break 
        }
        else {
          if (r5 != 59) 
          {
            r5 = Int64(heapClassInst.heapU8[r4 + 2]);
            if (r5 == 0) 
            {
              __label__ = 41;
              break 
            }
            else {
              if (r5 == 59) 
              {
                __label__ = 14;
                break 
              }
              else {
                r4 = Int64(heapClassInst.heapU8[r4 + 3]);
                if (r4 == 0) 
                {
                  __label__ = 41;
                  break 
                }
                else {
                  if (r4 == 59) 
                  {
                    __label__ = 14;
                    break 
                  }
                  else {
                    r2 = (r2 + (-4)) | 0;
                    continue 
                  }
                }
              }
            }
          }
          else {
            __label__ = 14;
            break 
          }
        }
      }
    }
  }
  if (__label__ == 20) {
    if (r3 == r2) 
    {
      __label__ = 41;
    }
    else {
      __label__ = 14;
    }
  }
  do {
    match (__label__) {
      case 41 =>
        r2 = Int64(heapClassInst.heapU8[r3]);
        if (!(r2 != 67)) 
        {
          r2 = Int64(heapClassInst.heapU8[r3 + 1]);
          if (r2 == 0) 
          {
            break 
          }
        }
        heapClassInst.heap32[(r1 + 41)] = 67108863;
        // break;
      case 14 =>
        r2 = 0;
        r4 = r2;
        while (true) {
          r5 = Int64(heapClassInst.heapU8[r3]);
          if (r5 == 0) 
          {
            break 
          }
          else {
            if (r2 != ( -6)) 
            {
              r5 = r5 & 255;
              if (r5 != 67) 
              {
                __label__ = 23;
              }
              else {
                r5 = Int64(heapClassInst.heapU8[r3 + 1]);
                if (r5 != 59) 
                {
                  __label__ = 23;
                }
                else {
                  __label__ = 24;
                }
              }
              if (__label__ == 23) {
                r5 = (r2 * ( -3)) | 0;
                r6 = _ZN4__rw9__rw_catsE;
                r5 = r5 << 2;
                r5 = (r6 + r5) | 0;
                r5 = r5 >> 2;
                r5 = Int64(heapClassInst.heap32[(r5 + 2)]);
                r4 = r5 | r4;
                heapClassInst.heap32[(r1 + 41)] = Int32(r4);
              }
              r5 = 0;
              r6 = r3;
              while (true) {
                r7 = Int64(heapClassInst.heapU8[r6]);
                if (r7 == 0) 
                {
                  break 
                }
                else {
                  if (r7 == 59) 
                  {
                    __label__ = 36;
                    break 
                  }
                  else {
                    r7 = Int64(heapClassInst.heapU8[r6 + 1]);
                    if (r7 == 0) 
                    {
                      break 
                    }
                    else {
                      if (r7 == 59) 
                      {
                        __label__ = 37;
                        break 
                      }
                      else {
                        r7 = Int64(heapClassInst.heapU8[r6 + 2]);
                        if (r7 == 0) 
                        {
                          break 
                        }
                        else {
                          r8 = r5 << 2;
                          if (r7 != 59) 
                          {
                            r7 = Int64(heapClassInst.heapU8[r6 + 3]);
                            if (r7 == 0) 
                            {
                              break 
                            }
                            else {
                              if (r7 != 59) 
                              {
                                r5 = (r5 + 1) | 0;
                                r6 = (r6 + 4) | 0;
                              }
                              else {
                                __label__ = 34;
                                break 
                              }
                            }
                          }
                          else {
                            __label__ = 31;
                            break 
                          }
                        }
                      }
                    }
                  }
                }
              }
              match (__label__) {
                case 36 =>
                  if (r6 == 0) 
                  {
                    // break 
                  }
                  // break;
                case 37 =>
                  r6 = (r6 + 1) | 0;
                  // break;
                case 34 =>
                  r5 = r8 | 3;
                  r6 = (r3 + r5) | 0;
                  // break;
                case 31 =>
                  r5 = r8 | 2;
                  r6 = (r3 + r5) | 0;
                //   break;
                // default:
                //   break
                case _ =>
                  println("break1427")
              }
              r3 = (r6 + 1) | 0;
              r2 = (r2 + (-1)) | 0;
              continue 
            }
            else {
              break 
            }
          }
        }
    //     break;
    // default:
    //   break;
    case _ =>
      println("break1444")
    }
  } while (false);
  r1 = 104;
  r3 = 0;
  while (true) {
    r2 = (r1 + (-1)) | 0;
    r1 = (r0 - r1) | 0;
    heapClassInst.heap8[r1 + 104] = Int8(r3);
    r1 = r2;
    if (r2 != 0) 
    {
      continue 
    }
    else {
      break 
    }
  }
  return;
}

func _ZN4__rwL16__rw_expand_nameERNS_14__rw_pod_arrayIcLj256EEEPKc(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-640); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = 0;
  r3 = r1;
  while (true) {
    r4 = r2 << 2;
    r5 = Int64(heapClassInst.heapU8[r3]);
    if (r5 != 59) 
    {
      if (r5 != 0) 
      {
        r5 = Int64(heapClassInst.heapU8[r3 + 1]);
        if (r5 == 59) 
        {
          __label__ = 14;
          break 
        }
        else {
          if (r5 == 0) 
          {
            __label__ = 4;
            break 
          }
          else {
            r5 = Int64(heapClassInst.heapU8[r3 + 2]);
            if (r5 != 59) 
            {
              if (r5 == 0) 
              {
                __label__ = 4;
                break 
              }
              else {
                r5 = Int64(heapClassInst.heapU8[r3 + 3]);
                if (r5 != 59) 
                {
                  if (r5 == 0) 
                  {
                    __label__ = 4;
                    break 
                  }
                  else {
                    r2 = (r2 + 1) | 0;
                    r3 = (r3 + 4) | 0;
                    continue 
                  }
                }
                else {
                  __label__ = 11;
                  break 
                }
              }
            }
            else {
              __label__ = 8;
              break 
            }
          }
        }
      }
      else {
        __label__ = 4;
        break 
      }
    }
    else {
      __label__ = 2;
      break 
    }
  }
  match (__label__) {
    case 14 =>
      r2 = (r3 + 1) | 0;
      // break;
    case 4 =>
      r2 = 0;
      // break;
    case 2 =>
      r2 = (r1 + r4) | 0;
      // break;
    case 11 =>
      r2 = r4 | 3;
      r2 = (r1 + r2) | 0;
      // break;
    case 8 =>
      r2 = r4 | 2;
      r2 = (r1 + r2) | 0;
    //   break;
    // default:
    //   break
    case _ =>
      println("break1579")
  }
  do {
    if (r2 == r1) 
    {
      r3 = (r1 + 1) | 0;
      r4 = (r1 + 3) | 0;
      r5 = 0;
      r2 = r3;
      while (true) {
        r6 = Int64(heapClassInst.heapU8[r4 + (-2)]);
        if (r6 == 59) 
        {
          __label__ = 19;
          break 
        }
        else {
          if (r6 != 0) 
          {
            r6 = Int64(heapClassInst.heapU8[r4 + (-1)]);
            if (r6 == 0) 
            {
              __label__ = 90;
              break 
            }
            else {
              r7 = r5 << 2;
              if (r6 != 59) 
              {
                r6 = Int64(heapClassInst.heapU8[r4]);
                if (r6 == 0) 
                {
                  __label__ = 90;
                  break 
                }
                else {
                  if (r6 != 59) 
                  {
                    r6 = Int64(heapClassInst.heapU8[r4 + 1]);
                    if (r6 == 0) 
                    {
                      __label__ = 90;
                      break 
                    }
                    else {
                      if (r6 != 59) 
                      {
                        r5 = (r5 + 1) | 0;
                        r4 = (r4 + 4) | 0;
                        r2 = (r2 + 4) | 0;
                      }
                      else {
                        __label__ = 27;
                        break 
                      }
                    }
                  }
                  else {
                    __label__ = 32;
                    break 
                  }
                }
              }
              else {
                __label__ = 22;
                break 
              }
            }
          }
          else {
            __label__ = 90;
            break 
          }
        }
      }
      match (__label__) {
        case 19 =>
          r1 = r3;
          __label__ = 29;
          // break 
          // break;
        case 27 =>
          r2 = r7 | 3;
          r1 = (r2 + r1) | 0;
          r4 = (r1 + 1) | 0;
          __label__ = 32;
          // break 
          // break;
        case 22 =>
          r2 = r7 | 1;
          r1 = (r2 + r1) | 0;
          r4 = (r1 + 1) | 0;
          __label__ = 32;
        //   break;
        // default:
        //   break
        case _ =>
          println("break1579")
      }
    }
    else {
      __label__ = 29;
    }
  } while (false);
  if (__label__ == 29) {
    if (r2 == 0) 
    {
      r3 = r1;
      __label__ = 90;
    }
    else {
      r4 = r2;
      r3 = r1;
      __label__ = 32;
    }
  }
  do {
    match (__label__) {
      case 90 =>
        r7 = Int64(heapClassInst.heapU8[r3]);
        if (r7 == 0) 
        {
          r0 = sp + (-624);
          r0 = r0 >> 2;
          heapClassInst.heap32[(r0 + 20)] = 0;
          heapClassInst.heap32[(r0 + 22)] = 0;
          heapClassInst.heap32[(r0 + 21)] = 0;
          __label__ = 73;
          // break 
        }
        else {
          r7 = 1;
          __label__ = 93;
          // break 
        }
        // break;
      case 32 =>
        r1 = sp + (-264);
        r2 = sp + (-528);
        r5 = (r1 + 8) | 0;
        r6 = (r2 + 8) | 0;
        r7 = 1;
        r8 = 0;
        while (true) {
          if (r4 == 0) 
          {
            r4 = Int64(heapClassInst.heapU8[r3]);
            do {
              if (r4 != 0) 
              {
                r9 = (r3 + 1) | 0;
                r10 = 0;
                while (true) {
                  r4 = (r10 + 1) | 0;
                  r11 = Int64(heapClassInst.heapU8[r9 + r10]);
                  r10 = r4;
                  if (!(r11 != 0)) 
                  {
                    break 
                  }
                }
              }
              else {
                r4 = 0;
              }
            } while (false);
            r4 = (r3 + r4) | 0;
          }
          r9 = (r4 - r3) | 0;
          heapClassInst.heap32[(fp + (-66))] = Int32(r9);
          if (`UIntNative`(r9) > `UIntNative`(255)) 
          {
            r10 = (r9 + 1) | 0;
            heapClassInst.heap32[(g0)] = Int32(r10);
            _Znaj(i7);
            r10 = commonVariable.r_g0;
          }
          else {
            r10 = r5;
          }
          r11 = r1 >> 2;
          heapClassInst.heap32[(r11 + 1)] = Int32(r10);
          heapClassInst.heap32[(g0)] = Int32(r10);
          heapClassInst.heap32[(g0 + 1)] = Int32(r3);
          heapClassInst.heap32[(g0 + 2)] = Int32(r9);
          memcpy(i7);
          r9 = Int64(heapClassInst.heap32[(r11 + 1)]);
          r10 = Int64(heapClassInst.heap32[(fp + (-66))]);
          r12 = 0;
          heapClassInst.heap8[r9 + r10] = Int8(r12);
          r9 = r2 >> 2;
          heapClassInst.heap32[(fp + (-132))] = 0;
          heapClassInst.heap32[(r9 + 1)] = Int32(r6);
          heapClassInst.heap8[sp + (-520)] = Int8(r12);
          r10 = _ZN4__rw9__rw_catsE;
          r13 = (r8 * 12) | 0;
          r10 = (r10 + r13) | 0;
          r13 = Int64(heapClassInst.heap32[(r11 + 1)]);
          r10 = r10 >> 2;
          r10 = Int64(heapClassInst.heap32[(r10)]);
          heapClassInst.heap32[(g0)] = Int32(r10);
          heapClassInst.heap32[(g0 + 1)] = Int32(r13);
          heapClassInst.heap32[(g0 + 2)] = Int32(r2);
          _ZN4__rw16__rw_locale_nameEiPKcRNS_14__rw_pod_arrayIcLj256EEE(i7);
          r10 = commonVariable.r_g0;
          if (r10 != 0) 
          {
            r13 = Int64(heapClassInst.heapU8[r10]);
            do {
              if (r13 != 0) 
              {
                r14 = (r10 + 1) | 0;
                while (true) {
                  r13 = (r12 + 1) | 0;
                  r15 = Int64(heapClassInst.heapU8[r14 + r12]);
                  r12 = r13;
                  if (!(r15 != 0)) 
                  {
                    break 
                  }
                }
              }
              else {
                r13 = 0;
              }
            } while (false);
            r12 = r7 & 255;
            do {
              if (!(r12 == 0)) 
              {
                if (r8 != 0) 
                {
                  r7 = r0 >> 2;
                  r7 = Int64(heapClassInst.heap32[(r7 + 1)]);
                  r12 = r7;
                  r14 = r10;
                  r15 = r13;
                  while (true) {
                    if (r15 != 0) 
                    {
                      r15 = (r15 + (-1)) | 0;
                      r16 = (r14 + 1) | 0;
                      r17 = (r12 + 1) | 0;
                      r18 = Int64(heapClassInst.heapU8[r12]);
                      r19 = Int64(heapClassInst.heapU8[r14]);
                      r12 = r17;
                      r14 = r16;
                      if (r18 != r19) 
                      {
                        __label__ = 57;
                        break 
                      }
                      else {
                        __label__ = 54;
                      }
                    }
                    else {
                      __label__ = 55;
                      break 
                    }
                  }
                  if (__label__ == 55) {
                    r7 = Int64(heapClassInst.heapU8[r7 + r13]);
                    if (!(r7 != 59)) 
                    {
                      r7 = 1;
                      break 
                    }
                  }
                  r7 = 0;
                }
              }
            } while (false);
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r10);
            heapClassInst.heap32[(g0 + 2)] = Int32(r13);
            _ZN4__rw14__rw_pod_arrayIcLj256EE6appendEPKcj(i7);
            r8 = (r8 + 1) | 0;
            if (r8 != 6) 
            {
              r10 = Int64(heapClassInst.heapU8[r4]);
              if (r10 != 0) 
              {
                r3 = _E2_str785;
                heapClassInst.heap32[(g0)] = Int32(r0);
                heapClassInst.heap32[(g0 + 1)] = Int32(r3);
                heapClassInst.heap32[(g0 + 2)] = 1;
                _ZN4__rw14__rw_pod_arrayIcLj256EE6appendEPKcj(i7);
                r3 = (r4 + 1) | 0;
                r4 = 2;
              }
              else {
                r4 = 1;
              }
            }
            else {
              r4 = 1;
              r8 = 6;
            }
          }
          else {
            r4 = 0;
          }
          r9 = Int64(heapClassInst.heap32[(r9 + 1)]);
          if (!(r9 == r6)) 
          {
            if (!(r9 == 0)) 
            {
              heapClassInst.heap32[(g0)] = Int32(r9);
              _ZdaPv(i7);
            }
          }
          if (r4 == 1) 
          {
            __label__ = 74;
            break 
          }
          else {
            if (r4 != 0) 
            {
              r4 = Int64(heapClassInst.heap32[(r11 + 1)]);
              if (r4 == r5) 
              {
                __label__ = 79;
              }
              else {
                if (r4 != 0) 
                {
                  r10 = 0;
                  heapClassInst.heap32[(g0)] = Int32(r4);
                  _ZdaPv(i7);
                  r9 = r3;
                  __label__ = 81;
                }
                else {
                  __label__ = 79;
                }
              }
              if (__label__ == 79) {
                r10 = 0;
                r9 = r3;
              }
              while (true) {
                r4 = r10 << 2;
                r11 = r4 | 3;
                r12 = r4 | 2;
                r13 = Int64(heapClassInst.heapU8[r9]);
                r4 = (r3 + r4) | 0;
                r11 = (r3 + r11) | 0;
                r12 = (r3 + r12) | 0;
                if (r13 == 59) 
                {
                  continue 
                }
                else {
                  r4 = 0;
                  if (r13 == 0) 
                  {
                    continue 
                  }
                  else {
                    r13 = Int64(heapClassInst.heapU8[r9 + 1]);
                    if (r13 == 59) 
                    {
                      break 
                    }
                    else {
                      r4 = 0;
                      if (r13 == 0) 
                      {
                        continue 
                      }
                      else {
                        r13 = Int64(heapClassInst.heapU8[r9 + 2]);
                        r4 = r12;
                        if (r13 == 59) 
                        {
                          continue 
                        }
                        else {
                          r4 = 0;
                          if (r13 == 0) 
                          {
                            continue 
                          }
                          else {
                            r12 = Int64(heapClassInst.heapU8[r9 + 3]);
                            r4 = r11;
                            if (r12 == 59) 
                            {
                              continue 
                            }
                            else {
                              r4 = 0;
                              if (r12 == 0) 
                              {
                                continue 
                              }
                              else {
                                r10 = (r10 + 1) | 0;
                                r9 = (r9 + 4) | 0;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              r4 = (r9 + 1) | 0;
              continue 
            }
            else {
              __label__ = 70;
              break 
            }
          }
        }
        match (__label__) {
          case 74 =>
            r1 = Int64(heapClassInst.heap32[(r11 + 1)]);
            if (r1 == r5) 
            {
              __label__ = 93;
              // break 
            }
            else {
              if (r1 != 0) 
              {
                heapClassInst.heap32[(g0)] = Int32(r1);
                _ZdaPv(i7);
                __label__ = 93;
                // break 
              }
              else {
                __label__ = 93;
                // break 
              }
            }
            // break;
          case 70 =>
            r0 = Int64(heapClassInst.heap32[(r11 + 1)]);
            if (r0 == r5) 
            {
              __label__ = 73;
            }
            else {
              if (r0 == 0) 
              {
                __label__ = 73;
              }
              else {
                heapClassInst.heap32[(g0)] = Int32(r0);
                _ZdaPv(i7);
                __label__ = 73;
              }
            }
          //   break;
          // default:
          //   break;
          case _ =>
            println("break1579")
        }
    // default:
    //     break;
    case _ =>
      println("break2050")
    }
  } while (false);
  do {
    if (__label__ == 93) {
      r1 = r0 >> 2;
      r2 = Int64(heapClassInst.heap32[(r1 + 1)]);
      r4 = Int64(heapClassInst.heapU8[r2]);
      if (r4 == 0) 
      {
        heapClassInst.heap32[(g0)] = 0;
        heapClassInst.heap32[(g0 + 1)] = Int32(r3);
        heapClassInst.heap32[(g0 + 2)] = Int32(r0);
        _ZN4__rw16__rw_locale_nameEiPKcRNS_14__rw_pod_arrayIcLj256EEE(i7);
        r0 = commonVariable.r_g0;
        if (r0 == 0) 
        {
          break 
        }
      }
      else {
        r3 = r7 & 255;
        if (!(r3 == 0)) 
        {
          r3 = 0;
          r4 = r2;
          while (true) {
            r5 = r3 << 2;
            r6 = Int64(heapClassInst.heapU8[r4]);
            if (r6 != 59) 
            {
              if (r6 != 0) 
              {
                r6 = Int64(heapClassInst.heapU8[r4 + 1]);
                if (r6 == 59) 
                {
                  __label__ = 109;
                  break 
                }
                else {
                  if (r6 == 0) 
                  {
                    __label__ = 99;
                    break 
                  }
                  else {
                    r6 = Int64(heapClassInst.heapU8[r4 + 2]);
                    if (r6 != 59) 
                    {
                      if (r6 == 0) 
                      {
                        __label__ = 99;
                        break 
                      }
                      else {
                        r6 = Int64(heapClassInst.heapU8[r4 + 3]);
                        if (r6 != 59) 
                        {
                          if (r6 == 0) 
                          {
                            __label__ = 99;
                            break 
                          }
                          else {
                            r3 = (r3 + 1) | 0;
                            r4 = (r4 + 4) | 0;
                          }
                        }
                        else {
                          __label__ = 106;
                          break 
                        }
                      }
                    }
                    else {
                      __label__ = 103;
                      break 
                    }
                  }
                }
              }
              else {
                __label__ = 99;
                break 
              }
            }
            else {
              __label__ = 97;
              break 
            }
          }
          match (__label__) {
            case 109 =>
              r3 = (r4 + 1) | 0;
              // break;
            case 99 =>
              r3 = 0;
              // break;
            case 97 =>
              r3 = (r2 + r5) | 0;
              // break;
            case 106 =>
              r3 = r5 | 3;
              r3 = (r2 + r3) | 0;
              // break;
            case 103 =>
              r3 = r5 | 2;
              r3 = (r2 + r3) | 0;
            //   break;
            // default:
            //   break
            case _ =>
              println("break2156")
          }
          r3 = (r3 - r2) | 0;
          heapClassInst.heap32[(r1 + 1)] = Int32(r2);
          heapClassInst.heap32[(r1)] = Int32(r3);
          r3 = _E2_str26;
          heapClassInst.heap32[(g0)] = Int32(r0);
          heapClassInst.heap32[(g0 + 1)] = Int32(r3);
          heapClassInst.heap32[(g0 + 2)] = 1;
          _ZN4__rw14__rw_pod_arrayIcLj256EE6appendEPKcj(i7);
        }
      }
      r0 = Int64(heapClassInst.heap32[(r1 + 1)]);
      commonVariable.r_g0 = r0;
      return;
    }
  } while (false);
  r0 = 0;
  commonVariable.r_g0 = r0;
  return;
}

func _ZN4__rw11__rw_locale9_C_manageEPS0_PKc(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-280); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  if (r0 != 0) 
  {
    r2 = Int64(heapClassInst.heapU8[r0]);
    if (r2 == 67) 
    {
      r2 = Int64(heapClassInst.heapU8[r0 + 1]);
      r3 = 0;
      r2 = if (r2 != r3) {1} else {0};
    }
    else {
      r2 = 1;
    }
    r3 = sp + (-264);
    r4 = (r3 + 8) | 0;
    r5 = _E2_str538;
    r6 = r3 >> 2;
    heapClassInst.heap32[(fp + (-66))] = 0;
    r0 = if (r2 != 0) {r0} else {r5};
    r7 = 0;
    heapClassInst.heap32[(r6 + 1)] = Int32(r4);
    heapClassInst.heap8[sp + (-256)] = Int8(r7);
    if (r1 != 0) 
    {
      __label__ = 19;
    }
    else {
      if (r2 != 0) 
      {
        heapClassInst.heap32[(g0)] = Int32(r3);
        heapClassInst.heap32[(g0 + 1)] = Int32(r0);
        _ZN4__rwL16__rw_expand_nameERNS_14__rw_pod_arrayIcLj256EEEPKc(i7);
        r0 = commonVariable.r_g0;
        if (r0 != 0) 
        {
          r2 = Int64(heapClassInst.heapU8[r0]);
          if (r2 == 67) 
          {
            r2 = Int64(heapClassInst.heapU8[r0 + 1]);
            if (r2 != 0) 
            {
              __label__ = 19;
            }
            else {
              r0 = r5;
              __label__ = 19;
            }
          }
          else {
            __label__ = 19;
          }
        }
        else {
          __label__ = 15;
        }
      }
      else {
        __label__ = 19;
      }
    }
    do {
      if (__label__ == 19) {
        r2 = _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE9n_locales;
        r3 = _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE7locales;
        r2 = r2 >> 2;
        r3 = r3 >> 2;
        r5 = Int64(heapClassInst.heap32[(r2)]);
        r8 = Int64(heapClassInst.heap32[(r3)]);
        if (r1 == 0) 
        {
          r7 = r5;
          while (true) {
            r9 = r7;
            if (r9 == 0) 
            {
              __label__ = 49;
              break 
            }
            else {
              r1 = r9 << 1;
              r10 = r1 & ( -4);
              r11 = (r8 + r10) | 0;
              r1 = r11 >> 2;
              r1 = Int64(heapClassInst.heap32[(r1)]);
              r12 = r1 >> 2;
              r7 = Int64(heapClassInst.heap32[(r12 + 38)]);
              heapClassInst.heap32[(g0)] = Int32(r0);
              heapClassInst.heap32[(g0 + 1)] = Int32(r7);
              strcmp(i7);
              r13 = commonVariable.r_g0;
              r7 = r9 >> 1;
              if (r13 < 0) 
              {
                __label__ = 46;
              }
              else {
                if (r13 < 1) 
                {
                  __label__ = 47;
                  break 
                }
                else {
                  r1 = (r10 + r8) | 0;
                  r9 = (r9 + (-1)) | 0;
                  r8 = (r1 + 4) | 0;
                  r7 = (r9 - r7) | 0;
                }
              }
            }
          }
          if (__label__ == 47) {
            if (!(r11 == 0)) 
            {
              r0 = Int64(heapClassInst.heap32[(r12 + 39)]);
              r0 = (r0 + 1) | 0;
              heapClassInst.heap32[(r12 + 39)] = Int32(r0);
              __label__ = 65;
              break 
            }
          }
          r1 = _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE14locale_bufsize;
          r1 = r1 >> 2;
          r7 = Int64(heapClassInst.heap32[(r1)]);
          if (!(r5 != r7)) 
          {
            r5 = r5 << 3;
            heapClassInst.heap32[(g0)] = Int32(r5);
            _Znaj(i7);
            r5 = commonVariable.r_g0;
            r7 = Int64(heapClassInst.heap32[(r3)]);
            r8 = Int64(heapClassInst.heap32[(r2)]);
            r8 = r8 << 2;
            heapClassInst.heap32[(g0)] = Int32(r5);
            heapClassInst.heap32[(g0 + 1)] = Int32(r7);
            heapClassInst.heap32[(g0 + 2)] = Int32(r8);
            memcpy(i7);
            r8 = _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE10locale_buf;
            if (!(r7 == r8)) 
            {
              if (!(r7 == 0)) 
              {
                heapClassInst.heap32[(g0)] = Int32(r7);
                _ZdaPv(i7);
              }
            }
            heapClassInst.heap32[(r3)] = Int32(r5);
            r5 = Int64(heapClassInst.heap32[(r1)]);
            r5 = r5 << 1;
            heapClassInst.heap32[(r1)] = Int32(r5);
          }
          r1 = Int64(heapClassInst.heapU8[r0]);
          if (r1 != 67) 
          {
            __label__ = 61;
          }
          else {
            r1 = Int64(heapClassInst.heapU8[r0 + 1]);
            if (r1 != 0) 
            {
              __label__ = 61;
            }
            else {
              r1 = _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE7classic;
              r5 = r1 >> 2;
              r1 = Int64(heapClassInst.heap32[(r5)]);
              if (r1 != 0) 
              {
                r0 = _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE12classic_body;
                r0 = r0 >> 2;
                r5 = Int64(heapClassInst.heap32[(r0 + 39)]);
                r5 = (r5 + 1) | 0;
                heapClassInst.heap32[(r0 + 39)] = Int32(r5);
                __label__ = 63;
              }
              else {
                r1 = _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE12classic_body;
                heapClassInst.heap32[(g0)] = Int32(r1);
                heapClassInst.heap32[(g0 + 1)] = Int32(r0);
                _ZN4__rw11__rw_localeC2EPKc(i7);
                heapClassInst.heap32[(r5)] = Int32(r1);
                __label__ = 63;
              }
            }
          }
          if (__label__ == 61) {
            heapClassInst.heap32[(g0)] = 172;
            _Znwj(i7);
            r1 = commonVariable.r_g0;
            heapClassInst.heap32[(g0)] = Int32(r1);
            heapClassInst.heap32[(g0 + 1)] = Int32(r0);
            _ZN4__rw11__rw_localeC2EPKc(i7);
          }
          r0 = Int64(heapClassInst.heap32[(r2)]);
          r3 = Int64(heapClassInst.heap32[(r3)]);
          r5 = r0 << 2;
          r5 = (r3 + r5) | 0;
          r5 = r5 >> 2;
          r7 = (r0 + 1) | 0;
          heapClassInst.heap32[(r5)] = Int32(r1);
          heapClassInst.heap32[(r2)] = Int32(r7);
          r2 = (r0 + (-1)) | 0;
          if (`UIntNative`(r2) < `UIntNative`(2147483645)) 
          {
            r2 = swrite_Index.cmplocales__index__;
              heapClassInst.heap32[(g0)] = Int32(r3);
              heapClassInst.heap32[(g0 + 1)] = 0;
              heapClassInst.heap32[(g0 + 2)] = Int32(r0);
              heapClassInst.heap32[(g0 + 3)] = Int32(r2);
            quicksort(i7);
            __label__ = 65;
          }
          else {
            __label__ = 65;
          }
        }
        else {
          r9 = r5;
          r10 = r8;
          while (true) {
            r11 = r9;
            if (r11 == 0) 
            {
              __label__ = 42;
              break 
            }
            else {
              r9 = r11 << 1;
              r12 = r9 & ( -4);
              r13 = (r10 + r12) | 0;
              r9 = r13 >> 2;
              r9 = Int64(heapClassInst.heap32[(r9)]);
              r9 = r9 >> 2;
              r9 = Int64(heapClassInst.heap32[(r9 + 38)]);
              heapClassInst.heap32[(g0)] = Int32(r0);
              heapClassInst.heap32[(g0 + 1)] = Int32(r9);
              strcmp(i7);
              r14 = commonVariable.r_g0;
              r9 = r11 >> 1;
              if (r14 < 0) 
              {
                __label__ = 25;
              }
              else {
                if (r14 < 1) 
                {
                  __label__ = 26;
                  break 
                }
                else {
                  r10 = (r12 + r10) | 0;
                  r11 = (r11 + (-1)) | 0;
                  r10 = (r10 + 4) | 0;
                  r9 = (r11 - r9) | 0;
                }
              }
            }
          }
          if (__label__ == 26) {
            if (!(r13 == 0)) 
            {
              r1 = (r13 - r8) | 0;
              r0 = r1 & ( -4);
              r9 = (r8 + r0) | 0;
              r9 = r9 >> 2;
              r9 = Int64(heapClassInst.heap32[(r9)]);
              r10 = r9 >> 2;
              r11 = Int64(heapClassInst.heap32[(r10 + 39)]);
              r11 = (r11 + (-1)) | 0;
              heapClassInst.heap32[(r10 + 39)] = Int32(r11);
              if (r11 != 0) 
              {
                __label__ = 15;
                break 
              }
              else {
                r1 = r1 >> 2;
                r11 = (r5 + (-1)) | 0;
                heapClassInst.heap32[(r2)] = Int32(r11);
                if (`UIntNative`(r11) > `UIntNative`(3)) 
                {
                  __label__ = 33;
                }
                else {
                  r2 = _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE10locale_buf;
                  if (r8 == r2) 
                  {
                    __label__ = 33;
                  }
                  else {
                    heapClassInst.heap32[(g0)] = Int32(r2);
                    heapClassInst.heap32[(g0 + 1)] = Int32(r8);
                    heapClassInst.heap32[(g0 + 2)] = Int32(r0);
                    r0 = r1 << 2;
                    r5 = (r0 + r8) | 0;
                    r1 = (r11 - r1) | 0;
                    memcpy(i7);
                    r0 = (r2 + r0) | 0;
                    r5 = (r5 + 4) | 0;
                    r1 = r1 << 2;
                    heapClassInst.heap32[(g0)] = Int32(r0);
                    heapClassInst.heap32[(g0 + 1)] = Int32(r5);
                    heapClassInst.heap32[(g0 + 2)] = Int32(r1);
                    memcpy(i7);
                    if (!(r8 == 0)) 
                    {
                      heapClassInst.heap32[(g0)] = Int32(r8);
                      _ZdaPv(i7);
                    }
                    r1 = _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE14locale_bufsize;
                    r1 = r1 >> 2;
                    heapClassInst.heap32[(r3)] = Int32(r2);
                    heapClassInst.heap32[(r1)] = 8;
                    __label__ = 36;
                  }
                }
                do {
                  if (__label__ == 33) {
                    r0 = (r11 - r1) | 0;
                    r0 = r0 << 2;
                    if (!(r0 == 0)) 
                    {
                      r0 = r5 << 2;
                      r1 = r1 << 2;
                      r0 = (r0 + (-4)) | 0;
                      r2 = (r1 + r8) | 0;
                      r1 = (r0 - r1) | 0;
                      r0 = (r2 + 4) | 0;
                      while (true) {
                        r2 = Int64(heapClassInst.heapU8[r0]);
                        r1 = (r1 + (-1)) | 0;
                        r3 = (r0 + 1) | 0;
                        heapClassInst.heap8[r0 + (-4)] = Int8(r2);
                        r0 = r3;
                        if (!(r1 != 0)) 
                        {
                          break 
                        }
                      }
                    }
                  }
                } while (false);
                r1 = Int64(heapClassInst.heap32[(r10 + 38)]);
                r0 = Int64(heapClassInst.heapU8[r1]);
                if (r0 == 67) 
                {
                  r1 = Int64(heapClassInst.heapU8[r1 + 1]);
                  r7 = 0;
                  r7 = if (r1 == r7) {1} else {0};
                }
                if (r7 != 0) 
                {
                  __label__ = 15;
                  break 
                }
                else {
                  if (r9 == 0) 
                  {
                    __label__ = 15;
                    break 
                  }
                  else {
                    heapClassInst.heap32[(g0)] = Int32(r9);
                    _ZN4__rw11__rw_localeD2Ev(i7);
                    heapClassInst.heap32[(g0)] = Int32(r9);
                    r1 = 0;
                    _ZdlPv(i7);
                    __label__ = 65;
                    break 
                  }
                }
              }
            }
          }
          r0 = r1 >> 2;
          r2 = Int64(heapClassInst.heap32[(r0 + 39)]);
          r1 = 0;
          r2 = (r2 + (-1)) | 0;
          heapClassInst.heap32[(r0 + 39)] = Int32(r2);
          __label__ = 65;
        }
      }
    } while (false);
    if (__label__ == 15) {
      r1 = 0;
    }
    r0 = Int64(heapClassInst.heap32[(r6 + 1)]);
    if (!(r0 == r4)) 
    {
      if (!(r0 == 0)) 
      {
        heapClassInst.heap32[(g0)] = Int32(r0);
        _ZdaPv(i7);
      }
    }
    commonVariable.r_g0 = r1;
    return;
  }
  else {
    r0 = _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE6global;
    r0 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r0)]);
    do {
      if (r2 == 0) 
      {
        r3 = _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE5ginit;
        r3 = r3 >> 2;
        r4 = Int64(heapClassInst.heap32[(r3)]);
        if (r4 != 0) 
        {
          while (true) {
            r4 = Int64(heapClassInst.heap32[(r3)]);
            if (!(r4 < 1000)) 
            {
              break 
            }
          }
        }
        else {
          r2 = (r4 + 1) | 0;
          heapClassInst.heap32[(r3)] = Int32(r2);
          r2 = _E2_str538;
          heapClassInst.heap32[(g0)] = 0;
          heapClassInst.heap32[(g0 + 1)] = Int32(r2);
          _ZN4__rw11__rw_locale9_C_manageEPS0_PKc(i7);
          r2 = commonVariable.r_g0;
          heapClassInst.heap32[(r0)] = Int32(r2);
          r4 = Int64(heapClassInst.heap32[(r3)]);
          r4 = (r4 + 1000) | 0;
          heapClassInst.heap32[(r3)] = Int32(r4);
        }
      }
    } while (false);
    if (r1 == 0) 
    {
      r0 = r2 >> 2;
      r1 = Int64(heapClassInst.heap32[(r0 + 39)]);
      r1 = (r1 + 1) | 0;
      heapClassInst.heap32[(r0 + 39)] = Int32(r1);
      commonVariable.r_g0 = r2;
      return;
    }
    else {
      r3 = r1 >> 2;
      r4 = Int64(heapClassInst.heap32[(r3 + 39)]);
      r4 = (r4 + 1) | 0;
      heapClassInst.heap32[(r3 + 39)] = Int32(r4);
      heapClassInst.heap32[(r0)] = Int32(r1);
      commonVariable.r_g0 = r2;
      return;
    }
  }
}

func _ZNSt6localeD1Ev(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0)]);
  r2 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r2 + 27)]);
  do {
    if (!(r3 != 0)) 
    {
      r3 = Int64(heapClassInst.heap32[(r2 + 40)]);
      r3 = r3 & 67108863;
      if (!(r3 != 67108863)) 
      {
        r3 = Int64(heapClassInst.heap32[(r2 + 41)]);
        r4 = r3 & 8193;
        if (!(r4 == 0)) 
        {
          if (r4 != 8193) 
          {
            break 
          }
        }
        r4 = r3 & 49158;
        if (!(r4 == 0)) 
        {
          if (r4 != 49158) 
          {
            break 
          }
        }
        r4 = r3 & 983160;
        if (!(r4 == 0)) 
        {
          if (r4 != 983160) 
          {
            break 
          }
        }
        r4 = r3 & 7340928;
        if (!(r4 == 0)) 
        {
          if (r4 != 7340928) 
          {
            break 
          }
        }
        r4 = r3 & 25168896;
        if (!(r4 == 0)) 
        {
          if (r4 != 25168896) 
          {
            break 
          }
        }
        r3 = r3 & 33558528;
        if (!(r3 == 0)) 
        {
          if (r3 != 33558528) 
          {
            break 
          }
        }
        r3 = Int64(heapClassInst.heap32[(r2 + 38)]);
        r4 = _E2_str538;
        r5 = if (r3 == 0) {r4} else {r3};
        r6 = Int64(heapClassInst.heapU8[r5]);
        if (r6 == 59) 
        {
          r5 = (r5 + 1) | 0;
        }
        r6 = 0;
        r7 = r6;
        while (true) {
          r8 = Int64(heapClassInst.heapU8[r5 + r6]);
          if (r8 == 0) 
          {
            __label__ = 31;
            break 
          }
          else {
            r9 = (r5 + r6) | 0;
            if (r8 == 59) 
            {
              __label__ = 28;
              break 
            }
            else {
              r8 = Int64(heapClassInst.heapU8[r9 + 1]);
              if (r8 == 0) 
              {
                __label__ = 31;
                break 
              }
              else {
                if (r8 == 59) 
                {
                  __label__ = 29;
                  break 
                }
                else {
                  r8 = Int64(heapClassInst.heapU8[r9 + 2]);
                  if (r8 == 0) 
                  {
                    __label__ = 31;
                    break 
                  }
                  else {
                    r10 = r7 << 2;
                    if (r8 != 59) 
                    {
                      r9 = Int64(heapClassInst.heapU8[r9 + 3]);
                      if (r9 == 0) 
                      {
                        __label__ = 31;
                        break 
                      }
                      else {
                        if (r9 != 59) 
                        {
                          r7 = (r7 + 1) | 0;
                          r6 = (r6 + 4) | 0;
                        }
                        else {
                          __label__ = 26;
                          break 
                        }
                      }
                    }
                    else {
                      __label__ = 23;
                      break 
                    }
                  }
                }
              }
            }
          }
        }
        do {
          match (__label__) {
            case 28 =>
              if (r9 == 0) 
              {
                __label__ = 31;
                // break 
              }
              else {
                __label__ = 30;
                // break 
              }
              // break;
            case 29 =>
              r9 = (r9 + 1) | 0;
              __label__ = 30;
              // break 
              // break;
            case 26 =>
              r6 = r10 | 3;
              r9 = (r5 + r6) | 0;
              __label__ = 30;
              // break 
              // break;
            case 23 =>
              r6 = r10 | 2;
              r9 = (r5 + r6) | 0;
              __label__ = 30;
            //   break;
            // default:
            //   break
            case _ =>
              println("break2846")
          }
        } while (false);
        match (__label__) {
          case 31 =>
            r6 = Int64(heapClassInst.heapU8[r5]);
            if (r6 != 0) 
            {
              r7 = (r5 + 1) | 0;
              r8 = 0;
              while (true) {
                r6 = (r8 + 1) | 0;
                r9 = Int64(heapClassInst.heapU8[r7 + r8]);
                r8 = r6;
                if (!(r9 != 0)) 
                {
                  break 
                }
              }
              r9 = 0;
              r7 = r9;
              r8 = r9;
            }
            else {
              r9 = 0;
              r6 = r9;
              r7 = r9;
              r8 = r9;
            }
            // break;
          case 30 =>
            r6 = (r9 - r5) | 0;
            r7 = 0;
            r8 = r7;
          //   break;
          // default:
          //   break
           case _ =>
            println("break2884")
        }
        while (true) {
          if (r7 != 26) 
          {
            r10 = r7 << 2;
            r10 = (r1 + r10) | 0;
            r10 = r10 >> 2;
            r10 = Int64(heapClassInst.heap32[(r10)]);
            do {
              if (r10 != 0) 
              {
                r10 = r10 >> 2;
                r11 = Int64(heapClassInst.heap32[(r10 + 7)]);
                r11 = r11 >> 2;
                r10 = Int64(heapClassInst.heap32[(r10 + 1)]);
                r12 = 0;
                r13 = if (r10 != r12) {1} else {0};
                r11 = Int64(heapClassInst.heap32[(r11)]);
                r13 = r13 & 1;
                r11 = r11 << 1;
                r11 = r13 | r11;
                r11 = (r11 + (-1)) | 0;
                r13 = 53;
                r11 = if (`UIntNative`(r11) < `UIntNative`(r13)) {r11} else {r12};
                if (r11 > 36) 
                {
                  r11 = (r11 + (-37)) | 0;
                  if (!(`UIntNative`(r11) > `UIntNative`(8))) 
                  {
                    r13 = 1;
                    r11 = r13 << r11;
                    r11 = r11 & 325;
                    if (r11 != 0) 
                    {
                      break 
                    }
                  }
                }
                else {
                  if (!(`UIntNative`(r11) > `UIntNative`(19))) 
                  {
                    r13 = 1;
                    r11 = r13 << r11;
                    r11 = r11 & 665600;
                    if (r11 != 0) 
                    {
                      break 
                    }
                  }
                }
                r11 = 1;
                r11 = r11 << r7;
                while (true) {
                  if (r9 == 0) 
                  {
                    break 
                  }
                  else {
                    r13 = _ZN4__rw9__rw_catsE;
                    r14 = (r8 * 12) | 0;
                    r13 = (r13 + r14) | 0;
                    r13 = r13 >> 2;
                    r13 = Int64(heapClassInst.heap32[(r13 + 2)]);
                    r13 = r13 & r11;
                    if (r13 == 0) 
                    {
                      r5 = Int64(heapClassInst.heapU8[r9]);
                      if (r5 == 0) 
                      {
                        if (r3 != 0) 
                        {
                          r8 = 0;
                          r5 = r3;
                        }
                        else {
                          r8 = 0;
                          r5 = r4;
                        }
                      }
                      else {
                        r5 = (r9 + 1) | 0;
                        r8 = (r8 + 1) | 0;
                      }
                      r6 = Int64(heapClassInst.heapU8[r5]);
                      if (r6 == 59) 
                      {
                        r5 = (r5 + 1) | 0;
                      }
                      r6 = r12;
                      r13 = r12;
                      while (true) {
                        r14 = Int64(heapClassInst.heapU8[r5 + r6]);
                        if (r14 == 0) 
                        {
                          __label__ = 65;
                          break 
                        }
                        else {
                          r9 = (r5 + r6) | 0;
                          if (r14 == 59) 
                          {
                            __label__ = 62;
                            break 
                          }
                          else {
                            r14 = Int64(heapClassInst.heapU8[r9 + 1]);
                            if (r14 == 0) 
                            {
                              __label__ = 65;
                              break 
                            }
                            else {
                              if (r14 == 59) 
                              {
                                __label__ = 63;
                                break 
                              }
                              else {
                                r14 = Int64(heapClassInst.heapU8[r9 + 2]);
                                if (r14 == 0) 
                                {
                                  __label__ = 65;
                                  break 
                                }
                                else {
                                  r15 = r13 << 2;
                                  if (r14 != 59) 
                                  {
                                    r9 = Int64(heapClassInst.heapU8[r9 + 3]);
                                    if (r9 == 0) 
                                    {
                                      __label__ = 65;
                                      break 
                                    }
                                    else {
                                      if (r9 != 59) 
                                      {
                                        r13 = (r13 + 1) | 0;
                                        r6 = (r6 + 4) | 0;
                                      }
                                      else {
                                        __label__ = 60;
                                        break 
                                      }
                                    }
                                  }
                                  else {
                                    __label__ = 57;
                                    break 
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                      do {
                        match (__label__) {
                          case 62 =>
                            if (r9 == 0) 
                            {
                              __label__ = 65;
                              // break 
                            }
                            else {
                              __label__ = 64;
                              // break 
                            }
                            // break;
                          case 63 =>
                            r9 = (r9 + 1) | 0;
                            __label__ = 64;
                            // break 
                            // break;
                          case 60 =>
                            r6 = r15 | 3;
                            r9 = (r5 + r6) | 0;
                            __label__ = 64;
                            // break 
                            // break;
                          case 57 =>
                            r6 = r15 | 2;
                            r9 = (r5 + r6) | 0;
                            __label__ = 64;
                          //   break;
                          // default:
                          //   break
                          case _ =>
                            println("break3079")
                        }
                      } while (false);
                      match (__label__) {
                        case 65 =>
                          r9 = _E2_str26;
                          r6 = 0;
                          r13 = Int64(heapClassInst.heapU8[r5]);
                          if (r13 == 0) 
                          {
                            continue 
                          }
                          else {
                            r13 = (r5 + 1) | 0;
                            r14 = 0;
                            while (true) {
                              r6 = (r14 + 1) | 0;
                              r9 = _E2_str26;
                              r15 = Int64(heapClassInst.heapU8[r13 + r14]);
                              r14 = r6;
                              if (!(r15 != 0)) 
                              {
                                continue 
                              }
                            }
                          }
                          // break;
                        case 64 =>
                          r6 = (r9 - r5) | 0;
                        //   break;
                        // default:
                        //   break
                        case _ =>
                          println("break3112")
                      }
                    }
                    else {
                      break 
                    }
                  }
                }
                r11 = _E2_str538;
                r10 = if (r10 == 0) {r11} else {r10};
                r11 = Int64(heapClassInst.heapU8[r10]);
                do {
                  if (r11 != 0) 
                  {
                    r12 = (r10 + 1) | 0;
                    r13 = 0;
                    while (true) {
                      r11 = (r13 + 1) | 0;
                      r14 = Int64(heapClassInst.heapU8[r12 + r13]);
                      r13 = r11;
                      if (!(r14 != 0)) 
                      {
                        break 
                      }
                    }
                  }
                  else {
                    r11 = 0;
                  }
                } while (false);
                if (r11 != r6) 
                {
                  break 
                }
                else {
                  r11 = 0;
                  while (true) {
                    r12 = (r6 + r11) | 0;
                    if (r12 != 0) 
                    {
                      r12 = (r5 - r11) | 0;
                      r13 = (r10 - r11) | 0;
                      r11 = (r11 + (-1)) | 0;
                      r12 = Int64(heapClassInst.heapU8[r12]);
                      r13 = Int64(heapClassInst.heapU8[r13]);
                      if (r12 != r13) 
                      {
                        break 
                      }
                    }
                    else {
                      break 
                    }
                  }
                }
              }
            } while (false);
            r7 = (r7 + 1) | 0;
          }
          else {
            break 
          }
        }
        heapClassInst.heap32[(g0)] = Int32(r1);
        heapClassInst.heap32[(g0 + 1)] = Int32(r3);
        _ZN4__rw11__rw_locale9_C_manageEPS0_PKc(i7);
        return;
      }
    }
  } while (false);
  r1 = Int64(heapClassInst.heap32[(r2 + 39)]);
  r1 = (r1 + (-1)) | 0;
  heapClassInst.heap32[(r2 + 39)] = Int32(r1);
  if (!(r1 != 0)) 
  {
    r0 = Int64(heapClassInst.heap32[(r0)]);
    if (!(r0 == 0)) 
    {
      heapClassInst.heap32[(g0)] = Int32(r0);
      _ZN4__rw11__rw_localeD2Ev(i7);
      heapClassInst.heap32[(g0)] = Int32(r0);
      _ZdlPv(i7);
    }
  }
  return;
}

func _ZN4__rw10__rw_throwEiz(sp: Int64) : Unit
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
  i7 = sp + (-64);
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  if (r0 > 4) 
  {
    r1 = (sp + 4) | 0;
    heapClassInst.heap32[(fp + (-7))] = Int32(r1);
    r2 = _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E7__fname;
    heapClassInst.heap32[(fp + (-9))] = Int32(r1);
    r2 = r2 >> 2;
    heapClassInst.heap32[(fp + (-8))] = Int32(r1);
    r3 = Int64(heapClassInst.heap32[(r2)]);
    if (!(r3 != 0)) 
    {
      r3 = _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E6buffer;
      r4 = 0;
      while (true) {
        r5 = Int64(heapClassInst.heapU8[r3]);
        r4 = if (r5 == 58) {r3} else {r4};
        if (r5 != 0) 
        {
          r5 = (r3 + 1) | 0;
          r6 = Int64(heapClassInst.heapU8[r3 + 1]);
          r4 = if (r6 == 58) {r5} else {r4};
          if (r6 != 0) 
          {
            r5 = (r3 + 2) | 0;
            r6 = Int64(heapClassInst.heapU8[r3 + 2]);
            r4 = if (r6 == 58) {r5} else {r4};
            if (r6 != 0) 
            {
              r5 = (r3 + 3) | 0;
              r6 = Int64(heapClassInst.heapU8[r3 + 3]);
              r4 = if (r6 == 58) {r5} else {r4};
              if (r6 != 0) 
              {
                r3 = (r3 + 4) | 0;
              }
              else {
                break 
              }
            }
            else {
              break 
            }
          }
          else {
            break 
          }
        }
        else {
          break 
        }
      }
      do {
        if (!(r4 == 0)) 
        {
          r3 = 0;
          heapClassInst.heap8[r4] = Int8(r3);
          r3 = _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E8__catset;
          r4 = (r4 + 1) | 0;
          heapClassInst.heap32[(g0)] = Int32(r4);
          heapClassInst.heap32[(g0 + 1)] = Int32(r3);
          sscanf(i7);
          r4 = commonVariable.r_g0;
          r3 = r3 >> 2;
          if (!(r4 != 1)) 
          {
            r4 = Int64(heapClassInst.heap32[(r3)]);
            if (r4 > 0) 
            {
              break 
            }
          }
          heapClassInst.heap32[(r3)] = 1;
        }
      } while (false);
      r3 = _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E4msgs;
      r4 = r3 >> 2;
      heapClassInst.heap32[(r4 + 1)] = 0;
      heapClassInst.heap32[(r4 + 2)] = 0;
      heapClassInst.heap32[(r4 + 3)] = 0;
      heapClassInst.heap32[(r4 + 4)] = 0;
      heapClassInst.heap32[(r4 + 5)] = 0;
      r5 = _ZTVSt8messagesIcE;
      heapClassInst.heap32[(r4 + 6)] = 0;
      r5 = (r5 + 8) | 0;
      heapClassInst.heap32[(r4 + 7)] = 0;
      r6 = _ZN4__rwL22__rw_classic_once_initE_2E_0_2E_b;
      heapClassInst.heap32[(r4)] = Int32(r5);
      r5 = Int64(heapClassInst.heapU8[r6]);
      if (!(r5 != 0)) 
      {
        _ZN4__rw11__rw_locale11_C_get_bodyEPS0_S1_PKciPKNS_10__rw_facetE(i7);
        r5 = commonVariable.r_g0;
        r7 = _ZN4__rwL12__rw_classicE;
        r7 = r7 >> 2;
        heapClassInst.heap32[(r7)] = Int32(r5);
        if (!(r5 != 0)) 
        {
          r5 = _E2_str12102177;
          r7 = _E2_str10100175;
          r8 = _E2_str538;
          heapClassInst.heap32[(g0)] = 19;
          heapClassInst.heap32[(g0 + 1)] = Int32(r5);
          heapClassInst.heap32[(g0 + 2)] = Int32(r7);
          heapClassInst.heap32[(g0 + 3)] = Int32(r8);
          _ZN4__rw10__rw_throwEiz(i7);
        }
        r5 = 1;
        heapClassInst.heap8[r6] = Int8(r5);
      }
      r5 = _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E6buffer;
      r6 = Int64(heapClassInst.heapU8[r5]);
      if (r6 == 0) 
      {
        r6 = _ZNSs11_C_null_refE;
        r7 = 0;
        r6 = (r6 + 12) | 0;
      }
      else {
        r6 = 0;
        while (true) {
          r7 = (r5 - r6) | 0;
          r6 = (r6 + (-1)) | 0;
          r7 = Int64(heapClassInst.heapU8[r7 + 1]);
          if (!(r7 != 0)) 
          {
            break 
          }
        }
        r7 = 0;
        r7 = (r7 - r6) | 0;
        if (r6 != 0) 
        {
          r6 = 32;
          r6 = if (`UIntNative`(r7) > `UIntNative`(r6)) {r7} else {r6};
          heapClassInst.heap32[(g0)] = Int32(r6);
          heapClassInst.heap32[(g0 + 1)] = Int32(r7);
          _ZNSs10_C_get_repEjj(i7);
          r6 = (commonVariable.r_g0 + 12) | 0;
        }
        else {
          r6 = _ZNSs11_C_null_refE;
          r6 = (r6 + 12) | 0;
        }
      }
      heapClassInst.heap32[(fp + (-4))] = Int32(r6);
      heapClassInst.heap32[(g0)] = Int32(r6);
      heapClassInst.heap32[(g0 + 1)] = Int32(r5);
      heapClassInst.heap32[(g0 + 2)] = Int32(r7);
      memcpy(i7);
      r4 = Int64(heapClassInst.heap32[(r4)]);
      r4 = r4 >> 2;
      r4 = Int64(heapClassInst.heap32[(r4 + 2)]);
      r6 = sp + (-16);
      r7 = _ZN4__rwL12__rw_classicE;
      heapClassInst.heap32[(g0)] = Int32(r3);
      heapClassInst.heap32[(g0 + 1)] = Int32(r6);
      heapClassInst.heap32[(g0 + 2)] = Int32(r7);
      __FUNCTION_TABLE__[(r4) >> 2](i7);
      r3 = commonVariable.r_g0;
      r4 = _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E5__cat;
      r4 = r4 >> 2;
      heapClassInst.heap32[(r4)] = Int32(r3);
      r3 = Int64(heapClassInst.heap32[(fp + (-4))]);
      r3 = (r3 + (-12)) | 0;
      r4 = _ZNSs11_C_null_refE;
      if (!(r3 == r4)) 
      {
        r3 = r3 >> 2;
        r4 = Int64(heapClassInst.heap32[(r3)]);
        r6 = (r4 + (-1)) | 0;
        heapClassInst.heap32[(r3)] = Int32(r6);
        if (!(r4 > 0)) 
        {
          r3 = Int64(heapClassInst.heap32[(fp + (-4))]);
          r3 = (r3 + (-12)) | 0;
          heapClassInst.heap32[(g0)] = Int32(r3);
          _ZdlPv(i7);
        }
      }
      heapClassInst.heap32[(fp + (-4))] = 0;
      heapClassInst.heap32[(r2)] = Int32(r5);
    }
    r2 = _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E5__cat;
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2)]);
    if (r2 != ( -1)) 
    {
      r3 = _ZNSs11_C_null_refE;
      r4 = _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E4msgs;
      r5 = (r3 + 12) | 0;
      r6 = r4 >> 2;
      heapClassInst.heap32[(fp + (-2))] = Int32(r5);
      r5 = _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E8__catset;
      r6 = Int64(heapClassInst.heap32[(r6)]);
      r6 = r6 >> 2;
      r5 = r5 >> 2;
      r6 = Int64(heapClassInst.heap32[(r6 + 3)]);
      r5 = Int64(heapClassInst.heap32[(r5)]);
      r7 = sp + (-24);
      r8 = sp + (-8);
      heapClassInst.heap32[(g0)] = Int32(r7);
      heapClassInst.heap32[(g0 + 1)] = Int32(r4);
      heapClassInst.heap32[(g0 + 2)] = Int32(r2);
      heapClassInst.heap32[(g0 + 3)] = Int32(r5);
      heapClassInst.heap32[(g0 + 4)] = Int32(r0);
      heapClassInst.heap32[(g0 + 5)] = Int32(r8);
      __FUNCTION_TABLE__[(r6) >> 2](i7);
      r2 = Int64(heapClassInst.heap32[(fp + (-2))]);
      r2 = (r2 + (-12)) | 0;
      if (!(r2 == r3)) 
      {
        r2 = r2 >> 2;
        r4 = Int64(heapClassInst.heap32[(r2)]);
        r5 = (r4 + (-1)) | 0;
        heapClassInst.heap32[(r2)] = Int32(r5);
        if (!(r4 > 0)) 
        {
          r2 = Int64(heapClassInst.heap32[(fp + (-2))]);
          r2 = (r2 + (-12)) | 0;
          heapClassInst.heap32[(g0)] = Int32(r2);
          _ZdlPv(i7);
        }
      }
      heapClassInst.heap32[(fp + (-2))] = 0;
      r2 = Int64(heapClassInst.heap32[(fp + (-6))]);
      r4 = r2 >> 2;
      r4 = Int64(heapClassInst.heap32[(r4 + (-1))]);
      if (r4 != 0) 
      {
        heapClassInst.heap32[(g0)] = Int32(r2);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        _ZN4__rwL13__rw_vfmtwhatEPcjPKcS0_(i7);
        r1 = commonVariable.r_g0;
        r2 = Int64(heapClassInst.heap32[(fp + (-6))]);
      }
      else {
        r1 = 0;
      }
      r2 = (r2 + (-12)) | 0;
      if (!(r2 == r3)) 
      {
        r2 = r2 >> 2;
        r3 = Int64(heapClassInst.heap32[(r2)]);
        r4 = (r3 + (-1)) | 0;
        heapClassInst.heap32[(r2)] = Int32(r4);
        if (!(r3 > 0)) 
        {
          r2 = Int64(heapClassInst.heap32[(fp + (-6))]);
          r2 = (r2 + (-12)) | 0;
          heapClassInst.heap32[(g0)] = Int32(r2);
          _ZdlPv(i7);
        }
      }
      heapClassInst.heap32[(fp + (-6))] = 0;
      if (r1 == 0) 
      {
        __label__ = 50;
      }
      else {
        __label__ = 51;
      }
    }
    else {
      __label__ = 50;
    }
    if (__label__ == 50) {
      r1 = 24;
      r2 = 0;
      r0 = if (`UIntNative`(r0) > `UIntNative`(r1)) {r2} else {r0};
      r1 = _ZZN4__rw10__rw_throwEizE6errors;
      r2 = r0 << 2;
      r1 = (r1 + r2) | 0;
      r1 = r1 >> 2;
      r2 = Int64(heapClassInst.heap32[(fp + (-7))]);
      r1 = Int64(heapClassInst.heap32[(r1)]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      heapClassInst.heap32[(g0 + 1)] = Int32(r2);
      _ZN4__rwL13__rw_vfmtwhatEPcjPKcS0_(i7);
      r1 = commonVariable.r_g0;
      if (r1 == 0) 
      {
        if (r0 == 2) 
        {
          r0 = _E2_str47;
        }
        else {
          if (r0 == 1) 
          {
            r0 = _E2_str15132;
          }
          else {
            if (r0 != 0) 
            {
              r0 = _E2_str5134;
            }
            else {
              r0 = _E2_str4131;
            }
          }
        }
        heapClassInst.heap32[(g0)] = Int32(r0);
        fprintf(i7);
        __label__ = 62;
      }
      else {
        __label__ = 51;
      }
    }
    if (__label__ == 51) {
      heapClassInst.heap32[(g0)] = Int32(r1);
      r0 = _ZN4__rwL13__rw_what_bufE;
      fprintf(i7);
      if (r1 != r0) 
      {
        heapClassInst.heap32[(g0)] = Int32(r1);
        _ZdaPv(i7);
      }
      else {
        r0 = _ZN4__rwL16__rw_what_refcntE;
        r0 = r0 >> 2;
        r1 = Int64(heapClassInst.heap32[(r0)]);
        r1 = (r1 + (-1)) | 0;
        heapClassInst.heap32[(r0)] = Int32(r1);
      }
    }
    abort(i7);
  }
  else {
    if (r0 == 2) 
    {
      r0 = _E2_str47;
    }
    else {
      if (r0 == 1) 
      {
        r0 = _E2_str15132;
      }
      else {
        if (r0 != 0) 
        {
          r0 = _E2_str5134;
        }
        else {
          r0 = _E2_str4131;
        }
      }
    }
    heapClassInst.heap32[(g0)] = Int32(r0);
    fprintf(i7);
    abort(i7);
  }
}

func _ZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataE(sp: Int64) : Unit
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
  r0 = _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE4init_2E_b;
  r1 = Int64(heapClassInst.heapU8[r0]);
  if (!(r1 != 0)) 
  {
    r1 = _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE15catalog_bufsize;
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1)]);
    if (!(r1 == 0)) 
    {
      r2 = 0;
      while (true) {
        r3 = _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE8catalogs;
        r3 = r3 >> 2;
        r4 = r2 << 3;
        r3 = Int64(heapClassInst.heap32[(r3)]);
        r3 = (r3 + r4) | 0;
        r2 = (r2 + 1) | 0;
        r3 = r3 >> 2;
        heapClassInst.heap32[(r3)] = ( -1);
        if (!(`UIntNative`(r2) < `UIntNative`(r1))) 
        {
          break 
        }
      }
    }
    r1 = 1;
    heapClassInst.heap8[r0] = Int8(r1);
  }
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r0)]);
  do {
    if (r2 != ( -1)) 
    {
      if (r1 != 0) 
      {
        r3 = _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE10n_catalogs;
        r3 = r3 >> 2;
        r4 = Int64(heapClassInst.heap32[(r3)]);
        r5 = _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE8catalogs;
        r4 = (r4 + (-1)) | 0;
        r5 = r5 >> 2;
        heapClassInst.heap32[(r3)] = Int32(r4);
        r3 = Int64(heapClassInst.heap32[(r5)]);
        r2 = r2 << 3;
        r2 = (r3 + r2) | 0;
        r4 = _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE11largest_cat;
        r2 = r2 >> 2;
        heapClassInst.heap32[(r2)] = ( -1);
        r2 = r4 >> 2;
        r0 = Int64(heapClassInst.heap32[(r0)]);
        r4 = Int64(heapClassInst.heap32[(r2)]);
        if (r0 == r4) 
        {
          __label__ = 33; 
          while (true) {
            if (r0 > ( -1)) 
            {
              r6 = r0 << 3;
              r6 = (r3 + r6) | 0;
              r6 = r6 >> 2;
              r6 = Int64(heapClassInst.heap32[(r6)]);
              if (r6 == ( -1)) 
              {
                r0 = (r0 + (-1)) | 0;
              }
              else {
                __label__ = 31;
                break 
              }
            }
            else {
              __label__ = 34;
              break 
            }
          }
          match (__label__) {
            case 34 =>
              r0 = r4;
              // break;
            case 31 =>
              heapClassInst.heap32[(r2)] = Int32(r0);
            //   break;
            // default:
            //   break
            case _ =>
              println("break3672")
          }
          if (`UIntNative`(r0) > `UIntNative`(3)) 
          {
            __label__ = 40;
            break 
          }
          else {
            r0 = _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE11catalog_buf;
            if (r3 == r0) 
            {
              __label__ = 40;
              break 
            }
            else {
              r2 = _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE15catalog_bufsize;
              r2 = r2 >> 2;
              heapClassInst.heap32[(r2)] = 8;
              heapClassInst.heap32[(g0)] = Int32(r0);
              heapClassInst.heap32[(g0 + 1)] = Int32(r3);
              heapClassInst.heap32[(g0 + 2)] = 64;
              memcpy(i7);
              if (!(r3 == 0)) 
              {
                heapClassInst.heap32[(g0)] = Int32(r3);
                _ZdaPv(i7);
              }
              heapClassInst.heap32[(r5)] = Int32(r0);
              __label__ = 40;
              break 
            }
          }
        }
        else {
          __label__ = 40;
          break 
        }
      }
      else {
        r0 = _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE15catalog_bufsize;
        r0 = r0 >> 2;
        r0 = Int64(heapClassInst.heap32[(r0)]);
        if (`UIntNative`(r2) >= `UIntNative`(r0)) 
        {
          __label__ = 7;
          break 
        }
        else {
          r0 = _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE8catalogs;
          r0 = r0 >> 2;
          r0 = Int64(heapClassInst.heap32[(r0)]);
          r1 = r2 << 3;
          r0 = (r0 + r1) | 0;
          commonVariable.r_g0 = r0;
          return;
        }
      }
    }
    else {
      if (r1 != 0) 
      {
        r2 = _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE10n_catalogs;
        r2 = r2 >> 2;
        r3 = _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE15catalog_bufsize;
        r4 = Int64(heapClassInst.heap32[(r2)]);
        r3 = r3 >> 2;
        r5 = Int64(heapClassInst.heap32[(r3)]);
        if (r4 == r5) 
        {
          r4 = r4 << 4;
          r5 = _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE8catalogs;
          heapClassInst.heap32[(g0)] = Int32(r4);
          _Znaj(i7);
          r4 = commonVariable.r_g0;
          r5 = r5 >> 2;
          r6 = Int64(heapClassInst.heap32[(r2)]);
          r7 = Int64(heapClassInst.heap32[(r5)]);
          r8 = r6 << 3;
          heapClassInst.heap32[(g0)] = Int32(r4);
          heapClassInst.heap32[(g0 + 1)] = Int32(r7);
          heapClassInst.heap32[(g0 + 2)] = Int32(r8);
          memcpy(i7);
          r8 = _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE11catalog_buf;
          if (!(r7 == r8)) 
          {
            if (r7 != 0) 
            {
              heapClassInst.heap32[(g0)] = Int32(r7);
              _ZdaPv(i7);
              r6 = Int64(heapClassInst.heap32[(r2)]);
            }
          }
          heapClassInst.heap32[(r5)] = Int32(r4);
          r5 = Int64(heapClassInst.heap32[(r3)]);
          r5 = r5 << 1;
          heapClassInst.heap32[(r3)] = Int32(r5);
          do {
            if (!(`UIntNative`(r6) >= `UIntNative`(r5))) 
            {
              r3 = (r6 + 1) | 0;
              while (true) {
                r7 = r3 << 3;
                r7 = (r4 + r7) | 0;
                r7 = r7 >> 2;
                heapClassInst.heap32[(r7 + (-2))] = ( -1);
                if (`UIntNative`(r3) >= `UIntNative`(r5)) 
                {
                  break 
                }
                else {
                  r3 = (r3 + 1) | 0;
                }
              }
            }
          } while (false);
          r3 = r6 << 3;
          r3 = (r4 + r3) | 0;
          heapClassInst.heap32[(r0)] = Int32(r6);
          r3 = (r3 + 4) | 0;
          r5 = (r1 + 4) | 0;
          heapClassInst.heap32[(g0)] = Int32(r3);
          heapClassInst.heap32[(g0 + 1)] = Int32(r5);
          heapClassInst.heap32[(g0 + 2)] = 4;
          memcpy(i7);
          r3 = Int64(heapClassInst.heap32[(r0)]);
          r3 = r3 << 3;
          r5 = r1 >> 2;
          r3 = (r4 + r3) | 0;
          r4 = Int64(heapClassInst.heap32[(r5)]);
          r3 = r3 >> 2;
          heapClassInst.heap32[(r3)] = Int32(r4);
          r0 = Int64(heapClassInst.heap32[(r0)]);
          r3 = _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE11largest_cat;
          r3 = r3 >> 2;
          r4 = Int64(heapClassInst.heap32[(r3)]);
          if (!(`UIntNative`(r0) <= `UIntNative`(r4))) 
          {
            heapClassInst.heap32[(r3)] = Int32(r0);
          }
          r0 = (r6 + 1) | 0;
          heapClassInst.heap32[(r2)] = Int32(r0);
          commonVariable.r_g0 = r1;
          return;
        }
        else {
          r3 = _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE8catalogs;
          r3 = r3 >> 2;
          heapClassInst.heap32[(r0)] = 0;
          r3 = Int64(heapClassInst.heap32[(r3)]);
          r5 = r3 >> 2;
          r5 = Int64(heapClassInst.heap32[(r5)]);
          do {
            if (r5 != ( -1)) 
            {
              r5 = 0;
              while (true) {
                r6 = r5 << 3;
                r6 = (r3 + r6) | 0;
                r5 = (r5 + 1) | 0;
                r6 = r6 >> 2;
                heapClassInst.heap32[(r0)] = Int32(r5);
                r6 = Int64(heapClassInst.heap32[(r6 + 2)]);
                if (!(r6 != ( -1))) 
                {
                  break 
                }
              }
            }
            else {
              r5 = 0;
            }
          } while (false);
          r6 = _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE11largest_cat;
          r6 = r6 >> 2;
          r7 = Int64(heapClassInst.heap32[(r6)]);
          if (!(`UIntNative`(r5) <= `UIntNative`(r7))) 
          {
            heapClassInst.heap32[(r6)] = Int32(r5);
          }
          r5 = r5 << 3;
          r5 = (r3 + r5) | 0;
          r5 = (r5 + 4) | 0;
          r6 = (r1 + 4) | 0;
          heapClassInst.heap32[(g0)] = Int32(r5);
          heapClassInst.heap32[(g0 + 1)] = Int32(r6);
          heapClassInst.heap32[(g0 + 2)] = 4;
          memcpy(i7);
          r0 = Int64(heapClassInst.heap32[(r0)]);
          r0 = r0 << 3;
          r5 = r1 >> 2;
          r0 = (r3 + r0) | 0;
          r3 = Int64(heapClassInst.heap32[(r5)]);
          r0 = r0 >> 2;
          r4 = (r4 + 1) | 0;
          heapClassInst.heap32[(r0)] = Int32(r3);
          heapClassInst.heap32[(r2)] = Int32(r4);
          commonVariable.r_g0 = r1;
          return;
        }
      }
      else {
        __label__ = 7;
      }
    }
  } while (false);
  if (__label__ == 7) {
    r1 = 0;
  }
  commonVariable.r_g0 = r1;
  return;
}

func _ZN4__rw14__rw_cat_closeEi(sp: Int64) : Unit
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
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heap32[(fp + (-1))] = Int32(r0);
  if (!(r0 < 0)) 
  {
    r0 = sp + (-4);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = 0;
    _ZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataE(i7);
    r1 = commonVariable.r_g0;
    if (!(r1 == 0)) 
    {
      r2 = r1 >> 2;
      r2 = Int64(heapClassInst.heap32[(r2)]);
      if (!(r2 == ( -1))) 
      {
        r3 = _ZN4__rwL12__rw_catlistE_2E_1;
        r4 = _ZN4__rwL12__rw_catlistE_2E_0;
        r3 = r3 >> 2;
        r4 = r4 >> 2;
        r5 = Int64(heapClassInst.heap32[(r4)]);
        r6 = Int64(heapClassInst.heap32[(r3)]);
        r6 = (r6 - r5) | 0;
        r6 = r6 >> 2;
        r7 = 0;
        while (true) {
          if (`UIntNative`(r6) > `UIntNative`(r7)) 
          {
            r8 = r7 << 2;
            r8 = (r5 + r8) | 0;
            r8 = r8 >> 2;
            r8 = Int64(heapClassInst.heap32[(r8)]);
            if (r8 == 0) 
            {
              __label__ = 7;
              break 
            }
            else {
              if (r8 != r2) 
              {
                r7 = (r7 + 1) | 0;
              }
              else {
                __label__ = 9;
                break 
              }
            }
          }
          else {
            __label__ = 7;
            break 
          }
        }
        if (__label__ == 7) {
          r7 = r6;
        }
        do {
          if (!(`UIntNative`(r6) <= `UIntNative`(r7))) 
          {
            r2 = r7 << 2;
            r6 = (r5 + r2) | 0;
            r6 = r6 >> 2;
            r6 = Int64(heapClassInst.heap32[(r6)]);
            if (r6 != 0) 
            {
              heapClassInst.heap32[(g0)] = Int32(r6);
              _ZdlPv(i7);
              r5 = Int64(heapClassInst.heap32[(r4)]);
            }
            r2 = (r5 + r2) | 0;
            r4 = (r7 + 1) | 0;
            r2 = r2 >> 2;
            heapClassInst.heap32[(r2)] = 0;
            while (true) {
              r2 = Int64(heapClassInst.heap32[(r3)]);
              r2 = (r2 - r5) | 0;
              r2 = r2 >> 2;
              if (`UIntNative`(r2) <= `UIntNative`(r4)) 
              {
                break 
              }
              else {
                r2 = r4 << 2;
                r2 = (r5 + r2) | 0;
                r6 = r2 >> 2;
                r2 = Int64(heapClassInst.heap32[(r6)]);
                if (r2 != 0) 
                {
                  r4 = (r4 + 1) | 0;
                  heapClassInst.heap32[(r6 + (-1))] = Int32(r2);
                }
                else {
                  break 
                }
              }
            }
            heapClassInst.heap32[(r6)] = 0;
          }
        } while (false);
        r2 = (r1 + 4) | 0;
        heapClassInst.heap32[(g0)] = Int32(r2);
        _ZNSt6localeD1Ev(i7);
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        _ZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataE(i7);
        return;
      }
    }
  }
  r0 = _E2_str115180;
  r1 = _E2_str1116181;
  heapClassInst.heap32[(g0)] = 7;
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  heapClassInst.heap32[(g0 + 2)] = Int32(r1);
  _ZN4__rw10__rw_throwEiz(i7);
  return;
}

func _ZN4__rw16__rw_locale_nameEiPKcRNS_14__rw_pod_arrayIcLj256EEE(sp: Int64) : Unit
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
  i7 = sp + (-368); 
  var g0 = i7 >> 2; 
  r0 = _ZZN4__rw16__rw_locale_nameEiPKcRNS_14__rw_pod_arrayIcLj256EEEE11locale_root;
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  r3 = Int64(heapClassInst.heap32[(fp + 2)]);
  r4 = Int64(heapClassInst.heapU8[r0]);
  r5 = 0;
  heapClassInst.heap8[sp + (-259)] = Int8(r5);
  r6 = Int64(heapClassInst.heapU8[r2]);
  do {
    if (r6 != 0) 
    {
      r7 = (r2 + 1) | 0;
      while (true) {
        r6 = (r5 + 1) | 0;
        r8 = Int64(heapClassInst.heapU8[r7 + r5]);
        r5 = r6;
        if (r8 != 0) 
        {
          continue 
        }
        else {
          break 
        }
      }
    }
    else {
      r6 = 0;
    }
  } while (false);
  r4 = r4 & 255;
  do {
    if (r4 != 0) 
    {
      r4 = (r6 + 1) | 0;
      r5 = (r0 + 1) | 0;
      while (true) {
        r4 = (r4 + 1) | 0;
        r7 = (r5 + 1) | 0;
        r8 = Int64(heapClassInst.heapU8[r5]);
        r5 = r7;
        if (!(r8 != 0)) 
        {
          break 
        }
      }
      if (`UIntNative`(r4) > `UIntNative`(258)) 
      {
        __label__ = 5;
      }
      else {
        r4 = sp + (-259);
        heapClassInst.heap32[(g0)] = Int32(r4);
        heapClassInst.heap32[(g0 + 1)] = Int32(r0);
        strcpy(i7);
        r0 = Int64(heapClassInst.heapU8[sp + (-259)]);
        do {
          if (r0 != 0) 
          {
            r0 = (r4 + 1) | 0;
            r7 = 0;
            while (true) {
              r5 = (r7 + 1) | 0;
              r8 = Int64(heapClassInst.heapU8[r0 + r7]);
              r7 = r5;
              if (!(r8 != 0)) 
              {
                break 
              }
            }
          }
          else {
            r5 = 0;
          }
        } while (false);
        r7 = 47;
        r0 = (r5 + 1) | 0;
        r8 = 0;
        heapClassInst.heap8[r4 + r5] = Int8(r7);
        heapClassInst.heap8[r4 + r0] = Int8(r8);
        r5 = Int64(heapClassInst.heapU8[sp + (-259)]);
        if (r5 != 0) 
        {
          r5 = (r4 + 1) | 0;
          while (true) {
            r4 = (r8 + 1) | 0;
            r7 = Int64(heapClassInst.heapU8[r5 + r8]);
            r8 = r4;
            if (r7 != 0) 
            {
              continue 
            }
            else {
              __label__ = 17;
              break 
            }
          }
        }
        else {
          r4 = 0;
          __label__ = 17;
        }
      }
    }
    else {
      __label__ = 5;
    }
  } while (false);
  if (__label__ == 5) {
    r0 = 0;
    r4 = r0;
  }
  r4 = (r4 + r6) | 0;
  if (!(`UIntNative`(r4) > `UIntNative`(258))) 
  {
    r4 = sp + (-259);
    r0 = (r4 + r0) | 0;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
    strcpy(i7);
    r0 = _E2_str37683;
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    strcmp(i7);
    r0 = commonVariable.r_g0;
    if (r0 == 0) 
    {
      r1 = Int64(heapClassInst.heapU8[r2]);
      do {
        if (r1 != 0) 
        {
          r0 = (r2 + 1) | 0;
          r4 = 0;
          while (true) {
            r1 = (r4 + 1) | 0;
            r5 = Int64(heapClassInst.heapU8[r0 + r4]);
            r4 = r1;
            if (!(r5 != 0)) 
            {
              break 
            }
          }
        }
        else {
          r1 = 0;
        }
      } while (false);
      r0 = r3 >> 2;
      heapClassInst.heap32[(r0)] = 0;
      heapClassInst.heap32[(g0)] = Int32(r3);
      heapClassInst.heap32[(g0 + 1)] = Int32(r2);
      heapClassInst.heap32[(g0 + 2)] = Int32(r1);
      _ZN4__rw14__rw_pod_arrayIcLj256EE6appendEPKcj(i7);
      r1 = Int64(heapClassInst.heap32[(r0 + 1)]);
      commonVariable.r_g0 = r1;
      return;
    }
    else {
      r2 = _E2_str1648;
      heapClassInst.heap32[(g0)] = Int32(r4);
      heapClassInst.heap32[(g0 + 1)] = Int32(r2);
      fopen(i7);
      r2 = commonVariable.r_g0;
      if (!(r2 == 0)) 
      {
        if (`UIntNative`(r2) < `UIntNative`(10)) 
        {
          r3 = _ZL13s_file_stdout;
          r0 = r3 >> 2;
          r0 = Int64(heapClassInst.heap32[(r0)]);
          r0 = r0 >> 2;
          r0 = Int64(heapClassInst.heap32[(r0 + 7)]);
          heapClassInst.heap32[(g0)] = Int32(r3);
          heapClassInst.heap32[(g0 + 1)] = 0;
          heapClassInst.heap32[(g0 + 2)] = 2;
          __FUNCTION_TABLE__[(r0) >> 2](i7);
        }
        else {
          r3 = r2 >> 2;
          r3 = Int64(heapClassInst.heap32[(r3)]);
          r3 = r3 >> 2;
          r3 = Int64(heapClassInst.heap32[(r3 + 7)]);
          heapClassInst.heap32[(g0)] = Int32(r2);
          heapClassInst.heap32[(g0 + 1)] = 0;
          heapClassInst.heap32[(g0 + 2)] = 2;
          __FUNCTION_TABLE__[(r3) >> 2](i7);
          r3 = r2;
        }
        r0 = r3 >> 2;
        r0 = Int64(heapClassInst.heap32[(r0)]);
        r0 = r0 >> 2;
        r0 = Int64(heapClassInst.heap32[(r0 + 5)]);
        heapClassInst.heap32[(g0)] = Int32(r3);
        __FUNCTION_TABLE__[(r0) >> 2](i7);
        if (`UIntNative`(r2) > `UIntNative`(9)) 
        {
          r3 = r2;
        }
        else {
          r3 = _ZL13s_file_stdout;
        }
        r0 = r3 >> 2;
        r0 = Int64(heapClassInst.heap32[(r0)]);
        r0 = r0 >> 2;
        r0 = Int64(heapClassInst.heap32[(r0 + 4)]);
        heapClassInst.heap32[(g0)] = Int32(r3);
        __FUNCTION_TABLE__[(r0) >> 2](i7);
        if (!(`UIntNative`(r2) < `UIntNative`(10))) 
        {
          heapClassInst.heap32[(g0)] = Int32(r3);
          _ZdlPv(i7);
        }
      }
    }
  }
  r0 = sp + (-352);
  r0 = r0 >> 2;
  heapClassInst.heap32[(r0 + 20)] = 0;
  heapClassInst.heap32[(r0 + 22)] = Int32(r1);
  heapClassInst.heap32[(r0 + 21)] = 0;
  r0 = 0;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNKSt8messagesIcE8do_closeEi(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZN4__rw14__rw_cat_closeEi(i7);
  return;
}

func _ZNKSt8messagesIcE6do_getEiiiRKSs(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(fp + (-1))] = Int32(r0);
  if (!(r0 < 0)) 
  {
    r0 = sp + (-4);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = 0;
    _ZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataE(i7);
    r0 = commonVariable.r_g0;
    if (!(r0 == 0)) 
    {
      r0 = r0 >> 2;
      r0 = Int64(heapClassInst.heap32[(r0)]);
      if (!(r0 == ( -1))) 
      {
        r1 = _ZN4__rwL12__rw_catlistE_2E_1;
        r2 = _ZN4__rwL12__rw_catlistE_2E_0;
        r1 = r1 >> 2;
        r2 = r2 >> 2;
        r2 = Int64(heapClassInst.heap32[(r2)]);
        r1 = Int64(heapClassInst.heap32[(r1)]);
        r1 = (r1 - r2) | 0;
        r1 = r1 >> 2;
        r3 = 0;
        while (true) {
          if (`UIntNative`(r1) <= `UIntNative`(r3)) 
          {
            break 
          }
          else {
            r4 = r3 << 2;
            r4 = (r2 + r4) | 0;
            r4 = r4 >> 2;
            r4 = Int64(heapClassInst.heap32[(r4)]);
            if (r4 == 0) 
            {
              break 
            }
            else {
              if (r4 != r0) 
              {
                r3 = (r3 + 1) | 0;
                continue 
              }
              else {
                break 
              }
            }
          }
        }
      }
    }
  }
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 5)]);
  r1 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1)]);
  r3 = r2 >> 2;
  r4 = Int64(heapClassInst.heap32[(r3 + (-3))]);
  if (r4 == ( -1)) 
  {
    r2 = Int64(heapClassInst.heap32[(r3 + (-1))]);
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
    _ZNSs10_C_get_repEjj(i7);
    r0 = r0 >> 2;
    r3 = (commonVariable.r_g0 + 12) | 0;
    heapClassInst.heap32[(r0)] = Int32(r3);
    r0 = Int64(heapClassInst.heap32[(r1)]);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    heapClassInst.heap32[(g0 + 2)] = Int32(r2);
    memcpy(i7);
  }
  else {
    r1 = (r2 + (-12)) | 0;
    r0 = r0 >> 2;
    r3 = _ZNSs11_C_null_refE;
    heapClassInst.heap32[(r0)] = Int32(r2);
    if (!(r1 == r3)) 
    {
      r0 = r1 >> 2;
      r1 = (r4 + 1) | 0;
      heapClassInst.heap32[(r0)] = Int32(r1);
      return;
    }
  }
  return;
}

func _ZNKSt8messagesIcE7do_openERKSsRKSt6locale(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  heapClassInst.heap32[(g0)] = 1;
  _Znwj(i7);
  r0 = commonVariable.r_g0;
  if (!(r0 == 0)) 
  {
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
  }
  r0 = ( -1);
  commonVariable.r_g0 = r0;
  return;
}

func _ZNSt8messagesIcED0Ev(sp: Int64) : Unit
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
  r1 = _ZTVN4__rw10__rw_facetE;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(r2 + 5)] = ( -1);
  r1 = Int64(heapClassInst.heap32[(r2 + 1)]);
  r3 = Int64(heapClassInst.heap32[(r2 + 2)]);
  if (!(r1 == r3)) 
  {
    if (!(r1 == 0)) 
    {
      heapClassInst.heap32[(g0)] = Int32(r1);
      _ZdaPv(i7);
    }
  }
  r1 = _ZZN4__rw10__rw_facetD4EvE9destroyed;
  heapClassInst.heap32[(r2 + 1)] = Int32(r1);
  r1 = Int64(heapClassInst.heap32[(r2 + 4)]);
  if (!(r1 != ( -1))) 
  {
    r1 = Int64(heapClassInst.heap32[(r2 + 3)]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    _ZdlPv(i7);
  }
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZNSt8messagesIcED1Ev(sp: Int64) : Unit
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
  r1 = _ZTVN4__rw10__rw_facetE;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  heapClassInst.heap32[(r0 + 5)] = ( -1);
  r1 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r2 = Int64(heapClassInst.heap32[(r0 + 2)]);
  if (!(r1 == r2)) 
  {
    if (!(r1 == 0)) 
    {
      heapClassInst.heap32[(g0)] = Int32(r1);
      _ZdaPv(i7);
    }
  }
  r1 = _ZZN4__rw10__rw_facetD4EvE9destroyed;
  heapClassInst.heap32[(r0 + 1)] = Int32(r1);
  r1 = Int64(heapClassInst.heap32[(r0 + 4)]);
  if (!(r1 != ( -1))) 
  {
    r0 = Int64(heapClassInst.heap32[(r0 + 3)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    _ZdlPv(i7);
  }
  return;
}

func _ZN4__rw14__rw_pod_arrayIcLj256EE6appendEPKcj(sp: Int64) : Unit
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
  i7 = sp + (-16); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  r3 = Int64(heapClassInst.heap32[(r1)]);
  r4 = (r3 + r2) | 0;
  r5 = Int64(heapClassInst.heap32[(fp + 1)]);
  if (`UIntNative`(r4) > `UIntNative`(255)) 
  {
    r3 = (r4 + 1) | 0;
    heapClassInst.heap32[(g0)] = Int32(r3);
    _Znaj(i7);
    r7 = commonVariable.r_g0;
    r3 = Int64(heapClassInst.heap32[(r1)]);
    r6 = Int64(heapClassInst.heap32[(r1 + 1)]);
    heapClassInst.heap32[(g0)] = Int32(r7);
    heapClassInst.heap32[(g0 + 1)] = Int32(r6);
    heapClassInst.heap32[(g0 + 2)] = Int32(r3);
    memcpy(i7);
    r3 = Int64(heapClassInst.heap32[(r1 + 1)]);
    r6 = (r0 + 8) | 0;
    if (!(r3 == r6)) 
    {
      if (!(r3 == 0)) 
      {
        heapClassInst.heap32[(g0)] = Int32(r3);
        _ZdaPv(i7);
      }
    }
    r6 = (r0 + 4) | 0;
    heapClassInst.heap32[(r1 + 1)] = Int32(r7);
    r3 = Int64(heapClassInst.heap32[(r1)]);
  }
  else {
    r6 = (r0 + 4) | 0;
    r7 = Int64(heapClassInst.heap32[(r1 + 1)]);
  }
  r3 = (r7 + r3) | 0;
  heapClassInst.heap32[(g0)] = Int32(r3);
  heapClassInst.heap32[(g0 + 1)] = Int32(r5);
  heapClassInst.heap32[(g0 + 2)] = Int32(r2);
  memcpy(i7);
  r2 = r6 >> 2;
  heapClassInst.heap32[(r1)] = Int32(r4);
  r1 = Int64(heapClassInst.heap32[(r2)]);
  r2 = 0;
  heapClassInst.heap8[r1 + r4] = Int8(r2);
  commonVariable.r_g0 = r0;
  return;
}

func _ZNSs10_C_get_repEjj(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  do {
    if (`UIntNative`(r0) < `UIntNative`(-13)) 
    {
      if (`UIntNative`(r0) < `UIntNative`(r1)) 
      {
        r2 = _E2_str4362;
        r3 = _E2_str3361;
        heapClassInst.heap32[(g0)] = 8;
        heapClassInst.heap32[(g0 + 1)] = Int32(r2);
        heapClassInst.heap32[(g0 + 2)] = Int32(r3);
        heapClassInst.heap32[(g0 + 3)] = Int32(r1);
        heapClassInst.heap32[(g0 + 4)] = Int32(r0);
        _ZN4__rw10__rw_throwEiz(i7);
        __label__ = 6;
        break 
      }
      else {
        __label__ = 6;
        break 
      }
    }
    else {
      if (`UIntNative`(r1) > `UIntNative`(-14)) 
      {
        r0 = _E2_str2360;
        r2 = _E2_str3361;
        heapClassInst.heap32[(g0)] = 8;
        heapClassInst.heap32[(g0 + 1)] = Int32(r0);
        heapClassInst.heap32[(g0 + 2)] = Int32(r2);
        heapClassInst.heap32[(g0 + 3)] = Int32(r1);
        heapClassInst.heap32[(g0 + 4)] = ( -14);
        _ZN4__rw10__rw_throwEiz(i7);
        r0 = r1;
        __label__ = 8;
      }
      else {
        r0 = r1;
        __label__ = 6;
      }
    }
  } while (false);
  if (__label__ == 6) {
    if (r0 == 0) 
    {
      r0 = _ZNSs11_C_null_refE;
      commonVariable.r_g0 = r0;
      return;
    }
  }
  r2 = (r0 + 14) | 0;
  heapClassInst.heap32[(g0)] = Int32(r2);
  _Znwj(i7);
  r2 = commonVariable.r_g0;
  if (!(r2 != 0)) 
  {
    heapClassInst.heap32[(g0)] = 3;
    _ZN4__rw10__rw_throwEiz(i7);
  }
  r3 = r2 >> 2;
  heapClassInst.heap32[(r3)] = 0;
  heapClassInst.heap32[(r3 + 1)] = Int32(r0);
  r0 = (r1 + r2) | 0;
  r4 = 0;
  heapClassInst.heap32[(r3 + 2)] = Int32(r1);
  heapClassInst.heap8[r0 + 12] = Int8(r4);
  commonVariable.r_g0 = r2;
  return;
}

func _ZNKSt9type_info15__is_function_pEv(sp: Int64) : Unit
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

func _ZNSt9type_infoD0Ev(sp: Int64) : Unit
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
  r1 = _ZTVSt9type_info;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZNSt9type_infoD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVSt9type_info;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func tlsf_free(sp: Int64) : Unit
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
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  if (!(r0 == 0)) 
  {
    r1 = Int64(heapClassInst.heap32[(fp)]);
    r2 = r0 >> 2;
    r3 = Int64(heapClassInst.heap32[(r2 + (-1))]);
    r4 = s_current_memory;
    r5 = (r3 + (-4)) | 0;
    r4 = r4 >> 2;
    r5 = r5 & ( -4);
    r6 = Int64(heapClassInst.heap32[(r4)]);
    r3 = r3 & ( -4);
    r5 = (r0 + r5) | 0;
    r3 = (r6 - r3) | 0;
    r0 = (r0 + (-8)) | 0;
    r5 = r5 >> 2;
    heapClassInst.heap32[(r4)] = Int32(r3);
    heapClassInst.heap32[(r5)] = Int32(r0);
    r3 = Int64(heapClassInst.heap32[(r5 + 1)]);
    r3 = r3 | 2;
    heapClassInst.heap32[(r5 + 1)] = Int32(r3);
    r3 = Int64(heapClassInst.heap32[(r2 + (-1))]);
    r4 = r3 | 1;
    heapClassInst.heap32[(r2 + (-1))] = Int32(r4);
    r3 = r3 & 2;
    if (r3 != 0) 
    {
      r0 = r0 >> 2;
      r0 = Int64(heapClassInst.heap32[(r0)]);
      r3 = r0 >> 2;
      r4 = Int64(heapClassInst.heap32[(r3 + 1)]);
      r5 = r4 & ( -4);
      if (`UIntNative`(r5) > `UIntNative`(255)) 
      {
        r4 = r5 >> 1;
        r4 = r5 | r4;
        r6 = r4 >> 2;
        r4 = r4 | r6;
        r6 = r4 >> 4;
        r4 = r4 | r6;
        r6 = r4 >> 8;
        r4 = r4 | r6;
        r6 = r4 >> 16;
        r4 = r4 | r6;
        r6 = r4 ^ ( -1);
        r7 = 1431655765;
        r6 = r6 >> 1;
        r4 = r7 & (!r4);
        r6 = r6 & 1431655765;
        r4 = (r4 + r6) | 0;
        r6 = r4 >> 2;
        r4 = r4 & 858993459;
        r6 = r6 & 858993459;
        r4 = (r4 + r6) | 0;
        r6 = r4 >> 4;
        r4 = r4 & 252645135;
        r6 = r6 & 252645135;
        r4 = (r4 + r6) | 0;
        r6 = r4 >> 8;
        r4 = r4 & 16711935;
        r6 = r6 & 16711935;
        r4 = (r4 + r6) | 0;
        r6 = r4 & 65535;
        r4 = r4 >> 16;
        r7 = 26;
        r4 = (r6 + r4) | 0;
        r6 = (r7 - r4) | 0;
        r5 = r5 >> r6;
        r6 = 24;
        r5 = r5 ^ 32;
        r4 = (r6 - r4) | 0;
      }
      else {
        r5 = r4 >> 3;
        r4 = 0;
      }
      r6 = r4 << 7;
      r7 = Int64(heapClassInst.heap32[(r3 + 2)]);
      r8 = Int64(heapClassInst.heap32[(r3 + 3)]);
      r6 = (r1 + r6) | 0;
      r9 = r5 << 2;
      r6 = (r6 + r9) | 0;
      r9 = r7 >> 2;
      r10 = r8 >> 2;
      heapClassInst.heap32[(r9 + 3)] = Int32(r8);
      r8 = r6 >> 2;
      heapClassInst.heap32[(r10 + 2)] = Int32(r7);
      r8 = Int64(heapClassInst.heap32[(r8 + 24)]);
      if (!(r8 != r0)) 
      {
        r6 = (r6 + 96) | 0;
        r6 = r6 >> 2;
        r8 = block_null;
        heapClassInst.heap32[(r6)] = Int32(r7);
        if (!(r7 != r8)) 
        {
          r6 = r4 << 2;
          r6 = (r1 + r6) | 0;
          r6 = r6 >> 2;
          r7 = 1;
          r5 = r7 << r5;
          r8 = Int64(heapClassInst.heap32[(r6 + 1)]);
          r5 = r8 & (!r5);
          heapClassInst.heap32[(r6 + 1)] = Int32(r5);
          if (!(r5 != 0)) 
          {
            r5 = r1 >> 2;
            r4 = r7 << r4;
            r6 = Int64(heapClassInst.heap32[(r5)]);
            r4 = r6 & (!r4);
            heapClassInst.heap32[(r5)] = Int32(r4);
          }
        }
      }
      r4 = (r0 + 8) | 0;
      r2 = Int64(heapClassInst.heap32[(r2 + (-1))]);
      r5 = Int64(heapClassInst.heap32[(r3 + 1)]);
      r2 = r2 & ( -4);
      r2 = (r2 + r5) | 0;
      r5 = r2 & ( -4);
      r4 = (r4 + r5) | 0;
      r2 = (r2 + 4) | 0;
      r4 = r4 >> 2;
      heapClassInst.heap32[(r3 + 1)] = Int32(r2);
      heapClassInst.heap32[(r4)] = Int32(r0);
    }
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    block_merge_next(i7);
    r0 = commonVariable.r_g0;
    r2 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2 + 1)]);
    r3 = r2 & ( -4);
    if (`UIntNative`(r3) > `UIntNative`(255)) 
    {
      r2 = r3 >> 1;
      r2 = r3 | r2;
      r4 = r2 >> 2;
      r2 = r2 | r4;
      r4 = r2 >> 4;
      r2 = r2 | r4;
      r4 = r2 >> 8;
      r2 = r2 | r4;
      r4 = r2 >> 16;
      r2 = r2 | r4;
      r4 = r2 ^ ( -1);
      r5 = 1431655765;
      r4 = r4 >> 1;
      r2 = r5 & (!r2);
      r4 = r4 & 1431655765;
      r2 = (r2 + r4) | 0;
      r4 = r2 >> 2;
      r2 = r2 & 858993459;
      r4 = r4 & 858993459;
      r2 = (r2 + r4) | 0;
      r4 = r2 >> 4;
      r2 = r2 & 252645135;
      r4 = r4 & 252645135;
      r2 = (r2 + r4) | 0;
      r4 = r2 >> 8;
      r2 = r2 & 16711935;
      r4 = r4 & 16711935;
      r2 = (r2 + r4) | 0;
      r4 = r2 & 65535;
      r2 = r2 >> 16;
      r5 = 26;
      r2 = (r4 + r2) | 0;
      r4 = (r5 - r2) | 0;
      r3 = r3 >> r4;
      r4 = 24;
      r3 = r3 ^ 32;
      r2 = (r4 - r2) | 0;
    }
    else {
      r3 = r2 >> 3;
      r2 = 0;
    }
    r4 = r2 << 7;
    r4 = (r1 + r4) | 0;
    r5 = r3 << 2;
    r4 = (r4 + r5) | 0;
    r4 = r4 >> 2;
    r5 = Int64(heapClassInst.heap32[(r4 + 24)]);
    r6 = r0 >> 2;
    r7 = block_null;
    heapClassInst.heap32[(r6 + 2)] = Int32(r5);
    r5 = r5 >> 2;
    heapClassInst.heap32[(r6 + 3)] = Int32(r7);
    heapClassInst.heap32[(r5 + 3)] = Int32(r0);
    r5 = 1;
    r6 = r1 >> 2;
    heapClassInst.heap32[(r4 + 24)] = Int32(r0);
    r0 = r2 << 2;
    r2 = r5 << r2;
    r4 = Int64(heapClassInst.heap32[(r6)]);
    r0 = (r1 + r0) | 0;
    r1 = r4 | r2;
    r0 = r0 >> 2;
    heapClassInst.heap32[(r6)] = Int32(r1);
    r1 = r5 << r3;
    r2 = Int64(heapClassInst.heap32[(r0 + 1)]);
    r1 = r2 | r1;
    heapClassInst.heap32[(r0 + 1)] = Int32(r1);
  }
  return;
}

func _stricmp(sp: Int64) : Unit
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
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r5 = 26;
  while (true) {
    r2 = Int64(heapClassInst.heap8[r1]);
    r3 = Int64(heapClassInst.heap8[r0]);
    r4 = (r2 + (-65)) | 0;
    r2 = (r2 + (-33)) | 0;
    r6 = (r3 + (-65)) | 0;
    r3 = (r3 + (-33)) | 0;
    r2 = if (`UIntNative`(r4) < `UIntNative`(r5)) {r2} else {r4};
    r3 = if (`UIntNative`(r6) < `UIntNative`(r5)) {r3} else {r6};
    if (r2 != r3) 
    {
      break 
    }
    else {
      r0 = (r0 + 1) | 0;
      r1 = (r1 + 1) | 0;
      if (r3 != ( -65)) 
      {
        continue 
      }
      else {
        break 
      }
    }
  }
  r0 = (r3 - r2) | 0;
  commonVariable.r_g0 = r0;
  return;
}

func strcasecmp(sp: Int64) : Unit
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
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r5 = 26;
  while (true) {
    r2 = Int64(heapClassInst.heap8[r1]);
    r3 = Int64(heapClassInst.heap8[r0]);
    r4 = (r2 + (-65)) | 0;
    r2 = (r2 + (-33)) | 0;
    r6 = (r3 + (-65)) | 0;
    r3 = (r3 + (-33)) | 0;
    r2 = if (`UIntNative`(r4) < `UIntNative`(r5)) {r2} else {r4};
    r3 = if (`UIntNative`(r6) < `UIntNative`(r5)) {r3} else {r6};
    if (r2 != r3) 
    {
      break 
    }
    else {
      r1 = (r1 + 1) | 0;
      r0 = (r0 + 1) | 0;
      if (r3 != ( -65)) 
      {
        continue 
      }
      else {
        break 
      }
    }
  }
  r0 = (r3 - r2) | 0;
  commonVariable.r_g0 = r0;
  return;
}

func memmove(sp: Int64) : Unit
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
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  do {
    if (!(r0 == r1)) 
    {
      r2 = Int64(heapClassInst.heap32[(fp + 2)]);
      if (`UIntNative`(r0) <= `UIntNative`(r1)) 
      {
        if (!(r2 == 0)) 
        {
          r3 = 0;
          r2 = (r3 - r2) | 0;
          while (true) {
            r3 = (r0 - r2) | 0;
            r4 = (r2 + 1) | 0;
            r2 = (r1 - r2) | 0;
            r3 = Int64(heapClassInst.heapU8[r3 + (-1)]);
            heapClassInst.heap8[r2 + (-1)] = Int8(r3);
            r2 = r4;
            if (r4 != 0) 
            {
              continue 
            }
            else {
              break 
            }
          }
        }
      }
      else {
        if (!(r2 == 0)) 
        {
          r3 = r1;
          while (true) {
            r4 = Int64(heapClassInst.heapU8[r0]);
            r2 = (r2 + (-1)) | 0;
            r5 = (r3 + 1) | 0;
            r0 = (r0 + 1) | 0;
            heapClassInst.heap8[r3] = Int8(r4);
            r3 = r5;
            if (r2 == 0) 
            {
              break 
            }
            else {
              continue 
            }
          }
        }
      }
    }
  } while (false);
  commonVariable.r_g0 = r1;
  return;
}

func strncasecmp(sp: Int64) : Unit
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
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  r3 = 0;
  r7 = 26;
  while (true) {
    if (r3 >= r2) 
    {
      __label__ = 5;
      break 
    }
    else {
      r4 = Int64(heapClassInst.heap8[r1 + r3]);
      r5 = Int64(heapClassInst.heap8[r0 + r3]);
      r6 = (r4 + (-65)) | 0;
      r4 = (r4 + (-33)) | 0;
      r8 = (r5 + (-65)) | 0;
      r5 = (r5 + (-33)) | 0;
      r4 = if (`UIntNative`(r6) < `UIntNative`(r7)) {r4} else {r6};
      r5 = if (`UIntNative`(r8) < `UIntNative`(r7)) {r5} else {r8};
      if (r4 != r5) 
      {
        __label__ = 4;
        break 
      }
      else {
        r3 = (r3 + 1) | 0;
        if (r5 != ( -65)) 
        {
          continue 
        }
        else {
          __label__ = 4;
          break 
        }
      }
    }
  }
  match (__label__) {
    case 5 =>
      r0 = 0;
      commonVariable.r_g0 = r0;
      return;
      // break;
    case 4 =>
      r0 = (r5 - r4) | 0;
      commonVariable.r_g0 = r0;
      return;
    //   break
    // default:
    //   break;
    case _ =>
      println("break5127")
  }
}

func strncmp(sp: Int64) : Unit
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
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  if (`UIntNative`(r0) > `UIntNative`(3)) 
  {
    r5 = r0 >> 2;
    r1 = (r1 + 2) | 0;
    while (true) {
      r3 = Int64(heapClassInst.heapU8[r1 + (-2)]);
      r4 = Int64(heapClassInst.heapU8[r2]);
      if (r3 == 0) 
      {
        __label__ = 5;
        break 
      }
      else {
        r6 = r4 & 255;
        if (r3 == r6) 
        {
          r3 = Int64(heapClassInst.heapU8[r1 + (-1)]);
          r4 = Int64(heapClassInst.heapU8[r2 + 1]);
          if (r3 == 0) 
          {
            __label__ = 5;
            break 
          }
          else {
            r6 = r4 & 255;
            if (r3 == r6) 
            {
              r3 = Int64(heapClassInst.heapU8[r1]);
              r4 = Int64(heapClassInst.heapU8[r2 + 2]);
              if (r3 == 0) 
              {
                __label__ = 5;
                break 
              }
              else {
                r6 = r4 & 255;
                if (r3 == r6) 
                {
                  r3 = Int64(heapClassInst.heapU8[r1 + 1]);
                  r4 = Int64(heapClassInst.heapU8[r2 + 3]);
                  if (r3 == 0) 
                  {
                    __label__ = 5;
                    break 
                  }
                  else {
                    r6 = r4 & 255;
                    if (r3 == r6) 
                    {
                      r5 = (r5 + (-1)) | 0;
                      r1 = (r1 + 4) | 0;
                      r2 = (r2 + 4) | 0;
                      if (r5 != 0) 
                      {
                        __label__ = 3;
                      }
                      else {
                        __label__ = 13;
                        break 
                      }
                    }
                    else {
                      __label__ = 5;
                      break 
                    }
                  }
                }
                else {
                  __label__ = 5;
                  break 
                }
              }
            }
            else {
              __label__ = 5;
              break 
            }
          }
        }
        else {
          __label__ = 5;
          break 
        }
      }
    }
    match (__label__) {
      case 5 =>
        r1 = r4 & 255;
        r1 = (r3 - r1) | 0;
        commonVariable.r_g0 = r1;
        return;
        // break;
      case 13 =>
        r0 = r0 & 3;
        r1 = (r1 + (-2)) | 0;
      //   break;
      // default:
      //   break;
      case _ =>
          println("break5247")
    }
  }
  else {
    r3 = 0;
    r4 = r3;
  }
  while (true) {
    if (r0 != 0) 
    {
      r3 = Int64(heapClassInst.heapU8[r1]);
      r4 = Int64(heapClassInst.heapU8[r2]);
      if (r3 == 0) 
      {
        __label__ = 16;
        break 
      }
      else {
        r5 = r4 & 255;
        if (r3 == r5) 
        {
          r0 = (r0 + (-1)) | 0;
          r1 = (r1 + 1) | 0;
          r2 = (r2 + 1) | 0;
          continue 
        }
        else {
          __label__ = 16;
          break 
        }
      }
    }
    else {
      __label__ = 19;
      break 
    }
  }
  match (__label__) {
    case 16 =>
      r0 = r4 & 255;
      r0 = (r3 - r0) | 0;
      commonVariable.r_g0 = r0;
      return;
      // break;
    case 19 =>
      r0 = r3 & 255;
      r1 = r4 & 255;
      r0 = (r0 - r1) | 0;
      commonVariable.r_g0 = r0;
      return;
    //   break
    // default:
    //   break;
    case _ =>
      println("break5301")
  }
}

func quicksort(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-40); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(fp + (-4))] = Int32(r0);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heap32[(fp + (-3))] = Int32(r1);
  if (!(r0 <= r1)) 
  {
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap32[(fp + 3)]);
    r2 = 4;
    r3 = Int64(heapClassInst.heap32[(fp + (-4))]);
    r4 = r3 << 2;
    r5 = (r0 + r4) | 0;
    r6 = ( -4);
    r7 = ( -8);
    r2 = (r2 - r0) | 0;
    r3 = (r3 + (-1)) | 0;
    r8 = (r0 + 4) | 0;
    r6 = (r6 - r0) | 0;
    heapClassInst.heap32[(fp + (-1))] = Int32(r6);
    r6 = (r5 + (-4)) | 0;
    heapClassInst.heap32[(fp + (-2))] = Int32(r6);
    r6 = (r7 - r0) | 0;
    r2 = (r2 - r4) | 0;
    heapClassInst.heap32[(fp + (-6))] = Int32(r2);
    while (true) {
      r2 = Int64(heapClassInst.heap32[(fp + (-3))]);
      r4 = (r2 + (-1)) | 0;
      r7 = (r2 + 1) | 0;
      r9 = ( -1);
      r10 = ( -2);
      heapClassInst.heap32[(fp + (-5))] = Int32(r2);
      r2 = Int64(heapClassInst.heap32[(fp + (-4))]);
      r11 = r4;
      while (true) {
        r12 = r4 << 2;
        r13 = (r0 + r12) | 0;
        r14 = (r12 + 4) | 0;
        r15 = Int64(heapClassInst.heap32[(fp + (-1))]);
        r15 = (r15 - r12) | 0;
        r16 = (r8 + r12) | 0;
        r12 = (r6 - r12) | 0;
        while (true) {
          r17 = r12;
          r18 = r16;
          r19 = r15;
          r20 = r14;
          r21 = r4;
          r22 = r13;
          if (r3 == r21) 
          {
            break 
          }
          else {
            r4 = (r0 + r20) | 0;
            heapClassInst.heap32[(g0)] = Int32(r4);
            heapClassInst.heap32[(g0 + 1)] = Int32(r5);
            r13 = (r22 + 4) | 0;
            r4 = (r21 + 1) | 0;
            r14 = (r20 + 4) | 0;
            r15 = (r19 + (-4)) | 0;
            r16 = (r18 + 4) | 0;
            r12 = (r17 + (-4)) | 0;
            __FUNCTION_TABLE__[(r1) >> 2](i7);
            r23 = commonVariable.r_g0;
            if (!(r23 < 0)) 
            {
              break 
            }
          }
        }
        r4 = r2 << 2;
        r12 = (r0 + r4) | 0;
        r13 = 0;
        r14 = (r13 - r12) | 0;
        r4 = (r21 + 1) | 0;
        r15 = (r12 + (-4)) | 0;
        r16 = r14;
        while (true) {
          r23 = r14;
          r24 = r16;
          r25 = r2;
          r2 = (r15 + r13) | 0;
          heapClassInst.heap32[(g0)] = Int32(r5);
          heapClassInst.heap32[(g0 + 1)] = Int32(r2);
          r13 = (r13 + (-4)) | 0;
          r2 = (r25 + (-1)) | 0;
          __FUNCTION_TABLE__[(r1) >> 2](i7);
          r14 = commonVariable.r_g0;
          if (r14 > ( -1)) 
          {
            break 
          }
          else {
            r16 = (r24 + 4) | 0;
            r14 = (r23 + 4) | 0;
            if (!(r7 != r25)) 
            {
              break 
            }
          }
        }
        if (r4 >= r2) 
        {
          break 
        }
        else {
          r17 = 0;
          while (true) {
            r22 = (r17 - r19) | 0;
            r14 = (r17 - r24) | 0;
            r15 = Int64(heapClassInst.heapU8[r22]);
            r14 = Int64(heapClassInst.heapU8[r14 + (-4)]);
            r16 = (r17 + 1) | 0;
            r17 = (r17 - r23) | 0;
            heapClassInst.heap8[r22] = Int8(r14);
            heapClassInst.heap8[r17 + (-4)] = Int8(r15);
            r17 = r16;
            if (!(r16 != 4)) 
            {
              break 
            }
          }
          r17 = (r0 + r20) | 0;
          heapClassInst.heap32[(g0)] = Int32(r17);
          heapClassInst.heap32[(g0 + 1)] = Int32(r5);
          __FUNCTION_TABLE__[(r1) >> 2](i7);
          r17 = commonVariable.r_g0;
          do {
            if (r17 == 0) 
            {
              r17 = r11 << 2;
              r11 = (r11 + 1) | 0;
              r17 = (r8 + r17) | 0;
              r22 = 0;
              while (true) {
                r14 = (r18 - r22) | 0;
                r15 = (r17 - r22) | 0;
                r16 = Int64(heapClassInst.heapU8[r15]);
                r19 = Int64(heapClassInst.heapU8[r14]);
                r22 = (r22 + (-1)) | 0;
                heapClassInst.heap8[r15] = Int8(r19);
                heapClassInst.heap8[r14] = Int8(r16);
                if (!(r22 != ( -4))) 
                {
                  break 
                }
              }
            }
          } while (false);
          r17 = (r12 + r13) | 0;
          heapClassInst.heap32[(g0)] = Int32(r5);
          heapClassInst.heap32[(g0 + 1)] = Int32(r17);
          __FUNCTION_TABLE__[(r1) >> 2](i7);
          r17 = commonVariable.r_g0;
          if (!(r17 != 0)) 
          {
            r4 = (r21 + 1) | 0;
            r17 = 0;
            while (true) {
              r18 = Int64(heapClassInst.heap32[(fp + (-2))]);
              r18 = (r17 + r18) | 0;
              r21 = r10 << 2;
              r18 = (r18 - r21) | 0;
              r21 = (r17 + r12) | 0;
              r21 = Int64(heapClassInst.heapU8[r21 + r13]);
              r22 = Int64(heapClassInst.heapU8[r18 + (-8)]);
              r14 = (r17 + r12) | 0;
              r17 = (r17 + 1) | 0;
              heapClassInst.heap8[r14 + r13] = Int8(r22);
              heapClassInst.heap8[r18 + (-8)] = Int8(r21);
              if (r17 == 4) 
              {
                break 
              }
            }
            r10 = (r10 + 1) | 0;
            r9 = (r9 + 1) | 0;
          }
        }
      }
      r2 = Int64(heapClassInst.heap32[(fp + (-4))]);
      r2 = (r2 - r10) | 0;
      r4 = 0;
      r2 = (r2 + (-2)) | 0;
      r7 = (r4 - r22) | 0;
      while (true) {
        r12 = (r5 - r4) | 0;
        r13 = (r18 - r4) | 0;
        r14 = Int64(heapClassInst.heapU8[r13]);
        r15 = Int64(heapClassInst.heapU8[r12]);
        r4 = (r4 + (-1)) | 0;
        heapClassInst.heap8[r13] = Int8(r15);
        heapClassInst.heap8[r12] = Int8(r14);
        if (!(r4 != ( -4))) 
        {
          break 
        }
      }
      r4 = (r21 + 2) | 0;
      r12 = Int64(heapClassInst.heap32[(fp + (-3))]);
      if (r12 < r11) 
      {
        r13 = r12 << 2;
        r14 = 0;
        r13 = (r0 + r13) | 0;
        r13 = (r14 - r13) | 0;
        r12 = (r11 - r12) | 0;
        while (true) {
          r15 = r14;
          while (true) {
            r16 = (r15 - r7) | 0;
            r18 = (r15 - r13) | 0;
            r19 = Int64(heapClassInst.heapU8[r18]);
            r20 = Int64(heapClassInst.heapU8[r16]);
            r15 = (r15 + 1) | 0;
            heapClassInst.heap8[r18] = Int8(r20);
            heapClassInst.heap8[r16] = Int8(r19);
            if (!(r15 != 4)) 
            {
              break 
            }
          }
          r12 = (r12 + (-1)) | 0;
          r13 = (r13 + (-4)) | 0;
          r7 = (r7 + 4) | 0;
          if (!(r12 != 0)) 
          {
            break 
          }
        }
        r7 = Int64(heapClassInst.heap32[(fp + (-3))]);
        r7 = (r7 - r11) | 0;
        r7 = (r7 + r21) | 0;
      }
      else {
        r7 = r21;
      }
      if (r3 > r2) 
      {
        r2 = Int64(heapClassInst.heap32[(fp + (-6))]);
        while (true) {
          r4 = 0;
          while (true) {
            r11 = (r4 - r2) | 0;
            r12 = (r4 - r17) | 0;
            r13 = Int64(heapClassInst.heapU8[r12]);
            r14 = Int64(heapClassInst.heapU8[r11]);
            r4 = (r4 + 1) | 0;
            heapClassInst.heap8[r12] = Int8(r14);
            heapClassInst.heap8[r11] = Int8(r13);
            if (!(r4 != 4)) 
            {
              break 
            }
          }
          r9 = (r9 + (-1)) | 0;
          r17 = (r17 + (-4)) | 0;
          r2 = (r2 + 4) | 0;
          if (!(r9 != 0)) 
          {
            break 
          }
        }
        r2 = (r10 + r21) | 0;
        r2 = (r2 + 3) | 0;
        heapClassInst.heap32[(fp + (-3))] = Int32(r2);
      }
      else {
        heapClassInst.heap32[(fp + (-3))] = Int32(r4);
      }
      heapClassInst.heap32[(g0)] = Int32(r0);
      r2 = Int64(heapClassInst.heap32[(fp + (-5))]);
      heapClassInst.heap32[(g0 + 1)] = Int32(r2);
      heapClassInst.heap32[(g0 + 2)] = Int32(r7);
      heapClassInst.heap32[(g0 + 3)] = Int32(r1);
      quicksort(i7);
      r4 = Int64(heapClassInst.heap32[(fp + (-3))]);
      r2 = Int64(heapClassInst.heap32[(fp + (-4))]);
      if (r4 < r2) 
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

func sgetc(sp: Int64) : Unit
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
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0)]);
  r2 = Int64(heapClassInst.heapU8[r1]);
  r1 = (r1 + 1) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  if (r2 == 0) 
  {
    r0 = ( -1);
    commonVariable.r_g0 = r0;
    return;
  }
  else {
    commonVariable.r_g0 = r2;
    return;
  }
}

func sputc(sp: Int64) : Unit
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
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0)]);
  r2 = (r1 + (-1)) | 0;
  heapClassInst.heap32[(r0)] = Int32(r2);
  r0 = Int64(heapClassInst.heapU8[r1 + (-1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r2 = ( -1);
  r0 = if (r0 == r1) {r1} else {r2};
  commonVariable.r_g0 = r0;
  return;
}

func __sync_fetch_and_add_4(sp: Int64) : Unit
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
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = Int64(heapClassInst.heap32[(r0)]);
  r1 = (r2 + r1) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  commonVariable.r_g0 = r2;
  return;
}

func __muldi3(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  r3 = Int64(heapClassInst.heap32[(fp + 3)]);
  if (r0 < 0) 
  {
    r5 = 0;
    r4 = 1;
    r0 = (r5 - r0) | 0;
    r6 = if (r1 != 0) {r4} else {r5};
    r1 = (r5 - r1) | 0;
    r0 = (r0 - r6) | 0;
  }
  else {
    r4 = 0;
  }
  if (r3 < 0) 
  {
    r5 = 0;
    r6 = 1;
    r3 = (r5 - r3) | 0;
    r6 = if (r2 != 0) {r6} else {r5};
    r4 = r4 ^ 1;
    r2 = (r5 - r2) | 0;
    r3 = (r3 - r6) | 0;
  }
  r5 = r2 & 65535;
  r6 = r1 & 65535;
  r7 = r3 | r0;
  r8 = (r5 * r6) | 0;
  r9 = r2 | r1;
  r9 = r9 >> 16;
  if (r9 != 0) 
  {
    r9 = r1 >> 16;
    r10 = r2 >> 16;
    r11 = (r10 - r5) | 0;
    r12 = (r5 - r10) | 0;
    r13 = (r6 - r9) | 0;
    r14 = (r9 - r6) | 0;
    r15 = (r10 * r9) | 0;
    r11 = if (`UIntNative`(r5) < `UIntNative`(r10)) {r11} else {r12};
    r12 = if (`UIntNative`(r9) < `UIntNative`(r6)) {r13} else {r14};
    r11 = (r11 * r12) | 0;
    r12 = r15 >> 16;
    r12 = (r12 + r15) | 0;
    r13 = r15 << 16;
    r14 = r11 << 16;
    r6 = if (`UIntNative`(r9) < `UIntNative`(r6)) {1} else {0};
    r5 = if (`UIntNative`(r5) < `UIntNative`(r10)) {1} else {0};
    r5 = r6 ^ r5;
    r5 = r5 & 1;
    if (r5 == 0) 
    {
      r5 = (r14 + r13) | 0;
      r6 = if (`UIntNative`(r5) < `UIntNative`(r13)) {1} else {0};
      r11 = r11 >> 16;
      r11 = (r11 + r12) | 0;
      r6 = r6 & 1;
      r11 = (r11 + r6) | 0;
    }
    else {
      r5 = (r13 - r14) | 0;
      r11 = r11 >> 16;
      r14 = ( -1);
      r6 = 0;
      r11 = (r12 - r11) | 0;
      r12 = if (`UIntNative`(r5) > `UIntNative`(r13)) {r14} else {r6};
      r11 = (r11 + r12) | 0;
    }
    r6 = r8 << 16;
    r6 = (r5 + r6) | 0;
    r9 = (r6 + r8) | 0;
    r5 = if (`UIntNative`(r6) < `UIntNative`(r5)) {1} else {0};
    r6 = r8 >> 16;
    r8 = if (`UIntNative`(r9) < `UIntNative`(r8)) {1} else {0};
    r6 = (r11 + r6) | 0;
    r5 = r5 & 1;
    r5 = (r6 + r5) | 0;
    r8 = r8 & 1;
    r5 = (r5 + r8) | 0;
    r8 = r9;
  }
  else {
    r5 = 0;
  }
  if (r7 != 0) 
  {
    r6 = (r3 - r2) | 0;
    r7 = (r2 - r3) | 0;
    r9 = (r1 - r0) | 0;
    r10 = (r0 - r1) | 0;
    r6 = if (`UIntNative`(r2) < `UIntNative`(r3)) {r6} else {r7};
    r7 = if (`UIntNative`(r0) < `UIntNative`(r1)) {r9} else {r10};
    r1 = if (`UIntNative`(r0) < `UIntNative`(r1)) {1} else {0};
    r2 = if (`UIntNative`(r2) < `UIntNative`(r3)) {1} else {0};
    r9 = 0;
    r6 = (r6 * r7) | 0;
    r1 = r1 ^ r2;
    r2 = (r9 - r6) | 0;
    r1 = if (r1 != 0) {r2} else {r6};
    r0 = (r3 * r0) | 0;
    r0 = (r1 + r0) | 0;
    r0 = (r0 + r8) | 0;
    r5 = (r0 + r5) | 0;
  }
  r0 = 0;
  r1 = 1;
  r2 = (r0 - r5) | 0;
  r1 = if (r8 != 0) {r1} else {r0};
  r0 = (r0 - r8) | 0;
  r1 = (r2 - r1) | 0;
  r0 = if (r4 == 0) {r8} else {r0};
  r1 = if (r4 == 0) {r5} else {r1};
  commonVariable.r_g0 = r0;
  commonVariable.r_g1 = r1;
  return;
}

func __fixdfdi(sp: Int64) : Unit
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
  r0 = sp + 0;
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r1 = r0 >> 20;
  r1 = r1 & 2047;
  r2 = (r1 + (-1023)) | 0;
  if (r2 < 0) 
  {
    r0 = 0;
    commonVariable.r_g0 = r0;
    commonVariable.r_g1 = r0;
    return;
  }
  else {
    r3 = Int64(heapClassInst.heap32[(fp)]);
    r4 = r0 & 1048575;
    r0 = r0 >> 31;
    r4 = r4 | 1048576;
    if (r2 < 53) 
    {
      r2 = 1075;
      r1 = (r2 - r1) | 0;
      heapClassInst.heap32[(g0)] = Int32(r3);
      heapClassInst.heap32[(g0 + 1)] = Int32(r4);
      heapClassInst.heap32[(g0 + 2)] = Int32(r1);
      __lshrdi3(i7);
      r1 = commonVariable.r_g0;
      r3 = commonVariable.r_g1;
    }
    else {
      r1 = (r1 + (-1075)) | 0;
      heapClassInst.heap32[(g0)] = Int32(r3);
      heapClassInst.heap32[(g0 + 1)] = Int32(r4);
      heapClassInst.heap32[(g0 + 2)] = Int32(r1);
      __ashldi3(i7);
      r1 = commonVariable.r_g0;
      r3 = commonVariable.r_g1;
    }
    r2 = r3 ^ r0;
    r1 = r1 ^ r0;
    r3 = 1;
    r4 = 0;
    r2 = (r2 - r0) | 0;
    r3 = if (`UIntNative`(r1) < `UIntNative`(r0)) {r3} else {r4};
    r0 = (r1 - r0) | 0;
    r1 = (r2 - r3) | 0;
    commonVariable.r_g0 = r0;
    commonVariable.r_g1 = r1;
    return;
  }
}

func __floatdidf(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var f0: Float64 = 0.0
  var f1: Float64 = 0.0
  var f2: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  f0 = Float64(r0); 
  f1 = 4294967296.0;
  f2 = Float64(`UIntNative`(r1)); 
  f0 = f0 * f1;
  f0 = f2 + f0;
  commonVariable.f_g0 = f0;
  return;
}

func __lshrdi3(sp: Int64) : Unit
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
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = r0 & 32;
  if (r2 == 0) 
  {
    r2 = Int64(heapClassInst.heap32[(fp)]);
    if (!(r0 == 0)) 
    {
      r3 = 32;
      r3 = (r3 - r0) | 0;
      r3 = r1 << r3;
      r2 = r2 >> r0;
      r2 = r3 | r2;
      r1 = r1 >> r0;
    }
    commonVariable.r_g0 = r2;
    commonVariable.r_g1 = r1;
    return;
  }
  else {
    r0 = (r0 + (-32)) | 0;
    r0 = r1 >> r0;
    r1 = 0;
    commonVariable.r_g0 = r0;
    commonVariable.r_g1 = r1;
    return;
  }
}

func __fixsfdi(sp: Int64) : Unit
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
  r1 = r0 >> 23;
  r1 = r1 & 255;
  r2 = (r1 + (-127)) | 0;
  if (r2 < 0) 
  {
    r0 = 0;
    commonVariable.r_g0 = r0;
    commonVariable.r_g1 = r0;
    return;
  }
  else {
    r3 = r0 & 8388607;
    r0 = r0 >> 31;
    r3 = r3 | 8388608;
    r4 = 0;
    if (r2 < 24) 
    {
      r2 = 150;
      r1 = (r2 - r1) | 0;
      heapClassInst.heap32[(g0)] = Int32(r3);
      heapClassInst.heap32[(g0 + 1)] = Int32(r4);
      heapClassInst.heap32[(g0 + 2)] = Int32(r1);
      __lshrdi3(i7);
      r1 = commonVariable.r_g0;
      r3 = commonVariable.r_g1;
    }
    else {
      r1 = (r1 + (-150)) | 0;
      heapClassInst.heap32[(g0)] = Int32(r3);
      heapClassInst.heap32[(g0 + 1)] = Int32(r4);
      heapClassInst.heap32[(g0 + 2)] = Int32(r1);
      __ashldi3(i7);
      r1 = commonVariable.r_g0;
      r3 = commonVariable.r_g1;
    }
    r2 = r3 ^ r0;
    r1 = r1 ^ r0;
    r3 = 1;
    r2 = (r2 - r0) | 0;
    r3 = if (`UIntNative`(r1) < `UIntNative`(r0)) {r3} else {r4};
    r0 = (r1 - r0) | 0;
    r1 = (r2 - r3) | 0;
    commonVariable.r_g0 = r0;
    commonVariable.r_g1 = r1;
    return;
  }
}

func __ashldi3(sp: Int64) : Unit
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
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r2 = r0 & 32;
  if (r2 == 0) 
  {
    r2 = Int64(heapClassInst.heap32[(fp + 1)]);
    if (!(r0 == 0)) 
    {
      r3 = 32;
      r3 = (r3 - r0) | 0;
      r2 = r2 << r0;
      r3 = r1 >> r3;
      r1 = r1 << r0;
      r2 = r2 | r3;
    }
    commonVariable.r_g0 = r1;
    commonVariable.r_g1 = r2;
    return;
  }
  else {
    r0 = (r0 + (-32)) | 0;
    r2 = 0;
    r0 = r1 << r0;
    commonVariable.r_g0 = r2;
    commonVariable.r_g1 = r0;
    return;
  }
}

func __ashrdi3(sp: Int64) : Unit
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
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = r0 & 32;
  if (r2 == 0) 
  {
    r2 = Int64(heapClassInst.heap32[(fp)]);
    if (!(r0 == 0)) 
    {
      r3 = 32;
      r3 = (r3 - r0) | 0;
      r3 = r1 << r3;
      r2 = r2 >> r0;
      r2 = r3 | r2;
      r1 = r1 >> r0;
    }
    commonVariable.r_g0 = r2;
    commonVariable.r_g1 = r1;
    return;
  }
  else {
    r0 = (r0 + (-32)) | 0;
    r0 = r1 >> r0;
    r1 = r1 >> 31;
    commonVariable.r_g0 = r0;
    commonVariable.r_g1 = r1;
    return;
  }
}

func __fixunsdfdi(sp: Int64) : Unit
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
  r0 = sp + 0;
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r1 = r0 >> 20;
  r1 = r1 & 2047;
  r2 = (r1 + (-1023)) | 0;
  if (!(r2 < 0)) 
  {
    if (!(r0 < 0)) 
    {
      r3 = Int64(heapClassInst.heap32[(fp)]);
      r0 = r0 & 1048575;
      r0 = r0 | 1048576;
      if (r2 < 53) 
      {
        r2 = 1075;
        r1 = (r2 - r1) | 0;
        heapClassInst.heap32[(g0)] = Int32(r3);
        heapClassInst.heap32[(g0 + 1)] = Int32(r0);
        heapClassInst.heap32[(g0 + 2)] = Int32(r1);
        __lshrdi3(i7);
        return;
      }
      else {
        r1 = (r1 + (-1075)) | 0;
        heapClassInst.heap32[(g0)] = Int32(r3);
        heapClassInst.heap32[(g0 + 1)] = Int32(r0);
        heapClassInst.heap32[(g0 + 2)] = Int32(r1);
        __ashldi3(i7);
        return;
      }
    }
  }
  r0 = 0;
  commonVariable.r_g0 = r0;
  commonVariable.r_g1 = r0;
  return;
}

func __fixunssfdi(sp: Int64) : Unit
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
  r1 = r0 >> 23;
  r1 = r1 & 255;
  r2 = (r1 + (-127)) | 0;
  if (!(r2 < 0)) 
  {
    if (!(r0 < 0)) 
    {
      r0 = r0 & 8388607;
      r0 = r0 | 8388608;
      r3 = 0;
      if (r2 < 24) 
      {
        r2 = 150;
        r1 = (r2 - r1) | 0;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r3);
        heapClassInst.heap32[(g0 + 2)] = Int32(r1);
        __lshrdi3(i7);
        return;
      }
      else {
        r1 = (r1 + (-150)) | 0;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r3);
        heapClassInst.heap32[(g0 + 2)] = Int32(r1);
        __ashldi3(i7);
        return;
      }
    }
  }
  r0 = 0;
  commonVariable.r_g0 = r0;
  commonVariable.r_g1 = r0;
  return;
}

func _ZNK14CFileInterface12IsFileSystemEv(sp: Int64) : Unit
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

func _ZN11CFileStdout5freadEPvjj(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = ( -1);
  commonVariable.r_g0 = r0;
  return;
}

func _ZN11CFileStdout5ftellEv(sp: Int64) : Unit
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

func _ZN11CFileStdout4feofEv(sp: Int64) : Unit
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

func _ZN11CFileStdout5fseekEli(sp: Int64) : Unit
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

func _ZN11CFileStdout6ungetcEi(sp: Int64) : Unit
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

func _ZN11CFileStdout6fflushEv(sp: Int64) : Unit
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

func _ZN11CFileStdout6fcloseEv(sp: Int64) : Unit
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

func _ZNK11CFileSystem12IsFileSystemEv(sp: Int64) : Unit
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

func _ZN11CFileSystem5freadEPvjj(sp: Int64) : Unit
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
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  r3 = Int64(heapClassInst.heap32[(fp + 3)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  heapClassInst.heap32[(g0 + 2)] = Int32(r3);
  heapClassInst.heap32[(g0 + 3)] = Int32(r0);
  mandreel_fread(i7);
  return;
}

func _ZN11CFileSystem6fwriteEPKvjj(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = ( -1);
  commonVariable.r_g0 = r0;
  return;
}

func _ZN11CFileSystem6fflushEv(sp: Int64) : Unit
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

func _ZN11CFileSystem6fcloseEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  mandreel_fclose(i7);
  return;
}

func _ZN11CFileSystem5ftellEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  mandreel_ftell(i7);
  return;
}

func _ZN11CFileSystem4feofEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  mandreel_feof(i7);
  return;
}

func _ZN11CFileSystem5fseekEli(sp: Int64) : Unit
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
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  heapClassInst.heap32[(g0 + 2)] = Int32(r2);
  mandreel_fseek(i7);
  return;
}

func _ZN11CFileSystem6ungetcEi(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  mandreel_ungetc(i7);
  return;
}

func _ZN7CFileLS5freadEPvjj(sp: Int64) : Unit
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
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  r2 = Int64(heapClassInst.heap32[(fp + 3)]);
  r3 = Int64(heapClassInst.heap32[(r0 + 4)]);
  r4 = Int64(heapClassInst.heap32[(r0 + 2)]);
  r2 = (r2 * r1) | 0;
  r5 = (r3 + r2) | 0;
  r6 = (r4 - r3) | 0;
  r2 = if (r5 > r4) {r6} else {r2};
  if (r2 < 0) 
  {
    r0 = ( -1);
    commonVariable.r_g0 = r0;
    return;
  }
  else {
    r4 = Int64(heapClassInst.heap32[(fp + 1)]);
    r5 = Int64(heapClassInst.heap32[(r0 + 6)]);
    r3 = (r5 + r3) | 0;
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    heapClassInst.heap32[(g0 + 2)] = Int32(r2);
    memcpy(i7);
    r3 = Int64(heapClassInst.heap32[(r0 + 4)]);
    r3 = (r3 + r2) | 0;
    heapClassInst.heap32[(r0 + 4)] = Int32(r3);
    r0 = Int64(floor(Float64(r2) / Float64(r1)));
    commonVariable.r_g0 = r0;
    return;
  }
}

func _ZN7CFileLS5ftellEv(sp: Int64) : Unit
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

func _ZN7CFileLS4feofEv(sp: Int64) : Unit
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
  r1 = Int64(heapClassInst.heap32[(r0 + 4)]);
  r0 = Int64(heapClassInst.heap32[(r0 + 2)]);
  r0 = if (r1 >= r0) {1} else {0};
  r0 = r0 & 1;
  commonVariable.r_g0 = r0;
  return;
}

func _ZN7CFileLS5fseekEli(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  do {
    if (r0 == 0) 
    {
      r1 = r1 >> 2;
    }
    else {
      if (r0 == 1) 
      {
        r0 = r1 >> 2;
        r1 = Int64(heapClassInst.heap32[(r0 + 4)]);
        r1 = (r1 + r2) | 0;
        heapClassInst.heap32[(r0 + 4)] = Int32(r1);
      }
      else {
        if (!(r0 != 2)) 
        {
          r1 = r1 >> 2;
          r0 = Int64(heapClassInst.heap32[(r1 + 2)]);
          r2 = (r0 + r2) | 0;
          break 
        }
      }
      r0 = 0;
      commonVariable.r_g0 = r0;
      return;
    }
  } while (false);
  heapClassInst.heap32[(r1 + 4)] = Int32(r2);
  r1 = 0;
  commonVariable.r_g0 = r1;
  return;
}

func _ZN7CFileLS6ungetcEi(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = ( -1);
  commonVariable.r_g0 = r0;
  return;
}

func _ZN10CFileCloud5freadEPvjj(sp: Int64) : Unit
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
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  r2 = Int64(heapClassInst.heap32[(fp + 3)]);
  r3 = Int64(heapClassInst.heap32[(r0 + 4)]);
  r4 = Int64(heapClassInst.heap32[(r0 + 2)]);
  r2 = (r2 * r1) | 0;
  r5 = (r3 + r2) | 0;
  r6 = (r4 - r3) | 0;
  r2 = if (r5 > r4) {r6} else {r2};
  if (r2 < 0) 
  {
    r0 = ( -1);
    commonVariable.r_g0 = r0;
    return;
  }
  else {
    r4 = Int64(heapClassInst.heap32[(fp + 1)]);
    r5 = Int64(heapClassInst.heap32[(r0 + 6)]);
    r3 = (r5 + r3) | 0;
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    heapClassInst.heap32[(g0 + 2)] = Int32(r2);
    memcpy(i7);
    r3 = Int64(heapClassInst.heap32[(r0 + 4)]);
    r3 = (r3 + r2) | 0;
    heapClassInst.heap32[(r0 + 4)] = Int32(r3);
    r0 = Int64(floor(Float64(r2) / Float64(r1)));
    commonVariable.r_g0 = r0;
    return;
  }
}

func _ZN10CFileCloud5ftellEv(sp: Int64) : Unit
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

func _ZN10CFileCloud4feofEv(sp: Int64) : Unit
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
  r1 = Int64(heapClassInst.heap32[(r0 + 4)]);
  r0 = Int64(heapClassInst.heap32[(r0 + 2)]);
  r0 = if (r1 >= r0) {1} else {0};
  r0 = r0 & 1;
  commonVariable.r_g0 = r0;
  return;
}

func _ZN10CFileCloud5fseekEli(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  do {
    if (r0 == 0) 
    {
      r1 = r1 >> 2;
    }
    else {
      if (r0 == 1) 
      {
        r0 = r1 >> 2;
        r1 = Int64(heapClassInst.heap32[(r0 + 4)]);
        r1 = (r1 + r2) | 0;
        heapClassInst.heap32[(r0 + 4)] = Int32(r1);
      }
      else {
        if (!(r0 != 2)) 
        {
          r1 = r1 >> 2;
          r0 = Int64(heapClassInst.heap32[(r1 + 2)]);
          r2 = (r0 + r2) | 0;
          break 
        }
      }
      r0 = 0;
      commonVariable.r_g0 = r0;
      return;
    }
  } while (false);
  heapClassInst.heap32[(r1 + 4)] = Int32(r2);
  r1 = 0;
  commonVariable.r_g0 = r1;
  return;
}

func _ZN10CFileCloud6ungetcEi(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = ( -1);
  commonVariable.r_g0 = r0;
  return;
}

func _ZN7CFileLS6fwriteEPKvjj(sp: Int64) : Unit
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
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(fp + 3)]);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = (r1 * r2) | 0;
  r4 = Int64(heapClassInst.heap32[(r0 + 4)]);
  r5 = (r4 + r2) | 0;
  r6 = Int64(heapClassInst.heap32[(r0 + 3)]);
  if (r5 > r6) 
  {
    r4 = (r2 + r4) | 0;
    r4 = (r4 + 131072) | 0;
    heapClassInst.heap32[(r0 + 3)] = Int32(r4);
    r5 = Int64(heapClassInst.heap32[(r0 + 6)]);
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0 + 1)] = Int32(r4);
    realloc(i7);
    r5 = commonVariable.r_g0;
    heapClassInst.heap32[(r0 + 6)] = Int32(r5);
    r4 = Int64(heapClassInst.heap32[(r0 + 4)]);
  }
  else {
    r5 = Int64(heapClassInst.heap32[(r0 + 6)]);
  }
  r4 = (r5 + r4) | 0;
  heapClassInst.heap32[(g0)] = Int32(r4);
  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
  heapClassInst.heap32[(g0 + 2)] = Int32(r2);
  memcpy(i7);
  r3 = Int64(heapClassInst.heap32[(r0 + 4)]);
  r2 = (r3 + r2) | 0;
  heapClassInst.heap32[(r0 + 4)] = Int32(r2);
  r3 = Int64(heapClassInst.heap32[(r0 + 5)]);
  if (!(r2 <= r3)) 
  {
    heapClassInst.heap32[(r0 + 5)] = Int32(r2);
  }
  commonVariable.r_g0 = r1;
  return;
}

func _ZN7CFileLS6fflushEv(sp: Int64) : Unit
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
  r1 = Int64(heapClassInst.heapU8[r0 + 5]);
  if (!(r1 == 0)) 
  {
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1 + 5)]);
    r1 = Int64(heapClassInst.heap32[(r1 + 6)]);
    r0 = (r0 + 28) | 0;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = Int32(r2);
    mandreel_writels(i7);
  }
  r0 = 0;
  commonVariable.r_g0 = r0;
  return;
}

func _ZN7CFileLS6fcloseEv(sp: Int64) : Unit
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
  r1 = Int64(heapClassInst.heapU8[r0 + 5]);
  if (!(r1 == 0)) 
  {
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1 + 5)]);
    r1 = Int64(heapClassInst.heap32[(r1 + 6)]);
    r3 = (r0 + 28) | 0;
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = Int32(r2);
    mandreel_writels(i7);
  }
  r1 = 0;
  r2 = r0 >> 2;
  heapClassInst.heap8[r0 + 4] = Int8(r1);
  r0 = Int64(heapClassInst.heap32[(r2 + 6)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  free(i7);
  commonVariable.r_g0 = r1;
  return;
}

func _ZN10CFileCloud6fwriteEPKvjj(sp: Int64) : Unit
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
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(fp + 3)]);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = (r1 * r2) | 0;
  r4 = Int64(heapClassInst.heap32[(r0 + 4)]);
  r5 = (r4 + r2) | 0;
  r6 = Int64(heapClassInst.heap32[(r0 + 3)]);
  if (r5 > r6) 
  {
    r4 = (r2 + r4) | 0;
    r4 = (r4 + 131072) | 0;
    heapClassInst.heap32[(r0 + 3)] = Int32(r4);
    r5 = Int64(heapClassInst.heap32[(r0 + 6)]);
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0 + 1)] = Int32(r4);
    realloc(i7);
    r5 = commonVariable.r_g0;
    heapClassInst.heap32[(r0 + 6)] = Int32(r5);
    r4 = Int64(heapClassInst.heap32[(r0 + 4)]);
  }
  else {
    r5 = Int64(heapClassInst.heap32[(r0 + 6)]);
  }
  r4 = (r5 + r4) | 0;
  heapClassInst.heap32[(g0)] = Int32(r4);
  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
  heapClassInst.heap32[(g0 + 2)] = Int32(r2);
  memcpy(i7);
  r3 = Int64(heapClassInst.heap32[(r0 + 4)]);
  r2 = (r3 + r2) | 0;
  heapClassInst.heap32[(r0 + 4)] = Int32(r2);
  r3 = Int64(heapClassInst.heap32[(r0 + 5)]);
  if (!(r2 <= r3)) 
  {
    heapClassInst.heap32[(r0 + 5)] = Int32(r2);
  }
  commonVariable.r_g0 = r1;
  return;
}

func _ZN10CFileCloud6fflushEv(sp: Int64) : Unit
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
  i7 = sp + (-32); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heapU8[r0 + 5]);
  if (!(r1 == 0)) 
  {
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1 + 5)]);
    r3 = r2 << 1;
    heapClassInst.heap32[(g0)] = Int32(r3);
    mallocNew(i7);
    r4 = commonVariable.r_g0;
    r1 = Int64(heapClassInst.heap32[(r1 + 6)]);
    r5 = sp + (-4);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
    heapClassInst.heap32[(g0 + 2)] = Int32(r4);
    heapClassInst.heap32[(g0 + 3)] = Int32(r3);
    heapClassInst.heap32[(g0 + 4)] = Int32(r5);
    _ZN12mandreel_b64L11b64_encode_EPKhjPcjjPNS_6B64_RCE(i7);
    r0 = (r0 + 28) | 0;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r4);
    heapClassInst.heap32[(g0 + 2)] = Int32(commonVariable.r_g0);
    mandreel_writecloud(i7);
    heapClassInst.heap32[(g0)] = Int32(r4);
    free(i7);
  }
  r0 = 0;
  commonVariable.r_g0 = r0;
  return;
}

func _ZN10CFileCloud6fcloseEv(sp: Int64) : Unit
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
  i7 = sp + (-32); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heapU8[r0 + 5]);
  if (!(r1 == 0)) 
  {
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1 + 5)]);
    r3 = r2 << 1;
    heapClassInst.heap32[(g0)] = Int32(r3);
    mallocNew(i7);
    r4 = commonVariable.r_g0;
    r1 = Int64(heapClassInst.heap32[(r1 + 6)]);
    r5 = sp + (-4);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
    heapClassInst.heap32[(g0 + 2)] = Int32(r4);
    heapClassInst.heap32[(g0 + 3)] = Int32(r3);
    heapClassInst.heap32[(g0 + 4)] = Int32(r5);
    _ZN12mandreel_b64L11b64_encode_EPKhjPcjjPNS_6B64_RCE(i7);
    r2 = (r0 + 28) | 0;
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0 + 1)] = Int32(r4);
    heapClassInst.heap32[(g0 + 2)] = Int32(commonVariable.r_g0);
    mandreel_writecloud(i7);
    heapClassInst.heap32[(g0)] = Int32(r4);
    free(i7);
  }
  r1 = 0;
  r2 = r0 >> 2;
  heapClassInst.heap8[r0 + 4] = Int8(r1);
  r0 = Int64(heapClassInst.heap32[(r2 + 6)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  free(i7);
  commonVariable.r_g0 = r1;
  return;
}

func __sync_val_compare_and_swap_4(sp: Int64) : Unit
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
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0)]);
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  if (!(r1 != r2)) 
  {
    r2 = Int64(heapClassInst.heap32[(fp + 2)]);
    heapClassInst.heap32[(r0)] = Int32(r2);
  }
  commonVariable.r_g0 = r1;
  return;
}

func _ZN11CFileStdout6fwriteEPKvjj(sp: Int64) : Unit
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
  i7 = sp + (-16392); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = Int64(heapClassInst.heap32[(fp + 3)]);
  r0 = (r1 * r0) | 0;
  if (r0 != 0) 
  {
    r2 = Int64(heapClassInst.heap32[(fp + 1)]);
    r3 = sp + (-16384);
    r4 = r0;
    while (true) {
      r5 = Int64(heapClassInst.heapU8[r2]);
      r4 = (r4 + (-1)) | 0;
      r2 = (r2 + 1) | 0;
      r6 = (r3 + 1) | 0;
      heapClassInst.heap8[r3] = Int8(r5);
      r3 = r6;
      if (!(r4 != 0)) 
      {
        break 
      }
    }
    r2 = sp + (-16384);
    r0 = (r2 + r0) | 0;
  }
  else {
    r0 = sp + (-16384);
  }
  r2 = 0;
  heapClassInst.heap8[r0] = Int8(r2);
  r0 = sp + (-16384);
  heapClassInst.heap32[(g0)] = Int32(r0);
  puts(i7);
  commonVariable.r_g0 = r1;
  return;
}

func fopen(sp: Int64) : Unit
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
  i7 = sp + (-2064);
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heapU8[r0]);
  r2 = 46;
  r3 = 92;
  r4 = Int64(heapClassInst.heapU8[r0 + 1]);
  r5 = 47;
  r1 = if (r1 == r2) {1} else {0};
  r2 = if (r4 == r3) {1} else {0};
  r1 = r1 & r2;
  r2 = if (r4 == r5) {1} else {0};
  r1 = r1 | r2;
  r2 = (r0 + 1) | 0;
  r1 = if (r1 != 0) {r2} else {r0};
  r2 = Int64(heapClassInst.heapU8[r1]);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  do {
    if (r2 != 0) 
    {
      r4 = sp + (-2048);
      r1 = (r1 + 1) | 0;
      r6 = 0;
      r8 = 26;
      while (true) {
        r7 = r2 & 255;
        if (r7 == 47) 
        {
          __label__ = 5;
        }
        else {
          if (r7 != 92) 
          {
            r6 = r2 << 24;
            r6 = r6 >> 24;
            r7 = (r6 + (-65)) | 0;
            r9 = (r2 + 32) | 0;
            r10 = (r4 + 1) | 0;
            r6 = 0;
            r2 = if (`UIntNative`(r7) < `UIntNative`(r8)) {r9} else {r2};
            heapClassInst.heap8[r4] = Int8(r2);
            r4 = r10;
            __label__ = 9;
          }
          else {
            __label__ = 5;
          }
        }
        if (__label__ == 5) {
          r2 = r6 & 255;
          heapClassInst.heap8[r4] = Int8(r5);
          if (r2 == 0) 
          {
            r4 = (r4 + 1) | 0;
            r6 = 1;
          }
          else {
            r6 = 1;
          }
        }
        r2 = Int64(heapClassInst.heapU8[r1]);
        if (r2 != 0) 
        {
          r1 = (r1 + 1) | 0;
          continue 
        }
        else {
          break 
        }
      }
    }
    else {
      r4 = sp + (-2048);
    }
  } while (false);
  r1 = 0;
  heapClassInst.heap8[r4] = Int8(r1);
  r2 = sp + (-2048);
  r4 = _E2_str33679;
  heapClassInst.heap32[(g0)] = Int32(r2);
  heapClassInst.heap32[(g0 + 1)] = Int32(r4);
  heapClassInst.heap32[(g0 + 2)] = 4;
  strncmp(i7);
  r4 = commonVariable.r_g0;
  do {
    if (r4 != 0) 
    {
      r4 = _E2_str34680;
      heapClassInst.heap32[(g0)] = Int32(r2);
      heapClassInst.heap32[(g0 + 1)] = Int32(r4);
      heapClassInst.heap32[(g0 + 2)] = 4;
      strncmp(i7);
      r4 = commonVariable.r_g0;
      if (r4 == 0) 
      {
        heapClassInst.heap32[(g0)] = 0;
        _Z30mandreel_fopen_enable_checkfatb(i7);
        r0 = _E2_str31677;
        heapClassInst.heap32[(g0)] = Int32(r3);
        heapClassInst.heap32[(g0 + 1)] = Int32(r0);
        strcmp(i7);
        r0 = commonVariable.r_g0;
        do {
          if (r0 != 0) 
          {
            r0 = _E2_str4651;
            heapClassInst.heap32[(g0)] = Int32(r3);
            heapClassInst.heap32[(g0 + 1)] = Int32(r0);
            strcmp(i7);
            r0 = commonVariable.r_g0;
            if (r0 == 0) 
            {
              __label__ = 30;
            }
            else {
              r0 = _E2_str5652;
              heapClassInst.heap32[(g0)] = Int32(r3);
              heapClassInst.heap32[(g0 + 1)] = Int32(r0);
              strcmp(i7);
              r0 = commonVariable.r_g0;
              if (r0 != 0) 
              {
                r0 = _E2_str32678;
                heapClassInst.heap32[(g0)] = Int32(r3);
                heapClassInst.heap32[(g0 + 1)] = Int32(r0);
                strcmp(i7);
                r0 = commonVariable.r_g0;
                if (!(r0 == 0)) 
                {
                  r4 = Int64(heapClassInst.heapU8[r3]);
                  r0 = 119;
                  r3 = 114;
                  r0 = if (r4 == r0) {1} else {0};
                  r5 = if (r4 == r3) {1} else {0};
                  r3 = r0 & 1;
                  r0 = r5 & 1;
                  if (r4 == 114) 
                  {
                    __label__ = 36;
                    break 
                  }
                  else {
                    __label__ = 38;
                    break 
                  }
                }
              }
              r0 = 1;
              r1 = 0;
              r3 = r0;
              __label__ = 38;
            }
          }
          else {
            __label__ = 30;
          }
        } while (false);
        if (__label__ == 30) {
          r0 = 1;
          r3 = r0;
          __label__ = 36;
        }
        if (__label__ == 36) {
          heapClassInst.heap32[(g0)] = Int32(r2);
          mandreel_opencloud(i7);
          r1 = commonVariable.r_g0;
          if (r1 == ( -1)) 
          {
            r4 = 0;
            break 
          }
        }
        heapClassInst.heap32[(g0)] = 284;
        _Znwj(i7);
        r4 = commonVariable.r_g0;
        r5 = _ZTV10CFileCloud;
        r6 = r4 >> 2;
        r5 = (r5 + 8) | 0;
        r7 = 1;
        heapClassInst.heap32[(r6)] = Int32(r5);
        heapClassInst.heap8[r4 + 4] = Int8(r7);
        heapClassInst.heap32[(r6 + 4)] = 0;
        heapClassInst.heap32[(r6 + 6)] = 0;
        heapClassInst.heap32[(r6 + 2)] = Int32(r1);
        heapClassInst.heap8[r4 + 5] = Int8(r3);
        heapClassInst.heap8[r4 + 6] = Int8(r0);
        heapClassInst.heap32[(r6 + 5)] = 0;
        r0 = (r4 + 28) | 0;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r2);
        strcpy(i7);
        if (r1 == 0) 
        {
          r0 = r3 & 255;
          if (r0 == 0) 
          {
            break 
          }
          else {
            r0 = r4 >> 2;
            heapClassInst.heap32[(r0 + 3)] = 131072;
            heapClassInst.heap32[(g0)] = 131072;
            mallocNew(i7);
            heapClassInst.heap32[(r0 + 6)] = Int32(commonVariable.r_g0);
          }
        }
        else {
          r3 = (r1 + 131072) | 0;
          r2 = r4 >> 2;
          heapClassInst.heap32[(r2 + 3)] = Int32(r3);
          heapClassInst.heap32[(g0)] = Int32(r3);
          mallocNew(i7);
          heapClassInst.heap32[(r2 + 6)] = Int32(commonVariable.r_g0);
          r3 = (r1 + 4) | 0;
          heapClassInst.heap32[(g0)] = Int32(r3);
          mallocNew(i7);
          r3 = commonVariable.r_g0;
          heapClassInst.heap32[(g0)] = Int32(r0);
          heapClassInst.heap32[(g0 + 1)] = Int32(r3);
          heapClassInst.heap32[(g0 + 2)] = Int32(r1);
          mandreel_readcloud(i7);
          r0 = Int64(heapClassInst.heap32[(r2 + 3)]);
          r5 = Int64(heapClassInst.heap32[(r2 + 6)]);
          heapClassInst.heap32[(g0)] = Int32(r3);
          heapClassInst.heap32[(g0 + 1)] = Int32(r1);
          heapClassInst.heap32[(g0 + 2)] = Int32(r5);
          heapClassInst.heap32[(g0 + 3)] = Int32(r0);
          _ZN12mandreel_b6410b64_decodeEPKcjPvj(i7);
          r0 = commonVariable.r_g0;
          heapClassInst.heap32[(g0)] = Int32(r3);
          free(i7);
          heapClassInst.heap32[(r2 + 2)] = Int32(r0);
          heapClassInst.heap32[(r2 + 5)] = Int32(r0);
        }
      }
      else {
        r1 = r3;
        while (true) {
          r4 = Int64(heapClassInst.heapU8[r1]);
          if (r4 == 0) 
          {
            __label__ = 46;
            break 
          }
          else {
            if (r4 == 87) 
            {
              __label__ = 45;
              break 
            }
            else {
              r1 = (r1 + 1) | 0;
              if (r4 != 119) 
              {
                __label__ = 42;
              }
              else {
                __label__ = 45;
                break 
              }
            }
          }
        }
        match (__label__) {
          case 46 =>
            r0 = Int64(heapClassInst.heapU8[sp + (-2048)]);
            if (r0 != 47) 
            {
              heapClassInst.heap32[(g0)] = Int32(r2);
              heapClassInst.heap32[(g0 + 1)] = Int32(r3);
              mandreel_fopen(i7);
              r2 = commonVariable.r_g0;
            }
            else {
              r2 = (r2 + 1) | 0;
              heapClassInst.heap32[(g0)] = Int32(r2);
              heapClassInst.heap32[(g0 + 1)] = Int32(r3);
              mandreel_fopen(i7);
              r2 = commonVariable.r_g0;
            }
            if (r2 == 0) 
            {
              r0 = 0;
              commonVariable.r_g0 = r0;
              return;
            }
            else {
              heapClassInst.heap32[(g0)] = 8;
              r0 = _ZTV11CFileSystem;
              _Znwj(i7);
              r3 = commonVariable.r_g0 >> 2;
              r0 = (r0 + 8) | 0;
              heapClassInst.heap32[(r3)] = Int32(r0);
              heapClassInst.heap32[(r3 + 1)] = Int32(r2);
              return;
            }
            // break;
          case 45 =>
            r2 = _E2_str35681;
            heapClassInst.heap32[(g0)] = Int32(r2);
            heapClassInst.heap32[(g0 + 1)] = Int32(r0);
            heapClassInst.heap32[(g0 + 2)] = Int32(r3);
            printf(i7);
            r2 = 0;
            commonVariable.r_g0 = r2;
            return;
          //   break;
          // default:
          //   break
          case _ =>
            println("break7409")
        }
      }
    }
    else {
      heapClassInst.heap32[(g0)] = 0;
      _Z30mandreel_fopen_enable_checkfatb(i7);
      r0 = _E2_str31677;
      heapClassInst.heap32[(g0)] = Int32(r3);
      heapClassInst.heap32[(g0 + 1)] = Int32(r0);
      strcmp(i7);
      r0 = commonVariable.r_g0;
      do {
        if (r0 != 0) 
        {
          r0 = _E2_str4651;
          heapClassInst.heap32[(g0)] = Int32(r3);
          heapClassInst.heap32[(g0 + 1)] = Int32(r0);
          strcmp(i7);
          r0 = commonVariable.r_g0;
          if (r0 == 0) 
          {
            __label__ = 13;
          }
          else {
            r0 = _E2_str5652;
            heapClassInst.heap32[(g0)] = Int32(r3);
            heapClassInst.heap32[(g0 + 1)] = Int32(r0);
            strcmp(i7);
            r0 = commonVariable.r_g0;
            if (r0 != 0) 
            {
              r0 = _E2_str32678;
              heapClassInst.heap32[(g0)] = Int32(r3);
              heapClassInst.heap32[(g0 + 1)] = Int32(r0);
              strcmp(i7);
              r0 = commonVariable.r_g0;
              if (!(r0 == 0)) 
              {
                r3 = Int64(heapClassInst.heapU8[r3]);
                r0 = 119;
                r1 = 114;
                r0 = if (r3 == r0) {1} else {0};
                r4 = if (r3 == r1) {1} else {0};
                r1 = r0 & 1;
                r0 = r4 & 1;
                if (r3 == 114) 
                {
                  __label__ = 20;
                  break 
                }
                else {
                  r3 = 0;
                  __label__ = 22;
                  break 
                }
              }
            }
            r0 = 1;
            r3 = 0;
            r1 = r0;
            __label__ = 22;
          }
        }
        else {
          __label__ = 13;
        }
      } while (false);
      if (__label__ == 13) {
        r0 = 1;
        r1 = r0;
        __label__ = 20;
      }
      if (__label__ == 20) {
        heapClassInst.heap32[(g0)] = Int32(r2);
        mandreel_openls(i7);
        r3 = commonVariable.r_g0;
        if (r3 == ( -1)) 
        {
          r4 = 0;
          break 
        }
      }
      heapClassInst.heap32[(g0)] = 284;
      _Znwj(i7);
      r4 = commonVariable.r_g0;
      r5 = _ZTV7CFileLS;
      r6 = r4 >> 2;
      r5 = (r5 + 8) | 0;
      r7 = 1;
      heapClassInst.heap32[(r6)] = Int32(r5);
      heapClassInst.heap8[r4 + 4] = Int8(r7);
      heapClassInst.heap32[(r6 + 4)] = 0;
      heapClassInst.heap32[(r6 + 6)] = 0;
      heapClassInst.heap32[(r6 + 2)] = Int32(r3);
      heapClassInst.heap8[r4 + 5] = Int8(r1);
      heapClassInst.heap8[r4 + 6] = Int8(r0);
      heapClassInst.heap32[(r6 + 5)] = 0;
      r0 = (r4 + 28) | 0;
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r2);
      strcpy(i7);
      if (r3 == 0) 
      {
        r0 = r1 & 255;
        if (!(r0 == 0)) 
        {
          r0 = r4 >> 2;
          heapClassInst.heap32[(r0 + 3)] = 131072;
          heapClassInst.heap32[(g0)] = 131072;
          mallocNew(i7);
          heapClassInst.heap32[(r0 + 6)] = Int32(commonVariable.r_g0);
        }
      }
      else {
        r1 = (r3 + 131072) | 0;
        r2 = r4 >> 2;
        heapClassInst.heap32[(r2 + 3)] = Int32(r1);
        heapClassInst.heap32[(g0)] = Int32(r1);
        mallocNew(i7);
        heapClassInst.heap32[(r2 + 6)] = Int32(commonVariable.r_g0);
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(commonVariable.r_g0);
        heapClassInst.heap32[(g0 + 2)] = Int32(r3);
        mandreel_readls(i7);
        heapClassInst.heap32[(r2 + 5)] = Int32(r3);
      }
    }
  } while (false);
  heapClassInst.heap32[(g0)] = 1;
  _Z30mandreel_fopen_enable_checkfatb(i7);
  commonVariable.r_g0 = r4;
  return;
}

func __floatundidf(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = r0 | r1;
  if (r2 == 0) 
  {
    f0 = 0.0;
    commonVariable.f_g0 = f0;
    return;
  }
  else {
    r2 = r0 >> 1;
    r3 = r1 >> 1;
    r2 = r0 | r2;
    r3 = r1 | r3;
    r4 = r2 >> 2;
    r5 = r3 >> 2;
    r2 = r2 | r4;
    r3 = r3 | r5;
    r4 = r2 >> 4;
    r5 = r3 >> 4;
    r2 = r2 | r4;
    r3 = r3 | r5;
    r4 = r2 >> 8;
    r5 = r3 >> 8;
    r2 = r2 | r4;
    r3 = r3 | r5;
    r4 = r2 >> 16;
    r5 = r3 >> 16;
    r2 = r2 | r4;
    r3 = r3 | r5;
    r4 = r2 ^ ( -1);
    r5 = 1431655765;
    r6 = r3 ^ ( -1);
    r4 = r4 >> 1;
    r6 = r6 >> 1;
    r2 = r5 & (!r2);
    r4 = r4 & 1431655765;
    r2 = (r2 + r4) | 0;
    r3 = r5 & (!r3);
    r4 = r6 & 1431655765;
    r3 = (r3 + r4) | 0;
    r4 = r2 >> 2;
    r5 = r3 >> 2;
    r2 = r2 & 858993459;
    r4 = r4 & 858993459;
    r2 = (r2 + r4) | 0;
    r3 = r3 & 858993459;
    r4 = r5 & 858993459;
    r3 = (r3 + r4) | 0;
    r4 = r2 >> 4;
    r5 = r3 >> 4;
    r2 = r2 & 252645135;
    r4 = r4 & 252645135;
    r2 = (r2 + r4) | 0;
    r3 = r3 & 252645135;
    r4 = r5 & 252645135;
    r3 = (r3 + r4) | 0;
    r4 = r2 >> 8;
    r5 = r3 >> 8;
    r2 = r2 & 16711935;
    r4 = r4 & 16711935;
    r2 = (r2 + r4) | 0;
    r3 = r3 & 16711935;
    r4 = r5 & 16711935;
    r3 = (r3 + r4) | 0;
    r4 = r2 & 65535;
    r2 = r2 >> 16;
    r2 = (r4 + r2) | 0;
    r4 = r3 & 65535;
    r3 = r3 >> 16;
    r3 = (r4 + r3) | 0;
    r2 = (r2 + 32) | 0;
    r4 = 64;
    r2 = if (r1 != 0) {r3} else {r2};
    r3 = 63;
    r4 = (r4 - r2) | 0;
    r2 = (r3 - r2) | 0;
    if (r4 < 54) 
    {
      r3 = 53;
      r3 = (r3 - r4) | 0;
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      heapClassInst.heap32[(g0 + 2)] = Int32(r3);
      __ashldi3(i7);
      r3 = commonVariable.r_g0;
      r1 = commonVariable.r_g1;
    }
    else {
      if (r4 == 54) 
      {
        r1 = r1 << 1;
        r3 = r0 >> 31;
        r0 = r0 << 1;
        r1 = r1 | r3;
      }
      else {
        if (r4 != 55) 
        {
          r3 = (r4 + (-55)) | 0;
          heapClassInst.heap32[(g0)] = Int32(r0);
          heapClassInst.heap32[(g0 + 1)] = Int32(r1);
          heapClassInst.heap32[(g0 + 2)] = Int32(r3);
          __lshrdi3(i7);
          r3 = commonVariable.r_g0;
          r5 = commonVariable.r_g1;
          r6 = 119;
          r6 = (r6 - r4) | 0;
          heapClassInst.heap32[(g0)] = ( -1);
          heapClassInst.heap32[(g0 + 1)] = ( -1);
          heapClassInst.heap32[(g0 + 2)] = Int32(r6);
          __lshrdi3(i7);
          r0 = commonVariable.r_g0 & r0;
          r1 = commonVariable.r_g1 & r1;
          r0 = r0 | r1;
          r1 = 0;
          r0 = if (r0 != r1) {1} else {0};
          r0 = r0 & 1;
          r0 = r0 | r3;
          r1 = r5;
        }
      }
      r3 = r0 >> 2;
      r3 = r3 & 1;
      r0 = r3 | r0;
      r3 = (r0 + 1) | 0;
      r5 = 1;
      r6 = 0;
      r0 = if (`UIntNative`(r3) < `UIntNative`(r0)) {r5} else {r6};
      r0 = if (r3 == 0) {r5} else {r0};
      r0 = (r1 + r0) | 0;
      r1 = r0 >> 2;
      r5 = r1 & 2097152;
      if (r5 != 0) 
      {
        r1 = r3 >> 3;
        r2 = r0 << 29;
        r3 = r1 | r2;
        r1 = r0 >> 3;
        r2 = r4;
      }
      else {
        r3 = r3 >> 2;
        r0 = r0 << 30;
        r3 = r3 | r0;
      }
    }
    r0 = r2 << 20;
    r2 = sp + (-8);
    r1 = r1 & 1048575;
    r0 = (r0 + 1072693248) | 0;
    r2 = r2 >> 2;
    r0 = r1 | r0;
    heapClassInst.heap32[(fp + (-2))] = Int32(r3);
    heapClassInst.heap32[(r2 + 1)] = Int32(r0);
    f0 = llvm_readDouble((sp + (-8)));
    commonVariable.f_g0 = f0;
    return;
  }
}

func __udivmoddi4(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp + 4)]);
  r2 = Int64(heapClassInst.heap32[(fp)]);
  r3 = Int64(heapClassInst.heap32[(fp + 2)]);
  r4 = Int64(heapClassInst.heap32[(fp + 3)]);
  do {
    if (r0 != 0) 
    {
      do {
        if (r3 != 0) 
        {
          if (r4 != 0) 
          {
            r5 = r4 >> 1;
            r6 = r0 >> 1;
            r5 = r4 | r5;
            r6 = r0 | r6;
            r7 = r5 >> 2;
            r9 = r6 >> 2;
            r5 = r5 | r7;
            r6 = r6 | r9;
            r7 = r5 >> 4;
            r9 = r6 >> 4;
            r5 = r5 | r7;
            r6 = r6 | r9;
            r7 = r5 >> 8;
            r9 = r6 >> 8;
            r5 = r5 | r7;
            r6 = r6 | r9;
            r7 = r5 >> 16;
            r9 = r6 >> 16;
            r5 = r5 | r7;
            r6 = r6 | r9;
            r7 = r5 ^ ( -1);
            r9 = r6 ^ ( -1);
            r8 = 1431655765;
            r7 = r7 >> 1;
            r9 = r9 >> 1;
            r5 = r8 & (!r5);
            r7 = r7 & 1431655765;
            r6 = r8 & (!r6);
            r9 = r9 & 1431655765;
            r5 = (r5 + r7) | 0;
            r6 = (r6 + r9) | 0;
            r7 = r5 >> 2;
            r9 = r6 >> 2;
            r5 = r5 & 858993459;
            r7 = r7 & 858993459;
            r6 = r6 & 858993459;
            r9 = r9 & 858993459;
            r5 = (r5 + r7) | 0;
            r6 = (r6 + r9) | 0;
            r7 = r5 >> 4;
            r9 = r6 >> 4;
            r5 = r5 & 252645135;
            r7 = r7 & 252645135;
            r6 = r6 & 252645135;
            r9 = r9 & 252645135;
            r5 = (r5 + r7) | 0;
            r6 = (r6 + r9) | 0;
            r7 = r5 >> 8;
            r9 = r6 >> 8;
            r5 = r5 & 16711935;
            r7 = r7 & 16711935;
            r6 = r6 & 16711935;
            r9 = r9 & 16711935;
            r5 = (r5 + r7) | 0;
            r6 = (r6 + r9) | 0;
            r7 = r5 & 65535;
            r5 = r5 >> 16;
            r9 = r6 & 65535;
            r6 = r6 >> 16;
            r5 = (r7 + r5) | 0;
            r6 = (r9 + r6) | 0;
            r5 = (r5 - r6) | 0;
            if (`UIntNative`(r5) < `UIntNative`(32)) 
            {
              r6 = 31;
              r7 = (r5 + 1) | 0;
              r9 = (r5 + (-31)) | 0;
              r5 = (r6 - r5) | 0;
              r6 = r2 >> r7;
              r8 = r9 >> 31;
              r10 = r0 >> r7;
              r6 = r6 & r8;
              r0 = r0 << r5;
              r9 = 0;
              r2 = r2 << r5;
              r5 = r6 | r0;
              r6 = r10 & r8;
              __label__ = 39;
              break 
            }
            else {
              if (r1 == 0) 
              {
                __label__ = 7;
                break 
              }
              else {
                r5 = r1 >> 2;
                heapClassInst.heap32[(r5)] = Int32(r2);
                heapClassInst.heap32[(r5 + 1)] = Int32(r0);
                r2 = 0;
                commonVariable.r_g0 = r2;
                commonVariable.r_g1 = r2;
                return;
              }
            }
          }
          else {
            r5 = (r3 + (-1)) | 0;
            r6 = r5 & r3;
            if (r6 != 0) 
            {
              r5 = r3 >> 1;
              r6 = r0 >> 1;
              r5 = r3 | r5;
              r6 = r0 | r6;
              r7 = r5 >> 2;
              r9 = r6 >> 2;
              r5 = r5 | r7;
              r6 = r6 | r9;
              r7 = r5 >> 4;
              r9 = r6 >> 4;
              r5 = r5 | r7;
              r6 = r6 | r9;
              r7 = r5 >> 8;
              r9 = r6 >> 8;
              r5 = r5 | r7;
              r6 = r6 | r9;
              r7 = r5 >> 16;
              r9 = r6 >> 16;
              r5 = r5 | r7;
              r6 = r6 | r9;
              r7 = r5 ^ ( -1);
              r9 = r6 ^ ( -1);
              r8 = 1431655765;
              r7 = r7 >> 1;
              r9 = r9 >> 1;
              r5 = r8 & (!r5);
              r7 = r7 & 1431655765;
              r6 = r8 & (!r6);
              r9 = r9 & 1431655765;
              r5 = (r5 + r7) | 0;
              r6 = (r6 + r9) | 0;
              r7 = r5 >> 2;
              r9 = r6 >> 2;
              r5 = r5 & 858993459;
              r7 = r7 & 858993459;
              r6 = r6 & 858993459;
              r9 = r9 & 858993459;
              r5 = (r5 + r7) | 0;
              r6 = (r6 + r9) | 0;
              r7 = r5 >> 4;
              r9 = r6 >> 4;
              r5 = r5 & 252645135;
              r7 = r7 & 252645135;
              r6 = r6 & 252645135;
              r9 = r9 & 252645135;
              r5 = (r5 + r7) | 0;
              r6 = (r6 + r9) | 0;
              r7 = r5 >> 8;
              r9 = r6 >> 8;
              r5 = r5 & 16711935;
              r7 = r7 & 16711935;
              r6 = r6 & 16711935;
              r9 = r9 & 16711935;
              r5 = (r5 + r7) | 0;
              r6 = (r6 + r9) | 0;
              r7 = r5 & 65535;
              r5 = r5 >> 16;
              r9 = r6 & 65535;
              r6 = r6 >> 16;
              r5 = (r7 + r5) | 0;
              r6 = (r9 + r6) | 0;
              r5 = (r5 - r6) | 0;
              r6 = 31;
              r7 = (r5 + 33) | 0;
              r9 = r5 ^ ( -1);
              r8 = (r5 + 1) | 0;
              r6 = (r6 - r5) | 0;
              r10 = ( -2);
              r10 = (r10 - r5) | 0;
              r11 = r0 << r6;
              r12 = r2 >> r8;
              r13 = r2 >> r7;
              r14 = r0 << r9;
              r11 = r11 | r12;
              r12 = r9 >> 31;
              r9 = r2 << r9;
              r5 = r5 >> 31;
              r13 = r13 | r14;
              r14 = r8 >> 31;
              r8 = r0 >> r8;
              r10 = r10 >> 31;
              r2 = r2 << r6;
              r0 = r0 >> r7;
              r6 = r11 & r12;
              r5 = r9 & r5;
              r11 = r13 & r14;
              r8 = r8 & r10;
              r9 = r2 & r12;
              r2 = r6 | r5;
              r5 = r11 | r8;
              r6 = r0 & r14;
              if (r7 == 0) 
              {
                r0 = 0;
                r3 = r0;
                __label__ = 42;
                break 
              }
              else {
                __label__ = 39;
                break 
              }
            }
            else {
              if (!(r1 == 0)) 
              {
                r1 = r1 >> 2;
                r4 = r5 & r2;
                heapClassInst.heap32[(r1)] = Int32(r4);
                heapClassInst.heap32[(r1 + 1)] = 0;
              }
              if (r3 != 1) 
              {
                r1 = r5 & (!r3);
                r3 = r1 >> 1;
                r1 = r1 & 1431655765;
                r3 = r3 & 1431655765;
                r1 = (r1 + r3) | 0;
                r3 = r1 >> 2;
                r1 = r1 & 858993459;
                r3 = r3 & 858993459;
                r1 = (r1 + r3) | 0;
                r3 = r1 >> 4;
                r1 = r1 & 252645135;
                r3 = r3 & 252645135;
                r1 = (r1 + r3) | 0;
                r3 = r1 >> 8;
                r1 = r1 & 16711935;
                r3 = r3 & 16711935;
                r1 = (r1 + r3) | 0;
                r3 = r1 & 65535;
                r1 = r1 >> 16;
                r1 = (r3 + r1) | 0;
                r3 = 32;
                r3 = (r3 - r1) | 0;
                r3 = r0 << r3;
                r2 = r2 >> r1;
                r2 = r3 | r2;
                r0 = r0 >> r1;
                __label__ = 44;
                break 
              }
              else {
                __label__ = 44;
                break 
              }
            }
          }
        }
        else {
          if (r4 != 0) 
          {
            if (r2 != 0) 
            {
              r5 = (r4 + (-1)) | 0;
              r6 = r5 & r4;
              if (r6 != 0) 
              {
                r5 = r4 >> 1;
                r6 = r0 >> 1;
                r5 = r4 | r5;
                r6 = r0 | r6;
                r7 = r5 >> 2;
                r8 = r6 >> 2;
                r5 = r5 | r7;
                r6 = r6 | r8;
                r7 = r5 >> 4;
                r8 = r6 >> 4;
                r5 = r5 | r7;
                r6 = r6 | r8;
                r7 = r5 >> 8;
                r8 = r6 >> 8;
                r5 = r5 | r7;
                r6 = r6 | r8;
                r7 = r5 >> 16;
                r8 = r6 >> 16;
                r5 = r5 | r7;
                r6 = r6 | r8;
                r7 = r5 ^ ( -1);
                r8 = r6 ^ ( -1);
                r9 = 1431655765;
                r7 = r7 >> 1;
                r8 = r8 >> 1;
                r5 = r9 & (!r5);
                r7 = r7 & 1431655765;
                r6 = r9 & (!r6);
                r8 = r8 & 1431655765;
                r5 = (r5 + r7) | 0;
                r6 = (r6 + r8) | 0;
                r7 = r5 >> 2;
                r8 = r6 >> 2;
                r5 = r5 & 858993459;
                r7 = r7 & 858993459;
                r6 = r6 & 858993459;
                r8 = r8 & 858993459;
                r5 = (r5 + r7) | 0;
                r6 = (r6 + r8) | 0;
                r7 = r5 >> 4;
                r8 = r6 >> 4;
                r5 = r5 & 252645135;
                r7 = r7 & 252645135;
                r6 = r6 & 252645135;
                r8 = r8 & 252645135;
                r5 = (r5 + r7) | 0;
                r6 = (r6 + r8) | 0;
                r7 = r5 >> 8;
                r8 = r6 >> 8;
                r5 = r5 & 16711935;
                r7 = r7 & 16711935;
                r6 = r6 & 16711935;
                r8 = r8 & 16711935;
                r5 = (r5 + r7) | 0;
                r6 = (r6 + r8) | 0;
                r7 = r5 & 65535;
                r5 = r5 >> 16;
                r8 = r6 & 65535;
                r6 = r6 >> 16;
                r5 = (r7 + r5) | 0;
                r6 = (r8 + r6) | 0;
                r5 = (r5 - r6) | 0;
                if (`UIntNative`(r5) < `UIntNative`(31)) 
                {
                  r6 = 31;
                  r7 = (r5 + 1) | 0;
                  r5 = (r6 - r5) | 0;
                  r6 = r0 << r5;
                  r8 = r2 >> r7;
                  r9 = 0;
                  r2 = r2 << r5;
                  r5 = r6 | r8;
                  r6 = r0 >> r7;
                  __label__ = 39;
                  break 
                }
                else {
                  if (r1 == 0) 
                  {
                    __label__ = 7;
                    break 
                  }
                  else {
                    r1 = r1 >> 2;
                    heapClassInst.heap32[(r1)] = Int32(r2);
                    heapClassInst.heap32[(r1 + 1)] = Int32(r0);
                    __label__ = 9;
                    break 
                  }
                }
              }
              else {
                if (!(r1 == 0)) 
                {
                  r1 = r1 >> 2;
                  r3 = r5 & r0;
                  heapClassInst.heap32[(r1)] = Int32(r2);
                  heapClassInst.heap32[(r1 + 1)] = Int32(r3);
                }
                r1 = (r4 + (-1)) | 0;
                r1 = r1 & (!r4);
                r2 = r1 >> 1;
                r1 = r1 & 1431655765;
                r2 = r2 & 1431655765;
                r1 = (r1 + r2) | 0;
                r2 = r1 >> 2;
                r1 = r1 & 858993459;
                r2 = r2 & 858993459;
                r1 = (r1 + r2) | 0;
                r2 = r1 >> 4;
                r1 = r1 & 252645135;
                r2 = r2 & 252645135;
                r1 = (r1 + r2) | 0;
                r2 = r1 >> 8;
                r1 = r1 & 16711935;
                r2 = r2 & 16711935;
                r1 = (r1 + r2) | 0;
                r2 = r1 & 65535;
                r1 = r1 >> 16;
                r1 = (r2 + r1) | 0;
                r0 = r0 >> r1;
                __label__ = 5;
                break 
              }
            }
            else {
              if (!(r1 == 0)) 
              {
                r1 = r1 >> 2;
                r2 = Int64(floor(Float64(`UIntNative`(r0) % `UIntNative`(r4))));
                heapClassInst.heap32[(r1)] = 0;
                heapClassInst.heap32[(r1 + 1)] = Int32(r2);
              }
              r0 = Int64(floor(Float64(`UIntNative`(r0) / `UIntNative`(r4))));
              __label__ = 5;
              break 
            }
          }
          else {
            if (!(r1 == 0)) 
            {
              r1 = r1 >> 2;
              r2 = Int64(floor(Float64(`UIntNative`(r0) % `UIntNative`(r3))));
              heapClassInst.heap32[(r1)] = Int32(r2);
              heapClassInst.heap32[(r1 + 1)] = 0;
            }
            r0 = Int64(floor(Float64(`UIntNative`(r0) / `UIntNative`(r3))));
            __label__ = 5;
            break 
          }
        }
      } while (false);
      if (__label__ == 39) {
        r8 = (r3 + (-1)) | 0;
        r10 = 0;
        r11 = 1;
        r0 = if (`UIntNative`(r8) < `UIntNative`(r3)) {r11} else {r10};
        r0 = if (r3 != 0) {r11} else {r0};
        r0 = (r4 + r0) | 0;
        r12 = (r0 + (-1)) | 0;
        r13 = r10;
        while (true) {
          r0 = r5 << 1;
          r14 = r2 >> 31;
          r6 = r6 << 1;
          r5 = r5 >> 31;
          r14 = r0 | r14;
          r0 = r6 | r5;
          r5 = (r12 - r0) | 0;
          r6 = if (`UIntNative`(r8) < `UIntNative`(r14)) {r11} else {r10};
          r5 = (r5 - r6) | 0;
          r5 = r5 >> 31;
          r6 = r5 & r3;
          r15 = r5 & r4;
          r16 = r9 << 1;
          r2 = r2 << 1;
          r17 = r9 >> 31;
          r15 = (r0 - r15) | 0;
          r18 = if (`UIntNative`(r14) < `UIntNative`(r6)) {r11} else {r10};
          r7 = (r7 + (-1)) | 0;
          r0 = r5 & 1;
          r9 = r13 | r16;
          r2 = r2 | r17;
          r5 = (r14 - r6) | 0;
          r6 = (r15 - r18) | 0;
          r13 = r0;
          if (!(r7 != 0)) 
          {
            break 
          }
        }
        r3 = 0;
      }
      r2 = r2 << 1;
      r4 = r9 >> 31;
      r7 = r9 << 1;
      r4 = r2 | r4;
      r2 = r0 | r7;
      r0 = r3 | r4;
      if (r1 != 0) 
      {
        r1 = r1 >> 2;
        heapClassInst.heap32[(r1)] = Int32(r5);
        heapClassInst.heap32[(r1 + 1)] = Int32(r6);
        __label__ = 44;
        break 
      }
      else {
        __label__ = 44;
        break 
      }
    }
    else {
      if (r4 != 0) 
      {
        if (r1 != 0) 
        {
          r0 = r1 >> 2;
          heapClassInst.heap32[(r0)] = Int32(r2);
          heapClassInst.heap32[(r0 + 1)] = 0;
          __label__ = 9;
          break 
        }
        else {
          __label__ = 7;
          break 
        }
      }
      else {
        if (!(r1 == 0)) 
        {
          r0 = r1 >> 2;
          r1 = Int64(floor(Float64(`UIntNative`(r2) % `UIntNative`(r3))));
          heapClassInst.heap32[(r0)] = Int32(r1);
          heapClassInst.heap32[(r0 + 1)] = 0;
        }
        r0 = Int64(floor(Float64(`UIntNative`(r2) / `UIntNative`(r3))));
        __label__ = 5;
      }
    }
  } while (false);
  match (__label__) {
    case 7 =>
      r2 = 0;
      r0 = r2;
      // break;
    case 9 =>
      r0 = 0;
      commonVariable.r_g0 = r0;
      commonVariable.r_g1 = r0;
      return;
      // break;
    case 5 =>
      r1 = 0;
      commonVariable.r_g0 = r0;
      commonVariable.r_g1 = r1;
      return;
      // break;
    // default:
    //   break
    case _ =>
      println("break8280")
  }
  commonVariable.r_g0 = r2;
  commonVariable.r_g1 = r0;
  return;
}

func __umoddi3(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-32); 
  var g0 = i7 >> 2; 
  r0 = sp + (-8);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  r3 = Int64(heapClassInst.heap32[(fp + 2)]);
  r4 = Int64(heapClassInst.heap32[(fp + 3)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  heapClassInst.heap32[(g0 + 2)] = Int32(r3);
  heapClassInst.heap32[(g0 + 3)] = Int32(r4);
  heapClassInst.heap32[(g0 + 4)] = Int32(r0);
  __udivmoddi4(i7);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(fp + (-2))]);
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  commonVariable.r_g0 = r1;
  commonVariable.r_g1 = r0;
  return;
}

func __moddi3(sp: Int64) : Unit
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
  i7 = sp + (-32); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 3)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = r0 >> 31;
  r3 = Int64(heapClassInst.heap32[(fp + 2)]);
  r4 = r1 >> 31;
  r5 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r4 ^ r1;
  r5 = r4 ^ r5;
  r0 = r2 ^ r0;
  r3 = r2 ^ r3;
  r6 = 1;
  r7 = 0;
  r1 = (r1 - r4) | 0;
  r8 = if (`UIntNative`(r5) < `UIntNative`(r4)) {r6} else {r7};
  r0 = (r0 - r2) | 0;
  r9 = if (`UIntNative`(r3) < `UIntNative`(r2)) {r6} else {r7};
  r10 = sp + (-8);
  r5 = (r5 - r4) | 0;
  r1 = (r1 - r8) | 0;
  r2 = (r3 - r2) | 0;
  r0 = (r0 - r9) | 0;
  heapClassInst.heap32[(g0)] = Int32(r5);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  heapClassInst.heap32[(g0 + 2)] = Int32(r2);
  heapClassInst.heap32[(g0 + 3)] = Int32(r0);
  heapClassInst.heap32[(g0 + 4)] = Int32(r10);
  __udivmoddi4(i7);
  r0 = r10 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp + (-2))]);
  r1 = r1 ^ r4;
  r0 = r0 ^ r4;
  r0 = (r0 - r4) | 0;
  r2 = if (`UIntNative`(r1) < `UIntNative`(r4)) {r6} else {r7};
  r1 = (r1 - r4) | 0;
  r0 = (r0 - r2) | 0;
  commonVariable.r_g0 = r1;
  commonVariable.r_g1 = r0;
  return;
}

func __divdi3(sp: Int64) : Unit
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
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 3)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = r1 >> 31;
  r3 = Int64(heapClassInst.heap32[(fp)]);
  r4 = r0 >> 31;
  r5 = Int64(heapClassInst.heap32[(fp + 2)]);
  r6 = r2 ^ r1;
  r3 = r2 ^ r3;
  r7 = r4 ^ r0;
  r5 = r4 ^ r5;
  r8 = 1;
  r9 = 0;
  r6 = (r6 - r2) | 0;
  r10 = if (`UIntNative`(r3) < `UIntNative`(r2)) {r8} else {r9};
  r7 = (r7 - r4) | 0;
  r11 = if (`UIntNative`(r5) < `UIntNative`(r4)) {r8} else {r9};
  r2 = (r3 - r2) | 0;
  r3 = (r6 - r10) | 0;
  r4 = (r5 - r4) | 0;
  r5 = (r7 - r11) | 0;
  heapClassInst.heap32[(g0)] = Int32(r2);
  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
  heapClassInst.heap32[(g0 + 2)] = Int32(r4);
  heapClassInst.heap32[(g0 + 3)] = Int32(r5);
  heapClassInst.heap32[(g0 + 4)] = 0;
  r0 = r0 ^ r1;
  __udivmoddi4(i7);
  r0 = r0 >> 31;
  r1 = commonVariable.r_g0 ^ r0;
  r2 = commonVariable.r_g1 ^ r0;
  r2 = (r2 - r0) | 0;
  r3 = if (`UIntNative`(r1) < `UIntNative`(r0)) {r8} else {r9};
  r0 = (r1 - r0) | 0;
  r1 = (r2 - r3) | 0;
  commonVariable.r_g0 = r0;
  commonVariable.r_g1 = r1;
  return;
}

func __udivdi3(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  r3 = Int64(heapClassInst.heap32[(fp + 3)]);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  heapClassInst.heap32[(g0 + 2)] = Int32(r2);
  heapClassInst.heap32[(g0 + 3)] = Int32(r3);
  heapClassInst.heap32[(g0 + 4)] = 0;
  __udivmoddi4(i7);
  return;
}

func sscanf(sp: Int64) : Unit
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
  var f0: Float64 = 0.0
  var f1: Float64 = 0.0
  var f2: Float64 = 0.0
  var f3: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-40); 
  var g0 = i7 >> 2; 
  r0 = (sp + 4) | 0;
  r1 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heap32[(fp + (-5))] = Int32(r0);
  heapClassInst.heap32[(fp + (-4))] = Int32(r1);
  heapClassInst.heap32[(fp + (-1))] = Int32(r0);
  r0 = sp + (-16);
  heapClassInst.heap32[(g0)] = Int32(r0);
  r1 = 1;
  r2 = 0;
  r3 = _E2_str7136;
  sgetc(i7);
  r4 = commonVariable.r_g0;
  f3 = 10.0;
  r20 = 255;
  while (true) {
    r5 = Int64(heapClassInst.heapU8[r3]);
    if (r5 != 0) 
    {
      r5 = r5 << 24;
      r5 = r5 >> 24;
      r6 = (r3 + 1) | 0;
      if (r5 > 31) 
      {
        if (r5 == 32) 
        {
          __label__ = 7;
        }
        else {
          if (r5 == 37) 
          {
            r5 = ( -1);
            r7 = 0;
            r8 = r7;
            r9 = r7;
            r10 = r7;
            r11 = r7;
            while (true) {
              r12 = Int64(heapClassInst.heap8[r6]);
              if (!(r12 == 110)) 
              {
                if (r4 == ( -1)) 
                {
                  __label__ = 168;
                  break 
                }
              }
              if (r12 > 103) 
              {
                if (r12 > 111) 
                {
                  if (r12 > 114) 
                  {
                    __label__ = 40;
                    break 
                  }
                  else {
                    if (r12 == 112) 
                    {
                      __label__ = 52;
                      break 
                    }
                    else {
                      if (!(r12 == 113)) 
                      {
                        __label__ = 168;
                        break 
                      }
                    }
                  }
                }
                else {
                  if (r12 > 107) 
                  {
                    if (r12 == 108) 
                    {
                      r3 = 1;
                      r10 = r10 & 255;
                      r11 = if (r10 == 0) {r11} else {r3};
                      r6 = (r6 + 1) | 0;
                      r10 = r3;
                      continue 
                    }
                    else {
                      __label__ = 35;
                      break 
                    }
                  }
                  else {
                    if (r12 == 104) 
                    {
                      r6 = (r6 + 1) | 0;
                      r9 = 1;
                      continue 
                    }
                    else {
                      __label__ = 33;
                      break 
                    }
                  }
                }
              }
              else {
                if (r12 > 75) 
                {
                  if (r12 > 98) 
                  {
                    __label__ = 27;
                    break 
                  }
                  else {
                    if (!(r12 == 76)) 
                    {
                      __label__ = 26;
                      break 
                    }
                  }
                }
                else {
                  if (r12 > 41) 
                  {
                    if (r12 == 42) 
                    {
                      r6 = (r6 + 1) | 0;
                      r8 = 1;
                      continue 
                    }
                    else {
                      r5 = (r12 + (-48)) | 0;
                      if (`UIntNative`(r5) < `UIntNative`(10)) 
                      {
                        r5 = sp + (-8);
                        heapClassInst.heap32[(g0)] = Int32(r6);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r5);
                        strtol(i7);
                        r5 = commonVariable.r_g0;
                        r6 = Int64(heapClassInst.heap32[(fp + (-2))]);
                        r7 = 1;
                        continue 
                      }
                      else {
                        __label__ = 23;
                        break 
                      }
                    }
                  }
                  else {
                    __label__ = 19;
                    break 
                  }
                }
              }
              r6 = (r6 + 1) | 0;
              r11 = 1;
            }
            do {
              match (__label__) {
                case 40 =>
                  if (r12 == 115) 
                  {
                    r8 = r8 & 255;
                    if (!(r8 != 0)) 
                    {
                      r3 = sp + (-4);
                      heapClassInst.heap32[(g0)] = Int32(r3);
                      heapClassInst.heap32[(g0 + 1)] = 4;
                      my_arg_test(i7);
                      r3 = commonVariable.r_g0 >> 2;
                      r3 = Int64(heapClassInst.heap32[(r3)]);
                      heapClassInst.heap32[(fp + (-2))] = Int32(r3);
                    }
                    r3 = (r6 + 1) | 0;
                    r6 = r4 << 2;
                    r7 = my_ctype;
                    r6 = (r6 + r7) | 0;
                    r6 = Int64(heapClassInst.heapU8[r6 + 4]);
                    r6 = r6 & 8;
                    do {
                      if (r6 == 0) 
                      {
                        r6 = r4;
                      }
                      else {
                        while (true) {
                          heapClassInst.heap32[(g0)] = Int32(r0);
                          sgetc(i7);
                          r6 = commonVariable.r_g0;
                          r4 = r6 << 2;
                          r4 = (r4 + r7) | 0;
                          r1 = (r1 + 1) | 0;
                          r4 = Int64(heapClassInst.heapU8[r4 + 4]);
                          r4 = r4 & 8;
                          if (!(r4 != 0)) 
                          {
                            break 
                          }
                        }
                      }
                    } while (false);
                    r4 = ( -1);
                    if (r6 == ( -1)) 
                    {
                      continue 
                    }
                    else {
                      r4 = r6;
                      while (true) {
                        if (r4 == ( -1)) 
                        {
                          break 
                        }
                        else {
                          if (r5 == 0) 
                          {
                            break 
                          }
                          else {
                            r6 = r4 << 2;
                            r6 = (r6 + r7) | 0;
                            r6 = Int64(heapClassInst.heapU8[r6 + 4]);
                            r6 = r6 & 8;
                            if (r6 == 0) 
                            {
                              if (!(r8 != 0)) 
                              {
                                r6 = Int64(heapClassInst.heap32[(fp + (-2))]);
                                heapClassInst.heap8[r6] = Int8(r4);
                              }
                              if (r4 == 0) 
                              {
                                break 
                              }
                              else {
                                r4 = Int64(heapClassInst.heap32[(fp + (-2))]);
                                r4 = (r4 + 1) | 0;
                                heapClassInst.heap32[(fp + (-2))] = Int32(r4);
                                heapClassInst.heap32[(g0)] = Int32(r0);
                                r1 = (r1 + 1) | 0;
                                r5 = (r5 + (-1)) | 0;
                                sgetc(i7);
                                r4 = commonVariable.r_g0;
                              }
                            }
                            else {
                              break 
                            }
                          }
                        }
                      }
                      if (r8 != 0) 
                      {
                        continue 
                      }
                      else {
                        r2 = (r2 + 1) | 0;
                        r5 = Int64(heapClassInst.heap32[(fp + (-2))]);
                        r6 = 0;
                        heapClassInst.heap8[r5] = Int8(r6);
                        continue 
                      }
                    }
                  }
                  else {
                    if (r12 == 117) 
                    {
                      __label__ = 53;
                      // break 
                    }
                    else {
                      if (r12 == 120) 
                      {
                        __label__ = 52;
                        // break 
                      }
                      else {
                        __label__ = 168;
                        // break 
                      }
                    }
                  }
                  // break;
                case 35 =>
                  if (r12 == 110) 
                  {
                    r3 = (r6 + 1) | 0;
                    r5 = r8 & 255;
                    if (r5 != 0) 
                    {
                      continue 
                    }
                    else {
                      r5 = sp + (-4);
                      heapClassInst.heap32[(g0)] = Int32(r5);
                      heapClassInst.heap32[(g0 + 1)] = 4;
                      my_arg_test(i7);
                      r5 = commonVariable.r_g0 >> 2;
                      r5 = Int64(heapClassInst.heap32[(r5)]);
                      r5 = r5 >> 2;
                      r6 = (r1 + (-1)) | 0;
                      heapClassInst.heap32[(r5)] = Int32(r6);
                      continue 
                    }
                  }
                  else {
                    if (r12 == 111) 
                    {
                      r13 = 8;
                      __label__ = 55;
                      // break 
                    }
                    else {
                      __label__ = 168;
                      // break 
                    }
                  }
                  // break;
                case 33 =>
                  if (r12 == 105) 
                  {
                    __label__ = 53;
                    // break 
                  }
                  else {
                    __label__ = 168;
                    // break 
                  }
                  // break;
                case 27 =>
                  if (r12 == 99) 
                  {
                    r3 = (r6 + 1) | 0;
                    r6 = r8 & 255;
                    if (r6 == 0) 
                    {
                      r8 = sp + (-4);
                      heapClassInst.heap32[(g0)] = Int32(r8);
                      heapClassInst.heap32[(g0 + 1)] = 4;
                      my_arg_test(i7);
                      r8 = commonVariable.r_g0 >> 2;
                      r8 = Int64(heapClassInst.heap32[(r8)]);
                      r2 = (r2 + 1) | 0;
                      heapClassInst.heap32[(fp + (-2))] = Int32(r8);
                    }
                    r8 = r7 & 255;
                    r7 = 1;
                    r5 = if (r8 == 0) {r7} else {r5};
                    if (r5 == 0) 
                    {
                      continue 
                    }
                    else {
                      if (r4 == ( -1)) 
                      {
                        continue 
                      }
                      else {
                        r5 = (r5 + (-1)) | 0;
                        while (true) {
                          if (!(r6 != 0)) 
                          {
                            r8 = Int64(heapClassInst.heap32[(fp + (-2))]);
                            r7 = (r8 + 1) | 0;
                            heapClassInst.heap8[r8] = Int8(r4);
                            heapClassInst.heap32[(fp + (-2))] = Int32(r7);
                          }
                          heapClassInst.heap32[(g0)] = Int32(r0);
                          r1 = (r1 + 1) | 0;
                          sgetc(i7);
                          r4 = commonVariable.r_g0;
                          if (r5 == 0) 
                          {
                            continue 
                          }
                          else {
                            r5 = (r5 + (-1)) | 0;
                            if (r4 != ( -1)) 
                            {
                              continue 
                            }
                            else {
                              continue 
                            }
                          }
                        }
                      }
                    }
                  }
                  else {
                    if (r12 == 100) 
                    {
                      r13 = 10;
                      __label__ = 55;
                      // break 
                    }
                    else {
                      r5 = (r12 + (-101)) | 0;
                      if (`UIntNative`(r5) < `UIntNative`(3)) 
                      {
                        __label__ = 46;
                        // break 
                      }
                      else {
                        __label__ = 168;
                        // break 
                      }
                    }
                  }
                  // break;
                case 26 =>
                  if (r12 == 88) 
                  {
                    __label__ = 52;
                    // break 
                  }
                  else {
                    __label__ = 168;
                    // break 
                  }
                  break;
                case 23 =>
                  if (r12 == 69) 
                  {
                    __label__ = 46;
                    // break 
                  }
                  else {
                    __label__ = 168;
                    // break 
                  }
                  // break;
                case 19 =>
                  if (r12 == 0) 
                  {
                    __label__ = 6;
                    // break 
                  }
                  else {
                    if (r12 == 37) 
                    {
                      r5 = r4 & 255;
                      if (r5 != r12) 
                      {
                        __label__ = 168;
                        // break 
                      }
                      else {
                        heapClassInst.heap32[(g0)] = Int32(r0);
                        r1 = (r1 + 1) | 0;
                        r3 = (r6 + 1) | 0;
                        sgetc(i7);
                        r4 = commonVariable.r_g0;
                        continue 
                      }
                    }
                    else {
                      __label__ = 168;
                      // break 
                    }
                  }
                //   break;
                // default:
                //   break;
                case _ =>
                  println("break8953")
              }
            } while (false);
            match (__label__) {
              case 53 =>
                r13 = 0;
                // break;
              case 52 =>
                r13 = 16;
                // break;
              case 46 =>
                r5 = r4 << 2;
                r7 = my_ctype;
                r5 = (r5 + r7) | 0;
                r5 = Int64(heapClassInst.heapU8[r5 + 4]);
                r3 = (r6 + 1) | 0;
                r5 = r5 & 8;
                do {
                  if (!(r5 == 0)) 
                  {
                    while (true) {
                      heapClassInst.heap32[(g0)] = Int32(r0);
                      sgetc(i7);
                      r4 = commonVariable.r_g0;
                      r5 = r4 << 2;
                      r5 = (r5 + r7) | 0;
                      r1 = (r1 + 1) | 0;
                      r5 = Int64(heapClassInst.heapU8[r5 + 4]);
                      r5 = r5 & 8;
                      if (!(r5 != 0)) 
                      {
                        break 
                      }
                    }
                  }
                } while (false);
                if (r4 == 45) 
                {
                  heapClassInst.heap32[(g0)] = Int32(r0);
                  r1 = (r1 + 1) | 0;
                  r5 = 1;
                  sgetc(i7);
                  r4 = commonVariable.r_g0;
                }
                else {
                  r5 = 0;
                }
                if (r4 == 43) 
                {
                  heapClassInst.heap32[(g0)] = Int32(r0);
                  r1 = (r1 + 1) | 0;
                  sgetc(i7);
                  r4 = commonVariable.r_g0;
                }
                r6 = (r4 + (-48)) | 0;
                do {
                  if (`UIntNative`(r6) > `UIntNative`(9)) 
                  {
                    f0 = 0.0;
                    r6 = r1;
                  }
                  else {
                    f0 = 0.0;
                    r6 = r1;
                    while (true) {
                      r4 = (r4 + (-48)) | 0;
                      f1 = 10.0;
                      heapClassInst.heap32[(g0)] = Int32(r0);
                      f0 = f0 * f1;
                      f1 = Float64(r4); 
                      sgetc(i7);
                      r4 = commonVariable.r_g0;
                      f0 = f0 + f1;
                      r6 = (r6 + 1) | 0;
                      r7 = (r4 + (-48)) | 0;
                      if (!(`UIntNative`(r7) < `UIntNative`(10))) 
                      {
                        break 
                      }
                    }
                  }
                } while (false);
                do {
                  if (r4 == 46) 
                  {
                    heapClassInst.heap32[(g0)] = Int32(r0);
                    sgetc(i7);
                    r4 = commonVariable.r_g0;
                    r1 = (r1 + 1) | 0;
                    r7 = (r4 + (-48)) | 0;
                    if (`UIntNative`(r7) < `UIntNative`(10)) 
                    {
                      r6 = (r6 + 1) | 0;
                      f1 = 0.10000000000000001;
                      while (true) {
                        r4 = (r4 + (-48)) | 0;
                        f2 = Float64(r4); 
                        heapClassInst.heap32[(g0)] = Int32(r0);
                        f2 = f2 * f1;
                        sgetc(i7);
                        r4 = commonVariable.r_g0;
                        f0 = f2 + f0;
                        f1 = f1 / f3;
                        r6 = (r6 + 1) | 0;
                        r7 = (r4 + (-48)) | 0;
                        if (!(`UIntNative`(r7) < `UIntNative`(10))) 
                        {
                          break 
                        }
                      }
                    }
                    else {
                      r6 = (r6 + 1) | 0;
                    }
                  }
                } while (false);
                if (r1 == r6) 
                {
                  __label__ = 172;
                  // break 
                }
                else {
                  r1 = r4 | 32;
                  do {
                    if (r1 == 101) 
                    {
                      heapClassInst.heap32[(g0)] = Int32(r0);
                      sgetc(i7);
                      r1 = commonVariable.r_g0;
                      if (r1 == 45) 
                      {
                        heapClassInst.heap32[(g0)] = Int32(r0);
                        f1 = 0.10000000000000001;
                        sgetc(i7);
                        r4 = commonVariable.r_g0;
                      }
                      else {
                        if (r1 == 43) 
                        {
                          heapClassInst.heap32[(g0)] = Int32(r0);
                          f1 = 10.0;
                          sgetc(i7);
                          r4 = commonVariable.r_g0;
                        }
                        else {
                          if (r1 != ( -1)) 
                          {
                            heapClassInst.heap32[(g0)] = Int32(r1);
                            heapClassInst.heap32[(g0 + 1)] = Int32(r0);
                            f0 = 0.0;
                            sputc(i7);
                            r1 = r6;
                            break 
                          }
                          else {
                            r1 = (r6 + 1) | 0;
                            f0 = 0.0;
                            break 
                          }
                        }
                      }
                      r7 = (r6 + 2) | 0;
                      r1 = (r4 + (-48)) | 0;
                      do {
                        if (`UIntNative`(r1) < `UIntNative`(10)) 
                        {
                          r1 = (r6 + 2) | 0;
                          r6 = 0;
                          while (true) {
                            r6 = (r6 * 10) | 0;
                            heapClassInst.heap32[(g0)] = Int32(r0);
                            r6 = (r4 + r6) | 0;
                            sgetc(i7);
                            r4 = commonVariable.r_g0;
                            r6 = (r6 + (-48)) | 0;
                            r1 = (r1 + 1) | 0;
                            r9 = (r4 + (-48)) | 0;
                            if (!(`UIntNative`(r9) < `UIntNative`(10))) 
                            {
                              break 
                            }
                          }
                        }
                        else {
                          r6 = 0;
                          r1 = r7;
                        }
                      } while (false);
                      if (r7 == r1) 
                      {
                        __label__ = 172;
                        break 
                      }
                      else {
                        if (!(r6 == 0)) 
                        {
                          __label__ = 130; 
                          while (true) {
                            r6 = (r6 + (-1)) | 0;
                            f0 = f0 * f1;
                            if (!(r6 != 0)) 
                            {
                              break 
                            }
                          }
                        }
                      }
                    }
                    else {
                      r1 = r6;
                    }
                  } while (false);
                  if (r5 != 0) 
                  {
                    f0 = -f0;
                  }
                  r5 = r8 & 255;
                  if (r5 != 0) 
                  {
                    continue 
                  }
                  else {
                    r5 = sp + (-4);
                    heapClassInst.heap32[(g0)] = Int32(r5);
                    heapClassInst.heap32[(g0 + 1)] = 4;
                    my_arg_test(i7);
                    r5 = commonVariable.r_g0;
                    r6 = r10 & 255;
                    if (r6 == 0) 
                    {
                      r5 = r5 >> 2;
                      r5 = Int64(heapClassInst.heap32[(r5)]);
                      r5 = r5 >> 2;
                      
                      heapClassInst.heapFloat[(r5)] = Float32(f0);
                    }
                    else {
                      r5 = r5 >> 2;
                      r5 = Int64(heapClassInst.heap32[(r5)]);
                      llvm_writeDouble((r5), f0);
                    }
                    r2 = (r2 + 1) | 0;
                    continue 
                  }
                }
              //   break;
              // default:
              //   break
              case _ =>
                println("break9202")
            }
            r3 = r4 << 2;
            r14 = my_ctype;
            r3 = (r3 + r14) | 0;
            r15 = Int64(heapClassInst.heapU8[r3 + 4]);
            r3 = (r6 + 1) | 0;
            r6 = r15 & 8;
            do {
              if (!(r6 == 0)) 
              {
                while (true) {
                  heapClassInst.heap32[(g0)] = Int32(r0);
                  sgetc(i7);
                  r4 = commonVariable.r_g0;
                  r6 = r4 << 2;
                  r6 = (r6 + r14) | 0;
                  r1 = (r1 + 1) | 0;
                  r6 = Int64(heapClassInst.heapU8[r6 + 4]);
                  r6 = r6 & 8;
                  if (!(r6 != 0)) 
                  {
                    break 
                  }
                }
              }
            } while (false);
            if (r4 == 45) 
            {
              heapClassInst.heap32[(g0)] = Int32(r0);
              r1 = (r1 + 1) | 0;
              r6 = 1;
              sgetc(i7);
              r4 = commonVariable.r_g0;
            }
            else {
              r6 = 0;
            }
            if (r4 == 43) 
            {
              heapClassInst.heap32[(g0)] = Int32(r0);
              r14 = (r1 + 1) | 0;
              sgetc(i7);
              r4 = commonVariable.r_g0;
            }
            else {
              r14 = r1;
            }
            if (r4 != ( -1)) 
            {
              r7 = r7 & 255;
              do {
                if (r7 == 0) 
                {
                  if (r13 != 16) 
                  {
                    __label__ = 68;
                  }
                  else {
                    if (r4 != 48) 
                    {
                      __label__ = 68;
                    }
                    else {
                      __label__ = 72;
                    }
                  }
                  do {
                    if (__label__ == 68) {
                      if (!(r13 != 0)) 
                      {
                        r7 = 48;
                        r7 = if (r4 != r7) {1} else {0};
                        if (!(r7 != 0)) 
                        {
                          r13 = 8;
                          break 
                        }
                      }
                      r7 = 10;
                      r13 = if (r13 != 0) {r13} else {r7};
                      r1 = r14;
                      break 
                    }
                  } while (false);
                  heapClassInst.heap32[(g0)] = Int32(r0);
                  sgetc(i7);
                  r4 = commonVariable.r_g0;
                  r7 = r4 | 32;
                  if (r7 == 120) 
                  {
                    heapClassInst.heap32[(g0)] = Int32(r0);
                    r1 = (r14 + 2) | 0;
                    r13 = 16;
                    sgetc(i7);
                    r4 = commonVariable.r_g0;
                  }
                  else {
                    r1 = (r14 + 1) | 0;
                  }
                }
                else {
                  r1 = r14;
                }
              } while (false);
              r7 = 0;
              r15 = r7;
              r16 = r7;
              while (true) {
                if (r5 == 0) 
                {
                  break 
                }
                else {
                  if (r4 != ( -1)) 
                  {
                    r17 = r4 & 255;
                    r18 = r17 | 32;
                    if (`UIntNative`(r18) < `UIntNative`(97)) 
                    {
                      r18 = 58;
                      r19 = (r17 + (-48)) | 0;
                      r17 = if (`UIntNative`(r17) < `UIntNative`(r18)) {r19} else {r20};
                    }
                    else {
                      r17 = (r18 + (-87)) | 0;
                    }
                    if (`UIntNative`(r17) >= `UIntNative`(r13)) 
                    {
                      break 
                    }
                    else {
                      heapClassInst.heap32[(g0)] = Int32(r15);
                      heapClassInst.heap32[(g0 + 1)] = Int32(r16);
                      heapClassInst.heap32[(g0 + 2)] = Int32(r13);
                      heapClassInst.heap32[(g0 + 3)] = Int32(r7);
                      __muldi3(i7);
                      r4 = commonVariable.r_g0;
                      r18 = commonVariable.r_g1;
                      r15 = if (`UIntNative`(r4) >= `UIntNative`(r15)) {1} else {0};
                      r19 = if (`UIntNative`(r18) >= `UIntNative`(r16)) {1} else {0};
                      r15 = if (r18 == r16) {r15} else {r19};
                      if (r15 != 0) 
                      {
                        r15 = (r17 + r4) | 0;
                        r16 = 1;
                        r17 = if (`UIntNative`(r15) < `UIntNative`(r17)) {r16} else {r7};
                        r4 = if (`UIntNative`(r15) < `UIntNative`(r4)) {r16} else {r17};
                        r16 = (r18 + r4) | 0;
                      }
                      else {
                        r15 = ( -1);
                        r16 = r15;
                      }
                      heapClassInst.heap32[(g0)] = Int32(r0);
                      r1 = (r1 + 1) | 0;
                      r5 = (r5 + (-1)) | 0;
                      sgetc(i7);
                      r4 = commonVariable.r_g0;
                    }
                  }
                  else {
                    break 
                  }
                }
              }
              if (r14 == r1) 
              {
                __label__ = 172;
                break 
              }
              else {
                r5 = r12 | 32;
                if (!(`UIntNative`(r5) > `UIntNative`(111))) 
                {
                  if (r16 > ( -1)) 
                  {
                    r5 = 1;
                    r12 = (r7 - r16) | 0;
                    r5 = if (r15 != 0) {r5} else {r7};
                    r7 = (r7 - r15) | 0;
                    r5 = (r12 - r5) | 0;
                    r15 = if (r6 != 0) {r7} else {r15};
                    r16 = if (r6 != 0) {r5} else {r16};
                  }
                }
                r5 = r8 & 255;
                if (r5 != 0) 
                {
                  continue 
                }
                else {
                  r5 = r11 & 255;
                  if (r5 == 0) 
                  {
                    r5 = r10 & 255;
                    if (r5 == 0) 
                    {
                      r5 = sp + (-4);
                      heapClassInst.heap32[(g0)] = Int32(r5);
                      heapClassInst.heap32[(g0 + 1)] = 4;
                      my_arg_test(i7);
                      r5 = commonVariable.r_g0;
                      r7 = r9 & 255;
                      if (r7 == 0) 
                      {
                        r5 = r5 >> 2;
                        r5 = Int64(heapClassInst.heap32[(r5)]);
                        r5 = r5 >> 2;
                        heapClassInst.heap32[(r5)] = Int32(r15);
                      }
                      else {
                        r5 = r5 >> 2;
                        r5 = Int64(heapClassInst.heap32[(r5)]);
                        heapClassInst.heap16[(r5) >> 1] = Int16(r15);
                      }
                    }
                    else {
                      r5 = sp + (-4);
                      heapClassInst.heap32[(g0)] = Int32(r5);
                      heapClassInst.heap32[(g0 + 1)] = 4;
                      my_arg_test(i7);
                      r5 = commonVariable.r_g0 >> 2;
                      r5 = Int64(heapClassInst.heap32[(r5)]);
                      r5 = r5 >> 2;
                      heapClassInst.heap32[(r5)] = Int32(r15);
                    }
                  }
                  else {
                    r5 = sp + (-4);
                    heapClassInst.heap32[(g0)] = Int32(r5);
                    heapClassInst.heap32[(g0 + 1)] = 4;
                    my_arg_test(i7);
                    r5 = commonVariable.r_g0 >> 2;
                    r5 = Int64(heapClassInst.heap32[(r5)]);
                    r5 = r5 >> 2;
                    heapClassInst.heap32[(r5)] = Int32(r15);
                    heapClassInst.heap32[(r5 + 1)] = Int32(r16);
                  }
                  r5 = if (`UIntNative`(r14) < `UIntNative`(r1)) {1} else {0};
                  r5 = r5 & 1;
                  r2 = (r5 + r2) | 0;
                  continue 
                }
              }
            }
            else {
              __label__ = 172;
              break 
            }
          }
          else {
            __label__ = 165;
          }
        }
      }
      else {
        if (r5 == 0) 
        {
          __label__ = 6;
          break 
        }
        else {
          r7 = (r5 + (-9)) | 0;
          if (`UIntNative`(r7) < `UIntNative`(5)) 
          {
            __label__ = 7;
          }
          else {
            __label__ = 165;
          }
        }
      }
      match (__label__) {
        case 7  =>
          r3 = (r3 + 1) | 0;
          while (true) {
            r5 = Int64(heapClassInst.heapU8[r3]);
            if (r5 == 0) 
            {
              break 
            }
            else {
              r5 = r5 << 24;
              r5 = r5 >> 24;
              r5 = r5 << 2;
              r6 = my_ctype;
              r5 = (r5 + r6) | 0;
              r5 = Int64(heapClassInst.heapU8[r5 + 4]);
              r5 = r5 & 8;
              if (r5 == 0) 
              {
                break 
              }
              else {
                r3 = (r3 + 1) | 0;
              }
            }
          }
          r6 = r4 << 2;
          r5 = my_ctype;
          r6 = (r6 + r5) | 0;
          r6 = Int64(heapClassInst.heapU8[r6 + 4]);
          r6 = r6 & 8;
          if (r6 == 0) 
          {
            continue 
          }
          else {
            __label__ = 12; 
            while (true) {
              heapClassInst.heap32[(g0)] = Int32(r0);
              sgetc(i7);
              r4 = commonVariable.r_g0;
              r6 = r4 << 2;
              r6 = (r6 + r5) | 0;
              r1 = (r1 + 1) | 0;
              r6 = Int64(heapClassInst.heapU8[r6 + 4]);
              r6 = r6 & 8;
              if (r6 == 0) 
              {
                continue 
              }
            }
          }
          // break;
        case 165 =>
          r3 = r4 & 255;
          if (r3 != r5) 
          {
            __label__ = 168;
            // break 
          }
          else {
            heapClassInst.heap32[(g0)] = Int32(r0);
            r1 = (r1 + 1) | 0;
            sgetc(i7);
            r4 = commonVariable.r_g0;
            r3 = r6;
            continue 
          }
        //   break;
        // default:
        //   break
        case _ =>
          println("break9547")
      }
    }
    else {
      __label__ = 168;
      break 
    }
  }
  do {
    match (__label__) {
      case 168 =>
        if (!(r4 > ( -1))) 
        {
          if (!(r2 != 0)) 
          {
            r2 = ( -1);
            // break 
          }
        }
        heapClassInst.heap32[(g0)] = Int32(r4);
        heapClassInst.heap32[(g0 + 1)] = Int32(r0);
        sputc(i7);
        // break;
      case 6  =>
        r2 = 0;
      //   break;
      case _  =>
         break
    }
  } while (false);
  commonVariable.r_g0 = r2;
  return;
}

func fprintf(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-32); 
  var g0 = i7 >> 2; 
  r0 = sp + (-8);
  r1 = r0 >> 2;
  r2 = swrite_Index.__fwrite__index__;
    heapClassInst.heap32[(fp + (-3))] = Int32(sp);
    heapClassInst.heap32[(r1 + 1)] = Int32(r2);
    heapClassInst.heap32[(fp + (-2))] = 3;
  r1 = _E2_str3133;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = Int32(sp);
  __v_printf(i7);
  return;
}

func sprintf(sp: Int64) : Unit
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
  i7 = sp + (-48); 
  var g0 = i7 >> 2; 
  r0 = (sp + 8) | 0;
  r1 = sp + (-16);
  r2 = r1 >> 2;
  heapClassInst.heap32[(fp + (-7))] = Int32(r0);
  r3 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heap32[(r2 + 1)] = 0;
  r4 = sp + (-24);
  heapClassInst.heap32[(fp + (-4))] = Int32(r3);
  r5 = r4 >> 2;
  r6 = swrite_Index.swrite__index__;
    heapClassInst.heap32[(r2 + 2)] = ( -2);
    heapClassInst.heap32[(r5 + 1)] = Int32(r6);
    heapClassInst.heap32[(fp + (-6))] = Int32(r1);
    r1 = Int64(heapClassInst.heap32[(fp + 1)]);
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = Int32(r0);
  __v_printf(i7);
  r0 = commonVariable.r_g0;
  if (!(r3 == 0)) 
  {
    if (!(r0 < 0)) 
    {
      r1 = 0;
      heapClassInst.heap8[r3 + r0] = Int8(r1);
    }
  }
  commonVariable.r_g0 = r0;
  return;
}

func _ZN12mandreel_b64L11b64_encode_EPKhjPcjjPNS_6B64_RCE(sp: Int64) : Unit
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
  i7 = sp + (-32); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = (r0 + 2) | 0;
  r2 = Int64(heapClassInst.heap32[(fp + 4)]);
  r1 = Int64(floor(Float64(`UIntNative`(r1) / `UIntNative`(3))));
  r3 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = r1 << 2;
  r4 = r2 >> 2;
  heapClassInst.heap32[(r4)] = 0;
  do {
    if (!(r3 == 0)) 
    {
      r5 = Int64(heapClassInst.heap32[(fp + 3)]);
      if (`UIntNative`(r1) <= `UIntNative`(r5)) 
      {
        r4 = Int64(heapClassInst.heap32[(fp)]);
        if (`UIntNative`(r0) > `UIntNative`(2)) 
        {
          r5 = (r3 + r5) | 0;
          r6 = 0;
          r12 = _ZN12mandreel_b64L9b64_charsE;
          while (true) {
            r7 = Int64(heapClassInst.heapU8[r4]);
            r8 = Int64(heapClassInst.heapU8[r4 + 1]);
            r9 = r7 << 4;
            r10 = Int64(heapClassInst.heapU8[r4 + 2]);
            r11 = r8 << 2;
            r9 = r9 & 48;
            r8 = r8 >> 4;
            r7 = r7 >> 2;
            r8 = r9 | r8;
            r9 = r11 & 60;
            r11 = r10 >> 6;
            r7 = Int64(heapClassInst.heapU8[r12 + r7]);
            r9 = r9 | r11;
            r8 = Int64(heapClassInst.heapU8[r12 + r8]);
            heapClassInst.heap8[r3] = Int8(r7);
            r7 = r10 & 63;
            r9 = Int64(heapClassInst.heapU8[r12 + r9]);
            heapClassInst.heap8[r3 + 1] = Int8(r8);
            r8 = (r3 + 4) | 0;
            r6 = (r6 + 4) | 0;
            r7 = Int64(heapClassInst.heapU8[r12 + r7]);
            heapClassInst.heap8[r3 + 2] = Int8(r9);
            heapClassInst.heap8[r3 + 3] = Int8(r7);
            if (r8 == r5) 
            {
              __label__ = 7;
            }
            else {
              if (r6 == 0) 
              {
                r7 = 13;
                r8 = (r3 + 6) | 0;
                r6 = 0;
                r9 = 10;
                heapClassInst.heap8[r3 + 4] = Int8(r7);
                heapClassInst.heap8[r3 + 5] = Int8(r9);
                r3 = r8;
                __label__ = 9;
              }
              else {
                __label__ = 7;
              }
            }
            if (__label__ == 7) {
              r3 = r8;
            }
            r0 = (r0 + (-3)) | 0;
            r4 = (r4 + 3) | 0;
            if (!(`UIntNative`(r0) > `UIntNative`(2))) 
            {
              break 
            }
          }
        }
        if (!(r0 == 0)) 
        {
          r5 = 0;
          while (true) {
            r6 = sp + (-3);
            r7 = (r4 - r5) | 0;
            r8 = (r5 + (-1)) | 0;
            r5 = (r6 - r5) | 0;
            r7 = Int64(heapClassInst.heapU8[r7]);
            heapClassInst.heap8[r5] = Int8(r7);
            r7 = (r0 + r8) | 0;
            r5 = r8;
            if (!(r7 != 0)) 
            {
              break 
            }
          }
          if (r0 != 3) 
          {
            r4 = 3;
            r5 = (r4 - r0) | 0;
            r8 = 0;
            while (true) {
              r7 = (r5 + (-1)) | 0;
              r5 = (r6 - r5) | 0;
              heapClassInst.heap8[r5 + 3] = Int8(r8);
              r5 = r7;
              if (!(r7 != 0)) 
              {
                break 
              }
            }
            heapClassInst.heap32[(g0)] = Int32(r6);
            heapClassInst.heap32[(g0 + 1)] = 3;
            heapClassInst.heap32[(g0 + 2)] = Int32(r3);
            heapClassInst.heap32[(g0 + 3)] = 12;
            heapClassInst.heap32[(g0 + 4)] = Int32(r2);
            r0 = (r4 - r0) | 0;
            _ZN12mandreel_b64L11b64_encode_EPKhjPcjjPNS_6B64_RCE(i7);
            r4 = 61;
            while (true) {
              r2 = (r0 + (-1)) | 0;
              r0 = (r3 - r0) | 0;
              heapClassInst.heap8[r0 + 4] = Int8(r4);
              r0 = r2;
              if (r2 != 0) 
              {
                continue 
              }
              else {
                break 
              }
            }
          }
          else {
            heapClassInst.heap32[(g0)] = Int32(r6);
            heapClassInst.heap32[(g0 + 1)] = 3;
            heapClassInst.heap32[(g0 + 2)] = Int32(r3);
            heapClassInst.heap32[(g0 + 3)] = 12;
            heapClassInst.heap32[(g0 + 4)] = Int32(r2);
            _ZN12mandreel_b64L11b64_encode_EPKhjPcjjPNS_6B64_RCE(i7);
            commonVariable.r_g0 = r1;
            return;
          }
        }
      }
      else {
        heapClassInst.heap32[(r4)] = 1;
        r0 = 0;
        commonVariable.r_g0 = r0;
        return;
      }
    }
  } while (false);
  commonVariable.r_g0 = r1;
  return;
}

func _ZN12mandreel_b6410b64_decodeEPKcjPvj(sp: Int64) : Unit
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
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = r0 & 3;
  r2 = 0;
  r1 = if (r1 != r2) {1} else {0};
  r1 = r1 & 1;
  r3 = r0 >> 2;
  r1 = (r1 + r3) | 0;
  r3 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = (r1 * 3) | 0;
  if (r3 != 0) 
  {
    r4 = Int64(heapClassInst.heap32[(fp + 3)]);
    if (`UIntNative`(r1) <= `UIntNative`(r4)) 
    {
      r1 = Int64(heapClassInst.heap32[(fp)]);
      r4 = r3;
      r5 = r2;
      while (true) {
        if (r0 != 0) 
        {
          r6 = Int64(heapClassInst.heapU8[r1]);
          if (r6 != 61) 
          {
            r7 = _ZN12mandreel_b64L11b64_indexesE;
            r6 = Int64(heapClassInst.heapU8[r7 + r6]);
            if (r6 != 255) 
            {
              r5 = 0;
              r7 = sp + (-4);
              heapClassInst.heap8[r7 + r2] = Int8(r6);
              __label__ = 8;
            }
            else {
              __label__ = 15;
            }
          }
          else {
            r5 = (r5 + 1) | 0;
            r6 = sp + (-4);
            r7 = 0;
            heapClassInst.heap8[r6 + r2] = Int8(r7);
            __label__ = 8;
          }
          if (__label__ == 8) {
            r2 = (r2 + 1) | 0;
            if (r2 == 4) 
            {
              r2 = Int64(heapClassInst.heapU8[sp + (-3)]);
              r6 = Int64(heapClassInst.heapU8[sp + (-4)]);
              r2 = r2 >> 4;
              r2 = r2 & 3;
              r6 = r6 << 2;
              r2 = r2 | r6;
              heapClassInst.heap8[r4] = Int8(r2);
              if (r5 != 2) 
              {
                r2 = Int64(heapClassInst.heapU8[sp + (-2)]);
                r6 = Int64(heapClassInst.heapU8[sp + (-3)]);
                r2 = r2 >> 2;
                r2 = r2 & 15;
                r6 = r6 << 4;
                r2 = r2 | r6;
                heapClassInst.heap8[r4 + 1] = Int8(r2);
                if (r5 != 1) 
                {
                  r2 = Int64(heapClassInst.heapU8[sp + (-2)]);
                  r7 = Int64(heapClassInst.heapU8[sp + (-1)]);
                  r2 = r2 << 6;
                  r6 = (r4 + 3) | 0;
                  r2 = (r2 + r7) | 0;
                  heapClassInst.heap8[r4 + 2] = Int8(r2);
                  if (r5 == 0) 
                  {
                    r2 = 0;
                    r4 = r6;
                    r5 = r2;
                  }
                  else {
                    __label__ = 18;
                    break 
                  }
                }
                else {
                  __label__ = 12;
                  break 
                }
              }
              else {
                __label__ = 10;
                break 
              }
            }
          }
          r0 = (r0 + (-1)) | 0;
          r1 = (r1 + 1) | 0;
        }
        else {
          __label__ = 17;
          break 
        }
      }
      match (__label__) {
        case 17 =>
          r6 = r4;
          // break;
        case 12 =>
          r6 = (r4 + 2) | 0;
          // break;
        case 10 =>
          r6 = (r4 + 1) | 0;
          // break;
        // default:
          // break
        case _ =>
          println("break9952")
      }
      r1 = (r6 - r3) | 0;
    }
    else {
      r1 = 0;
    }
  }
  commonVariable.r_g0 = r1;
  return;
}

func __mandreel_internal_init(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-2456); 
  var g0 = i7 >> 2; 
  r0 = swrite_Index.__mandreel_internal_SetResolution__index__;
  r1 = _ZZ24__mandreel_internal_initE54s_723478567_mandreel___mandreel_internal_SetResolution;
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  iMandreelRegisterExternalCallback(i7);
  r0 = swrite_Index.iMandreel_TextureAsync_IsCompressed__index__;
  r1 = _ZZ24__mandreel_internal_initE56s_723478567_mandreel_iMandreel_TextureAsync_IsCompressed;
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  iMandreelRegisterExternalCallback(i7);
  r0 = swrite_Index.iMandreel_TextureAsync_GetPackOffset__index__;
  r1 = _ZZ24__mandreel_internal_initE57s_723478567_mandreel_iMandreel_TextureAsync_GetPackOffset;
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  iMandreelRegisterExternalCallback(i7);
  r0 = swrite_Index.__resize__index__;
  r1 = _ZZ24__mandreel_internal_initE29s_723478567_mandreel___resize;
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  iMandreelRegisterExternalCallback(i7);
  r0 = swrite_Index.imandreel_restore_glcontext__index__;
  r1 = _ZZ24__mandreel_internal_initE48s_723478567_mandreel_imandreel_restore_glcontext;
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  iMandreelRegisterExternalCallback(i7);
  r0 = swrite_Index.imandreel_viewport_resize__index__;
  r1 = _ZZ24__mandreel_internal_initE46s_723478567_mandreel_imandreel_viewport_resize;
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  r0 = g_msgcallback;
  r0 = r0 >> 2;
  r1 = swrite_Index._Z31MandreelDefaultDebugMsgCallbackiPKc__index__;
  iMandreelRegisterExternalCallback(i7);
  r2 = _ZL7g_bInit_2E_b;
  heapClassInst.heap32[(r0)] = Int32(r1);
  r0 = Int64(heapClassInst.heapU8[r2]);
  if (r0 != 1) 
  {
    r0 = 1;
    heapClassInst.heap8[r2] = Int8(r0);
    r1 = 0;
    mandreel_audio_isLogEnabled(i7);
    r2 = if (commonVariable.r_g0 != r1) {1} else {0};
    r3 = _ZL6g_bLog;
    r2 = r2 & 1;
    heapClassInst.heap8[r3] = Int8(r2);
    mandreel_audio_useMusicFunctions(i7);
    r2 = Int64(heapClassInst.heapU8[r3]);
    if (r2 != 0) 
    {
      r2 = _E2_str35256;
      heapClassInst.heap32[(g0)] = Int32(r2);
      printf(i7);
    }
    else {
      r1 = 0;
    }
    while (true) {
      r2 = (r1 * 73) | 0;
      r3 = _ZL11g_aChannels;
      r2 = r2 << 2;
      r2 = (r3 + r2) | 0;
      r4 = (r1 * 292) | 0;
      r2 = r2 >> 2;
      r5 = _ZL15g_aFreeChannels;
      r6 = r1 << 2;
      r5 = (r5 + r6) | 0;
      r3 = (r3 + r4) | 0;
      heapClassInst.heap32[(r2 + 69)] = Int32(r1);
      r2 = (r1 + 1) | 0;
      r4 = r5 >> 2;
      heapClassInst.heap8[r3 + 269] = Int8(r0);
      heapClassInst.heap32[(r4)] = Int32(r1);
      r1 = r2;
      if (!(r2 != 32)) 
      {
        break 
      }
    }
    r1 = _ZL15g_iFreeChannels;
    r1 = r1 >> 2;
    heapClassInst.heap32[(r1)] = 32;
    mandreel_audio_init(i7);
    r1 = _E2_str22243;
    heapClassInst.heap32[(g0)] = Int32(r1);
    printf(i7);
    heapClassInst.heap32[(g0)] = 0;
    _Z30mandreel_fopen_enable_checkfatb(i7);
    r1 = _E2_str779;
    r2 = _E2_str1648;
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
    fopen(i7);
    r3 = commonVariable.r_g0;
    heapClassInst.heap32[(g0)] = 1;
    _Z30mandreel_fopen_enable_checkfatb(i7);
    if (r3 == 0) 
    {
      r4 = _E2_str24245;
      r5 = 0;
      heapClassInst.heap32[(g0)] = Int32(r4);
      _printf_error(i7);
      r4 = r5;
    }
    else {
      if (`UIntNative`(r3) < `UIntNative`(10)) 
      {
        r4 = _ZL13s_file_stdout;
        r5 = r4 >> 2;
        r5 = Int64(heapClassInst.heap32[(r5)]);
        r5 = r5 >> 2;
        r5 = Int64(heapClassInst.heap32[(r5 + 7)]);
        heapClassInst.heap32[(g0)] = Int32(r4);
        heapClassInst.heap32[(g0 + 1)] = 0;
        heapClassInst.heap32[(g0 + 2)] = 2;
        __FUNCTION_TABLE__[(r5) >> 2](i7);
      }
      else {
        r4 = r3 >> 2;
        r4 = Int64(heapClassInst.heap32[(r4)]);
        r4 = r4 >> 2;
        r4 = Int64(heapClassInst.heap32[(r4 + 7)]);
        heapClassInst.heap32[(g0)] = Int32(r3);
        heapClassInst.heap32[(g0 + 1)] = 0;
        heapClassInst.heap32[(g0 + 2)] = 2;
        __FUNCTION_TABLE__[(r4) >> 2](i7);
        r4 = r3;
      }
      r5 = r4 >> 2;
      r5 = Int64(heapClassInst.heap32[(r5)]);
      r5 = r5 >> 2;
      r5 = Int64(heapClassInst.heap32[(r5 + 5)]);
      heapClassInst.heap32[(g0)] = Int32(r4);
      __FUNCTION_TABLE__[(r5) >> 2](i7);
      r4 = commonVariable.r_g0;
      if (`UIntNative`(r3) > `UIntNative`(9)) 
      {
        r5 = r3;
      }
      else {
        r5 = _ZL13s_file_stdout;
      }
      r6 = r5 >> 2;
      r6 = Int64(heapClassInst.heap32[(r6)]);
      r6 = r6 >> 2;
      r6 = Int64(heapClassInst.heap32[(r6 + 7)]);
      heapClassInst.heap32[(g0)] = Int32(r5);
      heapClassInst.heap32[(g0 + 1)] = 0;
      heapClassInst.heap32[(g0 + 2)] = 0;
      __FUNCTION_TABLE__[(r6) >> 2](i7);
      r5 = (r4 + 1) | 0;
      heapClassInst.heap32[(g0)] = Int32(r5);
      mallocNew(i7);
      r5 = commonVariable.r_g0;
      if (`UIntNative`(r3) < `UIntNative`(10)) 
      {
        r6 = _ZL13s_file_stdout;
        r7 = r6 >> 2;
        r7 = Int64(heapClassInst.heap32[(r7)]);
        r7 = r7 >> 2;
        r7 = Int64(heapClassInst.heap32[(r7 + 1)]);
        heapClassInst.heap32[(g0)] = Int32(r6);
        heapClassInst.heap32[(g0 + 1)] = Int32(r5);
        heapClassInst.heap32[(g0 + 2)] = 1;
        heapClassInst.heap32[(g0 + 3)] = Int32(r4);
        r8 = 0;
        __FUNCTION_TABLE__[(r7) >> 2](i7);
        heapClassInst.heap8[r5 + r4] = Int8(r8);
      }
      else {
        r6 = r3 >> 2;
        r6 = Int64(heapClassInst.heap32[(r6)]);
        r6 = r6 >> 2;
        r6 = Int64(heapClassInst.heap32[(r6 + 1)]);
        heapClassInst.heap32[(g0)] = Int32(r3);
        heapClassInst.heap32[(g0 + 1)] = Int32(r5);
        heapClassInst.heap32[(g0 + 2)] = 1;
        heapClassInst.heap32[(g0 + 3)] = Int32(r4);
        r7 = 0;
        __FUNCTION_TABLE__[(r6) >> 2](i7);
        heapClassInst.heap8[r5 + r4] = Int8(r7);
        r6 = r3;
      }
      r7 = r6 >> 2;
      r7 = Int64(heapClassInst.heap32[(r7)]);
      r7 = r7 >> 2;
      r7 = Int64(heapClassInst.heap32[(r7 + 4)]);
      heapClassInst.heap32[(g0)] = Int32(r6);
      __FUNCTION_TABLE__[(r7) >> 2](i7);
      if (`UIntNative`(r3) > `UIntNative`(9)) 
      {
        heapClassInst.heap32[(g0)] = Int32(r6);
        _ZdlPv(i7);
      }
    }
    r3 = sp + (-128);
    heapClassInst.heap32[(g0)] = Int32(r3);
    mandreel_audio_getAudioDriverName(i7);
    r6 = _E2_str4225;
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0 + 1)] = Int32(r6);
    strcmp(i7);
    r3 = commonVariable.r_g0;
    if (!(r5 == 0)) 
    {
      do {
        if (!(r4 < 1)) 
        {
          r6 = sp + (-1408);
          r7 = (r6 + 1) | 0;
          r8 = (r5 + 1) | 0;
          r9 = 0;
          while (true) {
            r10 = (r5 + r9) | 0;
            r11 = Int64(heapClassInst.heapU8[r5 + r9]);
            if (!(r11 == 13)) 
            {
              if (r9 < r4) 
              {
                r11 = r9;
                while (true) {
                  r9 = (r11 + 1) | 0;
                  r11 = Int64(heapClassInst.heapU8[r8 + r11]);
                  if (r11 == 13) 
                  {
                    break 
                  }
                  else {
                    r11 = r9;
                    if (!(r9 < r4)) 
                    {
                      break 
                    }
                  }
                }
              }
            }
            r11 = _ZL10strtok_pos;
            r12 = 0;
            r11 = r11 >> 2;
            heapClassInst.heap8[r5 + r9] = Int8(r12);
            r13 = Int64(heapClassInst.heap32[(r11)]);
            r9 = (r9 + 2) | 0;
            r10 = if (r10 == 0) {r13} else {r10};
            while (true) {
              r13 = Int64(heapClassInst.heapU8[r10]);
              if (r13 == 0) 
              {
                __label__ = 44;
                break 
              }
              else {
                r14 = r12;
                while (true) {
                  if (r14 == ( -1)) 
                  {
                    __label__ = 34;
                    break 
                  }
                  else {
                    r15 = _E2_str4133;
                    r15 = (r15 - r14) | 0;
                    r16 = r13 & 255;
                    r15 = Int64(heapClassInst.heapU8[r15]);
                    if (r16 != r15) 
                    {
                      r14 = (r14 + (-1)) | 0;
                    }
                    else {
                      break 
                    }
                  }
                }
                r10 = (r10 + 1) | 0;
              }
            }
            do {
              if (__label__ == 34) {
                if (r13 == 0) 
                {
                  __label__ = 44;
                }
                else {
                  r12 = r10;
                  while (true) {
                    r13 = Int64(heapClassInst.heapU8[r12]);
                    if (r13 == 0) 
                    {
                      break 
                    }
                    else {
                      r14 = r0;
                      while (true) {
                        if (r14 != 0) 
                        {
                          r15 = _E2_str4133;
                          r15 = (r15 - r14) | 0;
                          r16 = r13 & 255;
                          r15 = Int64(heapClassInst.heapU8[r15 + 1]);
                          if (r16 == r15) 
                          {
                            break 
                          }
                          else {
                            r14 = (r14 + (-1)) | 0;
                          }
                        }
                        else {
                          break 
                        }
                      }
                      r12 = (r12 + 1) | 0;
                    }
                  }
                  r13 = Int64(heapClassInst.heapU8[r12]);
                  if (r13 != 0) 
                  {
                    r13 = (r12 + 1) | 0;
                    r14 = 0;
                    heapClassInst.heap8[r12] = Int8(r14);
                    r12 = r13;
                  }
                  heapClassInst.heap32[(r11)] = Int32(r12);
                  r13 = _E2_str26247;
                  heapClassInst.heap32[(g0)] = Int32(r13);
                  heapClassInst.heap32[(g0 + 1)] = Int32(r10);
                  strcmp(i7);
                  r13 = commonVariable.r_g0;
                  if (r13 != 0) 
                  {
                    r13 = _E2_str29250;
                    heapClassInst.heap32[(g0)] = Int32(r13);
                    heapClassInst.heap32[(g0 + 1)] = Int32(r10);
                    strcmp(i7);
                    r13 = commonVariable.r_g0;
                    if (r13 != 0) 
                    {
                      if (r3 != 0) 
                      {
                        __label__ = 66;
                        break 
                      }
                      else {
                        r13 = _E2_str32253;
                        heapClassInst.heap32[(g0)] = Int32(r13);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r10);
                        strcmp(i7);
                        r13 = commonVariable.r_g0;
                        if (r13 != 0) 
                        {
                          r13 = _E2_str33254;
                          heapClassInst.heap32[(g0)] = Int32(r13);
                          heapClassInst.heap32[(g0 + 1)] = Int32(r10);
                          strcmp(i7);
                          r10 = commonVariable.r_g0;
                          if (r10 != 0) 
                          {
                            __label__ = 66;
                            break 
                          }
                          else {
                            __label__ = 173; 
                            while (true) {
                              r10 = Int64(heapClassInst.heapU8[r12]);
                              if (r10 == 0) 
                              {
                                __label__ = 175;
                                break 
                              }
                              else {
                                r13 = 0;
                                while (true) {
                                  if (r13 == ( -1)) 
                                  {
                                    __label__ = 176;
                                    break 
                                  }
                                  else {
                                    r14 = _E2_str4133;
                                    r14 = (r14 - r13) | 0;
                                    r15 = r10 & 255;
                                    r14 = Int64(heapClassInst.heapU8[r14]);
                                    if (r15 != r14) 
                                    {
                                      r13 = (r13 + (-1)) | 0;
                                    }
                                    else {
                                      break 
                                    }
                                  }
                                }
                                r12 = (r12 + 1) | 0;
                              }
                            }
                            if (__label__ == 176) {
                              if (r10 == 0) 
                              {
                                __label__ = 175;
                              }
                              else {
                                r13 = r12;
                                while (true) {
                                  r10 = Int64(heapClassInst.heapU8[r13]);
                                  if (r10 == 0) 
                                  {
                                    break 
                                  }
                                  else {
                                    r14 = 1;
                                    while (true) {
                                      if (r14 != 0) 
                                      {
                                        r15 = _E2_str4133;
                                        r15 = (r15 - r14) | 0;
                                        r16 = r10 & 255;
                                        r15 = Int64(heapClassInst.heapU8[r15 + 1]);
                                        if (r16 == r15) 
                                        {
                                          break 
                                        }
                                        else {
                                          r14 = (r14 + (-1)) | 0;
                                        }
                                      }
                                      else {
                                        break 
                                      }
                                    }
                                    r13 = (r13 + 1) | 0;
                                  }
                                }
                                r10 = Int64(heapClassInst.heapU8[r13]);
                                if (r10 != 0) 
                                {
                                  r14 = (r13 + 1) | 0;
                                  r10 = 0;
                                  heapClassInst.heap8[r13] = Int8(r10);
                                  r10 = r12;
                                  r12 = r14;
                                  __label__ = 187;
                                }
                                else {
                                  r10 = r12;
                                  r12 = r13;
                                  __label__ = 187;
                                }
                              }
                            }
                            if (__label__ == 175) {
                              r10 = 0;
                            }
                            heapClassInst.heap32[(r11)] = Int32(r12);
                            r11 = sp + (-384);
                            heapClassInst.heap32[(g0)] = Int32(r11);
                            heapClassInst.heap32[(g0 + 1)] = Int32(r10);
                            strcpy(i7);
                            __label__ = 66;
                            break 
                          }
                        }
                        else {
                          while (true) {
                            r10 = Int64(heapClassInst.heapU8[r12]);
                            if (r10 == 0) 
                            {
                              __label__ = 155;
                              break 
                            }
                            else {
                              r13 = 0;
                              while (true) {
                                if (r13 == ( -1)) 
                                {
                                  __label__ = 156;
                                  break 
                                }
                                else {
                                  r14 = _E2_str4133;
                                  r14 = (r14 - r13) | 0;
                                  r15 = r10 & 255;
                                  r14 = Int64(heapClassInst.heapU8[r14]);
                                  if (r15 != r14) 
                                  {
                                    r13 = (r13 + (-1)) | 0;
                                  }
                                  else {
                                    break 
                                  }
                                }
                              }
                              r12 = (r12 + 1) | 0;
                            }
                          }
                          if (__label__ == 156) {
                            if (r10 == 0) 
                            {
                              __label__ = 155;
                            }
                            else {
                              r13 = r12;
                              while (true) {
                                r10 = Int64(heapClassInst.heapU8[r13]);
                                if (r10 == 0) 
                                {
                                  break 
                                }
                                else {
                                  r14 = 1;
                                  while (true) {
                                    if (r14 != 0) 
                                    {
                                      r15 = _E2_str4133;
                                      r15 = (r15 - r14) | 0;
                                      r16 = r10 & 255;
                                      r15 = Int64(heapClassInst.heapU8[r15 + 1]);
                                      if (r16 == r15) 
                                      {
                                        break 
                                      }
                                      else {
                                        r14 = (r14 + (-1)) | 0;
                                      }
                                    }
                                    else {
                                      break 
                                    }
                                  }
                                  r13 = (r13 + 1) | 0;
                                }
                              }
                              r10 = Int64(heapClassInst.heapU8[r13]);
                              if (r10 != 0) 
                              {
                                r14 = (r13 + 1) | 0;
                                r10 = 0;
                                heapClassInst.heap8[r13] = Int8(r10);
                                r10 = r12;
                                r12 = r14;
                                __label__ = 167;
                              }
                              else {
                                r10 = r12;
                                r12 = r13;
                                __label__ = 167;
                              }
                            }
                          }
                          if (__label__ == 155) {
                            r10 = 0;
                          }
                          heapClassInst.heap32[(r11)] = Int32(r12);
                          r11 = sp + (-2432);
                          r12 = _E2_str12233;
                          r13 = sp + (-384);
                          heapClassInst.heap32[(g0)] = Int32(r11);
                          heapClassInst.heap32[(g0 + 1)] = Int32(r12);
                          heapClassInst.heap32[(g0 + 2)] = Int32(r13);
                          heapClassInst.heap32[(g0 + 3)] = Int32(r10);
                          sprintf(i7);
                          heapClassInst.heap32[(g0)] = Int32(r11);
                          mandreel_add_valid_fopenfile(i7);
                          __label__ = 66;
                          break 
                        }
                      }
                    }
                    else {
                      r10 = (r12 + 1) | 0;
                      r13 = 0;
                      r14 = r12;
                      while (true) {
                        r15 = Int64(heapClassInst.heapU8[r12 + r13]);
                        if (r15 == 0) 
                        {
                          __label__ = 85;
                          break 
                        }
                        else {
                          r16 = 0;
                          while (true) {
                            if (r16 == ( -1)) 
                            {
                              __label__ = 75;
                              break 
                            }
                            else {
                              r17 = _E2_str4133;
                              r17 = (r17 - r16) | 0;
                              r18 = r15 & 255;
                              r17 = Int64(heapClassInst.heapU8[r17]);
                              if (r18 != r17) 
                              {
                                r16 = (r16 + (-1)) | 0;
                              }
                              else {
                                break 
                              }
                            }
                          }
                          r13 = (r13 + 1) | 0;
                          r14 = (r14 + 1) | 0;
                          r10 = (r10 + 1) | 0;
                        }
                      }
                      do {
                        if (__label__ == 75) {
                          if (r15 == 0) 
                          {
                            __label__ = 85;
                          }
                          else {
                            r15 = (r12 + r13) | 0;
                            while (true) {
                              r16 = Int64(heapClassInst.heapU8[r14]);
                              if (r16 == 0) 
                              {
                                break 
                              }
                              else {
                                r17 = 1;
                                while (true) {
                                  if (r17 != 0) 
                                  {
                                    r18 = _E2_str4133;
                                    r18 = (r18 - r17) | 0;
                                    r19 = r16 & 255;
                                    r18 = Int64(heapClassInst.heapU8[r18 + 1]);
                                    if (r19 == r18) 
                                    {
                                      break 
                                    }
                                    else {
                                      r17 = (r17 + (-1)) | 0;
                                    }
                                  }
                                  else {
                                    break 
                                  }
                                }
                                r14 = (r14 + 1) | 0;
                              }
                            }
                            r16 = Int64(heapClassInst.heapU8[r14]);
                            if (r16 != 0) 
                            {
                              r16 = (r14 + 1) | 0;
                              r17 = 0;
                              heapClassInst.heap8[r14] = Int8(r17);
                              r14 = r16;
                            }
                            r17 = 0;
                            r16 = if (r15 == r17) {1} else {0};
                            heapClassInst.heap32[(r11)] = Int32(r14);
                            while (true) {
                              r18 = Int64(heapClassInst.heapU8[r14]);
                              if (r18 == 0) 
                              {
                                __label__ = 103;
                                break 
                              }
                              else {
                                r19 = r17;
                                while (true) {
                                  if (r19 == ( -1)) 
                                  {
                                    __label__ = 93;
                                    break 
                                  }
                                  else {
                                    r20 = _E2_str4133;
                                    r20 = (r20 - r19) | 0;
                                    r21 = r18 & 255;
                                    r20 = Int64(heapClassInst.heapU8[r20]);
                                    if (r21 != r20) 
                                    {
                                      r19 = (r19 + (-1)) | 0;
                                    }
                                    else {
                                      break 
                                    }
                                  }
                                }
                                r14 = (r14 + 1) | 0;
                              }
                            }
                            if (__label__ == 93) {
                              if (!(r18 == 0)) 
                              {
                                r17 = r14;
                                while (true) {
                                  r18 = Int64(heapClassInst.heapU8[r17]);
                                  if (r18 == 0) 
                                  {
                                    break 
                                  }
                                  else {
                                    r19 = 1;
                                    while (true) {
                                      if (r19 != 0) 
                                      {
                                        r20 = _E2_str4133;
                                        r20 = (r20 - r19) | 0;
                                        r21 = r18 & 255;
                                        r20 = Int64(heapClassInst.heapU8[r20 + 1]);
                                        if (r21 == r20) 
                                        {
                                          break 
                                        }
                                        else {
                                          r19 = (r19 + (-1)) | 0;
                                        }
                                      }
                                      else {
                                        break 
                                      }
                                    }
                                    r17 = (r17 + 1) | 0;
                                  }
                                }
                                r18 = Int64(heapClassInst.heapU8[r17]);
                                if (r18 != 0) 
                                {
                                  r18 = (r17 + 1) | 0;
                                  r19 = 0;
                                  heapClassInst.heap8[r17] = Int8(r19);
                                  r17 = r18;
                                }
                                heapClassInst.heap32[(r11)] = Int32(r17);
                                while (true) {
                                  r18 = Int64(heapClassInst.heapU8[r17]);
                                  if (r18 == 0) 
                                  {
                                    __label__ = 121;
                                    break 
                                  }
                                  else {
                                    r19 = 0;
                                    while (true) {
                                      if (r19 == ( -1)) 
                                      {
                                        __label__ = 111;
                                        break 
                                      }
                                      else {
                                        r20 = _E2_str4133;
                                        r20 = (r20 - r19) | 0;
                                        r21 = r18 & 255;
                                        r20 = Int64(heapClassInst.heapU8[r20]);
                                        if (r21 != r20) 
                                        {
                                          r19 = (r19 + (-1)) | 0;
                                        }
                                        else {
                                          break
                                        }
                                      }
                                    }
                                    r17 = (r17 + 1) | 0;
                                  }
                                }
                                if (__label__ == 111) {
                                  if (!(r18 == 0)) 
                                  {
                                    r15 = r17;
                                    while (true) {
                                      r16 = Int64(heapClassInst.heapU8[r15]);
                                      if (r16 == 0) 
                                      {
                                        break 
                                      }
                                      else {
                                        r18 = 1;
                                        while (true) {
                                          if (r18 != 0) 
                                          {
                                            r19 = _E2_str4133;
                                            r19 = (r19 - r18) | 0;
                                            r20 = r16 & 255;
                                            r19 = Int64(heapClassInst.heapU8[r19 + 1]);
                                            if (r20 == r19) 
                                            {
                                              break 
                                            }
                                            else {
                                              r18 = (r18 + (-1)) | 0;
                                            }
                                          }
                                          else {
                                            break 
                                          }
                                        }
                                        r15 = (r15 + 1) | 0;
                                      }
                                    }
                                    r16 = Int64(heapClassInst.heapU8[r15]);
                                    if (r16 != 0) 
                                    {
                                      r16 = (r15 + 1) | 0;
                                      r18 = 0;
                                      heapClassInst.heap8[r15] = Int8(r18);
                                      r15 = r16;
                                    }
                                    heapClassInst.heap32[(r11)] = Int32(r15);
                                    heapClassInst.heap32[(g0)] = 264;
                                    _Znwj(i7);
                                    r11 = commonVariable.r_g0;
                                    heapClassInst.heap32[(g0)] = Int32(r17);
                                    heapClassInst.heap32[(g0 + 1)] = 0;
                                    r15 = 0;
                                    r16 = ( -1);
                                    r17 = r11 >> 2;
                                    strtol(i7);
                                    heapClassInst.heap32[(r17 + 64)] = Int32(commonVariable.r_g0);
                                    while (true) {
                                      r17 = r15;
                                      r18 = Int64(heapClassInst.heapU8[r10 + r17]);
                                      if (r18 != 46) 
                                      {
                                        if (r18 == 0) 
                                        {
                                          break 
                                        }
                                        else {
                                          if (!(r18 == 47)) 
                                          {
                                            r15 = (r17 + 1) | 0;
                                            if (r18 != 92) 
                                            {
                                              continue 
                                            }
                                          }
                                          r16 = ( -1);
                                        }
                                      }
                                      else {
                                        r16 = r17;
                                      }
                                      r15 = (r17 + 1) | 0;
                                    }
                                    if (r16 == ( -1)) 
                                    {
                                      r10 = (r12 + r13) | 0;
                                      r12 = _E2_str12233;
                                      r10 = (r10 + 1) | 0;
                                      r15 = _E2_str2131;
                                      heapClassInst.heap32[(g0)] = Int32(r6);
                                      heapClassInst.heap32[(g0 + 1)] = Int32(r12);
                                      heapClassInst.heap32[(g0 + 2)] = Int32(r10);
                                      heapClassInst.heap32[(g0 + 3)] = Int32(r15);
                                      sprintf(i7);
                                    }
                                    else {
                                      do {
                                        if (r16 > 0) 
                                        {
                                          r10 = (r12 + 1) | 0;
                                          r12 = 0;
                                          while (true) {
                                            r15 = (r12 + r10) | 0;
                                            r17 = (r12 + 1) | 0;
                                            r15 = Int64(heapClassInst.heapU8[r15 + r13]);
                                            heapClassInst.heap8[r6 + r12] = Int8(r15);
                                            r12 = r17;
                                            if (!(r16 != r17)) 
                                            {
                                              break 
                                            }
                                          }
                                        }
                                        else {
                                          r16 = 0;
                                        }
                                      } while (false);
                                      r10 = (r6 + r16) | 0;
                                      r12 = _E2_str2131;
                                      heapClassInst.heap32[(g0)] = Int32(r10);
                                      heapClassInst.heap32[(g0 + 1)] = Int32(r12);
                                      strcpy(i7);
                                    }
                                    r10 = Int64(heapClassInst.heapU8[sp + (-1408)]);
                                    do {
                                      if (r10 == 0) 
                                      {
                                        r15 = r11;
                                      }
                                      else {
                                        r12 = r7;
                                        r15 = r11;
                                        while (true) {
                                          r16 = r10 & 255;
                                          if (r16 != 92) 
                                          {
                                            r16 = r10 << 24;
                                            r16 = r16 >> 24;
                                            r16 = (r16 + (-65)) | 0;
                                            r13 = 26;
                                            r17 = (r10 + 32) | 0;
                                            r10 = if (`UIntNative`(r16) < `UIntNative`(r13)) {r17} else {r10};
                                          }
                                          else {
                                            r10 = 47;
                                          }
                                          heapClassInst.heap8[r15] = Int8(r10);
                                          r10 = Int64(heapClassInst.heapU8[r12]);
                                          r15 = (r15 + 1) | 0;
                                          r12 = (r12 + 1) | 0;
                                          if (!(r10 != 0)) 
                                          {
                                            break 
                                          }
                                        }
                                      }
                                    } while (false);
                                    r10 = _ZL21g_pFirstSoundDuration;
                                    r12 = 0;
                                    r10 = r10 >> 2;
                                    heapClassInst.heap8[r15] = Int8(r12);
                                    r12 = r11 >> 2;
                                    r15 = Int64(heapClassInst.heap32[(r10)]);
                                    heapClassInst.heap32[(r12 + 65)] = Int32(r15);
                                    heapClassInst.heap32[(r10)] = Int32(r11);
                                    r10 = Int64(heapClassInst.heapU8[r14]);
                                    if (r10 == 48) 
                                    {
                                      __label__ = 66;
                                      break 
                                    }
                                    else {
                                      heapClassInst.heap32[(g0)] = Int32(r11);
                                      heapClassInst.heap32[(g0 + 1)] = 0;
                                      mandreel_audio_createBuffer(i7);
                                      __label__ = 66;
                                      break 
                                    }
                                  }
                                }
                                heapClassInst.heap32[(r11)] = Int32(r17);
                                __label__ = 146;
                                break 
                              }
                            }
                            heapClassInst.heap32[(r11)] = Int32(r14);
                            __label__ = 146;
                          }
                        }
                      } while (false);
                      if (__label__ == 85) {
                        r16 = 1;
                        r15 = 0;
                        r10 = (r12 + r13) | 0;
                        heapClassInst.heap32[(r11)] = Int32(r10);
                      }
                      r10 = _E2_str30251;
                      r11 = _E2_str31252;
                      r10 = if (r16 != 0) {r10} else {r15};
                      heapClassInst.heap32[(g0)] = Int32(r11);
                      heapClassInst.heap32[(g0 + 1)] = Int32(r10);
                      _printf_warning(i7);
                      __label__ = 66;
                      break 
                    }
                  }
                  else {
                    while (true) {
                      r10 = Int64(heapClassInst.heapU8[r12]);
                      if (r10 == 0) 
                      {
                        __label__ = 52;
                        break 
                      }
                      else {
                        r13 = 0;
                        while (true) {
                          if (r13 == ( -1)) 
                          {
                            __label__ = 53;
                            break 
                          }
                          else {
                            r14 = _E2_str4133;
                            r14 = (r14 - r13) | 0;
                            r15 = r10 & 255;
                            r14 = Int64(heapClassInst.heapU8[r14]);
                            if (r15 != r14) 
                            {
                              r13 = (r13 + (-1)) | 0;
                            }
                            else {
                              break 
                            }
                          }
                        }
                        r12 = (r12 + 1) | 0;
                      }
                    }
                    if (__label__ == 53) {
                      if (r10 == 0) 
                      {
                        __label__ = 52;
                      }
                      else {
                        r13 = r12;
                        while (true) {
                          r10 = Int64(heapClassInst.heapU8[r13]);
                          if (r10 == 0) 
                          {
                            break 
                          }
                          else {
                            r14 = 1;
                            while (true) {
                              if (r14 != 0) 
                              {
                                r15 = _E2_str4133;
                                r15 = (r15 - r14) | 0;
                                r16 = r10 & 255;
                                r15 = Int64(heapClassInst.heapU8[r15 + 1]);
                                if (r16 == r15) 
                                {
                                  break 
                                }
                                else {
                                  r14 = (r14 + (-1)) | 0;
                                }
                              }
                              else {
                                break 
                              }
                            }
                            r13 = (r13 + 1) | 0;
                          }
                        }
                        r10 = Int64(heapClassInst.heapU8[r13]);
                        if (r10 != 0) 
                        {
                          r14 = (r13 + 1) | 0;
                          r10 = 0;
                          heapClassInst.heap8[r13] = Int8(r10);
                          r10 = r12;
                          r12 = r14;
                          __label__ = 64;
                        }
                        else {
                          r10 = r12;
                          r12 = r13;
                          __label__ = 64;
                        }
                      }
                    }
                    if (__label__ == 52) {
                      r10 = 0;
                    }
                    heapClassInst.heap32[(r11)] = Int32(r12);
                    r11 = _E2_str27248;
                    heapClassInst.heap32[(g0)] = Int32(r10);
                    heapClassInst.heap32[(g0 + 1)] = Int32(r11);
                    strcmp(i7);
                    r12 = commonVariable.r_g0;
                    if (r12 == 0) 
                    {
                      __label__ = 66;
                    }
                    else {
                      r12 = _E2_str28249;
                      heapClassInst.heap32[(g0)] = Int32(r12);
                      heapClassInst.heap32[(g0 + 1)] = Int32(r10);
                      heapClassInst.heap32[(g0 + 2)] = Int32(r11);
                      _printf_error(i7);
                      __label__ = 66;
                    }
                  }
                }
              }
            } while (false);
            if (__label__ == 44) {
              heapClassInst.heap32[(r11)] = Int32(r10);
            }
            if (!(r9 < r4)) 
            {
              break 
            }
          }
        }
      } while (false);
      heapClassInst.heap32[(g0)] = Int32(r5);
      free(i7);
    }
    __mandreel_internal_CreateWindow(i7);
    heapClassInst.heap32[(g0)] = 0;
    _Z30mandreel_fopen_enable_checkfatb(i7);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
    fopen(i7);
    r0 = commonVariable.r_g0;
    heapClassInst.heap32[(g0)] = 1;
    _Z30mandreel_fopen_enable_checkfatb(i7);
    if (!(r0 == 0)) 
    {
      if (`UIntNative`(r0) < `UIntNative`(10)) 
      {
        r1 = _ZL13s_file_stdout;
        r2 = r1 >> 2;
        r2 = Int64(heapClassInst.heap32[(r2)]);
        r2 = r2 >> 2;
        r2 = Int64(heapClassInst.heap32[(r2 + 7)]);
        heapClassInst.heap32[(g0)] = Int32(r1);
        heapClassInst.heap32[(g0 + 1)] = 0;
        heapClassInst.heap32[(g0 + 2)] = 2;
        __FUNCTION_TABLE__[(r2) >> 2](i7);
      }
      else {
        r1 = r0 >> 2;
        r1 = Int64(heapClassInst.heap32[(r1)]);
        r1 = r1 >> 2;
        r1 = Int64(heapClassInst.heap32[(r1 + 7)]);
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = 0;
        heapClassInst.heap32[(g0 + 2)] = 2;
        __FUNCTION_TABLE__[(r1) >> 2](i7);
        r1 = r0;
      }
      r2 = r1 >> 2;
      r2 = Int64(heapClassInst.heap32[(r2)]);
      r2 = r2 >> 2;
      r2 = Int64(heapClassInst.heap32[(r2 + 5)]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      __FUNCTION_TABLE__[(r2) >> 2](i7);
      r1 = commonVariable.r_g0;
      if (`UIntNative`(r0) > `UIntNative`(9)) 
      {
        r2 = r0;
      }
      else {
        r2 = _ZL13s_file_stdout;
      }
      r3 = r2 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3)]);
      r3 = r3 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3 + 7)]);
      heapClassInst.heap32[(g0)] = Int32(r2);
      heapClassInst.heap32[(g0 + 1)] = 0;
      heapClassInst.heap32[(g0 + 2)] = 0;
      __FUNCTION_TABLE__[(r3) >> 2](i7);
      r2 = (r1 + 1) | 0;
      heapClassInst.heap32[(g0)] = Int32(r2);
      mallocNew(i7);
      r2 = commonVariable.r_g0;
      if (`UIntNative`(r0) < `UIntNative`(10)) 
      {
        r3 = _ZL13s_file_stdout;
        r4 = r3 >> 2;
        r4 = Int64(heapClassInst.heap32[(r4)]);
        r4 = r4 >> 2;
        r4 = Int64(heapClassInst.heap32[(r4 + 1)]);
        heapClassInst.heap32[(g0)] = Int32(r3);
        heapClassInst.heap32[(g0 + 1)] = Int32(r2);
        heapClassInst.heap32[(g0 + 2)] = 1;
        heapClassInst.heap32[(g0 + 3)] = Int32(r1);
        r5 = 0;
        __FUNCTION_TABLE__[(r4) >> 2](i7);
        heapClassInst.heap8[r2 + r1] = Int8(r5);
      }
      else {
        r3 = r0 >> 2;
        r3 = Int64(heapClassInst.heap32[(r3)]);
        r3 = r3 >> 2;
        r3 = Int64(heapClassInst.heap32[(r3 + 1)]);
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r2);
        heapClassInst.heap32[(g0 + 2)] = 1;
        heapClassInst.heap32[(g0 + 3)] = Int32(r1);
        r4 = 0;
        __FUNCTION_TABLE__[(r3) >> 2](i7);
        heapClassInst.heap8[r2 + r1] = Int8(r4);
        r3 = r0;
      }
      r4 = r3 >> 2;
      r4 = Int64(heapClassInst.heap32[(r4)]);
      r4 = r4 >> 2;
      r4 = Int64(heapClassInst.heap32[(r4 + 4)]);
      heapClassInst.heap32[(g0)] = Int32(r3);
      __FUNCTION_TABLE__[(r4) >> 2](i7);
      if (!(`UIntNative`(r0) < `UIntNative`(10))) 
      {
        heapClassInst.heap32[(g0)] = Int32(r3);
        _ZdlPv(i7);
      }
      if (!(r2 == 0)) 
      {
        r0 = (r2 + 1) | 0;
        r3 = ( -1);
        r4 = 0;
        r5 = r4;
        while (true) {
          r6 = r3;
          while (true) {
            if (r5 < r1) 
            {
              r3 = (r2 + r5) | 0;
              r7 = Int64(heapClassInst.heapU8[r2 + r5]);
              if (r7 == 13) 
              {
                r7 = r5;
              }
              else {
                while (true) {
                  r7 = (r5 + 1) | 0;
                  r5 = Int64(heapClassInst.heapU8[r0 + r5]);
                  if (r5 == 13) 
                  {
                    break 
                  }
                  else {
                    r5 = r7;
                    if (!(r7 < r1)) 
                    {
                      break 
                    }
                  }
                }
              }
              r5 = _ZL10strtok_pos;
              r8 = 0;
              r9 = r5 >> 2;
              heapClassInst.heap8[r2 + r7] = Int8(r8);
              r10 = Int64(heapClassInst.heap32[(r9)]);
              r5 = (r7 + 2) | 0;
              r3 = if (r3 == 0) {r10} else {r3};
              while (true) {
                r7 = Int64(heapClassInst.heapU8[r3]);
                if (r7 == 0) 
                {
                  __label__ = 224;
                  break 
                }
                else {
                  r10 = r8;
                  while (true) {
                    if (r10 == ( -1)) 
                    {
                      __label__ = 214;
                      break 
                    }
                    else {
                      r11 = _E2_str4133;
                      r11 = (r11 - r10) | 0;
                      r12 = r7 & 255;
                      r11 = Int64(heapClassInst.heapU8[r11]);
                      if (r12 != r11) 
                      {
                        r10 = (r10 + (-1)) | 0;
                      }
                      else {
                        break 
                      }
                    }
                  }
                  r3 = (r3 + 1) | 0;
                }
              }
              if (__label__ == 214) {
                if (!(r7 == 0)) 
                {
                  r7 = r3;
                  while (true) {
                    r8 = Int64(heapClassInst.heapU8[r7]);
                    if (r8 == 0) 
                    {
                      break 
                    }
                    else {
                      r10 = 1;
                      while (true) {
                        if (r10 != 0) 
                        {
                          r11 = _E2_str4133;
                          r11 = (r11 - r10) | 0;
                          r12 = r8 & 255;
                          r11 = Int64(heapClassInst.heapU8[r11 + 1]);
                          if (r12 == r11) 
                          {
                            break 
                          }
                          else {
                            r10 = (r10 + (-1)) | 0;
                          }
                        }
                        else {
                          break 
                        }
                      }
                      r7 = (r7 + 1) | 0;
                    }
                  }
                  r8 = Int64(heapClassInst.heapU8[r7]);
                  if (r8 != 0) 
                  {
                    r8 = (r7 + 1) | 0;
                    r10 = 0;
                    heapClassInst.heap8[r7] = Int8(r10);
                    r7 = r8;
                  }
                  heapClassInst.heap32[(r9)] = Int32(r7);
                  r8 = _E2_str3782;
                  heapClassInst.heap32[(g0)] = Int32(r8);
                  heapClassInst.heap32[(g0 + 1)] = Int32(r3);
                  strcmp(i7);
                  r8 = commonVariable.r_g0;
                  if (r8 != 0) 
                  {
                    r8 = _E2_str5784;
                    heapClassInst.heap32[(g0)] = Int32(r8);
                    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
                    strcmp(i7);
                    r8 = commonVariable.r_g0;
                    if (r8 != 0) 
                    {
                      r7 = _E2_str6785;
                      heapClassInst.heap32[(g0)] = Int32(r7);
                      heapClassInst.heap32[(g0 + 1)] = Int32(r3);
                      r3 = ( -1);
                      strcmp(i7);
                      r7 = commonVariable.r_g0;
                      if (r7 != 0) 
                      {
                        continue 
                      }
                      else {
                        continue 
                      }
                    }
                    else {
                      break 
                    }
                  }
                  else {
                    while (true) {
                      r3 = Int64(heapClassInst.heapU8[r7]);
                      if (r3 == 0) 
                      {
                        __label__ = 242;
                        break 
                      }
                      else {
                        r8 = 0;
                        while (true) {
                          if (r8 == ( -1)) 
                          {
                            __label__ = 232;
                            break 
                          }
                          else {
                            r10 = _E2_str4133;
                            r10 = (r10 - r8) | 0;
                            r11 = r3 & 255;
                            r10 = Int64(heapClassInst.heapU8[r10]);
                            if (r11 != r10) 
                            {
                              r8 = (r8 + (-1)) | 0;
                            }
                            else {
                              break 
                            }
                          }
                        }
                        r7 = (r7 + 1) | 0;
                      }
                    }
                    do {
                      if (__label__ == 232) {
                        if (r3 == 0) 
                        {
                          __label__ = 242;
                        }
                        else {
                          r3 = r7;
                          while (true) {
                            r8 = Int64(heapClassInst.heapU8[r3]);
                            if (r8 == 0) 
                            {
                              break 
                            }
                            else {
                              r10 = 1;
                              while (true) {
                                if (r10 != 0) 
                                {
                                  r11 = _E2_str4133;
                                  r11 = (r11 - r10) | 0;
                                  r12 = r8 & 255;
                                  r11 = Int64(heapClassInst.heapU8[r11 + 1]);
                                  if (r12 == r11) 
                                  {
                                    break 
                                  }
                                  else {
                                    r10 = (r10 + (-1)) | 0;
                                  }
                                }
                                else {
                                  break 
                                }
                              }
                              r3 = (r3 + 1) | 0;
                            }
                          }
                          r8 = Int64(heapClassInst.heapU8[r3]);
                          if (r8 != 0) 
                          {
                            r8 = (r3 + 1) | 0;
                            r10 = 0;
                            heapClassInst.heap8[r3] = Int8(r10);
                            r3 = r8;
                          }
                          heapClassInst.heap32[(r9)] = Int32(r3);
                          while (true) {
                            r8 = Int64(heapClassInst.heapU8[r3]);
                            if (r8 == 0) 
                            {
                              __label__ = 260;
                              break 
                            }
                            else {
                              r10 = 0;
                              while (true) {
                                if (r10 == ( -1)) 
                                {
                                  __label__ = 250;
                                  break 
                                }
                                else {
                                  r11 = _E2_str4133;
                                  r11 = (r11 - r10) | 0;
                                  r12 = r8 & 255;
                                  r11 = Int64(heapClassInst.heapU8[r11]);
                                  if (r12 != r11) 
                                  {
                                    r10 = (r10 + (-1)) | 0;
                                  }
                                  else {
                                    break 
                                  }
                                }
                              }
                              r3 = (r3 + 1) | 0;
                            }
                          }
                          if (__label__ == 250) {
                            if (!(r8 == 0)) 
                            {
                              r8 = r3;
                              while (true) {
                                r10 = Int64(heapClassInst.heapU8[r8]);
                                if (r10 == 0) 
                                {
                                  break 
                                }
                                else {
                                  r11 = 1;
                                  while (true) {
                                    if (r11 != 0) 
                                    {
                                      r12 = _E2_str4133;
                                      r12 = (r12 - r11) | 0;
                                      r13 = r10 & 255;
                                      r12 = Int64(heapClassInst.heapU8[r12 + 1]);
                                      if (r13 == r12) 
                                      {
                                        break 
                                      }
                                      else {
                                        r11 = (r11 + (-1)) | 0;
                                      }
                                    }
                                    else {
                                      break 
                                    }
                                  }
                                  r8 = (r8 + 1) | 0;
                                }
                              }
                              r10 = Int64(heapClassInst.heapU8[r8]);
                              if (r10 != 0) 
                              {
                                r10 = (r8 + 1) | 0;
                                r11 = 0;
                                heapClassInst.heap8[r8] = Int8(r11);
                                r8 = r10;
                              }
                              heapClassInst.heap32[(r9)] = Int32(r8);
                              while (true) {
                                r10 = Int64(heapClassInst.heapU8[r8]);
                                if (r10 == 0) 
                                {
                                  __label__ = 278;
                                  break 
                                }
                                else {
                                  r11 = 0;
                                  while (true) {
                                    if (r11 == ( -1)) 
                                    {
                                      __label__ = 268;
                                      break 
                                    }
                                    else {
                                      r12 = _E2_str4133;
                                      r12 = (r12 - r11) | 0;
                                      r13 = r10 & 255;
                                      r12 = Int64(heapClassInst.heapU8[r12]);
                                      if (r13 != r12) 
                                      {
                                        r11 = (r11 + (-1)) | 0;
                                      }
                                      else {
                                        break 
                                      }
                                    }
                                  }
                                  r8 = (r8 + 1) | 0;
                                }
                              }
                              if (__label__ == 268) {
                                if (!(r10 == 0)) 
                                {
                                  r10 = r8;
                                  while (true) {
                                    r11 = Int64(heapClassInst.heapU8[r10]);
                                    if (r11 == 0) 
                                    {
                                      break 
                                    }
                                    else {
                                      r12 = 1;
                                      while (true) {
                                        if (r12 != 0) 
                                        {
                                          r13 = _E2_str4133;
                                          r13 = (r13 - r12) | 0;
                                          r14 = r11 & 255;
                                          r13 = Int64(heapClassInst.heapU8[r13 + 1]);
                                          if (r14 == r13) 
                                          {
                                            break 
                                          }
                                          else {
                                            r12 = (r12 + (-1)) | 0;
                                          }
                                        }
                                        else {
                                          break 
                                        }
                                      }
                                      r10 = (r10 + 1) | 0;
                                    }
                                  }
                                  r11 = Int64(heapClassInst.heapU8[r10]);
                                  if (r11 != 0) 
                                  {
                                    r11 = (r10 + 1) | 0;
                                    r12 = 0;
                                    heapClassInst.heap8[r10] = Int8(r12);
                                    r10 = r11;
                                  }
                                  heapClassInst.heap32[(r9)] = Int32(r10);
                                  while (true) {
                                    r11 = Int64(heapClassInst.heapU8[r10]);
                                    if (r11 == 0) 
                                    {
                                      __label__ = 296;
                                      break 
                                    }
                                    else {
                                      r12 = 0;
                                      while (true) {
                                        if (r12 == ( -1)) 
                                        {
                                          __label__ = 286;
                                          break 
                                        }
                                        else {
                                          r13 = _E2_str4133;
                                          r13 = (r13 - r12) | 0;
                                          r14 = r11 & 255;
                                          r13 = Int64(heapClassInst.heapU8[r13]);
                                          if (r14 != r13) 
                                          {
                                            r12 = (r12 + (-1)) | 0;
                                          }
                                          else {
                                            break 
                                          }
                                        }
                                      }
                                      r10 = (r10 + 1) | 0;
                                    }
                                  }
                                  if (__label__ == 286) {
                                    if (!(r11 == 0)) 
                                    {
                                      r11 = r10;
                                      while (true) {
                                        r12 = Int64(heapClassInst.heapU8[r11]);
                                        if (r12 == 0) 
                                        {
                                          break 
                                        }
                                        else {
                                          r13 = 1;
                                          while (true) {
                                            if (r13 != 0) 
                                            {
                                              r14 = _E2_str4133;
                                              r14 = (r14 - r13) | 0;
                                              r15 = r12 & 255;
                                              r14 = Int64(heapClassInst.heapU8[r14 + 1]);
                                              if (r15 == r14) 
                                              {
                                                break 
                                              }
                                              else {
                                                r13 = (r13 + (-1)) | 0;
                                              }
                                            }
                                            else {
                                              break 
                                            }
                                          }
                                          r11 = (r11 + 1) | 0;
                                        }
                                      }
                                      r12 = Int64(heapClassInst.heapU8[r11]);
                                      if (r12 != 0) 
                                      {
                                        r12 = (r11 + 1) | 0;
                                        r13 = 0;
                                        heapClassInst.heap8[r11] = Int8(r13);
                                        r11 = r12;
                                      }
                                      heapClassInst.heap32[(r9)] = Int32(r11);
                                      while (true) {
                                        r12 = Int64(heapClassInst.heapU8[r11]);
                                        if (r12 == 0) 
                                        {
                                          __label__ = 314;
                                          break 
                                        }
                                        else {
                                          r13 = 0;
                                          while (true) {
                                            if (r13 == ( -1)) 
                                            {
                                              __label__ = 304;
                                              break 
                                            }
                                            else {
                                              r14 = _E2_str4133;
                                              r14 = (r14 - r13) | 0;
                                              r15 = r12 & 255;
                                              r14 = Int64(heapClassInst.heapU8[r14]);
                                              if (r15 != r14) 
                                              {
                                                r13 = (r13 + (-1)) | 0;
                                              }
                                              else {
                                                break 
                                              }
                                            }
                                          }
                                          r11 = (r11 + 1) | 0;
                                        }
                                      }
                                      if (__label__ == 304) {
                                        if (!(r12 == 0)) 
                                        {
                                          r12 = r11;
                                          while (true) {
                                            r13 = Int64(heapClassInst.heapU8[r12]);
                                            if (r13 == 0) 
                                            {
                                              break 
                                            }
                                            else {
                                              r14 = 1;
                                              while (true) {
                                                if (r14 != 0) 
                                                {
                                                  r15 = _E2_str4133;
                                                  r15 = (r15 - r14) | 0;
                                                  r16 = r13 & 255;
                                                  r15 = Int64(heapClassInst.heapU8[r15 + 1]);
                                                  if (r16 == r15) 
                                                  {
                                                    break 
                                                  }
                                                  else {
                                                    r14 = (r14 + (-1)) | 0;
                                                  }
                                                }
                                                else {
                                                  break 
                                                }
                                              }
                                              r12 = (r12 + 1) | 0;
                                            }
                                          }
                                          r13 = Int64(heapClassInst.heapU8[r12]);
                                          if (r13 != 0) 
                                          {
                                            r13 = (r12 + 1) | 0;
                                            r14 = 0;
                                            heapClassInst.heap8[r12] = Int8(r14);
                                            r12 = r13;
                                          }
                                          heapClassInst.heap32[(r9)] = Int32(r12);
                                          if (r8 == 0) 
                                          {
                                            __label__ = 323;
                                            break 
                                          }
                                          else {
                                            if (r11 == 0) 
                                            {
                                              __label__ = 323;
                                              break 
                                            }
                                            else {
                                              heapClassInst.heap32[(g0)] = 284;
                                              _Znwj(i7);
                                              r9 = commonVariable.r_g0;
                                              heapClassInst.heap32[(g0)] = Int32(r3);
                                              heapClassInst.heap32[(g0 + 1)] = 0;
                                              r3 = r9 >> 2;
                                              strtol(i7);
                                              heapClassInst.heap32[(r3 + 65)] = Int32(commonVariable.r_g0);
                                              heapClassInst.heap32[(g0)] = Int32(r8);
                                              heapClassInst.heap32[(g0 + 1)] = 0;
                                              strtol(i7);
                                              heapClassInst.heap32[(r3 + 66)] = Int32(commonVariable.r_g0);
                                              heapClassInst.heap32[(g0)] = Int32(r10);
                                              heapClassInst.heap32[(g0 + 1)] = 0;
                                              strtol(i7);
                                              heapClassInst.heap32[(r3 + 67)] = Int32(commonVariable.r_g0);
                                              heapClassInst.heap32[(g0)] = Int32(r11);
                                              heapClassInst.heap32[(g0 + 1)] = 0;
                                              strtol(i7);
                                              heapClassInst.heap32[(r3 + 69)] = Int32(commonVariable.r_g0);
                                              r7 = (r7 + 1) | 0;
                                              r8 = 0;
                                              heapClassInst.heap32[(r3 + 68)] = Int32(r4);
                                              heapClassInst.heap32[(r3 + 64)] = Int32(r6);
                                              r3 = r9;
                                              while (true) {
                                                r10 = Int64(heapClassInst.heapU8[r7]);
                                                if (r10 == 0) 
                                                {
                                                  break 
                                                }
                                                else {
                                                  r11 = r10 << 24;
                                                  r11 = r11 >> 24;
                                                  r11 = (r11 + (-65)) | 0;
                                                  r12 = 26;
                                                  r13 = (r10 + 32) | 0;
                                                  r10 = if (`UIntNative`(r11) < `UIntNative`(r12)) {r13} else {r10};
                                                  r11 = r10 & 255;
                                                  r12 = 47;
                                                  r10 = if (r11 == 92) {r12} else {r10};
                                                  r7 = (r7 + 1) | 0;
                                                  r11 = r10 & 255;
                                                  if (!(r11 != 47)) 
                                                  {
                                                    r11 = r8 & 255;
                                                    r8 = r10;
                                                    if (r11 == 47) 
                                                    {
                                                      continue 
                                                    }
                                                  }
                                                  r8 = (r3 + 1) | 0;
                                                  heapClassInst.heap8[r3] = Int8(r10);
                                                  r3 = r8;
                                                  r8 = r10;
                                                }
                                              }
                                              r7 = _ZL24g_pFirstTextureAsyncInfo;
                                              r8 = 0;
                                              r7 = r7 >> 2;
                                              heapClassInst.heap8[r3] = Int8(r8);
                                              r3 = r9 >> 2;
                                              r8 = Int64(heapClassInst.heap32[(r7)]);
                                              heapClassInst.heap32[(r3 + 70)] = Int32(r8);
                                              heapClassInst.heap32[(r7)] = Int32(r9);
                                              r3 = Int64(heapClassInst.heap32[(r3 + 69)]);
                                              r4 = (r3 + r4) | 0;
                                              continue 
                                            }
                                          }
                                        }
                                      }
                                      heapClassInst.heap32[(r9)] = Int32(r11);
                                      __label__ = 323;
                                      break 
                                    }
                                  }
                                  heapClassInst.heap32[(r9)] = Int32(r10);
                                  __label__ = 323;
                                  break 
                                }
                              }
                              heapClassInst.heap32[(r9)] = Int32(r8);
                              __label__ = 323;
                              break 
                            }
                          }
                          heapClassInst.heap32[(r9)] = Int32(r3);
                          __label__ = 323;
                        }
                      }
                    } while (false);
                    if (__label__ == 242) {
                      heapClassInst.heap32[(r9)] = Int32(r7);
                    }
                    r3 = _E2_str4783;
                    heapClassInst.heap32[(g0)] = Int32(r3);
                    _printf_warning(i7);
                    continue 
                  }
                }
              }
              heapClassInst.heap32[(r9)] = Int32(r3);
            }
            else {
              break 
            }
          }
          while (true) {
            r3 = Int64(heapClassInst.heapU8[r7]);
            if (r3 == 0) 
            {
              __label__ = 331;
              break 
            }
            else {
              r4 = 0;
              while (true) {
                if (r4 == ( -1)) 
                {
                  __label__ = 332;
                  break 
                }
                else {
                  r8 = _E2_str4133;
                  r8 = (r8 - r4) | 0;
                  r10 = r3 & 255;
                  r8 = Int64(heapClassInst.heapU8[r8]);
                  if (r10 != r8) 
                  {
                    r4 = (r4 + (-1)) | 0;
                  }
                  else {
                    break 
                  }
                }
              }
              r7 = (r7 + 1) | 0;
            }
          }
          if (__label__ == 332) {
            if (r3 == 0) 
            {
              __label__ = 331;
            }
            else {
              r3 = r7;
              while (true) {
                r4 = Int64(heapClassInst.heapU8[r3]);
                if (r4 == 0) 
                {
                  break 
                }
                else {
                  r8 = 1;
                  while (true) {
                    if (r8 != 0) 
                    {
                      r10 = _E2_str4133;
                      r10 = (r10 - r8) | 0;
                      r11 = r4 & 255;
                      r10 = Int64(heapClassInst.heapU8[r10 + 1]);
                      if (r11 == r10) 
                      {
                        break 
                      }
                      else {
                        r8 = (r8 + (-1)) | 0;
                      }
                    }
                    else {
                      break 
                    }
                  }
                  r3 = (r3 + 1) | 0;
                }
              }
              r4 = Int64(heapClassInst.heapU8[r3]);
              if (r4 != 0) 
              {
                r8 = (r3 + 1) | 0;
                r4 = 0;
                heapClassInst.heap8[r3] = Int8(r4);
                r4 = r7;
                r7 = r8;
                __label__ = 343;
              }
              else {
                r4 = r7;
                r7 = r3;
                __label__ = 343;
              }
            }
          }
          if (__label__ == 331) {
            r4 = 0;
          }
          heapClassInst.heap32[(r9)] = Int32(r7);
          while (true) {
            r3 = Int64(heapClassInst.heapU8[r7]);
            if (r3 == 0) 
            {
              __label__ = 359;
              break 
            }
            else {
              r8 = 0;
              while (true) {
                if (r8 == ( -1)) 
                {
                  __label__ = 350;
                  break 
                }
                else {
                  r10 = _E2_str4133;
                  r10 = (r10 - r8) | 0;
                  r11 = r3 & 255;
                  r10 = Int64(heapClassInst.heapU8[r10]);
                  if (r11 != r10) 
                  {
                    r8 = (r8 + (-1)) | 0;
                  }
                  else {
                    break 
                  }
                }
              }
              r7 = (r7 + 1) | 0;
            }
          }
          if (__label__ == 350) {
            if (!(r3 == 0)) 
            {
              while (true) {
                r3 = Int64(heapClassInst.heapU8[r7]);
                if (r3 == 0) 
                {
                  break 
                }
                else {
                  r8 = 1;
                  while (true) {
                    if (r8 != 0) 
                    {
                      r10 = _E2_str4133;
                      r10 = (r10 - r8) | 0;
                      r11 = r3 & 255;
                      r10 = Int64(heapClassInst.heapU8[r10 + 1]);
                      if (r11 == r10) 
                      {
                        break 
                      }
                      else {
                        r8 = (r8 + (-1)) | 0;
                      }
                    }
                    else {
                      break 
                    }
                  }
                  r7 = (r7 + 1) | 0;
                }
              }
              r3 = Int64(heapClassInst.heapU8[r7]);
              if (r3 != 0) 
              {
                r3 = (r7 + 1) | 0;
                r8 = 0;
                heapClassInst.heap8[r7] = Int8(r8);
                r7 = r3;
              }
            }
          }
          r3 = (r6 + 1) | 0;
          heapClassInst.heap32[(r9)] = Int32(r7);
          r7 = Int64(heapClassInst.heapU8[r4]);
          do {
            if (r7 == 0) 
            {
              r8 = 1;
            }
            else {
              r7 = 1;
              while (true) {
                r8 = (r7 + 1) | 0;
                r9 = Int64(heapClassInst.heapU8[r4 + r7]);
                r7 = r8;
                if (!(r9 != 0)) 
                {
                  break 
                }
              }
            }
          } while (false);
          r7 = _ZL17g_apPackFileNames;
          r6 = r6 << 2;
          r6 = (r7 + r6) | 0;
          heapClassInst.heap32[(g0)] = Int32(r8);
          r6 = r6 >> 2;
          _Znaj(i7);
          heapClassInst.heap32[(r6 + 1)] = Int32(commonVariable.r_g0);
          heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
          heapClassInst.heap32[(g0 + 1)] = Int32(r4);
          r4 = 0;
          strcpy(i7);
        }
        heapClassInst.heap32[(g0)] = Int32(r2);
        free(i7);
      }
    }
    r0 = sp + (-2440);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = 0;
    r1 = _ZGVZ21Mandreel_GetTickCountE7s_first;
    gettimeofday(i7);
    r2 = Int64(heapClassInst.heapU8[r1]);
    if (!(r2 != 0)) 
    {
      r2 = Int64(heapClassInst.heap32[(fp + (-610))]);
      r3 = r2 >> 31;
      heapClassInst.heap32[(g0)] = Int32(r2);
      heapClassInst.heap32[(g0 + 1)] = Int32(r3);
      heapClassInst.heap32[(g0 + 2)] = 1000000;
      heapClassInst.heap32[(g0 + 3)] = 0;
      r0 = r0 >> 2;
      r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
      __muldi3(i7);
      r4 = 1;
      r5 = (commonVariable.r_g0 + r0) | 0;
      r6 = 0;
      r7 = r0 >> 31;
      r2 = if (`UIntNative`(r5) < `UIntNative`(commonVariable.r_g0)) {r4} else {r6};
      r6 = _ZZ21Mandreel_GetTickCountE7s_first;
      r3 = (commonVariable.r_g1 + r7) | 0;
      r0 = if (`UIntNative`(r5) < `UIntNative`(r0)) {r4} else {r2};
      r2 = r6 >> 2;
      r0 = (r3 + r0) | 0;
      heapClassInst.heap32[(r2)] = Int32(r5);
      heapClassInst.heap32[(r2 + 1)] = Int32(r0);
      heapClassInst.heap8[r1] = Int8(r4);
    }
    return;
  }
  else {
    r2 = _E2_str34255;
    r0 = _E2_str1222;
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    heapClassInst.heap32[(g0 + 2)] = 307;
    _assert(i7);
  }
}

func __keyEvent(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  return;
}

func __mouseFloat64Click(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  return;
}

func __mouseMove(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  return;
}

func __mouseButton(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  return;
}

func __mouseWheelDelta(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  return;
}

func _printf_error(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-16408); 
  var g0 = i7 >> 2; 
  r0 = (sp + 4) | 0;
  heapClassInst.heap32[(fp + (-4097))] = Int32(r0);
  r1 = sp + (-16384);
  r2 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = 16384;
  heapClassInst.heap32[(g0 + 2)] = Int32(r2);
  heapClassInst.heap32[(g0 + 3)] = Int32(r0);
  r0 = g_msgcallback;
  r0 = r0 >> 2;
  vsnprintf(i7);
  r0 = Int64(heapClassInst.heap32[(r0)]);
  if (!(r0 == 0)) 
  {
    heapClassInst.heap32[(g0)] = Int32(r1);
    __sandbox_OutputDebugString(i7);
  }
  return;
}

func _printf_warning(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-16408); 
  var g0 = i7 >> 2; 
  r0 = (sp + 4) | 0;
  heapClassInst.heap32[(fp + (-4097))] = Int32(r0);
  r1 = sp + (-16384);
  r2 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = 16384;
  heapClassInst.heap32[(g0 + 2)] = Int32(r2);
  heapClassInst.heap32[(g0 + 3)] = Int32(r0);
  r0 = g_msgcallback;
  r0 = r0 >> 2;
  vsnprintf(i7);
  r0 = Int64(heapClassInst.heap32[(r0)]);
  if (!(r0 == 0)) 
  {
    heapClassInst.heap32[(g0)] = Int32(r1);
    __sandbox_OutputDebugString(i7);
  }
  return;
}

func __mandreel_internal_preupdate(sp: Int64) : Unit
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
  r0 = sp + (-8);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = 0;
  r1 = _ZGVZ21Mandreel_GetTickCountE7s_first;
  gettimeofday(i7);
  r2 = Int64(heapClassInst.heapU8[r1]);
  if (!(r2 != 0)) 
  {
    r2 = Int64(heapClassInst.heap32[(fp + (-2))]);
    r3 = r2 >> 31;
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    heapClassInst.heap32[(g0 + 2)] = 1000000;
    heapClassInst.heap32[(g0 + 3)] = 0;
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
    __muldi3(i7);
    r4 = 1;
    r5 = (commonVariable.r_g0 + r0) | 0;
    r6 = 0;
    r7 = r0 >> 31;
    r2 = if (`UIntNative`(r5) < `UIntNative`(commonVariable.r_g0)) {r4} else {r6};
    r6 = _ZZ21Mandreel_GetTickCountE7s_first;
    r3 = (commonVariable.r_g1 + r7) | 0;
    r0 = if (`UIntNative`(r5) < `UIntNative`(r0)) {r4} else {r2};
    r2 = r6 >> 2;
    r0 = (r3 + r0) | 0;
    heapClassInst.heap32[(r2)] = Int32(r5);
    heapClassInst.heap32[(r2 + 1)] = Int32(r0);
    heapClassInst.heap8[r1] = Int8(r4);
  }
  r0 = _ZZ29__mandreel_internal_preupdateE8s_bfirst_2E_b;
  r1 = Int64(heapClassInst.heapU8[r0]);
  if (!(r1 != 0)) 
  {
    r1 = 1;
    heapClassInst.heap8[r0] = Int8(r1);
  }
  return;
}

func __mandreel_internal_update(sp: Int64) : Unit
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
  r0 = ( -32788);
  while (true) {
    r1 = _ZL10s_aSockets;
    r1 = (r1 - r0) | 0;
    r2 = Int64(heapClassInst.heapU8[r1]);
    if (!(r2 == 0)) 
    {
      r1 = r1 >> 2;
      r1 = Int64(heapClassInst.heap32[(r1 + (-1))]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      heapClassInst.heap32[(g0 + 1)] = 2048;
      js_mandreel_flash_tcp_update(i7);
    }
    r0 = (r0 + (-32792)) | 0;
    if (r0 != ( -295124)) 
    {
      continue 
    }
    else {
      break 
    }
  }
  r0 = _ZL7g_bInit_2E_b;
  r1 = Int64(heapClassInst.heapU8[r0]);
  if (r1 != 0) 
  {
    mandreel_audio_update(i7);
    r1 = sp + (-8);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0 + 1)] = 0;
    gettimeofday(i7);
    r2 = Int64(heapClassInst.heap32[(fp + (-2))]);
    r3 = r2 >> 31;
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    heapClassInst.heap32[(g0 + 2)] = 1000000;
    heapClassInst.heap32[(g0 + 3)] = 0;
    r1 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1 + 1)]);
    __muldi3(i7);
    r4 = (commonVariable.r_g0 + r1) | 0;
    r5 = 1;
    r6 = 0;
    r7 = r1 >> 31;
    r2 = if (`UIntNative`(r4) < `UIntNative`(commonVariable.r_g0)) {r5} else {r6};
    r3 = (commonVariable.r_g1 + r7) | 0;
    r1 = if (`UIntNative`(r4) < `UIntNative`(r1)) {r5} else {r2};
    r1 = (r3 + r1) | 0;
    r2 = _ZGVZ21Mandreel_GetTickCountE7s_first;
    r3 = Int64(heapClassInst.heapU8[r2]);
    if (!(r3 != 0)) 
    {
      r3 = _ZZ21Mandreel_GetTickCountE7s_first;
      r3 = r3 >> 2;
      heapClassInst.heap32[(r3)] = Int32(r4);
      heapClassInst.heap32[(r3 + 1)] = Int32(r1);
      heapClassInst.heap8[r2] = Int8(r5);
    }
    r2 = _ZZ21Mandreel_GetTickCountE7s_first;
    r2 = r2 >> 2;
    r3 = Int64(heapClassInst.heap32[(r2)]);
    r2 = Int64(heapClassInst.heap32[(r2 + 1)]);
    r1 = (r1 - r2) | 0;
    r2 = if (`UIntNative`(r4) < `UIntNative`(r3)) {r5} else {r6};
    r3 = (r4 - r3) | 0;
    r1 = (r1 - r2) | 0;
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = 1000;
    heapClassInst.heap32[(g0 + 3)] = 0;
    __udivdi3(i7);
    r1 = commonVariable.r_g0;
    r2 = _ZL11g_aChannels;
    while (true) {
      if (r6 < 32) 
      {
        r3 = r2 >> 2;
        r4 = Int64(heapClassInst.heap32[(r3 + 72)]);
        if (!(r4 != 1)) 
        {
          r4 = _ZL11g_aChannels;
          r7 = (r6 * 292) | 0;
          r4 = (r4 + r7) | 0;
          r7 = Int64(heapClassInst.heapU8[r4 + 268]);
          if (!(r7 != 0)) 
          {
            r7 = Int64(heapClassInst.heap32[(r3 + 71)]);
            if (r7 == ( -1)) 
            {
              r7 = Int64(heapClassInst.heapU8[r0]);
              if (r7 != 1) 
              {
                __label__ = 14;
                break 
              }
              else {
                r7 = _ZL21g_pFirstSoundDuration;
                while (true) {
                  r7 = r7 >> 2;
                  r7 = Int64(heapClassInst.heap32[(r7)]);
                  if (r7 != 0) 
                  {
                    heapClassInst.heap32[(g0)] = Int32(r7);
                    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
                    strcmp(i7);
                    r8 = commonVariable.r_g0;
                    if (r8 != 0) 
                    {
                      r7 = (r7 + 260) | 0;
                    }
                    else {
                      __label__ = 16;
                      break 
                    }
                  }
                  else {
                    __label__ = 19;
                    break 
                  }
                }
                match (__label__) {
                  case 19 =>
                    r7 = _E2_str3224;
                    heapClassInst.heap32[(g0)] = Int32(r7);
                    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
                    r7 = 0;
                    _printf_warning(i7);
                    // break;
                  case 16 =>
                    r7 = r7 >> 2;
                    r7 = Int64(heapClassInst.heap32[(r7 + 64)]);
                  //   break;
                  // default:
                  //   break
                  case _ =>
                    println("break12392")
                }
                heapClassInst.heap32[(r3 + 71)] = Int32(r7);
              }
            }
            r8 = Int64(heapClassInst.heap32[(r3 + 70)]);
            r7 = (r8 + r7) | 0;
            if (!(`UIntNative`(r7) > `UIntNative`(r1))) 
            {
              r7 = Int64(heapClassInst.heapU8[r0]);
              if (r7 != 0) 
              {
                r7 = (r6 + (-1)) | 0;
                if (!(`UIntNative`(r7) > `UIntNative`(30))) 
                {
                  r7 = Int64(heapClassInst.heapU8[r4 + 269]);
                  if (!(r7 != 0)) 
                  {
                    if (!(`UIntNative`(r6) > `UIntNative`(31))) 
                    {
                      r7 = Int64(heapClassInst.heap32[(r3 + 68)]);
                      r8 = Int64(heapClassInst.heap32[(r3 + 69)]);
                      heapClassInst.heap32[(g0)] = Int32(r2);
                      heapClassInst.heap32[(g0 + 1)] = Int32(r8);
                      heapClassInst.heap32[(g0 + 2)] = Int32(r7);
                      mandreel_audio_stopChannel(i7);
                      heapClassInst.heap32[(r3 + 72)] = 0;
                      heapClassInst.heap32[(r3 + 68)] = ( -1);
                    }
                    r3 = _ZL15g_iFreeChannels;
                    r3 = r3 >> 2;
                    heapClassInst.heap8[r4 + 269] = Int8(r5);
                    r4 = Int64(heapClassInst.heap32[(r3)]);
                    r7 = (r4 + (-1)) | 0;
                    do {
                      if (!(r7 < 0)) 
                      {
                        r7 = r4;
                        while (true) {
                          r8 = _ZL15g_aFreeChannels;
                          r9 = r7 << 2;
                          r8 = (r8 + r9) | 0;
                          r8 = r8 >> 2;
                          r9 = Int64(heapClassInst.heap32[(r8 + (-1))]);
                          r7 = (r7 + (-1)) | 0;
                          heapClassInst.heap32[(r8)] = Int32(r9);
                          if (!(r7 != 0)) 
                          {
                            break 
                          }
                        }
                      }
                    } while (false);
                    r7 = _ZL15g_aFreeChannels;
                    r7 = r7 >> 2;
                    r4 = (r4 + 1) | 0;
                    heapClassInst.heap32[(r7)] = Int32(r6);
                    heapClassInst.heap32[(r3)] = Int32(r4);
                  }
                }
              }
              else {
                __label__ = 23;
                break 
              }
            }
          }
        }
        r6 = (r6 + 1) | 0;
        r2 = (r2 + 292) | 0;
      }
      else {
        __label__ = 34;
        break 
      }
    }
    match (__label__) {
      case 34 =>
        return;
        // break;
      case 14 =>
        r7 = _E2_str221;
        r0 = _E2_str1222;
        heapClassInst.heap32[(g0)] = Int32(r7);
        heapClassInst.heap32[(g0 + 1)] = Int32(r0);
        heapClassInst.heap32[(g0 + 2)] = 341;
        _assert(i7);
        // break;
      case 23 =>
        r0 = _E2_str221;
        r1 = _E2_str1222;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 621;
        _assert(i7);
        // break;
      // default:
      //   break
      case _ =>
          println("break12491")
    }
  }
  else {
    r0 = _E2_str221;
    r1 = _E2_str1222;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = 361;
    _assert(i7);
  }
}

func __forceSuperLink(sp: Int64) : Unit
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
  __mandreel_internal_init(i7);
  r0 = sp + (-8);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = 0;
  r1 = _ZGVZ21Mandreel_GetTickCountE7s_first;
  gettimeofday(i7);
  r2 = Int64(heapClassInst.heapU8[r1]);
  if (!(r2 != 0)) 
  {
    r2 = Int64(heapClassInst.heap32[(fp + (-2))]);
    r3 = r2 >> 31;
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    heapClassInst.heap32[(g0 + 2)] = 1000000;
    heapClassInst.heap32[(g0 + 3)] = 0;
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
    __muldi3(i7);
    r4 = 1;
    r5 = (commonVariable.r_g0 + r0) | 0;
    r6 = 0;
    r7 = r0 >> 31;
    r2 = if (`UIntNative`(r5) < `UIntNative`(commonVariable.r_g0)) {r4} else {r6};
    r6 = _ZZ21Mandreel_GetTickCountE7s_first;
    r3 = (commonVariable.r_g1 + r7) | 0;
    r0 = if (`UIntNative`(r5) < `UIntNative`(r0)) {r4} else {r2};
    r2 = r6 >> 2;
    r0 = (r3 + r0) | 0;
    heapClassInst.heap32[(r2)] = Int32(r5);
    heapClassInst.heap32[(r2 + 1)] = Int32(r0);
    heapClassInst.heap8[r1] = Int8(r4);
  }
  r0 = _ZZ29__mandreel_internal_preupdateE8s_bfirst_2E_b;
  r1 = Int64(heapClassInst.heapU8[r0]);
  if (!(r1 != 0)) 
  {
    r1 = 1;
    heapClassInst.heap8[r0] = Int8(r1);
  }
  return;
}

func _ZNK10__cxxabiv117__class_type_info11__do_upcastEPKS0_PPv(sp: Int64) : Unit
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
  i7 = sp + (-32); 
  var g0 = i7 >> 2; 
  r0 = sp + (-16);
  r1 = r0 >> 2;
  heapClassInst.heap32[(fp + (-4))] = 0;
  heapClassInst.heap32[(r1 + 1)] = 0;
  r2 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heap32[(r1 + 2)] = 16;
  r3 = r2 >> 2;
  heapClassInst.heap32[(r1 + 3)] = 0;
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  r3 = Int64(heapClassInst.heap32[(r3)]);
  r3 = r3 >> 2;
  r4 = r4 >> 2;
  r3 = Int64(heapClassInst.heap32[(r3 + 5)]);
  r5 = Int64(heapClassInst.heap32[(r4)]);
  r6 = Int64(heapClassInst.heap32[(fp + 1)]);
  heapClassInst.heap32[(g0)] = Int32(r2);
  heapClassInst.heap32[(g0 + 1)] = Int32(r6);
  heapClassInst.heap32[(g0 + 2)] = Int32(r5);
  heapClassInst.heap32[(g0 + 3)] = Int32(r0);
  __FUNCTION_TABLE__[(r3) >> 2](i7);
  r0 = Int64(heapClassInst.heap32[(r1 + 1)]);
  r0 = r0 & 6;
  if (r0 != 6) 
  {
    r0 = 0;
    commonVariable.r_g0 = r0;
    return;
  }
  else {
    r0 = Int64(heapClassInst.heap32[(fp + (-4))]);
    heapClassInst.heap32[(r4)] = Int32(r0);
    r0 = 1;
    commonVariable.r_g0 = r0;
    return;
  }
}

func _ZNK10__cxxabiv117__class_type_info20__do_find_public_srcEiPKvPKS0_S2_(sp: Int64) : Unit
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
  r0 = Int64(heapClassInst.heap32[(fp + 4)]);
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  r2 = 6;
  r3 = 1;
  r0 = if (r0 == r1) {r2} else {r3};
  commonVariable.r_g0 = r0;
  return;
}

func _ZNKSt9type_info10__do_catchEPKS_PPvj(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = r1 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r1 = Int64(heapClassInst.heap32[(r1 + 1)]);
  r2 = _E2_str26;
  r0 = if (r0 == 0) {r2} else {r0};
  r1 = if (r1 == 0) {r2} else {r1};
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  strcmp(i7);
  r2 = commonVariable.r_g0;
  if (r2 < 0) 
  {
    r0 = 0;
    commonVariable.r_g0 = r0;
    return;
  }
  else {
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    strcmp(i7);
    r0 = commonVariable.r_g0 >> 31;
    r0 = r0 ^ 1;
    commonVariable.r_g0 = r0;
    return;
  }
}

func _ZN10__cxxabiv117__class_type_infoD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVSt9type_info;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN10__cxxabiv117__class_type_infoD0Ev(sp: Int64) : Unit
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
  r1 = _ZTVSt9type_info;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZNK10__cxxabiv117__class_type_info10__do_catchEPKSt9type_infoPPvj(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = r1 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r1 = Int64(heapClassInst.heap32[(r1 + 1)]);
  r2 = _E2_str26;
  r0 = if (r0 == 0) {r2} else {r0};
  r1 = if (r1 == 0) {r2} else {r1};
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  strcmp(i7);
  r2 = commonVariable.r_g0;
  if (r2 > ( -1)) 
  {
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    r0 = ( -1);
    strcmp(i7);
    r0 = if (commonVariable.r_g0 > r0) {1} else {0};
  }
  else {
    r0 = 0;
  }
  r0 = r0 & 1;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK10__cxxabiv117__class_type_info11__do_upcastEPKS0_PKvRNS0_15__upcast_resultE(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = r1 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r1 = Int64(heapClassInst.heap32[(r1 + 1)]);
  r2 = _E2_str26;
  r0 = if (r0 == 0) {r2} else {r0};
  r1 = if (r0 == 0) {r2} else {r1};
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  strcmp(i7);
  r2 = commonVariable.r_g0;
  if (!(r2 < 0)) 
  {
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    strcmp(i7);
    r0 = commonVariable.r_g0;
    if (!(r0 < 0)) 
    {
      r0 = Int64(heapClassInst.heap32[(fp + 2)]);
      r1 = Int64(heapClassInst.heap32[(fp + 3)]);
      r1 = r1 >> 2;
      heapClassInst.heap32[(r1)] = Int32(r0);
      heapClassInst.heap32[(r1 + 3)] = 8;
      heapClassInst.heap32[(r1 + 1)] = 6;
      r0 = 1;
      commonVariable.r_g0 = r0;
      return;
    }
  }
  r0 = 0;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK10__cxxabiv117__class_type_info12__do_dyncastEiNS0_10__sub_kindEPKS0_PKvS3_S5_RNS0_16__dyncast_resultE(sp: Int64) : Unit
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
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(fp + 4)]);
  r2 = Int64(heapClassInst.heap32[(fp + 2)]);
  r3 = Int64(heapClassInst.heap32[(fp + 7)]);
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r4 = Int64(heapClassInst.heap32[(fp + 6)]);
  if (!(r1 != r4)) 
  {
    r4 = Int64(heapClassInst.heap32[(fp + 5)]);
    r4 = r4 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4 + 1)]);
    r5 = _E2_str26;
    r4 = if (r4 == 0) {r5} else {r4};
    r5 = if (r0 == 0) {r5} else {r0};
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0 + 1)] = Int32(r4);
    strcmp(i7);
    r6 = commonVariable.r_g0;
    if (!(r6 < 0)) 
    {
      heapClassInst.heap32[(g0)] = Int32(r4);
      heapClassInst.heap32[(g0 + 1)] = Int32(r5);
      strcmp(i7);
      r4 = commonVariable.r_g0;
      if (r4 > ( -1)) 
      {
        r1 = r3 >> 2;
        heapClassInst.heap32[(r1 + 2)] = Int32(r2);
        r1 = 0;
        commonVariable.r_g0 = r1;
        return;
      }
    }
  }
  r4 = Int64(heapClassInst.heap32[(fp + 3)]);
  r4 = r4 >> 2;
  r4 = Int64(heapClassInst.heap32[(r4 + 1)]);
  r5 = _E2_str26;
  r4 = if (r4 == 0) {r5} else {r4};
  r0 = if (r0 == 0) {r5} else {r0};
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r4);
  strcmp(i7);
  r5 = commonVariable.r_g0;
  if (!(r5 < 0)) 
  {
    heapClassInst.heap32[(g0)] = Int32(r4);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    strcmp(i7);
    r0 = commonVariable.r_g0;
    if (!(r0 < 0)) 
    {
      r0 = r3 >> 2;
      heapClassInst.heap32[(r0)] = Int32(r1);
      heapClassInst.heap32[(r0 + 1)] = Int32(r2);
      heapClassInst.heap32[(r0 + 3)] = 1;
    }
  }
  r0 = 0;
  commonVariable.r_g0 = r0;
  return;
}

func _ZN10__cxxabiv120__si_class_type_infoD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVSt9type_info;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func _ZN10__cxxabiv120__si_class_type_infoD0Ev(sp: Int64) : Unit
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
  r1 = _ZTVSt9type_info;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZNK10__cxxabiv120__si_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE(sp: Int64) : Unit
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
  r2 = r0 >> 2;
  r1 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 1)]);
  r3 = Int64(heapClassInst.heap32[(r1 + 1)]);
  r4 = _E2_str26;
  r2 = if (r2 == 0) {r4} else {r2};
  r3 = if (r3 == 0) {r4} else {r3};
  heapClassInst.heap32[(g0)] = Int32(r3);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  r5 = Int64(heapClassInst.heap32[(fp + 3)]);
  strcmp(i7);
  r6 = commonVariable.r_g0;
  if (!(r6 < 0)) 
  {
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    strcmp(i7);
    r2 = commonVariable.r_g0;
    if (r2 > ( -1)) 
    {
      r0 = r5 >> 2;
      heapClassInst.heap32[(r0)] = Int32(r4);
      heapClassInst.heap32[(r0 + 3)] = 8;
      heapClassInst.heap32[(r0 + 1)] = 6;
      r0 = 1;
      commonVariable.r_g0 = r0;
      return;
    }
  }
  r1 = Int64(heapClassInst.heap32[(r1 + 2)]);
  r2 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 5)]);
  heapClassInst.heap32[(g0)] = Int32(r1);
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  heapClassInst.heap32[(g0 + 2)] = Int32(r4);
  heapClassInst.heap32[(g0 + 3)] = Int32(r5);
  __FUNCTION_TABLE__[(r2) >> 2](i7);
  return;
}

func _ZNK10__cxxabiv120__si_class_type_info12__do_dyncastEiNS_17__class_type_info10__sub_kindEPKS1_PKvS4_S6_RNS1_16__dyncast_resultE(sp: Int64) : Unit
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
  i7 = sp + (-32); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 3)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r2 = r0 >> 2;
  r1 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 1)]);
  r3 = Int64(heapClassInst.heap32[(r1 + 1)]);
  r4 = _E2_str26;
  r2 = if (r2 == 0) {r4} else {r2};
  r3 = if (r3 == 0) {r4} else {r3};
  heapClassInst.heap32[(g0)] = Int32(r3);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  r5 = Int64(heapClassInst.heap32[(fp + 1)]);
  r6 = Int64(heapClassInst.heap32[(fp + 2)]);
  r7 = Int64(heapClassInst.heap32[(fp + 4)]);
  r8 = Int64(heapClassInst.heap32[(fp + 6)]);
  r9 = Int64(heapClassInst.heap32[(fp + 7)]);
  strcmp(i7);
  r10 = commonVariable.r_g0;
  if (r10 < 0) 
  {
    __label__ = 6;
  }
  else {
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0 + 1)] = Int32(r3);
    strcmp(i7);
    r2 = commonVariable.r_g0;
    if (r2 < 0) 
    {
      __label__ = 6;
    }
    else {
      r0 = r9 >> 2;
      heapClassInst.heap32[(r0)] = Int32(r7);
      heapClassInst.heap32[(r0 + 1)] = Int32(r6);
      if (r5 < 0) 
      {
        if (r5 != ( -2)) 
        {
          __label__ = 11;
        }
        else {
          heapClassInst.heap32[(r0 + 3)] = 1;
          __label__ = 11;
        }
      }
      else {
        r1 = (r7 + r5) | 0;
        r3 = 6;
        r4 = 1;
        r1 = if (r1 == r8) {r3} else {r4};
        heapClassInst.heap32[(r0 + 3)] = Int32(r1);
        __label__ = 11;
      }
    }
  }
  do {
    if (__label__ == 6) {
      r2 = Int64(heapClassInst.heap32[(fp + 5)]);
      if (!(r7 != r8)) 
      {
        r10 = r2 >> 2;
        r10 = Int64(heapClassInst.heap32[(r10 + 1)]);
        r4 = if (r10 == 0) {r4} else {r10};
        heapClassInst.heap32[(g0)] = Int32(r3);
        heapClassInst.heap32[(g0 + 1)] = Int32(r4);
        strcmp(i7);
        r10 = commonVariable.r_g0;
        if (!(r10 < 0)) 
        {
          heapClassInst.heap32[(g0)] = Int32(r4);
          heapClassInst.heap32[(g0 + 1)] = Int32(r3);
          strcmp(i7);
          r3 = commonVariable.r_g0;
          if (r3 > ( -1)) 
          {
            r0 = r9 >> 2;
            heapClassInst.heap32[(r0 + 2)] = Int32(r6);
            break 
          }
        }
      }
      r1 = Int64(heapClassInst.heap32[(r1 + 2)]);
      r3 = r1 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3)]);
      r3 = r3 >> 2;
      r3 = Int64(heapClassInst.heap32[(r3 + 6)]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      heapClassInst.heap32[(g0 + 1)] = Int32(r5);
      heapClassInst.heap32[(g0 + 2)] = Int32(r6);
      heapClassInst.heap32[(g0 + 3)] = Int32(r0);
      heapClassInst.heap32[(g0 + 4)] = Int32(r7);
      heapClassInst.heap32[(g0 + 5)] = Int32(r2);
      heapClassInst.heap32[(g0 + 6)] = Int32(r8);
      heapClassInst.heap32[(g0 + 7)] = Int32(r9);
      __FUNCTION_TABLE__[(r3) >> 2](i7);
      return;
    }
  } while (false);
  r0 = 0;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK10__cxxabiv120__si_class_type_info20__do_find_public_srcEiPKvPKNS_17__class_type_infoES2_(sp: Int64) : Unit
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
  r0 = Int64(heapClassInst.heap32[(fp + 4)]);
  r1 = Int64(heapClassInst.heap32[(fp + 2)]);
  r2 = Int64(heapClassInst.heap32[(fp)]);
  r3 = Int64(heapClassInst.heap32[(fp + 3)]);
  if (!(r0 != r1)) 
  {
    r4 = r3 >> 2;
    r5 = r2 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4 + 1)]);
    r5 = Int64(heapClassInst.heap32[(r5 + 1)]);
    r6 = _E2_str26;
    r4 = if (r4 == 0) {r6} else {r4};
    r5 = if (r5 == 0) {r6} else {r5};
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0 + 1)] = Int32(r4);
    strcmp(i7);
    r6 = commonVariable.r_g0;
    if (!(r6 < 0)) 
    {
      heapClassInst.heap32[(g0)] = Int32(r4);
      heapClassInst.heap32[(g0 + 1)] = Int32(r5);
      strcmp(i7);
      r4 = commonVariable.r_g0;
      if (r4 > ( -1)) 
      {
        r0 = 6;
        commonVariable.r_g0 = r0;
        return;
      }
    }
  }
  r4 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = r2 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 2)]);
  r5 = r2 >> 2;
  r5 = Int64(heapClassInst.heap32[(r5)]);
  r5 = r5 >> 2;
  r5 = Int64(heapClassInst.heap32[(r5 + 7)]);
  heapClassInst.heap32[(g0)] = Int32(r2);
  heapClassInst.heap32[(g0 + 1)] = Int32(r4);
  heapClassInst.heap32[(g0 + 2)] = Int32(r1);
  heapClassInst.heap32[(g0 + 3)] = Int32(r3);
  heapClassInst.heap32[(g0 + 4)] = Int32(r0);
  __FUNCTION_TABLE__[(r5) >> 2](i7);
  return;
}

func _ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-32); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r2 = r0 >> 2;
  r3 = r1 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2 + 1)]);
  r4 = Int64(heapClassInst.heap32[(r3 + 1)]);
  r5 = _E2_str26;
  r2 = if (r2 == 0) {r5} else {r2};
  r4 = if (r4 == 0) {r5} else {r4};
  heapClassInst.heap32[(g0)] = Int32(r4);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  r6 = Int64(heapClassInst.heap32[(fp + 2)]);
  r7 = Int64(heapClassInst.heap32[(fp + 3)]);
  strcmp(i7);
  r8 = commonVariable.r_g0;
  if (r8 < 0) 
  {
    __label__ = 3;
  }
  else {
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0 + 1)] = Int32(r4);
    strcmp(i7);
    r2 = commonVariable.r_g0;
    if (r2 < 0) 
    {
      __label__ = 3;
    }
    else {
      r0 = r7 >> 2;
      heapClassInst.heap32[(r0)] = Int32(r6);
      heapClassInst.heap32[(r0 + 3)] = 8;
      heapClassInst.heap32[(r0 + 1)] = 6;
      __label__ = 39;
    }
  }
  do {
    if (__label__ == 3) {
      r2 = r7 >> 2;
      r4 = Int64(heapClassInst.heap32[(r2 + 2)]);
      r7 = r4 & 16;
      if (r7 != 0) 
      {
        r4 = Int64(heapClassInst.heap32[(r3 + 2)]);
      }
      r3 = Int64(heapClassInst.heap32[(r3 + 3)]);
      r7 = r4 & 1;
      r3 = (r3 + 1) | 0;
      while (true) {
        if (r3 != 1) 
        {
          r8 = sp + (-16);
          r9 = r8 >> 2;
          heapClassInst.heap32[(fp + (-4))] = 0;
          r10 = r3 << 3;
          heapClassInst.heap32[(r9 + 1)] = 0;
          r10 = (r1 + r10) | 0;
          heapClassInst.heap32[(r9 + 2)] = Int32(r4);
          r10 = r10 >> 2;
          heapClassInst.heap32[(r9 + 3)] = 0;
          r10 = Int64(heapClassInst.heap32[(r10 + 1)]);
          r11 = r10 & 2;
          if (r7 != 0) 
          {
            __label__ = 9;
          }
          else {
            r12 = r11 >> 1;
            if (r12 != 0) 
            {
              __label__ = 9;
            }
            else {
              __label__ = 8;
            }
          }
          if (__label__ == 9) {
            r12 = r3 << 1;
            r13 = r10 & 1;
            if (r6 != 0) 
            {
              r10 = r10 >> 8;
              if (r13 != 0) 
              {
                r14 = r6 >> 2;
                r14 = Int64(heapClassInst.heap32[(r14)]);
                r10 = (r14 + r10) | 0;
                r10 = r10 >> 2;
                r10 = Int64(heapClassInst.heap32[(r10)]);
              }
              r10 = (r6 + r10) | 0;
            }
            else {
              r10 = 0;
            }
            r12 = r12 << 2;
            r12 = (r1 + r12) | 0;
            r12 = r12 >> 2;
            r14 = Int64(heapClassInst.heap32[(r12)]);
            r15 = r14 >> 2;
            r15 = Int64(heapClassInst.heap32[(r15)]);
            r15 = r15 >> 2;
            r15 = Int64(heapClassInst.heap32[(r15 + 5)]);
            heapClassInst.heap32[(g0)] = Int32(r14);
            heapClassInst.heap32[(g0 + 1)] = Int32(r0);
            heapClassInst.heap32[(g0 + 2)] = Int32(r10);
            heapClassInst.heap32[(g0 + 3)] = Int32(r8);
            __FUNCTION_TABLE__[(r15) >> 2](i7);
            r8 = commonVariable.r_g0;
            if (!(r8 == 0)) 
            {
              r8 = Int64(heapClassInst.heap32[(r9 + 3)]);
              if (!(r8 != 8)) 
              {
                if (r13 != 0) 
                {
                  r8 = Int64(heapClassInst.heap32[(r12)]);
                  heapClassInst.heap32[(r9 + 3)] = Int32(r8);
                }
              }
              r10 = Int64(heapClassInst.heap32[(r9 + 1)]);
              if (!(r10 < 4)) 
              {
                if (r11 == 0) 
                {
                  r10 = r10 & ( -3);
                  heapClassInst.heap32[(r9 + 1)] = Int32(r10);
                }
              }
              r11 = Int64(heapClassInst.heap32[(r2 + 3)]);
              if (r11 != 0) 
              {
                r9 = Int64(heapClassInst.heap32[(r2)]);
                r12 = Int64(heapClassInst.heap32[(fp + (-4))]);
                if (r9 == r12) 
                {
                  if (r9 == 0) 
                  {
                    if (r8 == 8) 
                    {
                      __label__ = 35;
                      break 
                    }
                    else {
                      if (r11 == 8) 
                      {
                        __label__ = 35;
                        break 
                      }
                      else {
                        r9 = r11 >> 2;
                        r8 = r8 >> 2;
                        r9 = Int64(heapClassInst.heap32[(r9 + 1)]);
                        r8 = Int64(heapClassInst.heap32[(r8 + 1)]);
                        r9 = if (r9 == 0) {r5} else {r9};
                        r8 = if (r8 == 0) {r5} else {r8};
                        heapClassInst.heap32[(g0)] = Int32(r8);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r9);
                        strcmp(i7);
                        r11 = commonVariable.r_g0;
                        if (r11 < 0) 
                        {
                          __label__ = 35;
                          break 
                        }
                        else {
                          heapClassInst.heap32[(g0)] = Int32(r9);
                          heapClassInst.heap32[(g0 + 1)] = Int32(r8);
                          strcmp(i7);
                          r8 = commonVariable.r_g0;
                          if (r8 > ( -1)) 
                          {
                            r8 = Int64(heapClassInst.heap32[(r2 + 1)]);
                            r8 = r10 | r8;
                            heapClassInst.heap32[(r2 + 1)] = Int32(r8);
                          }
                          else {
                            __label__ = 35;
                            break 
                          }
                        }
                      }
                    }
                  }
                  else {
                    r8 = Int64(heapClassInst.heap32[(r2 + 1)]);
                    r8 = r10 | r8;
                    heapClassInst.heap32[(r2 + 1)] = Int32(r8);
                  }
                }
                else {
                  __label__ = 28;
                  break 
                }
              }
              else {
                r11 = Int64(heapClassInst.heap32[(fp + (-4))]);
                heapClassInst.heap32[(r2)] = Int32(r11);
                heapClassInst.heap32[(r2 + 1)] = Int32(r10);
                r11 = Int64(heapClassInst.heap32[(r9 + 2)]);
                heapClassInst.heap32[(r2 + 2)] = Int32(r11);
                heapClassInst.heap32[(r2 + 3)] = Int32(r8);
                if (r10 < 4) 
                {
                  break 
                }
                else {
                  r8 = r10 & 2;
                  if (r8 == 0) 
                  {
                    r8 = r10 & 1;
                    if (r8 == 0) 
                    {
                      break 
                    }
                    else {
                      r8 = Int64(heapClassInst.heapU8[r1 + 8]);
                      r8 = r8 & 2;
                      if (r8 == 0) 
                      {
                        break 
                      }
                    }
                  }
                  else {
                    r8 = Int64(heapClassInst.heapU8[r1 + 8]);
                    r8 = r8 & 1;
                    if (r8 == 0) 
                    {
                      break 
                    }
                  }
                }
              }
            }
          }
          r3 = (r3 + (-1)) | 0;
          continue 
        }
        else {
          __label__ = 38;
          break 
        }
      }
      match (__label__) {
        case 38 =>
          r0 = Int64(heapClassInst.heap32[(r2 + 1)]);
          r1 = 0;
          r0 = if (r0 != r1) {1} else {0};
          r0 = r0 & 1;
          commonVariable.r_g0 = r0;
          return;
          // break;
        case 28 =>
          heapClassInst.heap32[(r2)] = 0;
          // break;
        // default:
        //   break
        case _ =>
          println("break13434")
      }
      heapClassInst.heap32[(r2 + 1)] = 2;
    }
  } while (false);
  r0 = 1;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK10__cxxabiv121__vmi_class_type_info12__do_dyncastEiNS_17__class_type_info10__sub_kindEPKS1_PKvS4_S6_RNS1_16__dyncast_resultE(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-56); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 7)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 4)]);
  r2 = Int64(heapClassInst.heap32[(fp)]);
  r3 = Int64(heapClassInst.heap32[(fp + 1)]);
  r4 = Int64(heapClassInst.heap32[(fp + 2)]);
  r5 = Int64(heapClassInst.heap32[(fp + 3)]);
  r6 = Int64(heapClassInst.heap32[(fp + 4)]);
  r7 = Int64(heapClassInst.heap32[(fp + 5)]);
  r8 = Int64(heapClassInst.heap32[(fp + 6)]);
  r9 = r1 & 16;
  if (r9 != 0) 
  {
    r1 = r2 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1 + 2)]);
    heapClassInst.heap32[(r0 + 4)] = Int32(r1);
  }
  r9 = r2 >> 2;
  r10 = Int64(heapClassInst.heap32[(r9 + 1)]);
  if (r6 != r8) 
  {
    __label__ = 5;
  }
  else {
    r11 = r7 >> 2;
    r11 = Int64(heapClassInst.heap32[(r11 + 1)]);
    r12 = _E2_str26;
    r11 = if (r11 == 0) {r12} else {r11};
    r12 = if (r10 == 0) {r12} else {r10};
    heapClassInst.heap32[(g0)] = Int32(r12);
    heapClassInst.heap32[(g0 + 1)] = Int32(r11);
    strcmp(i7);
    r13 = commonVariable.r_g0;
    if (r13 < 0) 
    {
      __label__ = 5;
    }
    else {
      heapClassInst.heap32[(g0)] = Int32(r11);
      heapClassInst.heap32[(g0 + 1)] = Int32(r12);
      strcmp(i7);
      r11 = commonVariable.r_g0;
      if (r11 > ( -1)) 
      {
        heapClassInst.heap32[(r0 + 2)] = Int32(r4);
        __label__ = 8;
      }
      else {
        __label__ = 5;
      }
    }
  }
  do {
    if (__label__ == 5) {
      r11 = r5 >> 2;
      r12 = Int64(heapClassInst.heap32[(r11 + 1)]);
      r13 = _E2_str26;
      r12 = if (r12 == 0) {r13} else {r12};
      r10 = if (r10 == 0) {r13} else {r10};
      heapClassInst.heap32[(g0)] = Int32(r10);
      heapClassInst.heap32[(g0 + 1)] = Int32(r12);
      strcmp(i7);
      r13 = commonVariable.r_g0;
      if (r13 < 0) 
      {
        __label__ = 14;
      }
      else {
        heapClassInst.heap32[(g0)] = Int32(r12);
        heapClassInst.heap32[(g0 + 1)] = Int32(r10);
        strcmp(i7);
        r10 = commonVariable.r_g0;
        if (r10 < 0) 
        {
          __label__ = 14;
        }
        else {
          heapClassInst.heap32[(r0)] = Int32(r6);
          heapClassInst.heap32[(r0 + 1)] = Int32(r4);
          if (r3 < 0) 
          {
            if (r3 == ( -2)) 
            {
              heapClassInst.heap32[(r0 + 3)] = 1;
              r9 = 0;
              commonVariable.r_g0 = r9;
              return;
            }
            else {
              __label__ = 12;
            }
          }
          else {
            r1 = (r6 + r3) | 0;
            r2 = 6;
            r3 = 1;
            r1 = if (r1 == r8) {r2} else {r3};
            heapClassInst.heap32[(r0 + 3)] = Int32(r1);
            break 
          }
        }
      }
      do {
        if (__label__ == 14) {
          r10 = Int64(heapClassInst.heap32[(r9 + 3)]);
          r12 = r1 & 2;
          r9 = 0;
          r13 = r1;
          while (true) {
            r14 = r13 & 3;
            while (true) {
              r15 = r9;
              r9 = r10 << 3;
              r9 = (r2 + r9) | 0;
              r20 = 0;
              while (true) {
                r16 = r20;
                if (r10 != r16) 
                {
                  r17 = sp + (-24);
                  r18 = r17 >> 2;
                  heapClassInst.heap32[(fp + (-6))] = 0;
                  heapClassInst.heap32[(r18 + 1)] = 0;
                  heapClassInst.heap32[(r18 + 2)] = 0;
                  r19 = r16 << 3;
                  r19 = (r9 - r19) | 0;
                  heapClassInst.heap32[(r18 + 3)] = 0;
                  r19 = r19 >> 2;
                  heapClassInst.heap32[(r18 + 4)] = Int32(r13);
                  r20 = Int64(heapClassInst.heap32[(r19 + 3)]);
                  r21 = r20 & 1;
                  r22 = r20 >> 8;
                  if (r21 != 0) 
                  {
                    r23 = r6 >> 2;
                    r23 = Int64(heapClassInst.heap32[(r23)]);
                    r22 = (r23 + r22) | 0;
                    r22 = r22 >> 2;
                    r22 = Int64(heapClassInst.heap32[(r22)]);
                  }
                  r20 = r20 & 2;
                  if (r20 == 0) 
                  {
                    if (r3 != ( -2)) 
                    {
                      __label__ = 21;
                      break 
                    }
                    else {
                      r20 = (r16 + 1) | 0;
                      if (r14 == 0) 
                      {
                        continue 
                      }
                      else {
                        __label__ = 21;
                        break 
                      }
                    }
                  }
                  else {
                    __label__ = 18;
                    break 
                  }
                }
                else {
                  __label__ = 77;
                  break 
                }
              }
              match (__label__) {
                case 21 =>
                  r9 = r4 & ( -3);
                  // break;
                case 18 =>
                  r9 = r4;
                  // break;
                // default:
                //   break
                case _ =>
                  println("break13655")
              }
              r20 = Int64(heapClassInst.heap32[(r19 + 2)]);
              r19 = r20 >> 2;
              r19 = Int64(heapClassInst.heap32[(r19)]);
              r19 = r19 >> 2;
              r19 = Int64(heapClassInst.heap32[(r19 + 6)]);
              r9 = r21 | r9;
              r21 = (r6 + r22) | 0;
              heapClassInst.heap32[(g0)] = Int32(r20);
              heapClassInst.heap32[(g0 + 1)] = Int32(r3);
              heapClassInst.heap32[(g0 + 2)] = Int32(r9);
              heapClassInst.heap32[(g0 + 3)] = Int32(r5);
              heapClassInst.heap32[(g0 + 4)] = Int32(r21);
              heapClassInst.heap32[(g0 + 5)] = Int32(r7);
              heapClassInst.heap32[(g0 + 6)] = Int32(r8);
              heapClassInst.heap32[(g0 + 7)] = Int32(r17);
              __FUNCTION_TABLE__[(r19) >> 2](i7);
              r9 = commonVariable.r_g0;
              r20 = Int64(heapClassInst.heap32[(r0 + 2)]);
              r17 = Int64(heapClassInst.heap32[(r18 + 2)]);
              r20 = r17 | r20;
              heapClassInst.heap32[(r0 + 2)] = Int32(r20);
              r17 = Int64(heapClassInst.heap32[(r18 + 3)]);
              if (r17 == 2) 
              {
                __label__ = 24;
                break 
              }
              else {
                if (r17 != 6) 
                {
                  r19 = (r10 + (-1)) | 0;
                  r10 = Int64(heapClassInst.heap32[(r0)]);
                  r21 = r15 & 255;
                  if (r21 != 0) 
                  {
                    __label__ = 30;
                    break 
                  }
                  else {
                    if (r10 != 0) 
                    {
                      __label__ = 31;
                      break 
                    }
                    else {
                      r10 = Int64(heapClassInst.heap32[(fp + (-6))]);
                      heapClassInst.heap32[(r0)] = Int32(r10);
                      r15 = Int64(heapClassInst.heap32[(r18 + 1)]);
                      heapClassInst.heap32[(r0 + 1)] = Int32(r15);
                      if (r10 != 0) 
                      {
                        r10 = (r19 - r16) | 0;
                        if (r20 == 0) 
                        {
                          continue 
                        }
                        else {
                          __label__ = 29;
                          break 
                        }
                      }
                      else {
                        __label__ = 73;
                        break 
                      }
                    }
                  }
                }
                else {
                  __label__ = 24;
                  break 
                }
              }
            }
            do {
              match (__label__) {
                case 30 =>
                  if (r10 == 0) 
                  {
                    r14 = Int64(heapClassInst.heap32[(fp + (-6))]);
                    r10 = 0;
                    __label__ = 36;
                    break 
                  }
                  else {
                    __label__ = 31;
                    break 
                  }
                  // break;
                case 29 =>
                  r10 = Int64(heapClassInst.heapU8[r2 + 8]);
                  r10 = r10 & 1;
                  if (r10 != 0) 
                  {
                    __label__ = 73;
                  }
                  else {
                    __label__ = 78;
                    break 
                  }
                //   break;
                // default:
                //   break
                case _ =>
                  println("break13761")
              }
            } while (false);
            if (__label__ == 31) {
              r14 = Int64(heapClassInst.heap32[(fp + (-6))]);
              if (r10 != r14) 
              {
                if (r14 != 0) 
                {
                  __label__ = 39;
                }
                else {
                  if (r9 == 0) 
                  {
                    __label__ = 36;
                  }
                  else {
                    __label__ = 39;
                  }
                }
              }
              else {
                r9 = Int64(heapClassInst.heap32[(r0 + 1)]);
                r10 = Int64(heapClassInst.heap32[(r18 + 1)]);
                r9 = r10 | r9;
                heapClassInst.heap32[(r0 + 1)] = Int32(r9);
                r9 = r15;
                __label__ = 73;
              }
            }
            do {
              if (__label__ == 36) {
                if (!(r14 == 0)) 
                {
                  if (!(r21 == 0)) 
                  {
                    __label__ = 39;
                    break 
                  }
                }
                r9 = r15;
                __label__ = 73;
              }
            } while (false);
            if (__label__ == 39) {
              r9 = Int64(heapClassInst.heap32[(r0 + 3)]);
              do {
                if (r20 > 3) 
                {
                  r14 = r20 & 1;
                  if (!(r14 == 0)) 
                  {
                    if (!(r12 == 0)) 
                    {
                      r13 = r1;
                      __label__ = 43;
                      break 
                    }
                  }
                  r13 = if (r14 == 0) {r13} else {r1};
                  r10 = 1;
                  r9 = if (r9 == 0) {r10} else {r9};
                  if (r17 == 0) 
                  {
                    r17 = r10;
                    __label__ = 64;
                  }
                  else {
                    __label__ = 64;
                  }
                }
                else {
                  __label__ = 43;
                }
              } while (false);
              do {
                if (__label__ == 43) {
                  if (r9 < 1) 
                  {
                    do {
                      if (!(r17 < 4)) 
                      {
                        r9 = r17 & 1;
                        if (r9 != 0) 
                        {
                          r9 = Int64(heapClassInst.heapU8[r2 + 8]);
                          r9 = r9 & 2;
                          if (!(r9 == 0)) 
                          {
                            break 
                          }
                        }
                        r9 = 1;
                        break 
                      }
                    } while (false);
                    if (r3 < 0) 
                    {
                      if (r3 != ( -2)) 
                      {
                        r9 = Int64(heapClassInst.heap32[(r11)]);
                        r9 = r9 >> 2;
                        r9 = Int64(heapClassInst.heap32[(r9 + 7)]);
                        heapClassInst.heap32[(g0)] = Int32(r5);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r3);
                        heapClassInst.heap32[(g0 + 2)] = Int32(r10);
                        heapClassInst.heap32[(g0 + 3)] = Int32(r7);
                        heapClassInst.heap32[(g0 + 4)] = Int32(r8);
                        __FUNCTION_TABLE__[(r9) >> 2](i7);
                        r9 = commonVariable.r_g0;
                      }
                      else {
                        r9 = 1;
                      }
                    }
                    else {
                      r9 = (r10 + r3) | 0;
                      r10 = 6;
                      r14 = 1;
                      r9 = if (r9 == r8) {r10} else {r14};
                    }
                  }
                  if (r17 < 1) 
                  {
                    if (r9 < 4) 
                    {
                      __label__ = 60;
                    }
                    else {
                      r10 = r9 & 1;
                      if (r10 != 0) 
                      {
                        r10 = Int64(heapClassInst.heapU8[r2 + 8]);
                        r10 = r10 & 2;
                        if (r10 == 0) 
                        {
                          __label__ = 58;
                        }
                        else {
                          __label__ = 60;
                        }
                      }
                      else {
                        __label__ = 58;
                      }
                    }
                    if (__label__ == 60) {
                      r10 = Int64(heapClassInst.heap32[(fp + (-6))]);
                      if (r3 < 0) 
                      {
                        if (!(r3 == ( -2))) 
                        {
                          r14 = Int64(heapClassInst.heap32[(r11)]);
                          r14 = r14 >> 2;
                          r14 = Int64(heapClassInst.heap32[(r14 + 7)]);
                          heapClassInst.heap32[(g0)] = Int32(r5);
                          heapClassInst.heap32[(g0 + 1)] = Int32(r3);
                          heapClassInst.heap32[(g0 + 2)] = Int32(r10);
                          heapClassInst.heap32[(g0 + 3)] = Int32(r7);
                          heapClassInst.heap32[(g0 + 4)] = Int32(r8);
                          __FUNCTION_TABLE__[(r14) >> 2](i7);
                          r17 = commonVariable.r_g0;
                          break 
                        }
                      }
                      else {
                        r10 = (r10 + r3) | 0;
                        r14 = 6;
                        r17 = 1;
                        r17 = if (r10 == r8) {r14} else {r17};
                        break 
                      }
                    }
                    r17 = 1;
                  }
                }
              } while (false);
              r10 = r9 ^ r17;
              if (r10 < 4) 
              {
                r9 = r9 & r17;
                heapClassInst.heap32[(r0)] = 0;
                if (r9 < 4) 
                {
                  r9 = 1;
                  heapClassInst.heap32[(r0 + 3)] = 1;
                }
                else {
                  __label__ = 71;
                  break 
                }
              }
              else {
                if (r17 > 3) 
                {
                  r9 = Int64(heapClassInst.heap32[(fp + (-6))]);
                  heapClassInst.heap32[(r0)] = Int32(r9);
                  r9 = Int64(heapClassInst.heap32[(r18 + 1)]);
                  r15 = 0;
                  heapClassInst.heap32[(r0 + 1)] = Int32(r9);
                  r9 = r17;
                }
                heapClassInst.heap32[(r0 + 3)] = Int32(r9);
                r10 = r9 & 2;
                if (r10 != 0) 
                {
                  __label__ = 12;
                  break 
                }
                else {
                  r9 = r9 & 1;
                  if (r9 == 0) 
                  {
                    __label__ = 12;
                    break 
                  }
                  else {
                    r9 = r15;
                  }
                }
              }
            }
            r10 = (r19 - r16) | 0;
            if (r20 != 4) 
            {
              continue 
            }
            else {
              __label__ = 78;
              break 
            }
          }
          match (__label__) {
            case 24 =>
              r20 = Int64(heapClassInst.heap32[(fp + (-6))]);
              heapClassInst.heap32[(r0)] = Int32(r20);
              r20 = Int64(heapClassInst.heap32[(r18 + 1)]);
              heapClassInst.heap32[(r0 + 1)] = Int32(r20);
              heapClassInst.heap32[(r0 + 3)] = Int32(r17);
              commonVariable.r_g0 = r9;
              return;
              // break;
            case 71 =>
              heapClassInst.heap32[(r0 + 3)] = 2;
              r9 = 1;
              commonVariable.r_g0 = r9;
              return;
              // break;
            case 77 =>
              r9 = r15;
              __label__ = 78;
            //   break;
            // default:
            //   break
            case _ =>
              println("break14016")
          }
        }
      } while (false);
      if (__label__ == 12) {
        r9 = 0;
      }
      r0 = r9 & 255;
      commonVariable.r_g0 = r0;
      return;
    }
  } while (false);
  r0 = 0;
  commonVariable.r_g0 = r0;
  return;
}

func _ZNK10__cxxabiv121__vmi_class_type_info20__do_find_public_srcEiPKvPKNS_17__class_type_infoES2_(sp: Int64) : Unit
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
  r1 = Int64(heapClassInst.heap32[(fp + 4)]);
  r2 = Int64(heapClassInst.heap32[(fp)]);
  r3 = Int64(heapClassInst.heap32[(fp + 3)]);
  if (r0 != r1) 
  {
    __label__ = 4;
  }
  else {
    r4 = r3 >> 2;
    r5 = r2 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4 + 1)]);
    r5 = Int64(heapClassInst.heap32[(r5 + 1)]);
    r6 = _E2_str26;
    r4 = if (r4 == 0) {r6} else {r4};
    r5 = if (r5 == 0) {r6} else {r5};
    heapClassInst.heap32[(g0)] = Int32(r5);
    heapClassInst.heap32[(g0 + 1)] = Int32(r4);
    strcmp(i7);
    r6 = commonVariable.r_g0;
    if (r6 < 0) 
    {
      __label__ = 4;
    }
    else {
      heapClassInst.heap32[(g0)] = Int32(r4);
      heapClassInst.heap32[(g0 + 1)] = Int32(r5);
      strcmp(i7);
      r4 = commonVariable.r_g0;
      if (r4 < 0) 
      {
        __label__ = 4;
      }
      else {
        r0 = 6;
        __label__ = 15;
      }
    }
  }
  if (__label__ == 4) {
    r4 = Int64(heapClassInst.heap32[(fp + 1)]);
    r5 = r2 >> 2;
    r5 = Int64(heapClassInst.heap32[(r5 + 3)]);
    r5 = (r5 + 1) | 0;
    while (true) {
      if (r5 != 1) 
      {
        r6 = r5 << 3;
        r6 = (r2 + r6) | 0;
        r6 = r6 >> 2;
        r6 = Int64(heapClassInst.heap32[(r6 + 1)]);
        r7 = r6 & 2;
        do {
          if (r7 != 0) 
          {
            r7 = r6 & 1;
            if (!(r7 == 0)) 
            {
              if (r4 == ( -3)) 
              {
                break 
              }
            }
            r8 = r5 << 1;
            r6 = r6 >> 8;
            if (r7 != 0) 
            {
              r9 = r0 >> 2;
              r9 = Int64(heapClassInst.heap32[(r9)]);
              r6 = (r9 + r6) | 0;
              r6 = r6 >> 2;
              r6 = Int64(heapClassInst.heap32[(r6)]);
            }
            r8 = r8 << 2;
            r8 = (r2 + r8) | 0;
            r8 = r8 >> 2;
            r8 = Int64(heapClassInst.heap32[(r8)]);
            r9 = r8 >> 2;
            r9 = Int64(heapClassInst.heap32[(r9)]);
            r9 = r9 >> 2;
            r9 = Int64(heapClassInst.heap32[(r9 + 7)]);
            r6 = (r0 + r6) | 0;
            heapClassInst.heap32[(g0)] = Int32(r8);
            heapClassInst.heap32[(g0 + 1)] = Int32(r4);
            heapClassInst.heap32[(g0 + 2)] = Int32(r6);
            heapClassInst.heap32[(g0 + 3)] = Int32(r3);
            heapClassInst.heap32[(g0 + 4)] = Int32(r1);
            __FUNCTION_TABLE__[(r9) >> 2](i7);
            r6 = commonVariable.r_g0;
            if (!(r6 < 4)) 
            {
              __label__ = 12;
              break 
            }
          }
        } while (false);
        r5 = (r5 + (-1)) | 0;
        continue 
      }
      else {
        __label__ = 14;
        break 
      }
    }
    match (__label__) {
      case 14 =>
        r0 = 1;
        // break;
      case 12 =>
        r0 = r6 | r7;
        commonVariable.r_g0 = r0;
        return;
      //   break;
      // default:
      //   break
      case _ =>
          println("break14166")
    }
  }
  commonVariable.r_g0 = r0;
  return;
}

func _ZN10__cxxabiv121__vmi_class_type_infoD0Ev(sp: Int64) : Unit
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
  r1 = _ZTVSt9type_info;
  r2 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r2)] = Int32(r1);
  heapClassInst.heap32[(g0)] = Int32(r0);
  _ZdlPv(i7);
  return;
}

func _ZN10__cxxabiv121__vmi_class_type_infoD1Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = _ZTVSt9type_info;
  r0 = r0 >> 2;
  r1 = (r1 + 8) | 0;
  heapClassInst.heap32[(r0)] = Int32(r1);
  return;
}

func __extendsfdf2(sp: Int64) : Unit
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
  r1 = r0 & 2147483647;
  r2 = r0 & ( -2147483648);
  r3 = (r1 + (-8388608)) | 0;
  if (`UIntNative`(r3) > `UIntNative`(2130706431)) 
  {
    if (`UIntNative`(r1) < `UIntNative`(2139095040)) 
    {
      if (r1 != 0) 
      {
        r0 = r1 >> 1;
        r0 = r1 | r0;
        r3 = r0 >> 2;
        r0 = r0 | r3;
        r3 = r0 >> 4;
        r0 = r0 | r3;
        r3 = r0 >> 8;
        r0 = r0 | r3;
        r3 = r0 >> 16;
        r0 = r0 | r3;
        r3 = r0 ^ ( -1);
        r4 = 1431655765;
        r3 = r3 >> 1;
        r0 = r4 & (!r0);
        r3 = r3 & 1431655765;
        r0 = (r0 + r3) | 0;
        r3 = r0 >> 2;
        r0 = r0 & 858993459;
        r3 = r3 & 858993459;
        r0 = (r0 + r3) | 0;
        r3 = r0 >> 4;
        r0 = r0 & 252645135;
        r3 = r3 & 252645135;
        r0 = (r0 + r3) | 0;
        r3 = r0 >> 8;
        r0 = r0 & 16711935;
        r3 = r3 & 16711935;
        r0 = (r0 + r3) | 0;
        r3 = r0 & 65535;
        r0 = r0 >> 16;
        r0 = (r3 + r0) | 0;
        r3 = (r0 + 21) | 0;
        heapClassInst.heap32[(g0)] = Int32(r1);
        heapClassInst.heap32[(g0 + 1)] = 0;
        heapClassInst.heap32[(g0 + 2)] = Int32(r3);
        r3 = 905;
        __ashldi3(i7);
        r1 = commonVariable.r_g0;
        r0 = (r3 - r0) | 0;
        r3 = commonVariable.r_g1 ^ 1048576;
        r0 = r0 << 20;
        r0 = r3 | r0;
      }
      else {
        r1 = 0;
        r0 = r1;
      }
    }
    else {
      r1 = r0 >> 3;
      r3 = r1 & 524288;
      r1 = r0 & 4194303;
      r0 = r3 | 2146435072;
    }
  }
  else {
    r0 = r1 >> 3;
    r1 = r1 << 29;
    r0 = (r0 + 939524096) | 0;
  }
  r3 = sp + (-8);
  r3 = r3 >> 2;
  r0 = r0 | r2;
  heapClassInst.heap32[(fp + (-2))] = Int32(r1);
  heapClassInst.heap32[(r3 + 1)] = Int32(r0);
  f0 = llvm_readDouble((sp + (-8)));
  commonVariable.f_g0 = f0;
  return;
}

func __fixdfsi(sp: Int64) : Unit
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
  r0 = sp + 0;
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r1 = r0 >> 20;
  r1 = r1 & 2047;
  r2 = r0 & 1048575;
  r3 = ( -1);
  r4 = 1;
  r5 = (r1 + (-1023)) | 0;
  r0 = if (r0 < 0) {r3} else {r4};
  r3 = Int64(heapClassInst.heap32[(fp)]);
  r2 = r2 | 1048576;
  if (`UIntNative`(r5) > `UIntNative`(51)) 
  {
    if (r5 < 0) 
    {
      r0 = 0;
      commonVariable.r_g0 = r0;
      return;
    }
    else {
      r1 = (r1 + (-1075)) | 0;
      heapClassInst.heap32[(g0)] = Int32(r3);
      heapClassInst.heap32[(g0 + 1)] = Int32(r2);
      heapClassInst.heap32[(g0 + 2)] = Int32(r1);
      __ashldi3(i7);
    }
  }
  else {
    r5 = 1075;
    r1 = (r5 - r1) | 0;
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
    heapClassInst.heap32[(g0 + 2)] = Int32(r1);
    __lshrdi3(i7);
  }
  heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0);
  heapClassInst.heap32[(g0 + 1)] = Int32(commonVariable.r_g1);
  heapClassInst.heap32[(g0 + 2)] = Int32(r0);
  heapClassInst.heap32[(g0 + 3)] = Int32(r0);
  __muldi3(i7);
  return;
}

func __floatsidf(sp: Int64) : Unit
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
  if (r0 != 0) 
  {
    r1 = r0 >> 31;
    r2 = (r0 + r1) | 0;
    r1 = r2 ^ r1;
    r2 = r1 >> 1;
    r2 = r1 | r2;
    r3 = r2 >> 2;
    r2 = r2 | r3;
    r3 = r2 >> 4;
    r2 = r2 | r3;
    r3 = r2 >> 8;
    r2 = r2 | r3;
    r3 = r2 >> 16;
    r2 = r2 | r3;
    r3 = r2 ^ ( -1);
    r4 = 1431655765;
    r3 = r3 >> 1;
    r2 = r4 & (!r2);
    r3 = r3 & 1431655765;
    r2 = (r2 + r3) | 0;
    r3 = r2 >> 2;
    r2 = r2 & 858993459;
    r3 = r3 & 858993459;
    r2 = (r2 + r3) | 0;
    r3 = r2 >> 4;
    r2 = r2 & 252645135;
    r3 = r3 & 252645135;
    r2 = (r2 + r3) | 0;
    r3 = r2 >> 8;
    r2 = r2 & 16711935;
    r3 = r3 & 16711935;
    r2 = (r2 + r3) | 0;
    r3 = r2 & 65535;
    r2 = r2 >> 16;
    r4 = 31;
    r2 = (r3 + r2) | 0;
    r3 = 52;
    r4 = (r4 - r2) | 0;
    r3 = (r3 - r4) | 0;
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0 + 1)] = 0;
    heapClassInst.heap32[(g0 + 2)] = Int32(r3);
    r1 = 1054;
    __ashldi3(i7);
    r1 = (r1 - r2) | 0;
    r2 = commonVariable.r_g1 ^ 1048576;
    r1 = r1 << 20;
    r4 = sp + (-8);
    r1 = (r2 + r1) | 0;
    r0 = r0 & ( -2147483648);
    r2 = r4 >> 2;
    r0 = r1 | r0;
    heapClassInst.heap32[(fp + (-2))] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(r2 + 1)] = Int32(r0);
    f0 = llvm_readDouble((sp + (-8)));
    commonVariable.f_g0 = f0;
    return;
  }
  else {
    f0 = 0.0;
    commonVariable.f_g0 = f0;
    return;
  }
}

func __floatunsidf(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var f0: Float64 = 0.0
  var __label__ = 0;
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  if (r0 != 0) 
  {
    r1 = r0 >> 1;
    r1 = r0 | r1;
    r2 = r1 >> 2;
    r1 = r1 | r2;
    r2 = r1 >> 4;
    r1 = r1 | r2;
    r2 = r1 >> 8;
    r1 = r1 | r2;
    r2 = r1 >> 16;
    r1 = r1 | r2;
    r2 = r1 ^ ( -1);
    r3 = 1431655765;
    r2 = r2 >> 1;
    r1 = r3 & (!r1);
    r2 = r2 & 1431655765;
    r1 = (r1 + r2) | 0;
    r2 = r1 >> 2;
    r1 = r1 & 858993459;
    r2 = r2 & 858993459;
    r1 = (r1 + r2) | 0;
    r2 = r1 >> 4;
    r1 = r1 & 252645135;
    r2 = r2 & 252645135;
    r1 = (r1 + r2) | 0;
    r2 = r1 >> 8;
    r1 = r1 & 16711935;
    r2 = r2 & 16711935;
    r1 = (r1 + r2) | 0;
    r2 = r1 & 65535;
    r1 = r1 >> 16;
    r3 = 31;
    r1 = (r2 + r1) | 0;
    r2 = 52;
    r3 = (r3 - r1) | 0;
    r2 = (r2 - r3) | 0;
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = 0;
    heapClassInst.heap32[(g0 + 2)] = Int32(r2);
    r0 = 1054;
    __ashldi3(i7);
    r0 = (r0 - r1) | 0;
    r1 = sp + (-8);
    r3 = commonVariable.r_g1 ^ 1048576;
    r0 = r0 << 20;
    r1 = r1 >> 2;
    r0 = (r3 + r0) | 0;
    heapClassInst.heap32[(fp + (-2))] = Int32(commonVariable.r_g0);
    heapClassInst.heap32[(r1 + 1)] = Int32(r0);
    f0 = llvm_readDouble((sp + (-8)));
    commonVariable.f_g0 = f0;
    return;
  }
  else {
    f0 = 0.0;
    commonVariable.f_g0 = f0;
    return;
  }
}

func __truncdfsf2(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = sp + 0;
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r1 = r0 & 2147483647;
  r2 = Int64(heapClassInst.heap32[(fp)]);
  r3 = (r1 + (-940572672)) | 0;
  r4 = (r1 + (-1206910976)) | 0;
  do {
    if (`UIntNative`(r3) >= `UIntNative`(r4)) 
    {
      r3 = 0;
      r4 = 2146435072;
      r5 = if (r2 == r3) {1} else {0};
      r4 = if (`UIntNative`(r1) < `UIntNative`(r4)) {1} else {0};
      r4 = if (r1 == 2146435072) {r5} else {r4};
      if (r4 != 0) 
      {
        r4 = 1206910976;
        r4 = if (`UIntNative`(r1) < `UIntNative`(r4)) {1} else {0};
        r4 = if (r1 == 1206910976) {r5} else {r4};
        if (r4 != 0) 
        {
          r4 = 897;
          r1 = r1 >> 20;
          r1 = (r4 - r1) | 0;
          if (r1 < 53) 
          {
            r4 = r0 & 1048575;
            r4 = r4 | 1048576;
            heapClassInst.heap32[(g0)] = Int32(r2);
            heapClassInst.heap32[(g0 + 1)] = Int32(r4);
            heapClassInst.heap32[(g0 + 2)] = Int32(r1);
            __lshrdi3(i7);
            r5 = commonVariable.r_g0;
            r6 = commonVariable.r_g1;
            r7 = 64;
            r1 = (r7 - r1) | 0;
            heapClassInst.heap32[(g0)] = Int32(r2);
            heapClassInst.heap32[(g0 + 1)] = Int32(r4);
            heapClassInst.heap32[(g0 + 2)] = Int32(r1);
            __ashldi3(i7);
            r1 = commonVariable.r_g0 | commonVariable.r_g1;
            r1 = if (r1 != r3) {1} else {0};
            r1 = r1 & 1;
            r2 = r5 & 536870911;
            r4 = r5 >> 29;
            r5 = r6 << 3;
            r1 = r1 | r2;
            r2 = r4 | r5;
            if (`UIntNative`(r1) < `UIntNative`(268435457)) 
            {
              r1 = r1 ^ 268435456;
              r3 = r1 | r3;
              if (r3 == 0) 
              {
                r3 = r2 & 1;
                r3 = (r3 + r2) | 0;
              }
              else {
                r3 = r2;
              }
            }
            else {
              r3 = (r2 + 1) | 0;
            }
          }
          else {
            break 
          }
        }
        else {
          r3 = 2139095040;
        }
      }
      else {
        r1 = r2 & 4194303;
        r3 = r1 | 2143289344;
      }
    }
    else {
      r1 = r2 >> 29;
      r3 = r0 << 3;
      r1 = r1 | r3;
      r2 = r2 & 536870911;
      if (`UIntNative`(r2) < `UIntNative`(268435457)) 
      {
        r3 = (r1 + 1073741824) | 0;
        r1 = 0;
        r2 = r2 ^ 268435456;
        r1 = r2 | r1;
        if (r1 == 0) 
        {
          r1 = r3 & 1;
          r3 = (r1 + r3) | 0;
        }
      }
      else {
        r3 = (r1 + 1073741825) | 0;
      }
    }
  } while (false);
  r0 = r0 & ( -2147483648);
  r0 = r3 | r0;
  heapClassInst.heap32[(fp + (-1))] = Int32(r0);
  f0 = Float64(heapClassInst.heapFloat[(fp + (-1))]);
  commonVariable.f_g0 = f0;
  return;
}

func __fixunsdfsi(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = sp + 0;
  r0 = r0 >> 2;
  r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r1 = r0 >> 20;
  r1 = r1 & 2047;
  r2 = (r1 + (-1023)) | 0;
  if (!(r2 < 0)) 
  {
    if (!(r0 < 0)) 
    {
      r2 = Int64(heapClassInst.heap32[(fp)]);
      r2 = r2 >> 21;
      r0 = r0 << 11;
      r0 = r2 | r0;
      r2 = 1054;
      r0 = r0 | ( -2147483648);
      r1 = (r2 - r1) | 0;
      r0 = r0 >> r1;
      commonVariable.r_g0 = r0;
      return;
    }
  }
  r0 = 0;
  commonVariable.r_g0 = r0;
  return;
}

func __floatundisf(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = r0 | r1;
  if (r2 == 0) 
  {
    f0 = 0.0;
    commonVariable.f_g0 = f0;
    return;
  }
  else {
    r2 = r0 >> 1;
    r3 = r1 >> 1;
    r2 = r0 | r2;
    r3 = r1 | r3;
    r4 = r2 >> 2;
    r5 = r3 >> 2;
    r2 = r2 | r4;
    r3 = r3 | r5;
    r4 = r2 >> 4;
    r5 = r3 >> 4;
    r2 = r2 | r4;
    r3 = r3 | r5;
    r4 = r2 >> 8;
    r5 = r3 >> 8;
    r2 = r2 | r4;
    r3 = r3 | r5;
    r4 = r2 >> 16;
    r5 = r3 >> 16;
    r2 = r2 | r4;
    r3 = r3 | r5;
    r4 = r2 ^ ( -1);
    r5 = 1431655765;
    r6 = r3 ^ ( -1);
    r4 = r4 >> 1;
    r6 = r6 >> 1;
    r2 = r5 & (!r2);
    r4 = r4 & 1431655765;
    r2 = (r2 + r4) | 0;
    r3 = r5 & (!r3);
    r4 = r6 & 1431655765;
    r3 = (r3 + r4) | 0;
    r4 = r2 >> 2;
    r5 = r3 >> 2;
    r2 = r2 & 858993459;
    r4 = r4 & 858993459;
    r2 = (r2 + r4) | 0;
    r3 = r3 & 858993459;
    r4 = r5 & 858993459;
    r3 = (r3 + r4) | 0;
    r4 = r2 >> 4;
    r5 = r3 >> 4;
    r2 = r2 & 252645135;
    r4 = r4 & 252645135;
    r2 = (r2 + r4) | 0;
    r3 = r3 & 252645135;
    r4 = r5 & 252645135;
    r3 = (r3 + r4) | 0;
    r4 = r2 >> 8;
    r5 = r3 >> 8;
    r2 = r2 & 16711935;
    r4 = r4 & 16711935;
    r2 = (r2 + r4) | 0;
    r3 = r3 & 16711935;
    r4 = r5 & 16711935;
    r3 = (r3 + r4) | 0;
    r4 = r2 & 65535;
    r2 = r2 >> 16;
    r2 = (r4 + r2) | 0;
    r4 = r3 & 65535;
    r3 = r3 >> 16;
    r3 = (r4 + r3) | 0;
    r2 = (r2 + 32) | 0;
    r4 = 64;
    r2 = if (r1 != 0) {r3} else {r2};
    r3 = 63;
    r4 = (r4 - r2) | 0;
    r2 = (r3 - r2) | 0;
    if (r4 < 25) 
    {
      r3 = 24;
      r3 = (r3 - r4) | 0;
      heapClassInst.heap32[(g0)] = Int32(r0);
      heapClassInst.heap32[(g0 + 1)] = Int32(r1);
      heapClassInst.heap32[(g0 + 2)] = Int32(r3);
      __ashldi3(i7);
      r1 = commonVariable.r_g0;
    }
    else {
      if (r4 == 25) 
      {
        r1 = r1 << 1;
        r3 = r0 >> 31;
        r0 = r0 << 1;
        r1 = r1 | r3;
      }
      else {
        if (r4 != 26) 
        {
          r3 = (r4 + (-26)) | 0;
          heapClassInst.heap32[(g0)] = Int32(r0);
          heapClassInst.heap32[(g0 + 1)] = Int32(r1);
          heapClassInst.heap32[(g0 + 2)] = Int32(r3);
          __lshrdi3(i7);
          r3 = commonVariable.r_g0;
          r5 = commonVariable.r_g1;
          r6 = 90;
          r6 = (r6 - r4) | 0;
          heapClassInst.heap32[(g0)] = ( -1);
          heapClassInst.heap32[(g0 + 1)] = ( -1);
          heapClassInst.heap32[(g0 + 2)] = Int32(r6);
          __lshrdi3(i7);
          r0 = commonVariable.r_g0 & r0;
          r1 = commonVariable.r_g1 & r1;
          r0 = r0 | r1;
          r1 = 0;
          r0 = if (r0 != r1) {1} else {0};
          r0 = r0 & 1;
          r0 = r0 | r3;
          r1 = r5;
        }
      }
      r3 = r0 >> 2;
      r3 = r3 & 1;
      r0 = r3 | r0;
      r3 = (r0 + 1) | 0;
      r5 = 1;
      r6 = 0;
      r0 = if (`UIntNative`(r3) < `UIntNative`(r0)) {r5} else {r6};
      r0 = if (r3 == 0) {r5} else {r0};
      r0 = (r1 + r0) | 0;
      r1 = r3 >> 2;
      r5 = r0 << 30;
      r1 = r1 | r5;
      r5 = r1 & 16777216;
      if (r5 != 0) 
      {
        r1 = r3 >> 3;
        r0 = r0 << 29;
        r1 = r1 | r0;
        r2 = r4;
      }
    }
    r0 = r2 << 23;
    r0 = (r0 + 1065353216) | 0;
    r1 = r1 & 8388607;
    r0 = r0 | r1;
    heapClassInst.heap32[(fp + (-1))] = Int32(r0);
    f0 = Float64(heapClassInst.heapFloat[(fp + (-1))]);
    commonVariable.f_g0 = f0;
    return;
  }
}

func __floatdisf(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + (-24); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r2 = r0 | r1;
  if (r2 == 0) 
  {
    f0 = 0.0;
    commonVariable.f_g0 = f0;
    return;
  }
  else {
    r2 = r1 >> 31;
    r1 = r2 ^ r1;
    r0 = r2 ^ r0;
    r3 = 1;
    r4 = 0;
    r5 = (r0 - r2) | 0;
    r1 = (r1 - r2) | 0;
    r0 = if (`UIntNative`(r0) < `UIntNative`(r2)) {r3} else {r4};
    r0 = (r1 - r0) | 0;
    r1 = r5 >> 1;
    r6 = r0 >> 1;
    r1 = r5 | r1;
    r6 = r0 | r6;
    r7 = r1 >> 2;
    r8 = r6 >> 2;
    r1 = r1 | r7;
    r6 = r6 | r8;
    r7 = r1 >> 4;
    r8 = r6 >> 4;
    r1 = r1 | r7;
    r6 = r6 | r8;
    r7 = r1 >> 8;
    r8 = r6 >> 8;
    r1 = r1 | r7;
    r6 = r6 | r8;
    r7 = r1 >> 16;
    r8 = r6 >> 16;
    r1 = r1 | r7;
    r6 = r6 | r8;
    r7 = r1 ^ ( -1);
    r8 = 1431655765;
    r9 = r6 ^ ( -1);
    r7 = r7 >> 1;
    r9 = r9 >> 1;
    r1 = r8 & (!r1);
    r7 = r7 & 1431655765;
    r1 = (r1 + r7) | 0;
    r6 = r8 & (!r6);
    r7 = r9 & 1431655765;
    r6 = (r6 + r7) | 0;
    r7 = r1 >> 2;
    r8 = r6 >> 2;
    r1 = r1 & 858993459;
    r7 = r7 & 858993459;
    r1 = (r1 + r7) | 0;
    r6 = r6 & 858993459;
    r7 = r8 & 858993459;
    r6 = (r6 + r7) | 0;
    r7 = r1 >> 4;
    r8 = r6 >> 4;
    r1 = r1 & 252645135;
    r7 = r7 & 252645135;
    r1 = (r1 + r7) | 0;
    r6 = r6 & 252645135;
    r7 = r8 & 252645135;
    r6 = (r6 + r7) | 0;
    r7 = r1 >> 8;
    r8 = r6 >> 8;
    r1 = r1 & 16711935;
    r7 = r7 & 16711935;
    r1 = (r1 + r7) | 0;
    r6 = r6 & 16711935;
    r7 = r8 & 16711935;
    r6 = (r6 + r7) | 0;
    r7 = r1 & 65535;
    r1 = r1 >> 16;
    r1 = (r7 + r1) | 0;
    r7 = r6 & 65535;
    r6 = r6 >> 16;
    r6 = (r7 + r6) | 0;
    r1 = (r1 + 32) | 0;
    r7 = 64;
    r1 = if (r0 != 0) {r6} else {r1};
    r6 = 63;
    r7 = (r7 - r1) | 0;
    r1 = (r6 - r1) | 0;
    if (r7 < 25) 
    {
      r3 = 24;
      r3 = (r3 - r7) | 0;
      heapClassInst.heap32[(g0)] = Int32(r5);
      heapClassInst.heap32[(g0 + 1)] = Int32(r0);
      heapClassInst.heap32[(g0 + 2)] = Int32(r3);
      __ashldi3(i7);
      r5 = commonVariable.r_g0;
    }
    else {
      if (r7 == 25) 
      {
        r0 = r0 << 1;
        r6 = r5 >> 31;
        r5 = r5 << 1;
        r0 = r0 | r6;
      }
      else {
        if (r7 != 26) 
        {
          r6 = (r7 + (-26)) | 0;
          heapClassInst.heap32[(g0)] = Int32(r5);
          heapClassInst.heap32[(g0 + 1)] = Int32(r0);
          heapClassInst.heap32[(g0 + 2)] = Int32(r6);
          __lshrdi3(i7);
          r6 = commonVariable.r_g0;
          r8 = commonVariable.r_g1;
          r9 = 90;
          r9 = (r9 - r7) | 0;
          heapClassInst.heap32[(g0)] = ( -1);
          heapClassInst.heap32[(g0 + 1)] = ( -1);
          heapClassInst.heap32[(g0 + 2)] = Int32(r9);
          __lshrdi3(i7);
          r5 = commonVariable.r_g0 & r5;
          r0 = commonVariable.r_g1 & r0;
          r0 = r5 | r0;
          r0 = if (r0 != r4) {1} else {0};
          r0 = r0 & 1;
          r5 = r0 | r6;
          r0 = r8;
        }
      }
      r6 = r5 >> 2;
      r6 = r6 & 1;
      r5 = r6 | r5;
      r6 = (r5 + 1) | 0;
      r5 = if (`UIntNative`(r6) < `UIntNative`(r5)) {r3} else {r4};
      r5 = if (r6 == 0) {r3} else {r5};
      r0 = (r0 + r5) | 0;
      r5 = r6 >> 2;
      r3 = r0 << 30;
      r5 = r5 | r3;
      r3 = r5 & 16777216;
      if (r3 != 0) 
      {
        r0 = r0 >> 2;
        r5 = r5 >> 1;
        r0 = r0 << 31;
        r5 = r5 | r0;
        r1 = r7;
      }
    }
    r0 = r1 << 23;
    r1 = r5 & 8388607;
    r2 = r2 & ( -2147483648);
    r1 = r1 | r2;
    r0 = (r0 + 1065353216) | 0;
    r0 = r1 | r0;
    heapClassInst.heap32[(fp + (-1))] = Int32(r0);
    f0 = Float64(heapClassInst.heapFloat[(fp + (-1))]);
    commonVariable.f_g0 = f0;
    return;
  }
}

func _GLOBAL__I__mandreel_create_tcp_socket(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = swrite_Index.mandreel_flash_tcp_onError__index__;
  r1 = _ZZL32_mandreel_init_tcp_socket_librayvE47s_723478567_mandreel_mandreel_flash_tcp_onError;
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r1);
  iMandreelRegisterExternalCallback(i7);
  return;
}

func mandreel_flash_tcp_onConnect(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  return;
}

func mandreel_flash_tcp_receive_callbak(sp: Int64) : Unit
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
  i7 = sp + (-32784); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r2 = Int64(heapClassInst.heapU8[r0]);
  do {
    if (r2 != 0) 
    {
      r3 = (r0 + 1) | 0;
      r4 = 0;
      while (true) {
        r2 = (r4 + 1) | 0;
        r5 = Int64(heapClassInst.heapU8[r3 + r4]);
        r4 = r2;
        if (r5 != 0) 
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
  r3 = sp + (-32768);
  heapClassInst.heap32[(g0)] = Int32(r0);
  heapClassInst.heap32[(g0 + 1)] = Int32(r2);
  heapClassInst.heap32[(g0 + 2)] = Int32(r3);
  heapClassInst.heap32[(g0 + 3)] = 32768;
  r0 = _ZL10s_aSockets;
  r2 = 0;
  _ZN12mandreel_b6410b64_decodeEPKcjPvj(i7);
  r4 = commonVariable.r_g0;
  r6 = _ZL10s_aSockets;
  while (true) {
    if (`UIntNative`(r2) < `UIntNative`(8)) 
    {
      r5 = (r2 * 8198) | 0;
      r5 = r5 << 2;
      r5 = (r6 + r5) | 0;
      r5 = r5 >> 2;
      r5 = Int64(heapClassInst.heap32[(r5 + 8196)]);
      if (r5 != r1) 
      {
        r2 = (r2 + 1) | 0;
        r0 = (r0 + 32792) | 0;
        continue 
      }
      else {
        __label__ = 9;
        break 
      }
    }
    else {
      __label__ = 8;
      break 
    }
  }
  if (__label__ == 8) {
    r0 = 0;
  }
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1 + 8194)]);
  if (r4 > 0) 
  {
    r5 = r4;
    while (true) {
      r6 = (r2 + 1) | 0;
      r5 = (r5 + (-1)) | 0;
      r6 = r6 & 32767;
      r7 = (r3 + 1) | 0;
      r3 = Int64(heapClassInst.heapU8[r3]);
      heapClassInst.heap8[r0 + r2] = Int8(r3);
      r3 = r7;
      r2 = r6;
      if (!(r5 != 0)) 
      {
        break 
      }
    }
    r2 = r6;
  }
  heapClassInst.heap32[(r1 + 8194)] = Int32(r2);
  r0 = Int64(heapClassInst.heap32[(r1 + 8192)]);
  r0 = (r0 + r4) | 0;
  heapClassInst.heap32[(r1 + 8192)] = Int32(r0);
  return;
}

func _GLOBAL__D__ZN8OpenGLES12OpenGLESUtil15getCurrentErrorEv(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var __label__ = 0;
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  heapClassInst.heap32[(g0)] = 0;
  _Z41__static_initialization_and_destruction_0ii(i7);
  return;
}

func _ZNSt5dequeIjSaIjEE5eraseESt15__rw_deque_iterIjiPjRjS0_ES5_(sp: Int64) : Unit
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
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 4)]);
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(fp)]);
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  r3 = Int64(heapClassInst.heap32[(fp + 2)]);
  r4 = Int64(heapClassInst.heap32[(r0)]);
  r5 = Int64(heapClassInst.heap32[(fp + 3)]);
  r6 = Int64(heapClassInst.heap32[(r0 + 1)]);
  r7 = r4 | r3;
  if (r7 != 0) 
  {
    r7 = r6 >> 2;
    r8 = (r6 - r5) | 0;
    r9 = r5 >> 2;
    r8 = r8 << 3;
    r9 = Int64(heapClassInst.heap32[(r9)]);
    r7 = Int64(heapClassInst.heap32[(r7)]);
    r7 = (r4 - r7) | 0;
    r8 = (r8 + (-32)) | 0;
    r9 = (r9 + 128) | 0;
    r9 = (r9 - r3) | 0;
    r7 = r7 >> 2;
    r8 = r8 & ( -32);
    r7 = (r7 + r8) | 0;
    r8 = r9 >> 2;
    r7 = (r7 + r8) | 0;
  }
  else {
    r7 = (r4 - r3) | 0;
    r7 = r7 >> 2;
  }
  r8 = r2 >> 2;
  r9 = Int64(heapClassInst.heap32[(r8)]);
  r10 = Int64(heapClassInst.heap32[(r8 + 1)]);
  r11 = r3 | r9;
  if (r11 != 0) 
  {
    r11 = (r5 - r10) | 0;
    r12 = r5 >> 2;
    r13 = r10 >> 2;
    r11 = r11 << 3;
    r13 = Int64(heapClassInst.heap32[(r13)]);
    r12 = Int64(heapClassInst.heap32[(r12)]);
    r11 = (r11 + (-32)) | 0;
    r12 = (r3 - r12) | 0;
    r13 = (r13 + 128) | 0;
    r13 = (r13 - r9) | 0;
    r11 = r11 & ( -32);
    r12 = r12 >> 2;
    r11 = (r11 + r12) | 0;
    r12 = r13 >> 2;
    r11 = (r11 + r12) | 0;
  }
  else {
    r11 = (r3 - r9) | 0;
    r11 = r11 >> 2;
  }
  r2 = (r2 + 8) | 0;
  r12 = Int64(heapClassInst.heap32[(r8 + 2)]);
  r13 = Int64(heapClassInst.heap32[(r8 + 3)]);
  r14 = r12 | r4;
  if (r14 != 0) 
  {
    r14 = (r13 - r6) | 0;
    r15 = r13 >> 2;
    r16 = r6 >> 2;
    r14 = r14 << 3;
    r16 = Int64(heapClassInst.heap32[(r16)]);
    r15 = Int64(heapClassInst.heap32[(r15)]);
    r14 = (r14 + (-32)) | 0;
    r15 = (r12 - r15) | 0;
    r16 = (r16 + 128) | 0;
    r16 = (r16 - r4) | 0;
    r14 = r14 & ( -32);
    r15 = r15 >> 2;
    r14 = (r14 + r15) | 0;
    r15 = r16 >> 2;
    r14 = (r14 + r15) | 0;
  }
  else {
    r14 = (r12 - r4) | 0;
    r14 = r14 >> 2;
  }
  if (r11 >= r14) 
  {
    r0 = (r5 + 4) | 0;
    r9 = r3;
    while (true) {
      r10 = r4 | r12;
      if (r10 != 0) 
      {
        r10 = r6 >> 2;
        r11 = (r6 - r13) | 0;
        r14 = r13 >> 2;
        r11 = r11 << 3;
        r14 = Int64(heapClassInst.heap32[(r14)]);
        r10 = Int64(heapClassInst.heap32[(r10)]);
        r10 = (r4 - r10) | 0;
        r11 = (r11 + (-32)) | 0;
        r14 = (r14 + 128) | 0;
        r14 = (r14 - r12) | 0;
        r10 = r10 >> 2;
        r11 = r11 & ( -32);
        r10 = (r10 + r11) | 0;
        r11 = r14 >> 2;
        r10 = (r10 + r11) | 0;
      }
      else {
        r10 = (r4 - r12) | 0;
        r10 = r10 >> 2;
      }
      if (r10 != 0) 
      {
        r10 = r4 >> 2;
        r11 = r9 >> 2;
        r10 = Int64(heapClassInst.heap32[(r10)]);
        r4 = (r4 + 4) | 0;
        r14 = r6 >> 2;
        heapClassInst.heap32[(r11)] = Int32(r10);
        r10 = Int64(heapClassInst.heap32[(r14)]);
        r10 = (r10 + 128) | 0;
        if (r4 == r10) 
        {
          r6 = (r6 + 4) | 0;
          r4 = Int64(heapClassInst.heap32[(r14 + 1)]);
        }
        r10 = r0 >> 2;
        r9 = (r9 + 4) | 0;
        r11 = Int64(heapClassInst.heap32[(r10 + (-1))]);
        r11 = (r11 + 128) | 0;
        if (!(r9 != r11)) 
        {
          r9 = Int64(heapClassInst.heap32[(r10)]);
          r0 = (r0 + 4) | 0;
        }
      }
      else {
        break 
      }
    }
    do {
      if (!(r7 == 0)) 
      {
        r0 = Int64(heapClassInst.heap32[(r8 + 2)]);
        while (true) {
          r0 = (r0 + (-4)) | 0;
          heapClassInst.heap32[(r8 + 2)] = Int32(r0);
          r4 = Int64(heapClassInst.heap32[(r8 + 3)]);
          r6 = Int64(heapClassInst.heap32[(r8 + 1)]);
          if (r6 != r4) 
          {
            __label__ = 45;
          }
          else {
            r6 = Int64(heapClassInst.heap32[(r8)]);
            if (r6 != r0) 
            {
              __label__ = 45;
            }
            else {
              r0 = r4 >> 2;
              r4 = Int64(heapClassInst.heap32[(r0)]);
              __label__ = 47;
            }
          }
          if (__label__ == 45) {
            r4 = r4 >> 2;
            r4 = Int64(heapClassInst.heap32[(r4)]);
            if (r0 == r4) 
            {
              __label__ = 47;
            }
            else {
              __label__ = 46;
            }
          }
          do {
            if (__label__ == 47) {
              heapClassInst.heap32[(g0)] = Int32(r4);
              _ZdlPv(i7);
              r0 = Int64(heapClassInst.heap32[(r8 + 3)]);
              r4 = Int64(heapClassInst.heap32[(r8 + 1)]);
              if (!(r4 != r0)) 
              {
                r4 = Int64(heapClassInst.heap32[(r8)]);
                r6 = Int64(heapClassInst.heap32[(r8 + 2)]);
                if (!(r4 != r6)) 
                {
                  r0 = Int64(heapClassInst.heap32[(r8 + 4)]);
                  r0 = (r0 + (-4)) | 0;
                  heapClassInst.heap32[(g0)] = Int32(r0);
                  _ZdlPv(i7);
                  heapClassInst.heap32[(r8 + 2)] = 0;
                  heapClassInst.heap32[(r8 + 3)] = Int32(r2);
                  heapClassInst.heap32[(r8)] = 0;
                  heapClassInst.heap32[(r8 + 1)] = Int32(r2);
                  r0 = 0;
                  heapClassInst.heap32[(r8 + 4)] = 0;
                  heapClassInst.heap32[(r8 + 5)] = 0;
                  break 
                }
              }
              r4 = r0 >> 2;
              r6 = (r0 + (-4)) | 0;
              heapClassInst.heap32[(r4)] = 0;
              heapClassInst.heap32[(r8 + 3)] = Int32(r6);
              r0 = Int64(heapClassInst.heap32[(r4 + (-1))]);
              r0 = (r0 + 128) | 0;
              heapClassInst.heap32[(r8 + 2)] = Int32(r0);
              heapClassInst.heap32[(r8 + 3)] = Int32(r6);
            }
          } while (false);
          r7 = (r7 + (-1)) | 0;
          if (r7 == 0) 
          {
            break 
          }
        }
      }
    } while (false);
    r0 = r1 >> 2;
    heapClassInst.heap32[(r0)] = Int32(r3);
    heapClassInst.heap32[(r0 + 1)] = Int32(r5);
    return;
  }
  else {
    while (true) {
      r12 = r9 | r3;
      if (r12 != 0) 
      {
        r12 = r10 >> 2;
        r13 = (r10 - r5) | 0;
        r11 = r5 >> 2;
        r13 = r13 << 3;
        r11 = Int64(heapClassInst.heap32[(r11)]);
        r12 = Int64(heapClassInst.heap32[(r12)]);
        r12 = (r9 - r12) | 0;
        r13 = (r13 + (-32)) | 0;
        r11 = (r11 + 128) | 0;
        r11 = (r11 - r3) | 0;
        r12 = r12 >> 2;
        r13 = r13 & ( -32);
        r12 = (r12 + r13) | 0;
        r13 = r11 >> 2;
        r12 = (r12 + r13) | 0;
      }
      else {
        r12 = (r9 - r3) | 0;
        r12 = r12 >> 2;
      }
      if (r12 != 0) 
      {
        r12 = r6 >> 2;
        r13 = Int64(heapClassInst.heap32[(r12)]);
        if (r4 == r13) 
        {
          r4 = Int64(heapClassInst.heap32[(r12 + (-1))]);
          r6 = (r6 + (-4)) | 0;
          r4 = (r4 + 128) | 0;
        }
        r12 = r5 >> 2;
        r4 = (r4 + (-4)) | 0;
        r13 = Int64(heapClassInst.heap32[(r12)]);
        if (r3 == r13) 
        {
          r3 = Int64(heapClassInst.heap32[(r12 + (-1))]);
          r5 = (r5 + (-4)) | 0;
          r3 = (r3 + 128) | 0;
        }
        r12 = r3 >> 2;
        r3 = (r3 + (-4)) | 0;
        r13 = r4 >> 2;
        r12 = Int64(heapClassInst.heap32[(r12 + (-1))]);
        heapClassInst.heap32[(r13)] = Int32(r12);
      }
      else {
        break 
      }
    }
    do {
      if (!(r7 == 0)) 
      {
        r3 = Int64(heapClassInst.heap32[(r8)]);
        while (true) {
          r3 = (r3 + 4) | 0;
          heapClassInst.heap32[(r8)] = Int32(r3);
          r4 = Int64(heapClassInst.heap32[(r8 + 1)]);
          r5 = Int64(heapClassInst.heap32[(r8 + 3)]);
          if (r4 != r5) 
          {
            __label__ = 24;
          }
          else {
            r5 = r2 >> 2;
            r5 = Int64(heapClassInst.heap32[(r5)]);
            if (r3 != r5) 
            {
              __label__ = 24;
            }
            else {
              r3 = r4 >> 2;
              r4 = Int64(heapClassInst.heap32[(r3)]);
              __label__ = 26;
            }
          }
          if (__label__ == 24) {
            r4 = r4 >> 2;
            r4 = Int64(heapClassInst.heap32[(r4)]);
            r5 = (r4 + 128) | 0;
            if (r3 == r5) 
            {
              __label__ = 26;
            }
            else {
              __label__ = 25;
            }
          }
          do {
            if (__label__ == 26) {
              heapClassInst.heap32[(g0)] = Int32(r4);
              _ZdlPv(i7);
              r3 = Int64(heapClassInst.heap32[(r8 + 1)]);
              r4 = Int64(heapClassInst.heap32[(r8 + 3)]);
              if (!(r3 != r4)) 
              {
                r4 = Int64(heapClassInst.heap32[(r8)]);
                r5 = Int64(heapClassInst.heap32[(r8 + 2)]);
                if (!(r4 != r5)) 
                {
                  r3 = Int64(heapClassInst.heap32[(r8 + 4)]);
                  r3 = (r3 + (-4)) | 0;
                  heapClassInst.heap32[(g0)] = Int32(r3);
                  _ZdlPv(i7);
                  heapClassInst.heap32[(r8 + 2)] = 0;
                  heapClassInst.heap32[(r8 + 3)] = Int32(r2);
                  heapClassInst.heap32[(r8)] = 0;
                  heapClassInst.heap32[(r8 + 1)] = Int32(r2);
                  r3 = 0;
                  heapClassInst.heap32[(r8 + 4)] = 0;
                  heapClassInst.heap32[(r8 + 5)] = 0;
                  break 
                }
              }
              r4 = r3 >> 2;
              r5 = (r3 + 4) | 0;
              heapClassInst.heap32[(r4)] = 0;
              heapClassInst.heap32[(r8 + 1)] = Int32(r5);
              r3 = Int64(heapClassInst.heap32[(r4 + 1)]);
              heapClassInst.heap32[(r8)] = Int32(r3);
              heapClassInst.heap32[(r8 + 1)] = Int32(r5);
            }
          } while (false);
          r7 = (r7 + (-1)) | 0;
          if (r7 == 0) 
          {
            break 
          }
        }
      }
    } while (false);
    r1 = r1 >> 2;
    r2 = Int64(heapClassInst.heap32[(r0)]);
    heapClassInst.heap32[(r1)] = Int32(r2);
    r2 = Int64(heapClassInst.heap32[(r0 + 1)]);
    heapClassInst.heap32[(r1 + 1)] = Int32(r2);
    return;
  }
}

func _Z41__static_initialization_and_destruction_0ii(sp: Int64) : Unit
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
  i7 = sp + (-80); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  if (r0 == 0) 
  {
    r0 = _ZL13s_fifo_errors;
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1 + 2)]);
    r3 = sp + (-24);
    heapClassInst.heap32[(fp + (-6))] = Int32(r2);
    r2 = r3 >> 2;
    r4 = Int64(heapClassInst.heap32[(r1 + 3)]);
    heapClassInst.heap32[(r2 + 1)] = Int32(r4);
    r2 = Int64(heapClassInst.heap32[(r1)]);
    r1 = Int64(heapClassInst.heap32[(r1 + 1)]);
    r4 = sp + (-32);
  }
  else {
    if (r0 != 1) 
    {
      return;
    }
    else {
      r0 = sp + (-56);
      r1 = r0 >> 2;
      r2 = (r0 + 8) | 0;
      heapClassInst.heap32[(r1 + 2)] = 0;
      heapClassInst.heap32[(r1 + 3)] = Int32(r2);
      heapClassInst.heap32[(fp + (-14))] = 0;
      heapClassInst.heap32[(r1 + 1)] = Int32(r2);
      r2 = _ZL13s_fifo_errors;
      heapClassInst.heap32[(r1 + 4)] = 0;
      r3 = r2 >> 2;
      heapClassInst.heap32[(r1 + 5)] = 0;
      r4 = (r2 + 8) | 0;
      heapClassInst.heap32[(r3 + 2)] = 0;
      heapClassInst.heap32[(r3 + 3)] = Int32(r4);
      heapClassInst.heap32[(r3)] = 0;
      heapClassInst.heap32[(r3 + 1)] = Int32(r4);
      r5 = 0;
      heapClassInst.heap32[(r3 + 4)] = 0;
      heapClassInst.heap32[(r3 + 5)] = 0;
      r6 = r4;
      r7 = r5;
      while (true) {
        if (r7 != 0) 
        {
          r8 = (r2 + 8) | 0;
          r8 = (r8 - r6) | 0;
          r9 = r6 >> 2;
          r8 = r8 << 3;
          r9 = Int64(heapClassInst.heap32[(r9)]);
          r10 = 0;
          r11 = Int64(heapClassInst.heap32[(r3 + 2)]);
          r10 = (r10 - r11) | 0;
          r8 = (r8 + (-32)) | 0;
          r9 = (r9 + 128) | 0;
          r9 = (r9 - r7) | 0;
          r10 = r10 >> 2;
          r8 = r8 & ( -32);
          r8 = (r10 + r8) | 0;
          r9 = r9 >> 2;
          r8 = (r8 + r9) | 0;
        }
        else {
          r8 = 0;
          r8 = (r8 - r7) | 0;
          r8 = r8 >> 2;
        }
        if (r8 != 0) 
        {
          r8 = r4 >> 2;
          r9 = Int64(heapClassInst.heap32[(r8)]);
          if (r5 == r9) 
          {
            r5 = Int64(heapClassInst.heap32[(r8 + (-1))]);
            r4 = (r4 + (-4)) | 0;
            r5 = (r5 + 128) | 0;
          }
          r8 = r6 >> 2;
          r5 = (r5 + (-4)) | 0;
          r9 = Int64(heapClassInst.heap32[(r8)]);
          if (r7 == r9) 
          {
            r7 = Int64(heapClassInst.heap32[(r8 + (-1))]);
            r6 = (r6 + (-4)) | 0;
            r7 = (r7 + 128) | 0;
          }
          r8 = r7 >> 2;
          r7 = (r7 + (-4)) | 0;
          r9 = r5 >> 2;
          r8 = Int64(heapClassInst.heap32[(r8 + (-1))]);
          heapClassInst.heap32[(r9)] = Int32(r8);
        }
        else {
          break 
        }
      }
      r2 = Int64(heapClassInst.heap32[(r1 + 2)]);
      r3 = sp + (-8);
      heapClassInst.heap32[(fp + (-2))] = Int32(r2);
      r2 = r3 >> 2;
      r4 = Int64(heapClassInst.heap32[(r1 + 3)]);
      heapClassInst.heap32[(r2 + 1)] = Int32(r4);
      r2 = Int64(heapClassInst.heap32[(fp + (-14))]);
      r1 = Int64(heapClassInst.heap32[(r1 + 1)]);
      r4 = sp + (-16);
    }
  }
  heapClassInst.heap32[(g0)] = Int32(r4);
  heapClassInst.heap32[(g0 + 1)] = Int32(r0);
  heapClassInst.heap32[(g0 + 2)] = Int32(r2);
  heapClassInst.heap32[(g0 + 3)] = Int32(r1);
  heapClassInst.heap32[(g0 + 4)] = Int32(r3);
  _ZNSt5dequeIjSaIjEE5eraseESt15__rw_deque_iterIjiPjRjS0_ES5_(i7);
  return;
}

func _GLOBAL__I__ZN5my_gl14glAttachShaderEjj(sp: Int64) : Unit
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
  r0 = _ZN5my_glL9m_contextE;
  r1 = r0 >> 2;
  heapClassInst.heap32[(r1 + 62)] = 0;
  heapClassInst.heap32[(r1 + 63)] = 0;
  heapClassInst.heap32[(r1 + 64)] = 0;
  heapClassInst.heap32[(r1 + 65)] = 0;
  heapClassInst.heap32[(r1 + 66)] = 0;
  heapClassInst.heap32[(r1 + 67)] = 0;
  heapClassInst.heap32[(r1 + 78)] = 0;
  heapClassInst.heap32[(r1 + 79)] = 0;
  heapClassInst.heap32[(r1 + 74)] = 0;
  heapClassInst.heap32[(r1 + 77)] = 0;
  heapClassInst.heap32[(r1 + 76)] = 0;
  heapClassInst.heap32[(r1 + 75)] = 0;
  _ZN4__rw9__rb_treeIjSt4pairIKjPN5my_gl12TIndexBufferEENS_11__select1stIS6_jEESt4lessIjESaIS6_EE11_C_get_linkEv(i7);
  r2 = commonVariable.r_g0;
  r3 = r2 >> 2;
  heapClassInst.heap32[(r1 + 78)] = Int32(r2);
  heapClassInst.heap32[(r3 + 1)] = 0;
  heapClassInst.heap32[(r3 + 3)] = Int32(r2);
  heapClassInst.heap32[(r3 + 2)] = Int32(r2);
  heapClassInst.heap32[(r1)] = 0;
  heapClassInst.heap32[(r1 + 3)] = 0;
  heapClassInst.heap32[(r1 + 61)] = 0;
  heapClassInst.heap32[(r1 + 4)] = 0;
  heapClassInst.heap32[(r1 + 68)] = 0;
  heapClassInst.heap32[(r1 + 69)] = 0;
  r2 = _ZL26s_mandreel_internal_height;
  r3 = _ZL25s_mandreel_internal_width;
  heapClassInst.heap32[(r1 + 1)] = 0;
  r2 = r2 >> 2;
  heapClassInst.heap32[(r1 + 2)] = 1;
  r3 = r3 >> 2;
  r2 = Int64(heapClassInst.heap32[(r2)]);
  r3 = Int64(heapClassInst.heap32[(r3)]);
  heapClassInst.heap32[(r1 + 70)] = 0;
  heapClassInst.heap32[(r1 + 71)] = 0;
  r4 = 224;
  heapClassInst.heap32[(r1 + 72)] = Int32(r3);
  heapClassInst.heap32[(r1 + 73)] = Int32(r2);
  r2 = 0;
  while (true) {
    r1 = (r4 + (-1)) | 0;
    r4 = (r0 - r4) | 0;
    heapClassInst.heap8[r4 + 244] = Int8(r2);
    r4 = r1;
    if (r1 != 0) 
    {
      continue 
    }
    else {
      break 
    }
  }
  return;
}

func _GLOBAL__D__ZN5my_gl14glAttachShaderEjj(sp: Int64) : Unit
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
  r0 = _ZN5my_glL9m_contextE;
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 78)]);
  do {
    if (!(r1 == 0)) 
    {
      r2 = r1 >> 2;
      r3 = Int64(heapClassInst.heap32[(r0 + 79)]);
      if (r3 != 0) 
      {
        r1 = Int64(heapClassInst.heap32[(r2 + 1)]);
        heapClassInst.heap32[(g0)] = Int32(r1);
        _ZN4__rw9__rb_treeIjSt4pairIKjPN5my_gl12TIndexBufferEENS_11__select1stIS6_jEESt4lessIjESaIS6_EE8_C_eraseEPNS_17__rw_rb_tree_nodeISB_S6_jS8_EE(i7);
        r1 = Int64(heapClassInst.heap32[(r0 + 78)]);
        r2 = r1 >> 2;
        heapClassInst.heap32[(r2 + 1)] = 0;
        heapClassInst.heap32[(r2 + 3)] = Int32(r1);
        heapClassInst.heap32[(r2 + 2)] = Int32(r1);
        heapClassInst.heap32[(r0 + 79)] = 0;
      }
      else {
        r2 = Int64(heapClassInst.heap32[(r2 + 2)]);
        if (!(r2 == r1)) 
        {
          while (true) {
            r3 = r2;
            r4 = r3 >> 2;
            r2 = Int64(heapClassInst.heap32[(r4 + 3)]);
            do {
              if (r2 != 0) 
              {
                r4 = r2 >> 2;
                r4 = Int64(heapClassInst.heap32[(r4 + 2)]);
                if (r4 == 0) 
                {
                  break 
                }
                else {
                  __label__ = 8; 
                  while (true) {
                    r2 = r4;
                    r4 = r2 >> 2;
                    r4 = Int64(heapClassInst.heap32[(r4 + 2)]);
                    if (r4 != 0) 
                    {
                      continue 
                    }
                    else {
                      break 
                    }
                  }
                }
              }
              else {
                r4 = Int64(heapClassInst.heap32[(r4 + 1)]);
                r2 = r4 >> 2;
                r2 = Int64(heapClassInst.heap32[(r2 + 3)]);
                if (r3 == r2) 
                {
                  while (true) {
                    r2 = r4;
                    r5 = r2 >> 2;
                    r4 = Int64(heapClassInst.heap32[(r5 + 1)]);
                    r6 = r4 >> 2;
                    r6 = Int64(heapClassInst.heap32[(r6 + 3)]);
                    if (!(r2 == r6)) 
                    {
                      break 
                    }
                  }
                  r5 = Int64(heapClassInst.heap32[(r5 + 3)]);
                }
                else {
                  r5 = 0;
                  r2 = r3;
                }
                if (r5 != r4) 
                {
                  r2 = r4;
                }
              }
            } while (false);
            r4 = sp + (-8);
            heapClassInst.heap32[(g0)] = Int32(r4);
            heapClassInst.heap32[(g0 + 1)] = Int32(r3);
            _ZN4__rw9__rb_treeIjSt4pairIKjPN5my_gl12TIndexBufferEENS_11__select1stIS6_jEESt4lessIjESaIS6_EE5eraseENS_14__rw_tree_iterIS6_iPS6_RS6_NS_17__rw_rb_tree_nodeISB_S6_jS8_EEEE(i7);
            if (!(r2 != r1)) 
            {
              break 
            }
          }
          r1 = Int64(heapClassInst.heap32[(r0 + 78)]);
        }
      }
      r2 = r1 >> 2;
      r3 = Int64(heapClassInst.heap32[(r0 + 75)]);
      heapClassInst.heap32[(r2 + 3)] = Int32(r3);
      heapClassInst.heap32[(r0 + 75)] = Int32(r1);
      r1 = Int64(heapClassInst.heap32[(r0 + 74)]);
      if (!(r1 == 0)) 
      {
        __label__ = 16; 
        while (true) {
          r2 = r1 >> 2;
          r3 = Int64(heapClassInst.heap32[(r2)]);
          heapClassInst.heap32[(r0 + 74)] = Int32(r3);
          r2 = Int64(heapClassInst.heap32[(r2 + 2)]);
          heapClassInst.heap32[(g0)] = Int32(r2);
          _ZdlPv(i7);
          heapClassInst.heap32[(g0)] = Int32(r1);
          _ZdlPv(i7);
          r1 = Int64(heapClassInst.heap32[(r0 + 74)]);
          if (r1 != 0) 
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
  r1 = Int64(heapClassInst.heap32[(r0 + 65)]);
  r2 = Int64(heapClassInst.heap32[(r0 + 66)]);
  r3 = (r2 - r1) | 0;
  r3 = r3 >> 5;
  if (r3 != 0) 
  {
    r1 = (r2 + (-32)) | 0;
    heapClassInst.heap32[(r0 + 66)] = Int32(r1);
    r1 = (r2 + (-28)) | 0;
    heapClassInst.heap32[(g0)] = Int32(r1);
    _ZN4__rw9__rb_treeISsSt4pairIKSsiENS_11__select1stIS3_SsEESt4lessISsESaIS3_EED2Ev(i7);
    do {
      if (!(r3 == 1)) 
      {
        r1 = (r3 + (-1)) | 0;
        while (true) {
          r2 = Int64(heapClassInst.heap32[(r0 + 66)]);
          r3 = (r2 + (-32)) | 0;
          heapClassInst.heap32[(r0 + 66)] = Int32(r3);
          r2 = (r2 + (-28)) | 0;
          heapClassInst.heap32[(g0)] = Int32(r2);
          _ZN4__rw9__rb_treeISsSt4pairIKSsiENS_11__select1stIS3_SsEESt4lessISsESaIS3_EED2Ev(i7);
          r1 = (r1 + (-1)) | 0;
          if (!(r1 != 0)) 
          {
            break 
          }
        }
      }
    } while (false);
    r1 = Int64(heapClassInst.heap32[(r0 + 65)]);
  }
  heapClassInst.heap32[(g0)] = Int32(r1);
  _ZdlPv(i7);
  r1 = Int64(heapClassInst.heap32[(r0 + 63)]);
  r2 = Int64(heapClassInst.heap32[(r0 + 62)]);
  r3 = (r1 - r2) | 0;
  r4 = (r3 + 11) | 0;
  if (!(`UIntNative`(r4) < `UIntNative`(23))) 
  {
    r3 = (r3 / ( -12)) | 0;
    r3 = (r3 * 12) | 0;
    r1 = (r1 + r3) | 0;
    heapClassInst.heap32[(r0 + 63)] = Int32(r1);
  }
  heapClassInst.heap32[(g0)] = Int32(r2);
  _ZdlPv(i7);
  return;
}

func _ZN4__rw9__rb_treeIjSt4pairIKjPN5my_gl12TIndexBufferEENS_11__select1stIS6_jEESt4lessIjESaIS6_EE8_C_eraseEPNS_17__rw_rb_tree_nodeISB_S6_jS8_EE(sp: Int64) : Unit
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
  if (!(r0 == 0)) 
  {
    while (true) {
      r1 = r0 >> 2;
      r2 = Int64(heapClassInst.heap32[(r1 + 3)]);
      heapClassInst.heap32[(g0)] = Int32(r2);
      r2 = _ZN5my_glL9m_contextE;
      _ZN4__rw9__rb_treeIjSt4pairIKjPN5my_gl12TIndexBufferEENS_11__select1stIS6_jEESt4lessIjESaIS6_EE8_C_eraseEPNS_17__rw_rb_tree_nodeISB_S6_jS8_EE(i7);
      r2 = r2 >> 2;
      r3 = Int64(heapClassInst.heap32[(r1 + 2)]);
      r4 = Int64(heapClassInst.heap32[(r2 + 75)]);
      heapClassInst.heap32[(r1 + 3)] = Int32(r4);
      heapClassInst.heap32[(r2 + 75)] = Int32(r0);
      r0 = r3;
      if (r3 != 0) 
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

func _ZN4__rw9__rb_treeISsSt4pairIKSsiENS_11__select1stIS3_SsEESt4lessISsESaIS3_EE8_C_eraseEPNS_17__rw_rb_tree_nodeIS8_S3_SsS5_EE(sp: Int64) : Unit
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
  r0 = Int64(heapClassInst.heap32[(fp + 1)]);
  if (!(r0 == 0)) 
  {
    r1 = Int64(heapClassInst.heap32[(fp)]);
    while (true) {
      r2 = r0;
      r3 = r2 >> 2;
      r0 = Int64(heapClassInst.heap32[(r3 + 3)]);
      heapClassInst.heap32[(g0)] = Int32(r1);
      heapClassInst.heap32[(g0 + 1)] = Int32(r0);
      _ZN4__rw9__rb_treeISsSt4pairIKSsiENS_11__select1stIS3_SsEESt4lessISsESaIS3_EE8_C_eraseEPNS_17__rw_rb_tree_nodeIS8_S3_SsS5_EE(i7);
      r4 = r1 >> 2;
      r0 = Int64(heapClassInst.heap32[(r3 + 2)]);
      r5 = Int64(heapClassInst.heap32[(r4 + 1)]);
      heapClassInst.heap32[(r3 + 3)] = Int32(r5);
      r5 = Int64(heapClassInst.heap32[(r3 + 4)]);
      r5 = (r5 + (-12)) | 0;
      r6 = _ZNSs11_C_null_refE;
      if (!(r5 == r6)) 
      {
        r5 = r5 >> 2;
        r6 = Int64(heapClassInst.heap32[(r5)]);
        r7 = (r6 + (-1)) | 0;
        heapClassInst.heap32[(r5)] = Int32(r7);
        if (!(r6 > 0)) 
        {
          r5 = Int64(heapClassInst.heap32[(r3 + 4)]);
          r5 = (r5 + (-12)) | 0;
          heapClassInst.heap32[(g0)] = Int32(r5);
          _ZdlPv(i7);
        }
      }
      heapClassInst.heap32[(r3 + 4)] = 0;
      heapClassInst.heap32[(r4 + 1)] = Int32(r2);
      if (r0 != 0) 
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

func _ZN4__rw9__rb_treeISsSt4pairIKSsiENS_11__select1stIS3_SsEESt4lessISsESaIS3_EE5eraseENS_14__rw_tree_iterIS3_iPS3_RS3_NS_17__rw_rb_tree_nodeIS8_S3_SsS5_EEEESF_(sp: Int64) : Unit
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
  i7 = sp + (-8); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp + 2)]);
  r1 = Int64(heapClassInst.heap32[(fp + 1)]);
  r0 = r0 >> 2;
  r2 = r1 >> 2;
  r3 = Int64(heapClassInst.heap32[(r2 + 4)]);
  r4 = Int64(heapClassInst.heap32[(r0)]);
  r5 = Int64(heapClassInst.heap32[(fp)]);
  r6 = Int64(heapClassInst.heap32[(fp + 3)]);
  r7 = r3 >> 2;
  r8 = Int64(heapClassInst.heap32[(r7 + 2)]);
  if (!(r4 != r8)) 
  {
    if (!(r3 != r6)) 
    {
      r8 = Int64(heapClassInst.heap32[(r2 + 5)]);
      if (r8 != 0) 
      {
        r0 = Int64(heapClassInst.heap32[(r7 + 1)]);
        heapClassInst.heap32[(g0)] = Int32(r1);
        heapClassInst.heap32[(g0 + 1)] = Int32(r0);
        _ZN4__rw9__rb_treeISsSt4pairIKSsiENS_11__select1stIS3_SsEESt4lessISsESaIS3_EE8_C_eraseEPNS_17__rw_rb_tree_nodeIS8_S3_SsS5_EE(i7);
        r0 = Int64(heapClassInst.heap32[(r2 + 4)]);
        r0 = r0 >> 2;
        heapClassInst.heap32[(r0 + 1)] = 0;
        r0 = Int64(heapClassInst.heap32[(r2 + 4)]);
        r1 = r0 >> 2;
        heapClassInst.heap32[(r1 + 3)] = Int32(r0);
        heapClassInst.heap32[(r1 + 2)] = Int32(r0);
        heapClassInst.heap32[(r2 + 5)] = 0;
        r0 = r5 >> 2;
        r1 = Int64(heapClassInst.heap32[(r2 + 4)]);
        heapClassInst.heap32[(r0)] = Int32(r1);
        return;
      }
    }
  }
  r1 = r5 >> 2;
  heapClassInst.heap32[(r1)] = Int32(r3);
  if (!(r4 == r6)) 
  {
    while (true) {
      r3 = r4 >> 2;
      r5 = Int64(heapClassInst.heap32[(r3 + 3)]);
      if (r5 != 0) 
      {
        r7 = r5 >> 2;
        r7 = Int64(heapClassInst.heap32[(r7 + 2)]);
        if (!(r7 == 0)) 
        {
          while (true) {
            r5 = r7;
            r7 = r5 >> 2;
            r7 = Int64(heapClassInst.heap32[(r7 + 2)]);
            if (!(r7 != 0)) 
            {
              break 
            }
          }
        }
        heapClassInst.heap32[(r0)] = Int32(r5);
      }
      else {
        r7 = Int64(heapClassInst.heap32[(r3 + 1)]);
        r5 = r7 >> 2;
        r5 = Int64(heapClassInst.heap32[(r5 + 3)]);
        if (r4 == r5) 
        {
          while (true) {
            r5 = r7;
            r8 = r5 >> 2;
            r7 = Int64(heapClassInst.heap32[(r8 + 1)]);
            r9 = r7 >> 2;
            r9 = Int64(heapClassInst.heap32[(r9 + 3)]);
            if (!(r5 == r9)) 
            {
              break 
            }
          }
          heapClassInst.heap32[(r0)] = Int32(r5);
          r8 = Int64(heapClassInst.heap32[(r8 + 3)]);
        }
        else {
          r8 = 0;
          r5 = r4;
        }
        if (r8 != r7) 
        {
          heapClassInst.heap32[(r0)] = Int32(r7);
          r5 = r7;
        }
      }
      r7 = Int64(heapClassInst.heap32[(r2 + 4)]);
      if (r4 != r7) 
      {
        r9 = Int64(heapClassInst.heap32[(r3 + 3)]);
        do {
          if (r9 != 0) 
          {
            r8 = r9 >> 2;
            r10 = Int64(heapClassInst.heap32[(r8 + 2)]);
            if (r10 == 0) 
            {
              r8 = r9;
            }
            else {
              while (true) {
                r8 = r10;
                r10 = r8 >> 2;
                r10 = Int64(heapClassInst.heap32[(r10 + 2)]);
                if (r10 != 0) 
                {
                  continue 
                }
                else {
                  break 
                }
              }
            }
          }
          else {
            r8 = Int64(heapClassInst.heap32[(r3 + 1)]);
            r10 = r8 >> 2;
            r10 = Int64(heapClassInst.heap32[(r10 + 3)]);
            if (r4 == r10) 
            {
              while (true) {
                r11 = r8;
                r10 = r11 >> 2;
                r8 = Int64(heapClassInst.heap32[(r10 + 1)]);
                r12 = r8 >> 2;
                r12 = Int64(heapClassInst.heap32[(r12 + 3)]);
                if (!(r11 == r12)) 
                {
                  break 
                }
              }
              r10 = Int64(heapClassInst.heap32[(r10 + 3)]);
            }
            else {
              r10 = 0;
              r11 = r4;
            }
            if (r10 == r8) 
            {
              r8 = r11;
            }
          }
        } while (false);
        r10 = Int64(heapClassInst.heap32[(r3 + 2)]);
        if (r10 != 0) 
        {
          if (r9 != 0) 
          {
            r11 = r9 >> 2;
            r12 = Int64(heapClassInst.heap32[(r11 + 2)]);
            do {
              if (r12 == 0) 
              {
                r11 = r9;
              }
              else {
                while (true) {
                  r11 = r12;
                  r12 = r11 >> 2;
                  r12 = Int64(heapClassInst.heap32[(r12 + 2)]);
                  if (!(r12 != 0)) 
                  {
                    break 
                  }
                }
              }
            } while (false);
            r13 = r11 >> 2;
            r9 = Int64(heapClassInst.heap32[(r13 + 3)]);
            if (r11 != r4) 
            {
              r7 = r10 >> 2;
              heapClassInst.heap32[(r7 + 1)] = Int32(r11);
              r7 = Int64(heapClassInst.heap32[(r3 + 2)]);
              heapClassInst.heap32[(r13 + 2)] = Int32(r7);
              r7 = Int64(heapClassInst.heap32[(r3 + 3)]);
              if (r7 != r11) 
              {
                r12 = Int64(heapClassInst.heap32[(r13 + 1)]);
                if (r9 != 0) 
                {
                  r7 = r9 >> 2;
                  heapClassInst.heap32[(r7 + 1)] = Int32(r12);
                  r7 = Int64(heapClassInst.heap32[(r13 + 1)]);
                }
                else {
                  r7 = r12;
                }
                r7 = r7 >> 2;
                heapClassInst.heap32[(r7 + 2)] = Int32(r9);
                r7 = Int64(heapClassInst.heap32[(r3 + 3)]);
                heapClassInst.heap32[(r13 + 3)] = Int32(r7);
                r7 = Int64(heapClassInst.heap32[(r3 + 3)]);
                r7 = r7 >> 2;
                heapClassInst.heap32[(r7 + 1)] = Int32(r11);
              }
              else {
                r12 = r11;
              }
              r7 = Int64(heapClassInst.heap32[(r2 + 4)]);
              r7 = r7 >> 2;
              r10 = Int64(heapClassInst.heap32[(r7 + 1)]);
              if (r10 != r4) 
              {
                r7 = Int64(heapClassInst.heap32[(r3 + 1)]);
                r10 = r7 >> 2;
                r10 = Int64(heapClassInst.heap32[(r10 + 2)]);
                r10 = if (r10 != r4) {1} else {0};
                r10 = r10 & 1;
                r10 = r10 << 2;
                r7 = (r7 + r10) | 0;
                r7 = (r7 + 8) | 0;
                r10 = (r4 + 4) | 0;
                r7 = r7 >> 2;
                heapClassInst.heap32[(r7)] = Int32(r11);
              }
              else {
                r10 = (r4 + 4) | 0;
                heapClassInst.heap32[(r7 + 1)] = Int32(r11);
              }
              r7 = r10 >> 2;
              r7 = Int64(heapClassInst.heap32[(r7)]);
              heapClassInst.heap32[(r13 + 1)] = Int32(r7);
              r7 = Int64(heapClassInst.heap32[(r13)]);
              r11 = Int64(heapClassInst.heap32[(r3)]);
              heapClassInst.heap32[(r13)] = Int32(r11);
              heapClassInst.heap32[(r3)] = Int32(r7);
              __label__ = 66;
            }
            else {
              __label__ = 45;
            }
          }
          else {
            r12 = Int64(heapClassInst.heap32[(r3 + 1)]);
            r11 = r4;
            r9 = r10;
            __label__ = 47;
          }
        }
        else {
          r11 = r4;
          __label__ = 45;
        }
        if (__label__ == 45) {
          r12 = r11 >> 2;
          r12 = Int64(heapClassInst.heap32[(r12 + 1)]);
          if (r9 == 0) 
          {
            r9 = 0;
            __label__ = 48;
          }
          else {
            __label__ = 47;
          }
        }
        if (__label__ == 47) {
          r7 = r9 >> 2;
          heapClassInst.heap32[(r7 + 1)] = Int32(r12);
          r7 = Int64(heapClassInst.heap32[(r2 + 4)]);
          __label__ = 48;
        }
        if (__label__ == 48) {
          r7 = r7 >> 2;
          r10 = Int64(heapClassInst.heap32[(r7 + 1)]);
          if (r10 != r4) 
          {
            r7 = Int64(heapClassInst.heap32[(r3 + 1)]);
            r10 = r7 >> 2;
            r10 = Int64(heapClassInst.heap32[(r10 + 2)]);
            r10 = if (r10 != r4) {1} else {0};
            r10 = r10 & 1;
            r10 = r10 << 2;
            r7 = (r7 + r10) | 0;
            r7 = (r7 + 8) | 0;
            r7 = r7 >> 2;
            heapClassInst.heap32[(r7)] = Int32(r9);
          }
          else {
            heapClassInst.heap32[(r7 + 1)] = Int32(r9);
          }
          r7 = Int64(heapClassInst.heap32[(r2 + 4)]);
          r7 = r7 >> 2;
          r10 = Int64(heapClassInst.heap32[(r7 + 2)]);
          if (!(r10 != r4)) 
          {
            r10 = Int64(heapClassInst.heap32[(r3 + 3)]);
            if (r10 != 0) 
            {
              r10 = r9 >> 2;
              r10 = Int64(heapClassInst.heap32[(r10 + 2)]);
              do {
                if (r10 == 0) 
                {
                  r13 = r9;
                }
                else {
                  while (true) {
                    r13 = r10;
                    r10 = r13 >> 2;
                    r10 = Int64(heapClassInst.heap32[(r10 + 2)]);
                    if (!(r10 != 0)) 
                    {
                      break 
                    }
                  }
                }
              } while (false);
              heapClassInst.heap32[(r7 + 2)] = Int32(r13);
            }
            else {
              r10 = Int64(heapClassInst.heap32[(r3 + 1)]);
              heapClassInst.heap32[(r7 + 2)] = Int32(r10);
            }
          }
          r7 = Int64(heapClassInst.heap32[(r2 + 4)]);
          r7 = r7 >> 2;
          r10 = Int64(heapClassInst.heap32[(r7 + 3)]);
          if (r10 == r4) 
          {
            r4 = Int64(heapClassInst.heap32[(r3 + 2)]);
            if (r4 != 0) 
            {
              r4 = r9 >> 2;
              r4 = Int64(heapClassInst.heap32[(r4 + 3)]);
              do {
                if (r4 == 0) 
                {
                  r3 = r9;
                }
                else {
                  while (true) {
                    r3 = r4;
                    r4 = r3 >> 2;
                    r4 = Int64(heapClassInst.heap32[(r4 + 3)]);
                    if (!(r4 != 0)) 
                    {
                      break 
                    }
                  }
                }
              } while (false);
              heapClassInst.heap32[(r7 + 3)] = Int32(r3);
              r4 = r11;
            }
            else {
              r4 = Int64(heapClassInst.heap32[(r3 + 1)]);
              heapClassInst.heap32[(r7 + 3)] = Int32(r4);
              r4 = r11;
            }
          }
          else {
            r4 = r11;
          }
        }
        r3 = r4 >> 2;
        r7 = Int64(heapClassInst.heap32[(r3)]);
        do {
          if (!(r7 == 0)) 
          {
            while (true) {
              r7 = Int64(heapClassInst.heap32[(r2 + 4)]);
              r7 = r7 >> 2;
              r7 = Int64(heapClassInst.heap32[(r7 + 1)]);
              if (r7 == r9) 
              {
                __label__ = 140;
                break 
              }
              else {
                if (!(r9 == 0)) 
                {
                  r7 = r9 >> 2;
                  r7 = Int64(heapClassInst.heap32[(r7)]);
                  if (!(r7 == 1)) 
                  {
                    __label__ = 141;
                    break 
                  }
                }
                r7 = r12 >> 2;
                r10 = Int64(heapClassInst.heap32[(r7 + 2)]);
                if (r10 != r9) 
                {
                  r11 = r10 >> 2;
                  r13 = Int64(heapClassInst.heap32[(r11)]);
                  if (r13 == 0) 
                  {
                    heapClassInst.heap32[(r11)] = 1;
                    heapClassInst.heap32[(r7)] = 0;
                    r10 = Int64(heapClassInst.heap32[(r7 + 2)]);
                    r11 = r10 >> 2;
                    r13 = Int64(heapClassInst.heap32[(r11 + 3)]);
                    heapClassInst.heap32[(r7 + 2)] = Int32(r13);
                    r13 = Int64(heapClassInst.heap32[(r11 + 3)]);
                    if (!(r13 == 0)) 
                    {
                      r13 = r13 >> 2;
                      heapClassInst.heap32[(r13 + 1)] = Int32(r12);
                    }
                    r13 = Int64(heapClassInst.heap32[(r7 + 1)]);
                    heapClassInst.heap32[(r11 + 1)] = Int32(r13);
                    r13 = Int64(heapClassInst.heap32[(r2 + 4)]);
                    r13 = r13 >> 2;
                    r14 = Int64(heapClassInst.heap32[(r13 + 1)]);
                    if (r14 != r12) 
                    {
                      r13 = Int64(heapClassInst.heap32[(r7 + 1)]);
                      r13 = r13 >> 2;
                      r14 = Int64(heapClassInst.heap32[(r13 + 3)]);
                      if (r14 != r12) 
                      {
                        heapClassInst.heap32[(r13 + 2)] = Int32(r10);
                      }
                      else {
                        heapClassInst.heap32[(r13 + 3)] = Int32(r10);
                      }
                    }
                    else {
                      heapClassInst.heap32[(r13 + 1)] = Int32(r10);
                    }
                    heapClassInst.heap32[(r11 + 3)] = Int32(r12);
                    heapClassInst.heap32[(r7 + 1)] = Int32(r10);
                    r10 = Int64(heapClassInst.heap32[(r7 + 2)]);
                  }
                  r11 = r10 >> 2;
                  r13 = Int64(heapClassInst.heap32[(r11 + 3)]);
                  if (!(r13 == 0)) 
                  {
                    r13 = r13 >> 2;
                    r14 = Int64(heapClassInst.heap32[(r13)]);
                    if (r14 != 1) 
                    {
                      __label__ = 117;
                      break 
                    }
                  }
                  r13 = Int64(heapClassInst.heap32[(r11 + 2)]);
                  if (!(r13 == 0)) 
                  {
                    r13 = r13 >> 2;
                    r13 = Int64(heapClassInst.heap32[(r13)]);
                    if (!(r13 == 1)) 
                    {
                      __label__ = 127;
                      break 
                    }
                  }
                  heapClassInst.heap32[(r11)] = 0;
                }
                else {
                  r10 = Int64(heapClassInst.heap32[(r7 + 3)]);
                  r11 = r10 >> 2;
                  r13 = Int64(heapClassInst.heap32[(r11)]);
                  if (r13 == 0) 
                  {
                    heapClassInst.heap32[(r11)] = 1;
                    heapClassInst.heap32[(r7)] = 0;
                    r10 = Int64(heapClassInst.heap32[(r7 + 3)]);
                    r11 = r10 >> 2;
                    r13 = Int64(heapClassInst.heap32[(r11 + 2)]);
                    heapClassInst.heap32[(r7 + 3)] = Int32(r13);
                    r13 = Int64(heapClassInst.heap32[(r11 + 2)]);
                    if (!(r13 == 0)) 
                    {
                      r13 = r13 >> 2;
                      heapClassInst.heap32[(r13 + 1)] = Int32(r12);
                    }
                    r13 = Int64(heapClassInst.heap32[(r7 + 1)]);
                    heapClassInst.heap32[(r11 + 1)] = Int32(r13);
                    r13 = Int64(heapClassInst.heap32[(r2 + 4)]);
                    r13 = r13 >> 2;
                    r14 = Int64(heapClassInst.heap32[(r13 + 1)]);
                    if (r14 != r12) 
                    {
                      r13 = Int64(heapClassInst.heap32[(r7 + 1)]);
                      r13 = r13 >> 2;
                      r14 = Int64(heapClassInst.heap32[(r13 + 2)]);
                      if (r14 != r12) 
                      {
                        heapClassInst.heap32[(r13 + 3)] = Int32(r10);
                      }
                      else {
                        heapClassInst.heap32[(r13 + 2)] = Int32(r10);
                      }
                    }
                    else {
                      heapClassInst.heap32[(r13 + 1)] = Int32(r10);
                    }
                    heapClassInst.heap32[(r11 + 2)] = Int32(r12);
                    heapClassInst.heap32[(r7 + 1)] = Int32(r10);
                    r10 = Int64(heapClassInst.heap32[(r7 + 3)]);
                  }
                  r11 = r10 >> 2;
                  r13 = Int64(heapClassInst.heap32[(r11 + 2)]);
                  if (!(r13 == 0)) 
                  {
                    r13 = r13 >> 2;
                    r14 = Int64(heapClassInst.heap32[(r13)]);
                    if (r14 != 1) 
                    {
                      __label__ = 83;
                      break 
                    }
                  }
                  r13 = Int64(heapClassInst.heap32[(r11 + 3)]);
                  if (!(r13 == 0)) 
                  {
                    r13 = r13 >> 2;
                    r13 = Int64(heapClassInst.heap32[(r13)]);
                    if (!(r13 == 1)) 
                    {
                      __label__ = 93;
                      break 
                    }
                  }
                  heapClassInst.heap32[(r11)] = 0;
                }
                r10 = Int64(heapClassInst.heap32[(r7 + 1)]);
                r9 = r12;
                r12 = r10;
              }
            }
            do {
              match (__label__) {
                case 117 =>
                  r14 = Int64(heapClassInst.heap32[(r11 + 2)]);
                  if (!(r14 == 0)) 
                  {
                    r14 = r14 >> 2;
                    r14 = Int64(heapClassInst.heap32[(r14)]);
                    if (r14 != 1) 
                    {
                      __label__ = 127;
                      break 
                    }
                  }
                  heapClassInst.heap32[(r13)] = 1;
                  r13 = Int64(heapClassInst.heap32[(r11 + 3)]);
                  r14 = r13 >> 2;
                  heapClassInst.heap32[(r11)] = 0;
                  r15 = Int64(heapClassInst.heap32[(r14 + 2)]);
                  heapClassInst.heap32[(r11 + 3)] = Int32(r15);
                  r15 = Int64(heapClassInst.heap32[(r14 + 2)]);
                  if (!(r15 == 0)) 
                  {
                    r15 = r15 >> 2;
                    heapClassInst.heap32[(r15 + 1)] = Int32(r10);
                  }
                  r15 = Int64(heapClassInst.heap32[(r11 + 1)]);
                  heapClassInst.heap32[(r14 + 1)] = Int32(r15);
                  r15 = Int64(heapClassInst.heap32[(r2 + 4)]);
                  r15 = r15 >> 2;
                  r16 = Int64(heapClassInst.heap32[(r15 + 1)]);
                  if (r16 != r10) 
                  {
                    r15 = Int64(heapClassInst.heap32[(r11 + 1)]);
                    r15 = r15 >> 2;
                    r16 = Int64(heapClassInst.heap32[(r15 + 2)]);
                    if (r16 != r10) 
                    {
                      heapClassInst.heap32[(r15 + 3)] = Int32(r13);
                    }
                    else {
                      heapClassInst.heap32[(r15 + 2)] = Int32(r13);
                    }
                  }
                  else {
                    heapClassInst.heap32[(r15 + 1)] = Int32(r13);
                  }
                  heapClassInst.heap32[(r14 + 2)] = Int32(r10);
                  heapClassInst.heap32[(r11 + 1)] = Int32(r13);
                  r10 = Int64(heapClassInst.heap32[(r7 + 2)]);
                  __label__ = 127;
                  // break 
                case 83 =>
                  r14 = Int64(heapClassInst.heap32[(r11 + 3)]);
                  if (!(r14 == 0)) 
                  {
                    r14 = r14 >> 2;
                    r14 = Int64(heapClassInst.heap32[(r14)]);
                    if (r14 != 1) 
                    {
                      __label__ = 93;
                      break 
                    }
                  }
                  heapClassInst.heap32[(r13)] = 1;
                  r13 = Int64(heapClassInst.heap32[(r11 + 2)]);
                  r14 = r13 >> 2;
                  heapClassInst.heap32[(r11)] = 0;
                  r15 = Int64(heapClassInst.heap32[(r14 + 3)]);
                  heapClassInst.heap32[(r11 + 2)] = Int32(r15);
                  r15 = Int64(heapClassInst.heap32[(r14 + 3)]);
                  if (!(r15 == 0)) 
                  {
                    r15 = r15 >> 2;
                    heapClassInst.heap32[(r15 + 1)] = Int32(r10);
                  }
                  r15 = Int64(heapClassInst.heap32[(r11 + 1)]);
                  heapClassInst.heap32[(r14 + 1)] = Int32(r15);
                  r15 = Int64(heapClassInst.heap32[(r2 + 4)]);
                  r15 = r15 >> 2;
                  r16 = Int64(heapClassInst.heap32[(r15 + 1)]);
                  if (r16 != r10) 
                  {
                    r15 = Int64(heapClassInst.heap32[(r11 + 1)]);
                    r15 = r15 >> 2;
                    r16 = Int64(heapClassInst.heap32[(r15 + 3)]);
                    if (r16 != r10) 
                    {
                      heapClassInst.heap32[(r15 + 2)] = Int32(r13);
                    }
                    else {
                      heapClassInst.heap32[(r15 + 3)] = Int32(r13);
                    }
                  }
                  else {
                    heapClassInst.heap32[(r15 + 1)] = Int32(r13);
                  }
                  heapClassInst.heap32[(r14 + 3)] = Int32(r10);
                  heapClassInst.heap32[(r11 + 1)] = Int32(r13);
                  r10 = Int64(heapClassInst.heap32[(r7 + 3)]);
                  __label__ = 93;
                //   break;
                // default:
                //   break
                case _ =>
                  println("break16709")
              }
            } while (false);
            do {
              match (__label__) {
                case 127 =>
                  r10 = r10 >> 2;
                  r11 = Int64(heapClassInst.heap32[(r7)]);
                  heapClassInst.heap32[(r10)] = Int32(r11);
                  heapClassInst.heap32[(r7)] = 1;
                  r10 = Int64(heapClassInst.heap32[(r10 + 2)]);
                  if (!(r10 == 0)) 
                  {
                    r10 = r10 >> 2;
                    heapClassInst.heap32[(r10)] = 1;
                  }
                  r10 = Int64(heapClassInst.heap32[(r7 + 2)]);
                  r11 = r10 >> 2;
                  r13 = Int64(heapClassInst.heap32[(r11 + 3)]);
                  heapClassInst.heap32[(r7 + 2)] = Int32(r13);
                  r13 = Int64(heapClassInst.heap32[(r11 + 3)]);
                  if (!(r13 == 0)) 
                  {
                    r13 = r13 >> 2;
                    heapClassInst.heap32[(r13 + 1)] = Int32(r12);
                  }
                  r13 = Int64(heapClassInst.heap32[(r7 + 1)]);
                  heapClassInst.heap32[(r11 + 1)] = Int32(r13);
                  r13 = Int64(heapClassInst.heap32[(r2 + 4)]);
                  r13 = r13 >> 2;
                  r14 = Int64(heapClassInst.heap32[(r13 + 1)]);
                  if (r14 != r12) 
                  {
                    r13 = Int64(heapClassInst.heap32[(r7 + 1)]);
                    r13 = r13 >> 2;
                    r14 = Int64(heapClassInst.heap32[(r13 + 3)]);
                    if (r14 != r12) 
                    {
                      heapClassInst.heap32[(r13 + 2)] = Int32(r10);
                    }
                    else {
                      heapClassInst.heap32[(r13 + 3)] = Int32(r10);
                    }
                  }
                  else {
                    heapClassInst.heap32[(r13 + 1)] = Int32(r10);
                  }
                  heapClassInst.heap32[(r11 + 3)] = Int32(r12);
                  heapClassInst.heap32[(r7 + 1)] = Int32(r10);
                  __label__ = 140;
                  // break 
                  // break;
                case 93 =>
                  r10 = r10 >> 2;
                  r11 = Int64(heapClassInst.heap32[(r7)]);
                  heapClassInst.heap32[(r10)] = Int32(r11);
                  heapClassInst.heap32[(r7)] = 1;
                  r10 = Int64(heapClassInst.heap32[(r10 + 3)]);
                  if (!(r10 == 0)) 
                  {
                    r10 = r10 >> 2;
                    heapClassInst.heap32[(r10)] = 1;
                  }
                  r10 = Int64(heapClassInst.heap32[(r7 + 3)]);
                  r11 = r10 >> 2;
                  r13 = Int64(heapClassInst.heap32[(r11 + 2)]);
                  heapClassInst.heap32[(r7 + 3)] = Int32(r13);
                  r13 = Int64(heapClassInst.heap32[(r11 + 2)]);
                  if (!(r13 == 0)) 
                  {
                    r13 = r13 >> 2;
                    heapClassInst.heap32[(r13 + 1)] = Int32(r12);
                  }
                  r13 = Int64(heapClassInst.heap32[(r7 + 1)]);
                  heapClassInst.heap32[(r11 + 1)] = Int32(r13);
                  r13 = Int64(heapClassInst.heap32[(r2 + 4)]);
                  r13 = r13 >> 2;
                  r14 = Int64(heapClassInst.heap32[(r13 + 1)]);
                  if (r14 != r12) 
                  {
                    r13 = Int64(heapClassInst.heap32[(r7 + 1)]);
                    r13 = r13 >> 2;
                    r14 = Int64(heapClassInst.heap32[(r13 + 2)]);
                    if (r14 != r12) 
                    {
                      heapClassInst.heap32[(r13 + 3)] = Int32(r10);
                    }
                    else {
                      heapClassInst.heap32[(r13 + 2)] = Int32(r10);
                    }
                  }
                  else {
                    heapClassInst.heap32[(r13 + 1)] = Int32(r10);
                  }
                  heapClassInst.heap32[(r11 + 2)] = Int32(r12);
                  heapClassInst.heap32[(r7 + 1)] = Int32(r10);
                  __label__ = 140;
                //   break;
                // default:
                //   break
                case _ =>
                  println("break16810")
              }
            } while (false);
            if (__label__ == 140) {
              if (r9 == 0) 
              {
                break 
              }
            }
            r7 = r9 >> 2;
            heapClassInst.heap32[(r7)] = 1;
          }
        } while (false);
        r7 = Int64(heapClassInst.heap32[(r2 + 1)]);
        heapClassInst.heap32[(r3 + 3)] = Int32(r7);
        r7 = Int64(heapClassInst.heap32[(r3 + 4)]);
        r7 = (r7 + (-12)) | 0;
        r9 = _ZNSs11_C_null_refE;
        if (!(r7 == r9)) 
        {
          r7 = r7 >> 2;
          r9 = Int64(heapClassInst.heap32[(r7)]);
          r10 = (r9 + (-1)) | 0;
          heapClassInst.heap32[(r7)] = Int32(r10);
          if (!(r9 > 0)) 
          {
            r7 = Int64(heapClassInst.heap32[(r3 + 4)]);
            r7 = (r7 + (-12)) | 0;
            heapClassInst.heap32[(g0)] = Int32(r7);
            _ZdlPv(i7);
          }
        }
        heapClassInst.heap32[(r3 + 4)] = 0;
        heapClassInst.heap32[(r2 + 1)] = Int32(r4);
        r4 = Int64(heapClassInst.heap32[(r2 + 5)]);
        r4 = (r4 + (-1)) | 0;
        heapClassInst.heap32[(r2 + 5)] = Int32(r4);
      }
      else {
        r8 = r7;
      }
      heapClassInst.heap32[(r1)] = Int32(r8);
      r4 = r5;
      if (r5 != r6) 
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

func _ZN4__rw9__rb_treeIjSt4pairIKjPN5my_gl12TIndexBufferEENS_11__select1stIS6_jEESt4lessIjESaIS6_EE5eraseENS_14__rw_tree_iterIS6_iPS6_RS6_NS_17__rw_rb_tree_nodeISB_S6_jS8_EEEE(sp: Int64) : Unit
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
  var __label__ = 0;
  i7 = sp + 0; 
  var g0 = i7 >> 2; 
  r0 = _ZN5my_glL9m_contextE;
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 78)]);
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  r3 = Int64(heapClassInst.heap32[(fp)]);
  if (r1 != r2) 
  {
    r4 = r2 >> 2;
    r5 = Int64(heapClassInst.heap32[(r4 + 3)]);
    do {
      if (r5 != 0) 
      {
        r6 = r5 >> 2;
        r7 = Int64(heapClassInst.heap32[(r6 + 2)]);
        if (r7 == 0) 
        {
          r6 = r5;
        }
        else {
          while (true) {
            r6 = r7;
            r7 = r6 >> 2;
            r7 = Int64(heapClassInst.heap32[(r7 + 2)]);
            if (r7 != 0) 
            {
              continue 
            }
            else {
              break 
            }
          }
        }
      }
      else {
        r6 = Int64(heapClassInst.heap32[(r4 + 1)]);
        r7 = r6 >> 2;
        r7 = Int64(heapClassInst.heap32[(r7 + 3)]);
        if (r7 == r2) 
        {
          while (true) {
            r8 = r6;
            r7 = r8 >> 2;
            r6 = Int64(heapClassInst.heap32[(r7 + 1)]);
            r9 = r6 >> 2;
            r9 = Int64(heapClassInst.heap32[(r9 + 3)]);
            if (!(r8 == r9)) 
            {
              break 
            }
          }
          r7 = Int64(heapClassInst.heap32[(r7 + 3)]);
        }
        else {
          r7 = 0;
          r8 = r2;
        }
        if (r7 == r6) 
        {
          r6 = r8;
        }
      }
    } while (false);
    r7 = Int64(heapClassInst.heap32[(r4 + 2)]);
    if (r7 != 0) 
    {
      if (r5 != 0) 
      {
        r8 = r5 >> 2;
        r9 = Int64(heapClassInst.heap32[(r8 + 2)]);
        do {
          if (r9 == 0) 
          {
            r8 = r5;
          }
          else {
            while (true) {
              r8 = r9;
              r9 = r8 >> 2;
              r9 = Int64(heapClassInst.heap32[(r9 + 2)]);
              if (!(r9 != 0)) 
              {
                break 
              }
            }
          }
        } while (false);
        r10 = r8 >> 2;
        r5 = Int64(heapClassInst.heap32[(r10 + 3)]);
        if (r8 != r2) 
        {
          r9 = r7 >> 2;
          heapClassInst.heap32[(r9 + 1)] = Int32(r8);
          r9 = Int64(heapClassInst.heap32[(r4 + 2)]);
          heapClassInst.heap32[(r10 + 2)] = Int32(r9);
          r9 = Int64(heapClassInst.heap32[(r4 + 3)]);
          if (r9 != r8) 
          {
            r9 = Int64(heapClassInst.heap32[(r10 + 1)]);
            if (r5 != 0) 
            {
              r7 = r5 >> 2;
              heapClassInst.heap32[(r7 + 1)] = Int32(r9);
              r7 = Int64(heapClassInst.heap32[(r10 + 1)]);
            }
            else {
              r7 = r9;
            }
            r7 = r7 >> 2;
            heapClassInst.heap32[(r7 + 2)] = Int32(r5);
            r7 = Int64(heapClassInst.heap32[(r4 + 3)]);
            heapClassInst.heap32[(r10 + 3)] = Int32(r7);
            r7 = Int64(heapClassInst.heap32[(r4 + 3)]);
            r7 = r7 >> 2;
            heapClassInst.heap32[(r7 + 1)] = Int32(r8);
          }
          else {
            r9 = r8;
          }
          r7 = r1 >> 2;
          r11 = Int64(heapClassInst.heap32[(r7 + 1)]);
          if (r11 != r2) 
          {
            r11 = Int64(heapClassInst.heap32[(r4 + 1)]);
            r7 = r11 >> 2;
            r7 = Int64(heapClassInst.heap32[(r7 + 2)]);
            r7 = if (r7 != r2) {1} else {0};
            r7 = r7 & 1;
            r7 = r7 << 2;
            r11 = (r11 + r7) | 0;
            r7 = (r11 + 8) | 0;
            r11 = (r2 + 4) | 0;
            r7 = r7 >> 2;
            heapClassInst.heap32[(r7)] = Int32(r8);
          }
          else {
            r11 = (r2 + 4) | 0;
            heapClassInst.heap32[(r7 + 1)] = Int32(r8);
          }
          r8 = r11 >> 2;
          r8 = Int64(heapClassInst.heap32[(r8)]);
          heapClassInst.heap32[(r10 + 1)] = Int32(r8);
          r8 = Int64(heapClassInst.heap32[(r10)]);
          r7 = Int64(heapClassInst.heap32[(r4)]);
          heapClassInst.heap32[(r10)] = Int32(r7);
          heapClassInst.heap32[(r4)] = Int32(r8);
          __label__ = 51;
        }
        else {
          __label__ = 30;
        }
      }
      else {
        r9 = Int64(heapClassInst.heap32[(r4 + 1)]);
        r8 = r2;
        r5 = r7;
        __label__ = 32;
      }
    }
    else {
      r8 = r2;
      __label__ = 30;
    }
    if (__label__ == 30) {
      r9 = r8 >> 2;
      r9 = Int64(heapClassInst.heap32[(r9 + 1)]);
      if (r5 == 0) 
      {
        r5 = 0;
        __label__ = 33;
      }
      else {
        __label__ = 32;
      }
    }
    if (__label__ == 32) {
      r7 = r5 >> 2;
      heapClassInst.heap32[(r7 + 1)] = Int32(r9);
      __label__ = 33;
    }
    if (__label__ == 33) {
      r7 = r1 >> 2;
      r10 = Int64(heapClassInst.heap32[(r7 + 1)]);
      if (r10 != r2) 
      {
        r10 = Int64(heapClassInst.heap32[(r4 + 1)]);
        r11 = r10 >> 2;
        r11 = Int64(heapClassInst.heap32[(r11 + 2)]);
        r11 = if (r11 != r2) {1} else {0};
        r11 = r11 & 1;
        r11 = r11 << 2;
        r10 = (r10 + r11) | 0;
        r10 = (r10 + 8) | 0;
        r10 = r10 >> 2;
        heapClassInst.heap32[(r10)] = Int32(r5);
      }
      else {
        heapClassInst.heap32[(r7 + 1)] = Int32(r5);
      }
      r10 = Int64(heapClassInst.heap32[(r7 + 2)]);
      if (!(r10 != r2)) 
      {
        r10 = Int64(heapClassInst.heap32[(r4 + 3)]);
        if (r10 != 0) 
        {
          r10 = r5 >> 2;
          r10 = Int64(heapClassInst.heap32[(r10 + 2)]);
          do {
            if (r10 == 0) 
            {
              r11 = r5;
            }
            else {
              while (true) {
                r11 = r10;
                r10 = r11 >> 2;
                r10 = Int64(heapClassInst.heap32[(r10 + 2)]);
                if (!(r10 != 0)) 
                {
                  break 
                }
              }
            }
          } while (false);
          heapClassInst.heap32[(r7 + 2)] = Int32(r11);
        }
        else {
          r10 = Int64(heapClassInst.heap32[(r4 + 1)]);
          heapClassInst.heap32[(r7 + 2)] = Int32(r10);
        }
      }
      r10 = Int64(heapClassInst.heap32[(r7 + 3)]);
      if (r10 == r2) 
      {
        r2 = Int64(heapClassInst.heap32[(r4 + 2)]);
        if (r2 != 0) 
        {
          r2 = r5 >> 2;
          r2 = Int64(heapClassInst.heap32[(r2 + 3)]);
          do {
            if (r2 == 0) 
            {
              r4 = r5;
            }
            else {
              while (true) {
                r4 = r2;
                r2 = r4 >> 2;
                r2 = Int64(heapClassInst.heap32[(r2 + 3)]);
                if (!(r2 != 0)) 
                {
                  break 
                }
              }
            }
          } while (false);
          heapClassInst.heap32[(r7 + 3)] = Int32(r4);
          r2 = r8;
        }
        else {
          r2 = Int64(heapClassInst.heap32[(r4 + 1)]);
          heapClassInst.heap32[(r7 + 3)] = Int32(r2);
          r2 = r8;
        }
      }
      else {
        r2 = r8;
      }
    }
    r4 = r2 >> 2;
    r7 = Int64(heapClassInst.heap32[(r4)]);
    do {
      if (!(r7 == 0)) 
      {
        while (true) {
          r7 = r1 >> 2;
          r8 = Int64(heapClassInst.heap32[(r7 + 1)]);
          if (r8 == r5) 
          {
            __label__ = 125;
            break 
          }
          else {
            if (!(r5 == 0)) 
            {
              r8 = r5 >> 2;
              r8 = Int64(heapClassInst.heap32[(r8)]);
              if (!(r8 == 1)) 
              {
                __label__ = 126;
                break 
              }
            }
            r8 = r9 >> 2;
            r10 = Int64(heapClassInst.heap32[(r8 + 2)]);
            if (r10 != r5) 
            {
              r11 = r10 >> 2;
              r12 = Int64(heapClassInst.heap32[(r11)]);
              if (r12 == 0) 
              {
                heapClassInst.heap32[(r11)] = 1;
                heapClassInst.heap32[(r8)] = 0;
                r10 = Int64(heapClassInst.heap32[(r8 + 2)]);
                r11 = r10 >> 2;
                r12 = Int64(heapClassInst.heap32[(r11 + 3)]);
                heapClassInst.heap32[(r8 + 2)] = Int32(r12);
                r12 = Int64(heapClassInst.heap32[(r11 + 3)]);
                if (!(r12 == 0)) 
                {
                  r12 = r12 >> 2;
                  heapClassInst.heap32[(r12 + 1)] = Int32(r9);
                }
                r12 = Int64(heapClassInst.heap32[(r8 + 1)]);
                heapClassInst.heap32[(r11 + 1)] = Int32(r12);
                r12 = Int64(heapClassInst.heap32[(r7 + 1)]);
                if (r12 != r9) 
                {
                  r12 = Int64(heapClassInst.heap32[(r8 + 1)]);
                  r12 = r12 >> 2;
                  r13 = Int64(heapClassInst.heap32[(r12 + 3)]);
                  if (r13 != r9) 
                  {
                    heapClassInst.heap32[(r12 + 2)] = Int32(r10);
                  }
                  else {
                    heapClassInst.heap32[(r12 + 3)] = Int32(r10);
                  }
                }
                else {
                  heapClassInst.heap32[(r7 + 1)] = Int32(r10);
                }
                heapClassInst.heap32[(r11 + 3)] = Int32(r9);
                heapClassInst.heap32[(r8 + 1)] = Int32(r10);
                r10 = Int64(heapClassInst.heap32[(r8 + 2)]);
              }
              r11 = r10 >> 2;
              r12 = Int64(heapClassInst.heap32[(r11 + 3)]);
              if (!(r12 == 0)) 
              {
                r12 = r12 >> 2;
                r13 = Int64(heapClassInst.heap32[(r12)]);
                if (r13 != 1) 
                {
                  __label__ = 102;
                  break 
                }
              }
              r12 = Int64(heapClassInst.heap32[(r11 + 2)]);
              if (!(r12 == 0)) 
              {
                r12 = r12 >> 2;
                r12 = Int64(heapClassInst.heap32[(r12)]);
                if (!(r12 == 1)) 
                {
                  __label__ = 112;
                  break 
                }
              }
              heapClassInst.heap32[(r11)] = 0;
            }
            else {
              r10 = Int64(heapClassInst.heap32[(r8 + 3)]);
              r11 = r10 >> 2;
              r12 = Int64(heapClassInst.heap32[(r11)]);
              if (r12 == 0) 
              {
                heapClassInst.heap32[(r11)] = 1;
                heapClassInst.heap32[(r8)] = 0;
                r10 = Int64(heapClassInst.heap32[(r8 + 3)]);
                r11 = r10 >> 2;
                r12 = Int64(heapClassInst.heap32[(r11 + 2)]);
                heapClassInst.heap32[(r8 + 3)] = Int32(r12);
                r12 = Int64(heapClassInst.heap32[(r11 + 2)]);
                if (!(r12 == 0)) 
                {
                  r12 = r12 >> 2;
                  heapClassInst.heap32[(r12 + 1)] = Int32(r9);
                }
                r12 = Int64(heapClassInst.heap32[(r8 + 1)]);
                heapClassInst.heap32[(r11 + 1)] = Int32(r12);
                r12 = Int64(heapClassInst.heap32[(r7 + 1)]);
                if (r12 != r9) 
                {
                  r12 = Int64(heapClassInst.heap32[(r8 + 1)]);
                  r12 = r12 >> 2;
                  r13 = Int64(heapClassInst.heap32[(r12 + 2)]);
                  if (r13 != r9) 
                  {
                    heapClassInst.heap32[(r12 + 3)] = Int32(r10);
                  }
                  else {
                    heapClassInst.heap32[(r12 + 2)] = Int32(r10);
                  }
                }
                else {
                  heapClassInst.heap32[(r7 + 1)] = Int32(r10);
                }
                heapClassInst.heap32[(r11 + 2)] = Int32(r9);
                heapClassInst.heap32[(r8 + 1)] = Int32(r10);
                r10 = Int64(heapClassInst.heap32[(r8 + 3)]);
              }
              r11 = r10 >> 2;
              r12 = Int64(heapClassInst.heap32[(r11 + 2)]);
              if (!(r12 == 0)) 
              {
                r12 = r12 >> 2;
                r13 = Int64(heapClassInst.heap32[(r12)]);
                if (r13 != 1) 
                {
                  __label__ = 68;
                  break 
                }
              }
              r12 = Int64(heapClassInst.heap32[(r11 + 3)]);
              if (!(r12 == 0)) 
              {
                r12 = r12 >> 2;
                r12 = Int64(heapClassInst.heap32[(r12)]);
                if (!(r12 == 1)) 
                {
                  __label__ = 78;
                  break 
                }
              }
              heapClassInst.heap32[(r11)] = 0;
            }
            r10 = Int64(heapClassInst.heap32[(r8 + 1)]);
            r5 = r9;
            r9 = r10;
          }
        }
        do {
          match (__label__) {
            case 102 =>
              r1 = Int64(heapClassInst.heap32[(r11 + 2)]);
              if (!(r1 == 0)) 
              {
                r1 = r1 >> 2;
                r1 = Int64(heapClassInst.heap32[(r1)]);
                if (r1 != 1) 
                {
                  __label__ = 112;
                  break 
                }
              }
              heapClassInst.heap32[(r12)] = 1;
              r1 = Int64(heapClassInst.heap32[(r11 + 3)]);
              r12 = r1 >> 2;
              heapClassInst.heap32[(r11)] = 0;
              r13 = Int64(heapClassInst.heap32[(r12 + 2)]);
              heapClassInst.heap32[(r11 + 3)] = Int32(r13);
              r13 = Int64(heapClassInst.heap32[(r12 + 2)]);
              if (!(r13 == 0)) 
              {
                r13 = r13 >> 2;
                heapClassInst.heap32[(r13 + 1)] = Int32(r10);
              }
              r13 = Int64(heapClassInst.heap32[(r11 + 1)]);
              heapClassInst.heap32[(r12 + 1)] = Int32(r13);
              r13 = Int64(heapClassInst.heap32[(r7 + 1)]);
              if (r13 != r10) 
              {
                r13 = Int64(heapClassInst.heap32[(r11 + 1)]);
                r13 = r13 >> 2;
                r14 = Int64(heapClassInst.heap32[(r13 + 2)]);
                if (r14 != r10) 
                {
                  heapClassInst.heap32[(r13 + 3)] = Int32(r1);
                }
                else {
                  heapClassInst.heap32[(r13 + 2)] = Int32(r1);
                }
              }
              else {
                heapClassInst.heap32[(r7 + 1)] = Int32(r1);
              }
              heapClassInst.heap32[(r12 + 2)] = Int32(r10);
              heapClassInst.heap32[(r11 + 1)] = Int32(r1);
              r10 = Int64(heapClassInst.heap32[(r8 + 2)]);
              __label__ = 112;
              // break 
              // break;
            case 68 =>
              r1 = Int64(heapClassInst.heap32[(r11 + 3)]);
              if (!(r1 == 0)) 
              {
                r1 = r1 >> 2;
                r1 = Int64(heapClassInst.heap32[(r1)]);
                if (r1 != 1) 
                {
                  __label__ = 78;
                  break 
                }
              }
              heapClassInst.heap32[(r12)] = 1;
              r1 = Int64(heapClassInst.heap32[(r11 + 2)]);
              r12 = r1 >> 2;
              heapClassInst.heap32[(r11)] = 0;
              r13 = Int64(heapClassInst.heap32[(r12 + 3)]);
              heapClassInst.heap32[(r11 + 2)] = Int32(r13);
              r13 = Int64(heapClassInst.heap32[(r12 + 3)]);
              if (!(r13 == 0)) 
              {
                r13 = r13 >> 2;
                heapClassInst.heap32[(r13 + 1)] = Int32(r10);
              }
              r13 = Int64(heapClassInst.heap32[(r11 + 1)]);
              heapClassInst.heap32[(r12 + 1)] = Int32(r13);
              r13 = Int64(heapClassInst.heap32[(r7 + 1)]);
              if (r13 != r10) 
              {
                r13 = Int64(heapClassInst.heap32[(r11 + 1)]);
                r13 = r13 >> 2;
                r14 = Int64(heapClassInst.heap32[(r13 + 3)]);
                if (r14 != r10) 
                {
                  heapClassInst.heap32[(r13 + 2)] = Int32(r1);
                }
                else {
                  heapClassInst.heap32[(r13 + 3)] = Int32(r1);
                }
              }
              else {
                heapClassInst.heap32[(r7 + 1)] = Int32(r1);
              }
              heapClassInst.heap32[(r12 + 3)] = Int32(r10);
              heapClassInst.heap32[(r11 + 1)] = Int32(r1);
              r10 = Int64(heapClassInst.heap32[(r8 + 3)]);
              __label__ = 78;
            //   break;
            // default:
            //   break
            case _ =>
              println("break17420")
          }
        } while (false);
        do {
          match (__label__) {
            case 112 =>
              r1 = r10 >> 2;
              r10 = Int64(heapClassInst.heap32[(r8)]);
              heapClassInst.heap32[(r1)] = Int32(r10);
              heapClassInst.heap32[(r8)] = 1;
              r1 = Int64(heapClassInst.heap32[(r1 + 2)]);
              if (!(r1 == 0)) 
              {
                r1 = r1 >> 2;
                heapClassInst.heap32[(r1)] = 1;
              }
              r1 = Int64(heapClassInst.heap32[(r8 + 2)]);
              r10 = r1 >> 2;
              r11 = Int64(heapClassInst.heap32[(r10 + 3)]);
              heapClassInst.heap32[(r8 + 2)] = Int32(r11);
              r11 = Int64(heapClassInst.heap32[(r10 + 3)]);
              if (!(r11 == 0)) 
              {
                r11 = r11 >> 2;
                heapClassInst.heap32[(r11 + 1)] = Int32(r9);
              }
              r11 = Int64(heapClassInst.heap32[(r8 + 1)]);
              heapClassInst.heap32[(r10 + 1)] = Int32(r11);
              r11 = Int64(heapClassInst.heap32[(r7 + 1)]);
              if (r11 != r9) 
              {
                r7 = Int64(heapClassInst.heap32[(r8 + 1)]);
                r7 = r7 >> 2;
                r11 = Int64(heapClassInst.heap32[(r7 + 3)]);
                if (r11 != r9) 
                {
                  heapClassInst.heap32[(r7 + 2)] = Int32(r1);
                }
                else {
                  heapClassInst.heap32[(r7 + 3)] = Int32(r1);
                }
              }
              else {
                heapClassInst.heap32[(r7 + 1)] = Int32(r1);
              }
              heapClassInst.heap32[(r10 + 3)] = Int32(r9);
              heapClassInst.heap32[(r8 + 1)] = Int32(r1);
              __label__ = 125;
              // break 
              // break;
            case 78 =>
              r1 = r10 >> 2;
              r10 = Int64(heapClassInst.heap32[(r8)]);
              heapClassInst.heap32[(r1)] = Int32(r10);
              heapClassInst.heap32[(r8)] = 1;
              r1 = Int64(heapClassInst.heap32[(r1 + 3)]);
              if (!(r1 == 0)) 
              {
                r1 = r1 >> 2;
                heapClassInst.heap32[(r1)] = 1;
              }
              r1 = Int64(heapClassInst.heap32[(r8 + 3)]);
              r10 = r1 >> 2;
              r11 = Int64(heapClassInst.heap32[(r10 + 2)]);
              heapClassInst.heap32[(r8 + 3)] = Int32(r11);
              r11 = Int64(heapClassInst.heap32[(r10 + 2)]);
              if (!(r11 == 0)) 
              {
                r11 = r11 >> 2;
                heapClassInst.heap32[(r11 + 1)] = Int32(r9);
              }
              r11 = Int64(heapClassInst.heap32[(r8 + 1)]);
              heapClassInst.heap32[(r10 + 1)] = Int32(r11);
              r11 = Int64(heapClassInst.heap32[(r7 + 1)]);
              if (r11 != r9) 
              {
                r7 = Int64(heapClassInst.heap32[(r8 + 1)]);
                r7 = r7 >> 2;
                r11 = Int64(heapClassInst.heap32[(r7 + 2)]);
                if (r11 != r9) 
                {
                  heapClassInst.heap32[(r7 + 3)] = Int32(r1);
                }
                else {
                  heapClassInst.heap32[(r7 + 2)] = Int32(r1);
                }
              }
              else {
                heapClassInst.heap32[(r7 + 1)] = Int32(r1);
              }
              heapClassInst.heap32[(r10 + 2)] = Int32(r9);
              heapClassInst.heap32[(r8 + 1)] = Int32(r1);
              __label__ = 125;
            //   break;
            // default:
            //   break
            case _ =>
              println("break17517")
          }
        } while (false);
        if (__label__ == 125) {
          if (r5 == 0) 
          {
            break 
          }
        }
        r1 = r5 >> 2;
        heapClassInst.heap32[(r1)] = 1;
      }
    } while (false);
    r1 = Int64(heapClassInst.heap32[(r0 + 75)]);
    heapClassInst.heap32[(r4 + 3)] = Int32(r1);
    heapClassInst.heap32[(r0 + 75)] = Int32(r2);
    r1 = Int64(heapClassInst.heap32[(r0 + 79)]);
    r1 = (r1 + (-1)) | 0;
    r2 = r3 >> 2;
    heapClassInst.heap32[(r0 + 79)] = Int32(r1);
    heapClassInst.heap32[(r2)] = Int32(r6);
    return;
  }
  else {
    r0 = r3 >> 2;
    heapClassInst.heap32[(r0)] = Int32(r1);
    return;
  }
}

func _ZN4__rw9__rb_treeIjSt4pairIKjPN5my_gl12TIndexBufferEENS_11__select1stIS6_jEESt4lessIjESaIS6_EE11_C_get_linkEv(sp: Int64) : Unit
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
  r0 = _ZN5my_glL9m_contextE;
  r0 = r0 >> 2;
  r1 = Int64(heapClassInst.heap32[(r0 + 75)]);
  if (r1 == 0) 
  {
    r1 = Int64(heapClassInst.heap32[(r0 + 76)]);
    r2 = Int64(heapClassInst.heap32[(r0 + 77)]);
    if (r1 != r2) 
    {
      r2 = (r1 + 24) | 0;
      heapClassInst.heap32[(r0 + 76)] = Int32(r2);
    }
    else {
      r1 = Int64(heapClassInst.heap32[(r0 + 74)]);
      if (r1 != 0) 
      {
        r1 = r1 >> 2;
        r1 = Int64(heapClassInst.heap32[(r1 + 1)]);
      }
      else {
        r1 = 0;
      }
      heapClassInst.heap32[(g0)] = 12;
      _Znwj(i7);
      r2 = commonVariable.r_g0;
      if (!(r2 != 0)) 
      {
        heapClassInst.heap32[(g0)] = 3;
        _ZN4__rw10__rw_throwEiz(i7);
      }
      r3 = r1 & 1023;
      r3 = (r3 * 1656) | 0;
      r4 = r1 >> 10;
      r3 = r3 >> 10;
      r4 = (r4 * 1656) | 0;
      r5 = (r1 + 32) | 0;
      r3 = (r3 + r4) | 0;
      r3 = if (`UIntNative`(r5) > `UIntNative`(r3)) {r5} else {r3};
      r4 = (r1 + 1) | 0;
      r3 = if (`UIntNative`(r3) > `UIntNative`(r1)) {r3} else {r4};
      r4 = (r3 * 24) | 0;
      heapClassInst.heap32[(g0)] = Int32(r4);
      _Znwj(i7);
      r1 = commonVariable.r_g0;
      if (!(r1 != 0)) 
      {
        heapClassInst.heap32[(g0)] = 3;
        _ZN4__rw10__rw_throwEiz(i7);
      }
      r5 = r2 >> 2;
      heapClassInst.heap32[(r5 + 2)] = Int32(r1);
      r6 = Int64(heapClassInst.heap32[(r0 + 74)]);
      heapClassInst.heap32[(r5)] = Int32(r6);
      heapClassInst.heap32[(r5 + 1)] = Int32(r3);
      r3 = (r1 + r4) | 0;
      heapClassInst.heap32[(r0 + 74)] = Int32(r2);
      r2 = (r1 + 24) | 0;
      heapClassInst.heap32[(r0 + 77)] = Int32(r3);
      heapClassInst.heap32[(r0 + 76)] = Int32(r2);
    }
  }
  else {
    r2 = r1 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2 + 3)]);
    heapClassInst.heap32[(r0 + 75)] = Int32(r2);
  }
  r0 = r1 >> 2;
  heapClassInst.heap32[(r0 + 1)] = 0;
  heapClassInst.heap32[(r0 + 2)] = 0;
  heapClassInst.heap32[(r0 + 3)] = 0;
  heapClassInst.heap32[(r0)] = 0;
  commonVariable.r_g0 = r1;
  return;
}

func _ZN4__rw9__rb_treeISsSt4pairIKSsiENS_11__select1stIS3_SsEESt4lessISsESaIS3_EED2Ev(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var r4: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-32); 
  var g0 = i7 >> 2; 
  r0 = Int64(heapClassInst.heap32[(fp)]);
  r1 = r0 >> 2;
  r2 = Int64(heapClassInst.heap32[(r1 + 4)]);
  if (!(r2 == 0)) 
  {
    r3 = r2 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3 + 2)]);
    heapClassInst.heap32[(fp + (-2))] = Int32(r3);
    r3 = sp + (-16);
    r4 = sp + (-8);
    heapClassInst.heap32[(g0)] = Int32(r3);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    heapClassInst.heap32[(g0 + 2)] = Int32(r4);
    heapClassInst.heap32[(g0 + 3)] = Int32(r2);
    _ZN4__rw9__rb_treeISsSt4pairIKSsiENS_11__select1stIS3_SsEESt4lessISsESaIS3_EE5eraseENS_14__rw_tree_iterIS3_iPS3_RS3_NS_17__rw_rb_tree_nodeIS8_S3_SsS5_EEEESF_(i7);
    r0 = Int64(heapClassInst.heap32[(r1 + 4)]);
    r2 = Int64(heapClassInst.heap32[(r1 + 1)]);
    r3 = r0 >> 2;
    heapClassInst.heap32[(r3 + 3)] = Int32(r2);
    heapClassInst.heap32[(r1 + 1)] = Int32(r0);
    r0 = Int64(heapClassInst.heap32[(r1)]);
    if (!(r0 == 0)) 
    {
      __label__ = 2; 
      while (true) {
        r2 = r0 >> 2;
        r3 = Int64(heapClassInst.heap32[(r2)]);
        heapClassInst.heap32[(r1)] = Int32(r3);
        r2 = Int64(heapClassInst.heap32[(r2 + 2)]);
        heapClassInst.heap32[(g0)] = Int32(r2);
        _ZdlPv(i7);
        heapClassInst.heap32[(g0)] = Int32(r0);
        _ZdlPv(i7);
        r0 = Int64(heapClassInst.heap32[(r1)]);
        if (r0 != 0) 
        {
          continue 
        }
        else {
          break 
        }
      }
    }
  }
  return;
}

func Mandreel_TextureAsync_Loaded(sp: Int64) : Unit
{
  var i7: Int64 = 0
  var fp = sp >> 2;
  var r0: Int64 = 0
  var r1: Int64 = 0
  var r2: Int64 = 0
  var r3: Int64 = 0
  var __label__ = 0;
  i7 = sp + (-40); 
  var g0 = i7 >> 2; 
  r0 = 5;
  r0 = Int64(heapClassInst.heap32[(r0)]);
  r1 = Int64(heapClassInst.heap32[(fp)]);
  heapClassInst.heap32[(g0)] = 0;
  heapClassInst.heap32[(g0 + 1)] = 3553;
  heapClassInst.heap32[(g0 + 2)] = Int32(r1);
  r2 = 100;
  __FUNCTION_TABLE__[(r0) >> 2](i7);
  r0 = Int64(heapClassInst.heap32[(r2)]);
  r2 = Int64(heapClassInst.heap32[(fp + 1)]);
  r3 = Int64(heapClassInst.heap32[(fp + 2)]);
  heapClassInst.heap32[(g0)] = 0;
  heapClassInst.heap32[(g0 + 1)] = 3553;
  heapClassInst.heap32[(g0 + 2)] = 0;
  heapClassInst.heap32[(g0 + 3)] = 6408;
  heapClassInst.heap32[(g0 + 4)] = Int32(r2);
  heapClassInst.heap32[(g0 + 5)] = Int32(r3);
  heapClassInst.heap32[(g0 + 6)] = 0;
  heapClassInst.heap32[(g0 + 7)] = 6408;
  heapClassInst.heap32[(g0 + 8)] = 5121;
  heapClassInst.heap32[(g0 + 9)] = 0;
  __FUNCTION_TABLE__[(r0) >> 2](i7);
  heapClassInst.heap32[(g0)] = Int32(r1);
  Mandreel_TextureAsync_SetData(i7);
  return;
}









