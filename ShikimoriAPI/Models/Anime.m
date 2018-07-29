//
//  Anime.m
//  ShikimoriAPI
//
//  Created by Vladimir Opanasenko on 29.04.2018.
//  Copyright © 2018 Vladimir Opanasenko. All rights reserved.
//

#import "Anime.h"

@implementation Anime


- (instancetype)initWithDictionary:(NSDictionary*) dictionary
{
    self = [super init];
    if (self) {
        self.animeId = [dictionary objectForKey:@"id"];
        self.name = [dictionary objectForKey:@"name"];
        self.russianName = [dictionary objectForKey:@"russian"];
        self.imageUrl = [[dictionary objectForKey:@"image"] objectForKey:@"original"];
    
    
     /*   NSString* stringURL = [dictionary objectForKey:@"url"];
        if (stringURL) {
            self.imageURL = [NSURL URLWithString:stringURL];
        }
    */
    
    }
    return self;
}
@end
