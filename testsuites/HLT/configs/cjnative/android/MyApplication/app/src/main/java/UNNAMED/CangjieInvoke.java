package UNNAMED;


import static cangjie.lang.LibraryLoader.loadLibrary;
import cangjie.lang.internal.$$NativeConstructorMarker;

public class CangjieInvoke {
    static {
        loadLibrary("UNNAMED");
    }

    long self;

    public CangjieInvoke() {
        super();
        self = initCJObject();
    }

    private CangjieInvoke($$NativeConstructorMarker __init__) {
        super();
    }

    public native long initCJObject();

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
