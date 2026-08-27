import Parity

#if !hasFeature(Embedded)
    extension Parity: Codable {

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            switch try container.decode(String.self) {
            case "even": self = .even
            case "odd": self = .odd
            case let value:
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Invalid Parity value: \(value)"
                )
            }
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .even: try container.encode("even")
            case .odd: try container.encode("odd")
            }
        }
    }
#endif
