//
//  AppleMusicAPI.swift
//  TrackoveryApp
//
//  Created by Bochkarov Valentyn on 11/08/2020.
//  Copyright © 2020 Bochkarov Valentyn. All rights reserved.
//

import StoreKit

class AppleMusicAPI {
    
    let developerToken = "eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjlDSjM0QVQ0NkQifQ.eyJpc3MiOiJWR0FTTUROVVg0IiwiaWF0IjoxNTk3MDAwNjcyLCJleHAiOjE2MTI3NzIyNzJ9.QsMjxzPeAjZY67zIo6IkoYM1CRzQX0e35ozTvgYCbas7aTpebomWEtmfQ1etHo5ZfaGF7ifzNUydcddRdB98sQ"
    
    func getUserToken() -> String {
        var userToken = String()
        
        let lock = DispatchSemaphore(value: 0)
        
        SKCloudServiceController().requestUserToken(forDeveloperToken: developerToken) { (receivedToken, error) in
            guard error == nil else { return }
            if let token = receivedToken {
                userToken = token
                lock.signal()
            }
        }
        lock.wait()
        return userToken
    }
    func fetchStorefrontID() -> String {
        let lock = DispatchSemaphore(value: 0)
        var storefrontID: String!
        
        let musicURL = URL(string: "https://api.music.apple.com/v1/me/storefront")!
        var musicRequest = URLRequest(url: musicURL)
        musicRequest.httpMethod = "GET"
        musicRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        musicRequest.addValue(getUserToken(), forHTTPHeaderField: "Music-User-Token")
        
        URLSession.shared.dataTask(with: musicRequest) { (data, response, error) in
            guard error == nil else { return }
            
            if let json = try? JSON(data: data!) {
                let result = (json["data"]).array!
                let id = (result[0].dictionaryValue)["id"]!
                storefrontID = id.stringValue
                lock.signal()
            }
        }.resume()
        
        lock.wait()
        return storefrontID
    }
    
    func fetchAppleMusicRecomendations() -> [Song] {
        let lock = DispatchSemaphore(value: 0)
        var songs = [Song]()
        
        let musicURL = URL(string: "https://api.music.apple.com/v1/me/recommendations?type=playlists")!
        var musicRequest = URLRequest(url: musicURL)
        musicRequest.httpMethod = "GET"
        musicRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        musicRequest.addValue(getUserToken(), forHTTPHeaderField: "Music-User-Token")
        
        URLSession.shared.dataTask(with: musicRequest) { (data, response, error) in
            guard error == nil else { return }
            if let json = try? JSON(data: data!) {
                    print(json.rawString())
                }
            
        }.resume()
        
        lock.wait()
        return songs
    }
    
}
