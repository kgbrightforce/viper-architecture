//
//  SplashModel.swift
//  VIPER
//
//  Created by Keval Gajjar on 01/02/24.
//

import Foundation

struct SplashModel: Codable {
    
    internal var id:String?
    internal var title:String?
    internal var brief:String?
    internal var filesource:String?
    
    init(id: String? = nil, title: String? = nil, brief: String? = nil, filesource: String? = nil) {
        self.id = id
        self.title = title
        self.brief = brief
        self.filesource = filesource
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.brief = try container.decodeIfPresent(String.self, forKey: .brief)
        self.filesource = try container.decodeIfPresent(String.self, forKey: .filesource)
    }
    
}

