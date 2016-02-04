//
//  PersistenceManager.h
//  SoundCheck
//
//  Created by KEEVIN MITCHELL on 2/3/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Song.h"


@interface PersistenceManager : NSObject

- (NSArray*)getSongs;
- (void)addSong:(Song*)song atIndex:(int)index;
- (void)deleteSongAtIndex:(int)index;


- (Song*)getSongWithTitle:(NSString*)title type:(NSString*)type;
@end
