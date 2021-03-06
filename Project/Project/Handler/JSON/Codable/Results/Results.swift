import Foundation

public final class Results: Codable, Equatable {
    public let gender: Gender
    public let name: Name
    public let location: Location
    public let email: String
    public let login: Login
    public let dob: Dob
    public let registered: Registered
    public let phone: String
    public let cell: String
    public let id: ID
    public var picture: Picture
    public let nat: String

    init(gender: Gender, name: Name, location: Location, email: String?, login: Login, dob: Dob, registered: Registered, phone: String?, cell: String?, id: ID, picture: Picture, nat: String?) {
        self.gender = gender
        self.name = name
        self.location = location
        self.email = email ?? ""
        self.login = login
        self.dob = dob
        self.registered = registered
        self.phone = phone ?? ""
        self.cell = cell ?? ""
        self.id = id
        self.picture = picture
        self.nat = nat ?? ""
    }
    
    public static func == (lhs: Results, rhs: Results) -> Bool {
        lhs.gender == rhs.gender && lhs.name == rhs.name && lhs.location == rhs.location && lhs.email == rhs.email && lhs.login == rhs.login && lhs.dob == rhs.dob && lhs.registered == rhs.registered && lhs.phone == rhs.phone && lhs.cell == rhs.cell && lhs.id == rhs.id && lhs.picture == rhs.picture && lhs.nat == rhs.nat
    }
    
    private enum CodingKeys: String, CodingKey {
        case gender = "gender"
        case name = "name"
        case location = "location"
        case email = "email"
        case login = "login"
        case dob = "dob"
        case registered = "registered"
        case phone = "phone"
        case cell = "cell"
        case id = "id"
        case picture = "picture"
        case nat = "nat"
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        gender = try values.decode(Gender.self, forKey: .gender)
        name = try values.decode(Name.self, forKey: .name)
        location = try values.decode(Location.self, forKey: .location)
        email = try values.decode(String.self, forKey: .email)
        login = try values.decode(Login.self, forKey: .login)
        dob = try values.decode(Dob.self, forKey: .dob)
        registered = try values.decode(Registered.self, forKey: .registered)
        phone = try values.decode(String.self, forKey: .phone)
        cell = try values.decode(String.self, forKey: .cell)
        id = try values.decode(ID.self, forKey: .id)
        picture = try values.decode(Picture.self, forKey: .picture)
        nat = try values.decode(String.self, forKey: .nat)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(gender, forKey: .gender)
        try container.encode(name, forKey: .name)
        try container.encode(location, forKey: .location)
        try container.encode(email, forKey: .email)
        try container.encode(login, forKey: .login)
        try container.encode(dob, forKey: .dob)
        try container.encode(registered, forKey: .registered)
        try container.encode(phone, forKey: .phone)
        try container.encode(cell, forKey: .cell)
        try container.encode(id, forKey: .id)
        try container.encode(picture, forKey: .picture)
        try container.encode(nat, forKey: .nat)
    }
}
