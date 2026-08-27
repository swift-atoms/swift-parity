public enum Parity: Sendable, Hashable {

    case even

    case odd
}

extension Parity {

    @inlinable
    public static func opposite(of parity: Parity) -> Parity {
        switch parity {
        case .even: return .odd
        case .odd: return .even
        }
    }

    @inlinable
    public var opposite: Parity {
        Self.opposite(of: self)
    }

    @inlinable
    public static prefix func ! (value: Parity) -> Parity {
        value.opposite
    }
}

extension Parity {

    @inlinable
    public static func adding(_ lhs: Parity, _ rhs: Parity) -> Parity {
        switch (lhs, rhs) {
        case (.even, .even), (.odd, .odd): return .even
        case (.even, .odd), (.odd, .even): return .odd
        }
    }

    @inlinable
    public func adding(_ other: Parity) -> Parity {
        Self.adding(self, other)
    }

    @inlinable
    public static func multiplying(_ lhs: Parity, _ rhs: Parity) -> Parity {
        switch (lhs, rhs) {
        case (.odd, .odd): return .odd
        default: return .even
        }
    }

    @inlinable
    public func multiplying(_ other: Parity) -> Parity {
        Self.multiplying(self, other)
    }
}
