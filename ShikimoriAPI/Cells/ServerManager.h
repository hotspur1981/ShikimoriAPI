//
//  ServerManager.h
//  ShikimoriAPI
//
//  Created by Vladimir Opanasenko on 29.04.2018.
//  Copyright © 2018 Vladimir Opanasenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Anime.h"
#import "AnimeDetail.h"


@interface ServerManager : NSObject

+ (ServerManager *)sharedManager;

//get anime

- (void)getAnimesForPage:(NSInteger)page OnSuccess:(void(^)(NSArray* animes))success onFailure:(void(^)(NSError* error))failure;

- (void)getDetailsAnimeForId:(NSString *)animeId OnSuccess:(void(^)(AnimeDetail* anime))success onFailure:(void(^)(NSError* error))failure;

@end
