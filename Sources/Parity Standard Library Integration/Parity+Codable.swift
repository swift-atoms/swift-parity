import Parity

#if !hasFeature(Embedded)
    extension Parity: Codable {}
#endif
