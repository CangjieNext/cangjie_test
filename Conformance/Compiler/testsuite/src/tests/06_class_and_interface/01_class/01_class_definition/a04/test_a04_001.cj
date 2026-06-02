/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a04_001

  @Level:         1

  @Assertion: 6.1.1(4)
              The syntax of a class definition is as follows.
              classDefinition
                : classModifierList? 'class' identifier
                typeParameters?
                ('<:' superClassOrInterfaces)?
                genericConstraints?
                classBody
              ;
              superClassOrInterfaces
                : classType ('&' superInterfaces)?
                | superInterfaces
              ;

  @Description: Check that classes defined according to the grammar do not cause errors

  @Mode: compileonly

  @Negative: no

  @Structure: single

*/

// Case #1: class, name, body
class ioer_fe8faR {}

// Case #2 : modifiers, class, name, body
open class Ufjel0__ {}
public class i_____ {}
abstract class Ii832rjl {}
open public class fjoif8HKLH {}
public abstract class u7924 {}

// Case #3: class, name, generics, body
class feu8f4LFh<feU7J> {}
class UHFJK<Yhjk, fljIOHJ9> {}
class nfe38_f_<fvl, U, o___, fakjfhe, JFjfs_38HK> {}

// Case #4: class, name, superclass, body
open class UFKL {}
class fjewo_fHF <: UFKL {}

// Case #5: class, name, interfaces, body
interface i1 {}
interface i2 {}
interface i3 {}
interface i4 {}
interface i5 {}
interface i6 {}
interface i7 {}
interface i8 {}
interface i9 {}
interface i10 {}
class fewifl <: i1 {}
class Uf3893__3fklj_ <: i1 & i2 & i3 & i4 & i5 & i6 & i7 & i8 & i9 & i10 {}

// Case #6: class, name, generics, constraints, body
class fewjfo<UFIOE, UO8klf, fejlk_90> {}
class HUf390u<I, p, i__, jel> {}
class Uojl<op, ui8, k____, fjn_iU, fje8_> {}

// Case #7: modifiers, class, name, generics, body
abstract class NUFkj<io_fejlk> {}
public open class jkfe_i9felk<JFE8, K, feo_83OIL_, jfel, FJEjklf, qfp90, fe_fejf8> {}

// Case #8: modifiers, class, name, generics, constraints, body
open class feUIEjhk<fuIOU> where fuIOU <: Object {}
public abstract class PPPP<ur, UIOFE, fe9032, fe> {}

// Case #9: modifiers, class, name, superclass, body
open class FEO {}
open class fjiojl <: FEO {}

// Case #10: modifiers, class, name, interfaces, body
public interface qc {}
public interface u8 {}
public abstract class rttttt <: qc {}
open class iii_iii <: qc & u8 {}

// Case #11: modifiers, class, name, generics, superclass, body
open class a {}
abstract class IIuii<I, f, ope> <: a {}

//Case #12: modifiers, class, name, generics, interfaces, body
interface fep {}
interface jfla_UR {}
open class o__eri<tm, R, rw8> <: fep & jfla_UR {}

// Case #13: modifiers, class, name, generics, superclass, interfaces, body
public open class PPpp {}
public interface FIOR {}
public interface g_______ {}
public interface nuiRU {}
abstract public class Nuuuu03<rpewm, Efh> <: PPpp & g_______ {}
open class u77<Pore, i98, o_o> <: PPpp & FIOR & nuiRU & g_______ {}

// Case #14: modifiers, class, name, generics, superclass, constraints, body
public open class orREP {}
abstract class UIOREfkl0<_fejl, feHR, U8rU, vj__vj> <: orREP {}

// Case #15: modifiers, class, name, generics, interfaces, constraints, body
public interface faIo {}
public interface fep_fe {}
abstract class eryif<fda, r32> <: faIo {}
open class FNK<RUOIF, fjlkfas, F92jl> <: faIo & fep_fe {}

// Case #16: modifiers, class, name, generics, superclass, interfaces, constraints, body
public open class uruof {}
public interface UL390_3 {}
public interface nu {}
open class fjeio8<feo, FHE, re9> <: uruof & nu {}
public open class ruweoi8<R, a, p, OPF, fe8, fe90237, f_fd> <: uruof & nu & UL390_3 {}

// Case #17: class, name, generics, superclass, body
public open class FFF {}
class PFElkfd<fjkle, _fejk, ______g, FE> <: FFF {}

// Case #18: class, name, generics, interfaces, body
interface __reF_ {}
interface FJ_FEK {}
interface NFU_893 {}
class FIKKFf<I, II, III, IIII, IIIII, IIIIIII> <: FJ_FEK {}
class roe793jfFjk<fje3282jfaKjhlk389_fh349jkfsnvjkfh37ksnuishf38FHKJV9jflkhFHKJNCJSK> <: NFU_893 & FJ_FEK & __reF_ {}

// Case #19: class, name, generics, superclass, interfaces, body
open class uuuuuuu {}
interface fjlljf {}
interface U8U {}
class nNnnN<nNnn, NnnN> <: uuuuuuu & fjlljf {}
class QAfqcv<O, o, Oo, OoO> <: uuuuuuu & fjlljf & U8U {}

// Case #20: class, name, generics, superclass, constraints, body
open class NFJkf {}
class Njfewo<Pfof, Ffjle> <: NFJkf {}

// Case #21: class, name, generics, interfaces, constraints, body
interface FNlqpfx {}
interface ZZQ {}
class NF_fe83_<U, P, O, T, E> <: FNlqpfx {}
class EIO<Pp, pP> <: ZZQ & FNlqpfx {}

// Case #22: class, name, generics, superclass, interfaces, constraints, body
open class NR__ {}
interface NNNmmm {}
interface _________o_____ {}
interface FJN_zq8 {}
class irzq<r, _efa, fe82, favq> <: NR__ & _________o_____ {}
class Yyy<p1, p2, p4, p5> <: NR__ & NNNmmm & FJN_zq8 {}

// Case #23: class, name, superclass, interfaces, body
open class URIOFfj {}
interface uri8fa {}
interface mvaz {}
interface FEJxz83 {}
class NFYWL_ <: URIOFfj & FEJxz83 {}
class u_feulkFJ <: URIOFfj & uri8fa & mvaz & FEJxz83 {}

// Case #24: modifiers, class, name, superclass, interfaces, body
open class uo13_r3ufl {}
interface n39f {}
interface _F3ujf {}
abstract class fpejmn <: uo13_r3ufl & n39f {}
abstract class Ufjfks83 <: uo13_r3ufl & _F3ujf & n39f {}

main() {
}
