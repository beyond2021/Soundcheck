//
//  LibraryAPI.h
//  SoundCheck
//
//  Created by KEEVIN MITCHELL on 2/3/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Song.h"

@interface LibraryAPI : NSObject

+ (LibraryAPI*)sharedInstance;
- (NSArray*)getSongs;
- (void)addSong:(Song*)song atIndex:(int)index;
- (void)deleteSongAtIndex:(int)index;

//
- (instancetype)init;
- (void)tryPlayMusic;
- (void)playSystemSound;

- (void)configureSystemSoundName:(NSString*)name ofType:(NSString*)type;


@end
