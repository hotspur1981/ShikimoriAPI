//
//  AnimeDetailViewController.m
//  ShikimoriAPI
//
//  Created by Vladimir Opanasenko on 30.04.2018.
//  Copyright © 2018 Vladimir Opanasenko. All rights reserved.
//

#import "AnimeDetailViewController.h"
#import "ServerManager.h"
#import "AnimeDetail.h"
#import "UIImageView+AFNetworking.h"

@interface AnimeDetailViewController ()

@property (strong, nonatomic) AnimeDetail *anime;
//@property (weak, nonatomic) IBOutlet UITextField *textFieldAnime;
@property (weak, nonatomic) IBOutlet UILabel *textLabelAnime;

@end

@implementation AnimeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getAnimeDetails];
}

- (void)getAnimeDetails {
    [[ServerManager sharedManager] getDetailsAnimeForId:self.animeId OnSuccess:^(AnimeDetail *anime) {
        self.anime = anime;
        self.textLabelAnime.text = [NSString stringWithFormat:@"%@", self.anime.descriptionAnime];
    } onFailure:^(NSError *error) {
        //self.textLabelAnime.numberOfLines = 7;
    }];
}

@end
