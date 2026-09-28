#if Finite
public import Cardinal
public import Finite
public import Index
public import Ordinal
public import Tagged

extension Parity: Finite.Enumerable {

    @inlinable
    public static var count: Cardinal { Cardinal(UInt(2)) }

    @inlinable
    public var ordinal: Ordinal {
        switch self {
        case .even: Ordinal(UInt(0))
        case .odd: Ordinal(UInt(1))
        }
    }

    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        self = ordinal.rawValue == 0 ? .even : .odd
    }
}
#endif
