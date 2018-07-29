//
//  AnimeDetail.h
//  ShikimoriAPI
//
//  Created by Vladimir Opanasenko on 30.04.2018.
//  Copyright © 2018 Vladimir Opanasenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimeDetail : NSObject

@property (strong,nonatomic) NSString* descriptionAnime;

@property (strong,nonatomic) NSString *animeId;

- (instancetype)initWithDictionary:(NSDictionary*) dictionary;

@end
