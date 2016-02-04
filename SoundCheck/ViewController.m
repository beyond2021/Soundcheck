//
//  ViewController.m
//  SoundCheck
//
//  Created by KEEVIN MITCHELL on 2/3/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

#import "ViewController.h"
#import "LibraryAPI.h"
#import "Song+TableRepresentation.h"
#import "HorizontalScroller.h"
#import "SongView.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, HorizontalScrollerDelegate > {
    UITableView *dataTable;
    NSArray *allSongs;
    NSDictionary *currentSongData;
    int currentSongIndex;
    HorizontalScroller *scroller;
    
    AVAudioPlayer *player;
}

@property (strong, nonatomic) LibraryAPI *audioController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.audioController = [[LibraryAPI alloc] init];
    
    // 1
    self.view.backgroundColor = [UIColor colorWithRed:0.76f green:0.81f blue:0.87f alpha:1];
    currentSongIndex = 0;
    
    //2
    allSongs = [[LibraryAPI sharedInstance] getSongs];
    
    // 3
    // the uitableview that presents the album data
    dataTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.height-120) style:UITableViewStyleGrouped];
    dataTable.delegate = self;
    dataTable.dataSource = self;
    dataTable.backgroundView = nil;
    [self.view addSubview:dataTable];
    
    [self loadPreviousState];
    
    scroller = [[HorizontalScroller alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 120)];
    scroller.backgroundColor = [UIColor colorWithRed:0.24f green:0.35f blue:0.49f alpha:1];
    scroller.delegate = self;
    [self.view addSubview:scroller];
    
    [self reloadScroller];
    [self showDataForSongAtIndex:currentSongIndex];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveCurrentState) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showDataForSongAtIndex:(int)songIndex
{
    // defensive code: make sure the requested index is lower than the amount of albums
    if (songIndex < allSongs.count)
    {
        // fetch the album
        Song *song = allSongs[songIndex];
        // save the albums data to present it later in the tableview
        currentSongData = [song
                           tr_tableRepresentation];
    }
    else
    {
        currentSongData = nil;
    }
    
    // we have the data we need, let's refresh our tableview
    [dataTable reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [currentSongData[@"titles"] count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = currentSongData[@"titles"][indexPath.row];
    cell.detailTextLabel.text = currentSongData[@"values"][indexPath.row];
    
    NSString *name = [currentSongData[@"values"]objectAtIndex:0];
    NSString *type = [currentSongData[@"values"]objectAtIndex:1];
    
    [self.audioController configureSystemSoundName:name ofType:type];
    
    return cell;
}




#pragma mark - HorizontalScrollerDelegate methods
- (void)horizontalScroller:(HorizontalScroller *)scroller clickedViewAtIndex:(int)index
{
    currentSongIndex = index;
    [self showDataForSongAtIndex:index];
}

- (NSInteger)numberOfViewsForHorizontalScroller:(HorizontalScroller*)scroller
{
    return allSongs.count;
}

- (UIView*)horizontalScroller:(HorizontalScroller*)scroller viewAtIndex:(int)index
{
    Song *song = allSongs[index];
    return [[SongView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) songName:song.title];
}

- (void)reloadScroller
{
    allSongs = [[LibraryAPI sharedInstance] getSongs];
    if (currentSongIndex < 0) currentSongIndex = 0;
    else if (currentSongIndex >= allSongs.count) currentSongIndex = (int)allSongs.count -1;
    [scroller reload];
    
    [self showDataForSongAtIndex:currentSongIndex];
}

#pragma mark - Persistence
- (void)saveCurrentState
{
    // When the user leaves the app and then comes back again, he wants it to be in the exact same state
    // he left it. In order to do this we need to save the currently displayed album.
    // Since it's only one piece of information we can use NSUserDefaults.
    [[NSUserDefaults standardUserDefaults] setInteger:currentSongIndex forKey:@"currentSongIndex"];
}

- (void)loadPreviousState
{
    currentSongIndex = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"currentSongIndex"];
    
    [self showDataForSongAtIndex:currentSongIndex];
}

- (NSInteger)initialViewIndexForHorizontalScroller:(HorizontalScroller *)scroller
{
    return currentSongIndex;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
