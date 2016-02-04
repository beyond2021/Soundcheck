//
//  SongView.m
//  SoundCheck
//
//  Created by KEEVIN MITCHELL on 2/3/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

#import "SongView.h"

@implementation SongView

{
    UILabel *songNameLabel;
    UIActivityIndicatorView *indicator;
}

- (id)initWithFrame:(CGRect)frame songName:(NSString *)songName
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        self.backgroundColor = [UIColor blackColor];
        // the coverImage has a 5 pixels margin from its frame
        
        songNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, frame.size.width-10, frame.size.height-10)];
        
        songNameLabel.backgroundColor = [UIColor grayColor];
        
        songNameLabel.textColor = [UIColor whiteColor];
        songNameLabel.textAlignment = NSTextAlignmentCenter;
        [songNameLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:16]];
        
        
        [self addSubview:songNameLabel];
        songNameLabel.text = songName;
        
        indicator = [[UIActivityIndicatorView alloc] init];
        indicator.center = self.center;
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        // [indicator startAnimating];
        [self addSubview:indicator];
        
    }
    return self;
}

@end
