//
//  NameSpaceing.swift
//  AppleSongs
//
//  Created by Mohammad on 6/13/23.
//

import Foundation

struct ViewController {
    struct Main {
        //Empty Implementation
    }
    struct List {
        //Empty Implementation
    }
}

struct ViewModel {
    struct Main {
        //Empty Implementation
    }
}

struct Repository {
    //Empty Implementation
}

struct CollectionViewCell {
    struct MyOrder {
        //Empty Implementation
    }
    struct Prefrence {
        //Empty Implementation
    }
    struct Delete {
        //Empty Implementation
    }
}

struct TableViewCell {
    struct Address {
        struct New {
            //Empty Implementation
        }
    }
    struct Checkout {
        //Empty Implementation
    }
    struct MyOrder {
        //Empty Implementation
    }
    struct Prefrence {
        //Empty Implementation
    }
    struct Delete {
        //Empty Implementation
    }
    struct ContactUS {
        //Empty Implementation
    }
}

struct HeaderView {
    //Empty Implementation
}

struct Model {
    struct Request {
        //Empty Implementation
    }
    struct Checkout {
        //Empty Implementation
    }
    struct MyOrder {
        //Empty Implementation
    }
    struct Environment: Codable {
        var type: EnvironmentType?
        var name: String?
        var environment: String
    }
    struct Prefrence {
        //Empty Implementation
    }
    struct Delete {
        //Empty Implementation
    }
}

extension Model.Environment {
    enum EnvironmentType: Codable {
        case shop
        case stage
    }
}

struct Networking {
    //Empty Implementation
}

struct Common {
    struct View {
        //Empty Implementation
    }
}
