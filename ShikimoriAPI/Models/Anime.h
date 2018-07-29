//
//  Anime.h
//  ShikimoriAPI
//
//  Created by Vladimir Opanasenko on 29.04.2018.
//  Copyright © 2018 Vladimir Opanasenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Anime : NSObject

@property (strong,nonatomic) NSString *animeId;
@property (strong,nonatomic) NSString* name;
@property (strong,nonatomic) NSString* russianName;
@property (strong,nonatomic) NSString* imageUrl;
//@property (strong,nonatomic) NSURL* imageURL;


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
