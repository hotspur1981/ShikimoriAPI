//
//  ServerManager.m
//  ShikimoriAPI
//
//  Created by Vladimir Opanasenko on 29.04.2018.
//  Copyright © 2018 Vladimir Opanasenko. All rights reserved.
//

#import "ServerManager.h"
#import "AFHTTPSessionManager.h"

@interface ServerManager()

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;


@end

@implementation ServerManager


+ (ServerManager *)sharedManager {
    static ServerManager* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ServerManager alloc] init];
    });
    
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://shikimori.org/api/"]];
    }
    return self;
}

- (void)getAnimesForPage:(NSInteger)page OnSuccess:(void(^)(NSArray* animes))success onFailure:(void(^)(NSError* error))failure {
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @(page), @"page",
                            @(20), @"limit",
                            nil];
    
    [self.sessionManager GET:@"animes" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        NSMutableArray *modelsArray = [NSMutableArray array];
        for (NSDictionary *animeDict in responseObject) {
            Anime *animeModel = [[Anime alloc] initWithDictionary:animeDict];
            [modelsArray addObject:animeModel];
        }
     
     if (success) {
         success(modelsArray);
     }
     
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         if (failure) {
             failure(error);
         }
     }];
}

- (void)getDetailsAnimeForId:(NSString *)animeId OnSuccess:(void(^)(AnimeDetail* anime))success onFailure:(void(^)(NSError* error))failure {
    
    [self.sessionManager GET:[NSString stringWithFormat:@"animes/%@", animeId] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        AnimeDetail *anime = [[AnimeDetail alloc] initWithDictionary:responseObject];
        if (success) {
            success(anime);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}




@end
