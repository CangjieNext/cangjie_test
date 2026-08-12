/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.util.*;

enum ElementKind {
    BEAN,
    PROPERTY,
    METHOD;
}


interface A {
}

//public interface ConstraintMetaData extends Iterable<MetaConstraint<?>>
interface M_A extends A {
    ElementKind getKind();
    ElementKind getKindVerified();

    boolean isCascading();
    boolean isCascadingVerified();

    boolean isConstrained();
    boolean isConstrainedVerified();
}

//public abstract class AbstractConstraintMetaData implements ConstraintMetaData
abstract class M_A_A implements M_A {
    private final boolean isCascading;

    private final boolean isConstrained;

    public M_A_A() {
        isCascading = NCEIterator.random.nextBoolean();
        isConstrained = NCEIterator.random.nextBoolean();
        if (isCascading && isConstrained) {
            NCEIterator.checkableCount++;
        } else if (!isCascading) {
            NCEIterator.notCascading++;
        }
    }

    public final boolean isCascading() {
        return isCascading;
    }

    public final boolean isCascadingVerified() {
        NCEIterator.callCount++;
        return isCascading;
    }

    public boolean isConstrained() {
        return isConstrained;
    }

    public boolean isConstrainedVerified() {
        NCEIterator.callCount++;
        return isConstrained;
    }
}

//public class ClassMetaData extends AbstractConstraintMetaData
class M_A_A_A extends M_A_A {
    public ElementKind getKind() {
        return ElementKind.BEAN;
    }

    public ElementKind getKindVerified() {
        NCEIterator.callCount++;
        return ElementKind.BEAN;
    }
}

//public class PropertyMetaData extends AbstractConstraintMetaData
class M_A_A_C extends M_A_A {
    public ElementKind getKind() {
        return ElementKind.PROPERTY;
    }

    public ElementKind getKindVerified() {
        NCEIterator.callCount++;
        return ElementKind.PROPERTY;
    }
}

//public class ExecutableMetaData extends AbstractConstraintMetaData
class M_A_A_B extends M_A_A {
    private final ElementKind isKind;

    public ElementKind getKind() {
        return isKind;
    }

    public ElementKind getKindVerified() {
        NCEIterator.callCount++;
        return isKind;
    }

    public M_A_A_B() {
        isKind = ElementKind.METHOD;
    }
}

abstract class N {
    protected final boolean marker;

    public N() {
        marker = NCEIterator.random.nextBoolean();
    }

    public boolean isMarked() {
        return marker;
    }

    public boolean isMarkedVerified() {
        NCEIterator.callCount++;
        return marker;
    }
}

abstract class N_A_A extends N implements M_A {
    private final boolean isCascading;

    private final boolean isConstrained;

    public N_A_A() {
        isCascading = NCEIterator.random.nextBoolean();
        isConstrained = NCEIterator.random.nextBoolean();
        if (isCascading && isConstrained) {
            NCEIterator.checkableCount++;
        } else {
            if (!isCascading) {
                NCEIterator.notCascading++;
            }
            if (marker) {
                NCEIterator.nonCheckableMarkedCount++;
            }
        }
    }

    public final boolean isCascading() {
        return isCascading;
    }

    public final boolean isCascadingVerified() {
        NCEIterator.callCount++;
        return isCascading;
    }

    public boolean isConstrained() {
        return isConstrained;
    }

    public boolean isConstrainedVerified() {
        NCEIterator.callCount++;
        return isConstrained;
    }
}

class N_A_A_A extends N_A_A {
    public ElementKind getKind() {
        return ElementKind.BEAN;
    }

    public ElementKind getKindVerified() {
        NCEIterator.callCount++;
        return ElementKind.BEAN;
    }
}

public class NCEIterator {
    public static boolean result = false;

    public static int items = 500;
    public static int iterations = 1000000;

    public static int checkableCount = 0;
    public static int callCount = 0;
    public static int notCascading = 0;
    public static int nonCheckableMarkedCount = 0;

    public static final Random random = new Random(1);

    private static long verify(int iterations, ArrayList<M_A> mAVec) {
        long expected = 0;
        long cascadingMarkedCount = 0;
        long nonCascadingMarkedCount = 0;
        long nonCheckableNCount = 0;

        if (items != mAVec.size()) {
            throw new RuntimeException("Wrong item count");
        }

        for (int i = 0; i < iterations; i++) {
            int checkedCount = 0;
            int j = 0;

            for (M_A maElement : mAVec) {
                if (maElement.isCascadingVerified() && maElement.isConstrainedVerified()) {
                    final ElementKind kind1 = maElement.getKindVerified();
                    result = (kind1 == ElementKind.PROPERTY && j % 2 == 0) || (kind1 == ElementKind.METHOD && j % 2 != 0 && j % 3 == 0) || (kind1 == ElementKind.BEAN && (j % 20 == 0 || j % 2 != 0 && j % 3 != 0));

                    if (!result) {
                        throw new RuntimeException("Wrong kind");
                    }

                    checkedCount++;

                    final ElementKind kind2 = maElement.getKindVerified();
                    result = (kind2 != ElementKind.PROPERTY || j % 2 != 0) && (kind2 != ElementKind.METHOD || j % 2 == 0 || j % 3 != 0) && (kind2 != ElementKind.BEAN || j % 20 != 0 && (j % 2 == 0 || j % 3 == 0));

                    if (result) {
                        throw new RuntimeException("Wrong kind");
                    }

                    checkedCount++;

                    if (j % 20 != 0 && j % 2 == 0) {
                        expected = (expected << 1 | 1) % 9223372036854775783L;
                    } else {
                        expected = (expected << 1) % 9223372036854775783L;
                    }
                } else {
                    long increment = 0;
                    if (maElement instanceof N) {
                        nonCheckableNCount++;
                        final N n = (N) maElement;
                        if (n.isMarkedVerified()) {
                            increment = 1;
                        }
                    }

                    if ((increment != 0) && (increment != 1)) {
                        throw new RuntimeException("Wrong increment");
                    }

                    // Assert that (increment == 1) => (j % 20 == 0)
                    if ((increment != 0) && (j % 20 != 0)) {
                        throw new RuntimeException("Wrong element");
                    }

                    if (maElement.isCascadingVerified()) {
                        cascadingMarkedCount += increment;
                    } else {
                        nonCascadingMarkedCount += increment;
                    }
                }
                j++;
            }

            if (checkedCount != checkableCount * 2) {
                throw new RuntimeException("Wrong checked count");
            }
        }

        if (checkableCount > items) {
            throw new RuntimeException("Wrong checkable count");
        }

        if (notCascading > items) {
            throw new RuntimeException("Wrong non-cascading count");
        }

        if (callCount != nonCheckableNCount + iterations * (notCascading + (items - notCascading) * 2 + checkableCount * 2 + (items - checkableCount))) {
            throw new RuntimeException("Wrong call count");
        }

        if (cascadingMarkedCount + nonCascadingMarkedCount > nonCheckableNCount) {
            throw new RuntimeException("Wrong non-checkable marked count");
        }

        if (cascadingMarkedCount + nonCascadingMarkedCount != iterations * nonCheckableMarkedCount) {
            throw new RuntimeException("Wrong non-checkable marked count");
        }

        if (cascadingMarkedCount > iterations * (items - notCascading)) {
            throw new RuntimeException("Wrong cascading marked count");
        }

        if (nonCascadingMarkedCount > iterations * notCascading) {
            throw new RuntimeException("Wrong non-cascading marked count");
        }

        return expected ^ cascadingMarkedCount;
    }

    public static void measure(long expected, ArrayList<M_A> mAVec) {
        long actual = 0;
        long actualMarkedCount = 0;
        boolean status = false;

        System.out.print("Benchmark started...");
        System.out.flush();
        final long start = System.nanoTime();

        for (int i = 0; i < iterations; i++) {
            for (M_A maElement : mAVec) {
                status = maElement.isCascading();
                if (status) {
                    status = status && maElement.isConstrained();
                    if (status) {
                        result = maElement.getKind() == ElementKind.METHOD;
                        result = maElement.getKind() == ElementKind.PROPERTY;
                        if (result) {
                            actual = (actual << 1 | 1) % 9223372036854775783L;
                        } else {
                            actual = (actual << 1) % 9223372036854775783L;
                        }
                    } else {
                        if (maElement instanceof N && ((N) maElement).isMarked()) {
                            actualMarkedCount++;
                        }
                    }
                }
            }
        }

        final double elapsed = (System.nanoTime() - start) / 1000000.0;
        final long result = actual ^ actualMarkedCount;
        if (result == expected) {
            System.out.printf(" done. Total time: %.0f ms\n", elapsed);
        } else {
            System.out.printf(" failed in %.0f ms: expected %d, actual %d.\n", elapsed, expected, result);
        }
    }

    public static void main(String[] args) {
        if (args.length > 3) {
            System.out.println("Usage: program <repeats> [items] [iterations]");
            System.out.println("   where default value of items is " + items);
            System.out.println("     and default value of iterations is " + iterations);
            return;
        }

        final int R = Integer.parseInt(args[0]);

        if (args.length >= 2) {
            items = Integer.parseInt(args[1]);
        }

        if (args.length == 3) {
            iterations = Integer.parseInt(args[2]);
        }

        ArrayList<M_A> mAVec = new ArrayList<>();
        for (int i = 0; i < items; i++) {
            if (i % 20 == 0) {
                mAVec.add(new N_A_A_A());
            } else if (i % 2 == 0) {
                mAVec.add(new M_A_A_C());
            } else if (i % 3 == 0) {
                mAVec.add(new M_A_A_B());
            } else {
                mAVec.add(new M_A_A_A());
            }
        }

        final long expected = verify(iterations, mAVec);
        for (int i = 0; i < R; i++) {
            measure(expected, mAVec);
        }
    }
}
