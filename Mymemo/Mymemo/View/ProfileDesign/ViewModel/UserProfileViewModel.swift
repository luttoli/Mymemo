//
//  UserViewModel.swift
//  projectMVVM
//
//  Created by 김지훈 on 2023/09/21.
//

import Foundation

class UserProfileViewModel {
    var userProfile: UserProfile
    
    init(userProfile: UserProfile) {
        self.userProfile = userProfile
    }
    
    var pageName: String {
        return userProfile.userName
    }
    
    var postCountText: String {
        return "\(userProfile.postCount)"
    }
    
    var followerCountText: String {
        return "\(userProfile.followerCount)"
    }
    
    var followingCountText: String {
        return "\(userProfile.followingCount)"
    }
    
    var userNickNameText: String {
        return userProfile.userNickName
    }
    
    var userIntroText: String {
        return userProfile.userIntro
    }
    
    var userUrlText: String {
        return userProfile.userUrl
    }
}
