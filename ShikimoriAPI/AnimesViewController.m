//
//  ViewController.m
//  ShikimoriAPI
//
//  Created by Vladimir Opanasenko on 29.04.2018.
//  Copyright © 2018 Vladimir Opanasenko. All rights reserved.
//

#import "AnimesViewController.h"
#import "AnimeTableViewCell.h"
#import "ServerManager.h"
#import "Anime.h"
#import "UIImageView+AFNetworking.h"
#import "AnimeDetailViewController.h"

@interface AnimesViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *animes;

@end

@implementation AnimesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getAnimeCatalog];
}

- (void)getAnimeCatalog {
    [[ServerManager sharedManager] getAnimesForPage:1 OnSuccess:^(NSArray *animes) {
        self.animes = animes;
        [self.tableView reloadData];
    } onFailure:^(NSError *error) {
        
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.animes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AnimeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"animeCell" forIndexPath:indexPath];
    
    Anime *anime = [self.animes objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = anime.name;
    cell.subtitleLabel.text = anime.russianName;

    NSString *stringURL = [NSString stringWithFormat:@"http://shikimori.org%@", anime.imageUrl];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:stringURL]];
    __weak AnimeTableViewCell *weakCell = cell;
    
    [cell.animeImageView setImageWithURLRequest:request placeholderImage:[UIImage imageNamed:@"noimage"] success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        weakCell.animeImageView.image = image;
        [weakCell layoutSubviews];
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        weakCell.animeImageView.image = nil;
    }];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AnimeDetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    Anime *selectedAnime = [self.animes objectAtIndex:indexPath.row];
    vc.animeId = selectedAnime.animeId;
    [self.navigationController pushViewController:vc animated:YES];
//
//    AnimeDetailViewController* vc = [[AnimeDetailViewController alloc] init];
//    Anime *selectedAnime = [self.animes objectAtIndex:indexPath.row];
//    vc.animeId = selectedAnime.animeId;
//    [self.navigationController pushViewController:vc animated:YES];
}


@end
