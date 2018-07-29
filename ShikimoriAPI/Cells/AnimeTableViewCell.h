//
//  AnimeTableViewCell.h
//  ShikimoriAPI
//
//  Created by Vladimir Opanasenko on 29.04.2018.
//  Copyright © 2018 Vladimir Opanasenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimeTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *animeImageView;

@end
