//
//  AnimeDetail.m
//  ShikimoriAPI
//
//  Created by Vladimir Opanasenko on 30.04.2018.
//  Copyright © 2018 Vladimir Opanasenko. All rights reserved.
//

#import "AnimeDetail.h"

@implementation AnimeDetail

- (instancetype)initWithDictionary:(NSDictionary*) dictionary {
    self = [super init];
    if (self) {
        self.descriptionAnime = [dictionary objectForKey:@"description"];
    }
    
    return self;
}

@end
