package cj;


import static cangjie.lang.LibraryLoader.loadLibrary;
import cangjie.lang.internal.$$NativeConstructorMarker;

public class MultiplePropClash {
    static {
        loadLibrary("cj");
    }

    long self;

    public int getX_prop0() {
        return getX_prop0Impl(this.self);
    }

    public native int getX_prop0Impl(long self);

    public static double getX_prop1() {
        return getX_prop1Impl();
    }

    public static native double getX_prop1Impl();

    public MultiplePropClash() {
        super();
        self = initCJObject();
    }

    private MultiplePropClash($$NativeConstructorMarker __init__) {
        super();
    }

    public native long initCJObject();

    public boolean getX() {
        return getX(this.self);
    }

    public native boolean getX(long self);

    @Override
    public boolean equals(Object obj) {
        throw new UnsupportedOperationException("equals is not supported for java proxy object.");
    }

    @Override
    public int hashCode() {
        throw new UnsupportedOperationException("hashCode is not supported for java proxy object.");
    }

    @Override
    public String toString() {
        throw new UnsupportedOperationException("toString is not supported for java proxy object.");
    }

    public native void deleteCJObject(long self);

    @Override
    public void finalize() {
        deleteCJObject(this.self);
    }
}
