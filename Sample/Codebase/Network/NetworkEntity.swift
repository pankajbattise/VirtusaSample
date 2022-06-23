//
//  NetworkEntity.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//


struct RootModel<T: Codable>: Codable {

    let message : String
    let data : T?
    let status : Int

    enum CodingKeys: String, CodingKey {
        case message = "message"
        case data = "data"
        case status = "status"
    }
}
