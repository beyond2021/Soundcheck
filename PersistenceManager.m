//
//  PersistenceManager.m
//  SoundCheck
//
//  Created by KEEVIN MITCHELL on 2/3/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

#import "PersistenceManager.h"
@interface PersistenceManager () {
    // an array of all songs
    NSMutableArray *songs;
}

@end
@implementation PersistenceManager


- (id)init
{
    self = [super init];
    if (self) {
        // a dummy list of songs
        songs = [NSMutableArray arrayWithArray:
                  @[[[Song alloc] initWithTitle:@"achievement" ofType:@"wav"],
                    [[Song alloc] initWithTitle:@"ahh-nicely" ofType:@"mp3"],
                    [[Song alloc] initWithTitle:@"boo" ofType:@"mp3"],
                    [[Song alloc] initWithTitle:@"bubble" ofType:@"wav"],
                    [[Song alloc] initWithTitle:@"bubble1" ofType:@"wav"],
                    
                    [[Song alloc] initWithTitle:@"cake-full" ofType:@"aif"],
                    [[Song alloc] initWithTitle:@"chat_incoming" ofType:@"mp3"],
                    [[Song alloc] initWithTitle:@"click0" ofType:@"mp3"],
                    [[Song alloc] initWithTitle:@"click1" ofType:@"mp3"],
                    [[Song alloc] initWithTitle:@"doom" ofType:@"mp3"],
                    
                    [[Song alloc] initWithTitle:@"drumroll" ofType:@"mp3"],
                    [[Song alloc] initWithTitle:@"elevator-badspeakers" ofType:@"mp3"],
                    [[Song alloc] initWithTitle:@"gavel" ofType:@"mp3"],
                    [[Song alloc] initWithTitle:@"ho" ofType:@"mp3"],
                    [[Song alloc] initWithTitle:@"laser-prep-reverse" ofType:@"mp3"],
                    
                    [[Song alloc] initWithTitle:@"laser-prep" ofType:@"mp3"],
                    [[Song alloc] initWithTitle:@"ninja-sword" ofType:@"mp3"],
                    [[Song alloc] initWithTitle:@"ninja-whack" ofType:@"mp3"],
                    [[Song alloc] initWithTitle:@"ninja-whoosh" ofType:@"mp3"],
                    [[Song alloc] initWithTitle:@"notice" ofType:@"mp3"],
                    
                    [[Song alloc] initWithTitle:@"sad-trombone" ofType:@"aiff"],
                    [[Song alloc] initWithTitle:@"select-classic" ofType:@"wav"],
                    [[Song alloc] initWithTitle:@"small-applause" ofType:@"mp3"],
                    [[Song alloc] initWithTitle:@"sonar" ofType:@"mp3"],
                    [[Song alloc] initWithTitle:@"start-echo" ofType:@"mp3"],
                    
                    [[Song alloc] initWithTitle:@"whoosh" ofType:@"mp3"]
                    
                    
                    ]];
    }
    return self;
}

- (NSArray*)getSongs
{
    return songs;
}

- (void)addSong:(Song*)song atIndex:(int)index
{
    if (songs.count >= index)
        [songs insertObject:songs atIndex:index];
    else
        [songs addObject:song];
}

- (void)deleteSongAtIndex:(int)index
{
    [songs removeObjectAtIndex:index];
}

- (Song*)getSongWithTitle:(NSString*)title type:(NSString*)type{
    
    title = [songs valueForKey:title];
    type = [songs valueForKey:type];
    Song *song = [[Song alloc] initWithTitle:title ofType:type];
    
    return  song;
    
}


@end
